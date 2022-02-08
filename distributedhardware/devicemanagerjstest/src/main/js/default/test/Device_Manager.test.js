import app from '@system.app';
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'
import deviceManager from '@ohos.distributedHardware.deviceManager'
var dmClass;

describe('deviceManagerTest', function() {
    console.log("---deviceManager接口测试---")

    /*
     * @tc.number  deviceManagerTest_createDeviceManager_0100
     * @tc.name    Pass in the correct package name
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('deviceManagerTest_createDeviceManager_0100', 0, async function (done) {
        console.log("----------start running deviceManagerTest_createDeviceManager_0100----------");
        var result = await deviceManager.createDeviceManager('com.ohos.devicemangagerdemo', (err, data) => {
            if (err) {
                expect().assertFail();
            }
        });
        expect(result == undefined).assertTrue();
        console.log("----------stop running deviceManagerTest_createDeviceManager_0100----------");
        done();
    })

    /*
     * @tc.number  deviceManagerTest_createDeviceManager_0200
     * @tc.name    Pass in an empty package name
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('deviceManagerTest_createDeviceManager_0200', 0, async function (done) {
        console.log("----------start running deviceManagerTest_createDeviceManager_0200----------");
        var result = deviceManager.createDeviceManager('', (err, data) => {
            if (err) {
                expect().assertFail();
            }
        });
        expect(result == undefined).assertTrue();
        console.log("----------stop running deviceManagerTest_createDeviceManager_0200----------");
        done();
    })

    /*
     * @tc.number  deviceManagerTest_createDeviceManager_0300
     * @tc.name    Pass in malformed package name
     * @tc.desc    Function test
     * @tc.level   1
     */
    it('deviceManagerTest_createDeviceManager_0300', 0, async function (done) {
        console.log("----------start running deviceManagerTest_createDeviceManager_0300----------");
        var result = deviceManager.createDeviceManager('comohosdevicemangagerdemo', (err, data) => {
            if (err) {
                expect().assertFail();
            }
        });
        expect(result == undefined).assertTrue();
        console.log("----------stop running deviceManagerTest_createDeviceManager_0300----------");
        done();
    })

    /*
     * @tc.number  deviceManagerTest_createDeviceManager_0400
     * @tc.name    Incorrect package name passed in
     * @tc.desc    Function test
     * @tc.level   1
     */
    it('deviceManagerTest_createDeviceManager_0400', 0, async function (done) {
        console.log("----------start running deviceManagerTest_createDeviceManager_0400----------");
        var result = deviceManager.createDeviceManager('com.ohos.123', (err, data) => {
            if (err) {
                expect().assertFail();
            }
        });
        expect(result == undefined).assertTrue();
        console.log("----------stop running deviceManagerTest_createDeviceManager_0400----------");
        done();
    })

    /*
     * @tc.number  deviceManagerTest_createDeviceManager_0500
     * @tc.name    Pass in a package name with special characters
     * @tc.desc    Function test
     * @tc.level   1
     */
    it('deviceManagerTest_createDeviceManager_0500', 0, async function (done) {
        console.log("----------start running deviceManagerTest_createDeviceManager_0500----------");
        var result = deviceManager.createDeviceManager('com#ohos%devicemangagerdemo&*', (err, data) => {
            if (err) {
                expect().assertFail();
            }
        });
        expect(result == undefined).assertTrue();
        console.log("----------stop running deviceManagerTest_createDeviceManager_0500----------");
        done();
    })

    /*
     * @tc.number  deviceManagerTest_startDeviceDiscovery_0100
     * @tc.name    Discover device Test with ACTIVE mode
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('deviceManagerTest_startDeviceDiscovery_0100', 0, async function (done) {
        console.log("----------start running deviceManagerTest_startDeviceDiscovery_0100----------");
        deviceManager.createDeviceManager('com.ohos.devicemangagerdemo', (err, data) => {
            if (err) {
                expect().assertFail();
            }
            setTimeout(function(){
                dmClass = data;
                dmStartDeviceDiscovery();
            },1000);
        });
        async function dmStartDeviceDiscovery(){
            var subscribeId = Math.floor(Math.random() * 10000 + 1000);
            var discoverModePassive = 0x55;
            var auto = 0;
            var low = 0;
            var subscribeCapAbilityDDMP = 0;
            var subscribeInfo = {
                "subscribeId": subscribeId,
                "mode": discoverModePassive,
                "medium": auto,
                "freq": low,
                "isSameAccount": false,
                "isWakeRemote": true,
                "capability": subscribeCapAbilityDDMP
            };
            var start = dmClass.startDeviceDiscovery(subscribeInfo);
            expect(start == undefined).assertTrue();
        }
        console.log("----------stop running deviceManagerTest_startDeviceDiscovery_0100----------");
        done();
    })

    /*
     * @tc.number  deviceManagerTest_startDeviceDiscovery_0200
     * @tc.name    Discover device Test with PASSIVE mode
     * @tc.desc    Function test
     * @tc.level   1
     */
    it('deviceManagerTest_startDeviceDiscovery_0200', 0, async function (done) {
        console.log("----------start running deviceManagerTest_startDeviceDiscovery_0200----------");
        deviceManager.createDeviceManager('com.ohos.devicemangagerdemo', (err, data) => {
            if (err) {
                expect().assertFail();
            }
            setTimeout(function(){
                dmClass = data;
                dmStartDeviceDiscovery();
            },1000);
        });
        async function dmStartDeviceDiscovery(){
            var subscribeId = Math.floor(Math.random() * 10000 + 1000);
            var discoverModePassive = 0x55;
            var ble = 1;
            var mid = 1;
            var subscribeCapAbilityDDMP = 0;
            var subscribeInfo = {
                "subscribeId": subscribeId,
                "mode": discoverModePassive,
                "medium": ble,
                "freq": mid,
                "isSameAccount": false,
                "isWakeRemote": true,
                "capability": subscribeCapAbilityDDMP
            };
            var start = dmClass.startDeviceDiscovery(subscribeInfo);
            expect(start == undefined).assertTrue();
        }
        console.log("----------stop running deviceManagerTest_startDeviceDiscovery_0200----------");
        done();
    })

    /*
     * @tc.number  deviceManagerTest_startDeviceDiscovery_0300
     * @tc.name    Incoming normal device information,DiscoverMode is DISCOVER_MODE_ACTIVE,
                   ExchangeMedium is COAP,ExchangeFreq is HIGH,SubscribeCap is SUBSCRIBE_CAPABILITY_DDMP
     * @tc.desc    Function test
     * @tc.level   1
     */
    it('deviceManagerTest_startDeviceDiscovery_0300', 0, async function (done) {
        console.log("----------start running deviceManagerTest_startDeviceDiscovery_0300----------");
        deviceManager.createDeviceManager('com.ohos.devicemangagerdemo', (err, data) => {
            if (err) {
                expect().assertFail();
            }
            setTimeout(function(){
                dmClass = data;
                dmStartDeviceDiscovery();
            },1000);
        });
        async function dmStartDeviceDiscovery(){
            var subscribeId = Math.floor(Math.random() * 10000 + 1000);
            var discoverModeActive = 0xAA;
            var coap = 2;
            var high = 2;
            var subscribeCapAbilityDDMP = 0;
            var subscribeInfo = {
                "subscribeId": subscribeId,
                "mode": discoverModeActive,
                "medium": coap,
                "freq": high,
                "isSameAccount": false,
                "isWakeRemote": true,
                "capability": subscribeCapAbilityDDMP
            };
            var start = dmClass.startDeviceDiscovery(subscribeInfo);
            expect(start == undefined).assertTrue();
        }
        console.log("----------stop running deviceManagerTest_startDeviceDiscovery_0300----------");
        done();
    })

    /*
     * @tc.number  deviceManagerTest_startDeviceDiscovery_0400
     * @tc.name    DeviceDiscovery with ACTIVE mode
     * @tc.desc    Function test
     * @tc.level   1
     */
    it('deviceManagerTest_startDeviceDiscovery_0400', 0, async function (done) {
        console.log("----------start running deviceManagerTest_startDeviceDiscovery_0400----------");
        deviceManager.createDeviceManager('com.ohos.devicemangagerdemo', (err, data) => {
            if (err) {
                expect().assertFail();
            }
            setTimeout(function(){
                dmClass = data;
                dmStartDeviceDiscovery();
            },1000);
        });
        async function dmStartDeviceDiscovery(){
            var subscribeId = Math.floor(Math.random() * 10000 + 1000);
            var discoverModeActive = 0xAA;
            var usb = 3;
            var superHigh = 3;
            var subscribeCapAbilityDDMP = 0;
            var subscribeInfo = {
                "subscribeId": subscribeId,
                "mode": discoverModeActive,
                "medium": usb,
                "freq": superHigh,
                "isSameAccount": false,
                "isWakeRemote": true,
                "capability": subscribeCapAbilityDDMP
            };
            var start = dmClass.startDeviceDiscovery(subscribeInfo);
            expect(start == undefined).assertTrue();
        }
        console.log("----------stop running deviceManagerTest_startDeviceDiscovery_0400----------");
        done();
    })

    /*
     * @tc.number  deviceManagerTest_startDeviceDiscovery_0500
     * @tc.name    DeviceDiscovery with PASSIVE mode
     * @tc.desc    Function test
     * @tc.level   1
     */
    it('deviceManagerTest_startDeviceDiscovery_0500', 0, async function (done) {
        console.log("----------start running deviceManagerTest_startDeviceDiscovery_0500----------");
        deviceManager.createDeviceManager('com.ohos.devicemangagerdemo', (err, data) => {
            if (err) {
                expect().assertFail();
            }
            setTimeout(function(){
                dmClass = data;
                dmStartDeviceDiscovery();
            },1000);
        });
        async function dmStartDeviceDiscovery(){
            var subscribeId = Math.floor(Math.random() * 10000 + 1000);
            var discoverModePassive = 0x55;
            var auto = 0;
            var low = 0;
            var subscribeCapAbilityOSD = 1;
            var subscribeInfo = {
                "subscribeId": subscribeId,
                "mode": discoverModePassive,
                "medium": auto,
                "freq": low,
                "isSameAccount": false,
                "isWakeRemote": true,
                "capability": subscribeCapAbilityOSD
            };
            var start = dmClass.startDeviceDiscovery(subscribeInfo);
            expect(start == undefined).assertTrue();
        }
        console.log("----------stop running deviceManagerTest_startDeviceDiscovery_0500----------");
        done();
    })

    /*
     * @tc.number  deviceManagerTest_startDeviceDiscovery_0600
     * @tc.name    Pass in empty device information
     * @tc.desc    Function test
     * @tc.level   1
     */
    it('deviceManagerTest_startDeviceDiscovery_0600', 0, async function (done) {
        console.log("----------start running deviceManagerTest_startDeviceDiscovery_0600----------");
        deviceManager.createDeviceManager('com.ohos.devicemangagerdemo', (err, data) => {
            if (err) {
                expect().assertFail();
            }
            setTimeout(function(){
                dmClass = data;
                dmStartDeviceDiscovery();
            },1000);
        });
        async function dmStartDeviceDiscovery(){
            var subscribeInfo = {};
            try{
                var start = dmClass.startDeviceDiscovery(subscribeInfo);
                expect(start == undefined).assertFail();
            }catch(e){
                console.log('error is: '+ e);
                expect(e != null).assertTrue();
            }
        }
        console.log("----------stop running deviceManagerTest_startDeviceDiscovery_0600----------");
        done();
    })

    /*
     * @tc.number  deviceManagerTest_release_0100
     * @tc.name    Call the release interface normally
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('deviceManagerTest_release_0100', 0, async function (done) {
        console.log("----------start running deviceManagerTest_release_0100----------");
        deviceManager.createDeviceManager('com.ohos.devicemangagerdemo', (err, data) => {
            if (err) {
                expect().assertFail();
            }
            setTimeout(function(){
                dmClass = data;
                dmRelease();
            },1000);
        });
        async function dmRelease(){
            var re = dmClass.release();
            expect(re == undefined).assertTrue();
        }
        console.log("----------stop running deviceManagerTest_release_0100----------");
        done();
    })

    /*
     * @tc.number  deviceManagerTest_dmGetTrustedDeviceList1_0100
     * @tc.name    Call the dmGetTrustedDeviceList1 interface normally
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('deviceManagerTest_dmGetTrustedDeviceList1_0100', 0, async function (done) {
        console.log("----------start running deviceManagerTest_dmGetTrustedDeviceList1_0100----------");
        deviceManager.createDeviceManager('com.ohos.devicemangagerdemo', (err, data) => {
            if (err) {
                expect().assertFail();
            }
            setTimeout(function(){
                dmClass = data;
                dmGetTrustedDeviceList1();
            },1000);
        });
        async function dmGetTrustedDeviceList1(){
            var result = dmClass.getTrustedDeviceList((err, data) => {
                if (err) {
                    expect().assertFail();
                }
                setTimeout(function(){
                    dmClass = data;
                    dmCheckResult();
                },1000);
            });
            async function dmCheckResult(){
                expect(result == undefined).assertTrue();
            }
        }
        console.log("----------stop running deviceManagerTest_dmGetTrustedDeviceList1_0100----------");
        done();
    })

    /*
     * @tc.number  deviceManagerTest_dmGetTrustedDeviceList1_0200
     * @tc.name    When an incorrect package name is passed in, the dmGetTrustedDeviceList1 interface is called
     * @tc.desc    Function test
     * @tc.level   1
     */
    it('deviceManagerTest_dmGetTrustedDeviceList1_0200', 0, async function (done) {
        console.log("----------start running deviceManagerTest_dmGetTrustedDeviceList1_0200----------");
        deviceManager.createDeviceManager('comohosdevicemangagerdemo', (err, data) => {
            if (err) {
                expect().assertFail();
            }
            setTimeout(function(){
                dmClass = data;
                dmGetTrustedDeviceList1();
            },1000);
        });
        async function dmGetTrustedDeviceList1(){
            var result = dmClass.getTrustedDeviceList((err, data) => {
                if (err) {
                    expect().assertFail();
                }
                setTimeout(function(){
                    dmCheckResult();
                },1000);
            });
            async function dmCheckResult(){
                expect(result == undefined).assertTrue();
            }
        }
        console.log("----------stop running deviceManagerTest_dmGetTrustedDeviceList1_0200----------");
        done();
    })

    /*
     * @tc.number  deviceManagerTest_dmGetTrustedDeviceList2_0100
     * @tc.name    Pass in normal parameters(FilterOption),sortType is 0
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('deviceManagerTest_dmGetTrustedDeviceList2_0100', 0, async function (done) {
        console.log("----------start running deviceManagerTest_dmGetTrustedDeviceList2_0100----------");
        deviceManager.createDeviceManager('com.ohos.devicemangagerdemo', (err, data) => {
            if (err) {
                expect().assertFail();
            }
            setTimeout(function(){
                dmClass = data;
                dmGetTrustedDeviceList2();
            },1000);
        });
        async function dmGetTrustedDeviceList2(){
            var mFilterOption = {
                targetPkgName : "com.ohos.devicemanagerui",
                sortType : 0,
                filter : JSON.stringify({key : 'test', value : 0})
            }
            var result = dmClass.getTrustedDeviceList(mFilterOption, (err, data) => {
                if (err) {
                    expect().assertFail();
                }
                setTimeout(function(){
                    dmCheckResult();
                },1000);
            });
            async function dmCheckResult(){
                expect(result == undefined).assertTrue();
            }
        }
        console.log("----------stop running deviceManagerTest_dmGetTrustedDeviceList2_0100----------");
        done();
    })

    /*
     * @tc.number  deviceManagerTest_dmGetTrustedDeviceList2_0200
     * @tc.name    Pass in normal parameters(FilterOption),sortType is 1
     * @tc.desc    Function test
     * @tc.level   1
     */
    it('deviceManagerTest_dmGetTrustedDeviceList2_0200', 0, async function (done) {
        console.log("----------start running deviceManagerTest_dmGetTrustedDeviceList2_0200----------");
        deviceManager.createDeviceManager('com.ohos.devicemangagerdemo', (err, data) => {
            if (err) {
                expect().assertFail();
            }
            setTimeout(function(){
                dmClass = data;
                dmGetTrustedDeviceList2();
            },1000);
        });
        async function dmGetTrustedDeviceList2(){
            var mFilterOption = {
                targetPkgName : "com.ohos.devicemanagerui",
                sortType : 1,
                filter : JSON.stringify({key : 'test', value : 0})
            }
            var result = dmClass.getTrustedDeviceList(mFilterOption, (err, data) => {
                if (err) {
                    expect().assertFail();
                }
                setTimeout(function(){
                    dmCheckResult();
                },1000);
            });
            async function dmCheckResult(){
                expect(result == undefined).assertTrue();
            }
        }
        console.log("----------stop running deviceManagerTest_dmGetTrustedDeviceList2_0200----------");
        done();
    })

    /*
     * @tc.number  deviceManagerTest_dmGetTrustedDeviceList2_0300
     * @tc.name    Pass in normal parameters(FilterOption),sortType is 2
     * @tc.desc    Function test
     * @tc.level   1
     */
    it('deviceManagerTest_dmGetTrustedDeviceList2_0300', 0, async function (done) {
        console.log("----------start running deviceManagerTest_dmGetTrustedDeviceList2_0300----------");
        deviceManager.createDeviceManager('com.ohos.devicemangagerdemo', (err, data) => {
            if (err) {
                expect().assertFail();
            }
            setTimeout(function(){
                dmClass = data;
                dmGetTrustedDeviceList2();
            },1000);
        });
        async function dmGetTrustedDeviceList2(){
            var mFilterOption = {
                targetPkgName : "com.ohos.devicemanagerui",
                sortType : 2,
                filter : JSON.stringify({key : 'test', value : 0})
            }
            var result = dmClass.getTrustedDeviceList(mFilterOption, (err, data) => {
                if (err) {
                    expect().assertFail();
                }
                setTimeout(function(){
                    dmCheckResult();
                },1000);
            });
            async function dmCheckResult(){
                console.log("3333" + result)
                expect(result == undefined).assertTrue();
            }
        }
        console.log("----------stop running deviceManagerTest_dmGetTrustedDeviceList2_0300----------");
        done();
    })

    /*
     * @tc.number  deviceManagerTest_dmGetTrustedDeviceList2_0400
     * @tc.name    Pass in normal parameters(FilterOption),targetPkgName is null
     * @tc.desc    Function test
     * @tc.level   1
     */
    it('deviceManagerTest_dmGetTrustedDeviceList2_0400', 0, async function (done) {
        console.log("----------start running deviceManagerTest_dmGetTrustedDeviceList2_0400----------");
        deviceManager.createDeviceManager('com.ohos.devicemangagerdemo', (err, data) => {
            if (err) {
                expect().assertFail();
            }
            setTimeout(function(){
                dmClass = data;
                dmGetTrustedDeviceList2();
            },1000);
        });
        async function dmGetTrustedDeviceList2(){
            var mFilterOption = {
                targetPkgName : "",
                sortType : 0,
                filter : JSON.stringify({key : 'test', value : 0})
            }
            var result = dmClass.getTrustedDeviceList(mFilterOption, (err, data) => {
                if (err) {
                    expect().assertFail();
                }
                setTimeout(function(){
                    dmCheckResult();
                },1000);
            });
            async function dmCheckResult(){
                expect(result == undefined).assertTrue();
            }
        }
        console.log("----------stop running deviceManagerTest_dmGetTrustedDeviceList2_0400----------");
        done();
    })

    /*
     * @tc.number  deviceManagerTest_dmGetTrustedDeviceList2_0500
     * @tc.name    Pass in normal parameters(FilterOption),filter is null
     * @tc.desc    Function test
     * @tc.level   1
     */
    it('deviceManagerTest_dmGetTrustedDeviceList2_0500', 0, async function (done) {
        console.log("----------start running deviceManagerTest_dmGetTrustedDeviceList2_0500----------");
        deviceManager.createDeviceManager('com.ohos.devicemangagerdemo', (err, data) => {
            if (err) {
                expect().assertFail();
            }
            setTimeout(function(){
                dmClass = data;
                dmGetTrustedDeviceList2();
            },1000);
        });
        async function dmGetTrustedDeviceList2(){
            var mFilterOption = {
                targetPkgName : "com.ohos.devicemanagerui",
                sortType : 0,
                filter : JSON.stringify({})
            }
            var result = dmClass.getTrustedDeviceList(mFilterOption, (err, data) => {
                if (err) {
                    expect().assertFail();
                }
                setTimeout(function(){
                    dmCheckResult();
                })
            });
            async function dmCheckResult(){
                expect(result == undefined).assertTrue();
            }
        }
        console.log("----------stop running deviceManagerTest_dmGetTrustedDeviceList2_0500----------");
        done();
    })

    /*
     * @tc.number  deviceManagerTest_dmGetTrustedDeviceList2_0600
     * @tc.name    Pass in null parameter
     * @tc.desc    Function test
     * @tc.level   1
     */
    it('deviceManagerTest_dmGetTrustedDeviceList2_0600', 0, async function (done) {
        console.log("----------start running deviceManagerTest_dmGetTrustedDeviceList2_0600----------");
        deviceManager.createDeviceManager('com.ohos.devicemangagerdemo', (err, data) => {
            if (err) {
                expect().assertFail();
            }
            setTimeout(function(){
                dmClass = data;
                dmGetTrustedDeviceList2();
            },1000);
        });
        async function dmGetTrustedDeviceList2(){
            try{
                var result = dmClass.getTrustedDeviceList('', (err, data) => {
                    if (err) {
                        expect().assertFail();
                    }
                });
            }catch(e){
                console.log('error is : ' + e);
                expect(e != null).assertTrue();
            }
        }
        console.log("----------stop running deviceManagerTest_dmGetTrustedDeviceList2_0600----------");
        done();
    })

    /*
     * @tc.number  deviceManagerTest_dmGetTrustedDeviceList2_0700
     * @tc.name    Pass in normal parameters(FilterOption),sortType is not in enum
     * @tc.desc    Function test
     * @tc.level   1
     */
    it('deviceManagerTest_dmGetTrustedDeviceList2_0700', 0, async function (done) {
        console.log("----------start running deviceManagerTest_dmGetTrustedDeviceList2_0700----------");
        deviceManager.createDeviceManager('com.ohos.devicemangagerdemo', (err, data) => {
            if (err) {
                expect().assertFail();
            }
            setTimeout(function(){
                dmClass = data;
                dmGetTrustedDeviceList2();
            },1000);
        });
        async function dmGetTrustedDeviceList2(){
            var mFilterOption = {
                targetPkgName : "com.ohos.devicemanagerui",
                sortType : 5,
                filter : JSON.stringify({key : 'test', value : 0})
            }
            var result = dmClass.getTrustedDeviceList(mFilterOption, (err, data) => {
                if (err) {
                    expect().assertFail();
                }
                setTimeout(function(){
                    dmCheckResult();
                },1000);
            });
            async function dmCheckResult(){
                expect(dmClass == undefined).assertTrue();
            }
        }
        console.log("----------stop running deviceManagerTest_dmGetTrustedDeviceList2_0700----------");
        done();
    })

    /*
     * @tc.number  deviceManagerTest_getTrustedDeviceList(promise)_0100
     * @tc.name    Pass in normal parameters(FilterOption),sortType is 0
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('deviceManagerTest_getTrustedDeviceList(promise)_0100', 0, async function (done) {
        console.log("----------start running deviceManagerTest_getTrustedDeviceList(promise)_0100----------");
        deviceManager.createDeviceManager('com.ohos.devicemangagerdemo', (err, data) => {
            if (err) {
                expect().assertFail();
            }
            setTimeout(function(){
                dmClass = data;
                dmGetTrustedDeviceList3();
            },1000);
        });
        async function dmGetTrustedDeviceList3(){
            var mFilterOption = {
                targetPkgName : "com.ohos.devicemanagerui",
                sortType : 0,
                filter : JSON.stringify({key : 'test', value : 0})
            }
            var result = dmClass.getTrustedDeviceList(mFilterOption).then(data => {
//                console.log('22222222222' + JSON.stringify(data))
            })
            setTimeout(function(){
                dmCheckResult();
            },1000);
            async function dmCheckResult(){
//                console.log('promise is : ' + JSON.stringify(result))
                expect(result != null).assertTrue();
            }
        }
        console.log("----------stop running deviceManagerTest_getTrustedDeviceList(promise)_0100----------");
        done();
    })

    /*
     * @tc.number  deviceManagerTest_getTrustedDeviceList(promise)_0200
     * @tc.name    Pass in normal parameters(FilterOption),sortType is 1
     * @tc.desc    Function test
     * @tc.level   1
     */
    it('deviceManagerTest_getTrustedDeviceList(promise)_0200', 0, async function (done) {
        console.log("----------start running deviceManagerTest_getTrustedDeviceList(promise)_0200----------");
        deviceManager.createDeviceManager('com.ohos.devicemangagerdemo', (err, data) => {
            if (err) {
                expect().assertFail();
            }
            setTimeout(function(){
                dmClass = data;
                dmGetTrustedDeviceList3();
            },1000);
        });
        async function dmGetTrustedDeviceList3(){
            var mFilterOption = {
                targetPkgName : "com.ohos.devicemanagerui",
                sortType : 1,
                filter : JSON.stringify({key : 'test', value : 0})
            }
            var result = dmClass.getTrustedDeviceList(mFilterOption).then(data => {
//                console.log('data is :' + JSON.stringify(data))
            })
            setTimeout(function(){
                dmCheckResult();
            },1000);
            async function dmCheckResult(){
//                console.log('promise is : ' + JSON.stringify(result))
                expect(result != null).assertTrue();
            }
        }
        console.log("----------stop running deviceManagerTest_getTrustedDeviceList(promise)_0200----------");
        done();
    })

    /*
     * @tc.number  deviceManagerTest_getTrustedDeviceList(promise)_0300
     * @tc.name    Pass in normal parameters(FilterOption),sortType is 2
     * @tc.desc    Function test
     * @tc.level   1
     */
    it('deviceManagerTest_getTrustedDeviceList(promise)_0300', 0, async function (done) {
        console.log("----------start running deviceManagerTest_getTrustedDeviceList(promise)_0300----------");
        deviceManager.createDeviceManager('com.ohos.devicemangagerdemo', (err, data) => {
            if (err) {
                expect().assertFail();
            }
            setTimeout(function(){
                dmClass = data;
                dmGetTrustedDeviceList3();
            },1000);
        });
        async function dmGetTrustedDeviceList3(){
            var mFilterOption = {
                targetPkgName : "com.ohos.devicemanagerui",
                sortType : 2,
                filter : JSON.stringify({key : 'test', value : 0})
            }
            var result = dmClass.getTrustedDeviceList(mFilterOption).then(data => {
//                console.log('22222222222' + JSON.stringify(data))
            })
            setTimeout(function(){
                dmCheckResult();
            },1000);
            async function dmCheckResult(){
//                console.log('promise is : ' + JSON.stringify(result))
                expect(result != null).assertTrue();
            }
        }
        console.log("----------stop running deviceManagerTest_getTrustedDeviceList(promise)_0300----------");
        done();
    })

    /*
     * @tc.number  deviceManagerTest_getTrustedDeviceList(promise)_0400
     * @tc.name    Pass in normal parameters(FilterOption),targetPkgName is null
     * @tc.desc    Function test
     * @tc.level   1
     */
    it('deviceManagerTest_getTrustedDeviceList(promise)_0400', 0, async function (done) {
        console.log("----------start running deviceManagerTest_getTrustedDeviceList(promise)_0400----------");
        deviceManager.createDeviceManager('com.ohos.devicemangagerdemo', (err, data) => {
            if (err) {
                expect().assertFail();
            }
            setTimeout(function(){
                dmClass = data;
                dmGetTrustedDeviceList3();
            },1000);
        });
        async function dmGetTrustedDeviceList3(){
            var mFilterOption = {
                targetPkgName : "",
                sortType : 0,
                filter : JSON.stringify({key : 'test', value : 0})
            }
            var result = dmClass.getTrustedDeviceList(mFilterOption).then(data => {
//                console.log('22222222222' + JSON.stringify(data))
            })
            setTimeout(function(){
                dmCheckResult();
            },1000);
            async function dmCheckResult(){
//                console.log('promise is : ' + JSON.stringify(result))
                expect(result != null).assertTrue();
            }
        }
        console.log("----------stop running deviceManagerTest_getTrustedDeviceList(promise)_0400----------");
        done();
    })

    /*
     * @tc.number  deviceManagerTest_getTrustedDeviceList(promise)_0500
     * @tc.name    Pass in normal parameters(FilterOption),filter is null
     * @tc.desc    Function test
     * @tc.level   1
     */
    it('deviceManagerTest_getTrustedDeviceList(promise)_0500', 0, async function (done) {
        console.log("----------start running deviceManagerTest_getTrustedDeviceList(promise)_0500----------");
        deviceManager.createDeviceManager('com.ohos.devicemangagerdemo', (err, data) => {
            if (err) {
                expect().assertFail();
            }
            setTimeout(function(){
                dmClass = data;
                dmGetTrustedDeviceList3();
            },1000);
        });
        async function dmGetTrustedDeviceList3(){
            var mFilterOption = {
                targetPkgName : "com.ohos.devicemanagerui",
                sortType : 0,
                filter : JSON.stringify({})
            }
            var result = dmClass.getTrustedDeviceList(mFilterOption).then(data => {
                //                console.log('22222222222' + JSON.stringify(data))
            })
            setTimeout(function(){
                dmCheckResult();
            },1000);
            async function dmCheckResult(){
                //                console.log('promise is : ' + JSON.stringify(result))
                expect(result != null).assertTrue();
            }
        }
        console.log("----------stop running deviceManagerTest_getTrustedDeviceList(promise)_0500----------");
        done();
    })

    /*
     * @tc.number  deviceManagerTest_getTrustedDeviceList(promise)_0600
     * @tc.name    Pass in null parameter
     * @tc.desc    Function test
     * @tc.level   1
     */
    it('deviceManagerTest_getTrustedDeviceList(promise)_0600', 0, async function (done) {
        console.log("----------start running deviceManagerTest_getTrustedDeviceList(promise)_0600----------");
        deviceManager.createDeviceManager('com.ohos.devicemangagerdemo', (err, data) => {
            if (err) {
                expect().assertFail();
            }
            setTimeout(function(){
                dmClass = data;
                dmGetTrustedDeviceList3();
            },1000);
        });
        async function dmGetTrustedDeviceList3(){
            try{
                var result = dmClass.getTrustedDeviceList('').then(data => {
//                console.log('22222222222' + JSON.stringify(data))
                })
            }catch(e){
                console.log('error is :' + e);
                expect(e = null).assertTrue();
            }
        }
        console.log("----------stop running deviceManagerTest_getTrustedDeviceList(promise)_0600----------");
        done();
    })

    /*
     * @tc.number  deviceManagerTest_getTrustedDeviceList(promise)_0700
     * @tc.name    Pass in normal parameters(FilterOption),sortType is not in enum
     * @tc.desc    Function test
     * @tc.level   1
     */
    it('deviceManagerTest_getTrustedDeviceList(promise)_0700', 0, async function (done) {
        console.log("----------start running deviceManagerTest_getTrustedDeviceList(promise)_0700----------");
        deviceManager.createDeviceManager('com.ohos.devicemangagerdemo', (err, data) => {
            if (err) {
                expect().assertFail();
            }
            setTimeout(function(){
                dmClass = data;
                dmGetTrustedDeviceList3();
            },1000);
        });
        async function dmGetTrustedDeviceList3(){
            var mFilterOption = {
                targetPkgName : "com.ohos.devicemanagerui",
                sortType : 5,
                filter : JSON.stringify({key : 'test', value : 0})
            }
            var result = dmClass.getTrustedDeviceList(mFilterOption).then(data => {
//                console.log('22222222222' + JSON.stringify(data))
            })
            setTimeout(function(){
                dmCheckResult();
            },1000);
            async function dmCheckResult(){
//                console.log('promise is : ' + JSON.stringify(result))
                expect(result != null).assertTrue();
            }
        }
        console.log("----------stop running deviceManagerTest_getTrustedDeviceList(promise)_0700----------");
        done();
    })

    /*
     * @tc.number  deviceManagerTest_stopDeviceDiscovery_0100
     * @tc.name    Pass in the normal subscribeid
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('deviceManagerTest_stopDeviceDiscovery_0100', 0, async function (done) {
        console.log("----------start running deviceManagerTest_stopDeviceDiscovery_0100----------");
        deviceManager.createDeviceManager('com.ohos.devicemangagerdemo', (err, data) => {
            if (err) {
                expect().assertFail();
            }
            setTimeout(function(){
                dmClass = data;
                dmStopDeviceDiscovery();
            })
        });
        async function dmStopDeviceDiscovery(){
            var subscribeId = Math.floor(Math.random() * 10000 + 1000);
            var result = dmClass.stopDeviceDiscovery(subscribeId);
            expect(result == undefined).assertTrue();
        }
        console.log("----------stop running deviceManagerTest_stopDeviceDiscovery_0100----------");
        done();
    })

    /*
     * @tc.number  deviceManagerTest_stopDeviceDiscovery_0200
     * @tc.name    Subscribeid passed in null value
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('deviceManagerTest_stopDeviceDiscovery_0200', 0, async function (done) {
        console.log("----------start running deviceManagerTest_stopDeviceDiscovery_0200----------");
        deviceManager.createDeviceManager('com.ohos.devicemangagerdemo', (err, data) => {
            if (err) {
                expect().assertFail();
            }
            setTimeout(function(){
                dmClass = data;
                dmStopDeviceDiscovery();
            })
        });
        async function dmStopDeviceDiscovery(){
            try{
                var subscribeId = '';
                var result = dmClass.stopDeviceDiscovery(subscribeId);
            }catch(e){
                console.log('error is: '+ e);
                expect(e != null).assertTrue();
            }
        }
        console.log("----------stop running deviceManagerTest_stopDeviceDiscovery_0200----------");
        done();
    })

    /*
     * @tc.number  deviceManagerTest_stopDeviceDiscovery_0300
     * @tc.name    Subscribeid pass in special symbol
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('deviceManagerTest_stopDeviceDiscovery_0300', 0, async function (done) {
        console.log("----------start running deviceManagerTest_stopDeviceDiscovery_0300----------");
        deviceManager.createDeviceManager('com.ohos.devicemangagerdemo', (err, data) => {
            if (err) {
                expect().assertFail();
            }
            setTimeout(function(){
                dmClass = data;
                dmStopDeviceDiscovery();
            })
        });
        async function dmStopDeviceDiscovery(){
            try{
                var subscribeId = '$%^&*';
                var result = dmClass.stopDeviceDiscovery(subscribeId);
            }catch(e){
                console.log('error is: '+ e);
                expect(e != null).assertTrue();
            }
        }
        console.log("----------stop running deviceManagerTest_stopDeviceDiscovery_0300----------");
        done();
    })

    /*
     * @tc.number  deviceManagerTest_stopDeviceDiscovery_0400
     * @tc.name    Subscribeid pass in letter
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('deviceManagerTest_stopDeviceDiscovery_0400', 0, async function (done) {
        console.log("----------start running deviceManagerTest_stopDeviceDiscovery_0400----------");
        deviceManager.createDeviceManager('com.ohos.devicemangagerdemo', (err, data) => {
            if (err) {
                expect().assertFail();
            }
            setTimeout(function(){
                dmClass = data;
                dmStopDeviceDiscovery();
            })
        });
        async function dmStopDeviceDiscovery(){
            try{
                var subscribeId = 'abcdefg';
                var result = dmClass.stopDeviceDiscovery(subscribeId);
                expect(result != null).assertFail();
            }catch(e){
                console.log('error is: '+ e);
                expect(e != null).assertTrue();
            }
        }
        console.log("----------stop running deviceManagerTest_stopDeviceDiscovery_0400----------");
        done();
    })

    /*
     * @tc.number  deviceManagerTest_authenticateDevice_0100
     * @tc.name    Pass in the normal deviceInfo、authParam,deviceType is UNKNOWN_TYPE
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('deviceManagerTest_authenticateDevice_0100', 0, async function (done) {
        console.log("----------start running deviceManagerTest_authenticateDevice_0100----------");
        deviceManager.createDeviceManager('com.ohos.devicemangagerdemo', (err, data) => {
            if (err) {
                expect().assertFail();
            }
            setTimeout(function(){
                dmClass = data;
                dmAuthenticateDevice();
            })
        });
        async function dmAuthenticateDevice(){
            var unknownType = 0;
            let deviceInfo = {
                deviceId: "",
                deviceName: "",
                deviceType: unknownType
            }
            let extraInfo = {
                "targetPkgName": 'com.ohos.devicemangagerdemo',
                "appName": "myapplication",
                "appDescription": "apply auth",
                "business": '0',
                "displayOwner": 0
            }
            let authParam = {
                "authType": 1,
                "appIcon": new Uint8Array([]),
                "appThumbnail": new Uint8Array([]),
                "extraInfo": extraInfo
            }
            var result = dmClass.authenticateDevice(deviceInfo, authParam, (err, data) => {
                if (err) {
                    expect().assertFail();
                }
            });
            expect(result == undefined).assertTrue()
        }
        console.log("----------stop running deviceManagerTest_authenticateDevice_0100----------");
        done();
    })

    /*
     * @tc.number  deviceManagerTest_authenticateDevice_0200
     * @tc.name    Pass in the normal deviceInfo、authParam,deviceType is SPEAKER
     * @tc.desc    Function test
     * @tc.level   1
     */
    it('deviceManagerTest_authenticateDevice_0200', 0, async function (done) {
        console.log("----------start running deviceManagerTest_authenticateDevice_0200----------");
        deviceManager.createDeviceManager('com.ohos.devicemangagerdemo', (err, data) => {
            if (err) {
                expect().assertFail();
            }
            setTimeout(function(){
                dmClass = data;
                dmAuthenticateDevice();
            })
        });
        async function dmAuthenticateDevice(){
            var speaker = 0x0A;
            let deviceInfo = {
                deviceId: "",
                deviceName: "",
                deviceType: speaker
            }
            let extraInfo = {
                "targetPkgName": 'com.ohos.devicemangagerdemo',
                "appName": "myapplication",
                "appDescription": "apply auth",
                "business": '0',
                "displayOwner": 0
            }
            let authParam = {
                "authType": 1,
                "appIcon": new Uint8Array([]),
                "appThumbnail": new Uint8Array([]),
                "extraInfo": extraInfo
            }
            var result = dmClass.authenticateDevice(deviceInfo, authParam, (err, data) => {
                if (err) {
                    expect().assertFail();
                }
            });
            expect(result == undefined).assertTrue()
            }
        console.log("----------stop running deviceManagerTest_authenticateDevice_0200----------");
        done();
    })

    /*
     * @tc.number  deviceManagerTest_authenticateDevice_0300
     * @tc.name    Pass in the normal deviceInfo、authParam,deviceType is PHONE
     * @tc.desc    Function test
     * @tc.level   1
     */
    it('deviceManagerTest_authenticateDevice_0300', 0, async function (done) {
        console.log("----------start running deviceManagerTest_authenticateDevice_0300----------");
        deviceManager.createDeviceManager('com.ohos.devicemangagerdemo', (err, data) => {
            if (err) {
                expect().assertFail();
            }
            setTimeout(function(){
                dmClass = data;
                dmAuthenticateDevice();
            })
        });
        async function dmAuthenticateDevice(){
            var phone = 0x0E;
            let deviceInfo = {
                deviceId: "",
                deviceName: "",
                deviceType: phone
            }
            let extraInfo = {
                "targetPkgName": 'com.ohos.devicemangagerdemo',
                "appName": "myapplication",
                "appDescription": "apply auth",
                "business": '0',
                "displayOwner": 0
            }
            let authParam = {
                "authType": 1,
                "appIcon": new Uint8Array([]),
                "appThumbnail": new Uint8Array([]),
                "extraInfo": extraInfo
            }
            var result = dmClass.authenticateDevice(deviceInfo, authParam, (err, data) => {
                if (err) {
                    expect().assertFail();
                }
            });
            expect(result == undefined).assertTrue();
        }
        console.log("----------stop running deviceManagerTest_authenticateDevice_0300----------");
        done();
    })

    /*
     * @tc.number  deviceManagerTest_authenticateDevice_0400
     * @tc.name    Pass in the normal deviceInfo、authParam,deviceType is TABLET
     * @tc.desc    Function test
     * @tc.level   1
     */
    it('deviceManagerTest_authenticateDevice_0400', 0, async function (done) {
        console.log("----------start running deviceManagerTest_authenticateDevice_0400----------");
        deviceManager.createDeviceManager('com.ohos.devicemangagerdemo', (err, data) => {
            if (err) {
                expect().assertFail();
            }
            setTimeout(function(){
                dmClass = data;
                dmAuthenticateDevice();
            })
        });
        async function dmAuthenticateDevice(){
            var tablet = 0x11;
            let deviceInfo = {
                deviceId: "",
                deviceName: "",
                deviceType: tablet
            }
            let extraInfo = {
                "targetPkgName": 'com.ohos.devicemangagerdemo',
                "appName": "myapplication",
                "appDescription": "apply auth",
                "business": '0',
                "displayOwner": 0
            }
            let authParam = {
                "authType": 1,
                "appIcon": new Uint8Array([]),
                "appThumbnail": new Uint8Array([]),
                "extraInfo": extraInfo
            }
            var result = dmClass.authenticateDevice(deviceInfo, authParam, (err, data) => {
                if (err) {
                    expect().assertFail();
                }
            });
                expect(result == undefined).assertTrue()

        }
        console.log("----------stop running deviceManagerTest_authenticateDevice_0400----------");
        done();
    })

    /*
     * @tc.number  deviceManagerTest_authenticateDevice_0500
     * @tc.name    Pass in the normal deviceInfo、authParam,deviceType is WEARABLE
     * @tc.desc    Function test
     * @tc.level   1
     */
    it('deviceManagerTest_authenticateDevice_0500', 0, async function (done) {
        console.log("----------start running deviceManagerTest_authenticateDevice_0500----------");
        deviceManager.createDeviceManager('com.ohos.devicemangagerdemo', (err, data) => {
            if (err) {
                expect().assertFail();
            }
            setTimeout(function(){
                dmClass = data;
                dmAuthenticateDevice();
            },1000);
        });
        async function dmAuthenticateDevice(){
            var wearable = 0x6D;
            let deviceInfo = {
                deviceId: "",
                deviceName: "",
                deviceType: wearable
            }
            let extraInfo = {
                "targetPkgName": 'com.ohos.devicemangagerdemo',
                "appName": "myapplication",
                "appDescription": "apply auth",
                "business": '0',
                "displayOwner": 0
            }
            let authParam = {
                "authType": 1,
                "appIcon": new Uint8Array([]),
                "appThumbnail": new Uint8Array([]),
                "extraInfo": extraInfo
            }
            var result = dmClass.authenticateDevice(deviceInfo, authParam, (err, data) => {
                if (err) {
                    expect().assertFail();
                }
            });
                expect(result == undefined).assertTrue()
        }
        console.log("----------stop running deviceManagerTest_authenticateDevice_0500----------");
        done();
    })

    /*
     * @tc.number  deviceManagerTest_authenticateDevice_0600
     * @tc.name    Pass in the normal deviceInfo、authParam,deviceType is CAR
     * @tc.desc    Function test
     * @tc.level   1
     */
    it('deviceManagerTest_authenticateDevice_0600', 0, async function (done) {
        console.log("----------start running deviceManagerTest_authenticateDevice_0600----------");
        deviceManager.createDeviceManager('com.ohos.devicemangagerdemo', (err, data) => {
            if (err) {
                expect().assertFail();
            }
            setTimeout(function(){
                dmClass = data;
                dmAuthenticateDevice();
            },1000);
        });
        async function dmAuthenticateDevice(){
            var car = 0x83;
            let deviceInfo = {
                deviceId: "",
                deviceName: "",
                deviceType: car
            }
            let extraInfo = {
                "targetPkgName": 'com.ohos.devicemangagerdemo',
                "appName": "myapplication",
                "appDescription": "apply auth",
                "business": '0',
                "displayOwner": 0
            }
            let authParam = {
                "authType": 1,
                "appIcon": new Uint8Array([]),
                "appThumbnail": new Uint8Array([]),
                "extraInfo": extraInfo
            }
            var result = dmClass.authenticateDevice(deviceInfo, authParam, (err, data) => {
                if (err) {
                    expect().assertFail();
                }
            });
                expect(result == undefined).assertTrue()
        }
        console.log("----------stop running deviceManagerTest_authenticateDevice_0600----------");
        done();
    })

    /*
     * @tc.number  deviceManagerTest_authenticateDevice_0700
     * @tc.name    Pass in the normal deviceInfo、authParam,deviceType is TV
     * @tc.desc    Function test
     * @tc.level   1
     */
    it('deviceManagerTest_authenticateDevice_0700', 0, async function (done) {
        console.log("----------start running deviceManagerTest_authenticateDevice_0700----------");
        deviceManager.createDeviceManager('com.ohos.devicemangagerdemo', (err, data) => {
            if (err) {
                expect().assertFail();
            }
            setTimeout(function(){
                dmClass = data;
                dmAuthenticateDevice();
            },1000);
        });
        async function dmAuthenticateDevice(){
            var tv = 0x9C;
            let deviceInfo = {
                deviceId: "",
                deviceName: "",
                deviceType: tv
            }
            let extraInfo = {
                "targetPkgName": 'com.ohos.devicemangagerdemo',
                "appName": "myapplication",
                "appDescription": "apply auth",
                "business": '0',
                "displayOwner": 0
            }
            let authParam = {
                "authType": 1,
                "appIcon": new Uint8Array([]),
                "appThumbnail": new Uint8Array([]),
                "extraInfo": extraInfo
            }
            var result = dmClass.authenticateDevice(deviceInfo, authParam, (err, data) => {
                if (err) {
                    expect().assertFail();
                }
            });
                expect(result == undefined).assertTrue();
        }
        console.log("----------stop running deviceManagerTest_authenticateDevice_0700----------");
        done();
    })

    /*
     * @tc.number  deviceManagerTest_authenticateDevice_0800
     * @tc.name    DeviceInfo passes in a null value
     * @tc.desc    Function test
     * @tc.level   1
     */
    it('deviceManagerTest_authenticateDevice_0800', 0, async function (done) {
        console.log("----------start running deviceManagerTest_authenticateDevice_0800----------");
        deviceManager.createDeviceManager('com.ohos.devicemangagerdemo', (err, data) => {
            if (err) {
                expect().assertFail();
            }
            setTimeout(function(){
                dmClass = data;
                dmAuthenticateDevice();
            },1000);
        });
        async function dmAuthenticateDevice(){
            let deviceInfo = {}
            let extraInfo = {
                "targetPkgName": 'com.ohos.devicemangagerdemo',
                "appName": "myapplication",
                "appDescription": "apply auth",
                "business": '0',
                "displayOwner": 0
            }
            let authParam = {
                "authType": 1,
                "appIcon": new Uint8Array([]),
                "appThumbnail": new Uint8Array([]),
                "extraInfo": extraInfo
            }
            var result = dmClass.authenticateDevice(deviceInfo, authParam, (err, data) => {
                if (err) {
                    expect().assertFail();
                }
            });
            expect(result == undefined).assertTrue();
        }
        console.log("----------stop running deviceManagerTest_authenticateDevice_0800----------");
        done();
    })

    /*
     * @tc.number  deviceManagerTest_authenticateDevice_0900
     * @tc.name    Pass in the normal deviceInfo、authParam,deviceType is 0
     * @tc.desc    Function test
     * @tc.level   1
     */
    it('deviceManagerTest_authenticateDevice_0900', 0, async function (done) {
        console.log("----------start running deviceManagerTest_authenticateDevice_0900----------");
        deviceManager.createDeviceManager('com.ohos.devicemangagerdemo', (err, data) => {
            if (err) {
                expect().assertFail();
            }
            setTimeout(function(){
                dmClass = data;
                dmAuthenticateDevice();
            },1000);
        });
        async function dmAuthenticateDevice(){
            let deviceInfo = {
                deviceId: "",
                deviceName: "",
                deviceType: 0
            }
            let extraInfo = {
                "targetPkgName": 'com.ohos.devicemangagerdemo',
                "appName": "myapplication",
                "appDescription": "apply auth",
                "business": '0',
                "displayOwner": 0
            }
            let authParam = {
                "authType": 1,
                "appIcon": new Uint8Array([]),
                "appThumbnail": new Uint8Array([]),
                "extraInfo": extraInfo
            }
            var result = dmClass.authenticateDevice(deviceInfo, authParam, (err, data) => {
                if (err) {
                    expect().assertFail();
                }
            });
            expect(result == undefined).assertTrue();
        }
        console.log("----------stop running deviceManagerTest_authenticateDevice_0900----------");
        done();
    })

    /*
     * @tc.number  deviceManagerTest_verifyAuthInfo_0100
     * @tc.name    Pass in the normal authInfo
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('deviceManagerTest_verifyAuthInfo_0100', 0, async function (done) {
        console.log("----------start running deviceManagerTest_verifyAuthInfo_0100----------");
        deviceManager.createDeviceManager('com.ohos.devicemangagerdemo', (err, data) => {
            if (err) {
                expect().assertFail();
            }
            setTimeout(function(){
                dmClass = data;
                dmVerifyAuthInfo();
            },1000);
        });
        async function dmVerifyAuthInfo(){
            let authInfo = {
                "authType": 1,
                "token": 12,
                "extraInfo": {
                    "pinCode": 123456,
                }
            }
            var result = dmClass.verifyAuthInfo(authInfo, (err, data) => {
                if (err) {
                    expect().assertFail();
                }
            });
            expect(result == undefined).assertTrue();
        }
        console.log("----------stop running deviceManagerTest_verifyAuthInfo_0100----------");
        done();
    })

    /*
     * @tc.number  deviceManagerTest_verifyAuthInfo_0200
     * @tc.name    authType is not number
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('deviceManagerTest_verifyAuthInfo_0200', 0, async function (done) {
        console.log("----------start running deviceManagerTest_verifyAuthInfo_0200----------");
        deviceManager.createDeviceManager('com.ohos.devicemangagerdemo', (err, data) => {
            if (err) {
                expect().assertFail();
            }
            setTimeout(function(){
                dmClass = data;
                dmVerifyAuthInfo();
            },1000);
        });
        async function dmVerifyAuthInfo(){
            let authInfo = {
                "authType": 'asd',
                "token": 12,
                "extraInfo": {
                    "pinCode": 123456,
                }
            }
            var result = dmClass.verifyAuthInfo(authInfo, (err, data) => {
                if (err) {
                    expect().assertFail();
                }
            });
            expect(result == undefined).assertTrue();
        }
        console.log("----------stop running deviceManagerTest_verifyAuthInfo_0200----------");
        done();
    })

    /*
     * @tc.number  deviceManagerTest_verifyAuthInfo_0300
     * @tc.name    token is not number
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('deviceManagerTest_verifyAuthInfo_0300', 0, async function (done) {
        console.log("----------start running deviceManagerTest_verifyAuthInfo_0300----------");
        deviceManager.createDeviceManager('com.ohos.devicemangagerdemo', (err, data) => {
            if (err) {
                expect().assertFail();
            }
            setTimeout(function(){
                dmClass = data;
                dmVerifyAuthInfo();
            },1000);
        });
        async function dmVerifyAuthInfo(){
            let authInfo = {
                "authType": 1,
                "token": 'asd',
                "extraInfo": {
                    "pinCode": 123456,
                }
            }
            var result = dmClass.verifyAuthInfo(authInfo, (err, data) => {
                if (err) {
                    expect().assertFail();
                }
            });
            expect(result == undefined).assertTrue();
        }
        console.log("----------stop running deviceManagerTest_verifyAuthInfo_0300----------");
        done();
    })

    /*
     * @tc.number  deviceManagerTest_verifyAuthInfo_0400
     * @tc.name    extraInfo is not number
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('deviceManagerTest_verifyAuthInfo_0400', 0, async function (done) {
        console.log("----------start running deviceManagerTest_verifyAuthInfo_0400----------");
        deviceManager.createDeviceManager('com.ohos.devicemangagerdemo', (err, data) => {
            if (err) {
                expect().assertFail();
            }
            setTimeout(function(){
                dmClass = data;
                dmVerifyAuthInfo();
            },1000);
        });
        async function dmVerifyAuthInfo(){
            let authInfo = {
                "authType": 1,
                "token": 12,
                "extraInfo": {
                    "pinCode": 'asd',
                }
            }
            var result = dmClass.verifyAuthInfo(authInfo, (err, data) => {
                if (err) {
                    expect().assertFail();
                }
            });
            expect(result == undefined).assertTrue();
        }
        console.log("----------stop running deviceManagerTest_verifyAuthInfo_0400----------");
        done();
    })

    /*
     * @tc.number  deviceManagerTest_verifyAuthInfo_0500
     * @tc.name    AuthInfo passed in null value
     * @tc.desc    Function test
     * @tc.level   1
     */
        it('deviceManagerTest_verifyAuthInfo_0500', 0, async function (done) {
            console.log("----------start running deviceManagerTest_verifyAuthInfo_0500----------");
            deviceManager.createDeviceManager('com.ohos.devicemangagerdemo', (err, data) => {
                if (err) {
                    expect().assertFail();
                }
                setTimeout(function(){
                    dmClass = data;
                    dmVerifyAuthInfo();
                },1000);
            });
            async function dmVerifyAuthInfo(){
                let authInfo = {}
                var result = dmClass.verifyAuthInfo(authInfo, (err, data) => {
                    if (err) {
                        expect().assertFail();
                    }
                });
                expect(result == undefined).assertTrue();
            }
            console.log("----------stop running deviceManagerTest_verifyAuthInfo_0500----------");
            done();
        })

    /*
     * @tc.number  deviceManagerTest_getFaParam_0100
     * @tc.name    Call getFaParam interface normally
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('deviceManagerTest_getFaParam_0100', 0, async function (done) {
        console.log("----------start running deviceManagerTest_getFaParam_0100----------");
        deviceManager.createDeviceManager('com.ohos.devicemangagerdemo', (err, data) => {
            if (err) {
                expect().assertFail();
            }
            setTimeout(function(){
                dmClass = data;
                dmGetFaParam();
            },1000);
        });
        async function dmGetFaParam(){
            var faParam = dmClass.getFaParam();
            expect(faParam.authParam.extraInfo.pinToken < 0).assertTrue();
        }
        console.log("----------stop running deviceManagerTest_getFaParam_0100----------");
        done();
    })

    /*
     * @tc.number  deviceManagerTest_setUserOperation_0100
     * @tc.name    Call setuseroperation interface，UserOperationAction is ACTION_ALLOW_AUTH
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('deviceManagerTest_setUserOperation_0100', 0, async function (done) {
        console.log("----------start running deviceManagerTest_setUserOperation_0100----------");
        deviceManager.createDeviceManager('com.ohos.devicemangagerdemo', (err, data) => {
            if (err) {
                expect().assertFail();
            }
            setTimeout(function(){
                dmClass = data;
                dmSetUserOperation();
            },1000);
        });
        async function dmSetUserOperation(){
            var actionAllowAuth = 0;
            var operation = actionAllowAuth;
            var faParam = dmClass.setUserOperation(operation);
            expect(faParam == undefined).assertTrue();
        }
        console.log("----------stop running deviceManagerTest_setUserOperation_0100----------");
        done();
    })

    /*
     * @tc.number  deviceManagerTest_setUserOperation_0200
     * @tc.name    Call setuseroperation interface，UserOperationAction is ACTION_CANCEL_AUTH
     * @tc.desc    Function test
     * @tc.level   1
     */
    it('deviceManagerTest_setUserOperation_0200', 0, async function (done) {
        console.log("----------start running deviceManagerTest_setUserOperation_0200----------");
        deviceManager.createDeviceManager('com.ohos.devicemangagerdemo', (err, data) => {
            if (err) {
                expect().assertFail();
            }
            setTimeout(function(){
                dmClass = data;
                dmSetUserOperation();
            },1000);
        });
        async function dmSetUserOperation(){
            var actionCancelAuth = 1;
            var operation = actionCancelAuth;
            var faParam = dmClass.setUserOperation(operation);
            expect(faParam == undefined).assertTrue();
        }
        console.log("----------stop running deviceManagerTest_setUserOperation_0200----------");
        done();
    })

    /*
     * @tc.number  deviceManagerTest_setUserOperation_0300
     * @tc.name    Call setuseroperation interface，UserOperationAction is ACTION_AUTH_CONFIRM_TIMEOUT
     * @tc.desc    Function test
     * @tc.level   1
     */
    it('deviceManagerTest_setUserOperation_0300', 0, async function (done) {
        console.log("----------start running deviceManagerTest_setUserOperation_0300----------");
        deviceManager.createDeviceManager('com.ohos.devicemangagerdemo', (err, data) => {
            if (err) {
                expect().assertFail();
            }
            setTimeout(function(){
                dmClass = data;
                dmSetUserOperation();
            },1000);
        });
        async function dmSetUserOperation(){
            var actionAuthConfirmTimeOut = 2;
            var operation = actionAuthConfirmTimeOut;
            var faParam = dmClass.setUserOperation(operation);
            expect(faParam == undefined).assertTrue();
        }
        console.log("----------stop running deviceManagerTest_setUserOperation_0300----------");
        done();
    })

    /*
     * @tc.number  deviceManagerTest_setUserOperation_0400
     * @tc.name    Call setuseroperation interface，UserOperationAction is ACTION_CANCEL_PINCODE_DISPLAY
     * @tc.desc    Function test
     * @tc.level   1
     */
    it('deviceManagerTest_setUserOperation_0400', 0, async function (done) {
        console.log("----------start running deviceManagerTest_setUserOperation_0400----------");
        deviceManager.createDeviceManager('com.ohos.devicemangagerdemo', (err, data) => {
            if (err) {
                expect().assertFail();
            }
            setTimeout(function(){
                dmClass = data;
                dmSetUserOperation();
            },1000);
        });
        async function dmSetUserOperation(){
            var actionCancelPinCodeDisplay = 3;
            var operation = actionCancelPinCodeDisplay;
            var faParam = dmClass.setUserOperation(operation);
            expect(faParam == undefined).assertTrue();
        }
        console.log("----------stop running deviceManagerTest_setUserOperation_0400----------");
        done();
    })

    /*
     * @tc.number  deviceManagerTest_setUserOperation_0500
     * @tc.name    Call setuseroperation interface，UserOperationAction is ACTION_CANCEL_PINCODE_INPUT
     * @tc.desc    Function test
     * @tc.level   1
     */
    it('deviceManagerTest_setUserOperation_0500', 0, async function (done) {
        console.log("----------start running deviceManagerTest_setUserOperation_0500----------");
        deviceManager.createDeviceManager('com.ohos.devicemangagerdemo', (err, data) => {
            if (err) {
                expect().assertFail();
            }
            setTimeout(function(){
                dmClass = data;
                dmSetUserOperation();
            },1000);
        });
        async function dmSetUserOperation(){
            var actionCancelPinCodeInput = 4;
            var operation = actionCancelPinCodeInput;
            var faParam = dmClass.setUserOperation(operation);
            expect(faParam == undefined).assertTrue();
        }
        console.log("----------stop running deviceManagerTest_setUserOperation_0500----------");
        done();
    })

    /*
     * @tc.number  deviceManagerTest_setUserOperation_0600
     * @tc.name    Call setuseroperation interface，UserOperationAction is ACTION_CANCEL_CONWIFI_INPUT
     * @tc.desc    Function test
     * @tc.level   1
     */
    it('deviceManagerTest_setUserOperation_0600', 0, async function (done) {
        console.log("----------start running deviceManagerTest_setUserOperation_0600----------");
        deviceManager.createDeviceManager('com.ohos.devicemangagerdemo', (err, data) => {
            if (err) {
                expect().assertFail();
            }
            setTimeout(function(){
                dmClass = data;
                dmSetUserOperation();
            },1000);
        });
        async function dmSetUserOperation(){
            var actionCancelConWifiInput = 5;
            var operation = actionCancelConWifiInput;
            var faParam = dmClass.setUserOperation(operation);
            expect(faParam == undefined).assertTrue();
        }
        console.log("----------stop running deviceManagerTest_setUserOperation_0600----------");
        done();
    })

    /*
     * @tc.number  deviceManagerTest_setUserOperation_0700
     * @tc.name    Call setuseroperation interface，UserOperationAction is null
     * @tc.desc    Function test
     * @tc.level   1
     */
    it('deviceManagerTest_setUserOperation_0700', 0, async function (done) {
        console.log("----------start running deviceManagerTest_setUserOperation_0700----------");
        deviceManager.createDeviceManager('com.ohos.devicemangagerdemo', (err, data) => {
            if (err) {
                expect().assertFail();
            }
            setTimeout(function(){
                dmClass = data;
                dmSetUserOperation();
            },1000);
        });
        async function dmSetUserOperation(){
            try{
                var operation = '';
                var faParam = dmClass.setUserOperation(operation);
            }catch(e){
                console.log('error is :' + e);
                expect(e != null).assertTrue();
            }
        }
        console.log("----------stop running deviceManagerTest_setUserOperation_0700----------");
        done();
    })

    /*
     * @tc.number  deviceManagerTest_startConfigureWifi_0100
     * @tc.name    Call startconfigurewifi interface，deviceType is unknownType
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('deviceManagerTest_startConfigureWifi_0100', 0, async function (done) {
        console.log("----------start running deviceManagerTest_startConfigureWifi_0100----------");
        deviceManager.createDeviceManager('com.ohos.devicemangagerdemo', (err, data) => {
            if (err) {
                expect().assertFail();
            }
            setTimeout(function(){
                dmClass = data;
                dmStartConfigureWifi();
            },1000);
        });
        async function dmStartConfigureWifi(){
            var unknownType =0;
            let deviceInfo = {
                deviceId: "",
                deviceName: "",
                deviceType: unknownType
            }
            var token = dmClass.startConfigureWifi(deviceInfo);
            expect(token == undefined).assertTrue();
        }
        console.log("----------stop running deviceManagerTest_startConfigureWifi_0100----------");
        done();
    })

    /*
     * @tc.number  deviceManagerTest_startConfigureWifi_0200
     * @tc.name    Call startconfigurewifi interface，deviceType is SPEAKER
     * @tc.desc    Function test
     * @tc.level   1
     */
    it('deviceManagerTest_startConfigureWifi_0200', 0, async function (done) {
        console.log("----------start running deviceManagerTest_startConfigureWifi_0200----------");
        deviceManager.createDeviceManager('com.ohos.devicemangagerdemo', (err, data) => {
            if (err) {
                expect().assertFail();
            }
            setTimeout(function(){
                dmClass = data;
                dmStartConfigureWifi();
            },1000);
        });
        async function dmStartConfigureWifi(){
            var speaker = 0x0A;
            let deviceInfo = {
                deviceId: "",
                deviceName: "",
                deviceType: speaker
            }
            var token = dmClass.startConfigureWifi(deviceInfo);
            expect(token == undefined).assertTrue();
        }
        console.log("----------stop running deviceManagerTest_startConfigureWifi_0200----------");
        done();
    })

    /*
     * @tc.number  deviceManagerTest_startConfigureWifi_0300
     * @tc.name    Call startconfigurewifi interface，deviceType is PHONE
     * @tc.desc    Function test
     * @tc.level   1
     */
    it('deviceManagerTest_startConfigureWifi_0300', 0, async function (done) {
        console.log("----------start running deviceManagerTest_startConfigureWifi_0300----------");
        deviceManager.createDeviceManager('com.ohos.devicemangagerdemo', (err, data) => {
            if (err) {
                expect().assertFail();
            }
            setTimeout(function(){
                dmClass = data;
                dmStartConfigureWifi();
            },1000);
        });
        async function dmStartConfigureWifi(){
            var phone = 0x0E;
            let deviceInfo = {
                deviceId: "",
                deviceName: "",
                deviceType: phone
            }
            var token = dmClass.startConfigureWifi(deviceInfo);
            expect(token == undefined).assertTrue();
        }
        console.log("----------stop running deviceManagerTest_startConfigureWifi_0300----------");
        done();
    })

    /*
     * @tc.number  deviceManagerTest_startConfigureWifi_0400
     * @tc.name    Call startconfigurewifi interface，deviceType is TABLET
     * @tc.desc    Function test
     * @tc.level   1
     */
    it('deviceManagerTest_startConfigureWifi_0400', 0, async function (done) {
        console.log("----------start running deviceManagerTest_startConfigureWifi_0400----------");
        deviceManager.createDeviceManager('com.ohos.devicemangagerdemo', (err, data) => {
            if (err) {
                expect().assertFail();
            }
            setTimeout(function(){
                dmClass = data;
                dmStartConfigureWifi();
            },1000);
        });
        async function dmStartConfigureWifi(){
            var tablet = 0x11;
            let deviceInfo = {
                deviceId: "",
                deviceName: "",
                deviceType: tablet
            }
            var token = dmClass.startConfigureWifi(deviceInfo);
            expect(token == undefined).assertTrue();
        }
        console.log("----------stop running deviceManagerTest_startConfigureWifi_0400----------");
        done();
    })

    /*
     * @tc.number  deviceManagerTest_startConfigureWifi_0500
     * @tc.name    Call startconfigurewifi interface，deviceType is WEARABLE
     * @tc.desc    Function test
     * @tc.level   1
     */
    it('deviceManagerTest_startConfigureWifi_0500', 0, async function (done) {
        console.log("----------start running deviceManagerTest_startConfigureWifi_0500----------");
        deviceManager.createDeviceManager('com.ohos.devicemangagerdemo', (err, data) => {
            if (err) {
                expect().assertFail();
            }
            setTimeout(function(){
                dmClass = data;
                dmStartConfigureWifi();
            },1000);
        });

        async function dmStartConfigureWifi(){
            var wearable = 0x6D;
            let deviceInfo = {
                deviceId: "",
                deviceName: "",
                deviceType: wearable
            }
            var token = dmClass.startConfigureWifi(deviceInfo);
            expect(token == undefined).assertTrue();
        }
        console.log("----------stop running deviceManagerTest_startConfigureWifi_0500----------");
        done();
    })

    /*
     * @tc.number  deviceManagerTest_startConfigureWifi_0600
     * @tc.name    Call startconfigurewifi interface，deviceType is CAR
     * @tc.desc    Function test
     * @tc.level   1
     */
    it('deviceManagerTest_startConfigureWifi_0600', 0, async function (done) {
        console.log("----------start running deviceManagerTest_startConfigureWifi_0600----------");
        deviceManager.createDeviceManager('com.ohos.devicemangagerdemo', (err, data) => {
            if (err) {
                expect().assertFail();
            }
            setTimeout(function(){
                dmClass = data;
                dmStartConfigureWifi();
            },1000);
        });
        async function dmStartConfigureWifi(){
            var car = 0x83;
            let deviceInfo = {
                deviceId: "",
                deviceName: "",
                deviceType: car
            }
            var token = dmClass.startConfigureWifi(deviceInfo);
            expect(token == undefined).assertTrue();
        }
        console.log("----------stop running deviceManagerTest_startConfigureWifi_0600----------");
        done();
    })

    /*
     * @tc.number  deviceManagerTest_startConfigureWifi_0700
     * @tc.name    Call startconfigurewifi interface，deviceType is TV
     * @tc.desc    Function test
     * @tc.level   1
     */
    it('deviceManagerTest_startConfigureWifi_0700', 0, async function (done) {
        console.log("----------start running deviceManagerTest_startConfigureWifi_0700----------");
        deviceManager.createDeviceManager('com.ohos.devicemangagerdemo', (err, data) => {
            if (err) {
                expect().assertFail();
            }
            setTimeout(function(){
                dmClass = data;
                dmStartConfigureWifi();
            },1000);
        });
        async function dmStartConfigureWifi(){
            var tv = 0x9C;
            let deviceInfo = {
                deviceId: "",
                deviceName: "",
                deviceType: tv
            }
            var token = dmClass.startConfigureWifi(deviceInfo);
            expect(token == undefined).assertTrue();
        }
        console.log("----------stop running deviceManagerTest_startConfigureWifi_0700----------");
        done();
    })

    /*
     * @tc.number  deviceManagerTest_startConfigureWifi_0800
     * @tc.name    Call startconfigurewifi interface，deviceInfo is null
     * @tc.desc    Function test
     * @tc.level   1
     */
    it('deviceManagerTest_startConfigureWifi_0800', 0, async function (done) {
        console.log("----------start running deviceManagerTest_startConfigureWifi_0800----------");
        deviceManager.createDeviceManager('com.ohos.devicemangagerdemo', (err, data) => {
            if (err) {
                expect().assertFail();
            }
            setTimeout(function(){
                dmClass = data;
                dmStartConfigureWifi();
            },1000);
        });
        async function dmStartConfigureWifi(){
            let deviceInfo = {}
            var token = dmClass.startConfigureWifi(deviceInfo);
            expect(token == undefined).assertTrue();
        }
        console.log("----------stop running deviceManagerTest_startConfigureWifi_0800----------");
        done();
    })

    /*
     * @tc.number  deviceManagerTest_configureWifiInfo_0100
     * @tc.name    Pass in the normal parameter WiFi info
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('deviceManagerTest_configureWifiInfo_0100', 0, async function (done) {
        console.log("----------start running deviceManagerTest_configureWifiInfo_0100----------");
        deviceManager.createDeviceManager('com.ohos.devicemangagerdemo', (err, data) => {
            if (err) {
                expect().assertFail();
            }
            setTimeout(function(){
                dmClass = data;
                dmConfigureWifiInfo();
            },1000);
        });
        async function dmConfigureWifiInfo(){
            var wifiInfo = {
                wifiSsid: 'wifi',
                wifiPassword: '12345678'
            }
            var result = dmClass.configureWifiInfo(wifiInfo, (err, data) => {
                if (err) {
                    expect().assertFail();
                }
            });
            expect(result == undefined).assertTrue();
        }
        console.log("----------stop running deviceManagerTest_configureWifiInfo_0100----------");
        done();
    })

    /*
     * @tc.number  deviceManagerTest_configureWifiInfo_0200
     * @tc.name    Pass in the exception parameter WiFi info，wifiPassword is null
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('deviceManagerTest_configureWifiInfo_0200', 0, async function (done) {
        console.log("----------start running deviceManagerTest_configureWifiInfo_0200----------");
        deviceManager.createDeviceManager('com.ohos.devicemangagerdemo', (err, data) => {
            if (err) {
                expect().assertFail();
            }
            setTimeout(function(){
                dmClass = data;
                dmConfigureWifiInfo();
            },1000);
        });
        async function dmConfigureWifiInfo(){
            var wifiInfo = {
                wifiSsid: 'wifi',
                wifiPassword: ''
            }
            var result = dmClass.configureWifiInfo(wifiInfo, (err, data) => {
                if (err) {
                    expect().assertFail();
                }
            });
            expect(result == undefined).assertTrue();
        }
        console.log("----------stop running deviceManagerTest_configureWifiInfo_0200----------");
        done();
    })

    /*
     * @tc.number  deviceManagerTest_configureWifiInfo_0300
     * @tc.name    Pass in the exception parameter WiFi info，wifiSsid is null
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('deviceManagerTest_configureWifiInfo_0300', 0, async function (done) {
        console.log("----------start running deviceManagerTest_configureWifiInfo_0300----------");
        deviceManager.createDeviceManager('com.ohos.devicemangagerdemo', (err, data) => {
            if (err) {
                expect().assertFail();
            }
            setTimeout(function(){
                dmClass = data;
                dmConfigureWifiInfo();
            },1000);
        });
        async function dmConfigureWifiInfo(){
            var wifiInfo = {
                wifiSsid: '',
                wifiPassword: '12345678'
            }
            var result = dmClass.configureWifiInfo(wifiInfo, (err, data) => {
                if (err) {
                    expect().assertFail();
                }
            });
            console.log('1111111111111111 ' + result)
            expect(result == undefined).assertTrue();
        }
        console.log("----------stop running deviceManagerTest_configureWifiInfo_0300----------");
        done();
    })

    /*
     * @tc.number  deviceManagerTest_configureWifiInfo_0400
     * @tc.name    Pass in the exception parameter WiFi info，wifiSsid and wifiPassword is null
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('deviceManagerTest_configureWifiInfo_0400', 0, async function (done) {
        console.log("----------start running deviceManagerTest_configureWifiInfo_0400----------");
        deviceManager.createDeviceManager('com.ohos.devicemangagerdemo', (err, data) => {
            if (err) {
                expect().assertFail();
            }
            setTimeout(function(){
                dmClass = data;
                dmConfigureWifiInfo();
            },1000);
        });
        async function dmConfigureWifiInfo(){
            var wifiInfo = {
                wifiSsid: '',
                wifiPassword: ''
            }
            var result = dmClass.configureWifiInfo(wifiInfo, (err, data) => {
                if (err) {
                    expect().assertFail();
                }
            });
            expect(result == undefined).assertTrue();
        }
        console.log("----------stop running deviceManagerTest_configureWifiInfo_0400----------");
        done();
    })

    /*
     * @tc.number  deviceManagerTest_deviceDiscoveredEnable_0100
     * @tc.name    Pass in normal parameters，IsEnable is false
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('deviceManagerTest_deviceDiscoveredEnable_0100', 0, async function (done) {
        console.log("----------start running deviceManagerTest_deviceDiscoveredEnable_0100----------");
        deviceManager.createDeviceManager('com.ohos.devicemangagerdemo', (err, data) => {
            if (err) {
                expect().assertFail();
            }
            setTimeout(function(){
                dmClass = data;
                dmDeviceDiscoveredEnable();
            },1000);
        });
        async function dmDeviceDiscoveredEnable(){
            var currentState = false;
            var discoverResult = dmClass.deviceDiscoveredEnable(currentState);
            expect(discoverResult == 0).assertTrue();
        }
        console.log("----------stop running deviceManagerTest_deviceDiscoveredEnable_0100----------");
        done();
    })

    /*
     * @tc.number  deviceManagerTest_deviceDiscoveredEnable_0200
     * @tc.name    Pass in normal parameters，IsEnable is true
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('deviceManagerTest_deviceDiscoveredEnable_0200', 0, async function (done) {
        console.log("----------start running deviceManagerTest_deviceDiscoveredEnable_0200----------");
        deviceManager.createDeviceManager('com.ohos.devicemangagerdemo', (err, data) => {
            if (err) {
                expect().assertFail();
            }
            setTimeout(function(){
                dmClass = data;
                dmDeviceDiscoveredEnable();
            },1000);
        });
        async function dmDeviceDiscoveredEnable(){
            var currentState = true;
            var discoverResult = dmClass.deviceDiscoveredEnable(currentState);
            expect(discoverResult == 0).assertTrue();
        }
        console.log("----------stop running deviceManagerTest_deviceDiscoveredEnable_0200----------");
        done();
    })
	
    /*
     * @tc.number  deviceManagerTest_deviceDiscoveredEnable_0200
     * @tc.name    Pass in normal parameters，IsEnable is string
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('deviceManagerTest_deviceDiscoveredEnable_0300', 0, async function (done) {
        console.log("----------start running deviceManagerTest_deviceDiscoveredEnable_0300----------");
        deviceManager.createDeviceManager('com.ohos.devicemangagerdemo', (err, data) => {
            if (err) {
                expect().assertFail();
            }
            setTimeout(function(){
                dmClass = data;
                dmDeviceDiscoveredEnable();
            },1000);
        });
        async function dmDeviceDiscoveredEnable(){
            try{
                var currentState = 'qwe';
                var discoverResult = dmClass.deviceDiscoveredEnable(currentState);
                expect(discoverResult != null).assertFail();
            }catch(e){
                console.log('error is :' + e);
                expect(e != null).assertTrue();
            }
        }
        console.log("----------stop running deviceManagerTest_deviceDiscoveredEnable_0300----------");
        done();
    })

    /*
     * @tc.number  deviceManagerTest_deviceDiscoveredEnable_0400
     * @tc.name    IsEnable is null
     * @tc.desc    Function test
     * @tc.level   1
     */
    it('deviceManagerTest_deviceDiscoveredEnable_0400', 0, async function (done) {
        console.log("----------start running deviceManagerTest_deviceDiscoveredEnable_0400----------");
        deviceManager.createDeviceManager('com.ohos.devicemangagerdemo', (err, data) => {
            if (err) {
                expect().assertFail();
            }
            setTimeout(function(){
                dmClass = data;
                dmDeviceDiscoveredEnable();
            },1000);
        });
        async function dmDeviceDiscoveredEnable(){
            try{
                var currentState = '';
                var discoverResult = dmClass.deviceDiscoveredEnable(currentState);
                expect(discoverResult != null).assertFail();
            }catch(e){
                console.log('error is :' + e);
                expect(e != null).assertTrue();
            }
        }
        console.log("----------stop running deviceManagerTest_deviceDiscoveredEnable_0400----------");
        done();
    })

    /*
     * @tc.number  deviceManagerTest_deviceMonitorEnable_0100
     * @tc.name    Pass in normal parameters，IsEnable is false
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('deviceManagerTest_deviceMonitorEnable_0100', 0, async function (done) {
        console.log("----------start running deviceManagerTest_deviceMonitorEnable_0100----------");
        deviceManager.createDeviceManager('com.ohos.devicemangagerdemo', (err, data) => {
            if (err) {
                expect().assertFail();
            }
            setTimeout(function(){
                dmClass = data;
                dmDeviceMonitorEnable();
            },1000);
        });
        async function dmDeviceMonitorEnable(){
            var currentState = false;
            var discoverResult = dmClass.deviceMonitorEnable(currentState);
            expect(discoverResult == 0).assertTrue();
        }
        console.log("----------stop running deviceManagerTest_deviceMonitorEnable_0100----------");
        done();
    })

    /*
     * @tc.number  deviceManagerTest_deviceMonitorEnable_0200
     * @tc.name    Pass in normal parameters，IsEnable is true
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('deviceManagerTest_deviceMonitorEnable_0200', 0, async function (done) {
        console.log("----------start running deviceManagerTest_deviceMonitorEnable_0200----------");
        deviceManager.createDeviceManager('com.ohos.devicemangagerdemo', (err, data) => {
            if (err) {
                expect().assertFail();
            }
            setTimeout(function(){
                dmClass = data;
                dmDeviceMonitorEnable();
            },1000);
        });
        async function dmDeviceMonitorEnable(){
            var currentState = true;
            var discoverResult = dmClass.deviceMonitorEnable(currentState);
            expect(discoverResult == 0).assertTrue();
        }
        console.log("----------stop running deviceManagerTest_deviceMonitorEnable_0200----------");
        done();
    })

    /*
     * @tc.number  deviceManagerTest_deviceMonitorEnable_0300
     * @tc.name    Pass in normal parameters，IsEnable is string
     * @tc.desc    Function test
     * @tc.level   1
     */
    it('deviceManagerTest_deviceMonitorEnable_0300', 0, async function (done) {
        console.log("----------start running deviceManagerTest_deviceMonitorEnable_0300----------");
        deviceManager.createDeviceManager('com.ohos.devicemangagerdemo', (err, data) => {
            if (err) {
                expect().assertFail();
            }
            setTimeout(function(){
                dmClass = data;
                dmDeviceMonitorEnable();
            },1000);
        });
        async function dmDeviceMonitorEnable(){
            try{
                var currentState = 'qwe';
                var discoverResult = dmClass.deviceMonitorEnable(currentState);
                expect(discoverResult != null).assertFail();
            }catch(e){
                console.log('error is :' + e);
                expect(e != null).assertTrue();
            }
        }
        console.log("----------stop running deviceManagerTest_deviceMonitorEnable_0300----------");
        done();
    })

    /*
     * @tc.number  deviceManagerTest_deviceMonitorEnable_0400
     * @tc.name    Pass in normal parameters，IsEnable is null
     * @tc.desc    Function test
     * @tc.level   1
     */
    it('deviceManagerTest_deviceMonitorEnable_0400', 0, async function (done) {
        console.log("----------start running deviceManagerTest_deviceMonitorEnable_0400----------");
        deviceManager.createDeviceManager('com.ohos.devicemangagerdemo', (err, data) => {
            if (err) {
                expect().assertFail();
            }
            setTimeout(function(){
                dmClass = data;
                dmDeviceMonitorEnable();
            },1000);
        });
        async function dmDeviceMonitorEnable(){
            try{
                var currentState = '';
                var discoverResult = dmClass.deviceMonitorEnable(currentState);
                expect(discoverResult != null).assertFail();
            }catch(e){
                console.log('error is :' + e);
                expect(e != null).assertTrue();
            }
        }
        console.log("----------stop running deviceManagerTest_deviceMonitorEnable_0400----------");
        done();
    })

    /*
     * @tc.number  deviceManagerTest_getLocalDeviceInfoSync_0100
     * @tc.name    call getLocalDeviceInfoSync interface
     * @tc.desc    Function test
     * @tc.level   1
     */
    it('deviceManagerTest_getLocalDeviceInfoSync_0100', 0, async function (done) {
        console.log("----------start running deviceManagerTest_getLocalDeviceInfoSync_0100----------");
        deviceManager.createDeviceManager('com.ohos.devicemangagerdemo', (err, data) => {
            if (err) {
                expect().assertFail();
            }
            setTimeout(function(){
                dmClass = data;
                dmGetLocalDeviceInfoSync();
            },1000);
        });
        async function dmGetLocalDeviceInfoSync(){
            var deviceInfo = dmClass.getLocalDeviceInfoSync();
            expect(deviceInfo.deviceId != null).assertTrue();
        }
        console.log("----------stop running deviceManagerTest_getLocalDeviceInfoSync_0100----------");
        done();
    })

    /*
     * @tc.number  deviceManagerTest_getLocalDeviceInfo1_0100
     * @tc.name    Call the getLocalDeviceInfo interface
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('deviceManagerTest_deviceManagerTest_getLocalDeviceInfo1_0100', 0, async function (done) {
        console.log("----------start running deviceManagerTest_deviceManagerTest_getLocalDeviceInfo1_0100----------");
        deviceManager.createDeviceManager('com.ohos.devicemangagerdemo', (err, data) => {
            if (err) {
                expect().assertFail();
            }
            setTimeout(function(){
                dmClass = data;
                getLocalDeviceInfo1();
            },1000);
        });
        async function getLocalDeviceInfo1(){
            var deviceInfo = dmClass.getLocalDeviceInfo((err, data) => {
                if (err) {
                    expect().assertFail();
                }
            });
            expect(deviceInfo == undefined).assertTrue();
        }
        console.log("----------stop running deviceManagerTest_deviceManagerTest_getLocalDeviceInfo1_0100----------");
        done();
    })

    /*
     * @tc.number  deviceManagerTest_getLocalDeviceInfo(promise)_0100
     * @tc.name    Call the getLocalDeviceInfo interface
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('deviceManagerTest_getLocalDeviceInfo(promise)_0100', 0, async function (done) {
        console.log("----------start running deviceManagerTest_getLocalDeviceInfo(promise)_0100----------");
        deviceManager.createDeviceManager('com.ohos.devicemangagerdemo', (err, data) => {
            if (err) {
                expect().assertFail();
            }
            setTimeout(function(){
                dmClass = data;
                getLocalDeviceInfo2();
            },1000);
        });
        async function getLocalDeviceInfo2(){
            var deviceInfo = dmClass.getLocalDeviceInfo().then(data => {
//                console.log('data is :' + data)
            })
//            console.log('promise is : ' + JSON.stringify(deviceInfo))
            expect(deviceInfo != null).assertTrue();
        }
        console.log("----------stop running deviceManagerTest_getLocalDeviceInfo(promise)_0100----------");
        done();
    })

    /*
     * @tc.number  deviceManagerTest_removeTrustedDevice_0100
     * @tc.name    Call the removeTrustedDevice interface,deviceType is UNKNOWN_TYPE
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('deviceManagerTest_removeTrustedDevice_0100', 0, async function(done){
        console.log("----------start running deviceManagerTest_removeTrustedDevice_0100----------");
        deviceManager.createDeviceManager('com.ohos.devicemanagerdemo',(err,data) =>{
            if(err){
                expect().assertFail();
            }
            setTimeout(function(){
                dmClass = data;
                dmRemoveTrustedDevice();
            },1000);
        })
        async function dmRemoveTrustedDevice(){
            var unknownType = 0;
            let deviceInfo = {
                deviceId: "",
                deviceName: "",
                deviceType: unknownType
            }
            var info = dmClass.removeTrustedDevice(deviceInfo);
            expect(info == 0).assertTrue();
        }
        console.log("----------stop running deviceManagerTest_removeTrustedDevice_0100----------");
        done();
    })

    /*
     * @tc.number  deviceManagerTest_removeTrustedDevice_0200
     * @tc.name    Call the removeTrustedDevice interface,deviceType is SPEAKER
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('deviceManagerTest_removeTrustedDevice_0200', 0, async function(done){
        console.log("----------start running deviceManagerTest_removeTrustedDevice_0200----------");
        deviceManager.createDeviceManager('com.ohos.devicemanagerdemo',(err,data) =>{
            if(err){
                expect().assertFail();
            }
            setTimeout(function(){
                dmClass = data;
                dmRemoveTrustedDevice();
            },1000);
        })
        async function dmRemoveTrustedDevice(){
            var speaker = 0x0A;
            let deviceInfo = {
                deviceId: "",
                deviceName: "",
                deviceType: speaker
            }
            var info = dmClass.removeTrustedDevice(deviceInfo);
            expect(info == 0).assertTrue();
        }
        console.log("----------stop running deviceManagerTest_removeTrustedDevice_0200----------");
        done();
    })

    /*
     * @tc.number  deviceManagerTest_removeTrustedDevice_0300
     * @tc.name    Call the removeTrustedDevice interface,deviceType is PHONE
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('deviceManagerTest_removeTrustedDevice_0300', 0, async function(done){
        console.log("----------start running deviceManagerTest_removeTrustedDevice_0300----------");
        deviceManager.createDeviceManager('com.ohos.devicemanagerdemo',(err,data) =>{
            if(err){
                expect().assertFail();
            }
            setTimeout(function(){
                dmClass = data;
                dmRemoveTrustedDevice();
            },1000);
        })
        async function dmRemoveTrustedDevice(){
            var phone = 0x0E;
            let deviceInfo = {
                deviceId: "",
                deviceName: "",
                deviceType: phone
            }
            var info = dmClass.removeTrustedDevice(deviceInfo);
            expect(info == 0).assertTrue();
        }
        console.log("----------stop running deviceManagerTest_removeTrustedDevice_0300----------");
        done();
    })

    /*
     * @tc.number  deviceManagerTest_removeTrustedDevice_0400
     * @tc.name    Call the removeTrustedDevice interface,deviceType is TABLET
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('deviceManagerTest_removeTrustedDevice_0400', 0, async function(done){
        console.log("----------start running deviceManagerTest_removeTrustedDevice_0400----------");
        deviceManager.createDeviceManager('com.ohos.devicemanagerdemo',(err,data) =>{
            if(err){
                expect().assertFail();
            }
            setTimeout(function(){
                dmClass = data;
                dmRemoveTrustedDevice();
            },1000);
        });
        async function dmRemoveTrustedDevice(){
            var tablet = 0x11;
            let deviceInfo = {
                deviceId: "",
                deviceName: "",
                deviceType: tablet
            }
            var info = dmClass.removeTrustedDevice(deviceInfo);
            expect(info == 0).assertTrue();
        }
        console.log("----------stop running deviceManagerTest_removeTrustedDevice_0400----------");
        done();
    })

    /*
     * @tc.number  deviceManagerTest_removeTrustedDevice_0500
     * @tc.name    Call the removeTrustedDevice interface,deviceType is WEARABLE
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('deviceManagerTest_removeTrustedDevice_0500', 0, async function(done){
        console.log("----------start running deviceManagerTest_removeTrustedDevice_0500----------");
        deviceManager.createDeviceManager('com.ohos.devicemanagerdemo',(err,data) =>{
            if(err){
                expect().assertFail();
            }
            setTimeout(function(){
                dmClass = data;
                dmRemoveTrustedDevice();
            },1000);
        })
        async function dmRemoveTrustedDevice(){
            var wearable = 0x6D;
            let deviceInfo = {
                deviceId: "",
                deviceName: "",
                deviceType: wearable
            }
            var info = dmClass.removeTrustedDevice(deviceInfo);
            expect(info == 0).assertTrue();
        }
        console.log("----------stop running deviceManagerTest_removeTrustedDevice_0500----------");
        done();
    })

    /*
     * @tc.number  deviceManagerTest_removeTrustedDevice_0600
     * @tc.name    Call the removeTrustedDevice interface,deviceType is CAR
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('deviceManagerTest_removeTrustedDevice_0600', 0, async function(done){
        console.log("----------start running deviceManagerTest_removeTrustedDevice_0600----------");
        deviceManager.createDeviceManager('com.ohos.devicemanagerdemo',(err,data) =>{
            if(err){
                expect().assertFail();
            }
            setTimeout(function(){
                dmClass = data;
                dmRemoveTrustedDevice();
            },1000);
        })
        async function dmRemoveTrustedDevice(){
            var car = 0x83;
            let deviceInfo = {
                deviceId: "",
                deviceName: "",
                deviceType: car
            }
            var info = dmClass.removeTrustedDevice(deviceInfo);
            expect(info == 0).assertTrue();
        }
        console.log("----------stop running deviceManagerTest_removeTrustedDevice_0600----------");
        done();
    })

    /*
     * @tc.number  deviceManagerTest_removeTrustedDevice_0700
     * @tc.name    Call the removeTrustedDevice interface,deviceType is TV
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('deviceManagerTest_removeTrustedDevice_0700', 0, async function(done){
        console.log("----------start running deviceManagerTest_removeTrustedDevice_0700----------");
        deviceManager.createDeviceManager('com.ohos.devicemanagerdemo',(err,data) =>{
            if(err){
                expect().assertFail();
            }
            setTimeout(function(){
                dmClass = data;
                dmRemoveTrustedDevice();
            },1000);
        })
        async function dmRemoveTrustedDevice(){
            var tv = 0x9C;
            let deviceInfo = {
                deviceId: "",
                deviceName: "",
                deviceType: tv
            }
            var info = dmClass.removeTrustedDevice(deviceInfo);
            expect(info == 0).assertTrue();
        }
        console.log("----------stop running deviceManagerTest_removeTrustedDevice_0700----------");
        done();
    })

    /*
     * @tc.number  deviceManagerTest_removeTrustedDevice_0800
     * @tc.name    Call the removeTrustedDevice interface,deviceType is null
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('deviceManagerTest_removeTrustedDevice_0800', 0, async function(done){
        console.log("----------start running deviceManagerTest_removeTrustedDevice_0800----------");
        deviceManager.createDeviceManager('com.ohos.devicemanagerdemo',(err,data) =>{
            if(err){
                expect().assertFail();
            }
            setTimeout(function(){
                dmClass = data;
                dmRemoveTrustedDevice();
            },1000);
        })
        async function dmRemoveTrustedDevice(){
            let deviceInfo = {
                deviceId: "",
                deviceName: "",
                deviceType: ""
            }
            var info = dmClass.removeTrustedDevice(deviceInfo);
            expect(info == 0).assertTrue();
        }
        console.log("----------stop running deviceManagerTest_removeTrustedDevice_0800----------");
        done();
    })

    /*
     * @tc.number  deviceManagerTest_removeTrustedDevice_0900
     * @tc.name    Call the removeTrustedDevice interface,deviceType is null
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('deviceManagerTest_removeTrustedDevice_0900', 0, async function(done){
        console.log("----------start running deviceManagerTest_removeTrustedDevice_0900----------");
        deviceManager.createDeviceManager('com.ohos.devicemanagerdemo',(err,data) =>{
            if(err){
                expect().assertFail();
            }
            setTimeout(function(){
                dmClass = data;
                dmRemoveTrustedDevice();
            },1000);
        })
        async function dmRemoveTrustedDevice(){
            try{
                var info = dmClass.removeTrustedDevice('');
                expect(info == 0).assertFail();
            }catch(e){
                console.log('error is :' + e)
                expect(e != null).assertTrue();
            }
        }
        console.log("----------stop running deviceManagerTest_removeTrustedDevice_0900----------");
        done();
    })

    /*
     * @tc.number  deviceManagerTest_on-dmFaCallback_0100
     * @tc.name    Call the on interface to pass in dmfacallback
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('deviceManagerTest_on-dmFaCallback_0100', 0, async function (done) {
        console.log("----------start running deviceManagerTest_on-dmFaCallback_0100----------");
        deviceManager.createDeviceManager('com.ohos.devicemangagerdemo', (err, data) => {
            if (err) {
                expect().assertFail();
            }
            setTimeout(function(){
                dmClass = data;
                dmFaCallback();
            },1000);
        });
        async function dmFaCallback(){
            var result = dmClass.on('dmFaCallback', () => {});
            expect(result == undefined).assertTrue();
        }
        console.log("----------stop running deviceManagerTest_on-dmFaCallback_0100----------");
        done();
    })

    /*
     * @tc.number  deviceManagerTest_on-dmFaCallback_0200
     * @tc.name    Call the on interface to pass in a null value
     * @tc.desc    Function test
     * @tc.level   1
     */
    it('deviceManagerTest_on-dmFaCallback_0200', 0, async function (done) {
        console.log("----------start running deviceManagerTest_on-dmFaCallback_0200----------");
        deviceManager.createDeviceManager('com.ohos.devicemangagerdemo', (err, data) => {
            if (err) {
                expect().assertFail();
            }
            setTimeout(function(){
                dmClass = data;
                dmFaCallback();
            },1000);
        });
        async function dmFaCallback(){
            try{
                var result = dmClass.on('', () => {});
                expect(result == undefined).assertFail();
            }catch(e){
                console.log('error is ：' + e);
                expect(e != null).assertTrue();
            }
        }
        console.log("----------stop running deviceManagerTest_on-dmFaCallback_0200----------");
        done();
    })

    /*
     * @tc.number  deviceManagerTest_off-dmFaCallback_0100
     * @tc.name    Call the off interface to pass in dmfacallback
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('deviceManagerTest_off-dmFaCallback_0100', 0, async function (done) {
        console.log("----------start running deviceManagerTest_off-dmFaCallback_0100----------");
        deviceManager.createDeviceManager('com.ohos.devicemangagerdemo', (err, data) => {
            if (err) {
                expect().assertFail();
            }
            setTimeout(function(){
                dmClass = data;
                dmFaCallback();
            },1000);
        });
        async function dmFaCallback(){
            var result = dmClass.off('dmFaCallback', () => {});
            expect(result == undefined).assertFail();
        }
        console.log("----------stop running deviceManagerTest_off-dmFaCallback_0100----------");
        done();
    })

    /*
     * @tc.number  deviceManagerTest_off-dmFaCallback_0200
     * @tc.name    Call the on interface to pass in a null value
     * @tc.desc    Function test
     * @tc.level   1
     */
    it('deviceManagerTest_off-dmFaCallback_0200', 0, async function (done) {
        console.log("----------start running deviceManagerTest_off-dmFaCallback_0200----------");
        deviceManager.createDeviceManager('com.ohos.devicemangagerdemo', (err, data) => {
            if (err) {
                expect().assertFail();
            }
            setTimeout(function(){
                dmClass = data;
                dmFaCallback();
            },1000);
        });
        async function dmFaCallback(){
            try{
                var result = dmClass.off('', () => {});
                expect(result == undefined).assertFail();
            }catch(e){
                console.log('error is ：' + e);
                expect(e != null).assertTrue();
            }
        }
        console.log("----------stop running deviceManagerTest_off-dmFaCallback_0200----------");
        done();
    })

    /*
     * @tc.number  deviceManagerTest_on-deviceStateChange_0100
     * @tc.name    Call the on interface to pass in devicestatechange
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('deviceManagerTest_on-deviceStateChange_0100', 0, async function (done) {
        console.log("----------start running deviceManagerTest_on-deviceStateChange_0100----------");
        deviceManager.createDeviceManager('com.ohos.devicemangagerdemo', (err, data) => {
            if (err) {
                expect().assertFail();
            }
            setTimeout(function(){
                dmClass = data;
                dmDeviceStateChange();
            },1000);
        });
        async function dmDeviceStateChange(){
            var result = dmClass.on('deviceStateChange', () => {});
            expect(result == undefined).assertTrue();
        }
        console.log("----------stop running deviceManagerTest_on-deviceStateChange_0100----------");
        done();
    })

    /*
     * @tc.number  deviceManagerTest_on-deviceStateChange_0200
     * @tc.name    Call the on interface to pass in number
     * @tc.desc    Function test
     * @tc.level   1
     */
    it('deviceManagerTest_on-deviceStateChange_0200', 0, async function (done) {
        console.log("----------start running deviceManagerTest_on-deviceStateChange_0200----------");
        deviceManager.createDeviceManager('com.ohos.devicemangagerdemo', (err, data) => {
            if (err) {
                expect().assertFail();
            }
            setTimeout(function(){
                dmClass = data;
                dmDeviceStateChange();
            },1000);
        });
        async function dmDeviceStateChange(){
            var result = dmClass.on('123456', () => {});
            expect(result == undefined).assertTrue();
        }
        console.log("----------stop running deviceManagerTest_on-deviceStateChange_0200----------");
        done();
    })

    /*
     * @tc.number  deviceManagerTest_off-deviceStateChange_0100
     * @tc.name    Call the off interface to pass in devicestatechange
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('deviceManagerTest_off-deviceStateChange_0100', 0, async function (done) {
        console.log("----------start running deviceManagerTest_off-deviceStateChange_0100----------");
        deviceManager.createDeviceManager('com.ohos.devicemangagerdemo', (err, data) => {
            if (err) {
                expect().assertFail();
            }
            setTimeout(function(){
                dmClass = data;
                dmDeviceStateChange();
            },1000);
        });
        async function dmDeviceStateChange(){
            var result = dmClass.off('deviceStateChange', () => {});
            expect(result == undefined).assertTrue();
        }
        console.log("----------stop running deviceManagerTest_off-deviceStateChange_0100----------");
        done();
    })

    /*
     * @tc.number  deviceManagerTest_off-deviceStateChange_0200
     * @tc.name    Call the off interface to pass in Special symbols
     * @tc.desc    Function test
     * @tc.level   1
     */
    it('deviceManagerTest_off-deviceStateChange_0200', 0, async function (done) {
        console.log("----------start running deviceManagerTest_off-deviceStateChange_0200----------");
        deviceManager.createDeviceManager('com.ohos.devicemangagerdemo', (err, data) => {
            if (err) {
                expect().assertFail();
            }
            setTimeout(function(){
                dmClass = data;
                dmDeviceStateChange();
            },1000);
        });
        async function dmDeviceStateChange(){
            var result = dmClass.off('#$%^&', () => {});
            expect(result == undefined).assertTrue();
        }
        console.log("----------stop running deviceManagerTest_off-deviceStateChange_0200----------");
        done();
    })


    /*
     * @tc.number  deviceManagerTest_on-deviceFound_0100
     * @tc.name    Call the on interface to pass in devicefound
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('deviceManagerTest_on-deviceFound_0100', 0, async function (done) {
        console.log("----------start running deviceManagerTest_on-deviceFound_0100----------");
        deviceManager.createDeviceManager('com.ohos.devicemangagerdemo', (err, data) => {
            if (err) {
                expect().assertFail();
            }
            setTimeout(function(){
                dmClass = data;
                dmDeviceFound();
            },1000);
        });
        async function dmDeviceFound(){
            var result = dmClass.on('deviceFound', () => {});
            expect(result == undefined).assertTrue();
        }
        console.log("----------stop running deviceManagerTest_on-deviceFound_0100----------");
        done();
    })

    /*
     * @tc.number  deviceManagerTest_on-deviceFound_0200
     * @tc.name    Call the on interface to pass in Incorrect parameters
     * @tc.desc    Function test
     * @tc.level   1
     */
    it('deviceManagerTest_on-deviceFound_0200', 0, async function (done) {
        console.log("----------start running deviceManagerTest_on-deviceFound_0200----------");
        deviceManager.createDeviceManager('com.ohos.devicemangagerdemo', (err, data) => {
            if (err) {
                expect().assertFail();
            }
            setTimeout(function(){
                dmClass = data;
                dmDeviceFound();
            },1000);
        });
        async function dmDeviceFound(){
            var result = dmClass.on('device11', () => {});
            expect(result == undefined).assertTrue();
        }
        console.log("----------stop running deviceManagerTest_on-deviceFound_0200----------");
        done();
    })

    /*
     * @tc.number  deviceManagerTest_off-deviceFound_0100
     * @tc.name    Call the off interface to pass in devicefound
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('deviceManagerTest_off-deviceFound_0100', 0, async function (done) {
        console.log("----------start running deviceManagerTest_off-deviceFound_0100----------");
        deviceManager.createDeviceManager('com.ohos.devicemangagerdemo', (err, data) => {
            if (err) {
                expect().assertFail();
            }
            setTimeout(function(){
                dmClass = data;
                dmDeviceFound();
            },1000);
        });
        async function dmDeviceFound(){
            var result = dmClass.off('deviceFound', () => {});
            expect(result == undefined).assertTrue();
        }
        console.log("----------stop running deviceManagerTest_off-deviceFound_0100----------");
        done();
    })

    /*
     * @tc.number  deviceManagerTest_on-discoverFail_0100
     * @tc.name    Call the on interface to pass in discoverfail
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('deviceManagerTest_on-discoverFail_0100', 0, async function (done) {
        console.log("----------start running deviceManagerTest_on-discoverFail_0100----------");
        deviceManager.createDeviceManager('com.ohos.devicemangagerdemo', (err, data) => {
            if (err) {
                expect().assertFail();
            }
            setTimeout(function(){
                dmClass = data;
                dmDiscoverFail();
            },1000);
        });
        async function dmDiscoverFail(){
            var result = dmClass.on('discoverFail', () => {});
            expect(result == undefined).assertTrue();
        }
        console.log("----------stop running deviceManagerTest_on-discoverFail_0100----------");
        done();
    })

    /*
     * @tc.number  deviceManagerTest_off-discoverFail_0100
     * @tc.name    Call the off interface to pass in discoverfail
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('deviceManagerTest_off-discoverFail_0100', 0, async function (done) {
        console.log("----------start running deviceManagerTest_off-discoverFail_0100----------");
        deviceManager.createDeviceManager('com.ohos.devicemangagerdemo', (err, data) => {
            if (err) {
                expect().assertFail();
            }
            setTimeout(function(){
                dmClass = data;
                dmDiscoverFail();
            },1000);
        });
        async function dmDiscoverFail(){
            var result = dmClass.off('discoverFail', () => {});
            expect(result == undefined).assertTrue();
        }
        console.log("----------stop running deviceManagerTest_off-discoverFail_0100----------");
        done();
    })

    /*
     * @tc.number  deviceManagerTest_on-serviceDie_0100
     * @tc.name    Call the on interface to pass in servicedie
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('deviceManagerTest_on-serviceDie_0100', 0, async function (done) {
        console.log("----------start running deviceManagerTest_on-serviceDie_0100----------");
        deviceManager.createDeviceManager('com.ohos.devicemangagerdemo', (err, data) => {
            if (err) {
                expect().assertFail();
            }
            setTimeout(function(){
                dmClass = data;
                dmServiceDie();
            },1000);
        });
        async function dmServiceDie(){
            var result = dmClass.on('serviceDie', () => {});
            expect(result == undefined).assertTrue();
        }
        console.log("----------start running deviceManagerTest_on-serviceDie_0100----------");
        done();
    })

    /*
     * @tc.number  deviceManagerTest_off-serviceDie_0100
     * @tc.name    Call the off interface to pass in servicedie
     * @tc.desc    Function test
     * @tc.level   0
     */
    it('deviceManagerTest_off-serviceDie_0100', 0, async function (done) {
        console.log("----------start running deviceManagerTest_off-serviceDie_0100----------");
        deviceManager.createDeviceManager('com.ohos.devicemangagerdemo', (err, data) => {
            if (err) {
                expect().assertFail();
            }
            setTimeout(function(){
                dmClass = data;
                dmServiceDie();
            },1000);
        });
        async function dmServiceDie(){
            var result = dmClass.off('serviceDie', () => {});
            expect(result == undefined).assertTrue();
        }
        console.log("----------stop running deviceManagerTest_off-serviceDie_0100----------");
        done();
    })

})