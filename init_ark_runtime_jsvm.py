#!/usr/bin/env python3
import os;
import subprocess;
import sys;
root_path = sys.argv[1]
jsvm_test_path = root_path + "commonlibrary/ark_runtime/ark_runtime_jsvm_test/"
jsvm_test_jitless_path = root_path + "commonlibrary/ark_runtime/ark_runtime_jsvm_test_jitless/"
if os.path.exists(root_path):
    subprocess.run(["cp", "-rf", jsvm_test_path + "entry/src/ohosTest/ets", jsvm_test_jitless_path + "entry/src/ohosTest/"])
    subprocess.run(["cp", "-rf", jsvm_test_path + "entry/src/main/ets", jsvm_test_jitless_path + "entry/src/main/"])
    subprocess.run(["cp", "-rf", jsvm_test_path + "entry/src/main/MainAbility", jsvm_test_jitless_path + "entry/src/main/"])