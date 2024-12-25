/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
// Script for compiling build behavior. It is built in the build plug-in and cannot be modified currently.
import { getHvigorNode } from '@ohos/hvigor';
// FA模型此处改为：
// import { legacyHapTasks as hapTasks } from '@ohos/hvigor-ohos-plugin';
import { hapTasks } from '@ohos/hvigor-ohos-plugin';
import * as path from 'path';
import { executeOnlineSign } from '../hw_sign/sign.js'

const mModule = getHvigorNode(__filename);
const ohosPlugin = hapTasks(mModule);

const onlineSignHapTaskName = "onlineSignHap";
let curTargetName = "default";
const mModuleName = mModule.getName();
const projectRootPath = process.cwd();

// 若是feature模块签名，此处填写依赖的entry模块名称
const entryName = '';

ohosPlugin.getNeedExecTargetServiceList().forEach(targetServices => {

    curTargetName = targetServices.getTargetData().getTargetName();

    // 注册在线签名任务和创建任务依赖
    const onlineSignTask = mModule.task(() => {
        // 构建的未签名的hap的输出根目录
        const moduleBuildOutputDir = path.resolve(projectRootPath, mModuleName, `build/default/outputs/${curTargetName }/`);

        // 未签名的hap包路径
        const inputFile = path.resolve(moduleBuildOutputDir, `${mModuleName}${entryName? '-' + entryName: ''}-${curTargetName }-unsigned.hap`);
        // 签名后的hap包路径
        const outputFile = path.resolve(moduleBuildOutputDir, `${mModuleName}${entryName? '-' + entryName: ''}-${curTargetName }-signed.hap`);

        executeOnlineSign(inputFile, outputFile);

        // FA模型此处改为：
        // }, onlineSignHapTaskName).dependsOn(`${curTargetName}@LegacyPackageHap`);
    }, onlineSignHapTaskName).dependsOn(`${curTargetName}@PackageHap`);

    // 使用在线签名,可以把离线签名任务disable掉
    if (onlineSignTask.getEnabled()) {
        mModule.getTaskByName(`${curTargetName}@SignHap`).setEnabled(false);
    }
}) ;

// 将在线签名任务挂接在assembleHap任务上,如果需要在IDE上使用,assembleHap任务是固定的
mModule.getTaskByName("assembleHap").dependsOn(onlineSignHapTaskName);

module.exports = {
    ohos: ohosPlugin
}