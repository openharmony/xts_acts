/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import AccessibilityExtensionAbility from '@ohos.application.AccessibilityExtensionAbility'
import { GesturePath } from '@ohos.accessibility.GesturePath';
import { GesturePoint } from '@ohos.accessibility.GesturePoint';
import commonEvent from '@ohos.commonEvent'


const LOG_PREFIX = '[CQH-GESTURE-ABILITY-ACCESSIBLE]'
const EVENT_NAME = 'on_assist_change'
const EVENT_NAME_BACK = 'on_assist_change_extra'
const MS_400 = 400
const MS_500 = 500
const MS_800 = 800
const MS_1000 = 1000
let CommonEventSubscribeInfo = {
    events: [EVENT_NAME]
}

var subscriber
class ServiceExtAbility extends AccessibilityExtensionAbility {
    onConnect() {
        console.info(LOG_PREFIX + " onConnect")
        let context = this.context
        commonEvent.createSubscriber(CommonEventSubscribeInfo).then((data) => {
            subscriber = data
            commonEvent.subscribe(subscriber, (error, commonEventData) => {
                if (error.code != 0) {
                    console.info(LOG_PREFIX + 'subscribe failed. Cause:' + JSON.stringify(error))
                    return
                }
                console.info(LOG_PREFIX + 'subscribeTest callback : ' + JSON.stringify(commonEventData))
                selectCode(context, commonEventData.data)
            })
        }).catch((error) => {
            console.info(LOG_PREFIX + 'createSubscriber failed. Cause: ' + JSON.stringify(error))
            return
        })
    }

    onDisconnect() {
        console.info(LOG_PREFIX + " onDisconnect")
        commonEvent.unsubscribe(subscriber)
    }

    onAccessibilityEvent(accessibilityEvent) {
        console.info(LOG_PREFIX + " accessibilityEvent : " + JSON.stringify(accessibilityEvent))
    }

    onKeyEvent(keyEvent) {
        console.info(LOG_PREFIX + " keyEvent : " + JSON.stringify(keyEvent))
        return true
    }
}

function selectCode(context, caseCode) {
    switch (caseCode) {
        case 'GestureSimulation_0010':
            GestureSimulation_0010(context, caseCode)
            break
        case 'GestureSimulation_0020':
            GestureSimulation_0020(context, caseCode)
            break
        case 'GestureSimulation_0030':
            GestureSimulation_0030(context, caseCode)
            break
        case 'GestureSimulation_0040':
            GestureSimulation_0040(context, caseCode)
            break
        case 'GestureSimulation_0050':
            GestureSimulation_0050(context, caseCode)
            break
        case 'GestureSimulation_0060':
            GestureSimulation_0060(context, caseCode)
            break
        case 'GestureSimulation_0070':
            GestureSimulation_0070(context, caseCode)
            break
        case 'GestureSimulation_0080':
            GestureSimulation_0080(context, caseCode)
            break
        case 'GestureSimulation_0090':
            GestureSimulation_0090(context, caseCode)
            break
        case 'GestureSimulation_0100':
            GestureSimulation_0100(context, caseCode)
            break
        case 'GestureSimulation_0110':
            GestureSimulation_0110(context, caseCode)
            break
        case 'GestureSimulation_0120':
            GestureSimulation_0120(context, caseCode)
            break
        case 'GestureSimulation_0130':
            GestureSimulation_0130(context, caseCode)
            break
        case 'GestureSimulation_0140':
            GestureSimulation_0140(context, caseCode)
            break
        case 'GestureSimulation_0150':
            GestureSimulation_0150(context, caseCode)
            break
        case 'GestureSimulation_0160':
            GestureSimulation_0160(context, caseCode)
            break
        case 'GestureSimulation_0170':
            GestureSimulation_0170(context, caseCode)
            break
        case 'GestureSimulation_0180':
            GestureSimulation_0180(context, caseCode)
            break
        case 'GestureSimulation_0190':
            GestureSimulation_0190(context, caseCode)
            break
        case 'GestureSimulation_0200':
            GestureSimulation_0200(context, caseCode)
            break
        case 'GestureSimulation_0210':
            GestureSimulation_0210(context, caseCode)
            break
        case 'GestureSimulation_0220':
            GestureSimulation_0220(context, caseCode)
            break
        case 'GestureSimulation_0230':
            GestureSimulation_0230(context, caseCode)
            break
        case 'GestureSimulation_0240':
            GestureSimulation_0240(context, caseCode)
            break
        case 'GestureSimulation_0250':
            GestureSimulation_0250(context, caseCode)
            break
        case 'GestureSimulation_0260':
            GestureSimulation_0260(context, caseCode)
            break
        case 'GestureSimulation_0270':
            GestureSimulation_0270(context, caseCode)
            break
        case 'GestureSimulation_0280':
            GestureSimulation_0280(context, caseCode)
            break
        case 'GestureSimulation_0290':
            GestureSimulation_0290(context, caseCode)
            break
        case 'GestureSimulation_0300':
            GestureSimulation_0300(context, caseCode)
            break
        case 'GestureSimulation_0310':
            GestureSimulation_0310(context, caseCode)
            break
        case 'GestureSimulation_0320':
            GestureSimulation_0320(context, caseCode)
            break
        case 'GestureSimulation_0330':
            GestureSimulation_0330(context, caseCode)
            break
        case 'GestureSimulation_0340':
            GestureSimulation_0340(context, caseCode)
            break
        case 'GestureSimulation_0350':
            GestureSimulation_0350(context, caseCode)
            break
        case 'GestureSimulation_0360':
            GestureSimulation_0360(context, caseCode)
            break
        case 'GestureSimulation_0370':
            GestureSimulation_0370(context, caseCode)
            break
        case 'GestureSimulation_0380':
            GestureSimulation_0380(context, caseCode)
            break
        case 'GestureSimulation_0390':
            GestureSimulation_0390(context, caseCode)
            break
        case 'GestureSimulation_0400':
            GestureSimulation_0400(context, caseCode)
            break
        case 'GestureSimulation_0410':
            GestureSimulation_0410(context, caseCode)
            break
        case 'GestureSimulation_0420':
            GestureSimulation_0420(context, caseCode)
            break
    }
}

function getGesturePath(durationTime: number, array: Array<string>) {
    let gesturePath = new GesturePath(durationTime)
    for (let item of array) {
        let pos = item.split(',')
        let point = new GesturePoint(Number(pos[0]), Number(pos[1]))
        gesturePath.points.push(point)
    }
    return gesturePath
}

let click = ["332,945"]

//click
function GestureSimulation_0010(context, caseCode) {
    const logTag = LOG_PREFIX + caseCode
    let gesturePath = getGesturePath(MS_400, click)
    gestureInjectCallback1(logTag, context, gesturePath, caseCode)
}

//click
function GestureSimulation_0020(context, caseCode) {
    const logTag = LOG_PREFIX + caseCode
    let gesturePath = getGesturePath(MS_400, click)
    gestureInjectPromise1(logTag, context, gesturePath, caseCode)
}

//longClick
function GestureSimulation_0030(context, caseCode) {
    const logTag = LOG_PREFIX + caseCode
    let gesturePath = getGesturePath(MS_1000, click)
    gestureInjectCallback1(logTag, context, gesturePath, caseCode)
}

//longClick
function GestureSimulation_0040(context, caseCode) {
    const logTag = LOG_PREFIX + caseCode
    let gesturePath = getGesturePath(MS_1000, click)
    gestureInjectPromise1(logTag, context, gesturePath, caseCode)
}


let scrollForward = ["378,1069", "377,1028", "377,983"]
let scrollBackward = ["377,983", "377,1028", "378,1069"]
//scrollForward
function GestureSimulation_0050(context, caseCode) {
    const logTag = LOG_PREFIX + caseCode
    let gesturePath = getGesturePath(MS_500, scrollForward)
    gestureInjectCallback1(logTag, context, gesturePath, caseCode)
}

//scrollForward
function GestureSimulation_0060(context, caseCode) {
    const logTag = LOG_PREFIX + caseCode
    let gesturePath = getGesturePath(MS_500, scrollForward)
    gestureInjectPromise1(logTag, context, gesturePath, caseCode)
}

//scrollBackward
function GestureSimulation_0070(context, caseCode) {
    const logTag = LOG_PREFIX + caseCode
    let gesturePath = getGesturePath(MS_500, scrollBackward)
    gestureInjectCallback1(logTag, context, gesturePath, caseCode)
}

//scrollBackward
function GestureSimulation_0080(context, caseCode) {
    const logTag = LOG_PREFIX + caseCode
    let gesturePath = getGesturePath(MS_500, scrollBackward)
    gestureInjectPromise1(logTag, context, gesturePath, caseCode)
}


let left = ["394,416", "389,416", "373,416", "357,416", "344,417", "332,417", "323,418", "315,418", "305,418", "295,418", "285,418", "277,419", "269,419", "259,419", "248,421", "238,422", "230,423", "223,424", "218,424", "213,424", "207,425", "202,425", "198,425", "197,425", "196,425", "195,425", "194,425", "194,425"]
let leftThenRight = ["438,420", "431,420", "418,420", "400,420", "384,422", "368,424", "351,427", "334,430", "316,433", "300,436", "283,439", "268,441", "255,443", "243,445", "233,446", "223,447", "216,448", "212,449", "211,450", "209,450", "207,450", "202,450", "201,450", "200,450", "199,450", "198,450", "197,450", "198,450", "199,449", "205,446", "211,443", "219,439", "226,435", "233,432", "239,429", "246,426", "252,423", "258,422", "264,421", "271,420", "281,419", "291,418", "302,415", "311,414", "320,413", "325,410", "330,409", "335,408", "336,407", "337,407", "338,407", "339,407", "340,407", "344,406", "345,406", "349,406", "350,405", "351,405", "352,405", "353,405", "354,405", "355,404", "356,404", "357,404", "358,404", "363,404", "367,403", "373,403", "377,403", "378,402", "379,402", "380,402", "380,402"]
let leftThenUp = ["476,408", "469,408", "459,408", "443,408", "429,408", "415,408", "400,409", "384,411", "369,414", "354,416", "327,420", "281,425", "268,425", "264,425", "263,425", "259,424", "258,423", "257,422", "256,422", "255,421", "254,420", "253,417", "251,414", "245,407", "241,402", "239,387", "237,377", "234,367", "233,357", "232,354", "232,349", "232,345", "231,341", "231,336", "231,325", "231,321", "231,317", "231,314", "231,311", "230,308", "230,304", "229,300", "229,296", "228,292", "228,289", "227,286", "227,285", "227,282", "226,281", "226,278", "226,275", "225,271", "225,268", "225,265", "225,262", "225,261", "224,258", "224,257", "224,254", "224,253", "224,252", "224,251", "224,250", "223,250", "223,250"]
let leftThenDown = ["456,360", "451,360", "435,359", "429,358", "423,357", "414,356", "405,355", "394,354", "385,354", "376,354", "369,354", "361,354", "352,354", "345,353", "337,353", "329,353", "321,353", "314,353", "307,353", "300,353", "293,353", "285,353", "278,353", "273,353", "269,353", "265,353", "259,355", "251,358", "245,359", "241,361", "239,364", "234,367", "230,371", "225,381", "221,382", "219,385", "215,388", "213,391", "211,395", "209,406", "208,417", "206,430", "205,442", "204,453", "204,457", "204,472", "204,475", "204,487", "204,490", "204,500", "204,502", "204,506", "204,510", "204,514", "204,517", "204,521", "204,525", "205,529", "205,532", "205,534", "206,535", "206,536", "206,538", "206,541", "206,544", "206,546", "206,547", "206,548", "206,549", "206,550", "206,550"]

//left
function GestureSimulation_0090(context, caseCode) {
    const logTag = LOG_PREFIX + caseCode
    let gesturePath = getGesturePath(MS_500, left)
    gestureInjectCallback1(logTag, context, gesturePath, caseCode)
}

//left
function GestureSimulation_0100(context, caseCode) {
    const logTag = LOG_PREFIX + caseCode
    let gesturePath = getGesturePath(MS_500, left)
    gestureInjectPromise1(logTag, context, gesturePath, caseCode)
}

//leftThenRight
function GestureSimulation_0110(context, caseCode) {
    const logTag = LOG_PREFIX + caseCode
    let gesturePath = getGesturePath(MS_800, leftThenRight)
    gestureInjectCallback1(logTag, context, gesturePath, caseCode)
}

//leftThenRight
function GestureSimulation_0120(context, caseCode) {
    const logTag = LOG_PREFIX + caseCode
    let gesturePath = getGesturePath(MS_800, leftThenRight)
    gestureInjectPromise1(logTag, context, gesturePath, caseCode)
}

//leftThenUp
function GestureSimulation_0130(context, caseCode) {
    const logTag = LOG_PREFIX + caseCode
    let gesturePath = getGesturePath(MS_800, leftThenUp)
    gestureInjectCallback1(logTag, context, gesturePath, caseCode)
}

//leftThenUp
function GestureSimulation_0140(context, caseCode) {
    const logTag = LOG_PREFIX + caseCode
    let gesturePath = getGesturePath(MS_800, leftThenUp)
    gestureInjectPromise1(logTag, context, gesturePath, caseCode)
}

//leftThenDown
function GestureSimulation_0150(context, caseCode) {
    const logTag = LOG_PREFIX + caseCode
    let gesturePath = getGesturePath(MS_800, leftThenDown)
    gestureInjectCallback1(logTag, context, gesturePath, caseCode)
}

//leftThenDown
function GestureSimulation_0160(context, caseCode) {
    const logTag = LOG_PREFIX + caseCode
    let gesturePath = getGesturePath(MS_800, leftThenDown)
    gestureInjectPromise1(logTag, context, gesturePath, caseCode)
}


let right = ["258,438", "265,438", "276,437", "289,433", "298,430", "304,427", "310,424", "316,423", "322,422", "329,421", "337,420", "344,419", "351,419", "357,418", "364,417", "374,416", "383,415", "392,414", "399,414", "406,414", "413,413", "420,413", "428,412", "436,412", "444,412", "450,412", "456,412", "461,412", "465,412", "470,412", "476,412", "482,412", "489,412", "494,412", "498,412", "503,412", "504,412", "510,412", "511,412", "512,412", "513,412", "514,412", "515,412", "516,412", "516,414", "516,414"]
let rightThenLeft = ["289,451", "295,451", "307,450", "327,447", "350,444", "375,441", "402,438", "428,435", "450,434", "468,433", "480,432", "487,431", "488,430", "492,429", "492,428", "493,428", "494,428", "495,428", "501,428", "506,427", "511,427", "512,426", "518,425", "522,424", "526,424", "536,423", "540,422", "544,422", "545,422", "546,422", "546,421", "545,420", "543,419", "539,418", "535,418", "531,418", "527,418", "522,418", "518,417", "513,416", "508,415", "502,414", "497,413", "492,412", "486,411", "480,410", "475,409", "470,408", "464,408", "450,407", "443,407", "436,406", "429,406", "423,405", "418,405", "412,405", "406,405", "391,405", "384,405", "378,405", "373,405", "369,405", "367,405", "362,405", "358,405", "356,405", "354,405", "352,405", "351,405", "350,405", "349,405", "349,405"]
let rightThenUp = ["258,454", "265,454", "278,454", "293,454", "307,454", "320,454", "335,454", "347,453", "357,453", "366,453", "375,453", "392,453", "398,453", "404,453", "410,453", "416,453", "424,453", "432,453", "440,452", "446,451", "450,450", "451,450", "455,450", "456,450", "457,449", "461,448", "462,447", "467,444", "471,441", "472,438", "477,435", "478,431", "482,427", "483,423", "487,419", "487,416", "488,413", "489,412", "493,409", "493,406", "494,403", "495,400", "496,390", "497,387", "497,373", "497,369", "497,365", "497,361", "497,360", "498,357", "498,354", "498,351", "498,347", "498,337", "498,333", "498,322", "498,319", "498,314", "498,309", "498,299", "498,298", "498,294", "498,290", "498,286", "498,283", "498,280", "498,279", "498,278", "498,277", "498,276", "498,275", "498,274", "498,273", "498,272", "498,271", "498,271"]
let rightThenDown = ["250,408", "257,408", "269,408", "286,407", "302,404", "316,401", "330,398", "343,395", "355,392", "365,391", "385,389", "394,388", "402,387", "407,386", "412,385", "418,384", "423,384", "424,384", "429,384", "430,384", "436,384", "443,384", "449,384", "454,384", "455,384", "456,384", "457,384", "458,384", "459,384", "465,384", "470,384", "471,384", "476,384", "477,385", "481,386", "482,388", "487,390", "488,393", "493,395", "494,398", "498,401", "499,404", "500,407", "501,410", "505,420", "506,423", "507,427", "508,439", "509,442", "510,453", "511,455", "512,458", "512,461", "512,464", "513,471", "513,475", "514,479", "514,484", "514,486", "514,488", "514,490", "514,491", "514,492", "514,494", "514,498", "514,509", "515,510", "515,513", "515,515", "515,517", "515,517"]

//right
function GestureSimulation_0170(context, caseCode) {
    const logTag = LOG_PREFIX + caseCode
    let gesturePath = getGesturePath(MS_500, right)
    gestureInjectCallback1(logTag, context, gesturePath, caseCode)
}

//right
function GestureSimulation_0180(context, caseCode) {
    const logTag = LOG_PREFIX + caseCode
    let gesturePath = getGesturePath(MS_500, right)
    gestureInjectPromise1(logTag, context, gesturePath, caseCode)
}

//rightThenLeft
function GestureSimulation_0190(context, caseCode) {
    const logTag = LOG_PREFIX + caseCode
    let gesturePath = getGesturePath(MS_800, rightThenLeft)
    gestureInjectCallback1(logTag, context, gesturePath, caseCode)
}

//rightThenLeft
function GestureSimulation_0200(context, caseCode) {
    const logTag = LOG_PREFIX + caseCode
    let gesturePath = getGesturePath(MS_800, rightThenLeft)
    gestureInjectPromise1(logTag, context, gesturePath, caseCode)
}

//rightThenUp
function GestureSimulation_0210(context, caseCode) {
    const logTag = LOG_PREFIX + caseCode
    let gesturePath = getGesturePath(MS_800, rightThenUp)
    gestureInjectCallback1(logTag, context, gesturePath, caseCode)
}

//rightThenUp
function GestureSimulation_0220(context, caseCode) {
    const logTag = LOG_PREFIX + caseCode
    let gesturePath = getGesturePath(MS_800, rightThenUp)
    gestureInjectPromise1(logTag, context, gesturePath, caseCode)
}

//rightThenDown
function GestureSimulation_0230(context, caseCode) {
    const logTag = LOG_PREFIX + caseCode
    let gesturePath = getGesturePath(MS_800, rightThenDown)
    gestureInjectCallback1(logTag, context, gesturePath, caseCode)
}

//rightThenDown
function GestureSimulation_0240(context, caseCode) {
    const logTag = LOG_PREFIX + caseCode
    let gesturePath = getGesturePath(MS_800, rightThenDown)
    gestureInjectPromise1(logTag, context, gesturePath, caseCode)
}


let up = ["365,475", "365,467", "365,455", "364,452", "364,448", "364,443", "364,432", "364,422", "364,409", "365,393", "366,380", "367,375", "368,365", "370,361", "370,357", "370,346", "371,334", "372,322", "373,319", "373,316", "373,315", "373,314", "374,311", "375,301", "376,291", "377,280", "378,277", "379,274", "380,273", "380,270", "380,266", "381,261", "381,250", "382,247", "382,244", "382,243", "382,240", "382,237", "382,234", "382,233", "382,232", "382,229", "382,226", "382,222", "382,218", "382,215", "382,214", "382,213", "382,212", "382,212"]
let upThenDown = ["361,523", "361,520", "361,509", "360,499", "360,496", "360,492", "360,488", "360,485", "360,484", "360,474", "360,469", "361,456", "362,452", "363,442", "364,438", "365,433", "366,422", "367,419", "367,415", "367,412", "367,409", "367,406", "368,390", "369,386", "370,382", "370,378", "370,375", "370,372", "371,361", "373,344", "374,341", "374,338", "374,335", "374,332", "374,327", "375,316", "375,312", "375,300", "375,296", "374,291", "374,280", "373,277", "372,272", "371,264", "371,263", "371,262", "371,261", "371,260", "371,262", "371,265", "372,269", "373,272", "373,276", "374,280", "375,290", "375,293", "375,297", "376,301", "376,305", "376,309", "376,319", "376,321", "377,324", "377,327", "378,330", "378,334", "378,337", "378,341", "378,351", "378,353", "378,356", "378,360", "378,370", "378,372", "378,375", "378,377", "378,379", "378,381", "378,384", "378,388", "378,392", "378,402", "378,404", "378,407", "378,409", "378,411", "378,414", "378,417", "378,421", "378,425", "378,428", "378,430", "378,433", "378,436", "378,439", "378,440", "378,441", "378,443", "378,446"]
let upThenLeft = ["379,465", "380,445", "381,425", "385,406", "385,388", "385,373", "386,359", "386,344", "386,332", "387,322", "387,318", "387,307", "387,304", "387,300", "387,299", "387,298", "387,297", "387,296", "387,295", "387,294", "386,293", "385,290", "383,286", "381,283", "379,280", "377,279", "372,275", "370,272", "366,271", "365,270", "363,269", "359,266", "357,265", "352,264", "350,263", "345,262", "341,261", "335,260", "329,259", "321,258", "314,258", "308,257", "301,257", "293,257", "279,257", "274,257", "272,257", "271,257", "270,257", "269,257", "268,257", "267,257", "266,257", "265,257", "264,257", "263,257", "263,256", "263,256"]
let upThenRight = ["329,528", "329,525", "329,510", "329,493", "329,476", "328,459", "326,442", "325,425", "323,410", "322,396", "321,383", "320,370", "320,360", "320,350", "320,347", "320,343", "321,342", "321,341", "321,340", "321,339", "322,336", "323,332", "325,327", "326,326", "326,325", "326,324", "326,323", "327,322", "328,321", "329,320", "334,317", "334,316", "335,315", "335,314", "336,313", "340,312", "341,311", "345,310", "345,309", "346,308", "347,308", "348,307", "355,306", "363,303", "372,300", "383,297", "392,294", "401,293", "406,290", "411,289", "412,288", "413,288", "414,288", "415,288", "420,287", "424,287", "429,286", "435,286", "441,285", "446,284", "447,284", "451,283", "452,283", "456,283", "457,283", "458,283", "459,283", "460,283", "461,283", "462,283", "463,283", "464,283", "471,283", "477,283", "482,283", "487,283", "487,283"]

//up
function GestureSimulation_0250(context, caseCode) {
    const logTag = LOG_PREFIX + caseCode
    let gesturePath = getGesturePath(MS_500, up)
    gestureInjectCallback1(logTag, context, gesturePath, caseCode)
}

//up
function GestureSimulation_0260(context, caseCode) {
    const logTag = LOG_PREFIX + caseCode
    let gesturePath = getGesturePath(MS_500, up)
    gestureInjectPromise1(logTag, context, gesturePath, caseCode)
}

//upThenLeft
function GestureSimulation_0270(context, caseCode) {
    const logTag = LOG_PREFIX + caseCode
    let gesturePath = getGesturePath(MS_800, upThenLeft)
    gestureInjectCallback1(logTag, context, gesturePath, caseCode)
}

//upThenLeft
function GestureSimulation_0280(context, caseCode) {
    const logTag = LOG_PREFIX + caseCode
    let gesturePath = getGesturePath(MS_800, upThenLeft)
    gestureInjectPromise1(logTag, context, gesturePath, caseCode)
}

//upThenRight
function GestureSimulation_0290(context, caseCode) {
    const logTag = LOG_PREFIX + caseCode
    let gesturePath = getGesturePath(MS_800, upThenRight)
    gestureInjectCallback1(logTag, context, gesturePath, caseCode)
}

//upThenRight
function GestureSimulation_0300(context, caseCode) {
    const logTag = LOG_PREFIX + caseCode
    let gesturePath = getGesturePath(MS_800, upThenRight)
    gestureInjectPromise1(logTag, context, gesturePath, caseCode)
}

//upThenDown
function GestureSimulation_0310(context, caseCode) {
    const logTag = LOG_PREFIX + caseCode
    let gesturePath = getGesturePath(MS_800, upThenDown)
    gestureInjectCallback1(logTag, context, gesturePath, caseCode)
}

//upThenDown
function GestureSimulation_0320(context, caseCode) {
    const logTag = LOG_PREFIX + caseCode
    let gesturePath = getGesturePath(MS_800, upThenDown)
    gestureInjectPromise1(logTag, context, gesturePath, caseCode)
}

let down = ["372,271", "372,273", "372,284", "373,295", "374,298", "378,310", "378,314", "379,327", "380,331", "381,346", "381,356", "381,367", "381,377", "381,381", "381,391", "381,394", "381,404", "381,407", "381,419", "381,429", "381,433", "380,445", "380,446", "379,456", "378,460", "377,475", "377,479", "377,490", "377,491", "377,494", "377,495", "377,496", "377,499", "376,503", "376,506", "375,509", "375,511", "375,512", "375,513", "375,513"]
let downThenUp = ["325,309", "325,312", "326,329", "332,349", "333,367", "334,386", "335,405", "340,443", "345,461", "346,477", "350,493", "351,509", "355,524", "356,539", "357,551", "358,563", "362,566", "362,576", "363,576", "364,572", "368,559", "369,549", "373,536", "373,531", "374,518", "374,515", "374,504", "374,500", "374,489", "374,486", "374,482", "374,478", "374,470", "374,466", "374,462", "374,459", "374,458", "374,457", "374,454", "374,450", "374,443", "374,442", "374,441", "374,440", "374,439", "374,438", "374,437", "374,434", "374,430", "375,425", "375,421", "375,418", "375,417", "375,416", "375,415", "375,412", "375,409", "375,406", "375,403", "375,402", "375,401", "375,400", "375,399", "375,398", "375,397", "375,397"]
let downThenLeft = ["363,267", "363,270", "363,286", "364,301", "368,314", "369,326", "370,338", "371,349", "375,361", "375,371", "375,383", "375,406", "375,417", "375,428", "375,439", "374,449", "373,460", "373,464", "372,476", "371,479", "371,489", "370,491", "370,494", "369,497", "368,509", "366,513", "362,526", "360,529", "355,533", "353,543", "351,543", "349,545", "342,548", "332,551", "318,554", "305,557", "290,560", "276,563", "263,565", "254,566", "246,567", "242,567", "238,567", "237,568", "236,568", "235,568", "234,568", "233,568", "233,568"]
let downThenRight = ["331,286", "331,288", "331,298", "332,302", "333,313", "334,316", "335,330", "336,341", "338,362", "338,374", "338,386", "338,398", "337,402", "336,413", "335,416", "334,427", "333,431", "332,443", "332,447", "331,459", "331,473", "331,476", "331,480", "331,490", "331,493", "331,497", "331,507", "332,508", "332,511", "333,515", "334,519", "335,529", "336,530", "341,534", "342,538", "343,542", "347,546", "348,550", "352,554", "353,560", "354,561", "358,563", "359,565", "367,568", "376,571", "385,574", "395,576", "402,577", "408,578", "416,578", "426,578", "435,578", "451,578", "459,578", "466,577", "472,576", "477,575", "478,574", "479,573", "480,572", "481,572", "481,571", "482,571", "495,570", "505,569", "514,566", "519,565", "520,564", "521,563", "522,563", "523,563", "523,563"]

//down
function GestureSimulation_0330(context, caseCode) {
    const logTag = LOG_PREFIX + caseCode
    let gesturePath = getGesturePath(MS_500, down)
    gestureInjectCallback1(logTag, context, gesturePath, caseCode)
}

//down
function GestureSimulation_0340(context, caseCode) {
    const logTag = LOG_PREFIX + caseCode
    let gesturePath = getGesturePath(MS_500, down)
    gestureInjectPromise1(logTag, context, gesturePath, caseCode)
}

//downThenLeft
function GestureSimulation_0350(context, caseCode) {
    const logTag = LOG_PREFIX + caseCode
    let gesturePath = getGesturePath(MS_800, downThenLeft)
    gestureInjectCallback1(logTag, context, gesturePath, caseCode)
}

//downThenLeft
function GestureSimulation_0360(context, caseCode) {
    const logTag = LOG_PREFIX + caseCode
    let gesturePath = getGesturePath(MS_800, downThenLeft)
    gestureInjectPromise1(logTag, context, gesturePath, caseCode)
}

//downThenRight
function GestureSimulation_0370(context, caseCode) {
    const logTag = LOG_PREFIX + caseCode
    let gesturePath = getGesturePath(MS_800, downThenRight)
    gestureInjectCallback1(logTag, context, gesturePath, caseCode)
}

//downThenRight
function GestureSimulation_0380(context, caseCode) {
    const logTag = LOG_PREFIX + caseCode
    let gesturePath = getGesturePath(MS_800, downThenRight)
    gestureInjectPromise1(logTag, context, gesturePath, caseCode)
}

//downThenUp
function GestureSimulation_0390(context, caseCode) {
    const logTag = LOG_PREFIX + caseCode
    let gesturePath = getGesturePath(MS_800, downThenUp)
    gestureInjectCallback1(logTag, context, gesturePath, caseCode)
}

//downThenUp
function GestureSimulation_0400(context, caseCode) {
    const logTag = LOG_PREFIX + caseCode
    let gesturePath = getGesturePath(MS_800, downThenUp)
    gestureInjectPromise1(logTag, context, gesturePath, caseCode)
}

//up
function GestureSimulation_0410(context, caseCode) {
    const logTag = LOG_PREFIX + caseCode
    let gesturePath = getGesturePath(MS_500, up)
    gestureInjectCallback1(logTag, context, gesturePath, caseCode)
}

//up
function GestureSimulation_0420(context, caseCode) {
    const logTag = LOG_PREFIX + caseCode
    let gesturePath = getGesturePath(MS_500, up)
    gestureInjectPromise1(logTag, context, gesturePath, caseCode)
}

function gestureInjectCallback1(logTag, context, gesturePath, caseCode) {
    try {
        context.injectGesture(gesturePath, (data) => {
            console.info(logTag + "injectGesture Callback res: " + JSON.stringify(data))
            var commonEventPublishData = { data: caseCode, parameters: { res: data.code === 0 } }
            publishEvent(commonEventPublishData)
        })
    } catch (e) {
        console.info(logTag + " injectGesture Callback Exception: " + JSON.stringify(e.message))
        return
    }
}

function gestureInjectPromise1(logTag, context, gesturePath, caseCode) {
    try {
        context.injectGesture(gesturePath)
            .then(() => {
                console.info(logTag + "injectGesture Promise success")
                var commonEventPublishData = { data: caseCode, parameters: { res: true } }
                publishEvent(commonEventPublishData)
            })
            .catch((err) => {
                console.info(logTag + "injectGesture Promise err=" + JSON.stringify(err))
                var commonEventPublishData = { data: caseCode, parameters: { res: false } }
                publishEvent(commonEventPublishData)
            })
    } catch (e) {
        console.info(LOG_PREFIX + " injectGesture Promise Exception: " + JSON.stringify(e.message))
        return
    }
}


function publishEvent(commonEventPublishData) {
    console.info(LOG_PREFIX + 'publishEvent data : ' + JSON.stringify(commonEventPublishData))
    try {
        commonEvent.publish(EVENT_NAME_BACK, commonEventPublishData, (err, data) => {
            if (err && err.code != 0) {
                console.info(LOG_PREFIX + 'failed to publish because ' + JSON.stringify(err))
                return
            }
            console.info(LOG_PREFIX + 'success data : ' + JSON.stringify(data))
        })
    } catch (e) {
        console.info(LOG_PREFIX + '[publishEvent]  error' + e.message)
        return
    }
}

export default ServiceExtAbility