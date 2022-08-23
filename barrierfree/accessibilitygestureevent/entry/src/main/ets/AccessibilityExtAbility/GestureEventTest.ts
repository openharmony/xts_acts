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
import commonEvent from '@ohos.commonEvent';

export class GestureEventTest {
    private context = undefined;
    private subScriber = undefined;

    constructor(context) {
        this.context = context;
    }

    async init() {
        this.subScriber = await commonEvent.createSubscriber({events: ['caseExecute']});
        commonEvent.subscribe(this.subScriber, (err, data) => {
            console.info('GestureEventTest subscribe callback data:' + JSON.stringify(data));
            this.processCase(data.data);
        });
    }

    clear() {
        commonEvent.unsubscribe(this.subScriber);
        this.subScriber = undefined;
        this.context = undefined;
    }

    private async processCase(caseName) {
        console.info('GestureEventTest processCase start');
        let gesturePath = {};
        let gesturePos1 = {};
        let gesturePos2 = {};
        let gesturePos3 = {};
        let gesturePos4 = {};
        let gesturePos5 = {};
        let gesturePos6 = {};
        let gesturePos7 = {};
        let gesturePos8 = {};
        let gesturePos9 = {};
        let gesturePos10 = {};
        let gesturePos11 = {};
        switch (caseName) {
            case 'AccessibilityGestureEventTest_0100'://'left'
                console.info('GestureEventTest processCase left');
                gesturePos1 = {positionX: 676, positionY: 735};
                gesturePos2 = {positionX: 567, positionY: 729};
                gesturePos3 = {positionX: 444, positionY: 719};
                gesturePos4 = {positionX: 255, positionY: 714};
                gesturePos5 = {positionX: 153, positionY: 715};
                gesturePos6 = {positionX: 15, positionY: 729};
                gesturePath = {points: [gesturePos1, gesturePos2, gesturePos3, gesturePos4, gesturePos5, gesturePos6], durationTime: 100};
                this.gestureInject(caseName, gesturePath);
                break;
            case 'AccessibilityGestureEventTest_0200'://'leftThenRight'
                console.info('GestureEventTest processCase leftThenRight');
                gesturePos1 = {positionX: 685, positionY: 798};
                gesturePos2 = {positionX: 575, positionY: 792};
                gesturePos3 = {positionX: 446, positionY: 785};
                gesturePos4 = {positionX: 285, positionY: 784};
                gesturePos5 = {positionX: 206, positionY: 785};
                gesturePos6 = {positionX: 87, positionY: 787};
                gesturePos7 = {positionX: 401, positionY: 772};
                gesturePos8 = {positionX: 535, positionY: 786};
                gesturePos9 = {positionX: 714, positionY: 806};
                gesturePath = {points: [gesturePos1, gesturePos2, gesturePos3, gesturePos4, gesturePos5,
                                           gesturePos6, gesturePos7, gesturePos8, gesturePos9], durationTime: 100};
                this.gestureInject(caseName, gesturePath);
                break;
            case 'AccessibilityGestureEventTest_0300'://'leftThenUp'
            console.info('GestureEventTest processCase leftThenUp');
                gesturePos1 = {positionX: 652, positionY: 903};
                gesturePos2 = {positionX: 570, positionY: 905};
                gesturePos3 = {positionX: 460, positionY: 920};
                gesturePos4 = {positionX: 280, positionY: 737};
                gesturePos5 = {positionX: 281, positionY: 555};
                gesturePos6 = {positionX: 285, positionY: 333};
                gesturePos7 = {positionX: 284, positionY: 116};
                gesturePath = {points: [gesturePos1, gesturePos2, gesturePos3, gesturePos4, gesturePos5,
                                           gesturePos6, gesturePos7], durationTime: 100};
                this.gestureInject(caseName, gesturePath);
                break;
            case 'AccessibilityGestureEventTest_0400'://'leftThenDown'
            console.info('GestureEventTest processCase leftThenDown');
                gesturePos1 = {positionX: 583, positionY: 520};
                gesturePos2 = {positionX: 468, positionY: 485};
                gesturePos3 = {positionX: 377, positionY: 456};
                gesturePos4 = {positionX: 289, positionY: 435};
                gesturePos5 = {positionX: 283, positionY: 626};
                gesturePos6 = {positionX: 308, positionY: 836};
                gesturePos7 = {positionX: 335, positionY: 1108};
                gesturePath = {points: [gesturePos1, gesturePos2, gesturePos3, gesturePos4, gesturePos5,
                                           gesturePos6, gesturePos7], durationTime: 100};
                this.gestureInject(caseName, gesturePath);
                break;
            case 'AccessibilityGestureEventTest_0500'://'right'
            console.info('GestureEventTest processCase right');
                gesturePos1 = {positionX: 77, positionY: 589};
                gesturePos2 = {positionX: 185, positionY: 589};
                gesturePos3 = {positionX: 318, positionY: 589};
                gesturePos4 = {positionX: 499, positionY: 589};
                gesturePos5 = {positionX: 630, positionY: 588};
                gesturePath = {points: [gesturePos1, gesturePos2, gesturePos3, gesturePos4, gesturePos5], durationTime: 100};
                this.gestureInject(caseName, gesturePath);
                break;
            case 'AccessibilityGestureEventTest_0600'://'rightThenLeft'
            console.info('GestureEventTest processCase rightThenLeft');
                gesturePos1 = {positionX: 174, positionY: 731};
                gesturePos2 = {positionX: 251, positionY: 743};
                gesturePos3 = {positionX: 393, positionY: 772};
                gesturePos4 = {positionX: 673, positionY: 817};
                gesturePos5 = {positionX: 591, positionY: 805};
                gesturePos6 = {positionX: 511, positionY: 791};
                gesturePos7 = {positionX: 423, positionY: 779};
                gesturePos8 = {positionX: 333, positionY: 768};
                gesturePos9 = {positionX: 244, positionY: 764};
                gesturePos10 = {positionX: 167, positionY: 759};
                gesturePos11 = {positionX: 71, positionY: 755};
                gesturePath = {points: [gesturePos1, gesturePos2, gesturePos3, gesturePos4, gesturePos5,
                                           gesturePos6, gesturePos7, gesturePos8, gesturePos9, gesturePos10,
                                           gesturePos11], durationTime: 100};
                this.gestureInject(caseName, gesturePath);
                break;
            case 'AccessibilityGestureEventTest_0700'://'rightThenUp'
            console.info('GestureEventTest processCase rightThenUp');
                gesturePos1 = {positionX: 117, positionY: 950};
                gesturePos2 = {positionX: 216, positionY: 950};
                gesturePos3 = {positionX: 311, positionY: 950};
                gesturePos4 = {positionX: 438, positionY: 933};
                gesturePos5 = {positionX: 491, positionY: 791};
                gesturePos6 = {positionX: 478, positionY: 622};
                gesturePos7 = {positionX: 471, positionY: 473};
                gesturePos8 = {positionX: 464, positionY: 320};
                gesturePos9 = {positionX: 458, positionY: 186};
                gesturePath = {points: [gesturePos1, gesturePos2, gesturePos3, gesturePos4, gesturePos5,
                                           gesturePos6, gesturePos7, gesturePos8, gesturePos9], durationTime: 100};
                this.gestureInject(caseName, gesturePath);
                break;
            case 'AccessibilityGestureEventTest_0800'://'rightThenDown'
            console.info('GestureEventTest processCase rightThenDown');
                gesturePos1 = {positionX: 204, positionY: 501};
                gesturePos2 = {positionX: 307, positionY: 486};
                gesturePos3 = {positionX: 422, positionY: 478};
                gesturePos4 = {positionX: 547, positionY: 604};
                gesturePos5 = {positionX: 440, positionY: 771};
                gesturePos6 = {positionX: 348, positionY: 906};
                gesturePath = {points: [gesturePos1, gesturePos2, gesturePos3, gesturePos4, gesturePos5,
                                           gesturePos6], durationTime: 100};
                this.gestureInject(caseName, gesturePath);
                break;
            case 'AccessibilityGestureEventTest_0900'://'up'
            console.info('GestureEventTest processCase up');
                gesturePos1 = {positionX: 372, positionY: 1053};
                gesturePos2 = {positionX: 355, positionY: 873};
                gesturePos3 = {positionX: 320, positionY: 558};
                gesturePos4 = {positionX: 296, positionY: 314};
                gesturePos5 = {positionX: 285, positionY: 163};
                gesturePath = {points: [gesturePos1, gesturePos2, gesturePos3, gesturePos4, gesturePos5], durationTime: 100};
                this.gestureInject(caseName, gesturePath);
                break;
            case 'AccessibilityGestureEventTest_1000'://'upThenLeft'
            console.info('GestureEventTest processCase upThenLeft');
                gesturePos1 = {positionX: 437, positionY: 1139};
                gesturePos2 = {positionX: 437, positionY: 985};
                gesturePos3 = {positionX: 453, positionY: 739};
                gesturePos4 = {positionX: 466, positionY: 591};
                gesturePos5 = {positionX: 483, positionY: 455};
                gesturePos6 = {positionX: 489, positionY: 321};
                gesturePos7 = {positionX: 383, positionY: 274};
                gesturePos8 = {positionX: 258, positionY: 273};
                gesturePos9 = {positionX: 179, positionY: 276};
                gesturePos10 = {positionX: 102, positionY: 286};
                gesturePos11 = {positionX: 3, positionY: 298};
                gesturePath = {points: [gesturePos1, gesturePos2, gesturePos3, gesturePos4, gesturePos5,
                                           gesturePos6, gesturePos7, gesturePos8, gesturePos9, gesturePos10,
                                           gesturePos11], durationTime: 100};
                this.gestureInject(caseName, gesturePath);
                break;
            case 'AccessibilityGestureEventTest_1100'://'upThenRight'
            console.info('GestureEventTest processCase upThenRight');
                gesturePos1 = {positionX: 332, positionY: 1143};
                gesturePos2 = {positionX: 322, positionY: 973};
                gesturePos3 = {positionX: 300, positionY: 779};
                gesturePos4 = {positionX: 276, positionY: 627};
                gesturePos5 = {positionX: 259, positionY: 496};
                gesturePos6 = {positionX: 375, positionY: 406};
                gesturePos7 = {positionX: 468, positionY: 409};
                gesturePos8 = {positionX: 704, positionY: 436};
                gesturePath = {points: [gesturePos1, gesturePos2, gesturePos3, gesturePos4, gesturePos5,
                                           gesturePos6, gesturePos7, gesturePos8], durationTime: 100};
                this.gestureInject(caseName, gesturePath);
                break;
            case 'AccessibilityGestureEventTest_1200'://'upThenDown' 
            console.info('GestureEventTest processCase upThenDown');
                gesturePos1 = {positionX: 377, positionY: 1047};
                gesturePos2 = {positionX: 368, positionY: 863};
                gesturePos3 = {positionX: 355, positionY: 564};
                gesturePos4 = {positionX: 339, positionY: 353};
                gesturePos5 = {positionX: 331, positionY: 210};
                gesturePos6 = {positionX: 361, positionY: 409};
                gesturePos7 = {positionX: 375, positionY: 665};
                gesturePos8 = {positionX: 380, positionY: 824};
                gesturePos9 = {positionX: 386, positionY: 977};
                gesturePos10 = {positionX: 393, positionY: 1177};
                gesturePath = {points: [gesturePos1, gesturePos2, gesturePos3, gesturePos4, gesturePos5,
                                           gesturePos6, gesturePos7, gesturePos8, gesturePos9, gesturePos10],
                               durationTime: 100};
                this.gestureInject(caseName, gesturePath);
                break;
            case 'AccessibilityGestureEventTest_1300'://'down'
            console.info('GestureEventTest processCase down');
                gesturePos1 = {positionX: 352, positionY: 250};
                gesturePos2 = {positionX: 371, positionY: 462};
                gesturePos3 = {positionX: 377, positionY: 828};
                gesturePos4 = {positionX: 378, positionY: 956};
                gesturePos5 = {positionX: 385, positionY: 1121};
                gesturePath = {points: [gesturePos1, gesturePos2, gesturePos3, gesturePos4, gesturePos5], durationTime: 100};
                this.gestureInject(caseName, gesturePath);
                break;
            case 'AccessibilityGestureEventTest_1400'://'downThenLeft'
            console.info('GestureEventTest processCase downThenLeft');
                gesturePos1 = {positionX: 404, positionY: 177};
                gesturePos2 = {positionX: 406, positionY: 318};
                gesturePos3 = {positionX: 405, positionY: 459};
                gesturePos4 = {positionX: 415, positionY: 764};
                gesturePos5 = {positionX: 432, positionY: 910};
                gesturePos6 = {positionX: 335, positionY: 935};
                gesturePos7 = {positionX: 262, positionY: 934};
                gesturePos8 = {positionX: 182, positionY: 933};
                gesturePos9 = {positionX: 24, positionY: 929};
                gesturePath = {points: [gesturePos1, gesturePos2, gesturePos3, gesturePos4, gesturePos5,
                                           gesturePos6, gesturePos7, gesturePos8, gesturePos9], durationTime: 100};
                this.gestureInject(caseName, gesturePath);
                break;
            case 'AccessibilityGestureEventTest_1500'://'downThenRight'
            console.info('GestureEventTest processCase downThenRight');
                gesturePos1 = {positionX: 317, positionY: 247};
                gesturePos2 = {positionX: 318, positionY: 393};
                gesturePos3 = {positionX: 299, positionY: 614};
                gesturePos4 = {positionX: 280, positionY: 766};
                gesturePos5 = {positionX: 278, positionY: 919};
                gesturePos6 = {positionX: 419, positionY: 961};
                gesturePos7 = {positionX: 502, positionY: 957};
                gesturePos8 = {positionX: 627, positionY: 939};
                gesturePath = {points: [gesturePos1, gesturePos2, gesturePos3, gesturePos4, gesturePos5,
                                           gesturePos6, gesturePos7, gesturePos8], durationTime: 100};
                this.gestureInject(caseName, gesturePath);
                break;
            case 'AccessibilityGestureEventTest_1600'://'downThenUp'
            console.info('GestureEventTest processCase downThenUp');
                gesturePos1 = {positionX: 321, positionY: 213};
                gesturePos2 = {positionX: 346, positionY: 407};
                gesturePos3 = {positionX: 354, positionY: 664};
                gesturePos4 = {positionX: 356, positionY: 833};
                gesturePos5 = {positionX: 358, positionY: 970};
                gesturePos6 = {positionX: 357, positionY: 738};
                gesturePos7 = {positionX: 349, positionY: 603};
                gesturePos8 = {positionX: 344, positionY: 450};
                gesturePos9 = {positionX: 342, positionY: 304};
                gesturePos10 = {positionX: 340, positionY: 115};
                gesturePath = {points: [gesturePos1, gesturePos2, gesturePos3, gesturePos4, gesturePos5,
                                           gesturePos6, gesturePos7, gesturePos8, gesturePos9, gesturePos10],
                               durationTime: 100};
                this.gestureInject(caseName, gesturePath);
                break;
            default:
                console.warn('GestureEventTest processCase unknown!!!!!!!!!!');
                break;
        }
    }

    private async gestureInject(caseName: string, gesturePath: object) {
        await this.context?.injectGesture(gesturePath);
        console.info('GestureEventTest processCase: ' + caseName);
    }
}