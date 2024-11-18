#!/usr/bin/env python3
# -*- coding: utf-8 -*-
#
# Copyright (c) 2024 Huawei Device Co., Ltd.
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

import os
import sys
import subprocess
import shutil
import logging 
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')
logging.basicConfig(level=logging.ERROR, format='%(asctime)s - %(levelname)s - %(message)s')

usage_info = """
USAGE
       ./build.sh [suite=BUILD_TARGET] [target_os=TARGET_OS] [target_arch=TARGET_ARCH] [variant=BUILD_VARIANT] [target_subsystem=TARGET_SUBSYSTEM]
                  suite            : BUILD_TARGET     acts, hats, dcts
                  target_arch      : TARGET_ARCH      arm64 or arm, default value is arm
                  variant          : BUILD_VARIANT    release or debug, default value is debug
                  target_subsystem : TARGET_SUBSYSTEM the target subsystem to build
                  system_size      : SYSTEM_SIZE      standard
                  product_name     : PRODUCT_NAME     the name of product. such as Hi3516DV300, and so on.

"""


class XtsBuild:

    def __init__(self, commandline):
        self._xts_root_dir = os.path.dirname(os.path.realpath(__file__))
        self._code_root_dir = os.path.realpath(os.path.join(self._xts_root_dir, '../../..'))
        self._change_list_file = "{}/change_info.json".format(self._code_root_dir)
        self._python_path = "{}/prebuilts/python/linux-x86/3.11.4/bin".format(self._code_root_dir)
        os.environ['PATH'] = "{}:{}".format(self._python_path, os.environ['PATH'])
        self._commandline = commandline
        self._args = {}
        self._gn_args = {}
        self._other_args = {}
        self._build_target = []

    def usage(self):
        print(usage_info)

    def parse_cmdline(self):
        cmdline_args = [
            'suite', 'target_arch', 'use_musl', 'target_subsystem', 'system_size', 'product_name', 'pr_path_list',
            'cache_type'
        ]
        cmdline = {'use_musl': 'false', 'system_size': 'standard', 'target_arch': 'arm'}
        for p in self._commandline:
            if p.find('=') == -1:
                self.usage()
                return -1

            [option, param] = p.split('=')
            if option in cmdline_args:
                cmdline[option] = param
            else:
                self.usage()
                return -1
        if cmdline.get('target_subsystem'):
            os.environ['target_subsystem'] = ''

        # print("args_dict = {}".format(cmdline))
        self._gn_args['build_xts'] = 'true'
        if cmdline.get('system_size') == 'standard':
            build_target = cmdline['suite'] if cmdline.get('suite') else "test/xts/acts:xts_acts"
            self._args['product-name'] = cmdline['product_name'] if cmdline.get('product_name') else "Hi3516DV300"
            if self._args['product-name'] == 'm40' and cmdline.get('use_musl') == 'false':
                self._gn_args['use_musl'] = 'false'
                self._gn_args['use_custom_libcxx'] = 'true'
                self._gn_args['use_custom_clang'] = 'true'

            if cmdline.get('cache_type') == 'xcache':
                self._args['ccache'] = 'false'
                self._args['xcache'] = 'true'

            if cmdline.get('pr_path_list'):
                self._gn_args['pr_path_list'] = cmdline.get('pr_path_list')

            self._args['target-cpu'] = cmdline.get('target_arch')
            self._other_args['get-warning-list'] = 'false'
            self._other_args['stat-ccache'] = 'true'
            self._other_args['compute-overlap-rate'] = 'false'
            self._args['deps-guard'] = 'false'
            self._gn_args['skip_generate_module_list_file'] = 'true'
            self._gn_args['is_standard_system'] = 'true'
        else:
            build_target = cmdline['suite'] if cmdline.get('suite') else "acts acts_ivi acts_intellitv acts_wearable"
            self._args['product-name'] = cmdline['product_name'] if cmdline.get('product_name') else "arm64"

        self._build_target = build_target.replace(',', ' ').split()

        return 0

    def standard_check(self):
        self._hvigor_check_file = "{}/test/xts/tools/standard_check/check_hvigor.py".format(self._code_root_dir)
        check_command = "{}/python3 -B {} {}".format(self._python_path, self._hvigor_check_file, self._xts_root_dir)
        ret = subprocess.run(check_command.split())
        return ret.returncode

    def get_accurate_targets(self):
        accurate_dir = "{}/test/xts/tools/ci".format(self._code_root_dir)
        sys.path.append(accurate_dir)
        import generate_accurate_targets as gat
        retcode, accurate_target = gat.generate(self._xts_root_dir, self._change_list_file, self._build_target)
        if retcode:
            sys.exit(-1)
        return accurate_target

    def do_make(self):
        os.environ['XTS_SUITENAME'] = 'acts'
        # 精准编译重新计算要编译的目标
        self._build_target = self.get_accurate_targets()
        if len(self._build_target) == 0:
            logging.info("Info: accurate targets list is null, no need to compile")
            return 0
        logging.info(f"_build_target = {self._build_target}")
        self._build_target.append('deploy_testtools')

        autogen_apiobjs_dir = "{}/test/xts/autogen_apiobjs".format(self._code_root_dir)
        if os.path.exists(autogen_apiobjs_dir):
            shutil.rmtree(autogen_apiobjs_dir)

        # 拼接编译命令
        build_command = "./build.sh"
        for i in self._args:
            build_command = "{} --{} {}".format(build_command, i, self._args.get(i))
        for i in self._gn_args:
            build_command = "{} --gn-args {}={}".format(build_command, i, self._gn_args.get(i))
        for i in self._build_target:
            build_command = "{} --build-target {}".format(build_command, i)
        for i in self._other_args:
            build_command = "{} --{}={}".format(build_command, i, self._other_args.get(i))
        logging.info("build_command: {}".format(build_command))

        # 执行编译命令
        os.chdir(self._code_root_dir)
        ret = subprocess.run(build_command.split())
        if ret.returncode:
            logging.info("subprocess.run ret={}".format(ret))

        if os.path.exists(autogen_apiobjs_dir):
            shutil.rmtree(autogen_apiobjs_dir)

        return ret.returncode

    def build(self):
        func_list = [self.parse_cmdline, self.standard_check, self.do_make]
        for i in func_list:
            retcode = i()
            if retcode:
                return retcode
        return 0


def main():
    logging.info(">>> Execute command: {}".format(" ".join(sys.argv)))
    obj = XtsBuild(sys.argv[1:])

    retcode = obj.build()

    return retcode

if __name__ == "__main__":
    sys.exit(main())
