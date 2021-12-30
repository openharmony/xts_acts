#!/bin/bash

# Copyright (C) 2021 Huawei Device Co., Ltd.
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


# 配置发送短信的电话号码
config_const_var[0]="const TEST_PHONY_NUMBER = '12345678901';"

# 配置自动接听的电话号码
config_const_var[1]="const AUTO_ACCEPT_NUMBER = '10086';"
# 配置不接听的电话号码
config_const_var[2]="const NOT_ACCEPT_NUMBER = '10086';"
# 配置空电话号码
config_const_var[3]="const NULL_PHONE_NUMBER = '';"
# 配置11位电话号码
config_const_var[4]="const PHONE_NUMBER_LENGTH_11 = '00000000000';"
# 配置区号+座机电话号码
config_const_var[5]="const PHONE_NUMBER_AREA_LAND = '089800000000';"
# 配置语音信箱号
config_const_var[6]="const PHONE_NUMBER_VOICE_MAIL = '12599';"
# 配置超过30位电话号码
config_const_var[7]="const PHONE_NUMBER_LONG = '1234567890123456789012345678901';"
# 配置8位座机电话号码
config_const_var[8]="const PHONE_NUMBER_LENGTH_8 = '86459751';"

# 固定拨号的PIN2和PUK码
config_const_var[10]="const CORRECT_PIN2 = '87968263';"
config_const_var[12]="const CORRECT_PUK2 = '06315781';"

# 呼叫限制正确密码
config_const_var[13]="const RIGHT_PASSWORD = '0000';"
# 呼叫限制错误密码
config_const_var[14]="const ERROR_PASSWORD = '0001';"

config_const_var[15]="const CUCC_NUMBER = '10010';"

config_const_var[16]="const CMCC_NUMBER = '10086';"
for((i = 0; i < ${#config_const_var}; i++))
do
    if [ "${config_const_var[i]}" == "" ]; then
        continue
    fi
    grep_result=``
    key=`echo ${config_const_var[i]}| awk -F= '{print $1}'`
    for line in `grep -nr "${key}"| sed 's/ //g'|grep -v "config.sh"`
    do

        file=`echo ${line}|awk -F: '{print $1}'`
        line_no=`echo ${line}|awk -F: '{print $2}'`
        echo $file $line_no
        echo old:`grep "${key}" $file`
        if [ "$1" != "-i" ]; then
            echo preview:`sed $1 "s/${key}.*/${config_const_var[i]}/g" $file | grep "${key}"`
        else
            sed $1 "s/${key}.*/${config_const_var[i]}/g" $file | grep "${key}"
            echo new:`sed "s/${key}.*/${config_const_var[i]}/g" $file | grep "${key}"`
        fi
    done
done