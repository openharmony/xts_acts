#!/bin/sh
#
# Copyright (c) 2023 Huawei Device Co., Ltd.
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at

#     http://www.apache.org/licenses/LICENSE-2.0

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, #WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

if(cat "/etc/group" | grep "servicectrl:x:3047:root,shell,system,samgr,hdf_devmgr");then
	echo "OpenHarmony-SA-2022-1001 testcase pass"
else
	echo "OpenHarmony-SA-2022-1001 testcase fail"
fi

