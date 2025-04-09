#!/usr/bin/env python3
# -*- coding: utf-8 -*-
#
# Copyright (c) 2025 Huawei Device Co., Ltd.
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

from devicetest.core.test_case import TestCase, Step
import json
import re


# @tc.number: XTS_SYSCAPMinSet_0100
# @tc.name: testSyscapMinSetTest
# @tc.level: Level0
# @tc.desc: 验证设备被测设备包含该类设备syscap最小集
class testSyscapMinSetTest(TestCase):

    def __init__(self, controllers):
        self.TAG = self.__class__.__name__
        super().__init__(self.TAG, controllers)

    def setup(self):
        Step("Setup")

    def process(self):
        Step("Process")

        # 获取设备 SystemCapability
        SystemCapability_json_data = self.device1.execute_shell_command("cat /system/etc/SystemCapability.json")
        data = json.loads(SystemCapability_json_data)
        device_SystemCapability_list = data['syscap']['os']
        self.log.info(f"设备端syscap: {device_SystemCapability_list}")

        # 获取设备类型
        device_type = re.findall('const.build.product=.+', self.device1.execute_shell_command("cat /system/etc/param/ohos.para"))[0].split('=')[-1]
        self.log.info(f"设备类型: {device_type}")

        # 获取该类设备syscap最小集
        syscap_json_data = self.device1.execute_shell_command(f"cat /data/local/tmp/syscap/{device_type}.json")
        syscap_data = json.loads(syscap_json_data)
        syscap_list = syscap_data['SysCaps']
        self.log.info(f"该类设备syscap最小集: {syscap_list}")

        is_subset = set(syscap_list) <= set(device_SystemCapability_list)

        assert is_subset

    def teardown(self):
        Step("Teardown")