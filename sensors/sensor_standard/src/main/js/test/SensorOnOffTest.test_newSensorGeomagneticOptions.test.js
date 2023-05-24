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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'

export default function SensorJsTest_sensor_38() {
describe("SensorJsTest_sensor_38", function () {
    beforeAll(function() {
        /*
         * @tc.setup: setup invoked before all testcases
         */
         console.info('beforeAll called')
    })

    afterAll(function() {
        /*
         * @tc.teardown: teardown invoked after all testcases
         */
         console.info('afterAll called')
    })

    beforeEach(function() {
        /*
         * @tc.setup: setup invoked before each testcases
         */
         console.info('beforeEach called')
    })

    afterEach(function() {
        /*
         * @tc.teardown: teardown invoked after each testcases
         */
         console.info('afterEach called')
    })

    const PARAMETER_ERROR_CODE = 401
    const SERVICE_EXCEPTION_CODE = 14500101
    const EPS = 0.01
    const PARAMETER_ERROR_MSG = 'The parameter invalid.'
    const SERVICE_EXCEPTION_MSG = 'Service exception.'

    let GEOMAGNETIC_COMPONENT_YEAR_RESULT = [
        [6570.3935546875, -146.3289337158203, 54606.0078125, -1.2758207321166992, 83.13726043701172, 6572.02294921875, 55000.0703125],
        [6554.17041015625, -87.19947052001953, 54649.078125, -0.7622424364089966, 83.16046905517578, 6554.75048828125, 55040.7734375],
        [6537.99169921875, -28.231582641601562, 54692.02734375, -0.24740631878376007, 83.18303680419922, 6538.052734375, 55081.4296875],
        [6521.81201171875, 30.73670768737793, 54734.97265625, 0.2700277864933014, 83.20502471923828, 6521.88427734375, 55122.15625],
        [6505.6328125, 89.70511627197266, 54777.90625, 0.7899921536445618, 83.22642517089844, 6506.2509765625, 55162.9453125]]

    let GEOMAGNETIC_COMPONENT_COORDINATES_RESULT = [
        [6570.3935546875, -146.3289337158203, 54606.0078125, -1.2758207321166992, 83.13726043701172, 6572.02294921875, 55000.0703125],
        [39624.28125, 109.8766098022461, -10932.4638671875, 0.15887857973575592, -15.424291610717773, 39624.43359375, 41104.921875],
        [37636.72265625, 104.90892791748047, -10474.810546875, 0.15970633924007416, -15.552550315856934, 37636.8671875, 39067.3203125],
        [5940.583984375, 15772.0927734375, -52480.7578125, 69.36103820800781, -72.19599914550781, 16853.765625, 55120.58984375],
        [5744.87255859375, 14799.48046875, -49969.40234375, 68.78474426269531, -72.37483215332031, 15875.3955078125, 52430.61328125]]

    let GEOMAGNETIC_COORDINATES = [[80, 0, 0],
                                   [0, 120, 0],
                                   [0, 120, 100000],
                                   [-80, 240, 0],
                                   [-80, 240, 100000]]

    let timeMillis = [1580486400000, 1612108800000, 1643644800000, 1675180800000, 1706716800000]

    /*
     * @tc.name:Sensor_GetGeomagneticField_058
     * @tc.desc:verify app info is not null
     * @tc.type: FUNC
     * @tc.require: I5SWJI
     */
    it("Sensor_GetGeomagneticInfo_058", 0, async function (done) {
        console.info("---------------------------Sensor_GetGeomagneticInfo_058----------------------------------");
        for (let i = 0; i < timeMillis.length; i++) {
            await sensor.getGeomagneticInfo({'latitude':80, 'longitude':0, 'altitude':0}, timeMillis[i], undefined).then((data) => {
                console.info('Sensor_GetGeomagneticField_058 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z + ',geomagneticDip: ' + data.geomagneticDip
                + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity + ',totalIntensity: ' + data.totalIntensity);
                expect(Math.abs(data.x - GEOMAGNETIC_COMPONENT_YEAR_RESULT[i][0]) < EPS).assertTrue()
                expect(Math.abs(data.y - GEOMAGNETIC_COMPONENT_YEAR_RESULT[i][1]) < EPS).assertTrue()
                expect(Math.abs(data.z - GEOMAGNETIC_COMPONENT_YEAR_RESULT[i][2]) < EPS).assertTrue()
                expect(Math.abs(data.deflectionAngle - GEOMAGNETIC_COMPONENT_YEAR_RESULT[i][3]) < EPS).assertTrue()
                expect(Math.abs(data.geomagneticDip - GEOMAGNETIC_COMPONENT_YEAR_RESULT[i][4]) < EPS).assertTrue()
                expect(Math.abs(data.levelIntensity - GEOMAGNETIC_COMPONENT_YEAR_RESULT[i][5]) < EPS).assertTrue()
                expect(Math.abs(data.totalIntensity - GEOMAGNETIC_COMPONENT_YEAR_RESULT[i][6]) < EPS).assertTrue()
            }).catch((error) => {
                console.info("Sensor_GetGeomagneticInfo_058 promise::catch", error);
            })
        }
        done()
    })

    /*
     * @tc.name:Sensor_GetGeomagneticInfo_058
     * @tc.desc:verify app info is not null
     * @tc.type: FUNC
     * @tc.require: I5SWJI
     */
    it("Sensor_GetGeomagneticInfo_059", 0, async function (done) {
        console.info("---------------------------Sensor_GetGeomagneticInfo_059----------------------------------");
        for (let i = 0; i < timeMillis.length; i++) {
            await sensor.getGeomagneticInfo({'latitude':80, 'longitude':0, 'altitude':0}, timeMillis[i], null).then((data) => {
                console.info('Sensor_GetGeomagneticInfo_059 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z + ',geomagneticDip: ' + data.geomagneticDip
                + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity + ',totalIntensity: ' + data.totalIntensity);
                expect(Math.abs(data.x - GEOMAGNETIC_COMPONENT_YEAR_RESULT[i][0]) < EPS).assertTrue()
                expect(Math.abs(data.y - GEOMAGNETIC_COMPONENT_YEAR_RESULT[i][1]) < EPS).assertTrue()
                expect(Math.abs(data.z - GEOMAGNETIC_COMPONENT_YEAR_RESULT[i][2]) < EPS).assertTrue()
                expect(Math.abs(data.deflectionAngle - GEOMAGNETIC_COMPONENT_YEAR_RESULT[i][3]) < EPS).assertTrue()
                expect(Math.abs(data.geomagneticDip - GEOMAGNETIC_COMPONENT_YEAR_RESULT[i][4]) < EPS).assertTrue()
                expect(Math.abs(data.levelIntensity - GEOMAGNETIC_COMPONENT_YEAR_RESULT[i][5]) < EPS).assertTrue()
                expect(Math.abs(data.totalIntensity - GEOMAGNETIC_COMPONENT_YEAR_RESULT[i][6]) < EPS).assertTrue()
            }).catch((error) => {
                console.info("promise::catch", error);
            })
        }
        done()
    })

    /*
     * @tc.name:Sensor_GetGeomagneticInfo_060
     * @tc.desc:verify app info is not null
     * @tc.type: FUNC
     * @tc.require: I5SWJI
     */
    it("Sensor_GetGeomagneticInfo_060", 0, async function (done) {
        console.info("---------------------------Sensor_GetGeomagneticInfo_060----------------------------------");
        for (let i = 0; i < timeMillis.length; i++) {
            await sensor.getGeomagneticInfo({'latitude':80, 'longitude':0, 'altitude':0}, timeMillis[i], "abc").then((data) => {
                console.info('Sensor_GetGeomagneticInfo_060 x: ' + data.x + ',y: ' + data.y + ',z: ' + data.z + ',geomagneticDip: ' + data.geomagneticDip
                + ',deflectionAngle: ' + data.deflectionAngle + ',levelIntensity: ' + data.levelIntensity + ',totalIntensity: ' + data.totalIntensity);
                expect(Math.abs(data.x - GEOMAGNETIC_COMPONENT_YEAR_RESULT[i][0]) < EPS).assertTrue()
                expect(Math.abs(data.y - GEOMAGNETIC_COMPONENT_YEAR_RESULT[i][1]) < EPS).assertTrue()
                expect(Math.abs(data.z - GEOMAGNETIC_COMPONENT_YEAR_RESULT[i][2]) < EPS).assertTrue()
                expect(Math.abs(data.deflectionAngle - GEOMAGNETIC_COMPONENT_YEAR_RESULT[i][3]) < EPS).assertTrue()
                expect(Math.abs(data.geomagneticDip - GEOMAGNETIC_COMPONENT_YEAR_RESULT[i][4]) < EPS).assertTrue()
                expect(Math.abs(data.levelIntensity - GEOMAGNETIC_COMPONENT_YEAR_RESULT[i][5]) < EPS).assertTrue()
                expect(Math.abs(data.totalIntensity - GEOMAGNETIC_COMPONENT_YEAR_RESULT[i][6]) < EPS).assertTrue()
            }).catch((error) => {
                console.info("promise::catch", error);
            })
        }
        done()
    })

    const SENSOR_DATA_MATRIX = [
        {
            "rotation": [-0.7980074882507324, 0.5486301183700562, 0.24937734007835388, -0.17277367413043976,
                -0.6047078967094421, 0.7774815559387207, 0.5773502588272095, 0.5773502588272095,0.5773502588272095],
            "inclination":[1, 0, 0, 0, 0.20444221794605255,0.9788785576820374, 0, -0.9788785576820374, 0.20444221794605255]
        },
        {
            "rotation": [-0.8206444382667542, 0.3832680284976959, 0.42384934425354004, 0.021023601293563843,
                -0.7209705710411072,0.6926466822624207, 0.5710522532463074,0.57732754945755,0.5836028456687927],
            "inclination":[1, 0, 0, 0, 0.2584352493286133,0.9660285115242004, 0, -0.9660285115242004, 0.2584352493286133]
        },
        {
            "rotation": [0.9583651423454285, 0.08038506656885147, -0.27399733662605286, 0.160231813788414,
                -0.9456362724304199, 0.2830156981945038, -0.23635157942771912, -0.3151354491710663, -0.9191450476646423],
            "inclination":[1, 0, 0, 0, 0.34239840507507324, 0.9395548701286316, 0, -0.9395548701286316, 0.34239840507507324]
        },
        {
            "rotation":[null, null, null, null, null, null, null, null, null],
            "inclination":[1, 0, 0, 0, null, null, 0, null ,null]
        },
        {
            "rotation":[null, null, null, null, null, null,0, 0, 0],
            "inclination":[1, 0, 0, 0, null, 0, 0, 0, null]
        }
    ];

    let GET_DIRECTION = [
        [ 0.38050639629364014, -0.9783217310905457, -0.6610431671142578],
        [-2.7610862255096436, 1.5018651485443115, 2.987273931503296],
        [0.32175055146217346, -1.006853699684143, -0.6857295036315918],
        [1.3332617282867432, -1.5440233945846558, -0.6627295017242432],
        [NaN, NaN, NaN],
        [0.7853981852531433, -0.6154797077178955, -0.7853981852531433],
        [0.7853981852531433, -0.7853981852531433, -0.7853981852531433],
        [0.785398, -0.615480, -0.785398],
        [0.785398, -0.785398, -0.785398]
    ]

    let rotationMatrix = [
        [1, 2, 3, 4, 5, 6, 7, 8, 9],
        [-1, -2, -3, -4, -5, -6, -7, -78, -45],
        [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16],
        [11111111, 21111111, 31111111, 4111111, 5111111, 61111111, 71111111, 811111111, 91111111],
        [NaN, NaN, NaN, NaN, NaN, NaN, NaN, NaN, NaN],
        [3.40282e+38, 3.40282e+38, 3.40282e+38, 3.40282e+38, 3.40282e+38, 3.40282e+38, 3.40282e+38, 3.40282e+38, 3.40282e+38],
        [3.40282e+39, 3.40282e+39, 3.40282e+39, 3.40282e+39, 3.40282e+39, 3.40282e+39, 3.40282e+39, 3.40282e+39, 3.40282e+39],
        [3.40282e+38, 3.40282e+38, 3.40282e+38, 3.40282e+38, 3.40282e+38, 3.40282e+38, 3.40282e+38, 3.40282e+38, 3.40282e+38],
        [3.40282e+39, 3.40282e+39, 3.40282e+39, 3.40282e+39, 3.40282e+39, 3.40282e+39, 3.40282e+39, 3.40282e+39, 3.40282e+39]
    ]

    let gravity = [
        [9, 9, 9], [91, 92, 93], [-9, -12, -35], [NaN, NaN, NaN], [3.40282e+38, 3.40282e+38, 3.40282e+38], [3.40282e+39, 3.40282e+39, 3.40282e+39]
    ]

    let geomagnetic = [
        [30, 25, 41], [3, 2, 4], [-123, -456, -564], [3.40282e+38, 3.40282e+38, 3.40282e+38], [NaN, NaN, NaN]
    ]

    let createRotationMatrixResult = [
        [0.6724675297737122,-0.10471208393573761,0.7326819896697998,0.06531608104705811,0.9944750070571899,
            0.08217836916446686,-0.7372390031814575,-0.007406365126371384,0.6755914688110352],
        [1,0,0,0,1,0,0,0,1]
    ]

    /*
    * tc.name: Sensor_CreateRotationMatrix_015
    * tc.desc: Verification results of the incorrect parameters of test interface.
    * tc.require: I5SWJI
    * @tc.author:
    */
    it('Sensor_CreateRotationMatrix_015', 0, async function (done) {
        sensor.getRotationMatrix(gravity[0], geomagnetic[0], undefined).then((data) => {
            console.info("Sensor_CreateRotationMatrix_015" + JSON.stringify(data))
            expect(JSON.stringify(data)).assertEqual(JSON.stringify(SENSOR_DATA_MATRIX[0]))
            done()
        }, (error) => {
            expect(false).assertTrue();
            done()
        })
    })

    /*
    * tc.name: Sensor_CreateRotationMatrix_016
    * tc.desc: Verification results of the incorrect parameters of test interface.
    * tc.require: I5SWJI
    * @tc.author:
    */
    it('Sensor_CreateRotationMatrix_016', 0, async function (done) {
        sensor.getRotationMatrix(gravity[0], geomagnetic[0], null).then((data) => {
            console.info("Sensor_CreateRotationMatrix_016" + JSON.stringify(data))
            expect(JSON.stringify(data)).assertEqual(JSON.stringify(SENSOR_DATA_MATRIX[0]))
            done()
        }, (error) => {
            expect(false).assertTrue();
            done()
        })
    })

    /*
    * tc.name: Sensor_CreateRotationMatrix_017
    * tc.desc: Verification results of the incorrect parameters of test interface.
    * tc.require: I5SWJI
    * @tc.author:
    */
    it('Sensor_CreateRotationMatrix_017', 0, async function (done) {
        sensor.getRotationMatrix([0, 0, 0], undefined).then((data) => {
            for(let i = 0; i < data.length; i++) {
                console.info("Sensor_CreateRotationMatrix_017 [" + i + "] : " + data[i]);
                expect(data[i]).assertEqual(createRotationMatrixResult[1][i])
            }
            done()
        }, (error) => {
            expect(false).assertTrue();
            done()
        })
    })

    /*
    * tc.name: Sensor_CreateRotationMatrix_018
    * tc.desc: Verification results of the incorrect parameters of test interface.
    * tc.require: I5SWJI
    * @tc.author:
    */
    it('Sensor_CreateRotationMatrix_018', 0, async function (done) {
        sensor.getRotationMatrix([0, 0, 0], null).then((data) => {
            for(let i = 0; i < data.length; i++) {
                console.info("Sensor_CreateRotationMatrix_018 [" + i + "] : " + data[i]);
                expect(data[i]).assertEqual(createRotationMatrixResult[1][i])
            }
            done()
        }, (error) => {
            expect(false).assertTrue();
            done()
        })
    })

    /**
     * test
     *
     * @tc.name: Sensor_GetDirection_011
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     * @tc.require: I5SWJI
     * @tc.author:
     */
    it('Sensor_GetDirection_011', 0, async function (done) {
        sensor.getOrientation(rotationMatrix[0], undefined).then((data) => {
            for (let i = 0; i < data.length; i++) {
                console.info("Sensor_GetDirection_011" + data[i])
                expect(data[i]).assertEqual(GET_DIRECTION[0][i])
            }
            done()
        }, (error) => {
            expect(false).assertTrue();
            done()
        })
    })

    /**
     * test
     *
     * @tc.name: Sensor_GetDirection_012
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     * @tc.require: I5SWJI
     * @tc.author:
     */
    it('Sensor_GetDirection_012', 0, async function (done) {
        sensor.getOrientation(rotationMatrix[0], null).then((data) => {
            for (let i = 0; i < data.length; i++) {
                console.info("Sensor_GetDirection_012" + data[i])
                expect(data[i]).assertEqual(GET_DIRECTION[0][i])
            }
            done()
        }, (error) => {
            expect(false).assertTrue();
            done()
        })
    })

    let ANGLECHANGE_9_RESULT = [
        [0.7853981852531433, NaN, -0.32175055146217346],  //123123123
        [0.7853981852531433, NaN, -0.7853981852531433],   //FLOAT.MAXVALUE
        [0.0, -0.0, -0.0],                                //FLOAT.MINVALUE
        [0.7853981852531433, NaN, -0.7853981852531433],   //FLOAT.MAXVALUE+1
        ];

    /*
     * @tc.name:Sensor_GetAngleModify_017
     * @tc.desc:verify app info is not null
     * @tc.type: FUNC
     * @tc.require: I5SWJI
     */
    it('Sensor_GetAngleModify_017', 0, async function (done) {
        console.info('----------------------Sensor_GetAngleModify_017---------------------------');
        sensor.getAngleVariation([1,2,3,1,2,3,1,2,3], [2,2,2,2,2,2,2,2,2], undefined).then((data) => {
            for(let i = 0; i < data.length; i++) {
                console.info("Sensor_GetAngleModify_017 [" + i + "] = " + data[i]);
                expect(data[0]).assertEqual(ANGLECHANGE_9_RESULT[0][0]) && expect(Number.isNaN(data[1])).assertTrue() &&
                expect(data[2]).assertEqual(ANGLECHANGE_9_RESULT[0][2]);
            }
            done();
        }, (error) => {
            expect(false).assertTrue();
            done()
        })
    })

    /*
     * @tc.name:Sensor_GetAngleModify_018
     * @tc.desc:verify app info is not null
     * @tc.type: FUNC
     * @tc.require: I5SWJI
     */
    it('Sensor_GetAngleModify_018', 0, async function (done) {
        console.info('----------------------Sensor_GetAngleModify_018---------------------------');
        sensor.getAngleVariation([1,2,3,1,2,3,1,2,3], [2,2,2,2,2,2,2,2,2], null).then((data) => {
            for(let i = 0; i < data.length; i++) {
                console.info("Sensor_GetAngleModify_018 [" + i + "] = " + data[i]);
                expect(data[0]).assertEqual(ANGLECHANGE_9_RESULT[0][0]) && expect(Number.isNaN(data[1])).assertTrue() &&
                expect(data[2]).assertEqual(ANGLECHANGE_9_RESULT[0][2]);
            }
            done();
        }, (error) => {
            expect(false).assertTrue();
            done()
        })
    })

    /*
     * @tc.name:Sensor_GetAngleModify_019
     * @tc.desc:verify app info is not null
     * @tc.type: FUNC
     * @tc.require: I5SWJI
     */
    it('Sensor_GetAngleModify_019', 0, async function (done) {
        console.info('----------------------Sensor_GetAngleModify_019---------------------------');
        sensor.getAngleVariation([1,2,3,1,2,3,1,2,3], [2,2,2,2,2,2,2,2,2], null).then((data) => {
            for(let i = 0; i < data.length; i++) {
                console.info("Sensor_GetAngleModify_019 [" + i + "] = " + data[i]);
                expect(data[0]).assertEqual(ANGLECHANGE_9_RESULT[0][0]) && expect(Number.isNaN(data[1])).assertTrue() &&
                expect(data[2]).assertEqual(ANGLECHANGE_9_RESULT[0][2]);
            }
            done();
        }, (error) => {
            expect(false).assertTrue();
            done()
        })
    })

    const result = [
        [0.7441122531890869, 0.5199999809265137, -0.335999995470047, -0.25099998712539673],
        [0, 3.402820018375656e+38, 3.402820018375656e+38, 3.402820018375656e+38],
        [1, 0, 0, 0],
        [0.7183529734611511, -0.32499998807907104, -0.5619999766349792, -0.25],
        [0, 0, 0, 0]
    ];

    /*
     * test
     *
     * @tc.name: Sensor_CreateQuaternion_016
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     * @tc.require: I5SWJI
     * @tc.author:
     */
    it('Sensor_CreateQuaternion_016', 0, async function (done) {
        sensor.getQuaternion([0.52, -0.336, -0.251], undefined).then((data) => {
            console.info('Sensor_CreateQuaternion_016');
            for (let i = 0; i < data.length; i++) {
                console.info("data[" + i + "]: " + data[i]);
                expect(data[i]).assertEqual(result[0][i])
            }
            done()
        }, (error) => {
            expect(false).assertTrue();
            done()
        })
    })

    /*
     * test
     *
     * @tc.name: Sensor_CreateQuaternion_017
     * @tc.desc: Verification results of the incorrect parameters of the test interface.
     * @tc.require: I5SWJI
     * @tc.author:
     */
    it('Sensor_CreateQuaternion_017', 0, async function (done) {
        sensor.getQuaternion([0.52, -0.336, -0.251], null).then((data) => {
            console.info('Sensor_CreateQuaternion_017');
            for (let i = 0; i < data.length; i++) {
                console.info("data[" + i + "]: " + data[i]);
                expect(data[i]).assertEqual(result[0][i])
            }
            done()
        }, (error) => {
            expect(false).assertTrue();
            done()
        })
    })

    const getGeomagneticDipResult = [ 0.8760581016540527, 0.862170, -Infinity, 44330];

    /*
    * @tc.name: Sensor_GetGeomagneticDip_008
    * @tc.desc: Verification results of the incorrect parameters of test interface.
    * @tc.require: I5SWJI
    * @tc.author:
    */
    it('Sensor_GetGeomagneticDip_008', 0, async function (done) {
        sensor.getInclination([1, 2, 3, 4, 5, 6, 7, 8, 9], undefined).then((data) => {
            console.info("Sensor_GetGeomagneticDip_008" + data)
            expect(data).assertEqual(getGeomagneticDipResult[0])
            done()
        }, (error) => {
            console.info('Sensor_GetGeomagneticDip_008 failed');
            expect(false).assertTrue();
            done()
        });
    })

    /*
    * @tc.name: Sensor_GetGeomagneticDip_009
    * @tc.desc: Verification results of the incorrect parameters of test interface.
    * @tc.require: I5SWJI
    * @tc.author:
    */
    it('Sensor_GetGeomagneticDip_009', 0, async function (done) {
        sensor.getInclination([1, 2, 3, 4, 5, 6, 7, 8, 9], null).then((data) => {
            console.info("Sensor_GetGeomagneticDip_009" + data)
            expect(data).assertEqual(getGeomagneticDipResult[0])
            done()
        }, (error) => {
            console.info('Sensor_GetGeomagneticDip_009 failed');
            expect(false).assertTrue();
            done()
        });
    })
	
    /*
    * @tc.name: Sensor_GetAltitude_009
    * @tc.desc: Verification results of the incorrect parameters of test interface.
    * @tc.require: I5SWJI
    * @tc.author:
    */
    it('Sensor_GetAltitude_009', 0, async function (done) {
        sensor.getDeviceAltitude(0, 100, undefined).then((data) => {
            console.info("Sensor_GetAltitude_009" + data)
            expect(data).assertEqual(getGeomagneticDipResult[2])
            done()
        }, (error) => {
            console.info('Sensor_GetAltitude_009 failed');
            expect(false).assertTrue();
            done()
        });
    })

    /*
    * @tc.name: Sensor_GetAltitude_010
    * @tc.desc: Verification results of the incorrect parameters of test interface.
    * @tc.require: I5SWJI
    * @tc.author:
    */
    it('Sensor_GetAltitude_010', 0, async function (done) {
        sensor.getDeviceAltitude(0, 100, null).then((data) => {
            console.info("Sensor_GetAltitude_010" + data)
            expect(data).assertEqual(getGeomagneticDipResult[2])
            done()
        }, (error) => {
            console.info('Sensor_GetAltitude_010 failed');
            expect(false).assertTrue();
            done()
        });
    })

    /*
    * @tc.name: Sensor_GetAltitude_011
    * @tc.desc: Verification results of the incorrect parameters of test interface.
    * @tc.require: I5SWJI
    * @tc.author:
    */
    it('Sensor_GetAltitude_011', 0, async function (done) {
        sensor.getDeviceAltitude(0, 100, "abc").then((data) => {
            console.info("Sensor_GetAltitude_011" + data)
            expect(data).assertEqual(getGeomagneticDipResult[2])
            done()
        }, (error) => {
            console.info('Sensor_GetAltitude_011 failed');
            expect(false).assertTrue();
            done()
        });
    })

    let transformCoordinateSystemResult = [
    [1.500000, 1.500000, 1.500000, 1.500000, 1.500000, 1.500000, 1.500000, 1.500000, 1.500000],
    [340282001837565600000000000000000000000.000000, 340282001837565600000000000000000000000.000000, 340282001837565600000000000000000000000.000000,
     340282001837565600000000000000000000000.000000, 340282001837565600000000000000000000000.000000, 340282001837565600000000000000000000000.000000,
     340282001837565600000000000000000000000.000000, 340282001837565600000000000000000000000.000000, 340282001837565600000000000000000000000.000000],
     [Infinity, -Infinity, Infinity, Infinity, -Infinity, Infinity, Infinity, -Infinity, Infinity]]

    /*
    * @tc.name: Sensor_TransformCoordinateSystem_011
    * @tc.desc: Verification results of the incorrect parameters of test interface.
    * @tc.require: I5SWJI
    * @tc.author:
    */
    it("Sensor_TransformCoordinateSystem_011", 0, async function (done) {
        console.info("---------------------------Sensor_TransformCoordinateSystem_011----------------------------------");
        sensor.transformRotationMatrix([1.5, 1.5, 1.5, 1.5, 1.5, 1.5, 1.5, 1.5, 1.5], {'x':1, 'y':2}, undefined).then((data) => {
            for (let i = 0; i < data.length; i++) {
                console.info("Sensor_TransformCoordinateSystem_011 data[ " + i + "] = " + data[i]);
                expect(data[i]).assertEqual(transformCoordinateSystemResult[0][i]);
            }
            done()
        }, (error) => {
            console.info('Sensor_TransformCoordinateSystem_011 failed');
            expect(false).assertTrue();
            done()
        });
    })

    /*
    * @tc.name: Sensor_TransformCoordinateSystem_012
    * @tc.desc: Verification results of the incorrect parameters of test interface.
    * @tc.require: I5SWJI
    * @tc.author:
    */
    it("Sensor_TransformCoordinateSystem_012", 0, async function (done) {
        console.info("---------------------------Sensor_TransformCoordinateSystem_012----------------------------------");
        sensor.transformRotationMatrix([1.5, 1.5, 1.5, 1.5, 1.5, 1.5, 1.5, 1.5, 1.5], {'x':1, 'y':2}, null).then((data) => {
            for (let i = 0; i < data.length; i++) {
                console.info("Sensor_TransformCoordinateSystem_012 data[ " + i + "] = " + data[i]);
                expect(data[i]).assertEqual(transformCoordinateSystemResult[0][i]);
            }
            done()
        }, (error) => {
            console.info('Sensor_TransformCoordinateSystem_012 failed');
            expect(false).assertTrue();
            done()
        });
    })

    /*
    * @tc.name: Sensor_TransformCoordinateSystem_013
    * @tc.desc: Verification results of the incorrect parameters of test interface.
    * @tc.require: I5SWJI
    * @tc.author:
    */
    it("Sensor_TransformCoordinateSystem_013", 0, async function (done) {
        console.info("---------------------------Sensor_TransformCoordinateSystem_013----------------------------------");
        sensor.transformRotationMatrix([1.5, 1.5, 1.5, 1.5, 1.5, 1.5, 1.5, 1.5, 1.5], {'x':1, 'y':2}, "abc").then((data) => {
            for (let i = 0; i < data.length; i++) {
                console.info("Sensor_TransformCoordinateSystem_013 data[ " + i + "] = " + data[i]);
                expect(data[i]).assertEqual(transformCoordinateSystemResult[0][i]);
            }
            done()
        }, (error) => {
            console.info('Sensor_TransformCoordinateSystem_013 failed');
            expect(false).assertTrue();
            done()
        });
    })
})}