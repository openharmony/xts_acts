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

set -e

parse_target_subsystem()
{
    XTS_HOME=$(dirname $(cd $(dirname $0); pwd))
    BASE_HOME=${XTS_HOME}/../..
    target_subsystem_config=${XTS_HOME}/tools/config/precise_compilation.json
    xts_targets=()
    repositorys=$1
    match_status=true
    repo_lst=($(echo $repositorys | tr "," "\n"))
    for repo in "${repo_lst[@]}"
    do
        # 仓名映射target名
        jq_cmd="cat $target_subsystem_config | jq -r '.[] | select( .name == \"${repo}\") | .buildTarget'"
        xts_target=`eval $jq_cmd`
        if [[ -z "${xts_target}" ]];then
            match_status=false
        fi
        # precise_compilation.json匹配到的才添加，数组中不存在才添加（去重）
        if [[ -n "${xts_target}" && !("${xts_targets[@]}" =~ "$xts_target") ]];then
            xts_targets=(${xts_targets[@]} $xts_target)
        fi
    done

}


do_make()
{
    cd $BASE_HOME
    if [[ ${match_status} == false || "${xts_targets[@]}" =~ "xts_acts" ]];then
	    ./test/xts/acts/build.sh product_name=rk3568 system_size=standard
    else
        for target in "${xts_targets[@]}"
            do
                ./test/xts/acts/build.sh product_name=rk3568 system_size=standard suite=${target}
            done
    fi
}
parse_target_subsystem $1
do_make
exit 0
