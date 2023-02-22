/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { Driver, ON } from '@ohos.UiTest'
import abilityDelegatorRegistry from '@ohos.application.abilityDelegatorRegistry';

const delegator = abilityDelegatorRegistry.getAbilityDelegator();

async function stopApplication(bundleName: string) {
    await delegator.executeShellCommand(`aa force-stop ${bundleName} `).then(result => {
        console.info(`UiTestCase, stop application finished: ${result}`)
    }).catch(err => {
        console.error(`UiTestCase,stop application failed: ${err}`)
    })
}

export async function doSingleSelect(testNum) {
    let driver = Driver.create();
    await driver.delayMs(1000);
    let columns = await driver.findComponents(ON.type("Column").clickable(true));
    console.info(`${testNum}::doSingleSelect columns: ${columns}`);
    if (columns != undefined) {
        await columns[columns.length - 1].click();
    }

    await driver.delayMs(1000);
    let on = ON.text("选择图片");
    let rows = await driver.findComponents(ON.isAfter(on).type("Row").clickable(true));
    console.info(`${testNum}::doSingleSelect rows: ${rows}`);
    if (rows != undefined) {
        await rows[0].click();
    }
    await stopApplication('com.uitestScene.acts')
}

export async function doMultiSelect(testNum, selectNum) {
    let driver = Driver.create();
    await driver.delayMs(1000);
    let images = await driver.findComponents(ON.type("Image").clickable(true));
    console.info(`${testNum}::doMultiSelect images: ${images}`);
    if (images != undefined) {
        for (let i = 0; i < images.length; i++) {
            if ((i + 1) % 2 == 0 && (i + 1) / 2 <= selectNum) {
                await images[i].click();
            }
        }
    }

    await driver.delayMs(1000);
    let text = await driver.findComponent(ON.text("完成"));
    console.info(`${testNum}::doMultiSelect text: ${text}`);
    if (text != undefined) {
        await text.click();
    }
    await stopApplication('com.uitestScene.acts')
}

export async function doFileSelect(testNum, dirName, fileName) {
    let driver = Driver.create();
    await driver.delayMs(1000);
    let row1 = await driver.findComponent(ON.text("文档"));
    console.info(`${testNum}::doFileSelect row1: ${row1}`);
    if (row1 != undefined) {
        await row1.click();
    }

    await driver.delayMs(1000);
    let row2 = await driver.findComponent(ON.text(dirName));
    console.info(`${testNum}::doFileSelect row2: ${row2}`);
    if (row2 != undefined) {
        await row2.click();
    }

    await driver.delayMs(1000);
    let asset = await driver.findComponent(ON.text(fileName));
    console.info(`${testNum}::doFileSelect asset: ${asset}`);
    if (asset != undefined) {
        await asset.click();
    }

    await driver.delayMs(1000);
    let button = await driver.findComponent(ON.text("上传"));
    if (button != undefined) {
        await button.click();
    }
    await stopApplication('com.uitestScene.acts')
}

export async function doSave(testNum, dirName) {
    let driver = Driver.create();
    await driver.delayMs(1000);
    let buttonAllow = await driver.findComponent(ON.text("允许"));
    if (buttonAllow != undefined) {
        await buttonAllow.click();
    }

    await driver.delayMs(1000);
    let row1 = await driver.findComponent(ON.text("文档"));
    console.info(`${testNum}::doSave row1: ${row1}`);
    if (row1 != undefined) {
        await row1.click();
    }

    await driver.delayMs(1000);
    let row2 = await driver.findComponent(ON.text(dirName));
    console.info(`${testNum}::doSave row2: ${row2}`);
    if (row2 != undefined) {
        await row2.click();
    }

    await driver.delayMs(1000);
    let button = await driver.findComponent(ON.text("保存"));
    if (button != undefined) {
        await button.click();
    }
    await stopApplication('com.uitestScene.acts')
}