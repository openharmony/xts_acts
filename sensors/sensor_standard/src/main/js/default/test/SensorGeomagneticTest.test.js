/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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
import sensor from '@ohos.sensor'

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'deccjsunit/index'

describe("SensorJsTest", function () {
    beforeAll(function () {

        /*
         * @tc.setup: setup invoked before all testcases
         */
        console.info('beforeAll caled')
    })

    afterAll(function () {

        /*
         * @tc.teardown: teardown invoked after all testcases
         */
        console.info('afterAll caled')
    })

    beforeEach(function () {

        /*
         * @tc.setup: setup invoked before each testcases
         */
        console.info('beforeEach caled')
    })

    afterEach(function () {

        /*
         * @tc.teardown: teardown invoked after each testcases
         */
        console.info('afterEach caled')
    })

    let GEOMAGNETIC_COMPONENT_YEAR_RESULT = [
        [6570.3935546875, -146.3289337158203, 54606.0078125, -1.2758207321166992, 83.13726043701172, 6572.02294921875,
            55000.0703125],
        [6554.17041015625, -87.19947052001953, 54649.078125, -0.7622424364089966, 83.16046905517578, 6554.75048828125,
            55040.7734375],
        [6537.99169921875, -28.231582641601562, 54692.02734375, -0.24740631878376007, 83.18303680419922,
            6538.052734375, 55081.4296875],
        [6521.81201171875, 30.73670768737793, 54734.97265625, 0.2700277864933014, 83.20502471923828, 6521.88427734375,
            55122.15625],
        [6505.6328125, 89.70511627197266, 54777.90625, 0.7899921536445618, 83.22642517089844, 6506.2509765625,
            55162.9453125]]

    let GEOMAGNETIC_COMPONENT_COORDINATES_RESULT = [
        [6570.3935546875, -146.3289337158203, 54606.0078125, -1.2758207321166992, 83.13726043701172, 6572.02294921875,
            55000.0703125],
        [39624.28125, 109.8766098022461, -10932.4638671875, 0.15887857973575592, -15.424291610717773, 39624.43359375,
            41104.921875],
        [37636.72265625, 104.90892791748047, -10474.810546875, 0.15970633924007416, -15.552550315856934, 37636.8671875,
            39067.3203125],
        [5940.583984375, 15772.0927734375, -52480.7578125, 69.36103820800781, -72.19599914550781, 16853.765625,
            55120.58984375],
        [5744.87255859375, 14799.48046875, -49969.40234375, 68.78474426269531, -72.37483215332031, 15875.3955078125,
            52430.61328125]]

    let GEOMAGNETIC_COORDINATES = [[80, 0, 0],
    [0, 120, 0],
    [0, 120, 100000],
    [-80, 240, 0],
    [-80, 240, 100000]]

    let timeMillis = [1580486400000, 1612108800000, 1643644800000, 1675180800000, 1706716800000]

    /**
    * @tc.number: Geomagentic_Sensor_Test0010
    * @tc.name: SensorGeomagenticTest001
    * @tc.desc: Verification results of the incorrect parameters of the test interface.
    */
    it('Geomagentic_Sensor_Test0010', 0, async function (done) {
        console.info("---------------------------Geomagentic_Sensor_Test0010----------------------------------");
        let promiseArray = []
        for (let i = 0; i < timeMillis.length; i++) {
            promiseArray.push(new Promise((resolve, reject) => {
                let j = i
                sensor.getGeomagneticField({ 'latitude': 80, 'longitude': 0, 'altitude': 0 }, timeMillis[j],
                    (error, data) => {
                        if (error) {
                            console.info('SensorGeomagenticTest0010 failed');
                            expect(false).assertTrue();
                            setTimeout((err) => {
                                reject(err)
                            }, 500)
                        } else {
                            console.info('SensorGeomagenticTest0010 success x: ' + data.x + ',y: '
                                + data.y + ',z: ' + data.z + ',geomagneticDip: ' + data.geomagneticDip
                                + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: '
                                + data.levelIntensity + ',totalIntensity: ' + data.totalIntensity)
                            expect(data.x).assertEqual(GEOMAGNETIC_COMPONENT_YEAR_RESULT[j][0])
                            expect(data.y).assertEqual(GEOMAGNETIC_COMPONENT_YEAR_RESULT[j][1])
                            expect(data.z).assertEqual(GEOMAGNETIC_COMPONENT_YEAR_RESULT[j][2])
                            expect(data.deflectionAngle).assertEqual(GEOMAGNETIC_COMPONENT_YEAR_RESULT[j][3])
                            expect(data.geomagneticDip).assertEqual(GEOMAGNETIC_COMPONENT_YEAR_RESULT[j][4])
                            expect(data.levelIntensity).assertEqual(GEOMAGNETIC_COMPONENT_YEAR_RESULT[j][5])
                            expect(data.totalIntensity).assertEqual(GEOMAGNETIC_COMPONENT_YEAR_RESULT[j][6])
                            setTimeout(() => {
                                resolve()
                            }, 500)
                        }
                    })
            }))
        }
        Promise.all(promiseArray).then(done)
    })

    /**
     * @tc.number: Geomagentic_Sensor_Test0020
     * @tc.name: SensorGeomagenticTest002
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     */
    it('Geomagentic_Sensor_Test0020', 0, async function (done) {
        console.info("---------------------------Geomagentic_Sensor_Test0020----------------------------------");
        let promiseArray = []
        for (let i = 0; i < GEOMAGNETIC_COORDINATES.length; i++) {
            promiseArray.push(new Promise((resolve, reject) => {
                let j = i
                sensor.getGeomagneticField({
                    'latitude': GEOMAGNETIC_COORDINATES[j][0],
                    'longitude': GEOMAGNETIC_COORDINATES[j][1], 'altitude': GEOMAGNETIC_COORDINATES[j][2]
                }, timeMillis[0], (error, data) => {
                    if (error) {
                        console.info('SensorGeomagenticTest002 failed');
                        expect(false).assertTrue();
                        setTimeout((err) => {
                            reject(err)
                        }, 500)
                    } else {
                        console.info('SensorGeomagenticTest002 success x: ' + data.x + ',y: ' + data.y + ',z: '
                            + data.z + ',geomagneticDip: ' + data.geomagneticDip
                            + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
                            + ',totalIntensity: ' + data.totalIntensity)
                        expect(data.x).assertEqual(GEOMAGNETIC_COMPONENT_COORDINATES_RESULT[j][0])
                        expect(data.y).assertEqual(GEOMAGNETIC_COMPONENT_COORDINATES_RESULT[j][1])
                        expect(data.z).assertEqual(GEOMAGNETIC_COMPONENT_COORDINATES_RESULT[j][2])
                        expect(data.deflectionAngle).assertEqual(GEOMAGNETIC_COMPONENT_COORDINATES_RESULT[j][3])
                        expect(data.geomagneticDip).assertEqual(GEOMAGNETIC_COMPONENT_COORDINATES_RESULT[j][4])
                        expect(data.levelIntensity).assertEqual(GEOMAGNETIC_COMPONENT_COORDINATES_RESULT[j][5])
                        expect(data.totalIntensity).assertEqual(GEOMAGNETIC_COMPONENT_COORDINATES_RESULT[j][6])
                        setTimeout(() => {
                            resolve()
                        }, 500)
                    }
                })
            }))
        }
        Promise.all(promiseArray).then(done)
    })

    /**
     * @tc.number: Geomagentic_Sensor_Test0030
     * @tc.name: SensorGeomagenticTest003
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     */
    it('Geomagentic_Sensor_Test0030', 0, async function (done) {
        console.info("---------------------------Geomagentic_Sensor_Test0030----------------------------------");
        let geomagneticComponent = [27779.234375, -6214.9794921875, -14924.6611328125, -27.667943954467773,
            -12.610970497131348, 28465.9765625, 32141.2109375]
        sensor.getGeomagneticField({ 'latitude': 0, 'longitude': 0, 'altitude': 0 }, Number.MAX_VALUE,
            (error, data) => {
                if (error) {
                    console.info('SensorGeomagenticTest003 failed');
                    expect(false).assertTrue();
                } else {
                    console.info('SensorGeomagenticTest003 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z
                        + ',geomagneticDip: ' + data.geomagneticDip
                        + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
                        + ',totalIntensity: ' + data.totalIntensity)
                    expect(data.x).assertEqual(geomagneticComponent[0])
                    expect(data.y).assertEqual(geomagneticComponent[1])
                    expect(data.z).assertEqual(geomagneticComponent[2])
                    expect(data.geomagneticDip).assertEqual(geomagneticComponent[3])
                    expect(data.deflectionAngle).assertEqual(geomagneticComponent[4])
                    expect(data.levelIntensity).assertEqual(geomagneticComponent[5])
                    expect(data.totalIntensity).assertEqual(geomagneticComponent[6])
                }
                setTimeout(() => {
                    done()
                }, 500)
            })
    })

    /**
     * @tc.number: Geomagentic_Sensor_Test0040
     * @tc.name: SensorGeomagenticTest004
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     */
    it('Geomagentic_Sensor_Test0040', 0, async function (done) {
        console.info("---------------------------Geomagentic_Sensor_Test0040----------------------------------");
        let geomagneticComponent = [27779.234375, -6214.9794921875, -14924.6611328125, -27.667943954467773,
            -12.610970497131348, 28465.9765625, 32141.2109375]
        sensor.getGeomagneticField({ 'latitude': 0, 'longitude': 0, 'altitude': 0 }, Number.MIN_VALUE,
            (error, data) => {
                if (error) {
                    console.info('SensorGeomagenticTest004 failed');
                    expect(false).assertTrue();
                } else {
                    console.info('SensorGeomagenticTest004 success x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z
                        + ',geomagneticDip: ' + data.geomagneticDip
                        + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
                        + ',totalIntensity: ' + data.totalIntensity)
                    expect(data.x).assertEqual(geomagneticComponent[0])
                    expect(data.y).assertEqual(geomagneticComponent[1])
                    expect(data.z).assertEqual(geomagneticComponent[2])
                    expect(data.geomagneticDip).assertEqual(geomagneticComponent[3])
                    expect(data.deflectionAngle).assertEqual(geomagneticComponent[4])
                    expect(data.levelIntensity).assertEqual(geomagneticComponent[5])
                    expect(data.totalIntensity).assertEqual(geomagneticComponent[6])
                }
                setTimeout(() => {
                    done()
                }, 500)
            })
    })

    /**
     * @tc.number: Geomagentic_Sensor_Test0050
     * @tc.name: SensorGeomagenticTest005
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     */
    it('Geomagentic_Sensor_Test0050', 0, async function (done) {
        console.info("---------------------------Geomagentic_Sensor_Test0050----------------------------------");
        let geomagneticComponent = [1824.141845703125, 116.58167266845703, 56727.7734375, 88.15447235107422,
            3.6568238735198975, 1827.8634033203125, 56757.21484375]
        sensor.getGeomagneticField({ 'latitude': Number.MAX_VALUE, 'longitude': 0, 'altitude': 0 },
            timeMillis[0], (error, data) => {
                if (error) {
                    console.info('SensorGeomagenticTest005 failed');
                    expect(false).assertTrue();
                } else {
                    console.info('SensorGeomagenticTest005 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z
                        + ',geomagneticDip: ' + data.geomagneticDip
                        + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
                        + ',totalIntensity: ' + data.totalIntensity)
                    expect(data.x).assertEqual(geomagneticComponent[0])
                    expect(data.y).assertEqual(geomagneticComponent[1])
                    expect(data.z).assertEqual(geomagneticComponent[2])
                    expect(data.geomagneticDip).assertEqual(geomagneticComponent[3])
                    expect(data.deflectionAngle).assertEqual(geomagneticComponent[4])
                    expect(data.levelIntensity).assertEqual(geomagneticComponent[5])
                    expect(data.totalIntensity).assertEqual(geomagneticComponent[6])
                }
                setTimeout(() => {
                    done()
                }, 500)
            })
    })

    /**
     * @tc.number: Geomagentic_Sensor_Test0060
     * @tc.name: SensorGeomagenticTest006
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     */
    it('Geomagentic_Sensor_Test0060', 0, async function (done) {
        console.info("---------------------------Geomagentic_Sensor_Test0060----------------------------------");
        let geomagneticComponent = [1824.141845703125, 116.58167266845703, 56727.7734375, 88.15447235107422,
            3.6568238735198975, 1827.8634033203125, 56757.21484375]
        sensor.getGeomagneticField({ 'latitude': Number.NaN, 'longitude': 0, 'altitude': 0 }, timeMillis[0],
            (error, data) => {
                if (error) {
                    console.info('SensorGeomagenticTest006 failed');
                    expect(false).assertTrue();
                } else {
                    console.info('SensorGeomagenticTest006 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z
                        + ',geomagneticDip: ' + data.geomagneticDip
                        + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
                        + ',totalIntensity: ' + data.totalIntensity)
                    expect(data.x).assertEqual(geomagneticComponent[0])
                    expect(data.y).assertEqual(geomagneticComponent[1])
                    expect(data.z).assertEqual(geomagneticComponent[2])
                    expect(data.geomagneticDip).assertEqual(geomagneticComponent[3])
                    expect(data.deflectionAngle).assertEqual(geomagneticComponent[4])
                    expect(data.levelIntensity).assertEqual(geomagneticComponent[5])
                    expect(data.totalIntensity).assertEqual(geomagneticComponent[6])
                }
                setTimeout(() => {
                    done()
                }, 500)
            })
    })

    /**
     * @tc.number: Geomagentic_Sensor_Test0070
     * @tc.name: SensorGeomagenticTest007
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     */
    it('Geomagentic_Sensor_Test0070', 0, async function (done) {
        console.info("---------------------------Geomagentic_Sensor_Test0070----------------------------------");
        let geomagneticComponent = [14425.57421875, -17156.767578125, -52023.21484375, -66.69005584716797,
            -49.94255447387695, 22415.4375, 56646.859375]
        sensor.getGeomagneticField({ 'latitude': Number.NEGATIVE_INFINITY, 'longitude': 0, 'altitude': 0 },
            timeMillis[0], (error, data) => {
                if (error) {
                    console.info('SensorGeomagenticTest007 failed');
                    expect(false).assertTrue();
                } else {
                    console.info('SensorGeomagenticTest007 success x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z
                        + ',geomagneticDip: ' + data.geomagneticDip
                        + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
                        + ',totalIntensity: ' + data.totalIntensity)
                    expect(data.x).assertEqual(geomagneticComponent[0])
                    expect(data.y).assertEqual(geomagneticComponent[1])
                    expect(data.z).assertEqual(geomagneticComponent[2])
                    expect(data.geomagneticDip).assertEqual(geomagneticComponent[3])
                    expect(data.deflectionAngle).assertEqual(geomagneticComponent[4])
                    expect(data.levelIntensity).assertEqual(geomagneticComponent[5])
                    expect(data.totalIntensity).assertEqual(geomagneticComponent[6])
                }
                setTimeout(() => {
                    done()
                }, 500)
            })
    })

    /**
     * @tc.number: Geomagentic_Sensor_Test0080
     * @tc.name: SensorGeomagenticTest008
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     */
    it('Geomagentic_Sensor_Test0080', 0, async function (done) {
        console.info("---------------------------Geomagentic_Sensor_Test0080----------------------------------");
        sensor.getGeomagneticField({ 'latitude': 0, 'longitude': Number.MAX_VALUE, 'altitude': 0 }, timeMillis[0],
            (error, data) => {
                if (error) {
                    console.info('SensorGeomagenticTest008 failed');
                    expect(false).assertTrue();
                } else {
                    console.info('SensorGeomagenticTest008 success x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z
                        + ',geomagneticDip: ' + data.geomagneticDip
                        + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
                        + ',totalIntensity: ' + data.totalIntensity)
                    expect(Number.isNaN(data.x) && Number.isNaN(data.y) && Number.isNaN(data.z)).assertTrue();
                }
                setTimeout(() => {
                    done()
                }, 500)
            })
    })

    /**
     * @tc.number: Geomagentic_Sensor_Test0090
     * @tc.name: SensorGeomagenticTest009
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     */
    it('Geomagentic_Sensor_Test0090', 0, async function (done) {
        console.info("---------------------------Geomagentic_Sensor_Test0090----------------------------------");
        sensor.getGeomagneticField({ 'latitude': 0, 'longitude': Number.NaN, 'altitude': 0 }, timeMillis[0],
            (error, data) => {
                if (error) {
                    console.info('SensorGeomagenticTest009 failed');
                    expect(false).assertTrue();
                } else {
                    console.info('SensorGeomagenticTest009 success x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z
                        + ',geomagneticDip: ' + data.geomagneticDip
                        + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
                        + ',totalIntensity: ' + data.totalIntensity)
                    expect(Number.isNaN(data.x) && Number.isNaN(data.y) && Number.isNaN(data.z)).assertTrue()
                }
                setTimeout(() => {
                    done()
                }, 500)
            })
    })

    /**
     * @tc.number: Geomagentic_Sensor_Test0100
     * @tc.name: SensorGeomagenticTest010
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     */
    it('Geomagentic_Sensor_Test0100', 0, async function (done) {
        console.info("---------------------------Geomagentic_Sensor_Test0100----------------------------------");
        sensor.getGeomagneticField({ 'latitude': 0, 'longitude': Number.NEGATIVE_INFINITY, 'altitude': 0 },
            timeMillis[0], (error, data) => {
                if (error) {
                    console.info('SensorGeomagenticTest010 failed');
                    expect(false).assertTrue();
                } else {
                    console.info('SensorGeomagenticTest010 success x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z
                        + ',geomagneticDip: ' + data.geomagneticDip
                        + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
                        + ',totalIntensity: ' + data.totalIntensity)
                    expect(Number.isNaN(data.x) && Number.isNaN(data.y) && Number.isNaN(data.z)).assertTrue()
                }
                setTimeout(() => {
                    done()
                }, 500)
            })
    })

    /**
     * @tc.number: Geomagentic_Sensor_Test0110
     * @tc.name: SensorGeomagenticTest011
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     */
    it('Geomagentic_Sensor_Test0110', 0, async function (done) {
        console.info("---------------------------Geomagentic_Sensor_Test0110----------------------------------");
        sensor.getGeomagneticField({ 'latitude': 0, 'longitude': 0, 'altitude': Number.MAX_VALUE }, timeMillis[0],
            (error, data) => {
                if (error) {
                    console.info('SensorGeomagenticTest011 failed');
                    expect(false).assertTrue();
                } else {
                    console.info('SensorGeomagenticTest011 success x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z
                        + ',geomagneticDip: ' + data.geomagneticDip
                        + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
                        + ',totalIntensity: ' + data.totalIntensity)
                    expect(Number.isNaN(data.x) && Number.isNaN(data.y) && Number.isNaN(data.z)).assertTrue()
                }
                setTimeout(() => {
                    done()
                }, 500)
            })
    })

    /**
     * @tc.number: Geomagentic_Sensor_Test0120
     * @tc.name: SensorGeomagenticTest012
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     */
    it('Geomagentic_Sensor_Test0120', 0, async function (done) {
        console.info("---------------------------Geomagentic_Sensor_Test0120----------------------------------");
        let geomagneticComponent = [27536.40234375, -2248.586669921875, -16022.4306640625, -30.110872268676758,
            -4.66834020614624, 27628.05859375, 31937.875]
        sensor.getGeomagneticField({ 'latitude': 0, 'longitude': 0, 'altitude': Number.MIN_VALUE }, timeMillis[0],
            (error, data) => {
                if (error) {
                    console.info('SensorGeomagenticTest012 failed');
                    expect(false).assertTrue();
                } else {
                    console.info('SensorGeomagenticTest012 success x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z
                        + ',geomagneticDip: ' + data.geomagneticDip
                        + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
                        + ',totalIntensity: ' + data.totalIntensity)
                    expect(data.x).assertEqual(geomagneticComponent[0])
                    expect(data.y).assertEqual(geomagneticComponent[1])
                    expect(data.z).assertEqual(geomagneticComponent[2])
                    expect(data.geomagneticDip).assertEqual(geomagneticComponent[3])
                    expect(data.deflectionAngle).assertEqual(geomagneticComponent[4])
                    expect(data.levelIntensity).assertEqual(geomagneticComponent[5])
                    expect(data.totalIntensity).assertEqual(geomagneticComponent[6])
                }
                setTimeout(() => {
                    done()
                }, 500)
            })
    })

    /**
     * @tc.number: Geomagentic_Sensor_Test0130
     * @tc.name: SensorGeomagenticTest013
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     */
    it('Geomagentic_Sensor_Test0130', 0, async function (done) {
        console.info("---------------------------Geomagentic_Sensor_Test0130----------------------------------");
        sensor.getGeomagneticField({ 'latitude': 0, 'longitude': 0, 'altitude': Number.NaN }, timeMillis[0],
            (error, data) => {
                if (error) {
                    console.info('SensorGeomagenticTest013 failed');
                    expect(false).assertTrue();
                } else {
                    console.info('SensorGeomagenticTest013 success x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z
                        + ',geomagneticDip: ' + data.geomagneticDip
                        + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
                        + ',totalIntensity: ' + data.totalIntensity)
                    expect(Number.isNaN(data.x) && Number.isNaN(data.y) && Number.isNaN(data.z)).assertTrue()
                }
                setTimeout(() => {
                    done()
                }, 500)
            })
    })

    /**
     * @tc.number: Geomagentic_Sensor_Test0140
     * @tc.name: SensorGeomagenticTest014
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     */
    it('Geomagentic_Sensor_Test0140', 0, async function (done) {
        console.info("---------------------------Geomagentic_Sensor_Test0140----------------------------------");
        sensor.getGeomagneticField({ 'latitude': 0, 'longitude': 0, 'altitude': Number.NEGATIVE_INFINITY },
            timeMillis[0], (error, data) => {
                if (error) {
                    console.info('SensorGeomagenticTest014 failed');
                    expect(false).assertTrue();
                } else {
                    console.info('SensorGeomagenticTest014 success x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z
                        + ',geomagneticDip: ' + data.geomagneticDip
                        + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
                        + ',totalIntensity: ' + data.totalIntensity)
                    expect(Number.isNaN(data.x) && Number.isNaN(data.y) && Number.isNaN(data.z)).assertTrue()
                }
                setTimeout(() => {
                    done()
                }, 500)
            })
    })

    /**
     * @tc.number: Geomagentic_Sensor_Test0150
     * @tc.name: SensorGeomagenticTest015
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     */
    it('Geomagentic_Sensor_Test0150', 0, async function (done) {
        console.info("---------------------------Geomagentic_Sensor_Test0150----------------------------------");
        sensor.getGeomagneticField({ 'latitude': 0, 'longitude': Number.NaN, 'altitude': 0 }, timeMillis[0],
            (error, data) => {
                if (error) {
                    console.info('SensorGeomagenticTest015 failed');
                    expect(false).assertTrue();
                } else {
                    console.info('SensorGeomagenticTest015 success x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z
                        + ',geomagneticDip: ' + data.geomagneticDip
                        + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
                        + ',totalIntensity: ' + data.totalIntensity)
                    expect(Number.isNaN(data.deflectionAngle) && Number.isNaN(data.geomagneticDip)).assertTrue()
                }
                setTimeout(() => {
                    done()
                }, 500)
            })
    })

    /**
     * @tc.number: Geomagentic_Sensor_Test0160
     * @tc.name: SensorGeomagenticTest016
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     */
    it('Geomagentic_Sensor_Test0160', 0, async function (done) {
        console.info("---------------------------Geomagentic_Sensor_Test0160----------------------------------");
        sensor.getGeomagneticField({ 'latitude': 0, 'longitude': Number.NEGATIVE_INFINITY, 'altitude': 0 },
            timeMillis[0], (error, data) => {
                if (error) {
                    console.info('SensorGeomagenticTest016 once success');
                    expect(false).assertTrue();
                } else {
                    console.info('SensorGeomagenticTest016 success x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z
                        + ',geomagneticDip: ' + data.geomagneticDip
                        + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
                        + ',totalIntensity: ' + data.totalIntensity)
                    expect(Number.isNaN(data.deflectionAngle) && Number.isNaN(data.geomagneticDip)).assertTrue()
                }
                setTimeout(() => {
                    done()
                }, 500)
            })
    })

    /**
     * @tc.number: Geomagentic_Sensor_Test0170
     * @tc.name: SensorGeomagenticTest017
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     */
    it('Geomagentic_Sensor_Test0170', 0, async function (done) {
        console.info("---------------------------Geomagentic_Sensor_Test0170----------------------------------");
        sensor.getGeomagneticField({ 'latitude': 0, 'longitude': 0, 'altitude': Number.MAX_VALUE }, timeMillis[0],
            (error, data) => {
                if (error) {
                    console.info('SensorGeomagenticTest017 failed');
                    expect(false).assertTrue();
                } else {
                    console.info('SensorGeomagenticTest017 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z
                        + ',geomagneticDip: ' + data.geomagneticDip
                        + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
                        + ',totalIntensity: ' + data.totalIntensity)
                    expect(Number.isNaN(data.deflectionAngle) && Number.isNaN(data.geomagneticDip)).assertTrue()
                }
                setTimeout(() => {
                    done()
                }, 500)
            })
    })

    /**
     * @tc.number: Geomagentic_Sensor_Test0180
     * @tc.name: SensorGeomagenticTest018
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     */
    it('Geomagentic_Sensor_Test0180', 0, async function (done) {
        console.info("---------------------------Geomagentic_Sensor_Test0180----------------------------------");
        sensor.getGeomagneticField({ 'latitude': 0, 'longitude': 0, 'altitude': Number.NaN }, timeMillis[0],
            (error, data) => {
                if (error) {
                    console.info('SensorGeomagenticTest018 failed');
                    expect(false).assertTrue();
                } else {
                    console.info('SensorGeomagenticTest018 success x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z
                        + ',geomagneticDip: ' + data.geomagneticDip
                        + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
                        + ',totalIntensity: ' + data.totalIntensity)
                    expect(Number.isNaN(data.deflectionAngle) && Number.isNaN(data.geomagneticDip)).assertTrue()
                }
                setTimeout(() => {
                    done()
                }, 500)
            })
    })

    /**
     * @tc.number: Geomagentic_Sensor_Test0190
     * @tc.name: SensorGeomagenticTest019
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     */
    it('Geomagentic_Sensor_Test0190', 0, async function (done) {
        console.info("---------------------------Geomagentic_Sensor_Test0190----------------------------------");
        sensor.getGeomagneticField({ 'latitude': 0, 'longitude': 0, 'altitude': Number.NEGATIVE_INFINITY },
            timeMillis[0], (error, data) => {
                if (error) {
                    console.info('SensorGeomagenticTest019 failed');
                    expect(false).assertfalse();
                } else {
                    console.info('SensorGeomagenticTest019 success x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z
                        + ',geomagneticDip: ' + data.geomagneticDip
                        + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
                        + ',totalIntensity: ' + data.totalIntensity)
                    expect(Number.isNaN(data.deflectionAngle) && Number.isNaN(data.geomagneticDip)).assertTrue()
                }
                setTimeout(() => {
                    done()
                }, 500)
            })
    })

    /**
     * @tc.number: Geomagentic_Sensor_Test0200
     * @tc.name: SensorGeomagenticTest020
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     */
    it('Geomagentic_Sensor_Test0200', 0, async function (done) {
        console.info("---------------------------Geomagentic_Sensor_Test0200----------------------------------");
        sensor.getGeomagneticField({ 'latitude': 0, 'longitude': Number.MAX_VALUE, 'altitude': 0 }, timeMillis[0],
            (error, data) => {
                if (error) {
                    console.info('SensorGeomagenticTest020 failed');
                    expect(false).assertTrue();
                } else {
                    console.info('SensorGeomagenticTest020 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z
                        + ',geomagneticDip: ' + data.geomagneticDip
                        + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
                        + ',totalIntensity: ' + data.totalIntensity)
                    expect(Number.isNaN(data.levelIntensity) && Number.isNaN(data.totalIntensity)).assertTrue();
                }
                setTimeout(() => {
                    done()
                }, 500)
            })
    })

    /**
     * @tc.number: Geomagentic_Sensor_Test0210
     * @tc.name: SensorGeomagenticTest021
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     */
    it('Geomagentic_Sensor_Test0210', 0, async function (done) {
        console.info("---------------------------Geomagentic_Sensor_Test0210----------------------------------");
        sensor.getGeomagneticField({ 'latitude': 0, 'longitude': Number.NaN, 'altitude': 0 }, timeMillis[0],
            (error, data) => {
                if (error) {
                    console.info('SensorGeomagenticTest021 failed');
                    expect(false).assertTrue();
                } else {
                    console.info('SensorGeomagenticTest021 success x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z
                        + ',geomagneticDip: ' + data.geomagneticDip
                        + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
                        + ',totalIntensity: ' + data.totalIntensity)
                    expect(Number.isNaN(data.levelIntensity) && Number.isNaN(data.totalIntensity)).assertTrue()
                }
                setTimeout(() => {
                    done()
                }, 500)
            })
    })

    /**
     * @tc.number: Geomagentic_Sensor_Test0220
     * @tc.name: SensorGeomagenticTest022
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     */
    it('Geomagentic_Sensor_Test0220', 0, async function (done) {
        console.info("---------------------------Geomagentic_Sensor_Test0220----------------------------------");
        sensor.getGeomagneticField({ 'latitude': 0, 'longitude': Number.NEGATIVE_INFINITY, 'altitude': 0 },
            timeMillis[0], (error, data) => {
                if (error) {
                    console.info('SensorGeomagenticTest022 failed');
                    expect(false).assertTrue();
                } else {
                    console.info('SensorGeomagenticTest022 success x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z
                        + ',geomagneticDip: ' + data.geomagneticDip
                        + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
                        + ',totalIntensity: ' + data.totalIntensity)
                    expect(Number.isNaN(data.deflectionAngle) && Number.isNaN(data.geomagneticDip)).assertTrue()
                }
                setTimeout(() => {
                    done()
                }, 500)
            })
    })

    /**
     * @tc.number: Geomagentic_Sensor_Test0230
     * @tc.name: SensorGeomagenticTest023
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     */
    it('Geomagentic_Sensor_Test0230', 0, async function (done) {
        console.info("---------------------------Geomagentic_Sensor_Test0230----------------------------------");
        sensor.getGeomagneticField({ 'latitude': 0, 'longitude': 0, 'altitude': Number.MAX_VALUE }, timeMillis[0],
            (error, data) => {
                if (error) {
                    console.info('SensorGeomagenticTest023 failed');
                    expect(false).assertTrue();
                } else {
                    console.info('SensorGeomagenticTest023 success x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z
                        + ',geomagneticDip: ' + data.geomagneticDip
                        + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
                        + ',totalIntensity: ' + data.totalIntensity)
                    expect(Number.isNaN(data.levelIntensity) && Number.isNaN(data.totalIntensity)).assertTrue()
                }
                setTimeout(() => {
                    done()
                }, 500)
            })
    })

    /**
     * @tc.number: Geomagentic_Sensor_Test0240
     * @tc.name: SensorGeomagenticTest024
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     */
    it('Geomagentic_Sensor_Test0240', 0, async function (done) {
        console.info("---------------------------Geomagentic_Sensor_Test0240----------------------------------");
        sensor.getGeomagneticField({ 'latitude': 0, 'longitude': 0, 'altitude': Number.NaN }, timeMillis[0],
            (error, data) => {
                if (error) {
                    console.info('SensorGeomagenticTest024 once success');
                    expect(false).assertTrue();
                } else {
                    console.info('SensorGeomagenticTest024 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z
                        + ',geomagneticDip: ' + data.geomagneticDip
                        + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
                        + ',totalIntensity: ' + data.totalIntensity)
                    expect(Number.isNaN(data.levelIntensity) && Number.isNaN(data.totalIntensity)).assertTrue()
                }
                setTimeout(() => {
                    done()
                }, 500)
            })
    })

    /**
     * @tc.number: Geomagentic_Sensor_Test0250
     * @tc.name: SensorGeomagenticTest025
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     */
    it('Geomagentic_Sensor_Test0250', 0, async function (done) {
        console.info("---------------------------Geomagentic_Sensor_Test0250----------------------------------");
        sensor.getGeomagneticField({ 'latitude': 0, 'longitude': 0, 'altitude': Number.NEGATIVE_INFINITY },
            timeMillis[0], (error, data) => {
                if (error) {
                    console.info('SensorGeomagenticTest025 once success');
                    expect(false).assertTrue();
                } else {
                    console.info('SensorGeomagenticTest025 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z
                        + ',geomagneticDip: ' + data.geomagneticDip
                        + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
                        + ',totalIntensity: ' + data.totalIntensity)
                    expect(Number.isNaN(data.levelIntensity) && Number.isNaN(data.totalIntensity)).assertTrue()
                }
                setTimeout(() => {
                    done()
                }, 500)
            })
    })

    /**
     * @tc.number: Geomagentic_Sensor_Test0260
     * @tc.name: SensorGeomagenticTest026
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     */
    it("Geomagentic_Sensor_Test0260", 0, async function (done) {
        console.info("---------------------------Geomagentic_Sensor_Test0260----------------------------------");
        for (var i = 0; i < timeMillis.length; i++) {
            await sensor.getGeomagneticField({ 'latitude': 80, 'longitude': 0, 'altitude': 0 },
                timeMillis[i]).then((data) => {
                    console.info('SensorGeomagenticTest026 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z
                        + ',geomagneticDip: ' + data.geomagneticDip
                        + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
                        + ',totalIntensity: ' + data.totalIntensity);
                    expect(data.x).assertEqual(GEOMAGNETIC_COMPONENT_YEAR_RESULT[i][0])
                    expect(data.y).assertEqual(GEOMAGNETIC_COMPONENT_YEAR_RESULT[i][1])
                    expect(data.z).assertEqual(GEOMAGNETIC_COMPONENT_YEAR_RESULT[i][2])
                    expect(data.deflectionAngle).assertEqual(GEOMAGNETIC_COMPONENT_YEAR_RESULT[i][3])
                    expect(data.geomagneticDip).assertEqual(GEOMAGNETIC_COMPONENT_YEAR_RESULT[i][4])
                    expect(data.levelIntensity).assertEqual(GEOMAGNETIC_COMPONENT_YEAR_RESULT[i][5])
                    expect(data.totalIntensity).assertEqual(GEOMAGNETIC_COMPONENT_YEAR_RESULT[i][6])
                }).catch((error) => {
                    console.info("promise::catch", error);
                })
        }
        done()
    })

    /**
     * @tc.number: Geomagentic_Sensor_Test0270
     * @tc.name: SensorGeomagenticTest027
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     */
    it("Geomagentic_Sensor_Test0270", 0, async function (done) {
        console.info('----------------------Geomagentic_Sensor_Test0270---------------------------');
        let geomagneticComponent = [27779.234375, -6214.9794921875, -14924.6611328125, -27.667943954467773,
            -12.610970497131348, 28465.9765625, 32141.2109375]
        await sensor.getGeomagneticField({ 'latitude': 0, 'longitude': 0, 'altitude': 0 },
            Number.MAX_VALUE).then((data) => {
                console.info('SensorGeomagenticTest027 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z
                    + ',geomagneticDip: ' + data.geomagneticDip
                    + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
                    + ',totalIntensity: ' + data.totalIntensity)
                expect(data.x).assertEqual(geomagneticComponent[0])
                expect(data.y).assertEqual(geomagneticComponent[1])
                expect(data.z).assertEqual(geomagneticComponent[2])
                expect(data.geomagneticDip).assertEqual(geomagneticComponent[3])
                expect(data.deflectionAngle).assertEqual(geomagneticComponent[4])
                expect(data.levelIntensity).assertEqual(geomagneticComponent[5])
                expect(data.totalIntensity).assertEqual(geomagneticComponent[6])
            }).catch((error) => {
                console.info("promise::catch", error)
            });
        done()
    })

    /**
     * @tc.number: Geomagentic_Sensor_Test0280
     * @tc.name: SensorGeomagenticTest028
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     */
    it("Geomagentic_Sensor_Test0280", 0, async function (done) {
        console.info('----------------------Geomagentic_Sensor_Test0280---------------------------');
        let geomagneticComponent = [27779.234375, -6214.9794921875, -14924.6611328125, -27.667943954467773,
            -12.610970497131348, 28465.9765625, 32141.2109375]
        await sensor.getGeomagneticField({ 'latitude': 0, 'longitude': 0, 'altitude': 0 },
            Number.MIN_VALUE).then((data) => {
                console.info('SensorGeomagenticTest028 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z
                    + ',geomagneticDip: ' + data.geomagneticDip
                    + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
                    + ',totalIntensity: ' + data.totalIntensity)
                expect(data.x).assertEqual(geomagneticComponent[0])
                expect(data.y).assertEqual(geomagneticComponent[1])
                expect(data.z).assertEqual(geomagneticComponent[2])
                expect(data.geomagneticDip).assertEqual(geomagneticComponent[3])
                expect(data.deflectionAngle).assertEqual(geomagneticComponent[4])
                expect(data.levelIntensity).assertEqual(geomagneticComponent[5])
                expect(data.totalIntensity).assertEqual(geomagneticComponent[6])
            }).catch((error) => {
                console.info("promise::catch", error);
            });
        done()
    })

    /**
     * @tc.number: Geomagentic_Sensor_Test0290
     * @tc.name: SensorGeomagenticTest029
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     */
    it("Geomagentic_Sensor_Test0290", 0, async function (done) {
        console.info('----------------------Geomagentic_Sensor_Test0290---------------------------');
        let geomagneticComponent = [1824.141845703125, 116.58167266845703, 56727.7734375, 88.15447235107422,
            3.6568238735198975, 1827.8634033203125, 56757.21484375]
        await sensor.getGeomagneticField({ 'latitude': Number.MAX_VALUE, 'longitude': 0, 'altitude': 0 },
            timeMillis[0]).then((data) => {
                console.info('SensorGeomagenticTest029 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z
                    + ',geomagneticDip: ' + data.geomagneticDip
                    + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
                    + ',totalIntensity: ' + data.totalIntensity)
                expect(data.x).assertEqual(geomagneticComponent[0])
                expect(data.y).assertEqual(geomagneticComponent[1])
                expect(data.z).assertEqual(geomagneticComponent[2])
                expect(data.geomagneticDip).assertEqual(geomagneticComponent[3])
                expect(data.deflectionAngle).assertEqual(geomagneticComponent[4])
                expect(data.levelIntensity).assertEqual(geomagneticComponent[5])
                expect(data.totalIntensity).assertEqual(geomagneticComponent[6])
            }).catch((error) => {
                console.info("promise::catch", error)
            });
        done()
    })

    /**
     * @tc.number: Geomagentic_Sensor_Test0300
     * @tc.name: SensorGeomagenticTest030
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     */
    it("Geomagentic_Sensor_Test0300", 0, async function (done) {
        console.info('----------------------Geomagentic_Sensor_Test0300---------------------------');
        let geomagneticComponent = [1824.141845703125, 116.58167266845703, 56727.7734375, 88.15447235107422,
            3.6568238735198975, 1827.8634033203125, 56757.21484375]
        await sensor.getGeomagneticField({ 'latitude': Number.NaN, 'longitude': 0, 'altitude': 0 },
            timeMillis[0]).then((data) => {
                console.info('SensorGeomagenticTest030 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z
                    + ',geomagneticDip: ' + data.geomagneticDip
                    + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
                    + ',totalIntensity: ' + data.totalIntensity)
                expect(data.x).assertEqual(geomagneticComponent[0])
                expect(data.y).assertEqual(geomagneticComponent[1])
                expect(data.z).assertEqual(geomagneticComponent[2])
                expect(data.geomagneticDip).assertEqual(geomagneticComponent[3])
                expect(data.deflectionAngle).assertEqual(geomagneticComponent[4])
                expect(data.levelIntensity).assertEqual(geomagneticComponent[5])
                expect(data.totalIntensity).assertEqual(geomagneticComponent[6])
            }).catch((error) => {
                console.info("promise::catch", error)
            });
        done()
    })

    /**
     * @tc.number: Geomagentic_Sensor_Test0310
     * @tc.name: SensorGeomagenticTest031
     * @tc.desc:verify app info is not null
     */
    it("Geomagentic_Sensor_Test0310", 0, async function (done) {
        console.info('----------------------Geomagentic_Sensor_Test0310---------------------------');
        let geomagneticComponent = [14425.57421875, -17156.767578125, -52023.21484375, -66.69005584716797,
            -49.94255447387695, 22415.4375, 56646.859375]
        await sensor.getGeomagneticField({ 'latitude': Number.NEGATIVE_INFINITY, 'longitude': 0, 'altitude': 0 },
            timeMillis[0]).then((data) => {
                console.info('SensorGeomagenticTest031 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z
                    + ',geomagneticDip: ' + data.geomagneticDip
                    + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
                    + ',totalIntensity: ' + data.totalIntensity)
                expect(data.x).assertEqual(geomagneticComponent[0])
                expect(data.y).assertEqual(geomagneticComponent[1])
                expect(data.z).assertEqual(geomagneticComponent[2])
                expect(data.geomagneticDip).assertEqual(geomagneticComponent[3])
                expect(data.deflectionAngle).assertEqual(geomagneticComponent[4])
                expect(data.levelIntensity).assertEqual(geomagneticComponent[5])
                expect(data.totalIntensity).assertEqual(geomagneticComponent[6])
            }).catch((error) => {
                console.info("promise::catch", error)
            });
        done()
    })

    /*
     * @tc.number: Geomagentic_Sensor_Test0320
     * @tc.name: SensorGeomagenticTest032
     * @tc.desc:verify app info is not null
     */
    it("Geomagentic_Sensor_Test0320", 0, async function (done) {
        console.info('----------------------Geomagentic_Sensor_Test0320---------------------------');
        let geomagneticComponent = [NaN, NaN, NaN]
        await sensor.getGeomagneticField({ 'latitude': 0, 'longitude': Number.MAX_VALUE, 'altitude': 0 },
            timeMillis[0]).then((data) => {
                console.info('SensorGeomagenticTest032 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z
                    + ',geomagneticDip: ' + data.geomagneticDip
                    + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
                    + ',totalIntensity: ' + data.totalIntensity)
                expect(Number.isNaN(data.x) && Number.isNaN(data.y) && Number.isNaN(data.z)).assertTrue()
            }).catch((error) => {
                console.info("promise::catch", error)
            });
        done()
    })

    /*
     * @tc.number: Geomagentic_Sensor_Test0330
     * @tc.name: SensorGeomagenticTest033
     * @tc.desc:verify app info is not null
     */
    it("Geomagentic_Sensor_Test0330", 0, async function (done) {
        console.info('----------------------Geomagentic_Sensor_Test0330---------------------------');
        await sensor.getGeomagneticField({ 'latitude': 0, 'longitude': Number.NaN, 'altitude': 0 },
            timeMillis[0]).then((data) => {
                console.info('SensorGeomagenticTest033 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z
                    + ',geomagneticDip: ' + data.geomagneticDip
                    + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
                    + ',totalIntensity: ' + data.totalIntensity)
                expect(Number.isNaN(data.x) && Number.isNaN(data.y) && Number.isNaN(data.z)).assertTrue()
            }).catch((error) => {
                console.info("promise::catch", error)
            });
        done()
    })

    /*
     * @tc.number: Geomagentic_Sensor_Test0340
     * @tc.name: SensorGeomagenticTest034
     * @tc.desc:verify app info is not null
     */
    it("Geomagentic_Sensor_Test0340", 0, async function (done) {
        console.info('----------------------Geomagentic_Sensor_Test0340---------------------------');
        await sensor.getGeomagneticField({ 'latitude': 0, 'longitude': Number.NEGATIVE_INFINITY, 'altitude': 0 },
            timeMillis[0]).then((data) => {
                console.info('SensorGeomagenticTest034 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z
                    + ',geomagneticDip: ' + data.geomagneticDip
                    + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
                    + ',totalIntensity: ' + data.totalIntensity)
                expect(Number.isNaN(data.x) && Number.isNaN(data.y) && Number.isNaN(data.z)).assertTrue()
            }).catch((error) => {
                console.info("promise::catch", error)
            });
        done()
    })

    /*
     * @tc.number: Geomagentic_Sensor_Test0350
     * @tc.name: SensorGeomagenticTest035
     * @tc.desc:verify app info is not null
     */
    it("Geomagentic_Sensor_Test0350", 0, async function (done) {
        console.info('----------------------Geomagentic_Sensor_Test0350---------------------------');
        await sensor.getGeomagneticField({ 'latitude': 0, 'longitude': 0, 'altitude': Number.MAX_VALUE },
            timeMillis[0]).then((data) => {
                console.info('SensorGeomagenticTest035 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z
                    + ',geomagneticDip: ' + data.geomagneticDip
                    + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
                    + ',totalIntensity: ' + data.totalIntensity)
                expect(Number.isNaN(data.x) && Number.isNaN(data.y) && Number.isNaN(data.z)).assertTrue()
            }).catch((error) => {
                console.info("promise::catch", error)
            });
        done()
    })

    /*
     * @tc.number: Geomagentic_Sensor_Test0360
     * @tc.name: SensorGeomagenticTest036
     * @tc.desc:verify app info is not null
     */
    it("Geomagentic_Sensor_Test0360", 0, async function (done) {
        console.info('----------------------Geomagentic_Sensor_Test0360---------------------------');
        let geomagneticComponent = [27536.40234375, -2248.586669921875, -16022.4306640625, -30.110872268676758,
            -4.66834020614624, 27628.05859375, 31937.875]
        await sensor.getGeomagneticField({ 'latitude': 0, 'longitude': 0, 'altitude': Number.MIN_VALUE },
            timeMillis[0]).then((data) => {
                console.info('SensorGeomagenticTest036 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z
                    + ',geomagneticDip: ' + data.geomagneticDip
                    + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
                    + ',totalIntensity: ' + data.totalIntensity)
                expect(data.x).assertEqual(geomagneticComponent[0])
                expect(data.y).assertEqual(geomagneticComponent[1])
                expect(data.z).assertEqual(geomagneticComponent[2])
                expect(data.geomagneticDip).assertEqual(geomagneticComponent[3])
                expect(data.deflectionAngle).assertEqual(geomagneticComponent[4])
                expect(data.levelIntensity).assertEqual(geomagneticComponent[5])
                expect(data.totalIntensity).assertEqual(geomagneticComponent[6])
            }).catch((error) => {
                console.info("promise::catch", error)
            });
        done()
    })

    /*
     * @tc.number: Geomagentic_Sensor_Test0370
     * @tc.name: SensorGeomagenticTest037
     * @tc.desc:verify app info is not null
     */
    it("Geomagentic_Sensor_Test0370", 0, async function (done) {
        console.info('----------------------Geomagentic_Sensor_Test0370---------------------------start');
        await sensor.getGeomagneticField({ 'latitude': 0, 'longitude': 0, 'altitude': Number.NaN },
            timeMillis[0]).then((data) => {
                console.info('SensorGeomagenticTest037 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z
                    + ',geomagneticDip: ' + data.geomagneticDip
                    + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
                    + ',totalIntensity: ' + data.totalIntensity)
                expect(Number.isNaN(data.x) && Number.isNaN(data.y) && Number.isNaN(data.z)).assertTrue()
            }).catch((error) => {
                console.info("promise::catch", error)
            });
        done()
    })

    /*
     * @tc.number: Geomagentic_Sensor_Test0380
     * @tc.name: SensorGeomagenticTest038
     * @tc.desc:verify app info is not null
     * @tc.type: FUNC
     * @tc.require: Issue Number
     */
    it("Geomagentic_Sensor_Test0380", 0, async function (done) {
        console.info('----------------------Geomagentic_Sensor_Test0380---------------------------');
        await sensor.getGeomagneticField({ 'latitude': 0, 'longitude': 0, 'altitude': Number.NEGATIVE_INFINITY },
            timeMillis[0]).then((data) => {
                console.info('SensorGeomagenticTest038 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z
                    + ',geomagneticDip: ' + data.geomagneticDip
                    + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
                    + ',totalIntensity: ' + data.totalIntensity)
                expect(Number.isNaN(data.x) && Number.isNaN(data.y) && Number.isNaN(data.z)).assertTrue()
            }).catch((error) => {
                console.info("promise::catch", error)
            });
        done()
    })

    /*
     * @tc.number: Geomagentic_Sensor_Test0390
     * @tc.name: SensorGeomagenticTest039
     * @tc.desc:verify app info is not null
     */
    it('Geomagentic_Sensor_Test0390', 0, async function (done) {
        for (var i = 0; i < timeMillis.length; i++) {
            console.info('----------------------Geomagentic_Sensor_Test0390---------------------------');
            await sensor.getGeomagneticField({ 'latitude': 80, 'longitude': 0, 'altitude': 0 },
                timeMillis[i]).then((data) => {
                    console.info('SensorGeomagenticTest039 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z
                        + ',geomagneticDip: ' + data.geomagneticDip
                        + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
                        + ',totalIntensity: ' + data.totalIntensity);
                    expect(data.x).assertEqual(GEOMAGNETIC_COMPONENT_YEAR_RESULT[i][0])
                    expect(data.y).assertEqual(GEOMAGNETIC_COMPONENT_YEAR_RESULT[i][1])
                    expect(data.z).assertEqual(GEOMAGNETIC_COMPONENT_YEAR_RESULT[i][2])
                    expect(data.deflectionAngle).assertEqual(GEOMAGNETIC_COMPONENT_YEAR_RESULT[i][3])
                    expect(data.geomagneticDip).assertEqual(GEOMAGNETIC_COMPONENT_YEAR_RESULT[i][4])
                    expect(data.levelIntensity).assertEqual(GEOMAGNETIC_COMPONENT_YEAR_RESULT[i][5])
                    expect(data.totalIntensity).assertEqual(GEOMAGNETIC_COMPONENT_YEAR_RESULT[i][6])
                }).catch((error) => {
                    console.info("promise::catch", error)
                });
        }
        done()
    })

    /*
     * @tc.number: Geomagentic_Sensor_Test0400
     * @tc.name: SensorGeomagenticTest040
     * @tc.desc:verify app info is not null
     */
    it("Geomagentic_Sensor_Test0400", 0, async function (done) {
        console.info('----------------------Geomagentic_Sensor_Test0400---------------------------');
        await sensor.getGeomagneticField({ 'latitude': 0, 'longitude': Number.NaN, 'altitude': 0 },
            timeMillis[0]).then((data) => {
                console.info('SensorGeomagenticTest040 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z
                    + ',geomagneticDip: ' + data.geomagneticDip
                    + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
                    + ',totalIntensity: ' + data.totalIntensity)
                expect(Number.isNaN(data.deflectionAngle) && Number.isNaN(data.geomagneticDip)).assertTrue()
            }).catch((error) => {
                console.info("promise::catch", error)
            });
        done()
    })

    /*
     * @tc.number: Geomagentic_Sensor_Test0410
     * @tc.name: SensorGeomagenticTest041
     * @tc.desc:verify app info is not null
     */
    it("Geomagentic_Sensor_Test0410", 0, async function (done) {
        console.info('----------------------Geomagentic_Sensor_Test0410---------------------------');
        await sensor.getGeomagneticField({ 'latitude': 0, 'longitude': Number.NEGATIVE_INFINITY, 'altitude': 0 },
            timeMillis[0]).then((data) => {
                console.info('SensorGeomagenticTest041 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z
                    + ',geomagneticDip: ' + data.geomagneticDip
                    + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
                    + ',totalIntensity: ' + data.totalIntensity)
                expect(Number.isNaN(data.deflectionAngle) && Number.isNaN(data.geomagneticDip)).assertTrue()
            }).catch((error) => {
                console.info("promise::catch", error)
            });
        done()
    })

    /*
     * @tc.number: Geomagentic_Sensor_Test0420
     * @tc.name: SensorGeomagenticTest042
     * @tc.desc:verify app info is not null
     */
    it("Geomagentic_Sensor_Test0420", 0, async function (done) {
        console.info('----------------------Geomagentic_Sensor_Test0420 max ---------------------------');
        await sensor.getGeomagneticField({ 'latitude': 0, 'longitude': 0, 'altitude': Number.MAX_VALUE },
            timeMillis[0]).then((data) => {
                console.info('SensorGeomagenticTest042 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z
                    + ',geomagneticDip: ' + data.geomagneticDip
                    + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
                    + ',totalIntensity: ' + data.totalIntensity)
                expect(Number.isNaN(data.deflectionAngle) && Number.isNaN(data.geomagneticDip)).assertTrue()
            }).catch((error) => {
                console.info("promise::catch", error)
            });
        done()
    })

    /*
     * @tc.number: Geomagentic_Sensor_Test0430
     * @tc.name: SensorGeomagenticTest043
     * @tc.desc:verify app info is not null
     */
    it("Geomagentic_Sensor_Test0430", 0, async function (done) {
        console.info('----------------------Geomagentic_Sensor_Test0430---------------------------');
        await sensor.getGeomagneticField({ 'latitude': 0, 'longitude': 0, 'altitude': Number.NaN },
            timeMillis[0]).then((data) => {
                console.info('SensorGeomagenticTest043 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z
                    + ',geomagneticDip: ' + data.geomagneticDip
                    + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
                    + ',totalIntensity: ' + data.totalIntensity)
                expect(Number.isNaN(data.deflectionAngle) && Number.isNaN(data.geomagneticDip)).assertTrue()
            }).catch((error) => {
                console.info("promise::catch", error)
            });
        done()
    })

    /*
     * @tc.number: Geomagentic_Sensor_Test0440
     * @tc.name: SensorGeomagenticTest044
     * @tc.desc:verify app info is not null
     */
    it("Geomagentic_Sensor_Test0440", 0, async function (done) {
        console.info('----------------------Geomagentic_Sensor_Test0440---------------------------');
        await sensor.getGeomagneticField({ 'latitude': 0, 'longitude': 0, 'altitude': Number.NEGATIVE_INFINITY },
            timeMillis[0]).then((data) => {
                console.info('SensorGeomagenticTest044 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z
                    + ',geomagneticDip: ' + data.geomagneticDip
                    + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
                    + ',totalIntensity: ' + data.totalIntensity)
                expect(Number.isNaN(data.deflectionAngle) && Number.isNaN(data.geomagneticDip)).assertTrue()
            }).catch((error) => {
                console.info("promise::catch", error)
            });
        done()
    })

    /*
     * @tc.number: Geomagentic_Sensor_Test0450
     * @tc.name: SensorGeomagenticTest045
     * @tc.desc:verify app info is not null
     */
    it('Geomagentic_Sensor_Test0450', 0, async function (done) {
        console.info('----------------------Geomagentic_Sensor_Test0450---------------------------');
        for (var i = 0; i < GEOMAGNETIC_COORDINATES.length; i++) {
            await sensor.getGeomagneticField({
                'latitude': GEOMAGNETIC_COORDINATES[i][0],
                'longitude': GEOMAGNETIC_COORDINATES[i][1], 'altitude': GEOMAGNETIC_COORDINATES[i][2]
            },
                timeMillis[0]).then((data) => {
                    console.info('SensorGeomagenticTest045 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z
                        + ',geomagneticDip: ' + data.geomagneticDip
                        + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
                        + ',totalIntensity: ' + data.totalIntensity)
                    expect(data.x).assertEqual(GEOMAGNETIC_COMPONENT_COORDINATES_RESULT[i][0])
                    expect(data.y).assertEqual(GEOMAGNETIC_COMPONENT_COORDINATES_RESULT[i][1])
                    expect(data.z).assertEqual(GEOMAGNETIC_COMPONENT_COORDINATES_RESULT[i][2])
                    expect(data.deflectionAngle).assertEqual(GEOMAGNETIC_COMPONENT_COORDINATES_RESULT[i][3])
                    expect(data.geomagneticDip).assertEqual(GEOMAGNETIC_COMPONENT_COORDINATES_RESULT[i][4])
                    expect(data.levelIntensity).assertEqual(GEOMAGNETIC_COMPONENT_COORDINATES_RESULT[i][5])
                    expect(data.totalIntensity).assertEqual(GEOMAGNETIC_COMPONENT_COORDINATES_RESULT[i][6])
                }).catch((error) => {
                    console.info("promise::catch", error);
                });
        }
        done()
    })

    /*
     * @tc.number: Geomagentic_Sensor_Test0460
     * @tc.name: SensorGeomagenticTest046
     * @tc.desc:verify app info is not null
     */
    it("Geomagentic_Sensor_Test0460", 0, async function (done) {
        console.info('----------------------Geomagentic_Sensor_Test0460---------------------------');
        await sensor.getGeomagneticField({ 'latitude': 0, 'longitude': Number.MAX_VALUE, 'altitude': 0 },
            timeMillis[0]).then((data) => {
                console.info('SensorGeomagenticTest046 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z
                    + ',geomagneticDip: ' + data.geomagneticDip
                    + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
                    + ',totalIntensity: ' + data.totalIntensity)
                expect(Number.isNaN(data.levelIntensity) && Number.isNaN(data.totalIntensity)).assertTrue();
            }).catch((error) => {
                console.info("promise::catch", error);
            });
        done()
    })

    /*
     * @tc.number: Geomagentic_Sensor_Test0470
     * @tc.name: SensorGeomagenticTest047
     * @tc.desc:verify app info is not null
     */
    it("Geomagentic_Sensor_Test0470", 0, async function (done) {
        console.info('----------------------Geomagentic_Sensor_Test0470---------------------------');
        await sensor.getGeomagneticField({ 'latitude': 0, 'longitude': Number.NaN, 'altitude': 0 },
            timeMillis[0]).then((data) => {
                console.info('SensorGeomagenticTest047 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z
                    + ',geomagneticDip: ' + data.geomagneticDip
                    + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
                    + ',totalIntensity: ' + data.totalIntensity)
                expect(Number.isNaN(data.levelIntensity) && Number.isNaN(data.totalIntensity)).assertTrue()
            }).catch((error) => {
                console.info("promise::catch", error);
            });
        done()
    })

    /*
     * @tc.number: Geomagentic_Sensor_Test0480
     * @tc.name: SensorGeomagenticTest048
     * @tc.desc:verify app info is not null
     */
    it("Geomagentic_Sensor_Test0480", 0, async function (done) {
        console.info('----------------------Geomagentic_Sensor_Test0480---------------------------');
        await sensor.getGeomagneticField({ 'latitude': 0, 'longitude': Number.NEGATIVE_INFINITY, 'altitude': 0 },
            timeMillis[0]).then((data) => {
                console.info('SensorGeomagenticTest048 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z
                    + ',geomagneticDip: ' + data.geomagneticDip
                    + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
                    + ',totalIntensity: ' + data.totalIntensity)
                expect(Number.isNaN(data.deflectionAngle) && Number.isNaN(data.geomagneticDip)).assertTrue()
            }).catch((error) => {
                console.info("promise::catch", error);
            });
        done()
    })

    /*
     * @tc.number: Geomagentic_Sensor_Test0490
     * @tc.name: SensorGeomagenticTest049
     * @tc.desc:verify app info is not null
     */
    it("Geomagentic_Sensor_Test0490", 0, async function (done) {
        console.info('----------------------Geomagentic_Sensor_Test0490---------------------------');
        await sensor.getGeomagneticField({ 'latitude': 0, 'longitude': 0, 'altitude': Number.MAX_VALUE },
            timeMillis[0]).then((data) => {
                console.info('SensorGeomagenticTest049 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z
                    + ',geomagneticDip: ' + data.geomagneticDip
                    + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
                    + ',totalIntensity: ' + data.totalIntensity)
                expect(Number.isNaN(data.levelIntensity) && Number.isNaN(data.totalIntensity)).assertTrue()
            }).catch((error) => {
                console.info("promise::catch", error);
            });
        done()
    })

    /*
     * @tc.number: Geomagentic_Sensor_Test0500
     * @tc.name: SensorGeomagenticTest050
     * @tc.desc:verify app info is not null
     */
    it("Geomagentic_Sensor_Test0500", 0, async function (done) {
        console.info('----------------------Geomagentic_Sensor_Test0500---------------------------');
        await sensor.getGeomagneticField({ 'latitude': 0, 'longitude': 0, 'altitude': Number.NaN },
            timeMillis[0]).then((data) => {
                console.info('SensorGeomagenticTest050 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z
                    + ',geomagneticDip: ' + data.geomagneticDip
                    + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
                    + ',totalIntensity: ' + data.totalIntensity)
                expect(Number.isNaN(data.levelIntensity) && Number.isNaN(data.totalIntensity)).assertTrue()
            }).catch((error) => {
                console.info("promise::catch", error);
            });
        done()
    })

    /*
     * @tc.number: Geomagentic_Sensor_Test0510
     * @tc.name: SensorGeomagenticTest051
     * @tc.desc:verify app info is not null
     */
    it("Geomagentic_Sensor_Test0510", 0, async function (done) {
        console.info('----------------------Geomagentic_Sensor_Test0510---------------------------');
        await sensor.getGeomagneticField({ 'latitude': 0, 'longitude': 0, 'altitude': Number.NEGATIVE_INFINITY },
            timeMillis[0]).then((data) => {
                console.info('SensorGeomagenticTest051 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z
                    + ',geomagneticDip: ' + data.geomagneticDip
                    + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity
                    + ',totalIntensity: ' + data.totalIntensity)
                expect(Number.isNaN(data.levelIntensity) && Number.isNaN(data.totalIntensity)).assertTrue()
            }).catch((error) => {
                console.info("promise::catch", error);
            });
        done()
    })
})
