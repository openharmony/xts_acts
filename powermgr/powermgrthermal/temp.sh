#!/bin/bash
# Copyright (c) 2022 Huawei Device Co., Ltd.
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

count=0
output=/data/sensor/battery/temp

while ((count < 100))
do
    if [ $(($count%4)) == 0 ]; then
        temp=-21000
        let "temp = temp + 2000"
        echo $temp
        echo $temp > $output
        sleep 10
    else
        temp=40100
        let "temp = temp + 2000"
        echo $temp
        echo $temp > $output
        sleep 10
    fi
    let "count = count + 1"
    echo $count
    cat $output
done