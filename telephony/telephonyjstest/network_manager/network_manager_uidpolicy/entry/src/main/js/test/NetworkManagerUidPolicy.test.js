/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import netpolicy from '@ohos.netmanager.netpolicy';
import { describe, it, expect } from 'deccjsunit/index';

describe('NetworkManagerUidPolicyTest', function () {

    const UID_1 = 1;
    const UID_2 = 2;
    const UID_3 = 3;
    const UID_4 = 4;
    const UID_5 = 5;
    const UID_6 = 6;
    const POLICY_3 = 3;
    const POLICY_5 = 5;
    const POLICY_9 = 9;
    const POLICY_12 = 12;
    const POLICY_31 = 31;
    const POLICY_33 = 33;
    const POLICY_63 = 63;
    const POLICY_65 = 65;

    /**
     * @tc.number  Telephony_NetworkManager_setUidPolicy_Async_0100
     * @tc.name    The policy is "NET_POLICY_ALLOW_METERED_BACKGROUND", 
     *             test setUidPolicy() to check the result of the callback
     * @tc.desc    Function test
     */
    it('Telephony_NetworkManager_setUidPolicy_Async_0100', 0, async function (done) {
        let caseName = 'Telephony_NetworkManager_setUidPolicy_Async_0100';
        netpolicy.setUidPolicy(UID_1, netpolicy.NET_POLICY_ALLOW_METERED_BACKGROUND, (err, data) => {
            if (err) {
                console.log(`${caseName} set fail: ${err}`);
                expect().assertFail();
                done();
                return;
            }
            console.log(`${caseName}  set data: ${data}`);
            expect(data).assertEqual(netpolicy.ERR_NONE);
            netpolicy.getUidPolicy(UID_1, (err, data) => {
                if (err) {
                    console.log(`${caseName} get fail: ${err}`);
                    expect().assertFail();
                    done();
                    return;
                }
                console.log(`${caseName} end data: ${JSON.stringify(data)}`);
                expect(data).assertEqual(netpolicy.NET_POLICY_ALLOW_METERED_BACKGROUND);
                done();
            });
        });
    });

    /**
     * @tc.number  Telephony_NetworkManager_setUidPolicy_Async_0200
     * @tc.name    The policy is "NET_POLICY_TEMPORARY_ALLOW_METERED", 
     *             test setUidPolicy() to check the callback result  
     * @tc.desc    Function test
     */
    it('Telephony_NetworkManager_setUidPolicy_Async_0200', 0, async function (done) {
        let caseName = 'Telephony_NetworkManager_setUidPolicy_Async_0200'
        netpolicy.setUidPolicy(UID_2, netpolicy.NET_POLICY_TEMPORARY_ALLOW_METERED, (err, data) => {
            if (err) {
                console.log(`${caseName}  set fail: ${err}`);
                expect().assertFail();
                done();
                return;
            }
            console.log(`${caseName}  set data: ${data}`);
            expect(data).assertEqual(netpolicy.ERR_NONE);
            netpolicy.getUidPolicy(UID_2, (err, data) => {
                if (err) {
                    console.log(`${caseName}  get fail: ${err}`);
                    expect().assertFail();
                    done();
                    return;
                }
                console.log(`${caseName}  end data: ${JSON.stringify(data)}`);
                expect(data).assertEqual(netpolicy.NET_POLICY_TEMPORARY_ALLOW_METERED);
                done();
            });
        });
    });

    /**
     * @tc.number  Telephony_NetworkManager_setUidPolicy_Async_0300
     * @tc.name    The policy is "NET_POLICY_REJECT_METERED_BACKGROUND", 
     *             test setUidPolicy() to check the callback result  
     * @tc.desc    Function test
     */
    it('Telephony_NetworkManager_setUidPolicy_Async_0300', 0, async function (done) {
        let caseName = 'Telephony_NetworkManager_setUidPolicy_Async_0300'
        netpolicy.setUidPolicy(UID_3, netpolicy.NET_POLICY_REJECT_METERED_BACKGROUND, (err, data) => {
            if (err) {
                console.log(`${caseName} set fail: ${err}`);
                expect().assertFail();
                done();
                return;
            }
            console.log(`${caseName} set data: ${data}`);
            expect(data).assertEqual(netpolicy.ERR_NONE);
            netpolicy.getUidPolicy(UID_3, (err, data) => {
                if (err) {
                    console.log(`${caseName} get fail: ${err}`);
                    expect().assertFail();
                    done();
                    return;
                }
                console.log(`${caseName} end data: ${JSON.stringify(data)}`);
                expect(data).assertEqual(netpolicy.NET_POLICY_REJECT_METERED_BACKGROUND);
                done();
            });
        });
    });

    /**
     * @tc.number  Telephony_NetworkManager_setUidPolicy_Async_0400
     * @tc.name    The policy is 9, test setUidPolicy() to check the result of the callback  
     * @tc.desc    Function test
     */
    it('Telephony_NetworkManager_setUidPolicy_Async_0400', 0, async function (done) {
        let caseName = 'Telephony_NetworkManager_setUidPolicy_Async_0400'
        netpolicy.setUidPolicy(UID_4, POLICY_9, (err, data) => {
            if (err) {
                console.log(`${caseName} err: ${err}`);
                expect(err).assertEqual(netpolicy.ERR_INVALID_POLICY);
                done();
                return;
            }
            console.log(`${caseName} fail data: ${data}`);
            expect().assertFail();
            done();
        });
    });

    /**
     * @tc.number  Telephony_NetworkManager_setUidPolicy_Async_0500
     * @tc.name    The policy is 3, test setUidPolicy() to check the result of the callback  
     * @tc.desc    Function test
     */
    it('Telephony_NetworkManager_setUidPolicy_Async_0500', 0, async function (done) {
        let caseName = 'Telephony_NetworkManager_setUidPolicy_Async_0500'
        netpolicy.setUidPolicy(UID_4, POLICY_3, (err, data) => {
            if (err) {
                console.log(`${caseName} err: ${err}`);
                expect(err).assertEqual(netpolicy.ERR_INVALID_POLICY);
                done();
                return;
            }
            console.log(`${caseName} fail data: ${data}`);
            expect().assertFail();
            done();
        });
    });

    /**
     * @tc.number  Telephony_NetworkManager_setUidPolicy_Async_0600
     * @tc.name    The policy is 5, test setUidPolicy() to check the result of the callback  
     * @tc.desc    Function test
     */
    it('Telephony_NetworkManager_setUidPolicy_Async_0600', 0, async function (done) {
        let caseName = 'Telephony_NetworkManager_setUidPolicy_Async_0600'
        netpolicy.setUidPolicy(UID_4, POLICY_5, (err, data) => {
            if (err) {
                console.log(`${caseName} err: ${err}`);
                expect(err).assertEqual(netpolicy.ERR_INVALID_POLICY);
                done();
                return;
            }
            console.log(`${caseName} fail data: ${data}`);
            expect().assertFail();
            done();
        });
    });

    /**
     * @tc.number  Telephony_NetworkManager_setUidPolicy_Async_0700
     * @tc.name    The policy is 31, test setUidPolicy() to check the result of the callback  
     * @tc.desc    Function test
     */
    it('Telephony_NetworkManager_setUidPolicy_Async_0700', 0, async function (done) {
        let caseName = 'Telephony_NetworkManager_setUidPolicy_Async_0700'
        netpolicy.setUidPolicy(UID_4, POLICY_31, (err, data) => {
            if (err) {
                console.log(`${caseName} err: ${err}`);
                expect(err).assertEqual(netpolicy.ERR_INVALID_POLICY);
                done();
                return;
            }
            console.log(`${caseName} fail data: ${data}`);
            expect().assertFail();
            done();
        });
    });

    /**
     * @tc.number  Telephony_NetworkManager_setUidPolicy_Async_0800
     * @tc.name    The policy is 33, test setUidPolicy() to check the result of the callback  
     * @tc.desc    Function test
     */
    it('Telephony_NetworkManager_setUidPolicy_Async_0800', 0, async function (done) {
        let caseName = 'Telephony_NetworkManager_setUidPolicy_Async_0800'
        netpolicy.setUidPolicy(UID_4, POLICY_33, (err, data) => {
            if (err) {
                console.log(`${caseName} err: ${err}`);
                expect(err).assertEqual(netpolicy.ERR_INVALID_POLICY);
                done();
                return;
            }
            console.log(`${caseName} fail data: ${data}`);
            expect().assertFail();
            done();
        });
    });

    /**
     * @tc.number  Telephony_NetworkManager_setUidPolicy_Async_0900
     * @tc.name    The policy is 63, test setUidPolicy() to check the result of the callback  
     * @tc.desc    Function test
     */
    it('Telephony_NetworkManager_setUidPolicy_Async_0900', 0, async function (done) {
        let caseName = 'Telephony_NetworkManager_setUidPolicy_Async_0900'
        netpolicy.setUidPolicy(UID_4, POLICY_63, (err, data) => {
            if (err) {
                console.log(`${caseName} err: ${err}`);
                expect(err).assertEqual(netpolicy.ERR_INVALID_POLICY);
                done();
                return;
            }
            console.log(`${caseName} fail data: ${data}`);
            expect().assertFail();
            done();
        });
    });

    /**
     * @tc.number  Telephony_NetworkManager_setUidPolicy_Async_1000
     * @tc.name    The policy is 65, test setUidPolicy() to check the result of the callback  
     * @tc.desc    Function test
     */
    it('Telephony_NetworkManager_setUidPolicy_Async_1000', 0, async function (done) {
        let caseName = 'Telephony_NetworkManager_setUidPolicy_Async_1000'
        netpolicy.setUidPolicy(UID_4, POLICY_65, (err, data) => {
            if (err) {
                console.log(`${caseName} set fail: ${err}`);
                expect(err).assertEqual(netpolicy.ERR_INVALID_POLICY);
                done();
                return;
            }
            console.log(`${caseName} fail data: ${data}`);
            expect().assertFail();
            done();
        });
    });

    /**
     * @tc.number  Telephony_NetworkManager_setUidPolicy_Promise_0100
     * @tc.name    The policy is "NET_POLICY_ALLOW_METERED_BACKGROUND", 
     *             test setUidPolicy() to check the return value  
     * @tc.desc    Function test
     */
    it('Telephony_NetworkManager_setUidPolicy_Promise_0100', 0, async function (done) {
        let caseName = 'Telephony_NetworkManager_setUidPolicy_Promise_0100'
        netpolicy.setUidPolicy(UID_1, netpolicy.NET_POLICY_ALLOW_METERED_BACKGROUND).then(data => {
            console.log(`${caseName} set data: ${data}`);
            expect(data).assertEqual(netpolicy.ERR_NONE);
            netpolicy.getUidPolicy(UID_1).then(data => {
                console.log(`${caseName} end data: ${JSON.stringify(data)}`);
                expect(data).assertEqual(netpolicy.NET_POLICY_ALLOW_METERED_BACKGROUND);
                done();
            }).catch(err => {
                console.log(`${caseName} get fail: ${err}`);
                expect().assertFail();
                done();
            });
        }).catch(err => {
            console.log(`${caseName} set fail: ${err}`);
            expect().assertFail();
            done();
        });
    });

    /**
     * @tc.number  Telephony_NetworkManager_setUidPolicy_Promise_0200
     * @tc.name    The policy is "NET_POLICY_TEMPORARY_ALLOW_METERED", 
     *             test setUidPolicy() to check the return value  
     * @tc.desc    Function test
     */
    it('Telephony_NetworkManager_setUidPolicy_Promise_0200', 0, async function (done) {
        let caseName = 'Telephony_NetworkManager_setUidPolicy_Promise_0200'
        netpolicy.setUidPolicy(UID_2, netpolicy.NET_POLICY_TEMPORARY_ALLOW_METERED).then(data => {
            console.log(`${caseName} set data: ${data}`);
            expect(data).assertEqual(netpolicy.ERR_NONE);
            netpolicy.getUidPolicy(UID_2).then(data => {
                console.log(`${caseName} end data: ${JSON.stringify(data)}`);
                expect(data).assertEqual(netpolicy.NET_POLICY_TEMPORARY_ALLOW_METERED);
                done();
            }).catch(err => {
                console.log(`${caseName} get fail: ${err}`);
                expect().assertFail();
                done();
            });
        }).catch(err => {
            console.log(`${caseName} set fail: ${err}`);
            expect().assertFail();
            done();
        });
    });

    /**
     * @tc.number  Telephony_NetworkManager_setUidPolicy_Promise_0300
     * @tc.name    The policy is "NET_POLICY_REJECT_METERED_BACKGROUND", 
     *             test setUidPolicy() to check the return value  
     * @tc.desc    Function test
     */
    it('Telephony_NetworkManager_setUidPolicy_Promise_0300', 0, async function (done) {
        let caseName = 'Telephony_NetworkManager_setUidPolicy_Promise_0300'
        netpolicy.setUidPolicy(UID_3, netpolicy.NET_POLICY_REJECT_METERED_BACKGROUND).then(data => {
            console.log(`${caseName} set data: ${data}`);
            expect(data).assertEqual(netpolicy.ERR_NONE);
            netpolicy.getUidPolicy(UID_3).then(data => {
                console.log(`${caseName} end data: ${JSON.stringify(data)}`);
                expect(data).assertEqual(netpolicy.NET_POLICY_REJECT_METERED_BACKGROUND);
                done();
            }).catch(err => {
                console.log(`${caseName} get fail: ${err}`);
                expect().assertFail();
                done();
            });
        }).catch(err => {
            console.log(`${caseName} set fail: ${err}`);
            expect().assertFail();
            done();
        });
    });

    /**
     * @tc.number  Telephony_NetworkManager_setUidPolicy_Promise_0400
     * @tc.name    The policy is 9, test setUidPolicy() to check the return value  
     * @tc.desc    Function test
     */
    it('Telephony_NetworkManager_setUidPolicy_Promise_0400', 0, async function (done) {
        let caseName = 'Telephony_NetworkManager_setUidPolicy_Promise_0400'
        netpolicy.setUidPolicy(UID_4, POLICY_9).then(data => {
            console.log(`${caseName} fail data: ${data}`);
            expect().assertFail();
            done();
        }).catch(err => {
            console.log(`${caseName} err: ${err}`);
            expect(err).assertEqual(netpolicy.ERR_INVALID_POLICY);
            done();
        })
    });

    /**
     * @tc.number  Telephony_NetworkManager_setUidPolicy_Promise_0500
     * @tc.name    The policy is 3, test setUidPolicy() to check the return value  
     * @tc.desc    Function test
     */
    it('Telephony_NetworkManager_setUidPolicy_Promise_0500', 0, async function (done) {
        let caseName = 'Telephony_NetworkManager_setUidPolicy_Promise_0500'
        netpolicy.setUidPolicy(UID_4, POLICY_3).then(data => {
            console.log(`${caseName} fail data: ${data}`);
            expect().assertFail();
            done();
        }).catch(err => {
            console.log(`${caseName} err: ${err}`);
            expect(err).assertEqual(netpolicy.ERR_INVALID_POLICY);

            done();
        })
    });

    /**
     * @tc.number  Telephony_NetworkManager_setUidPolicy_Promise_0600
     * @tc.name    The policy is 5, test setUidPolicy() to check the return value  
     * @tc.desc    Function test
     */
    it('Telephony_NetworkManager_setUidPolicy_Promise_0600', 0, async function (done) {
        let caseName = 'Telephony_NetworkManager_setUidPolicy_Promise_0600'
        netpolicy.setUidPolicy(UID_4, POLICY_5).then(data => {
            console.log(`${caseName} fail data: ${data}`);
            expect().assertFail();
            done();
        }).catch(err => {
            console.log(`${caseName} err: ${err}`);
            expect(err).assertEqual(netpolicy.ERR_INVALID_POLICY);
            done();

        })
    });

    /**
     * @tc.number  Telephony_NetworkManager_setUidPolicy_Promise_0700
     * @tc.name    The policy is 31, test setUidPolicy() to check the return value  
     * @tc.desc    Function test
     */
    it('Telephony_NetworkManager_setUidPolicy_Promise_0700', 0, async function (done) {
        let caseName = 'Telephony_NetworkManager_setUidPolicy_Promise_0700'
        netpolicy.setUidPolicy(UID_4, POLICY_31).then(data => {
            console.log(`${caseName} fail data: ${data}`);
            expect().assertFail();
            done();
        }).catch(err => {
            console.log(`${caseName} err: ${err}`);
            expect(err).assertEqual(netpolicy.ERR_INVALID_POLICY);
            done();
        })
    });

    /**
     * @tc.number  Telephony_NetworkManager_setUidPolicy_Promise_0800
     * @tc.name    The policy is 33, test setUidPolicy() to check the return value  
     * @tc.desc    Function test
     */
    it('Telephony_NetworkManager_setUidPolicy_Promise_0800', 0, async function (done) {
        let caseName = 'Telephony_NetworkManager_setUidPolicy_Promise_0800'
        netpolicy.setUidPolicy(UID_4, POLICY_33).then(data => {
            console.log(`${caseName} fail data: ${data}`);
            expect().assertFail();
            done();
        }).catch(err => {
            console.log(`${caseName} err: ${err}`);
            expect(err).assertEqual(netpolicy.ERR_INVALID_POLICY);

            done();
        })
    });

    /**
     * @tc.number  Telephony_NetworkManager_setUidPolicy_Promise_0900
     * @tc.name    The policy is 63, test setUidPolicy() to check the return value  
     * @tc.desc    Function test
     */
    it('Telephony_NetworkManager_setUidPolicy_Promise_0900', 0, async function (done) {
        let caseName = 'Telephony_NetworkManager_setUidPolicy_Promise_0900'
        netpolicy.setUidPolicy(UID_4, POLICY_63).then(data => {
            console.log(`${caseName} fail data: ${data}`);
            expect().assertFail();
            done();
        }).catch(err => {
            console.log(`${caseName} err: ${err}`);
            expect(err).assertEqual(netpolicy.ERR_INVALID_POLICY);
            done();
        })
    });

    /**
     * @tc.number  Telephony_NetworkManager_setUidPolicy_Promise_1000
     * @tc.name    The policy is 65, test setUidPolicy() to check the return value  
     * @tc.desc    Function test
     */
    it('Telephony_NetworkManager_setUidPolicy_Promise_1000', 0, async function (done) {
        let caseName = 'Telephony_NetworkManager_setUidPolicy_Promise_1000'
        netpolicy.setUidPolicy(UID_4, POLICY_65).then(data => {
            console.log(`${caseName} fail data: ${data}`);
            expect().assertFail();
            done();
        }).catch(err => {
            console.log(`${caseName} err: ${err}`);
            expect(err).assertEqual(netpolicy.ERR_INVALID_POLICY);
            done();
        })
    });

    /**
     * @tc.number  Telephony_NetworkManager_getUidPolicy_Async_0100
     * @tc.name    Set the value of the policy  whose UID is 5 to "NET_POLICY_ALLOW_ALL" 
     *             and test getUidPolicy() to check the result of the callback  
     * @tc.desc    Function test
     */
    it('Telephony_NetworkManager_getUidPolicy_Async_0100', 0, async function (done) {
        let caseName = 'Telephony_NetworkManager_getUidPolicy_Async_0100'
        netpolicy.setUidPolicy(UID_5, netpolicy.NET_POLICY_ALLOW_ALL, (err, data) => {
            if (err) {
                console.log(`${caseName}  set fail: ${err}`);
                expect().assertFail();
                done();
                return;
            }
            netpolicy.getUidPolicy(UID_5, (err, data) => {
                if (err) {
                    console.log(`${caseName}  get fail: ${err}`);
                    expect().assertFail();
                    done();
                    return;
                }
                console.log(`${caseName}  end data: ${JSON.stringify(data)}`);
                expect(data).assertEqual(netpolicy.NET_POLICY_ALLOW_ALL);
                done();
            });
        });
    });

    /**
     * @tc.number  Telephony_NetworkManager_getUidPolicy_Async_0200
     * @tc.name    Set the policy value of the policy whose UID is 6 to "NET_POLICY_REJECT_ALL" 
     *             and test getUidPolicy() to view the callback result  
     * @tc.desc    Function test
     */
    it('Telephony_NetworkManager_getUidPolicy_Async_0200', 0, async function (done) {
        let caseName = 'Telephony_NetworkManager_getUidPolicy_Async_0200'
        netpolicy.setUidPolicy(UID_6, netpolicy.NET_POLICY_REJECT_ALL, (err, data) => {
            if (err) {
                console.log(`${caseName}  set fail: ${err}`);
                expect().assertFail();
                done();
                return;
            }
            netpolicy.getUidPolicy(UID_6, (err, data) => {
                if (err) {
                    console.log(`${caseName}  get fail: ${err}`);
                    expect().assertFail();
                    done();
                    return;
                }
                console.log(`${caseName}  end data: ${JSON.stringify(data)}`);
                expect(data).assertEqual(netpolicy.NET_POLICY_REJECT_ALL);
                done();
            });
        });
    });

    /**
     * @tc.number  Telephony_NetworkManager_getUidPolicy_Async_0300
     * @tc.name    Set the value of the policy whose UID is 1 to "NET_POLICY_TEMPORARY_ALLOW_METERED". 
     *             Test getUidPolicy() to view the callback result  
     * @tc.desc    Function test
     */
    it('Telephony_NetworkManager_getUidPolicy_Async_0300', 0, async function (done) {
        let caseName = 'Telephony_NetworkManager_getUidPolicy_Async_0300'
        netpolicy.setUidPolicy(UID_1, netpolicy.NET_POLICY_ALLOW_ALL, (err, data) => {
            if (err) {
                console.log(`${caseName}  set fail: ${err}`);
                expect().assertFail();
                done();
                return;
            }
            netpolicy.setUidPolicy(UID_1, netpolicy.NET_POLICY_TEMPORARY_ALLOW_METERED, (err, data) => {
                if (err) {
                    console.log(`${caseName}  set fail: ${err}`);
                    expect().assertFail();
                    done();
                    return;
                }
                netpolicy.getUidPolicy(UID_1, (err, data) => {
                    if (err) {
                        console.log(`${caseName}  get fail: ${err}`);
                        expect().assertFail();
                        done();
                        return;
                    }
                    console.log(`${caseName}  end data: ${JSON.stringify(data)}`);
                    expect(data).assertEqual(netpolicy.NET_POLICY_TEMPORARY_ALLOW_METERED);
                    done();
                });
            });
        });
    });

    /**
     * @tc.number  Telephony_NetworkManager_getUidPolicy_Async_0400
     * @tc.name    Update the policy value whose UID is 2 to 12
     *             and test getUidPolicy() to check the result of the callback
     * @tc.desc    Function test
     */
    it('Telephony_NetworkManager_getUidPolicy_Async_0400', 0, async function (done) {
        let caseName = 'Telephony_NetworkManager_getUidPolicy_Async_0400'
        netpolicy.setUidPolicy(UID_2, netpolicy.NET_POLICY_ALLOW_ALL, (err, data) => {
            if (err) {
                console.log(`${caseName}  set fail: ${err}`);
                expect().assertFail();
                done();
                return;
            }
            netpolicy.setUidPolicy(UID_2, POLICY_12, (err, data) => {
                if (err) {
                    console.log(`${caseName}  set fail: ${err}`);
                }
                netpolicy.getUidPolicy(UID_2, (err, data) => {
                    if (err) {
                        console.log(`${caseName}  get fail: ${err}`);
                        expect().assertFail();
                        done();
                        return;
                    }
                    console.log(`${caseName}  end data: ${JSON.stringify(data)}`);
                    expect(data).assertEqual(netpolicy.NET_POLICY_ALLOW_ALL);
                    done();
                });
            });
        });
    });

    /**
     * @tc.number  Telephony_NetworkManager_getUidPolicy_Async_0500
     * @tc.name    Delete the policy value whose UID is 3 
     *             and test getUidPolicy() to check the result of the callback 
     * @tc.desc    Function test
     */
    it('Telephony_NetworkManager_getUidPolicy_Async_0500', 0, async function (done) {
        let caseName = 'Telephony_NetworkManager_getUidPolicy_Async_0500'
        netpolicy.setUidPolicy(UID_3, netpolicy.NET_POLICY_ALLOW_METERED_BACKGROUND, (err, data) => {
            if (err) {
                console.log(`${caseName}  set fail: ${err}`);
                expect().assertFail();
                done();
                return;
            }
            netpolicy.setUidPolicy(UID_3, netpolicy.NET_POLICY_NONE, (err, data) => {
                if (err) {
                    console.log(`${caseName}  set fail: ${err}`);
                    expect().assertFail();
                    done();
                    return;
                }
                netpolicy.getUidPolicy(UID_3, (err, data) => {
                    if (err) {
                        console.log(`${caseName}  get fail: ${err}`);
                        expect().assertFail();
                        done();
                        return;
                    }
                    console.log(`${caseName}  end data: ${JSON.stringify(data)}`);
                    expect(data).assertEqual(netpolicy.NET_POLICY_NONE);
                    done();
                });
            });
        });
    });

    /**
     * @tc.number  Telephony_NetworkManager_getUidPolicy_Promise_0100
     * @tc.name    Set the value of the policy with 5 
     *             to "NET_POLICY_ALLOW_ALL" and test getUidPolicy() to check the return value 
     * @tc.desc    Function test
     */
    it('Telephony_NetworkManager_getUidPolicy_Promise_0100', 0, async function (done) {
        let caseName = 'Telephony_NetworkManager_getUidPolicy_Promise_0100'
        netpolicy.setUidPolicy(UID_5, netpolicy.NET_POLICY_ALLOW_ALL).then(data => {
            netpolicy.getUidPolicy(UID_5).then(data => {
                console.log(`${caseName} end data: ${JSON.stringify(data)}`);
                expect(data).assertEqual(netpolicy.NET_POLICY_ALLOW_ALL);
                done();
            }).catch(err => {
                console.log(`${caseName} get fail: ${err}`);
                expect().assertFail();
                done();
            });
        }).catch(err => {
            console.log(`${caseName} set fail: ${err}`);
            expect().assertFail();
            done();
        });
    });

    /**
     * @tc.number  Telephony_NetworkManager_getUidPolicy_Promise_0200
     * @tc.name    Set the policy value with 6 to "NET_POLICY_REJECT_ALL" 
     *             and test getUidPolicy() to check the return value  
     * @tc.desc    Function test
     */
    it('Telephony_NetworkManager_getUidPolicy_Promise_0200', 0, async function (done) {
        let caseName = 'Telephony_NetworkManager_getUidPolicy_Promise_0200'
        netpolicy.setUidPolicy(UID_6, netpolicy.NET_POLICY_REJECT_ALL).then(data => {
            netpolicy.getUidPolicy(UID_6).then(data => {
                console.log(`${caseName} end data: ${JSON.stringify(data)}`);
                expect(data).assertEqual(netpolicy.NET_POLICY_REJECT_ALL);
                done();
            }).catch(err => {
                console.log(`${caseName} get fail: ${err}`);
                expect().assertFail();
                done();
            });
        }).catch(err => {
            console.log(`${caseName} set fail: ${err}`);
            expect().assertFail();
            done();
        });
    });

    /**
     * @tc.number  Telephony_NetworkManager_getUidPolicy_Promise_0300
     * @tc.name    Update the policy value with 1 to "NET_POLICY_TEMPORARY_ALLOW_METERED". 
     *             Test getUidPolicy() to check the returned value 
     * @tc.desc    Function test
     */
    it('Telephony_NetworkManager_getUidPolicy_Promise_0300', 0, async function (done) {
        let caseName = 'Telephony_NetworkManager_getUidPolicy_Promise_0300'
        netpolicy.setUidPolicy(UID_1, netpolicy.NET_POLICY_ALLOW_ALL).then(data => {
            netpolicy.setUidPolicy(UID_1, netpolicy.NET_POLICY_TEMPORARY_ALLOW_METERED).then(data => {
                netpolicy.getUidPolicy(UID_1).then(data => {
                    console.log(`${caseName} end data: ${JSON.stringify(data)}`);
                    expect(data).assertEqual(netpolicy.NET_POLICY_TEMPORARY_ALLOW_METERED);
                    done();
                }).catch(err => {
                    console.log(`${caseName} get fail: ${err}`);
                    expect().assertFail();
                    done();
                });
            }).catch(err => {
                console.log(`${caseName} set fail: ${err}`);
                expect().assertFail();
                done();
            });
        }).catch(err => {
            console.log(`${caseName} set fail: ${err}`);
            expect().assertFail();
            done();
        })
    });

    /**
     * @tc.number  Telephony_NetworkManager_getUidPolicy_Promise_0400
     * @tc.name    Update the policy value with 2 to 12
     *             and test getUidPolicy() to check the return value
     * @tc.desc    Function test
     */
    it('Telephony_NetworkManager_getUidPolicy_Promise_0400', 0, async function (done) {
        let caseName = 'Telephony_NetworkManager_getUidPolicy_Promise_0400'
        netpolicy.setUidPolicy(UID_2, netpolicy.NET_POLICY_ALLOW_ALL).then(data => {
            netpolicy.setUidPolicy(UID_2, POLICY_12).then(data => {
                console.log(`${caseName} fail data: ${JSON.stringify(data)}`);
            }).catch(err => {
                console.log(`${caseName} set fail: ${err}`);
                netpolicy.getUidPolicy(UID_2).then(data => {
                    console.log(`${caseName} end data: ${JSON.stringify(data)}`);
                    expect(data).assertEqual(netpolicy.NET_POLICY_ALLOW_ALL);
                    done();
                }).catch(err => {
                    console.log(`${caseName} get fail: ${err}`);
                    expect().assertFail();
                    done();
                });
            });
        }).catch(err => {
            console.log(`${caseName} set fail: ${err}`);
            expect().assertFail();
            done();
        })
    });

    /**
     * @tc.number  Telephony_NetworkManager_getUidPolicy_Promise_0500
     * @tc.name    Delete the policy value whose UID is 3 
     *             and test getUidPolicy() to check the return value  
     * @tc.desc    Function test
     */
    it('Telephony_NetworkManager_getUidPolicy_Promise_0500', 0, async function (done) {
        let caseName = 'Telephony_NetworkManager_getUidPolicy_Promise_0500'
        netpolicy.setUidPolicy(UID_3, netpolicy.NET_POLICY_ALLOW_METERED_BACKGROUND).then(data => {
            netpolicy.setUidPolicy(UID_3, netpolicy.NET_POLICY_NONE).then(data => {
                netpolicy.getUidPolicy(UID_3).then(data => {
                    console.log(`${caseName} end data: ${JSON.stringify(data)}`);
                    expect(data).assertEqual(netpolicy.NET_POLICY_NONE);
                    done();
                }).catch(err => {
                    console.log(`${caseName} get fail: ${err}`);
                    expect().assertFail();
                    done();
                });
            }).catch(err => {
                console.log(`${caseName} set fail: ${err}`);
                expect().assertFail();
                done();
            });
        }).catch(err => {
            console.log(`${caseName} set fail: ${err}`);
            expect().assertFail();
            done();
        });
    });
});
