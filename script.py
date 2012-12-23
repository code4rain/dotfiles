#!/usr/bin/python
#credits: ppd @ Ubuntuforums.org: http://ubuntuforums.org/showthread.php?t=1954637

import shutil
import sys
import os

def getparent (content, line_nr):
    for i in range (line_nr - 1, -1, -1):
        if "{" in content[i].lstrip():
            return content[i].lstrip().split(" ")[0]

def change_line (content, key, value, parent):
    line_nr = 0
    for line in content:
        if line.lstrip().startswith(key + ":"):
            lparent = getparent(content, line_nr)
            if parent == lparent:
                content[line_nr] = key + ": " + value + "\n"
                return content
        line_nr = line_nr + 1        

def load_file (filename):
    file = open (filename, "r")
    content = file.readlines()
    file.close()
    return content
    
def write_file (filename, content):
    shutil.copyfile (filename, filename + ".bak")
    file = open (filename, "w")
    for line in content:
        file.write (line)
    file.close()
    return 
            
shell_qml = "/usr/share/unity-2d/shell/Shell.qml"
icontile_qml = "/usr/share/unity-2d/shell/common/IconTile.qml"
launcherlist_qml = "/usr/share/unity-2d/shell/launcher/LauncherList.qml"
launcheritem_qml = "/usr/share/unity-2d/shell/launcher/LauncherItem.qml"

if (len(sys.argv) > 1):
    icon_size = int(sys.argv[1])
else:
    sys.exit("Please enter your desired icon size as the first argument.")
    
if not os.geteuid() == 0:
    sys.exit("Script must be run as root.")
 
content = load_file (shell_qml)
content = change_line (content, "width", str (icon_size + 16), "LauncherLoader")
write_file (shell_qml, content)
content = load_file (icontile_qml)
content = change_line (content, "sourceSize.width", str (icon_size), "Image")
content = change_line (content, "sourceSize.height", str (icon_size), "Image")
write_file (icontile_qml, content)
content = load_file (launcherlist_qml)
content = change_line (content, "property int tileSize", str (icon_size + 6), "AutoScrollingListView")
content = change_line (content, "property int selectionOutlineSize", str (icon_size + 16), "AutoScrollingListView")
write_file (launcherlist_qml, content)
