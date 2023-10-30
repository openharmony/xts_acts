#!/usr/bin/python3
import os
import sys
import json
import time
import datetime
import subprocess
import shutil
import random

resultLog = []
summaryReport = []
countReport = []
memdict = {}
deltaReport = {}

def auCommit(modifile, cmsg):
    if os.path.isdir(modifile):
        print(modifile, "is dir!")
        for dirpath, dirnames, filenames in os.walk(modifile):
            # print("dirpath:", dirpath)
            # print("dirnames:", dirnames)
            # print("files:", filenames)
            totlen = 0
            addfiles = []
            for file in filenames:
                # print(dirpath, file)
                fd = open(dirpath+"/"+file)
                flen = len(fd.readlines())
                if totlen + flen < 2000:
                # if (flen > 2000):
                    # print(dirpath+"/"+file, flen)
                    totlen += flen
                    addfiles.append(dirpath+"/"+file)
                else:
                    print("add:", addfiles)
                    for addfile in addfiles:
                        cmdlist = ["git", "add", addfile]
                        top_info = subprocess.Popen(cmdlist, stdout=subprocess.PIPE)
                        out, err = top_info.communicate()
                        outstr = str(out)
                        print("outstr:", outstr)
                    print("commit -----------", totlen)
                    rint = random.randint(1, 100)
                    print("rint:", rint)
                    time.sleep(rint)
                    commitMsg = "\"add vulkan cases " + cmsg + "\""
                    cmdlist = ["git", "commit", "-sm", commitMsg]
                    top_info = subprocess.Popen(cmdlist, stdout=subprocess.PIPE)
                    out, err = top_info.communicate()
                    outstr = str(out)
                    print("outstr:", outstr)
                    totlen = flen
                    addfiles = []
                    addfiles.append(dirpath+"/"+file)
            if len(addfiles):
                print("add:", addfiles)
                for addfile in addfiles:
                    cmdlist = ["git", "add", addfile]
                    top_info = subprocess.Popen(cmdlist, stdout=subprocess.PIPE)
                    out, err = top_info.communicate()
                    outstr = str(out)
                    print("outstr:", outstr)
                print("commit -----------", totlen)
                rint = random.randint(1, 100)
                print("rint:", rint)
                time.sleep(rint)
                commitMsg = "\"add vulkan cases " + cmsg + "\""
                cmdlist = ["git", "commit", "-sm", commitMsg]
                top_info = subprocess.Popen(cmdlist, stdout=subprocess.PIPE)
                out, err = top_info.communicate()
                outstr = str(out)
                print("outstr:", outstr)
    cmdlist = ["git", "add", modifile]
    top_info = subprocess.Popen(cmdlist, stdout=subprocess.PIPE)
    out, err = top_info.communicate()
    outstr = str(out)
    print("outstr:", outstr)
    rint = random.randint(1, 100)
    print("rint:", rint)
    time.sleep(rint)
    commitMsg = "\"modifile " + modifile + " " + cmsg + "\""
    cmdlist = ["git", "commit", "-sm", commitMsg]
    top_info = subprocess.Popen(cmdlist, stdout=subprocess.PIPE)
    out, err = top_info.communicate()
    outstr = str(out)
    print("outstr:", outstr)

def main(cmsg):
    cmdlist = ["git", "status"]
    top_info = subprocess.Popen(cmdlist, stdout=subprocess.PIPE)
    out, err = top_info.communicate()
    outstr = str(out)
    print("outstr:", outstr)
    outlist = outstr.split("\\n")
    modifiedFiles = []
    deletedFiles = []
    addFiles = []
    isUntracked = False
    for item in outlist:
        if "modified" in item:
            itemlist = item.split(":")
            filename = itemlist[1]
            filename = filename.strip()
            modifiedFiles.append(filename)
        if "deleted" in item:
            itemlist = item.split(":")
            filename = itemlist[1]
            filename = filename.strip()
            deletedFiles.append(filename)
        if isUntracked and ("\\t" in item) and "autocommit.py" not in item:
            filename = item.strip()
            filename = filename.replace("\\t", "")
            addFiles.append(filename)
        if "Untracked" in item:
            isUntracked = True


    print("modifiedFiles------:", modifiedFiles)
    print("addFiles------:", addFiles)
    print("deleted------:", deletedFiles)

    # 增加 modify文件
    for modifile in modifiedFiles:
        auCommit(modifile, cmsg)
    for modifile in addFiles:
        auCommit(modifile, cmsg)
    for modifile in deletedFiles:
        auCommit(modifile, cmsg)

if __name__ == '__main__':
    cmsg = sys.argv[1]
    main(cmsg)