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

import cellular from "@ohos.telephony.data";
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "deccjsunit/index";

const SLOT_ID = 0;
const ERR_SLOT_ID = 3;

describe("TelephonyCellularDataRoaming", function () {

    /*
     * @tc.number   Telephony_CellularData_enableCellularDataRoaming_Async_0100
     * @tc.name     Call enableCellularDataRoaming interface, normal into the reference, to check the correction results
     * @tc.desc     Function test
     */
    it("Telephony_CellularData_enableCellularDataRoaming_Async_0100", 0, async function (done) {
        cellular.isCellularDataRoamingEnabled(SLOT_ID, (err, data) => {
            if (err) {
                expect().assertFail();
                console.log("Telephony_CellularData_enableCellularDataRoaming_Async_0100 fail");
                done();
                return;
            }
            expect(data === false).assertTrue();
            console.log("Telephony_CellularData_enableCellularDataRoaming_Async_0100 finish");
            cellular.enableCellularDataRoaming(SLOT_ID, (err) => {
                if (err) {
                    expect().assertFail();
                    console.log("Telephony_CellularData_enableCellularDataRoaming_Async_0100 enableCellularData fail");
                    done();
                    return;
                }
                console.log("Telephony_CellularData_enableCellularDataRoaming_Async_0100 enableCellularData finish");
                cellular.isCellularDataRoamingEnabled(SLOT_ID, (err, data) => {
                    if (err) {
                        expect().assertFail();
                        console.log("Telephony_CellularData_enableCellularDataRoaming_Async_0100 fail");
                        done();
                        return;
                    }
                    expect(data).assertTrue();
                    console.log("Telephony_CellularData_enableCellularDataRoaming_Async_0100 finish");
                    cellular.disableCellularDataRoaming(SLOT_ID, (err) => {
                        if (err) {
                            expect().assertFail();
                            console.log(
                                "Telephony_CellularData_enableCellularDataRoaming_Async_0100 " +
                                "disableCellularDataRoaming fail"
                            );
                            done();
                            return;
                        }
                        console.log(
                            "Telephony_CellularData_enableCellularDataRoaming_Async_0100 " +
                            "disableCellularDataRoaming finish"
                        );
                        done();
                    })
                })
            })
        })
    })

    /*
     * @tc.number   Telephony_CellularData_enableCellularDataRoaming_Async_0200
     * @tc.name     Roaming switch in open state, called again enableCellularDataRoaming () interface, was introduced
     *              into normal into the parameter, to check the correction results
     * @tc.desc     Function test
     */
    it("Telephony_CellularData_enableCellularDataRoaming_Async_0200", 0, async function (done) {
        cellular.enableCellularDataRoaming(SLOT_ID, (err) => {
            if (err) {
                expect().assertFail();
                console.log("Telephony_CellularData_enableCellularDataRoaming_Async_0200 enableCellularData fail");
                done();
                return;
            }
            console.log("Telephony_CellularData_enableCellularDataRoaming_Async_0200 enableCellularData finish");
            cellular.isCellularDataRoamingEnabled(SLOT_ID, (err, data) => {
                if (err) {
                    expect().assertFail();
                    console.log("Telephony_CellularData_enableCellularDataRoaming_Async_0200 fail");
                    done();
                    return;
                }
                expect(data).assertTrue();
                console.log("Telephony_CellularData_enableCellularDataRoaming_Async_0200 finish");
                cellular.enableCellularDataRoaming(SLOT_ID, (err) => {
                    if (err) {
                        expect().assertFail();
                        console.log(
                            "Telephony_CellularData_enableCellularDataRoaming_Async_0200 enableCellularData fail"
                        );
                        done();
                        return;
                    }
                    console.log(
                        "Telephony_CellularData_enableCellularDataRoaming_Async_0200 enableCellularData finish"
                    );
                    cellular.isCellularDataRoamingEnabled(SLOT_ID, (err, data) => {
                        if (err) {
                            expect().assertFail();
                            console.log("Telephony_CellularData_enableCellularDataRoaming_Async_0200 fail");
                            done();
                            return;
                        }
                        expect(data).assertTrue();
                        console.log("Telephony_CellularData_enableCellularDataRoaming_Async_0200 finish");
                        cellular.disableCellularDataRoaming(SLOT_ID, (err) => {
                            if (err) {
                                expect().assertFail();
                                console.log(
                                    "Telephony_CellularData_enableCellularDataRoaming_Async_0200 " +
                                    "disableCellularDataRoaming fail"
                                );
                                done();
                                return;
                            }
                            console.log(
                                "Telephony_CellularData_enableCellularDataRoaming_Async_0200 " +
                                "disableCellularDataRoaming finish"
                            );
                            done();
                        })
                    })
                })
            })
        })
    })

    /*
     * @tc.number   Telephony_CellularData_enableCellularDataRoaming_Async_0300
     * @tc.name     Call enableCellularDataRoaming interface, setting parameters as slotId error value (3),
     *              to check the correction results
     * @tc.desc     Function test
     */
    it("Telephony_CellularData_enableCellularDataRoaming_Async_0300", 0, async function (done) {
        cellular.enableCellularDataRoaming(ERR_SLOT_ID, (err) => {
            if (err) {
                console.log("Telephony_CellularData_enableCellularDataRoaming_Async_0300 enableCellularData finish");
                done();
                return;
            }
            expect().assertFail();
            console.log("Telephony_CellularData_enableCellularDataRoaming_Async_0300 enableCellularData fail");
            done();
        })
    })

    /*
     * @tc.number   Telephony_CellularData_disableCellularDataRoaming_Async_0100
     * @tc.name     Call disableCellularDataRoaming interface, normal into the reference, to check the correction
     *              results
     * @tc.desc     Function test
     */
    it("Telephony_CellularData_disableCellularDataRoaming_Async_0100", 0, async function (done) {
        cellular.isCellularDataRoamingEnabled(SLOT_ID, (err, data) => {
            if (err) {
                expect().assertFail();
                console.log("Telephony_CellularData_disableCellularDataRoaming_Async_0100 fail");
                done();
                return;
            }
            expect(data === false).assertTrue();
            console.log("Telephony_CellularData_disableCellularDataRoaming_Async_0100 finish");
            cellular.disableCellularDataRoaming(SLOT_ID, (err) => {
                if (err) {
                    expect().assertFail();
                    console.log(
                        "Telephony_CellularData_disableCellularDataRoaming_Async_0100 disableCellularDataRoaming fail"
                    );
                    done();
                    return;
                }
                console.log(
                    "Telephony_CellularData_disableCellularDataRoaming_Async_0100 disableCellularDataRoaming finish"
                );
                cellular.isCellularDataRoamingEnabled(SLOT_ID, (err, data) => {
                    if (err) {
                        expect().assertFail();
                        console.log("Telephony_CellularData_disableCellularDataRoaming_Async_0100 fail");
                        done();
                        return;
                    }
                    expect(data === false).assertTrue();
                    console.log("Telephony_CellularData_disableCellularDataRoaming_Async_0100 finish");
                    done();
                })
            })
        })
    })

    /*
     * @tc.number   Telephony_CellularData_disableCellularDataRoaming_Async_0200
     * @tc.name     Call the disenbleCellularDg() interface again while the cellular data is off to see the result of
     *              the callback (AsyncCallback).
     * @tc.desc     Function test
     */
    it("Telephony_CellularData_disableCellularDataRoaming_Async_0200", 0, async function (done) {
        cellular.disableCellularDataRoaming(SLOT_ID, (err) => {
            if (err) {
                expect().assertFail();
                console.log(
                    "Telephony_CellularData_disableCellularDataRoaming_Async_0200 disableCellularDataRoaming fail"
                );
                done();
                return;
            }
            console.log(
                "Telephony_CellularData_disableCellularDataRoaming_Async_0200 disableCellularDataRoaming finish"
            );
            cellular.isCellularDataRoamingEnabled(SLOT_ID, (err, data) => {
                if (err) {
                    expect().assertFail();
                    console.log("Telephony_CellularData_disableCellularDataRoaming_Async_0200 fail");
                    done();
                    return;
                }
                expect(data === false).assertTrue();
                console.log("Telephony_CellularData_disableCellularDataRoaming_Async_0200 finish");
                cellular.disableCellularDataRoaming(SLOT_ID, (err) => {
                    if (err) {
                        expect().assertFail();
                        console.log(
                            "Telephony_CellularData_disableCellularDataRoaming_Async_0200 " +
                            "disableCellularDataRoaming fail"
                        );
                        done();
                        return;
                    }
                    console.log(
                        "Telephony_CellularData_disableCellularDataRoaming_Async_0200 disableCellularDataRoaming finish"
                    );
                    cellular.isCellularDataRoamingEnabled(SLOT_ID, (err, data) => {
                        if (err) {
                            expect().assertFail();
                            console.log("Telephony_CellularData_disableCellularDataRoaming_Async_0200 fail");
                            done();
                            return;
                        }
                        expect(data === false).assertTrue();
                        console.log("Telephony_CellularData_disableCellularDataRoaming_Async_0200 finish");
                        done();
                    })
                })
            })
        })
    })

    /*
     * @tc.number   Telephony_CellularData_disableCellularDataRoaming_Async_0300
     * @tc.name     Call enableCellularDataRoaming interface, setting parameters as slotId error value (3), to check the
     *              correction results
     * @tc.desc     Function test
     */
    it("Telephony_CellularData_disableCellularDataRoaming_Async_0300", 0, async function (done) {
        cellular.disableCellularDataRoaming(ERR_SLOT_ID, (err) => {
            if (err) {
                console.log(
                    "Telephony_CellularData_disableCellularDataRoaming_Async_0300 disableCellularDataRoaming finish"
                );
                done();
                return;
            }
            expect().assertFail();
            console.log("Telephony_CellularData_disableCellularDataRoaming_Async_0300 disableCellularDataRoaming fail");
            done();
        })
    })

    /*
     * @tc.number   Telephony_CellularData_isCellularDataRoamingEnabled_Async_0100
     * @tc.name     Enable cellular data roaming, call isCellularDataRoamingEnabled, normal into the reference, to
     *              check the correction results
     * @tc.desc     Function test
     */
    it("Telephony_CellularData_isCellularDataRoamingEnabled_Async_0100", 0, async function (done) {
        cellular.enableCellularDataRoaming(SLOT_ID, (err) => {
            if (err) {
                expect().assertFail();
                console.log("Telephony_CellularData_isCellularDataRoamingEnabled_Async_0100 enableCellularData fail");
                done();
                return;
            }
            console.log("Telephony_CellularData_isCellularDataRoamingEnabled_Async_0100 enableCellularData finish");
            cellular.isCellularDataRoamingEnabled(SLOT_ID, (err, data) => {
                if (err) {
                    expect().assertFail();
                    console.log("Telephony_CellularData_isCellularDataRoamingEnabled_Async_0100 fail");
                    done();
                    return;
                }
                expect(data).assertTrue();
                console.log("Telephony_CellularData_isCellularDataRoamingEnabled_Async_0100 finish");
                cellular.disableCellularDataRoaming(SLOT_ID, (err) => {
                    if (err) {
                        expect().assertFail();
                        console.log(
                            "Telephony_CellularData_isCellularDataRoamingEnabled_Async_0100 " +
                            "disableCellularDataRoaming fail"
                        );
                        done();
                        return;
                    }
                    console.log(
                        "Telephony_CellularData_isCellularDataRoamingEnabled_Async_0100 " +
                        "disableCellularDataRoaming finish"
                    );
                    done();
                })
            })
        })
    })

    /*
     * @tc.number   Telephony_CellularData_isCellularDataRoamingEnabled_Async_0200
     * @tc.name     Call isCellularDataRoamingEnabled, set the slotId to error values (3), to check the correction
     *              results
     * @tc.desc     Function test
     */
    it("Telephony_CellularData_isCellularDataRoamingEnabled_Async_0200", 0, async function (done) {
        cellular.isCellularDataRoamingEnabled(ERR_SLOT_ID, (err) => {
            if (err) {
                console.log("Telephony_CellularData_isCellularDataRoamingEnabled_Async_0200 finish");
                done();
                return;
            }
            expect().assertFail();
            console.log("Telephony_CellularData_isCellularDataRoamingEnabled_Async_0200 fail");
            done();
        })
    })

    /*
     * @tc.number   Telephony_CellularData_isCellularDataRoamingEnabled_Async_0300
     * @tc.name     Disable cellular data roaming, call isCellularDataRoamingEnabled, normal into the reference,
     *              to check the correction results
     * @tc.desc     Function test
     */
    it("Telephony_CellularData_isCellularDataRoamingEnabled_Async_0300", 0, async function (done) {
        cellular.disableCellularDataRoaming(SLOT_ID, (err) => {
            if (err) {
                expect().assertFail();
                console.log("Telephony_CellularData_isCellularDataRoamingEnabled_Async_0300 disableCellularData fail");
                done();
                return;
            }
            console.log("Telephony_CellularData_isCellularDataRoamingEnabled_Async_0300 finish  ");
            cellular.isCellularDataRoamingEnabled(SLOT_ID, (err, data) => {
                if (err) {
                    expect().assertFail();
                    console.log("Telephony_CellularData_isCellularDataRoamingEnabled_Async_0300 fail");
                    done();
                    return;
                }
                expect(data === false).assertTrue();
                console.log("Telephony_CellularData_isCellularDataRoamingEnabled_Async_0300 finish");
                done();
            })
        })
    })

    /*
     * @tc.number   Telephony_CellularData_enableCellularDataRoaming_Promise_0100
     * @tc.name     Call enableCellularDataRoaming interface, normal into the parameter, to check the return results
     * @tc.desc     Function test
     */
    it("Telephony_CellularData_enableCellularDataRoaming_Promise_0100", 0, async function (done) {
        try {
            let data = await cellular.isCellularDataRoamingEnabled(SLOT_ID);
            expect(data === false).assertTrue();
            console.log("Telephony_CellularData_enableCellularDataRoaming_Promise_0100 finish");
        } catch (err) {
            expect().assertFail();
            console.log("Telephony_CellularData_enableCellularDataRoaming_Promise_0100 fail");
            done();
            return;
        }
        try {
            await cellular.enableCellularDataRoaming(SLOT_ID);
            console.log(
                "Telephony_CellularData_enableCellularDataRoaming_Promise_0100 enableCellularDataRoaming finish"
            );
        } catch (err) {
            expect().assertFail();
            console.log("Telephony_CellularData_enableCellularDataRoaming_Promise_0100 enableCellularDataRoaming fail");
            done();
            return;
        }
        try {
            let data = await cellular.isCellularDataRoamingEnabled(SLOT_ID);
            expect(data).assertTrue();
            console.log("Telephony_CellularData_enableCellularDataRoaming_Promise_0100 finish");
        } catch (err) {
            expect().assertFail();
            console.log("Telephony_CellularData_enableCellularDataRoaming_Promise_0100 fail");
            done();
            return;
        }
        try {
            await cellular.disableCellularDataRoaming(SLOT_ID);
            console.log(
                "Telephony_CellularData_enableCellularDataRoaming_Promise_0100 disableCellularDataRoaming finish"
            );
            done();
        } catch (err) {
            expect().assertFail();
            console.log(
                "Telephony_CellularData_enableCellularDataRoaming_Promise_0100 disableCellularDataRoaming fail"
            );
            done();
        }
    })

    /*
     * @tc.number   Telephony_CellularData_enableCellularDataRoaming_Promise_0200
     * @tc.name     Roaming switch in open state, called again enableCellularDataRoaming () interface, was introduced
     *              into the normal into, see return the result
     * @tc.desc     Function test
     */
    it("Telephony_CellularData_enableCellularDataRoaming_Promise_0200", 0, async function (done) {
        try {
            await cellular.enableCellularDataRoaming(SLOT_ID);
            console.log(
                "Telephony_CellularData_enableCellularDataRoaming_Promise_0200 enableCellularDataRoaming finish"
            );
        } catch (err) {
            expect().assertFail();
            console.log("Telephony_CellularData_enableCellularDataRoaming_Promise_0200 enableCellularDataRoaming fail");
            done();
            return;
        }
        try {
            let data = await cellular.isCellularDataRoamingEnabled(SLOT_ID);
            expect(data).assertTrue();
            console.log("Telephony_CellularData_enableCellularDataRoaming_Promise_0200 finish");
        } catch (err) {
            expect().assertFail();
            console.log("Telephony_CellularData_enableCellularDataRoaming_Promise_0200 fail");
            done();
            return;
        }
        try {
            await cellular.enableCellularDataRoaming(SLOT_ID);
            console.log(
                "Telephony_CellularData_enableCellularDataRoaming_Promise_0200 enableCellularDataRoaming finish"
            );
        } catch (err) {
            expect().assertFail();
            console.log("Telephony_CellularData_enableCellularDataRoaming_Promise_0200 enableCellularDataRoaming fail");
            done();
            return;
        }
        try {
            let data = await cellular.isCellularDataRoamingEnabled(SLOT_ID);
            expect(data).assertTrue();
            console.log("Telephony_CellularData_enableCellularDataRoaming_Promise_0200 finish");
        } catch (err) {
            expect().assertFail();
            console.log("Telephony_CellularData_enableCellularDataRoaming_Promise_0200 fail");
            done();
            return;
        }
        try {
            await cellular.disableCellularDataRoaming(SLOT_ID);
            console.log(
                "Telephony_CellularData_enableCellularDataRoaming_Promise_0200 disableCellularDataRoaming finish"
            );
            done();
        } catch (err) {
            expect().assertFail();
            console.log(
                "Telephony_CellularData_enableCellularDataRoaming_Promise_0200 disableCellularDataRoaming fail"
            );
            done();
        }
    })

    /*
     * @tc.number   Telephony_CellularData_enableCellularDataRoaming_Promise_0300
     * @tc.name     Call enableCellularDataRoaming interface, setting parameters as slotId error value (3), to check
     *              the return results
     * @tc.desc     Function test
     */
    it("Telephony_CellularData_enableCellularDataRoaming_Promise_0300", 0, async function (done) {
        try {
            await cellular.enableCellularDataRoaming(ERR_SLOT_ID);
            expect().assertFail();
            console.log("Telephony_CellularData_enableCellularDataRoaming_Promise_0300 fail");
        } catch (err) {
            console.log("Telephony_CellularData_enableCellularDataRoaming_Promise_0300 finish");
            done();
            return;
        }
        done();
    })

    /*
     * @tc.number   Telephony_CellularData_disableCellularDataRoaming_Promise_0100
     * @tc.name     Call disableCellularDataRoaming interface, normal into the reference, to check the correction
     *              results
     * @tc.desc     Function test
     */
    it("Telephony_CellularData_disableCellularDataRoaming_Promise_0100", 0, async function (done) {
        try {
            let data = await cellular.isCellularDataRoamingEnabled(SLOT_ID);
            expect(data === false).assertTrue();
            console.log("Telephony_CellularData_disableCellularDataRoaming_Promise_0100 finish");
        } catch (err) {
            expect().assertFail();
            console.log("Telephony_CellularData_disableCellularDataRoaming_Promise_0100 fail");
            done();
            return;
        }
        try {
            await cellular.disableCellularDataRoaming(SLOT_ID);
            console.log(
                "Telephony_CellularData_disableCellularDataRoaming_Promise_0100 disableCellularDataRoaming finish"
            );
        } catch (err) {
            expect().assertFail();
            console.log(
                "Telephony_CellularData_disableCellularDataRoaming_Promise_0100 disableCellularDataRoaming fail");
            done();
            return;
        }
        try {
            let data = await cellular.isCellularDataRoamingEnabled(SLOT_ID);
            expect(data === false).assertTrue();
            console.log("Telephony_CellularData_disableCellularDataRoaming_Promise_0100 finish");
            done();
        } catch (err) {
            expect().assertFail();
            console.log("Telephony_CellularData_disableCellularDataRoaming_Promise_0100 fail");
            done();
        }
    })

    /*
     * @tc.number   Telephony_CellularData_disableCellularDataRoaming_Promise_0200
     * @tc.name     With cellular data off, call the disenbleCellularDg() interface again to see the callback result
     *              (Promise)
     * @tc.desc     Function test
     */
    it("Telephony_CellularData_disableCellularDataRoaming_Promise_0200", 0, async function (done) {
        try {
            await cellular.disableCellularDataRoaming(SLOT_ID);
            console.log(
                "Telephony_CellularData_disableCellularDataRoaming_Promise_0200 disableCellularDataRoaming finish"
            );
        } catch (err) {
            expect().assertFail();
            console.log(
                "Telephony_CellularData_disableCellularDataRoaming_Promise_0200 disableCellularDataRoaming fail");
            done();
            return;
        }
        try {
            let data = await cellular.isCellularDataRoamingEnabled(SLOT_ID);
            expect(data === false).assertTrue();
            console.log("Telephony_CellularData_disableCellularDataRoaming_Promise_0200 finish");
        } catch (err) {
            expect().assertFail();
            console.log("Telephony_CellularData_disableCellularDataRoaming_Promise_0200 fail");
            done();
            return;
        }
        try {
            await cellular.disableCellularDataRoaming(SLOT_ID);
            console.log(
                "Telephony_CellularData_disableCellularDataRoaming_Promise_0200 disableCellularDataRoaming finish"
            );
        } catch (err) {
            expect().assertFail();
            console.log(
                "Telephony_CellularData_disableCellularDataRoaming_Promise_0200 disableCellularDataRoaming fail");
            done();
            return;
        }
        try {
            let data = await cellular.isCellularDataRoamingEnabled(SLOT_ID);
            expect(data === false).assertTrue();
            console.log("Telephony_CellularData_disableCellularDataRoaming_Promise_0200 finish");
            done();
        } catch (err) {
            expect().assertFail();
            console.log("Telephony_CellularData_disableCellularDataRoaming_Promise_0200 fail");
            done();
        }
    })

    /*
     * @tc.number   Telephony_CellularData_disableCellularDataRoaming_Promise_0300
     * @tc.name     Call disableCellularDataRoaming interface, setting parameters as slotId error value (3), to check
     *              the correction results
     * @tc.desc     Function test
     */
    it("Telephony_CellularData_disableCellularDataRoaming_Promise_0300", 0, async function (done) {
        try {
            await cellular.disableCellularDataRoaming(ERR_SLOT_ID);
            expect().assertFail();
            console.log("Telephony_CellularData_disableCellularDataRoaming_Promise_0300 fail");
        } catch (err) {
            console.log("Telephony_CellularData_disableCellularDataRoaming_Promise_0300 finish");
            done();
            return;
        }
        done();
    })

    /*
     * @tc.number   Telephony_CellularData_isCellularDataRoamingEnabled_Promise_0100
     * @tc.name     Enable cellular data roaming, call isCellularDataRoamingEnabled, normal into, see return the result
     * @tc.desc     Function test
     */
    it("Telephony_CellularData_isCellularDataRoamingEnabled_Promise_0100", 0, async function (done) {
        try {
            await cellular.enableCellularDataRoaming(SLOT_ID);
            console.log(
                "Telephony_CellularData_isCellularDataRoamingEnabled_Promise_0100 enableCellularDataRoaming finish"
            );
        } catch (err) {
            expect().assertFail();
            console.log(
                "Telephony_CellularData_isCellularDataRoamingEnabled_Promise_0100 enableCellularDataRoaming fail"
            );
            done();
            return;
        }
        try {
            let data = await cellular.isCellularDataRoamingEnabled(SLOT_ID);
            expect(data).assertTrue();
            console.log("Telephony_CellularData_isCellularDataRoamingEnabled_Promise_0100 finish");
        } catch (err) {
            expect().assertFail();
            console.log("Telephony_CellularData_isCellularDataRoamingEnabled_Promise_0100 fail");
            done();
            return;
        }
        try {
            await cellular.disableCellularDataRoaming(SLOT_ID);
            console.log(
                "Telephony_CellularData_isCellularDataRoamingEnabled_Promise_0100 disableCellularDataRoaming finish"
            );
            done();
        } catch (err) {
            expect().assertFail();
            console.log(
                "Telephony_CellularData_isCellularDataRoamingEnabled_Promise_0100 disableCellularDataRoaming fail"
            );
            done();
        }
    })

    /*
     * @tc.number   Telephony_CellularData_isCellularDataRoamingEnabled_Promise_0200
     * @tc.name     Call isCellularDataRoamingEnabled, set the slotId to error values (3), to check the return results
     * @tc.desc     Function test
     */
    it("Telephony_CellularData_isCellularDataRoamingEnabled_Promise_0200", 0, async function (done) {
        try {
            await cellular.isCellularDataRoamingEnabled(ERR_SLOT_ID);
            expect().assertFail();
            console.log("Telephony_CellularData_isCellularDataRoamingEnabled_Promise_0200 fail");
        } catch (err) {
            console.log("Telephony_CellularData_isCellularDataRoamingEnabled_Promise_0200 finish");
            done();
            return;
        }
        done();
    })

    /*
     * @tc.number   Telephony_CellularData_isCellularDataRoamingEnabled_Promise_0300
     * @tc.name     Disable cellular data roaming, call isCellularDataRoamingEnabled, normal into, see return the result
     * @tc.desc     Function test
     */
    it("Telephony_CellularData_isCellularDataRoamingEnabled_Promise_0300", 0, async function (done) {
        try {
            await cellular.disableCellularDataRoaming(SLOT_ID);
            console.log(
                "Telephony_CellularData_isCellularDataRoamingEnabled_Promise_0300 disableCellularDataRoaming finish"
            );
        } catch (err) {
            expect().assertFail();
            console.log(
                "Telephony_CellularData_isCellularDataRoamingEnabled_Promise_0300 disableCellularDataRoaming fail"
            );
            done();
            return;
        }
        try {
            let data = await cellular.isCellularDataRoamingEnabled(SLOT_ID);
            expect(data === false).assertTrue();
            console.log("Telephony_CellularData_isCellularDataRoamingEnabled_Promise_0300 finish");
            done();
        } catch (err) {
            expect().assertFail();
            console.log("Telephony_CellularData_isCellularDataRoamingEnabled_Promise_0300 fail");
            done();
        }
    })
})
