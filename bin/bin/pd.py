#!/usr/bin/env python
# -*- coding: utf-8 -*-
import base64
import cookielib
import getpass
import marshal
import mimetools
import mimetypes    # cheese.park
import os
import re
import socket
import stat
import subprocess
import sys
import tempfile
import urllib
import urllib2
from datetime import datetime
from optparse import OptionParser
from pkg_resources import parse_version
from tempfile import mkstemp
from urlparse import urljoin, urlparse

try:
    from hashlib import md5
except ImportError:
    # Support Python versions before 2.5.
    from md5 import md5

try:
    # Specifically import json_loads, to work around some issues with
    # installations containing incompatible modules named "json".
    from json import loads as json_loads
except ImportError:
    from simplejson import loads as json_loads

# This specific import is necessary to handle the paths for
# cygwin enabled machines.
if (sys.platform.startswith('win')
    or sys.platform.startswith('cygwin')):
    import ntpath as cpath
else:
    import posixpath as cpath

# from rbtools import get_package_version, get_version_string

TAILORED_VERSION = '1.3.131204'

def get_tailored_version_string():
    return "%s (base: %s)" % (TAILORED_VERSION, get_version_string())


################################################################################
#
# __init__.py -- Basic version and package information
#
# Copyright (c) 2007-2009  Christian Hammond
# Copyright (c) 2007-2009  David Trowbridge
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be included
# in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
# IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
# CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
# TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
# SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#


# The version of RBTools
#
# This is in the format of:
#
#   (Major, Minor, Micro, alpha/beta/rc/final, Release Number, Released)
#
VERSION = (0, 3, 4, 'final', 0, True)


def get_version_string():
    version = '%s.%s' % (VERSION[0], VERSION[1])

    if VERSION[2]:
        version += ".%s" % VERSION[2]

    if VERSION[3] != 'final':
        if VERSION[3] == 'rc':
            version += ' RC%s' % VERSION[4]
        else:
            version += ' %s %s' % (VERSION[3], VERSION[4])

    if not is_release():
        version += " (dev)"

    return version


def get_package_version():
    version = '%s.%s' % (VERSION[0], VERSION[1])

    if VERSION[2]:
        version += ".%s" % VERSION[2]

    if VERSION[3] != 'final':
        version += '%s%s' % (VERSION[3], VERSION[4])

    return version


def is_release():
    return VERSION[5]


__version_info__ = VERSION[:-1]
__version__ = get_package_version()
################################################################################


# http://chanik.egloos.com/3685653
try:
    if sys.frozen:
        sys.setdefaultencoding("utf-8")
except:
    pass


###
# Default configuration -- user-settable variables follow.
###
SKIP_INTEGRATION = False    # cheese.park

# Debugging.  For development...
DEBUG            = False

MAX_REVIEWABLE_FILES = 50
MAX_DIFF_SIZE = 10048576    # cheese.park: 1MB

BINARY_FILENAME_EXTENSIONS = (
    '.264'      ,
    '.7z'       ,
    '.a'        ,
    '.aac'      ,
    '.apk'      ,
    '.bin'      ,
    '.bmp'      ,
    '.cat'      ,
    '.classpath',
    '.cmd'      ,
    '.cod'      ,
#   '.csv'      ,
    '.dat'      ,
    '.db'       ,
    '.dll'      ,
    '.dmc'      ,
    '.do'       ,
    '.doc'      ,
    '.docx'     ,
    '.elf'      ,
    '.exe'      ,
    '.exfat'    ,
    '.gif'      ,
    '.gul'      ,
    '.ihex'     ,
    '.img'      ,
    '.info'     ,
#   '.ini'      ,
    '.inp'      ,
    '.iso'      ,
    '.jar'      ,
    '.jpg'      ,
    '.ko'       ,
    '.lib'      ,
    '.mbn'      ,
    '.mht'      ,
    '.mp3'      ,
    '.mp4'      ,
    '.mpp'      ,
    '.o'        ,
    '.ogg'      ,
#   '.pcap'     ,
    '.pdf'      ,
#   '.pit'      ,
    '.png'      ,
    '.project'  ,
    '.ppt'      ,
    '.pptx'     ,
    '.rar'      ,
    '.rfs'      ,
    '.rgb'      ,
    '.sdf'      ,
    '.sln'      ,
    '.so'       ,
    '.sys'      ,
    '.tmp'      ,
#   '.txt'      ,
#   '.uml'      ,
    '.url'      ,
    '.vcproj'   ,
    '.vcxproj'  ,
#   '.vsd'      ,
    '.vsdx'     ,
    '.war'      ,
    '.wav'      ,
    '.xls'      ,
    '.xlsx'     ,
    '.xlsm'     ,
    '.yuv'      ,
    '.zip'      ,
    '.tar'      ,
)

# sl7.cho - convert line ending function added : 2011-12-21
NEWLINES_RE = re.compile(r'\r?\n')
NEWLINE_CONVERSION_RE = re.compile(r'\r(\r?\n)?')

def convert_line_endings(data):
    # Files without a trailing newline come out of Perforce (and possibly
    # other systems) with a trailing \r. Diff will see the \r and
    # add a "\ No newline at end of file" marker at the end of the file's
    # contents, which patch understands and will happily apply this to
    # a file with a trailing \r.
    #
    # The problem is that we normalize \r's to \n's, which breaks patch.
    # Our solution to this is to just remove that last \r and not turn
    # it into a \n.
    #
    # See http://code.google.com/p/reviewboard/issues/detail?id=386
    # and http://reviews.reviewboard.org/r/286/
    if data == "":
        return ""

    if data[-1] == "\r":
        data = data[:-1]

    return NEWLINE_CONVERSION_RE.sub('\n', data)

###
# End user-settable variables.
###


user_config = None
tempfiles = []
options = None
configs = []

ADD_REPOSITORY_DOCS_URL = \
    'http://www.reviewboard.org/docs/manual/dev/admin/management/repositories/'
GNU_DIFF_WIN32_URL = 'http://gnuwin32.sourceforge.net/packages/diffutils.htm'


class APIError(Exception):
    def __init__(self, http_status, error_code, rsp=None, *args, **kwargs):
        Exception.__init__(self, *args, **kwargs)
        self.http_status = http_status
        self.error_code = error_code
        self.rsp = rsp

    def __str__(self):
        code_str = "HTTP %d" % self.http_status

        if self.error_code:
            code_str += ', API Error %d' % self.error_code

        if self.rsp and 'err' in self.rsp:
            return '%s (%s)' % (self.rsp['err']['msg'], code_str)
        else:
            return code_str


class HTTPRequest(urllib2.Request):
    def __init__(self, url, body='', headers={}, method="PUT"):
        urllib2.Request.__init__(self, url, body, headers)
        self.method = method

    def get_method(self):
        return self.method


class RepositoryInfo:
    """
    A representation of a source code repository.
    """
    def __init__(self, path=None, base_path=None, supports_changesets=False,
                 supports_parent_diffs=False):
        self.path = path
        self.base_path = base_path
        self.supports_changesets = supports_changesets
        self.supports_parent_diffs = supports_parent_diffs
        debug("repository info: %s" % self)

    def __str__(self):
        return "Path: %s, Base path: %s, Supports changesets: %s" % \
            (self.path, self.base_path, self.supports_changesets)

    def set_base_path(self, base_path):
        if not base_path.startswith('/'):
            base_path = '/' + base_path
        debug("changing repository info base_path from %s to %s" % \
              (self.base_path, base_path))
        self.base_path = base_path

    def find_server_repository_info(self, server):
        """
        Try to find the repository from the list of repositories on the server.
        For Subversion, this could be a repository with a different URL. For
        all other clients, this is a noop.
        """
        return self


class PresetHTTPAuthHandler(urllib2.BaseHandler):
    """urllib2 handler that conditionally presets the use of HTTP Basic Auth.

    This is used when specifying --username= on the command line. It will
    force an HTTP_AUTHORIZATION header with the user info, asking the user
    for any missing info beforehand. It will then try this header for that
    first request.

    It will only do this once.
    """
    handler_order = 480 # After Basic auth

    def __init__(self, url, password_mgr):
        self.url = url
        self.password_mgr = password_mgr
        self.used = False

    def reset(self):
        self.password_mgr.rb_user = options.http_username
        self.password_mgr.rb_pass = options.http_password
        self.used = False

    def http_request(self, request):
#       if options.username and not self.used:
        if options.password and not self.used:
            # Note that we call password_mgr.find_user_password to get the
            # username and password we're working with. This allows us to
            # prompt if, say, --username was specified but --password was not.
            username, password = \
                self.password_mgr.find_user_password('Web API', self.url)
            raw = '%s:%s' % (username, password)
            request.add_header(
                urllib2.HTTPBasicAuthHandler.auth_header,
                'Basic %s' % base64.b64encode(raw).strip())
            self.used = True

        return request

    https_request = http_request

class SCMClient(object):
    """
    A base representation of an SCM tool for fetching repository information
    and generating diffs.
    """
    def get_repository_info(self):
        return None

    def check_options(self):
        pass

    def scan_for_server(self, repository_info):
        """
        Scans the current directory on up to find a .reviewboard file
        containing the server path.
        """
        server_url = None

        if user_config:
            server_url = self._get_server_from_config(user_config,
                                                      repository_info)

        if not server_url:
            for config in configs:
                server_url = self._get_server_from_config(config,
                                                          repository_info)

                if server_url:
                    break

        return server_url

    def diff(self, args):
        """
        Returns the generated diff and optional parent diff for this
        repository.

        The returned tuple is (diff_string, parent_diff_string)
        """
        return (None, None)

    def diff_between_revisions(self, revision_range, args, repository_info):
        """
        Returns the generated diff between revisions in the repository.
        """
        return (None, None)

    def _get_server_from_config(self, config, repository_info):
        if 'REVIEWBOARD_URL' in config:
            return config['REVIEWBOARD_URL']
        elif 'TREES' in config:
            trees = config['TREES']
            if not isinstance(trees, dict):
                die("Warning: 'TREES' in config file is not a dict!")

            # If repository_info is a list, check if any one entry is in trees.
            path = None

            if isinstance(repository_info.path, list):
                for path in repository_info.path:
                    if path in trees:
                        break
                else:
                    path = None
            elif repository_info.path in trees:
                path = repository_info.path

            if path and 'REVIEWBOARD_URL' in trees[path]:
                return trees[path]['REVIEWBOARD_URL']

        return None

class PerforceClient(SCMClient):
    """
    A wrapper around the p4 Perforce tool that fetches repository information
    and generates compatible diffs.
    """
    def get_repository_info(self):
        if not check_install('p4 help'):
            return None

        if options.p4_port:
            data = execute(["p4", "-p", options.p4_port, "info"], ignore_errors=True)
        else:
            data = execute(["p4", "info"], ignore_errors=True)

        m = re.search(r'^Server address: (.+)$', data, re.M)
        if not m:
            return None

        if options.p4_port:
            repository_path = options.p4_port
        else:
            repository_path = m.group(1).strip()
        ''' # cheese.park: 165.213.133.235:1818 -> PROCYON:1818
        try:
            hostname, port = repository_path.split(":")
            info = socket.gethostbyaddr(hostname)

            # If aliases exist for hostname, create a list of alias:port
            # strings for repository_path.
            if info[1]:
                servers = [info[0]] + info[1]
                repository_path = ["%s:%s" % (server, port)
                                   for server in servers]
            else:
                repository_path = "%s:%s" % (info[0], port)
        except (socket.gaierror, socket.herror):
            pass
        ''' # cheese.park
        m = re.search(r'^Server version: [^ ]*/([0-9]+)\.([0-9]+)/[0-9]+ .*$',
                      data, re.M)
        self.p4d_version = int(m.group(1)), int(m.group(2))

        return RepositoryInfo(path=repository_path, supports_changesets=True)

    def scan_for_server(self, repository_info):
        # Scan first for dot files, since it's faster and will cover the
        # user's $HOME/.reviewboardrc
        server_url = \
            super(PerforceClient, self).scan_for_server(repository_info)

        if server_url:
            return server_url

        return self.scan_for_server_counter(repository_info)

    def scan_for_server_counter(self, repository_info):
        """
        Checks the Perforce counters to see if the Review Board server's url
        is specified. Since Perforce only started supporting non-numeric
        counter values in server version 2008.1, we support both a normal
        counter 'reviewboard.url' with a string value and embedding the url in
        a counter name like 'reviewboard.url.http:||reviewboard.example.com'.
        Note that forward slashes aren't allowed in counter names, so
        pipe ('|') characters should be used. These should be safe because they
        should not be used unencoded in urls.
        """

        counters_text = execute(["p4", "counters"])

        # Try for a "reviewboard.url" counter first.
        m = re.search(r'^reviewboard.url = (\S+)', counters_text, re.M)

        if m:
            return m.group(1)

        # Next try for a counter of the form:
        # reviewboard_url.http:||reviewboard.example.com
        m2 = re.search(r'^reviewboard.url\.(\S+)', counters_text, re.M)

        if m2:
            return m2.group(1).replace('|', '/')

        return None

    def get_changenum(self, args):
        if len(args) == 0:
            return "default"
        elif len(args) == 1:
            if args[0] == "default":
                return "default"

            try:
                return str(int(args[0]))
            except ValueError:
                # (if it isn't a number, it can't be a cln)
                return None
        # there are multiple args (not a cln)
        else:
            return None

    def diff(self, args):
        """
        Goes through the hard work of generating a diff on Perforce in order
        to take into account adds/deletes and to provide the necessary
        revision information.
        """
        # set the P4 enviroment:
        if options.p4_client:
           os.environ['P4CLIENT'] = options.p4_client

        if options.p4_port:
           os.environ['P4PORT'] = options.p4_port

        if options.p4_passwd:
            os.environ['P4PASSWD'] = options.p4_passwd

        changenum = self.get_changenum(args)
        if changenum is None:
            return self._path_diff(args)
        else:
            return self._changenum_diff(changenum)


    def _path_diff(self, args):
        """
        Process a path-style diff.  See _changenum_diff for the alternate
        version that handles specific change numbers.

        Multiple paths may be specified in `args`.  The path styles supported
        are:

        //path/to/file
        Upload file as a "new" file.

        //path/to/dir/...
        Upload all files as "new" files.

        //path/to/file[@#]rev
        Upload file from that rev as a "new" file.

        //path/to/file[@#]rev,[@#]rev
        Upload a diff between revs.

        //path/to/dir/...[@#]rev,[@#]rev
        Upload a diff of all files between revs in that directory.
        """
        r_revision_range = re.compile(r'^(?P<path>//[^@#]+)' +
                                      r'(?P<revision1>[#@][^,]+)?' +
                                      r'(?P<revision2>,[#@][^,]+)?$')

        empty_filename = make_tempfile()
        tmp_diff_from_filename = make_tempfile()
        tmp_diff_to_filename = make_tempfile()

        diff_lines = []

        for path in args:
            m = r_revision_range.match(path)

            if not m:
                die('Path %r does not match a valid Perforce path.' % (path,))
            revision1 = m.group('revision1')
            revision2 = m.group('revision2')
            first_rev_path = m.group('path')

            if revision1:
                first_rev_path += revision1
            records = self._run_p4(['files', first_rev_path])

            # Make a map for convenience.
            files = {}

            # Records are:
            # 'rev': '1'
            # 'func': '...'
            # 'time': '1214418871'
            # 'action': 'edit'
            # 'type': 'ktext'
            # 'depotFile': '...'
            # 'change': '123456'
            for record in records:
                if record['action'] not in ('delete', 'move/delete'):
                    if revision2:
                        files[record['depotFile']] = [record, None]
                    else:
                        files[record['depotFile']] = [None, record]

            if revision2:
                # [1:] to skip the comma.
                second_rev_path = m.group('path') + revision2[1:]
                records = self._run_p4(['files', second_rev_path])
                for record in records:
                    if record['action'] not in ('delete', 'move/delete'):
                        try:
                            m = files[record['depotFile']]
                            m[1] = record
                        except KeyError:
                            files[record['depotFile']] = [None, record]

            old_file = new_file = empty_filename
            changetype_short = None

            for depot_path, (first_record, second_record) in files.items():
                old_file = new_file = empty_filename
                if first_record is None:
                    self._write_file(depot_path + '#' + second_record['rev'],
                                     tmp_diff_to_filename)
                    new_file = tmp_diff_to_filename
                    changetype_short = 'A'
                    base_revision = 0
                elif second_record is None:
                    self._write_file(depot_path + '#' + first_record['rev'],
                                     tmp_diff_from_filename)
                    old_file = tmp_diff_from_filename
                    changetype_short = 'D'
                    base_revision = int(first_record['rev'])
                elif first_record['rev'] == second_record['rev']:
                    # We when we know the revisions are the same, we don't need
                    # to do any diffing. This speeds up large revision-range
                    # diffs quite a bit.
                    continue
                else:
                    self._write_file(depot_path + '#' + first_record['rev'],
                                     tmp_diff_from_filename)
                    self._write_file(depot_path + '#' + second_record['rev'],
                                     tmp_diff_to_filename)
                    new_file = tmp_diff_to_filename
                    old_file = tmp_diff_from_filename
                    changetype_short = 'M'
                    base_revision = int(first_record['rev'])

                dl = self._do_diff(old_file, new_file, depot_path,
                                   base_revision, changetype_short,0,0, #hykim 1029
                                   ignore_unmodified=True)
                diff_lines += dl

        os.unlink(empty_filename)
        os.unlink(tmp_diff_from_filename)
        os.unlink(tmp_diff_to_filename)
        return (''.join(diff_lines), None)

    def _run_p4(self, command):
        """Execute a perforce command using the python marshal API.

        - command: A list of strings of the command to execute.

        The return type depends on the command being run.
        """
        command = ['p4', '-G'] + command
        p = subprocess.Popen(command, stdout=subprocess.PIPE)
        result = []
        has_error = False

        while 1:
            try:
                data = marshal.load(p.stdout)
            except EOFError:
                break
            else:
                result.append(data)
                if data.get('code', None) == 'error':
                    has_error = True

        rc = p.wait()

        if rc or has_error:
            for record in result:
                if 'data' in record:
                    print record['data']
            die('Failed to execute command: %s\n' % (command,))

        return result

    """
    Return a "sanitized" change number for submission to the Review Board
    server. For default changelists, this is always None. Otherwise, use the
    changelist number for submitted changelists, or if the p4d is 2002.2 or
    newer.

    This is because p4d < 2002.2 does not return enough information about
    pending changelists in 'p4 describe' for Review Board to make use of them
    (specifically, the list of files is missing). This would result in the
    diffs being rejected.
    """
    def sanitize_changenum(self, changenum):
        if changenum == "default":
            return None
        else:
            v = self.p4d_version

            if v[0] < 2002 or (v[0] == "2002" and v[1] < 2):
                describeCmd = ["p4"]

                if options.p4_passwd:
                    describeCmd.append("-P")
                    describeCmd.append(options.p4_passwd)

                describeCmd = describeCmd + ["describe", "-s", changenum]

                description = execute(describeCmd, split_lines=True)

                if '*pending*' in description[0]:
                    return None

        return changenum

    def _changenum_diff(self, changenum):
        """
        Process a diff for a particular change number.  This handles both
        pending and submitted changelists.

        See _path_diff for the alternate version that does diffs of depot
        paths.
        """
        # TODO: It might be a good idea to enhance PerforceDiffParser to
        # understand that newFile could include a revision tag for post-submit
        # reviewing.
        cl_is_pending = False

        debug("Generating diff for changenum %s" % changenum)

        description = []

        if changenum == "default":
            cl_is_pending = True
        else:
            describeCmd = ["p4"]

            if options.p4_passwd:
                describeCmd.append("-P")
                describeCmd.append(options.p4_passwd)

            describeCmd = describeCmd + ["describe", "-s", changenum]

            description = execute(describeCmd, split_lines=True)

            if re.search("no such changelist", description[0]):
                die("CLN %s does not exist." % changenum)

            # Some P4 wrappers are addding an extra line before the description
            if '*pending*' in description[0] or '*pending*' in description[1]:
                cl_is_pending = True

        v = self.p4d_version

        if cl_is_pending and (v[0] < 2002 or (v[0] == "2002" and v[1] < 2)
                              or changenum == "default"):
            # Pre-2002.2 doesn't give file list in pending changelists,
            # or we don't have a description for a default changeset,
            # so we have to get it a different way.
            info = execute(["p4", "opened", "-c", str(changenum)],
                           split_lines=True)

            if len(info) == 1 and info[0].startswith("File(s) not opened on this client."):
                die("Couldn't find any affected files for this change.")

            for line in info:
                data = line.split(" ")
                description.append("... %s %s" % (data[0], data[2]))

        else:
            # Get the file list
            for line_num, line in enumerate(description):
                if 'Affected files ...' in line:
                    break
            else:
                # Got to the end of all the description lines and didn't find
                # what we were looking for.
                die("Couldn't find any affected files for this change.")

            description = description[line_num+2:]

        # If the affected files in a P4 change are more than
        # MAX_REVIEWABLE_FILES, skip unnecessary operations.
        is_ignorable = False
        if (len(description) - 1) > MAX_REVIEWABLE_FILES:
            is_ignorable = True
#           print "Warning: Too many files to review: %d (> MAX_REVIEWABLE_FILES: %d)" % ((len(description) - 1), MAX_REVIEWABLE_FILES)
#           print "Warning: Your review request still exists, but the diff is not attached. (skipped)"

        diff_lines = []

        if is_ignorable:    # cheese.park
            empty_filename = tmp_diff_from_filename = tmp_diff_to_filename = None
        else:
            empty_filename = make_tempfile()
            tmp_diff_from_filename = make_tempfile()
            tmp_diff_to_filename = make_tempfile()

        for line in description:
            line = line.strip()
            if not line:
                continue

            m = re.search(r'\.\.\. ([^#]+)#(\d+) '
                          r'(add|edit|delete|integrate|branch|move/add'
                          r'|move/delete)',
                          line)
            if not m:
                die("Unsupported line from p4 opened: %s" % line)

            depot_path = m.group(1)
            base_revision = int(m.group(2))
            if not cl_is_pending:
                # If the changelist is pending our base revision is the one that's
                # currently in the depot. If we're not pending the base revision is
                # actually the revision prior to this one
                base_revision -= 1

            changetype = m.group(3)

            debug('Processing %s of %s' % (changetype, depot_path))

            old_file = new_file = empty_filename
            old_depot_path = new_depot_path = None
            changetype_short = None
            oldfile_size = 0 #hykim because error message when making the review request in P4 using c,cpp,java files 
            newfile_size = 0 #hykim

            is_ignorable_locally = is_resolved = False    # cheese.park

            if BINARY_FILENAME_EXTENSIONS.count(os.path.splitext(depot_path)[-1].lower()) > 0:    # cheese.park
                is_ignorable_locally = True

#            if options.skip_integration and changetype in ['branch', 'integrate']:    # cheese.park
#                is_ignorable_locally = True

            if changetype in ['edit', 'integrate']:
                # A big assumption
                new_revision = base_revision + 1
                resolveFromFile0 = resolveEndFromRev0 = None

                # We have an old file, get p4 to take this old version from the
                # depot and put it into a plain old temp file for us
                if not (is_ignorable or is_ignorable_locally):    # cheese.park
                    old_depot_path = "%s#%s" % (depot_path, base_revision)
                    self._write_file(old_depot_path, tmp_diff_from_filename)
                    old_file = tmp_diff_from_filename
                    if os.path.islink(old_file) and not os.path.exists(old_file):    # cheese.park: symbolic link (relative path)
                        is_ignorable_locally = True

                    # Also print out the new file into a tmpfile
                    if cl_is_pending:
                        new_file = self._depot_to_local(depot_path)
                        if changetype == 'integrate':
                            f = execute(["p4", "fstat", "-T", "resolved", depot_path], ignore_errors=True)
                            m = re.search(r'^\.\.\. resolved', f, re.M)
                            if m:
                                debug("'%s' is already resolved" % depot_path)
                                is_resolved = True
                            else:
                                debug("'%s' is not resolved yet" % depot_path)

                            f = execute(["p4", "fstat", "-Or", "-T", "resolveFromFile0,resolveEndFromRev0", depot_path], ignore_errors=True)
                            m = re.search(r'^\.\.\. resolveFromFile0 ([^#]+)\n\.\.\. resolveEndFromRev0 (\d+)$', f, re.M)
                            if m:
                                resolveFromFile0   = m.group(1).strip()
                                resolveEndFromRev0 = m.group(2).strip()
                                debug("Changing new_depot_path from '%s' (depot_path#client_workspace_revision) to '%s#%s' (resolveFromFile0#resolveEndFromRev0)" % (depot_path, resolveFromFile0, resolveEndFromRev0))
                                new_depot_path = "%s#%s" % (resolveFromFile0, resolveEndFromRev0)
                            else:
                                debug("changetype is 'integrate', but cannot find 'resolveFromFile0', 'resolveEndFromRev0'")

                            if not is_resolved and new_depot_path != None:
                                if os.path.exists(new_file):
                                    old_file = new_file
                                self._write_file(new_depot_path, tmp_diff_to_filename)
                                new_file = tmp_diff_to_filename
                            elif not os.path.exists(new_file):
                                is_ignorable_locally = True
                    else:
                        new_depot_path = "%s#%s" %(depot_path, new_revision)
                        self._write_file(new_depot_path, tmp_diff_to_filename)
                        new_file = tmp_diff_to_filename
                    if os.path.islink(new_file) and not os.path.exists(new_file):    # cheese.park: symbolic link (relative path)
                        is_ignorable_locally = True

                else: # ykkim : getsize for image
                    p4sizes = self._run_p4(['sizes', '-a', depot_path])
                    if cl_is_pending:
                        oldfile_size = int(p4sizes[0]['fileSize'])
                        p4where = self._run_p4(['where', depot_path])
                        newfile_size = os.path.getsize(p4where[-1]['path'])
                    else:
                        for p4size in p4sizes:
                            if int(p4size['rev']) == base_revision:
                                oldfile_size = int(p4size['fileSize'])
                            if int(p4size['rev']) == new_revision:
                                newfile_size = int(p4size['fileSize'])

                changetype_short = "M"
            elif changetype in ['add', 'branch', 'move/add']:
                # We have a new file, get p4 to put this new file into a pretty
                # temp file for us. No old file to worry about here.
                new_revision = base_revision + 1 #ykkim because new_revision error
                if not (is_ignorable or is_ignorable_locally):    # cheese.park
                    if cl_is_pending:
                        new_file = self._depot_to_local(depot_path)
                        if changetype == 'branch' and not os.path.exists(new_file):    # cheese.park
                            f = execute(["p4", "fstat", "-Or", "-T", "resolveFromFile0", depot_path])
                            m = re.search(r'\.\.\. resolveFromFile0 ([^#]+)', f)
                            if m:
                                resolveFromFile0 = m.group(1).strip()
                                debug("Changing new_file from '%s' (depot_path) to '%s' (resolveFromFile0)" % (depot_path, resolveFromFile0))
                                self._write_file(resolveFromFile0, tmp_diff_to_filename)    # fromFile
                                new_file = tmp_diff_to_filename
                            else:
                                debug("changetype is 'branch', but cannot find 'resolveFromFile0'")
                                is_ignorable_locally = True
                    else:
                        new_depot_path = "%s#%s" % (depot_path, new_revision) #ykkim : add bug fix
                        self._write_file(new_depot_path, tmp_diff_to_filename) #ykkim : add bug fix
                        new_file = tmp_diff_to_filename
                    if os.path.islink(new_file) and not os.path.exists(new_file):    # cheese.park: symbolic link (relative path)
                        is_ignorable_locally = True
                    elif os.stat(new_file)[stat.ST_SIZE] == 0L:    # cheese.park: empty file
                        is_ignorable_locally = True
                else:  # ykkim : getsize for image
                    oldfile_size = 0
                    if cl_is_pending:
                        p4where = self._run_p4(['where', depot_path])
                        newfile_size = os.path.getsize(p4where[-1]['path'])
                    else:
                        p4sizes = self._run_p4(['sizes', '-a', depot_path])
                        for p4size in p4sizes:
                            if int(p4size['rev']) == new_revision:
                                newfile_size = int(p4size['fileSize'])

                changetype_short = "A"
            elif changetype in ['delete', 'move/delete']:
                # We've deleted a file, get p4 to put the deleted file into  a temp
                # file for us. The new file remains the empty file.
                if not (is_ignorable or is_ignorable_locally):    # cheese.park
                    old_depot_path = "%s#%s" % (depot_path, base_revision)
                    self._write_file(old_depot_path, tmp_diff_from_filename)
                    old_file = tmp_diff_from_filename
                    if os.path.islink(old_file) and not os.path.exists(old_file):    # cheese.park: symbolic link (relative path)
                        is_ignorable_locally = True
                else: # ykkim : getsize for image
                    p4sizes = self._run_p4(['sizes', '-a', depot_path])
                    if cl_is_pending:
                        oldfile_size = int(p4sizes[0]['fileSize'])
                    else:
                        for p4size in p4sizes:
                            if int(p4size['rev']) == base_revision:
                                oldfile_size = int(p4size['fileSize'])
                        newfile_size = 0

                changetype_short = "D"
            else:
                die("Unknown change type '%s' for %s" % (changetype, depot_path))

            if is_ignorable or is_ignorable_locally:
                dl = self._do_diff(old_file, new_file, depot_path, base_revision, oldfile_size, newfile_size, changetype_short, ignore_designated=True) #hykim 1029
            else:
                dl = self._do_diff(old_file, new_file, depot_path, base_revision, oldfile_size, newfile_size, changetype_short) #hykim 1029
            debug("dl = %s" % dl)
            diff_lines += dl

        if empty_filename != None and os.path.exists(empty_filename):    # cheese.park
            os.unlink(empty_filename)
        if tmp_diff_from_filename != None and os.path.exists(tmp_diff_from_filename):    # cheese.park
            os.unlink(tmp_diff_from_filename)
        if tmp_diff_to_filename != None and os.path.exists(tmp_diff_to_filename):    # cheese.park
            os.unlink(tmp_diff_to_filename)
        return (''.join(diff_lines), None)

    def _do_diff(self, old_file, new_file, depot_path, base_revision,
#                changetype_short, ignore_unmodified=False):
                 oldfile_size, newfile_size, changetype_short, ignore_unmodified=False, ignore_designated=False): #hykim 1029
        """
        Do the work of producing a diff for Perforce.

        old_file - The absolute path to the "old" file.
        new_file - The absolute path to the "new" file.
        depot_path - The depot path in Perforce for this file.
        base_revision - The base perforce revision number of the old file as
            an integer.
        changetype_short - The change type as a single character string.
        ignore_unmodified - If True, will return an empty list if the file
            is not changed.

        Returns a list of strings of diff lines.
        """
        if ignore_designated:
            if BINARY_FILENAME_EXTENSIONS.count(os.path.splitext(depot_path)[-1].lower()) > 0:
                dl = ['Binary files %s and %s differ\n' % (old_file, new_file)]
            else:
                dl = ['Skipped files %s and %s differ\n' % (old_file, new_file)]
        else:
            if hasattr(os, 'uname') and os.uname()[0] == 'SunOS':
                diff_cmd = ["gdiff", "-urNp", old_file, new_file]
            else:
                diff_cmd = ["diff", "-urNp", old_file, new_file]
            # Diff returns "1" if differences were found.
            dl = execute(diff_cmd, extra_ignore_errors=(1,2),
                         translate_newlines=False)

            if len(dl) == 0 or len(dl) > MAX_DIFF_SIZE:    # cheese.park
                dl = ['Skipped files %s and %s differ\n' % (old_file, new_file)]
            else:
                # If the input file has ^M characters at end of line, lets ignore them.
                dl = dl.replace('\r\r\n', '\r\n')
                dl = dl.splitlines(True)

            # Special handling for the output of the diff tool on binary files:
            #     diff outputs "Files a and b differ"
            # and the code below expects the output to start with
            #     "Binary files "
            if len(dl) == 1 and \
               dl[0].startswith('Files %s and %s differ' %
                                (old_file, new_file)):
                dl = ['Binary files %s and %s differ\n' % (old_file, new_file)]

        cwd = os.getcwd()
        if depot_path.startswith(cwd):
            local_path = depot_path[len(cwd) + 1:]
        else:
            local_path = depot_path

#       if dl == [] or dl[0].startswith("Binary files "):
        if dl == [] or dl[0].startswith("Binary files ") or dl[0].startswith("Skipped files "):
            if dl == []:
                if ignore_unmodified:
                    return []
                else:
                    print "Warning: %s in your changeset is unmodified" % \
                        local_path

            dl.insert(0, "==== %s#%s ==%s== %s ====\n" % \
                (depot_path, base_revision, changetype_short, local_path))
            dl.insert(2, "Size %d %d\n" %(oldfile_size, newfile_size)) #hykim 1029 
            dl.append('\n')
        elif len(dl) > 1:
            m = re.search(r'(\d\d\d\d-\d\d-\d\d \d\d:\d\d:\d\d)', dl[1])
            if m:
                timestamp = m.group(1)
            else:
                # Thu Sep  3 11:24:48 2007
                m = re.search(r'(\w+)\s+(\w+)\s+(\d+)\s+(\d\d:\d\d:\d\d)\s+(\d\d\d\d)', dl[1])
                if not m:
                    die("Unable to parse diff header: %s" % dl[1])

                month_map = {
                    "Jan": "01",
                    "Feb": "02",
                    "Mar": "03",
                    "Apr": "04",
                    "May": "05",
                    "Jun": "06",
                    "Jul": "07",
                    "Aug": "08",
                    "Sep": "09",
                    "Oct": "10",
                    "Nov": "11",
                    "Dec": "12",
                }
                month = month_map[m.group(2)]
                day = m.group(3)
                timestamp = m.group(4)
                year = m.group(5)

                timestamp = "%s-%s-%s %s" % (year, month, day, timestamp)

            dl[0] = "--- %s\t%s#%s\n" % (local_path, depot_path, base_revision)
            dl[1] = "+++ %s\t%s\n" % (local_path, timestamp)

            # Not everybody has files that end in a newline (ugh). This ensures
            # that the resulting diff file isn't broken.
            if dl[-1][-1] != '\n':
                dl.append('\n')
        else:
            die("ERROR, no valid diffs: %s" % dl[0])

        return dl

    def _write_file(self, depot_path, tmpfile):
        """
        Grabs a file from Perforce and writes it to a temp file. p4 print sets
        the file readonly and that causes a later call to unlink fail. So we
        make the file read/write.
        """
        debug('Writing "%s" to "%s"' % (depot_path, tmpfile))
        execute(["p4", "print", "-o", tmpfile, "-q", depot_path])
        if os.path.exists(tmpfile):    # cheese.park: symbolic link (relative path)
            os.chmod(tmpfile, stat.S_IREAD | stat.S_IWRITE)

        is_binary = True
        if mimetypes.guess_type(tmpfile)[0] == 'text/plain':    # cheese.park
            is_binary = False

        # sl7.cho - when p4 print, convert line ending explictly
        if is_binary:
            fileObject = open(tmpfile, 'rb')
        else:
            fileObject = open(tmpfile, 'r')
        tmpBuffer = fileObject.read()
        fileObject.close()

        if is_binary:
            fileObject = open(tmpfile, 'wb+')
        else:
            fileObject = open(tmpfile, 'w+')
        fileObject.write(convert_line_endings(tmpBuffer))
        fileObject.close()

    def _depot_to_local(self, depot_path):
        """
        Given a path in the depot return the path on the local filesystem to
        the same file.  If there are multiple results, take only the last
        result from the where command.
        """
        where_output = self._run_p4(['where', depot_path])
        debug('_depot_to_local(): "%s" to "%s"' % (depot_path, where_output[-1]['path']))

        is_binary = True
        if 'path' in where_output[-1] and mimetypes.guess_type(where_output[-1]['path'])[0] == 'text/plain':    # cheese.park
            is_binary = False

        try:
#           return where_output[-1]['path']
            # sl7.cho - when p4 get the local file path, convert line ending explictly
            if is_binary:
                fileObject = open(where_output[-1]['path'], 'rb')
            else:
                fileObject = open(where_output[-1]['path'], 'r')
            tmpBuffer = fileObject.read()
            fileObject.close()
            local_file = make_tempfile(convert_line_endings(tmpBuffer))
            return local_file
        except IOError:
            debug('File %s does not exist, return only file path information' % where_output[-1]['path'])
            return where_output[-1]['path']
        except:
            # XXX: This breaks on filenames with spaces.
#           return where_output[-1]['data'].split(' ')[2].strip()
            # sl7.cho - when p4 get the local file path, convert line ending explictly
            try:
                if is_binary:
                    fileObject = open(where_output[-1]['data'].split(' ')[2].strip(), 'rb')
                else:
                    fileObject = open(where_output[-1]['data'].split(' ')[2].strip(), 'r')
                tmpBuffer = fileObject.read()
                fileObject.close()
                local_file = make_tempfile(convert_line_endings(tmpBuffer))
                return local_file
            except:
                debug('File %s does not exist, return only file path information' % where_output[-1]['data'].split(' ')[2].strip())
                return where_output[-1]['data'].split(' ')[2].strip()

SCMCLIENTS = (
    PerforceClient(),
)

def debug(s):
    """
    Prints debugging information if post-review was run with --debug
    """
    if DEBUG or options and options.debug:
        print ">>> %s" % s


def make_tempfile(content=None):
    """
    Creates a temporary file and returns the path. The path is stored
    in an array for later cleanup.
    """
    fd, tmpfile = mkstemp()
    if content:
        os.write(fd, content)
    os.close(fd)
    tempfiles.append(tmpfile)
    return tmpfile


def check_install(command):
    """
    Try executing an external command and return a boolean indicating whether
    that command is installed or not.  The 'command' argument should be
    something that executes quickly, without hitting the network (for
    instance, 'svn help' or 'git --version').
    """
    try:
        subprocess.Popen(command.split(' '),
                         stdin=subprocess.PIPE,
                         stdout=subprocess.PIPE,
                         stderr=subprocess.PIPE)
        return True
    except OSError:
        return False


def check_gnu_diff():
    """Checks if GNU diff is installed, and informs the user if it's not."""
    has_gnu_diff = False

    try:
        result = execute(['diff', '--version'], ignore_errors=True)
        has_gnu_diff = 'GNU diffutils' in result
    except OSError:
        pass

    if not has_gnu_diff:
        sys.stderr.write('\n')
        sys.stderr.write('GNU diff is required for Subversion '
                         'repositories. Make sure it is installed\n')
        sys.stderr.write('and in the path.\n')
        sys.stderr.write('\n')

        if os.name == 'nt':
            sys.stderr.write('On Windows, you can install this from:\n')
            sys.stderr.write(GNU_DIFF_WIN32_URL)
            sys.stderr.write('\n')

        die()


def execute(command, env=None, split_lines=False, ignore_errors=False,
            extra_ignore_errors=(), translate_newlines=True, with_errors=True):
    """
    Utility function to execute a command and return the output.
    """
    if isinstance(command, list):
        debug(subprocess.list2cmdline(command))
    else:
        debug(command)

    if env:
        env.update(os.environ)
    else:
        env = os.environ.copy()

    env['LC_ALL'] = 'en_US.UTF-8'
    env['LANGUAGE'] = 'en_US.UTF-8'

    if with_errors:
        errors_output = subprocess.STDOUT
    else:
        errors_output = subprocess.PIPE

    if sys.platform.startswith('win'):
        p = subprocess.Popen(command,
                             stdin=subprocess.PIPE,
                             stdout=subprocess.PIPE,
                             stderr=errors_output,
                             shell=False,
                             universal_newlines=translate_newlines,
                             env=env)
    else:
        p = subprocess.Popen(command,
                             stdin=subprocess.PIPE,
                             stdout=subprocess.PIPE,
                             stderr=errors_output,
                             shell=False,
                             close_fds=True,
                             universal_newlines=translate_newlines,
                             env=env)
    if split_lines:
        data = p.stdout.readlines()
    else:
        data = p.stdout.read()
    rc = p.wait()
    if rc and not ignore_errors and rc not in extra_ignore_errors:
        die('Failed to execute command: %s\n%s' % (command, data))

    return data


def die(msg=None):
    """
    Cleanly exits the program with an error message. Erases all remaining
    temporary files.
    """
    for tmpfile in tempfiles:
        try:
            os.unlink(tmpfile)
        except:
            pass

    if msg:
        print msg

    sys.exit(1)


def walk_parents(path):
    """
    Walks up the tree to the root directory.
    """
    while os.path.splitdrive(path)[1] != os.sep:
        yield path
        path = os.path.dirname(path)


def load_config_files(homepath):
    """Loads data from .reviewboardrc files"""
    def _load_config(path):
        config = {
            'TREES': {},
        }

        filename = os.path.join(path, '.reviewboardrc')

        if os.path.exists(filename):
            try:
                execfile(filename, config)
            except SyntaxError, e:
                die('Syntax error in config file: %s\n'
                    'Line %i offset %i\n' % (filename, e.lineno, e.offset))

            return config

        return None

    for path in walk_parents(os.getcwd()):
        config = _load_config(path)

        if config:
            configs.append(config)

    globals()['user_config'] = _load_config(homepath)


def tempt_fate(server, tool, changenum, diff_content=None,
               parent_diff_content=None, submit_as=None, retries=3):
    """
    Attempts to create a review request on a Review Board server and upload
    a diff. On success, the review request path is displayed.
    """
    try:
        if options.rid:
            review_request = server.get_review_request(options.rid)
        else:
            review_request = server.new_review_request(changenum, submit_as)

        if options.target_groups:
            server.set_review_request_field(review_request, 'target_groups',
                                            options.target_groups)

        if options.target_people:
            server.set_review_request_field(review_request, 'target_people',
                                            options.target_people)

        if options.target_defaultreviewers:   # yk0909.kim 2013.11.28
            server.set_review_request_field(review_request, 'target_arbiters',
                                            options.target_defaultreviewers)

        if options.summary:
            server.set_review_request_field(review_request, 'summary',
                                            options.summary)

        if options.branch:
            server.set_review_request_field(review_request, 'branch',
                                            options.branch)

        if options.bugs_closed:     # append to existing list
            options.bugs_closed = options.bugs_closed.strip(", ")
            bug_set = set(re.split("[, ]+", options.bugs_closed)) | \
                      set(review_request['bugs_closed'])
            options.bugs_closed = ",".join(bug_set)
            server.set_review_request_field(review_request, 'bugs_closed',
                                            options.bugs_closed)

        if options.description:
            server.set_review_request_field(review_request, 'description',
                                            options.description)

        if options.testing_done:
            server.set_review_request_field(review_request, 'testing_done',
                                            options.testing_done)

        if options.change_description:
            server.set_review_request_field(review_request, 'changedescription',
                                            options.change_description)
    except APIError, e:
        if e.error_code == 103: # Not logged in
            retries = retries - 1

            # We had an odd issue where the server ended up a couple of
            # years in the future. Login succeeds but the cookie date was
            # "odd" so use of the cookie appeared to fail and eventually
            # ended up at max recursion depth :-(. Check for a maximum
            # number of retries.
            if retries >= 0:
                server.login(force=True)
                tempt_fate(server, tool, changenum, diff_content,
                           parent_diff_content, submit_as, retries=retries)
                return
        elif e.error_code == 105: # One or more fields error
            msg = "%s.\n" % e.rsp['err']['msg']
            if e.rsp['fields'].get('target_arbiters', False):
                msg += "'target_defaultreviewers': %s" % e.rsp['fields']['target_arbiters']
            else:
                msg += "%s\n" % e.rsp['fields']
            sys.stderr.write(msg)

        if options.rid:
            die("Error getting review request %s: %s" % (options.rid, e))
        else:
            die("Error creating review request: %s" % e)


    if not server.info.supports_changesets or not options.change_only:
        try:
            server.upload_diff(review_request, diff_content,
                               parent_diff_content)
        except APIError, e:
            sys.stderr.write('\n')
            sys.stderr.write('Error uploading diff\n')
            sys.stderr.write('\n')

            if e.error_code == 105:
                sys.stderr.write('The generated diff file was empty. This '
                                 'usually means no files were\n')
                sys.stderr.write('modified in this change.\n')
                sys.stderr.write('\n')
                sys.stderr.write('Try running with --output-diff and --debug '
                                 'for more information.\n')
                sys.stderr.write('\n')
            elif e.error_code == 220: # yk0909.kim
                msg = "%s is not included by default reviewers group. %s.\n" % (e.rsp['error_user'], e.rsp['err']['msg'])
                msg += "Default Reviewer Members: %s\n" % e.rsp['default_reviewers']
                sys.stderr.write(msg)

            die("Your review request still exists, but the diff is not " +
                "attached.")

    if options.reopen:
        server.reopen(review_request)

    if options.publish:
        server.publish(review_request)

    request_url = 'r/' + str(review_request['id']) + '/'
    review_url = urljoin(server.url, request_url)

    if not review_url.startswith('http'):
        review_url = 'http://%s' % review_url

    print "Review request #%s posted." % (review_request['id'],)
    print
    print review_url

    return review_url


def parse_options(args):
    parser = OptionParser(usage="%prog [-pond] [-r review_id] [changenum]",
#                         version="RBTools " + get_version_string())
                          version="RBTools " + get_tailored_version_string())

    parser.add_option("-n", "--output-diff",
                      dest="output_diff_only", action="store_true",
                      default=False,
                      help="outputs a diff to the console and exits. "
                           "Does not post")
    parser.add_option("--summary",
                      dest="summary", default=None,
                      help="summary of the review ")
    parser.add_option("--change-description", default=None,
                      help="description of what changed in this revision of "
                      "the review request when updating an existing request")
    parser.add_option("--change-only",
                      dest="change_only", action="store_true",
                      default=False,
                      help="updates info from changelist, but does "
                           "not upload a new diff (only available if your "
                           "repository supports changesets)")
    parser.add_option("--p4-client",
                      dest="p4_client", default=None,
                      help="the Perforce client name that the review is in")
    parser.add_option("--p4-port",
                      dest="p4_port", default=None,
                      help="the Perforce servers IP address that the review is on")
    parser.add_option("--p4-passwd",
                      dest="p4_passwd", default=None,
                      help="the Perforce password or ticket of the user in the P4USER environment variable")
    parser.add_option("--repository-url",
                      dest="repository_url", default=None,
                      help="the url for a repository for creating a diff "
                           "outside of a working copy (currently only "
                           "supported by Subversion with --revision-range or "
                           "--diff-filename and ClearCase with relative "
                           "paths outside the view). For git, this specifies"
                           "the origin url of the current repository, "
                           "overriding the origin url supplied by the git client.")
    parser.add_option("-d", "--debug",
                      action="store_true", dest="debug", default=DEBUG,
                      help="display debug output")
    parser.add_option("--diff-filename",
                      dest="diff_filename", default=None,
                      help='upload an existing diff file, instead of '
                           'generating a new diff')

    (globals()["options"], args) = parser.parse_args(args)

    if options.change_description and not options.rid:
        sys.stderr.write("--change-description may only be used "
                         "when updating an existing review-request\n")
        sys.exit(1)

    return args


def determine_client():
    repository_info = None
    tool = None

    # Try to find the SCM Client we're going to be working with.
    for tool in SCMCLIENTS:
        repository_info = tool.get_repository_info()

        if repository_info:
            break

    if not repository_info:
        if options.repository_url:
            print "No supported repository could be access at the supplied url."
        else:
#           print "supported source code repository."
            print "Unable to launch Perforce command-line client (\"p4.exe\" on Windows)."
            print "Please check whether Perforce installation directory (ex. \"C:\Program Files\Perforce\" on Windows) exists in PATH environment variable and it can be launched from anywhere."
        sys.exit(1)

    # Verify that options specific to an SCM Client have not been mis-used.
    if options.change_only and not repository_info.supports_changesets:
        sys.stderr.write("The --change-only option is not valid for the "
                         "current SCM client.\n")
        sys.exit(1)

    if ((options.p4_client or options.p4_port) and \
        not isinstance(tool, PerforceClient)):
        sys.stderr.write("The --p4-client and --p4-port options are not valid "
                         "for the current SCM client.\n")
        sys.exit(1)

    return (repository_info, tool)


def main():
    origcwd = os.path.abspath(os.getcwd())

    if 'RBHOME' in os.environ:
        homepath = os.environ['RBHOME']
#   if 'APPDATA' in os.environ:
    elif 'APPDATA' in os.environ:
        homepath = os.environ['APPDATA']
    elif 'HOME' in os.environ:
        homepath = os.environ["HOME"]
    else:
        homepath = ''

    args = parse_options(sys.argv[1:])
    if len(args) > 1:
        print "\"None\" option value is included in the arguments of Create/Update Review Request."
        print "If no workspace selected, then (1) select a workspace or (2) remove \"--p4-client\" option from the arguments and retry Create/Update Review Request."
        sys.exit(1)

    repository_info, tool = determine_client()

    # Verify that options specific to an SCM Client have not been mis-used.
    tool.check_options()

    if repository_info.supports_changesets:
        changenum = tool.get_changenum(args)
    else:
        changenum = None

    if not changenum.isdigit():
        print "Change number should be integer."
        print "Save as numbered if you're trying with \"default\" pending changelist."
        sys.exit(1)

    diff, parent_diff = tool.diff(args)

    if len(diff) == 0:
        die("There don't seem to be any diffs!")
    # The comma here isn't a typo, but rather suppresses the extra newline
    print changenum
    #print diff,
    sys.exit(0)

if __name__ == "__main__":
    if len(sys.argv) < 2:
        filename = os.path.basename(sys.argv[0])
        print "%s: missing operand after '%s'" % (filename, filename)
        print "%s: Try '%s --help' for more information." % (filename, filename)
        sys.exit(0)
    main()
