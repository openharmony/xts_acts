#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
Copyright (c) 2020-2021 Huawei Device Co., Ltd.
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
"""



import os
import argparse
import tarfile
import shutil

copyFileCounts = 0

def copyFiles(sourceDir, targetDir):
    global copyFileCounts
    for f in os.listdir(sourceDir):
        sourceF = os.path.join(sourceDir, f)
        targetF = os.path.join(targetDir, f)
        if os.path.isfile(sourceF):
            if not os.path.exists(targetDir):
                os.makedirs(targetDir)
            copyFileCounts += 1
            if not os.path.exists(targetF) or (os.path.exists(targetF) and (os.path.getsize(targetF) != os.path.getsize(sourceF))):
                open(targetF, "wb").write(open(sourceF, "rb").read())
        if os.path.isdir(sourceF):
            copyFiles(sourceF, targetF)

def make_targz_one_by_one(output_filename, source_dir):
    tar = tarfile.open(output_filename,"w")
    for root,dir,files in os.walk(source_dir):
      for file in files:
          pathfile = os.path.join(root, file)
          tar.add(pathfile)
    tar.close()

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='manual to this script')
    parser.add_argument("--input_path", type=str, default="0")
    parser.add_argument("--output_path", type=str, default="0")
    parser.add_argument("--temp_path", type=str, default="0")
    args = parser.parse_args()
    print(args.input_path)
    print(args.output_path)
    print(args.temp_path)

    copyFiles(args.input_path, args.temp_path)
    make_targz_one_by_one(args.output_path, args.temp_path)

    shutil.rmtree(args.temp_path) #delete middle files
