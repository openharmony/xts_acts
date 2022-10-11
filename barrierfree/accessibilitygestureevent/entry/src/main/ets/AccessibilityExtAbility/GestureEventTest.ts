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
import { GesturePath } from '@ohos.accessibility.GesturePath';
import { GesturePoint } from '@ohos.accessibility.GesturePoint';

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
        let gesturePath = new GesturePath(100);
        switch (caseName) {
            case 'AccessibilityGestureEventTest_0100'://'left'
                console.info('GestureEventTest processCase left');
                gesturePath.points.push(new GesturePoint(676, 735),
                                        new GesturePoint(567, 729),
                                        new GesturePoint(444, 719),
                                        new GesturePoint(255, 714),
                                        new GesturePoint(153, 715),
                                        new GesturePoint(15, 729));
                this.gestureInject(caseName, gesturePath);
                break;
            case 'AccessibilityGestureEventTest_0200'://'leftThenRight'
                console.info('GestureEventTest processCase leftThenRight');
                gesturePath.points.push(new GesturePoint(685, 798),
                                        new GesturePoint(575, 792),
                                        new GesturePoint(446, 785),
                                        new GesturePoint(285, 784),
                                        new GesturePoint(206, 785),
                                        new GesturePoint(87, 787),
                                        new GesturePoint(401, 772),
                                        new GesturePoint(535, 786),
                                        new GesturePoint(714, 806));
                this.gestureInject(caseName, gesturePath);
                break;
            case 'AccessibilityGestureEventTest_0300'://'leftThenUp'
                console.info('GestureEventTest processCase leftThenUp');
                gesturePath.points.push(new GesturePoint(652, 903),
                                        new GesturePoint(570, 905),
                                        new GesturePoint(460, 920),
                                        new GesturePoint(280, 737),
                                        new GesturePoint(281, 555),
                                        new GesturePoint(285, 333),
                                        new GesturePoint(284, 116));
                this.gestureInject(caseName, gesturePath);
                break;
            case 'AccessibilityGestureEventTest_0400'://'leftThenDown'
                console.info('GestureEventTest processCase leftThenDown');
                gesturePath.points.push(new GesturePoint(583, 520),
                                        new GesturePoint(468, 485),
                                        new GesturePoint(377, 456),
                                        new GesturePoint(289, 435),
                                        new GesturePoint(283, 626),
                                        new GesturePoint(308, 836),
                                        new GesturePoint(335, 1108));
                this.gestureInject(caseName, gesturePath);
                break;
            case 'AccessibilityGestureEventTest_0500'://'right'
                console.info('GestureEventTest processCase right');
                gesturePath.points.push(new GesturePoint(77, 589),
                                        new GesturePoint(185, 589),
                                        new GesturePoint(318, 589),
                                        new GesturePoint(499, 589),
                                        new GesturePoint(630, 588));
                this.gestureInject(caseName, gesturePath);
                break;
            case 'AccessibilityGestureEventTest_0600'://'rightThenLeft'
                console.info('GestureEventTest processCase rightThenLeft');
                gesturePath.points.push(new GesturePoint(174, 731),
                                        new GesturePoint(251, 743),
                                        new GesturePoint(393, 772),
                                        new GesturePoint(673, 817),
                                        new GesturePoint(591, 805),
                                        new GesturePoint(511, 791),
                                        new GesturePoint(423, 779),
                                        new GesturePoint(333, 768),
                                        new GesturePoint(244, 764),
                                        new GesturePoint(167, 759),
                                        new GesturePoint(71, 755));
                this.gestureInject(caseName, gesturePath);
                break;
            case 'AccessibilityGestureEventTest_0700'://'rightThenUp'
                console.info('GestureEventTest processCase rightThenUp');
                gesturePath.points.push(new GesturePoint(117, 950),
                                        new GesturePoint(216, 950),
                                        new GesturePoint(311, 950),
                                        new GesturePoint(438, 933),
                                        new GesturePoint(491, 791),
                                        new GesturePoint(478, 622),
                                        new GesturePoint(471, 473),
                                        new GesturePoint(464, 320),
                                        new GesturePoint(458, 186));
                this.gestureInject(caseName, gesturePath);
                break;
            case 'AccessibilityGestureEventTest_0800'://'rightThenDown'
                console.info('GestureEventTest processCase rightThenDown');
                gesturePath.points.push(new GesturePoint(204, 501),
                                        new GesturePoint(307, 486),
                                        new GesturePoint(422, 478),
                                        new GesturePoint(547, 604),
                                        new GesturePoint(440, 771),
                                        new GesturePoint(348, 906));
                this.gestureInject(caseName, gesturePath);
                break;
            case 'AccessibilityGestureEventTest_0900'://'up'
                console.info('GestureEventTest processCase up');
                gesturePath.points.push(new GesturePoint(372, 1053),
                                        new GesturePoint(355, 873),
                                        new GesturePoint(320, 558),
                                        new GesturePoint(296, 314),
                                        new GesturePoint(285, 163));
                this.gestureInject(caseName, gesturePath);
                break;
            case 'AccessibilityGestureEventTest_1000'://'upThenLeft'
                console.info('GestureEventTest processCase upThenLeft');
                gesturePath.points.push(new GesturePoint(437, 1139),
                                        new GesturePoint(437, 985),
                                        new GesturePoint(453, 739),
                                        new GesturePoint(466, 591),
                                        new GesturePoint(483, 455),
                                        new GesturePoint(489, 321),
                                        new GesturePoint(383, 274),
                                        new GesturePoint(258, 273),
                                        new GesturePoint(179, 276),
                                        new GesturePoint(102, 286),
                                        new GesturePoint(3, 298));
                this.gestureInject(caseName, gesturePath);
                break;
            case 'AccessibilityGestureEventTest_1100'://'upThenRight'
                console.info('GestureEventTest processCase upThenRight');
                gesturePath.points.push(new GesturePoint(332, 1143),
                                        new GesturePoint(322, 973),
                                        new GesturePoint(300, 779),
                                        new GesturePoint(276, 627),
                                        new GesturePoint(259, 496),
                                        new GesturePoint(375, 406),
                                        new GesturePoint(468, 409),
                                        new GesturePoint(704, 436));
                this.gestureInject(caseName, gesturePath);
                break;
            case 'AccessibilityGestureEventTest_1200'://'upThenDown' 
                console.info('GestureEventTest processCase upThenDown');
                gesturePath.points.push(new GesturePoint(377, 1047),
                                        new GesturePoint(368, 863),
                                        new GesturePoint(355, 564),
                                        new GesturePoint(339, 353),
                                        new GesturePoint(331, 210),
                                        new GesturePoint(361, 409),
                                        new GesturePoint(375, 665),
                                        new GesturePoint(380, 824),
                                        new GesturePoint(386, 977),
                                        new GesturePoint(393, 1177));
                this.gestureInject(caseName, gesturePath);
                break;
            case 'AccessibilityGestureEventTest_1300'://'down'
                console.info('GestureEventTest processCase down');
                gesturePath.points.push(new GesturePoint(352, 250),
                                        new GesturePoint(371, 462),
                                        new GesturePoint(377, 828),
                                        new GesturePoint(378, 956),
                                        new GesturePoint(385, 1121));
                this.gestureInject(caseName, gesturePath);
                break;
            case 'AccessibilityGestureEventTest_1400'://'downThenLeft'
                console.info('GestureEventTest processCase downThenLeft');
                gesturePath.points.push(new GesturePoint(404, 177),
                                        new GesturePoint(406, 318),
                                        new GesturePoint(405, 459),
                                        new GesturePoint(415, 764),
                                        new GesturePoint(432, 910),
                                        new GesturePoint(335, 935),
                                        new GesturePoint(262, 934),
                                        new GesturePoint(182, 933),
                                        new GesturePoint(24, 929));
                this.gestureInject(caseName, gesturePath);
                break;
            case 'AccessibilityGestureEventTest_1500'://'downThenRight'
                console.info('GestureEventTest processCase downThenRight');
                gesturePath.points.push(new GesturePoint(317, 247),
                                        new GesturePoint(318, 393),
                                        new GesturePoint(299, 614),
                                        new GesturePoint(280, 766),
                                        new GesturePoint(278, 919),
                                        new GesturePoint(419, 961),
                                        new GesturePoint(502, 957),
                                        new GesturePoint(627, 939));
                this.gestureInject(caseName, gesturePath);
                break;
            case 'AccessibilityGestureEventTest_1600'://'downThenUp'
                console.info('GestureEventTest processCase downThenUp');
                gesturePath.points.push(new GesturePoint(321, 213),
                                        new GesturePoint(346, 407),
                                        new GesturePoint(354, 664),
                                        new GesturePoint(356, 833),
                                        new GesturePoint(358, 970),
                                        new GesturePoint(357, 738),
                                        new GesturePoint(349, 603),
                                        new GesturePoint(344, 450),
                                        new GesturePoint(342, 304),
                                        new GesturePoint(340, 115));
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