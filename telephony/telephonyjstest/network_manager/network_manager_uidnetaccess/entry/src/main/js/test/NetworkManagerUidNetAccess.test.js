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
import { describe, it, expect, beforeEach } from 'deccjsunit/index';

describe('NetworkManagerUidNetAccessTest', function () {

    const UID_1 = 1;
    const UID_2 = 2;
    const UID_3 = 3;
    const UID_4 = 4;
    const UID_5 = 5;
    const UID_6 = 6;
    const UID_7 = 7;
    const UID_8 = 8;
    const UID_9 = 9;
    const POLICY_9 = 9;

    let POLICY = [
        netpolicy.NET_POLICY_NONE,
        netpolicy.NET_POLICY_ALLOW_METERED_BACKGROUND,
        netpolicy.NET_POLICY_TEMPORARY_ALLOW_METERED, 
        netpolicy.NET_POLICY_REJECT_METERED_BACKGROUND,
        netpolicy.NET_POLICY_ALLOW_ALL,
        netpolicy.NET_POLICY_REJECT_ALL
    ]

    beforeEach(async function () {
        for (let n = 0; n < POLICY.length; n++) {
            await netpolicy.getUids(POLICY[n], async (err, data) => {
                for (let i = 0; i < data.length; i++) {
                    await netpolicy.setUidPolicy(data[i], netpolicy.NET_POLICY_NONE)
                }
            });
        }
    });

    /**
     * @tc.number  Telephony_NetworkManager_getUids_Async_0100
     * @tc.name    Check the policy is "NET_POLICY_NONE" 
     *             and test getUids() to check the result of the callback
     * @tc.desc    Function test
     */
    it('Telephony_NetworkManager_getUids_Async_0100', 0, async function (done) {
        let caseName = 'Telephony_NetworkManager_getUids_Async_0100'
        let result = 0
        netpolicy.setUidPolicy(UID_1, netpolicy.NET_POLICY_NONE, (err, data) => {
            if (err) {
                console.log(`${caseName}  set fail: ${err}`);
                expect().assertFail();
                done();
                return;
            }
            netpolicy.setUidPolicy(UID_2, netpolicy.NET_POLICY_NONE, (err, data) => {
                if (err) {
                    console.log(`${caseName}  set fail: ${err}`);
                    expect().assertFail();
                    done();
                    return;
                }
                netpolicy.setUidPolicy(UID_3, netpolicy.NET_POLICY_TEMPORARY_ALLOW_METERED, (err, data) => {
                    if (err) {
                        console.log(`${caseName}  set fail: ${err}`);
                        expect().assertFail();
                        done();
                        return;
                    }
                    netpolicy.getUids(netpolicy.NET_POLICY_NONE, (err, data) => {
                        if (err) {
                            console.log(`${caseName}  get fail: ${err}`);
                            done();
                            return;
                        }
                        console.log(`${caseName}  end data: ${JSON.stringify(data)}`);
                        expect(data.length).assertEqual(result);
                        done();
                    });
                });
            });
        });
    });

    /**
     * @tc.number  Telephony_NetworkManager_getUids_Async_0200
     * @tc.name    Check the policy is "NET_POLICY_ALLOW_METERED_BACKGROUND" 
     *             and test getUids() to check the result of the callback  
     * @tc.desc    Function test
     */
    it('Telephony_NetworkManager_getUids_Async_0200', 0, async function (done) {
        let caseName = 'Telephony_NetworkManager_getUids_Async_0200'
        let result = [1, 2]
        netpolicy.setUidPolicy(UID_1, netpolicy.NET_POLICY_ALLOW_METERED_BACKGROUND, (err, data) => {
            if (err) {
                console.log(`${caseName}  set fail: ${err}`);
                expect().assertFail();
                done();
                return;
            }
            netpolicy.setUidPolicy(UID_2, netpolicy.NET_POLICY_ALLOW_METERED_BACKGROUND, (err, data) => {
                if (err) {
                    console.log(`${caseName}  set fail: ${err}`);
                    expect().assertFail();
                    done();
                    return;
                }
                netpolicy.setUidPolicy(UID_3, netpolicy.NET_POLICY_TEMPORARY_ALLOW_METERED, (err, data) => {
                    if (err) {
                        console.log(`${caseName}  set fail: ${err}`);
                        expect().assertFail();
                        done();
                        return;
                    }
                    netpolicy.getUids(netpolicy.NET_POLICY_ALLOW_METERED_BACKGROUND, (err, data) => {
                        if (err) {
                            console.log(`${caseName}  get fail: ${err}`);
                            done();
                            return;
                        }
                        console.log(`${caseName}  end data: ${JSON.stringify(data)}`);
                        expect(data.toString()).assertEqual(result.toString());
                        done();
                    });
                });
            });
        });
    });

    /**
     * @tc.number  Telephony_NetworkManager_getUids_Async_0300
     * @tc.name    Check the policy is "NET_POLICY_TEMPORARY_ALLOW_METERED", 
     *             test getUids() to check the callback result  
     * @tc.desc    Function test
     */
    it('Telephony_NetworkManager_getUids_Async_0300', 0, async function (done) {
        let caseName = 'Telephony_NetworkManager_getUids_Async_0300'
        let result = [3]
        netpolicy.setUidPolicy(UID_1, netpolicy.NET_POLICY_ALLOW_METERED_BACKGROUND, (err, data) => {
            if (err) {
                console.log(`${caseName}  set fail: ${err}`);
                expect().assertFail();
                done();
                return;
            }
            netpolicy.setUidPolicy(UID_2, netpolicy.NET_POLICY_ALLOW_METERED_BACKGROUND, (err, data) => {
                if (err) {
                    console.log(`${caseName}  set fail: ${err}`);
                    expect().assertFail();
                    done();
                    return;
                }
                netpolicy.setUidPolicy(UID_3, netpolicy.NET_POLICY_TEMPORARY_ALLOW_METERED, (err, data) => {
                    if (err) {
                        console.log(`${caseName}  set fail: ${err}`);
                        expect().assertFail();
                        done();
                        return;
                    }
                    netpolicy.getUids(netpolicy.NET_POLICY_TEMPORARY_ALLOW_METERED, (err, data) => {
                        if (err) {
                            console.log(`${caseName}  get fail: ${err}`);
                            done();
                            return;
                        }
                        console.log(`${caseName}  end data: ${JSON.stringify(data)}`);
                        expect(data.toString()).assertEqual(result.toString());
                        done();
                    });
                });
            });
        });
    });

    /**
     * @tc.number  Telephony_NetworkManager_getUids_Async_0400
     * @tc.name    Check the policy is "NET_POLICY_REJECT_METERED_BACKGROUND", 
     *             test getUids() to view the callback result  
     * @tc.desc    Function test
     */
    it('Telephony_NetworkManager_getUids_Async_0400', 0, async function (done) {
        let caseName = 'Telephony_NetworkManager_getUids_Async_0400'
        let result = [4, 5]
        netpolicy.setUidPolicy(UID_4, netpolicy.NET_POLICY_REJECT_METERED_BACKGROUND, (err, data) => {
            if (err) {
                console.log(`${caseName}  set fail: ${err}`);
                expect().assertFail();
                done();
                return;
            }
            netpolicy.setUidPolicy(UID_5, netpolicy.NET_POLICY_REJECT_METERED_BACKGROUND, (err, data) => {
                if (err) {
                    console.log(`${caseName}  set fail: ${err}`);
                    expect().assertFail();
                    done();
                    return;
                }
                netpolicy.setUidPolicy(UID_6, netpolicy.NET_POLICY_TEMPORARY_ALLOW_METERED, (err, data) => {
                    if (err) {
                        console.log(`${caseName}  set fail: ${err}`);
                        expect().assertFail();
                        done();
                        return;
                    }
                    netpolicy.getUids(netpolicy.NET_POLICY_REJECT_METERED_BACKGROUND, (err, data) => {
                        if (err) {
                            console.log(`${caseName}  get fail: ${err}`);
                            done();
                            return;
                        }
                        console.log(`${caseName}  end data: ${JSON.stringify(data)}`);
                        expect(data.toString()).assertEqual(result.toString());
                        done();
                    });
                });
            });
        });
    });

    /**
     * @tc.number  Telephony_NetworkManager_getUids_Async_0500
     * @tc.name    Check the policy is "NET_POLICY_ALLOW_ALL" 
     *             and test getUids() to check the result of the callback  
     * @tc.desc    Function test
     */
    it('Telephony_NetworkManager_getUids_Async_0500', 0, async function (done) {
        let caseName = 'Telephony_NetworkManager_getUids_Async_0500'
        let result = [7, 8]
        netpolicy.setUidPolicy(UID_7, netpolicy.NET_POLICY_ALLOW_ALL, (err, data) => {
            if (err) {
                console.log(`${caseName}  set fail: ${err}`);
                expect().assertFail();
                done();
                return;
            }
            netpolicy.setUidPolicy(UID_8, netpolicy.NET_POLICY_ALLOW_ALL, (err, data) => {
                if (err) {
                    console.log(`${caseName}  set fail: ${err}`);
                    expect().assertFail();
                    done();
                    return;
                }
                netpolicy.setUidPolicy(UID_9, netpolicy.NET_POLICY_REJECT_ALL, (err, data) => {
                    if (err) {
                        console.log(`${caseName}  set fail: ${err}`);
                        expect().assertFail();
                        done();
                        return;
                    }
                    netpolicy.getUids(netpolicy.NET_POLICY_ALLOW_ALL, (err, data) => {
                        if (err) {
                            console.log(`${caseName}  get fail: ${err}`);
                            done();
                            return;
                        }
                        console.log(`${caseName}  end data: ${JSON.stringify(data)}`);
                        expect(data.toString()).assertEqual(result.toString());
                        done();
                    });
                });
            });
        });
    });

    /**
     * @tc.number  Telephony_NetworkManager_getUids_Async_0600
     * @tc.name    Check the policy is set to "NET_POLICY_REJECT_ALL" 
     *             and test getUids() to view the callback result  
     * @tc.desc    Function test
     */
    it('Telephony_NetworkManager_getUids_Async_0600', 0, async function (done) {
        let caseName = 'Telephony_NetworkManager_getUids_Async_0600'
        let result = [9]
        netpolicy.setUidPolicy(UID_7, netpolicy.NET_POLICY_ALLOW_ALL, (err, data) => {
            if (err) {
                console.log(`${caseName}  set fail: ${err}`);
                expect().assertFail();
                done();
                return;
            }
            netpolicy.setUidPolicy(UID_8, netpolicy.NET_POLICY_ALLOW_ALL, (err, data) => {
                if (err) {
                    console.log(`${caseName}  set fail: ${err}`);
                    expect().assertFail();
                    done();
                    return;
                }
                netpolicy.setUidPolicy(UID_9, netpolicy.NET_POLICY_REJECT_ALL, (err, data) => {
                    if (err) {
                        console.log(`${caseName}  set fail: ${err}`);
                        expect().assertFail();
                        done();
                        return;
                    }
                    netpolicy.getUids(netpolicy.NET_POLICY_REJECT_ALL, (err, data) => {
                        if (err) {
                            console.log(`${caseName}  get fail: ${err}`);
                            done();
                            return;
                        }
                        console.log(`${caseName}  end data: ${JSON.stringify(data)}`);
                        expect(data.toString()).assertEqual(result.toString());
                        done();
                    });
                });
            });
        });
    });

    /**
     * @tc.number  Telephony_NetworkManager_getUids_Async_0700
     * @tc.name    Check the policy is 9 and test getUids() to check the result of the callback
     * @tc.desc    Function test
     */
    it('Telephony_NetworkManager_getUids_Async_0700', 0, async function (done) {
        let caseName = 'Telephony_NetworkManager_getUids_Async_0700'
        let result = 0
        netpolicy.setUidPolicy(UID_1, netpolicy.NET_POLICY_ALLOW_ALL, (err, data) => {
            if (err) {
                console.log(`${caseName}  set fail: ${err}`);
                expect().assertFail();
                done();
                return;
            }
            netpolicy.setUidPolicy(UID_2, netpolicy.NET_POLICY_ALLOW_ALL, (err, data) => {
                if (err) {
                    console.log(`${caseName}  set fail: ${err}`);
                    expect().assertFail();
                    done();
                    return;
                }
                netpolicy.setUidPolicy(UID_3, netpolicy.NET_POLICY_ALLOW_ALL, (err, data) => {
                    if (err) {
                        console.log(`${caseName}  set fail: ${err}`);
                        expect().assertFail();
                        done();
                        return;
                    }
                    netpolicy.getUids(POLICY_9, (err, data) => {
                        if (err) {
                            console.log(`${caseName}  get fail: ${err}`);
                            done();
                            return;
                        }
                        console.log(`${caseName}  end data: ${JSON.stringify(data)}`);
                        expect(data.length).assertEqual(result);
                        done();
                    });
                });
            });
        });
    });

    /**
     * @tc.number  Telephony_NetworkManager_getUids_Promise_0100
     * @tc.name    Check the policy is "NET_POLICY_NONE" and 
     *             test getUids() to check the return value
     * @tc.desc    Function test
     */
    it('Telephony_NetworkManager_getUids_Promise_0100', 0, async function (done) {
        let caseName = 'Telephony_NetworkManager_getUids_Promise_0100'
        let result = 0
        netpolicy.setUidPolicy(UID_1, netpolicy.NET_POLICY_NONE).then(data => {
            netpolicy.setUidPolicy(UID_2, netpolicy.NET_POLICY_NONE).then(data => {
                netpolicy.setUidPolicy(UID_3, netpolicy.NET_POLICY_TEMPORARY_ALLOW_METERED).then(data => {
                    netpolicy.getUids(netpolicy.NET_POLICY_NONE).then(data => {
                        console.log(`${caseName}  end data: ${data}`);
                        expect(data.length).assertEqual(result);
                        done();
                    }).catch((err) => {
                        console.log(`${caseName} get fail: ${err}`);
                        expect().assertFail();
                        done();
                    });
                }).catch((err) => {
                    console.log(`${caseName} set fail: ${err}`);
                    expect().assertFail();
                    done();
                });
            }).catch((err) => {
                console.log(`${caseName} set fail: ${err}`);
                expect().assertFail();
                done();
            });
        }).catch((err) => {
            console.log(`${caseName} set fail: ${err}`);
            expect().assertFail();
            done();
        });
    });

    /**
     * @tc.number  Telephony_NetworkManager_getUids_Promise_0200
     * @tc.name    Check the policy to "NET_POLICY_ALLOW_METERED_BACKGROUND" and 
     *             test getUids() to check the return value  
     * @tc.desc    Function test
     */
    it('Telephony_NetworkManager_getUids_Promise_0200', 0, async function (done) {
        let caseName = 'Telephony_NetworkManager_getUids_Promise_0200'
        let result = [1, 2]
        netpolicy.setUidPolicy(UID_1, netpolicy.NET_POLICY_ALLOW_METERED_BACKGROUND).then(data => {
            netpolicy.setUidPolicy(UID_2, netpolicy.NET_POLICY_ALLOW_METERED_BACKGROUND).then(data => {
                netpolicy.setUidPolicy(UID_3, netpolicy.NET_POLICY_TEMPORARY_ALLOW_METERED).then(data => {
                    netpolicy.getUids(netpolicy.NET_POLICY_ALLOW_METERED_BACKGROUND).then(data => {
                        console.log(`${caseName}  end data: ${data}`);
                        expect(data.toString()).assertEqual(result.toString());
                        done();
                    }).catch((err) => {
                        console.log(`${caseName} get fail: ${err}`);
                        expect().assertFail();
                        done();
                    });
                }).catch((err) => {
                    console.log(`${caseName} set fail: ${err}`);
                    expect().assertFail();
                    done();
                });
            }).catch((err) => {
                console.log(`${caseName} set fail: ${err}`);
                expect().assertFail();
                done();
            });
        }).catch((err) => {
            console.log(`${caseName} set fail: ${err}`);
            expect().assertFail();
            done();
        });
    });

    /**
     * @tc.number  Telephony_NetworkManager_getUids_Promise_0300
     * @tc.name    Check the policy is "NET_POLICY_TEMPORARY_ALLOW_METERED".
     *             Test getUids() to check the return value
     * @tc.desc    Function test
     */
    it('Telephony_NetworkManager_getUids_Promise_0300', 0, async function (done) {
        let caseName = 'Telephony_NetworkManager_getUids_Promise_0300'
        let result = [3]
        netpolicy.setUidPolicy(UID_1, netpolicy.NET_POLICY_ALLOW_METERED_BACKGROUND).then(data => {
            netpolicy.setUidPolicy(UID_2, netpolicy.NET_POLICY_ALLOW_METERED_BACKGROUND).then(data => {
                netpolicy.setUidPolicy(UID_3, netpolicy.NET_POLICY_TEMPORARY_ALLOW_METERED).then(data => {
                    netpolicy.getUids(netpolicy.NET_POLICY_TEMPORARY_ALLOW_METERED).then(data => {
                        console.log(`${caseName}  end data: ${data}`);
                        expect(data.toString()).assertEqual(result.toString());
                        done();
                    }).catch((err) => {
                        console.log(`${caseName} get fail: ${err}`);
                        expect().assertFail();
                        done();
                    });
                }).catch((err) => {
                    console.log(`${caseName} set fail: ${err}`);
                    expect().assertFail();
                    done();
                });
            }).catch((err) => {
                console.log(`${caseName} set fail: ${err}`);
                expect().assertFail();
                done();
            });
        }).catch((err) => {
            console.log(`${caseName} set fail: ${err}`);
            expect().assertFail();
            done();
        });
    });

    /**
     * @tc.number  Telephony_NetworkManager_getUids_Promise_0400
     * @tc.name    Check the policy is "NET_POLICY_REJECT_METERED_BACKGROUND",
     *             test getUids() to check the return value
     * @tc.desc    Function test
     */
    it('Telephony_NetworkManager_getUids_Promise_0400', 0, async function (done) {
        let caseName = 'Telephony_NetworkManager_getUids_Promise_0400'
        let result = [4, 5]
        netpolicy.setUidPolicy(UID_4, netpolicy.NET_POLICY_REJECT_METERED_BACKGROUND).then(data => {
            netpolicy.setUidPolicy(UID_5, netpolicy.NET_POLICY_REJECT_METERED_BACKGROUND).then(data => {
                netpolicy.setUidPolicy(UID_6, netpolicy.NET_POLICY_TEMPORARY_ALLOW_METERED).then(data => {
                    netpolicy.getUids(netpolicy.NET_POLICY_REJECT_METERED_BACKGROUND).then(data => {
                        console.log(`${caseName}  end data: ${data}`);
                        expect(data.toString()).assertEqual(result.toString());
                        done();
                    }).catch((err) => {
                        console.log(`${caseName} get fail: ${err}`);
                        expect().assertFail();
                        done();
                    })
                }).catch((err) => {
                    console.log(`${caseName} set fail: ${err}`);
                    expect().assertFail();
                    done();
                });
            }).catch((err) => {
                console.log(`${caseName} set fail: ${err}`);
                expect().assertFail();
                done();
            })
        }).catch((err) => {
            console.log(`${caseName} set fail: ${err}`);
            expect().assertFail();
            done();
        })
    })

    /**
     * @tc.number  Telephony_NetworkManager_getUids_Promise_0500
     * @tc.name    Check the policy is "NET_POLICY_ALLOW_ALL" and
     *             test getUids() to check the return value
     * @tc.desc    Function test
     */
    it('Telephony_NetworkManager_getUids_Promise_0500', 0, async function (done) {
        let caseName = 'Telephony_NetworkManager_getUids_Promise_0500'
        let result = [7, 8]
        netpolicy.setUidPolicy(UID_7, netpolicy.NET_POLICY_ALLOW_ALL).then(data => {
            netpolicy.setUidPolicy(UID_8, netpolicy.NET_POLICY_ALLOW_ALL).then(data => {
                netpolicy.setUidPolicy(UID_9, netpolicy.NET_POLICY_REJECT_ALL).then(data => {
                    netpolicy.getUids(netpolicy.NET_POLICY_ALLOW_ALL).then(data => {
                        console.log(`${caseName}  end data: ${data}`);
                        expect(data.toString()).assertEqual(result.toString());
                        done();
                    }).catch((err) => {
                        console.log(`${caseName} get fail: ${err}`);
                        expect().assertFail();
                        done();
                    })
                }).catch((err) => {
                    console.log(`${caseName} set fail: ${err}`);
                    expect().assertFail();
                    done();
                });
            }).catch((err) => {
                console.log(`${caseName} set fail: ${err}`);
                expect().assertFail();
                done();
            })
        }).catch((err) => {
            console.log(`${caseName} set fail: ${err}`);
            expect().assertFail();
            done();
        })
    })

    /**
     * @tc.number  Telephony_NetworkManager_getUids_Promise_0600
     * @tc.name    Check the policy is "NET_POLICY_REJECT_ALL", 
     *             test getUids() to check the return value
     * @tc.desc    Function test
     */
    it('Telephony_NetworkManager_getUids_Promise_0600', 0, async function (done) {
        let caseName = 'Telephony_NetworkManager_getUids_Promise_0600'
        let result = [9]
        netpolicy.setUidPolicy(UID_7, netpolicy.NET_POLICY_ALLOW_ALL).then(data => {
            netpolicy.setUidPolicy(UID_8, netpolicy.NET_POLICY_ALLOW_ALL).then(data => {
                netpolicy.setUidPolicy(UID_9, netpolicy.NET_POLICY_REJECT_ALL).then(data => {
                    netpolicy.getUids(netpolicy.NET_POLICY_REJECT_ALL).then(data => {
                        console.log(`${caseName}  end data: ${data}`);
                        expect(data.toString()).assertEqual(result.toString());
                        done();
                    }).catch((err) => {
                        console.log(`${caseName} get fail: ${err}`);
                        expect().assertFail();
                        done();
                    })
                }).catch((err) => {
                    console.log(`${caseName} set fail: ${err}`);
                    expect().assertFail();
                    done();
                });
            }).catch((err) => {
                console.log(`${caseName} set fail: ${err}`);
                expect().assertFail();
                done();
            })
        }).catch((err) => {
            console.log(`${caseName} set fail: ${err}`);
            expect().assertFail();
            done();
        })
    })

    /**
     * @tc.number  Telephony_NetworkManager_getUids_Promise_0700
     * @tc.name    Check the policy is 9 and test getUids() to check the return value
     * @tc.desc    Function test
     */
    it('Telephony_NetworkManager_getUids_Promise_0700', 0, async function (done) {
        let caseName = 'Telephony_NetworkManager_getUids_Promise_0700'
        let result = 0
        netpolicy.setUidPolicy(UID_1, netpolicy.NET_POLICY_ALLOW_ALL).then(data => {
            netpolicy.setUidPolicy(UID_2, netpolicy.NET_POLICY_ALLOW_ALL).then(data => {
                netpolicy.setUidPolicy(UID_3, netpolicy.NET_POLICY_REJECT_ALL).then(data => {
                    netpolicy.getUids(POLICY_9).then(data => {
                        console.log(`${caseName}  end data: ${data}`);
                        expect(data.length).assertEqual(result);
                        done();
                    }).catch((err) => {
                        console.log(`${caseName} get fail: ${err}`);
                        expect().assertFail();
                        done();
                    });
                }).catch((err) => {
                    console.log(`${caseName} set fail: ${err}`);
                    expect().assertFail();
                    done();
                });
            }).catch((err) => {
                console.log(`${caseName} set fail: ${err}`);
                expect().assertFail();
                done();
            });
        }).catch((err) => {
            console.log(`${caseName} set fail: ${err}`);
            expect().assertFail();
            done();
        });
    })

    /**
     * @tc.number  Telephony_NetworkManager_isUidNetAccess_Async_0100
     * @tc.name    The value of the policy whose UID is 1 is "NET_POLICY_ALLOW_METERED_BACKGROUND", 
     *             test isUidNetAccess() to check the callback result
     * @tc.desc    Function test
     */
    it('Telephony_NetworkManager_isUidNetAccess_Async_0100', 0, async function (done) {
        let caseName = 'Telephony_NetworkManager_isUidNetAccess_Async_0100'
        netpolicy.setUidPolicy(UID_1, netpolicy.NET_POLICY_ALLOW_METERED_BACKGROUND, (err, data) => {
            if (err) {
                console.log(`${caseName} set fail: ${err}`);
                expect().assertFail();
                done();
                return;
            }
            netpolicy.isUidNetAccess(UID_1, true, (err, data) => {
                if (err) {
                    console.log(`${caseName} fail: ${err}`);
                    expect().assertFail();
                    done();
                    return;
                }
                console.log(`${caseName} end data : ${data}`);
                expect(data).assertEqual(true);
                done();
            });
        });
    });

    /**
     * @tc.number  Telephony_NetworkManager_isUidNetAccess_Async_0200
     * @tc.name    Set the value of the policy whose UID is 2 to "NET_POLICY_TEMPORARY_ALLOW_METERED". 
     *             Then test isUidNetAccess() to view the callback result
     * @tc.desc    Function test
     */
    it('Telephony_NetworkManager_isUidNetAccess_Async_0200', 0, async function (done) {
        let caseName = 'Telephony_NetworkManager_isUidNetAccess_Async_0200'
        netpolicy.setUidPolicy(UID_2, netpolicy.NET_POLICY_TEMPORARY_ALLOW_METERED, (err, data) => {
            if (err) {
                console.log(`${caseName} set fail: ${err}`);
                expect().assertFail();
                done();
                return;
            }
            netpolicy.isUidNetAccess(UID_2, true, (err, data) => {
                if (err) {
                    console.log(`${caseName} fail: ${err}`);
                    expect().assertFail();
                    done();
                    return;
                }
                console.log(`${caseName} end data : ${data}`);
                expect(data).assertEqual(true);
                done();
            });
        });
    });

    /**
     * @tc.number  Telephony_NetworkManager_isUidNetAccess_Async_0300
     * @tc.name    Set the value of the policy whose UID is 3 to "NET_POLICY_REJECT_METERED_BACKGROUND" 
     *             and test isUidNetAccess() to view the callback result
     * @tc.desc    Function test
     */
    it('Telephony_NetworkManager_isUidNetAccess_Async_0300', 0, async function (done) {
        let caseName = 'Telephony_NetworkManager_isUidNetAccess_Async_0300'
        netpolicy.setUidPolicy(UID_3, netpolicy.NET_POLICY_REJECT_METERED_BACKGROUND, (err, data) => {
            if (err) {
                console.log(`${caseName} set fail: ${err}`);
                expect().assertFail();
                done();
                return;
            }
            netpolicy.isUidNetAccess(UID_3, true, (err, data) => {
                if (err) {
                    console.log(`${caseName} fail: ${err}`);
                    expect().assertFail();  
                    done();
                    return;
                }
                console.log(`${caseName} end data : ${data}`);
                expect(data).assertEqual(false);
                done();
            });
        });
    });

    /**
     * @tc.number  Telephony_NetworkManager_isUidNetAccess_Async_0400
     * @tc.name    Set the value of the policy whose UID is 4 to "NET_POLICY_ALLOW_ALL" 
     *             and test isUidNetAccess() to view the callback result
     * @tc.desc    Function test
     */
    it('Telephony_NetworkManager_isUidNetAccess_Async_0400', 0, async function (done) {
        let caseName = 'Telephony_NetworkManager_isUidNetAccess_Async_0400'
        netpolicy.setUidPolicy(UID_4, netpolicy.NET_POLICY_ALLOW_ALL, (err, data) => {
            if (err) {
                console.log(`${caseName} set fail: ${err}`);
                expect().assertFail();
                done();
                return;
            }
            netpolicy.isUidNetAccess(UID_4, true, (err, data) => {
                if (err) {
                    console.log(`${caseName} fail: ${err}`);
                    expect().assertFail();
                    done();
                    return;
                }
                console.log(`${caseName} end data : ${data}`);
                expect(data).assertEqual(true);
                done();
            });
        });
    });

    /**
     * @tc.number  Telephony_NetworkManager_isUidNetAccess_Async_0500
     * @tc.name    Set the value of the policy whose UID is 5 to "NET_POLICY_REJECT_ALL "
     *             and test isUidNetAccess() to view the callback result
     * @tc.desc    Function test
     */
    it('Telephony_NetworkManager_isUidNetAccess_Async_0500', 0, async function (done) {
        let caseName = 'Telephony_NetworkManager_isUidNetAccess_Async_0500'
        netpolicy.setUidPolicy(UID_3, netpolicy.NET_POLICY_REJECT_ALL, (err, data) => {
            if (err) {
                console.log(`${caseName} set fail: ${err}`);
                expect().assertFail();
                done();
                return;
            }
            netpolicy.isUidNetAccess(UID_3, true, (err, data) => {
                if (err) {
                    console.log(`${caseName} fail: ${err}`);
                    expect().assertFail();
                    done();
                    return;
                }
                console.log(`${caseName} end data : ${data}`);
                expect(data).assertEqual(false);
                done();
            });
        });
    });

    /**
     * @tc.number  Telephony_NetworkManager_isUidNetAccess_Async_0600
     * @tc.name    Delete the policy value with 3 and 
     *             test isUidNetAccess() to check the result of the callback
     * @tc.desc    Function test
     */
    it('Telephony_NetworkManager_isUidNetAccess_Async_0600', 0, async function (done) {
        let caseName = 'Telephony_NetworkManager_isUidNetAccess_Async_0600'
        netpolicy.setUidPolicy(UID_3, netpolicy.NET_POLICY_REJECT_METERED_BACKGROUND, (err, data) => {
            if (err) {
                console.log(`${caseName} set fail: ${err}`);
                expect().assertFail();
                done();
                return;
            }
            netpolicy.setUidPolicy(UID_3, netpolicy.NET_POLICY_NONE, (err, data) => {
                if (err) {
                    console.log(`${caseName} set fail: ${err}`);
                    expect().assertFail();
                    done();
                    return;
                }
                netpolicy.isUidNetAccess(UID_3, true, (err, data) => {
                    if (err) {
                        console.log(`${caseName} fail: ${err}`);
                        expect().assertFail();
                        done();
                        return;
                    }
                    console.log(`${caseName} end data : ${data}`);
                    expect(data).assertEqual(true);
                    done();
                });
            });
        });
    });

    /**
     * @tc.number  Telephony_NetworkManager_isUidNetAccess_Async_0700
     * @tc.name    Delete the UID to 1 policy value
     *             and test isUidNetAccess() to check the result of the callback
     * @tc.desc    Function test
     */
    it('Telephony_NetworkManager_isUidNetAccess_Async_0700', 0, async function (done) {
        let caseName = 'Telephony_NetworkManager_isUidNetAccess_Async_0700'
        netpolicy.setUidPolicy(UID_1, netpolicy.NET_POLICY_ALLOW_METERED_BACKGROUND, (err, data) => {
            if (err) {
                console.log(`${caseName} set fail: ${err}`);
                expect().assertFail();
                done();
                return;
            }
            netpolicy.setUidPolicy(UID_1, netpolicy.NET_POLICY_NONE, (err, data) => {
                if (err) {
                    console.log(`${caseName} set fail: ${err}`);
                    expect().assertFail();
                    done();
                    return;
                }
                netpolicy.isUidNetAccess(UID_1, true, (err, data) => {
                    if (err) {
                        console.log(`${caseName} fail: ${err}`);
                        expect().assertFail();
                        done();
                        return;
                    }
                    console.log(`${caseName} end data : ${data}`);
                    expect(data).assertEqual(true);
                    done();
                });
            });
        });
    });

    /**
     * @tc.number  Telephony_NetworkManager_isUidNetAccess_Async_0800
     * @tc.name    Update the policy value whose UID is 5 to "NET_POLICY_ALLOW_METERED_BACKGROUND" 
     *             and test isUidNetAccess() to check the result of the callback
     * @tc.desc    Function test
     */
    it('Telephony_NetworkManager_isUidNetAccess_Async_0800', 0, async function (done) {
        let caseName = 'Telephony_NetworkManager_isUidNetAccess_Async_0800'
        netpolicy.setUidPolicy(UID_5, netpolicy.NET_POLICY_REJECT_ALL, (err, data) => {
            if (err) {
                console.log(`${caseName} set fail: ${err}`);
                expect().assertFail();
                done();
                return;
            }
            netpolicy.setUidPolicy(UID_5, netpolicy.NET_POLICY_ALLOW_METERED_BACKGROUND, (err, data) => {
                if (err) {
                    console.log(`${caseName} set fail: ${err}`);
                    expect().assertFail();
                    done();
                    return;
                }
                netpolicy.isUidNetAccess(UID_5, true, (err, data) => {
                    if (err) {
                        console.log(`${caseName} fail: ${err}`);
                        expect().assertFail();
                        done();
                        return;
                    }
                    console.log(`${caseName} end data : ${data}`);
                    expect(data).assertEqual(true);
                    done();
                });
            });
        });
    });

    /**
     * @tc.number  Telephony_NetworkManager_isUidNetAccess_Async_0900
     * @tc.name    Update the policy value whose UID is 2 to "NET_POLICY_REJECT_METERED_BACKGROUND"
     *             and test isUidNetAccess() to view the callback result
     * @tc.desc    Function test
     */
    it('Telephony_NetworkManager_isUidNetAccess_Async_0900', 0, async function (done) {
        let caseName = 'Telephony_NetworkManager_isUidNetAccess_Async_0900'
        netpolicy.setUidPolicy(UID_2, netpolicy.NET_POLICY_TEMPORARY_ALLOW_METERED, (err, data) => {
            if (err) {
                console.log(`${caseName} set fail: ${err}`);
                expect().assertFail();
                done();
                return;
            }
            netpolicy.setUidPolicy(UID_2, netpolicy.NET_POLICY_REJECT_METERED_BACKGROUND, (err, data) => {
                if (err) {
                    console.log(`${caseName} set fail: ${err}`);
                    expect().assertFail();
                    done();
                    return;
                }
                netpolicy.isUidNetAccess(UID_2, true, (err, data) => {
                    if (err) {
                        console.log(`${caseName} fail: ${err}`);
                        expect().assertFail();
                        done();
                        return;
                    }
                    console.log(`${caseName} end data : ${data}`);
                    expect(data).assertEqual(false)
                    done();
                });
            });
        });
    });

    /**
     * @tc.number  Telephony_NetworkManager_isUidNetAccess_Promise_0100
     * @tc.name    Set the value of the POLICY whose UID is 1 to "NET_POLICY_ALLOW_METERED_BACKGROUND",
     *             test isUidNetAccess() to check the return value
     * @tc.desc    Function test
     */
    it('Telephony_NetworkManager_isUidNetAccess_Promise_0100', 0, async function (done) {
        let caseName = 'Telephony_NetworkManager_isUidNetAccess_Promise_0100'
        netpolicy.setUidPolicy(UID_1, netpolicy.NET_POLICY_ALLOW_METERED_BACKGROUND).then(data => {
            netpolicy.isUidNetAccess(UID_1, true).then(data => {
                expect(data).assertEqual(true);
                done();
            }).catch((err) => {
                console.log(`${caseName} get fail: ${err}`);
                expect().assertFail();
                done();
            });
        }).catch((err) => {
            console.log(`${caseName} set fail: ${err}`);
            expect().assertFail();
            done();
        });
    });

    /**
     * @tc.number  Telephony_NetworkManager_isUidNetAccess_Promise_0200
     * @tc.name    Set the value of the POLICY whose UID is 2 to "NET_POLICY_TEMPORARY_ALLOW_METERED" 
     *             and test isUidNetAccess() to check the returned value
     * @tc.desc    Function test
     */
    it('Telephony_NetworkManager_isUidNetAccess_Promise_0200', 0, async function (done) {
        let caseName = 'Telephony_NetworkManager_isUidNetAccess_Promise_0200'
        netpolicy.setUidPolicy(UID_2, netpolicy.NET_POLICY_TEMPORARY_ALLOW_METERED).then(data => {
            netpolicy.isUidNetAccess(UID_2, true).then(data => {
                console.log(`${caseName} end data : ${data}`);
                expect(data).assertEqual(true);
                done();
            }).catch((err) => {
                console.log(`${caseName} fail: ${err}`);
                expect().assertFail();
                done();
            });
        }).catch((err) => {
            console.log(`${caseName} set fail: ${err}`);
            expect().assertFail();
            done();
        });
    });

    /**
     * @tc.number  Telephony_NetworkManager_isUidNetAccess_Promise_0300
     * @tc.name    Set the value of the POLICY whose UID is 3 to "NET_POLICY_REJECT_METERED_BACKGROUND" 
     *             and test isUidNetAccess() to check the return value
     * @tc.desc    Function test
     */
    it('Telephony_NetworkManager_isUidNetAccess_Promise_0300', 0, async function (done) {
        let caseName = 'Telephony_NetworkManager_isUidNetAccess_Promise_0300'
        netpolicy.setUidPolicy(UID_3, netpolicy.NET_POLICY_REJECT_METERED_BACKGROUND).then(data => {
            netpolicy.isUidNetAccess(UID_3, true).then(data => {
                console.log(`${caseName} end data : ${data}`);
                expect(data).assertEqual(false);
                done();
            }).catch((err) => {
                console.log(`${caseName} fail: ${err}`);
                expect().assertFail();
                done();
            });
        }).catch((err) => {
            console.log(`${caseName} set fail: ${err}`);
            expect().assertFail();
            done();
        });
    });

    /**
     * @tc.number  Telephony_NetworkManager_isUidNetAccess_Promise_0400
     * @tc.name    Set the value of the POLICY whose UID is 4 to "NET_POLICY_ALLOW_ALL" 
     *             and test isUidNetAccess() to check the return value
     * @tc.desc    Function test
     */
    it('Telephony_NetworkManager_isUidNetAccess_Promise_0400', 0, async function (done) {
        let caseName = 'Telephony_NetworkManager_isUidNetAccess_Promise_0400'
        netpolicy.setUidPolicy(UID_4, netpolicy.NET_POLICY_ALLOW_ALL).then(data => {
            netpolicy.isUidNetAccess(UID_4, true).then(data => {
                console.log(`${caseName} end data: ${data}`);
                expect(data).assertEqual(true);
                done();
            }).catch((err) => {
                console.log(`${caseName} fail: ${err}`);
                expect().assertFail();
                done();
            });
        }).catch((err) => {
            console.log(`${caseName} set fail: ${err}`);
            expect().assertFail();
            done();
        });
    });

    /**
     * @tc.number  Telephony_NetworkManager_isUidNetAccess_Promise_0500
     * @tc.name    Set the value of the POLICY whose UID is 5 to "NET_POLICY_REJECT_ALL "
     *             and test isUidNetAccess() to check the return value
     * @tc.desc    Function test
     */
    it('Telephony_NetworkManager_isUidNetAccess_Promise_0500', 0, async function (done) {
        let caseName = 'Telephony_NetworkManager_isUidNetAccess_Promise_0500'
        netpolicy.setUidPolicy(UID_5, netpolicy.NET_POLICY_REJECT_ALL).then(data => {
            netpolicy.isUidNetAccess(UID_5, true).then(data => {
                console.log(`${caseName} end data: ${data}`);
                expect(data).assertEqual(false);
                done();
            }).catch((err) => {
                console.log(`${caseName} fail: ${err}`);
                expect().assertFail();
                done();
            });
        }).catch((err) => {
            console.log(`${caseName} set fail: ${err}`);
            expect().assertFail();
            done();
        });
    });

    /**
     * @tc.number  Telephony_NetworkManager_isUidNetAccess_Promise_0600
     * @tc.name    Delete the policy whose UID is 3
     *             and test isUidNetAccess() to check the return value
     * @tc.desc    Function test
     */
    it('Telephony_NetworkManager_isUidNetAccess_Promise_0600', 0, async function (done) {
        let caseName = 'Telephony_NetworkManager_isUidNetAccess_Promise_0600'
        netpolicy.setUidPolicy(UID_3, netpolicy.NET_POLICY_REJECT_METERED_BACKGROUND).then((data) => {
            netpolicy.setUidPolicy(UID_3, netpolicy.NET_POLICY_NONE).then(data => {
                netpolicy.isUidNetAccess(UID_3, true).then(data => {
                    console.log(`${caseName} end data: ${data}`);
                    expect(data).assertEqual(true);
                    done();
                }).catch((err) => {
                    console.log(`${caseName} fail: ${err}`);
                    expect().assertFail();
                    done();
                });
            }).catch((err) => {
                console.log(`${caseName} set fail: ${err}`);
                expect().assertFail();
                done();
            });
        }).catch((err) => {
            console.log(`${caseName} set fail: ${err}`);
            expect().assertFail();
            done();
        });
    });

    /**
     * @tc.number  Telephony_NetworkManager_isUidNetAccess_Promise_0700
     * @tc.name    Delete the policy whose UID is 1
     *             and test isUidNetAccess() to check the return value
     * @tc.desc    Function test
     */
    it('Telephony_NetworkManager_isUidNetAccess_Promise_0700', 0, async function (done) {
        let caseName = 'Telephony_NetworkManager_isUidNetAccess_Promise_0700'
        netpolicy.setUidPolicy(UID_1, netpolicy.NET_POLICY_REJECT_ALL).then(data => {
            netpolicy.setUidPolicy(UID_1, netpolicy.NET_POLICY_NONE).then(data => {
                netpolicy.isUidNetAccess(UID_1, true).then(data => {
                    console.log(`${caseName} end data: ${data}`);
                    expect(data).assertEqual(true);
                    done();
                }).catch((err) => {
                    console.log(`${caseName} fail: ${err}`);
                    expect().assertFail();
                    done();
                });
            }).catch((err) => {
                console.log(`${caseName} set fail: ${err}`);
                expect().assertFail();
                done();
            });
        }).catch((err) => {
            console.log(`${caseName} set fail: ${err}`);
            expect().assertFail();
            done();
        });
    });

    /**
     * @tc.number  Telephony_NetworkManager_isUidNetAccess_Promise_0800
     * @tc.name    Update the policy value whose UID is 5 to "NET_POLICY_ALLOW_METERED_BACKGROUND" 
     *             and test isUidNetAccess() to check the return value
     * @tc.desc    Function test
     */
    it('Telephony_NetworkManager_isUidNetAccess_Promise_0800', 0, async function (done) {
        let caseName = 'Telephony_NetworkManager_isUidNetAccess_Promise_0800'
        netpolicy.setUidPolicy(UID_5, netpolicy.NET_POLICY_REJECT_ALL).then(data => {
            netpolicy.setUidPolicy(UID_5, netpolicy.NET_POLICY_ALLOW_METERED_BACKGROUND).then(data => {
                netpolicy.isUidNetAccess(UID_5, true).then(data => {
                    console.log(`${caseName} end data: ${data}`);
                    expect(data).assertEqual(true);
                    done();
                }).catch((err) => {
                    console.log(`${caseName} fail: ${err}`);
                    expect().assertFail();
                    done();
                });
            }).catch((err) => {
                console.log(`${caseName} set fail: ${err}`);
                expect().assertFail();
                done();
            });
        }).catch((err) => {
            console.log(`${caseName} set fail: ${err}`);
            expect().assertFail();
            done();
        });
    });

    /**
     * @tc.number  Telephony_NetworkManager_isUidNetAccess_Promise_0900
     * @tc.name    Update the policy value whose UID is 2 to "NET_POLICY_REJECT_METERED_BACKGROUND"
     *             and test isUidNetAccess() to check the return value
     * @tc.desc    Function test
     */
    it('Telephony_NetworkManager_isUidNetAccess_Promise_0900', 0, async function (done) {
        let caseName = 'Telephony_NetworkManager_isUidNetAccess_Promise_0900'
        netpolicy.setUidPolicy(UID_2, netpolicy.NET_POLICY_TEMPORARY_ALLOW_METERED).then(data => {
            netpolicy.setUidPolicy(UID_2, netpolicy.NET_POLICY_REJECT_METERED_BACKGROUND).then(data => {
                netpolicy.isUidNetAccess(UID_2, true).then(data => {
                    console.log(`${caseName} end data: ${data}`);
                    expect(data).assertEqual(false);
                    done();
                }).catch((err) => {
                    console.log(`${caseName} fail: ${err}`);
                    expect().assertFail();
                    done();
                });
            }).catch((err) => {
                console.log(`${caseName} set fail: ${err}`);
                expect().assertFail();
                done();
            });
        }).catch((err) => {
            console.log(`${caseName} set fail: ${err}`);
            expect().assertFail();
            done();
        });
    });
});
