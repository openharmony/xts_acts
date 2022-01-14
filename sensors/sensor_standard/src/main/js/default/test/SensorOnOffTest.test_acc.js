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

    /*
     * @tc.name:SensorJsTest001
     * @tc.desc:verify app info is not null
     * @tc.type: FUNC
     * @tc.require: Issue Number
     */
    it("SensorJsTest001", 0, async function (done) {
        console.info('----------------------SensorJsTest001---------------------------');
        function offPromise() {
            return new Promise((resolve, reject) => {
                sensor.off(sensor.SensorType.SENSOR_TYPE_ID_ACCELEROMETER, (error) => {
                    if (error) {
                        console.info('SensorJsTest001  off error');
                        expect(false).assertTrue();
                        console.info('setTimeout ..start')
                        setTimeout((err) => {
                            reject(err);
                        }, 500);
                    } else {
                        console.info('SensorJsTest001  off success');
                        expect(true).assertTrue();
                        setTimeout(() => {
                            resolve();
                        }, 500);
                    }
                }, 1000)
            })
        }

        let promise = new Promise((resolve, reject) => {
            sensor.on(sensor.SensorType.SENSOR_TYPE_ID_ACCELEROMETER, function (error, data) {
                if (error) {
                    console.info('SensorJsTest001  on error');
                    expect(false).assertTrue();
                    setTimeout((err) => {
                        reject(err);
                    }, 500);
                } else {
                    console.info('SensorJsTest001  on success, x: ' + data.x + "y: " + data.y + "z: " + data.z);
                    expect(typeof (data.x)).assertEqual("number");
                    expect(typeof (data.y)).assertEqual("number");
                    expect(typeof (data.z)).assertEqual("number");
                    setTimeout(() => {
                        resolve();
                    }, 500);
                }
            });
        })

        await promise.then(() => {
            return offPromise();
        }, () => {
            console.info("SensorJsTest001 reject");
        })
        done();
    })

    /*
     * @tc.name:SensorJsTest002
     * @tc.desc:verify app info is not null
     * @tc.type: FUNC
     * @tc.require: Issue Number
     */
    it("SensorJsTest002", 0, async function (done) {
        console.info('----------------------SensorJsTest002---------------------------');
        function onSensorCallback(error, data) {
            if (error) {
                console.info('SensorJsTest002  on success');
                expect(true).assertTrue();
            } else {
                console.info('SensorJsTest002  on error');
                expect(false).assertTrue();
            }
            setTimeout(() => {
                done();
            }, 500);
        }
        sensor.on(-1, onSensorCallback);
    })

    /*
     * @tc.name:SensorJsTest003
     * @tc.desc:verify app info is not null
     * @tc.type: FUNC
     * @tc.require: Issue Number
     */
    it("SensorJsTest003", 0, async function (done) {
        console.info('----------------------SensorJsTest003---------------------------');
        function offPromise() {
            return new Promise((resolve, reject) => {
                sensor.off(1, (error) => {
                    if (error) {
                        console.info('SensorJsTest003  off error');
                        expect(false).assertTrue();
                        setTimeout((err) => {
                            done();
                            reject(err);
                        }, 500);
                    } else {
                        console.info('SensorJsTest003  off success');
                        expect(true).assertTrue();
                        setTimeout(() => {
                            done();
                            resolve();
                        }, 500);
                    }
                }, 1000)
            })
        }

        let promise = new Promise((resolve, reject) => {
            sensor.on(1, function (error, data) {
                if (error) {
                    console.info('SensorJsTest003  on error');
                    expect(false).assertTrue();
                    setTimeout((err) => {
                        reject(err);
                    }, 500);
                } else {
                    console.info('SensorJsTest003  on success x: ' + data.x + "y: " + data.y + "z: " + data.z);
                    expect(typeof (data.x)).assertEqual("number");
                    expect(typeof (data.y)).assertEqual("number");
                    expect(typeof (data.z)).assertEqual("number");
                    setTimeout(() => {
                        resolve();
                    }, 500);
                }
            }, { 'interval': 200000000 });
        })

        await promise.then(() => {
            return offPromise();
        }, () => {
            console.info("SensorJsTest003 reject");
        })
        done();
    })

    /*
     * @tc.name:SensorJsTest004
     * @tc.desc:verify app info is not null
     * @tc.type: FUNC
     * @tc.require: Issue Number
     */
    it("SensorJsTest004", 0, function () {
        console.info('----------------------SensorJsTest004---------------------------');
        sensor.on(1, function () { }, { 'interval': 100000000 }, 5);
        expect(true).assertTrue();
        console.info('----------------------SensorJsTest004--------------------------- end');
    })

    /*
     * @tc.name:SensorJsTest005
     * @tc.desc:verify app info is not null
     * @tc.type: FUNC
     * @tc.require: Issue Number
     */
    it("SensorJsTest005", 0, async function (done) {
        function onceSensorCallback(error, data) {
            if (error) {
                console.info('SensorJsTest005  once error');
                expect(false).assertTrue();
            } else {
                console.info('SensorJsTest005  once success x: ' + data.x + "y: " + data.y + "z: " + data.z);
                expect(typeof (data.x)).assertEqual("number");
                expect(typeof (data.y)).assertEqual("number");
                expect(typeof (data.z)).assertEqual("number");
            }
            setTimeout(() => {
                done();
            }, 500);
        }
        sensor.once(sensor.SensorType.SENSOR_TYPE_ID_ACCELEROMETER, onceSensorCallback);
    })

    /*
     * @tc.name:SensorJsTest006
     * @tc.desc:verify app info is not null
     * @tc.type: FUNC
     * @tc.require: Issue Number
     */
    it("SensorJsTest006", 0, async function (done) {
        function onceSensorCallback(error, data) {
            if (error) {
                console.info('SensorJsTest006  on success');
                expect(true).assertTrue();
            } else {
                console.info('SensorJsTest006  on error');
                expect(false).assertTrue();
            }
            setTimeout(() => {
                done();
            }, 500);
        }
        sensor.once(-1, onceSensorCallback);
    })

    /*
     * @tc.name:SensorJsTest007
     * @tc.desc:verify app info is not null
     * @tc.type: FUNC
     * @tc.require: Issue Number
     */
    it("SensorJsTest007", 0, function () {
        sensor.once(1, function () { }, 5);
        expect(true).assertTrue();
    })

    /*
     * @tc.name:SensorJsTest008
     * @tc.desc:verify app info is not null
     * @tc.type: FUNC
     * @tc.require: Issue Number
     */
    it("SensorJsTest008", 0, async function (done) {
        function offCallback(error) {
            if (error) {
                console.info('SensorJsTest008  off success');
                expect(true).assertTrue();
            } else {
                console.info('SensorJsTest008  off error');
                expect(false).assertTrue();
            }
            setTimeout(() => {
                done();
            }, 500);
        }
        sensor.off(-1, offCallback);
    })

    /*
     * @tc.name:SensorJsTest009
     * @tc.desc:verify app info is not null
     * @tc.type: FUNC
     * @tc.require: Issue Number
     */
    it("SensorJsTest009", 0, async function (done) {
        function offCallback(error) {
            if (error) {
                console.info('SensorJsTest009  off success');
                expect(true).assertTrue();
            } else {
                console.info('SensorJsTest009  off error');
                expect(false).assertTrue();
            }
            setTimeout(() => {
                done();
            }, 500);
        }
        sensor.off(1, offCallback);
    })

    /*
     * @tc.name:SensorJsTest010
     * @tc.desc:verify app info is not null
     * @tc.type: FUNC
     * @tc.require: Issue Number
     */
    it("SensorJsTest010", 0, async function (done) {
        function offCallback(error) {
            if (error) {
                console.info('SensorJsTest010  off success');
                expect(true).assertTrue();
            } else {
                console.info('SensorJsTest010  off error');
                expect(false).assertTrue();
            }
            setTimeout(() => {
                done();
            }, 500);
        }
        sensor.off(1000000, offCallback);
    })

    /*
     * @tc.name:SensorJsTest011
     * @tc.desc:verify app info is not null
     * @tc.type: FUNC
     * @tc.require: Issue Number
     */
    it("SensorJsTest011", 0, async function (done) {
        function onceSensorCallback(error, data) {
            if (error) {
                console.info('SensorJsTest011  once success');
                expect(true).assertTrue();
            } else {
                console.info('SensorJsTest011  once error');
                expect(false).assertTrue();
            }
            setTimeout(() => {
                done();
            }, 500);
        }
        sensor.once(1000000, onceSensorCallback);
    })

    /*
     * @tc.name:SensorJsTest012
     * @tc.desc:verify app info is not null
     * @tc.type: FUNC
     * @tc.require: Issue Number
     */
    it("SensorJsTest012", 0, async function (done) {
        function onCallback(error) {
            if (error) {
                console.info('SensorJsTest012  on success');
                expect(true).assertTrue();
            } else {
                console.info('SensorJsTest012  on error');
                expect(false).assertTrue();
            }
            setTimeout(() => {
                done();
            }, 500);
        }
        sensor.on(1000000, onCallback);
    })

    /*
     * @tc.name:SensorJsTest013
     * @tc.desc:verify app info is not null
     * @tc.type: FUNC
     * @tc.require: Issue Number
     */
    it("SensorJsTest013", 0, function () {
        sensor.off(1, 5);
        expect(true).assertTrue();
    })


    /*
     * @tc.name:SensorJsTest014
     * @tc.desc:verify app info is not null
     * @tc.type: FUNC
     * @tc.require: Issue Number
     */
    it("SensorJsTest014", 0, async function (done) {
        console.info('----------------------SensorJsTest014---------------------------');
        function offPromise2() {
            return new Promise((resolve, reject) => {
                sensor.off(1, (error) => {
                    if (error) {
                        console.info('SensorJsTest014  off2 success');
                        expect(true).assertTrue();
                        setTimeout(() => {
                            done(err);
                            reject(err)
                        }, 500);
                    } else {
                        console.info('SensorJsTest014  off2 error');
                        expect(false).assertTrue();
                        setTimeout(() => {
                            done();
                            resolve()
                        }, 500);
                    }
                });
            })
        }

        function offPromise1() {
            return new Promise((resolve, reject) => {
                sensor.off(1, (error) => {
                    if (error) {
                        console.info('SensorJsTest014  off1  error');
                        expect(false).assertTrue();
                        setTimeout((err) => {
                            reject(err);
                        }, 500);
                    } else {
                        console.info('SensorJsTest014  off1  success');
                        expect(true).assertTrue();
                        setTimeout(() => {
                            resolve();
                        }, 500);
                    }
                });
            })
        }

        let promise = new Promise((resolve, reject) => {
            sensor.on(1, function (error, data) {
                if (error) {
                    console.info('SensorJsTest014  on error');
                    expect(false).assertTrue();
                    setTimeout((err) => {
                        reject(err);
                    }, 500);
                } else {
                    console.info('SensorJsTest014  on success x: ' + data.x + "y: " + data.y + "z: " + data.z);
                    expect(typeof (data.x)).assertEqual("number");
                    expect(typeof (data.y)).assertEqual("number");
                    expect(typeof (data.z)).assertEqual("number");
                    setTimeout(() => {
                        resolve();
                    }, 500);
                }
            });
        })

        await promise.then(() => {
            return offPromise1();
        }).then(() => {
            return offPromise2();
        });
        done();
    })

    /*
     * @tc.name:SensorJsTest015
     * @tc.desc:verify app info is not null
     * @tc.type: FUNC
     * @tc.require: Issue Number
     */
    it("SensorJsTest015", 0, async function (done) {
        console.info('----------------------SensorJsTest015---------------------------');
        function offPromise() {
            return new Promise((resolve, reject) => {
                sensor.off(1, (error) => {
                    if (error) {
                        console.info('SensorJsTest015  off error');
                        expect(false).assertTrue();
                        setTimeout((err) => {
                            done();
                            reject(err);
                        }, 500);
                    } else {
                        console.info('SensorJsTest015  off success');
                        expect(true).assertTrue();
                        setTimeout(() => {
                            done();
                            resolve();
                        }, 500);
                    }
                });
            })
        }
        function onPromise2() {
            return new Promise((resolve, reject) => {
                sensor.on(1, function (error, data) {
                    if (error) {
                        console.info('SensorJsTest015  on2 error');
                        expect(false).assertTrue();
                        setTimeout((err) => {
                            reject(err);
                        }, 500);
                    } else {
                        console.info('SensorJsTest015  on2 success x: ' + data.x + "y: " + data.y + "z: " + data.z);
                        expect(typeof (data.x)).assertEqual("number");
                        expect(typeof (data.y)).assertEqual("number");
                        expect(typeof (data.z)).assertEqual("number");
                        setTimeout(() => {
                            resolve();
                        }, 500);
                    }
                });
            })
        }

        let onPromise1 = new Promise((resolve, reject) => {
            sensor.on(1, function (error, data) {
                if (error) {
                    console.info('SensorJsTest015  on1 error');
                    expect(false).assertTrue();
                    setTimeout((err) => {
                        reject(err);
                    }, 500);
                } else {
                    console.info('SensorJsTest015  on1 success x: ' + data.x + "y: " + data.y + "z: " + data.z);
                    expect(typeof (data.x)).assertEqual("number");
                    expect(typeof (data.y)).assertEqual("number");
                    expect(typeof (data.z)).assertEqual("number");
                    setTimeout(() => {
                        resolve();
                    }, 500);
                }
            });
        })

        await onPromise1.then(() => {
            return onPromise2();
        }).then(() => {
            return offPromise();
        });
        done();
    })


    /*
     * @tc.name:SensorJsTest016
     * @tc.desc:verify app info is not null
     * @tc.type: FUNC
     * @tc.require: Issue Number
     */
    it("SensorJsTest016", 0, async function (done) {
        console.info('----------------------SensorJsTest016---------------------------');
        function offPromise() {
            return new Promise((resolve, reject) => {
                sensor.off(1, (error) => {
                    if (error) {
                        console.info('SensorJsTest016  off error');
                        expect(false).assertTrue();
                        setTimeout((err) => {
                            done();
                            reject(err);
                        }, 500);
                    } else {
                        console.info('SensorJsTest016  off success');
                        expect(true).assertTrue();
                        setTimeout(() => {
                            done();
                            resolve();
                        }, 500);
                    }
                });
            })
        }
        function oncePromise() {
            return new Promise((resolve, reject) => {
                sensor.once(1, function (error, data) {
                    if (error) {
                        console.info('SensorJsTest016  once error');
                        expect(false).assertTrue();
                        setTimeout((err) => {
                            reject(err);
                        }, 500);
                    } else {
                        console.info('SensorJsTest016  once success x: ' + data.x + "y: " + data.y + "z: " + data.z);
                        expect(typeof (data.x)).assertEqual("number");
                        expect(typeof (data.y)).assertEqual("number");
                        expect(typeof (data.z)).assertEqual("number");
                        setTimeout(() => {
                            resolve();
                        }, 500);
                    }
                });
            })
        }

        let onPromise1 = new Promise((resolve, reject) => {
            sensor.on(1, function (error, data) {
                if (error) {
                    console.info('SensorJsTest016  on1 error');
                    expect(false).assertTrue();
                    setTimeout((err) => {
                        reject(err);
                    }, 500);
                } else {
                    console.info('SensorJsTest016  on1 success x: ' + data.x + "y: " + data.y + "z: " + data.z);
                    expect(typeof (data.x)).assertEqual("number");
                    expect(typeof (data.y)).assertEqual("number");
                    expect(typeof (data.z)).assertEqual("number");
                    setTimeout(() => {
                        resolve();
                    }, 500);
                }
            });
        })

        await onPromise1.then(() => {
            return oncePromise();
        }).then(() => {
            return offPromise();
        });
        done();
    })
})
