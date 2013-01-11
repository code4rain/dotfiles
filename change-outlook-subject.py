import os, sys, re
import win32com.client
from win32com.client import Dispatch, constants

def parse_folder(folder):
    print "Processing [%s]"%folder.Name.encode('euc-kr')

    items = folder.Items
    while True:
        item = items.GetNext()
        if item == None: break
        #print '\n'.join(dir(item))
        
#        if re.compile(r'Fwd\[*\d*\]*:\s*|FW\[*\d*\]*:\s*|Re\[*\d*\]*:\s*|RE\[*\d*\]*:\s*|Fwd\d*:\s*|Re\d*\s*:|Fwd\(*\d*\)*:\s*|Re\(*\d*\)*:\s*|Re:\(*\d*\)*\s*|RE\**\d*:\s*|Fwd:\(*\d*\)*\s*|Re:\[*\d*\]*\s*|Fwd:\[*\d*\]*\s*').search(item.Subject):
        if re.compile(r'(Re|RE|Fwd|FW)[\d|\s|:|\[|\(]+:*\s*(\[\d*\]|\(\d*\))*\s*:*[\d|\s|:|\]|\)]+').search(item.Subject):
            # print item.Subject
            print item.Subject.encode('euc-kr')
            # print item.Body
            # works VVVV
            # item.Body = 'whoya!'
#            item.Subject = re.sub(r'Fwd\[*\d*\]*\s*:\s*|FW\[*\d*\]*\s*:\s*|Re\[*\d*\]*\s*:\s*|RE\[*\d*\]*:\s*|Fwd\d*:\s*|Re\d*\s*:|Fwd\(*\d*\)*:\s*|Re\(*\d*\)*:\s*|Re:\(*\d*\)*\s*|RE\**\d*:\s*|Fwd:\(*\d*\)*\s*|Re:\[*\d*\]*\s*|Fwd:\[*\d*\]*\s*','', item.Subject)
            item.Subject = re.sub(r'(Re|RE|Fwd|FW)[\d|\s|:|\[|\(]+:*\s*(\[\d*\]|\(\d*\))*\s*:*[\d|\s|:|\]|\)]+','', item.Subject)
            print item.Subject.encode('euc-kr')
            item.Save()
            # break
    for i in range(1, folder.Folders.Count + 1):
        parse_folder(folder.Folders[i])

win32com.client.gencache.EnsureDispatch("Outlook.Application")
outlook = win32com.client.Dispatch("Outlook.Application")
mapi = outlook.GetNamespace('MAPI')
inbox =  mapi.GetDefaultFolder(win32com.client.constants.olFolderInbox)
items = inbox.Items
parse_folder(inbox)
          