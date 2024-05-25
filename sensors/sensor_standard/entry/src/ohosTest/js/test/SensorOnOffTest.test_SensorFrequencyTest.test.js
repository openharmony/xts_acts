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
import sensor from '@ohos.sensor'

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'

export default function SensorJsTest_sensor_63() {
describe("SensorJsTest_sensor_63", function () {
    function callback(data) {
        console.info('callback' + JSON.stringify(data));
        expect(typeof(data.x)).assertEqual('number');
        expect(typeof(data.y)).assertEqual('number');
        expect(typeof(data.z)).assertEqual('number');
    }

    function callback2(data) {
        console.info('callback2' + JSON.stringify(data));
        expect(typeof(data.alpha)).assertEqual('number');
        expect(typeof(data.beta)).assertEqual('number');
        expect(typeof(data.gamma)).assertEqual('number');
    }

    beforeAll(async function() {
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

    const PERMISSION_DENIED_CODE = 201
    const PARAMETER_ERROR_CODE = 401
    const PARAMETER_ERROR_MSG = 'The parameter invalid.'
    const PERMISSION_DENIED_MSG = 'Permission denied.'

    /*
     * @tc.name:SUBSensorsSystemNewFrequencyJSTest0010
     * @tc.desc:verify app info is not null
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level: Level 0
     * @tc.require: Issue Number
     * @tc.number:SUBSensorsSystemNewFrequencyJSTest0010
     */
    it("SUBSensorsSystemNewFrequencyJSTest0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        console.info('----------------------SUBSensorsSystemNewFrequencyJSTest0010---------------------------');
        try {
            sensor.getSingleSensor(sensor.SensorId.ACCELEROMETER, (err, data) => {
                if (err) {
                    console.error('getSingleSensor fail, errCode:' + err.code + ' ,msg:' + err.message);
                    done();
                } else {
                try {
                    sensor.on(sensor.SensorId.ACCELEROMETER, callback, {'interval': 'game'});
                    setTimeout(() => {
                        sensor.off(sensor.SensorId.ACCELEROMETER);
                        done();
                    }, 500);
                } catch (err) {
                    console.error('On fail, errCode:' + err.code + ' ,msg:' + err.message);
                    expect(false).assertTrue();
                    done();
                }
                }
            });
        } catch (err) {
            console.error('Sensor is not support');
            done();
        }
    })

    /*
    * @tc.name:SUBSensorsSystemNewFrequencyJSTest0020
    * @tc.desc:verify app info is not null
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 3
    * @tc.require: Issue Number
    * @tc.number:SUBSensorsSystemNewFrequencyJSTest0020
    */
    it("SUBSensorsSystemNewFrequencyJSTest0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------SUBSensorsSystemNewFrequencyJSTest0020---------------------------');
            try {
                sensor.getSingleSensor(sensor.SensorId.ACCELEROMETER, (err, data) => {
                    if (err) {
                        console.error('getSingleSensor fail, errCode:' + err.code + ' ,msg:' + err.message);
                        done();
                    } else {
                    try {
                        sensor.on(sensor.SensorId.ACCELEROMETER, callback, {'interval': 'ui'});
                        setTimeout(() => {
                            sensor.off(sensor.SensorId.ACCELEROMETER);
                            done();
                        }, 500);
                    } catch (err) {
                        console.error('On fail, errCode:' + err.code + ' ,msg:' + err.message);
                        expect(false).assertTrue();
                        done();
                    }
                    }
                });
            } catch (err) {
                console.error('Sensor is not support');
                done();
            }
        })

    /*
    * @tc.name:SUBSensorsSystemNewFrequencyJSTest0030
    * @tc.desc:verify app info is not null
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 3
    * @tc.require: Issue Number
    * @tc.number:SUBSensorsSystemNewFrequencyJSTest0030
    */
    it("SUBSensorsSystemNewFrequencyJSTest0030", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------SUBSensorsSystemNewFrequencyJSTest0030---------------------------');
        try {
            sensor.getSingleSensor(sensor.SensorId.ACCELEROMETER, (err, data) => {
                if (err) {
                    console.error('getSingleSensor fail, errCode:' + err.code + ' ,msg:' + err.message);
                    done();
                } else {
                try {
                    sensor.on(sensor.SensorId.ACCELEROMETER, callback, {'interval': 'normal'});
                    setTimeout(() => {
                        sensor.off(sensor.SensorId.ACCELEROMETER);
                        done();
                    }, 500);
                } catch (err) {
                    console.error('On fail, errCode:' + err.code + ' ,msg:' + err.message);
                    expect(false).assertTrue();
                    done();
                }
                }
            });
        } catch (err) {
            console.error('Sensor is not support');
            done();
        }
    })

    /*
    * @tc.name:SUBSensorsSystemNewFrequencyJSTest0040
    * @tc.desc:verify app info is not null
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 3
    * @tc.require: Issue Number
    * @tc.number:SUBSensorsSystemNewFrequencyJSTest0040
    */
    it("SUBSensorsSystemNewFrequencyJSTest0040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------SUBSensorsSystemNewFrequencyJSTest0040---------------------------');
        try {
            sensor.getSingleSensor(sensor.SensorId.GYROSCOPE, (err, data) => {
                if (err) {
                    console.error('getSingleSensor fail, errCode:' + err.code + ' ,msg:' + err.message);
                    done();
                } else {
                try {
                    sensor.on(sensor.SensorId.GYROSCOPE, callback, {'interval': 'game'});
                    setTimeout(() => {
                        sensor.off(sensor.SensorId.GYROSCOPE);
                        done();
                    }, 500);
                } catch (err) {
                    console.error('On fail, errCode:' + err.code + ' ,msg:' + err.message);
                    expect(false).assertTrue();
                    done();
                }
                }
            });
        } catch (err) {
            console.error('Sensor is not support');
            done();
        }
    })

    /*
    * @tc.name:SUBSensorsSystemNewFrequencyJSTest0050
    * @tc.desc:verify app info is not null
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 3
    * @tc.require: Issue Number
    * @tc.number:SUBSensorsSystemNewFrequencyJSTest0050
    */
    it("SUBSensorsSystemNewFrequencyJSTest0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------SUBSensorsSystemNewFrequencyJSTest0050---------------------------');
        try {
            sensor.getSingleSensor(sensor.SensorId.GYROSCOPE, (err, data) => {
                if (err) {
                    console.error('getSingleSensor fail, errCode:' + err.code + ' ,msg:' + err.message);
                    done();
                } else {
                try {
                    sensor.on(sensor.SensorId.GYROSCOPE, callback, {'interval': 'ui'});
                    setTimeout(() => {
                        sensor.off(sensor.SensorId.GYROSCOPE);
                        done();
                    }, 500);
                } catch (err) {
                    console.error('On fail, errCode:' + err.code + ' ,msg:' + err.message);
                    expect(false).assertTrue();
                    done();
                }
                }
            });
        } catch (err) {
            console.error('Sensor is not support');
            done();
        }
    })

    /*
    * @tc.name:SUBSensorsSystemNewFrequencyJSTest0060
    * @tc.desc:verify app info is not null
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 3
    * @tc.require: Issue Number
    * @tc.number:SUBSensorsSystemNewFrequencyJSTest0060
    */
    it("SUBSensorsSystemNewFrequencyJSTest0060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------SUBSensorsSystemNewFrequencyJSTest0060---------------------------');
        try {
            sensor.getSingleSensor(sensor.SensorId.GYROSCOPE, (err, data) => {
                if (err) {
                    console.error('getSingleSensor fail, errCode:' + err.code + ' ,msg:' + err.message);
                    done();
                } else {
                try {
                    sensor.on(sensor.SensorId.GYROSCOPE, callback, {'interval': 'normal'});
                    setTimeout(() => {
                        sensor.off(sensor.SensorId.GYROSCOPE);
                        done();
                    }, 500);
                } catch (err) {
                    console.error('On fail, errCode:' + err.code + ' ,msg:' + err.message);
                    expect(false).assertTrue();
                    done();
                }
                }
            });
        } catch (err) {
            console.error('Sensor is not support');
            done();
        }
    })

    /*
    * @tc.name:SUBSensorsSystemNewFrequencyJSTest0070
    * @tc.desc:verify app info is not null
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 3
    * @tc.require: Issue Number
    * @tc.number:SUBSensorsSystemNewFrequencyJSTest0070
    */
    it("SUBSensorsSystemNewFrequencyJSTest0070", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------SUBSensorsSystemNewFrequencyJSTest0070---------------------------');
        try {
            sensor.getSingleSensor(sensor.SensorId.ORIENTATION, (err, data) => {
                if (err) {
                    console.error('getSingleSensor fail, errCode:' + err.code + ' ,msg:' + err.message);
                    done();
                } else {
                try {
                    sensor.on(sensor.SensorId.ORIENTATION, callback2, {'interval': 'game'});
                    setTimeout(() => {
                        sensor.off(sensor.SensorId.ORIENTATION);
                        done();
                    }, 500);
                } catch (err) {
                    console.error('On fail, errCode:' + err.code + ' ,msg:' + err.message);
                    expect(false).assertTrue();
                    done();
                }
                }
            });
        } catch (err) {
            console.error('Sensor is not support');
            done();
        }
    })

    /*
    * @tc.name:SUBSensorsSystemNewFrequencyJSTest0080
    * @tc.desc:verify app info is not null
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 3
    * @tc.require: Issue Number
    * @tc.number:SUBSensorsSystemNewFrequencyJSTest0080
    */
    it("SUBSensorsSystemNewFrequencyJSTest0080", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------SUBSensorsSystemNewFrequencyJSTest0080---------------------------');
        try {
            sensor.getSingleSensor(sensor.SensorId.ORIENTATION, (err, data) => {
                if (err) {
                    console.error('getSingleSensor fail, errCode:' + err.code + ' ,msg:' + err.message);
                    done();
                } else {
                try {
                    sensor.on(sensor.SensorId.ORIENTATION, callback2, {'interval': 'ui'});
                    setTimeout(() => {
                        sensor.off(sensor.SensorId.ORIENTATION);
                        done();
                    }, 500);
                } catch (err) {
                    console.error('On fail, errCode:' + err.code + ' ,msg:' + err.message);
                    expect(false).assertTrue();
                    done();
                }
                }
            });
        } catch (err) {
            console.error('Sensor is not support');
            done();
        }
    })

    /*
    * @tc.name:SUBSensorsSystemNewFrequencyJSTest0090
    * @tc.desc:verify app info is not null
    * @tc.size: MediumTest
    * @tc.type: Function
    * @tc.level: Level 3
    * @tc.require: Issue Number
    * @tc.number:SUBSensorsSystemNewFrequencyJSTest0090
    */
    it("SUBSensorsSystemNewFrequencyJSTest0090", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async function (done) {
        console.info('----------------------SUBSensorsSystemNewFrequencyJSTest0090---------------------------');
        try {
            sensor.getSingleSensor(sensor.SensorId.ORIENTATION, (err, data) => {
                if (err) {
                    console.error('getSingleSensor fail, errCode:' + err.code + ' ,msg:' + err.message);
                    done();
                } else {
                try {
                    sensor.on(sensor.SensorId.ORIENTATION, callback2, {'interval': 'normal'});
                    setTimeout(() => {
                        sensor.off(sensor.SensorId.ORIENTATION);
                        done();
                    }, 500);
                } catch (err) {
                    console.error('On fail, errCode:' + err.code + ' ,msg:' + err.message);
                    expect(false).assertTrue();
                    done();
                }
                }
            });
        } catch (err) {
            console.error('Sensor is not support');
            done();
        }
    })
})}