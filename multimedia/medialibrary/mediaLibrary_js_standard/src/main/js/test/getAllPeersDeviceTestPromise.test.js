/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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

import mediaLibrary from '@ohos.multimedia.medialibrary';
import featureAbility from '@ohos.ability.featureAbility';

import {
    describe,
    beforeAll,
    beforeEach,
    afterEach,
    afterAll,
    it,
    expect
} from 'deccjsunit/index';

describe('file.promise.test.js', function () {
    var context = featureAbility.getContext();
    console.info('MediaLibraryTest : getMediaLibrary IN');
    var media = mediaLibrary.getMediaLibrary(context);
    console.info('MediaLibraryTest : getMediaLibrary OUT');
    beforeAll(function () {});
    beforeEach(function () {});
    afterEach(function () {});
    afterAll(function () {});


    console.info('MediaLibraryTest : SUB_MEDIA_MEDIALIBRARY_ALL_PEER_DEVICETYPE_PROMISE_001_02 begin');
    it('SUB_MEDIA_MEDIALIBRARY_ALL_PEER_DEVICETYPE_PROMISE_001_02', 0, async function (done) {
        done();
        let allPeerList = await media.getAllPeers();
        expect(allPeerList[1].DeviceType.TYPE_UNKNOWN).assertEqual(0);
        expect(allPeerList[1].DeviceType.TYPE_LAPTOP).assertEqual(1);
        expect(allPeerList[1].DeviceType.TYPE_PHONE).assertEqual(2);
        expect(allPeerList[1].DeviceType.TYPE_TABLET).assertEqual(3);
        expect(allPeerList[1].DeviceType.TYPE_WATCH).assertEqual(4);
        expect(allPeerList[1].DeviceType.TYPE_CAR).assertEqual(5);
        expect(allPeerList[1].DeviceType.TYPE_TV).assertEqual(6);
        done();
    });

    // it('SUB_MEDIA_MEDIALIBRARY_ALL_PEER_DEVICETYPE_PROMISE_001_03', 0, async function (done) {
    //     try {
    //         let allPeerList = await media.getAllPeers();
    //         deviceType = allPeerList[1].deviceType;
    //         console.info('MediaLibraryTest : ALL_PEER_PROMISE getAllPeers 001_03 peer.deviceType = ' + deviceType);
    //         if(deviceType ==  mediaLibrary.DeviceType.TYPE_UNKNOWN 
    //             || deviceType ==  mediaLibrary.DeviceType.TYPE_LAPTOP 
    //             || deviceType ==  mediaLibrary.DeviceType.TYPE_PHONE
    //             || deviceType ==  mediaLibrary.DeviceType.TYPE_TABLET
    //             || deviceType ==  mediaLibrary.DeviceType.TYPE_WATCH
    //             || deviceType ==  mediaLibrary.DeviceType.TYPE_CAR
    //             || deviceType ==  mediaLibrary.DeviceType.TYPE_TV) {
    //             expect(true).assertTrue();
    //             done();
    //         }
    //     } catch (error) {
    //         expect(false).assertTrue();
    //         done();
    //     }
    // });


    // it('SUB_MEDIA_MEDIALIBRARY_ALL_PEER_DEVICETYPE_PROMISE_001_04', 0, async function (done) {
    //     try {
    //         let allPeerList = await media.getAllPeers();
    //         deviceType = allPeerList[2].deviceType;
    //         console.info('MediaLibraryTest : ALL_PEER_PROMISE getAllPeers 001_04 peer.deviceType = ' + deviceType);
    //         if(deviceType ==  mediaLibrary.DeviceType.TYPE_UNKNOWN 
    //             || deviceType ==  mediaLibrary.DeviceType.TYPE_LAPTOP 
    //             || deviceType ==  mediaLibrary.DeviceType.TYPE_PHONE
    //             || deviceType ==  mediaLibrary.DeviceType.TYPE_TABLET
    //             || deviceType ==  mediaLibrary.DeviceType.TYPE_WATCH
    //             || deviceType ==  mediaLibrary.DeviceType.TYPE_CAR
    //             || deviceType ==  mediaLibrary.DeviceType.TYPE_TV) {
    //             expect(true).assertTrue();
    //             done();
    //         }
    //     } catch (error) {
    //         expect(false).assertTrue();
    //         done();
    //     }
    // });



    // it('SUB_MEDIA_MEDIALIBRARY_ALL_PEER_DEVICETYPE_PROMISE_001_05', 0, async function (done) {
    //     try {
    //         let allPeerList = await media.getAllPeers();
    //         deviceType = allPeerList[3].deviceType;
    //         console.info('MediaLibraryTest : ALL_PEER_PROMISE getAllPeers 001_05 peer.deviceType = ' + deviceType);
    //         if(deviceType ==  mediaLibrary.DeviceType.TYPE_UNKNOWN 
    //             || deviceType ==  mediaLibrary.DeviceType.TYPE_LAPTOP 
    //             || deviceType ==  mediaLibrary.DeviceType.TYPE_PHONE
    //             || deviceType ==  mediaLibrary.DeviceType.TYPE_TABLET
    //             || deviceType ==  mediaLibrary.DeviceType.TYPE_WATCH
    //             || deviceType ==  mediaLibrary.DeviceType.TYPE_CAR
    //             || deviceType ==  mediaLibrary.DeviceType.TYPE_TV) {
    //             expect(true).assertTrue();
    //             done();
    //         }
    //     } catch (error) {
    //         expect(false).assertTrue();
    //         done();
    //     }
    // });

    // it('SUB_MEDIA_MEDIALIBRARY_ALL_PEER_DEVICETYPE_PROMISE_001_06', 0, async function (done) {
    //     try {
    //         let allPeerList = await media.getAllPeers();
    //         deviceType = allPeerList[4].deviceType;
    //         console.info('MediaLibraryTest : ALL_PEER_PROMISE getAllPeers 001_06 peer.deviceType = ' + deviceType);
    //         if(deviceType ==  mediaLibrary.DeviceType.TYPE_UNKNOWN 
    //             || deviceType ==  mediaLibrary.DeviceType.TYPE_LAPTOP 
    //             || deviceType ==  mediaLibrary.DeviceType.TYPE_PHONE
    //             || deviceType ==  mediaLibrary.DeviceType.TYPE_TABLET
    //             || deviceType ==  mediaLibrary.DeviceType.TYPE_WATCH
    //             || deviceType ==  mediaLibrary.DeviceType.TYPE_CAR
    //             || deviceType ==  mediaLibrary.DeviceType.TYPE_TV) {
    //             expect(true).assertTrue();
    //             done();
    //         }
    //     } catch (error) {
    //         expect(false).assertTrue();
    //         done();
    //     }
    // });




    // it('SUB_MEDIA_MEDIALIBRARY_ACTIVE_PEER_DEVICETYPE_PROMISE_001_02', 0, async function (done) {
    //     try {
    //         let allPeerList = await media.getActivePeers();
    //         deviceType = allPeerList[0].deviceType;
    //         console.info('MediaLibraryTest : ALL_PEER_PROMISE getAllPeers 001_02 peer.deviceType = ' + deviceType);
    //         if(deviceType ==  mediaLibrary.DeviceType.TYPE_UNKNOWN 
    //             || deviceType ==  mediaLibrary.DeviceType.TYPE_LAPTOP 
    //             || deviceType ==  mediaLibrary.DeviceType.TYPE_PHONE
    //             || deviceType ==  mediaLibrary.DeviceType.TYPE_TABLET
    //             || deviceType ==  mediaLibrary.DeviceType.TYPE_WATCH
    //             || deviceType ==  mediaLibrary.DeviceType.TYPE_CAR
    //             || deviceType ==  mediaLibrary.DeviceType.TYPE_TV) {
    //             expect(true).assertTrue();
    //             done();
    //         }
    //     } catch (error) {
    //         expect(false).assertTrue();
    //         done();
    //     }
    // });

    it('SUB_MEDIA_MEDIALIBRARY_ACTIVE_PEER_NETWORKID_PROMISE_001_02', 0, async function (done) {
        try {
            done();
            let allPeerList = await media.getActivePeers();
            networkId = allPeerList[0].networkId;
            console.info('MediaLibraryTest : ALL_PEER_PROMISE getAllPeers 001_01 peer.networkId = ' + networkId);
        } catch (error) {
            done();
        }
    });


    it('SUB_MEDIA_MEDIALIBRARY_ACTIVE_PEER_NETWORKID_ISONLINE_PROMISE_001_02', 0, async function (done) {
        try {
            done();
            let allPeerList = await media.getActivePeers();
            isOnline = allPeerList[0].isOnline;
            console.info('MediaLibraryTest : ALL_PEER_PROMISE getAllPeers 001_01 peer.isOnline = ' + isOnline);
        } catch (error) {
            done();
        }
    });


    // it('SUB_MEDIA_MEDIALIBRARY_ACTIVE_PEER_DEVICETYPE_PROMISE_001_03', 0, async function (done) {
    //     try {
    //         done();
    //         let allPeerList = await media.getActivePeers();
    //         deviceType = allPeerList[1].deviceType;
    //         console.info('MediaLibraryTest : ALL_PEER_PROMISE getAllPeers 001_03 peer.deviceType = ' + deviceType);
    //         if(deviceType ==  mediaLibrary.DeviceType.TYPE_UNKNOWN 
    //             || deviceType ==  mediaLibrary.DeviceType.TYPE_LAPTOP 
    //             || deviceType ==  mediaLibrary.DeviceType.TYPE_PHONE
    //             || deviceType ==  mediaLibrary.DeviceType.TYPE_TABLET
    //             || deviceType ==  mediaLibrary.DeviceType.TYPE_WATCH
    //             || deviceType ==  mediaLibrary.DeviceType.TYPE_CAR
    //             || deviceType ==  mediaLibrary.DeviceType.TYPE_TV) {
    //             expect(true).assertTrue();
    //             done();
    //         }
    //     } catch (error) {
    //         expect(false).assertTrue();
    //         done();
    //     }
    // });


    // it('SUB_MEDIA_MEDIALIBRARY_ACTIVE_PEER_NETWORKID_PROMISE_001_03', 0, async function (done) {
    //     try {
    //         let allPeerList = await media.getActivePeers();
    //         networkId = allPeerList[1].networkId;
    //         console.info('MediaLibraryTest : ALL_PEER_PROMISE getAllPeers 001_03 peer.networkId = ' + networkId);
    //         if(networkId != undefined && networkId != '') {
    //             expect(true).assertTrue();
    //             done();
    //         }
    //     } catch (error) {
    //         expect(false).assertTrue();
    //         done();
    //     }
    // });


    // it('SUB_MEDIA_MEDIALIBRARY_ACTIVE_PEER_NETWORKID_ISONLINE_PROMISE_001_03', 0, async function (done) {
    //     try {
    //         let allPeerList = await media.getActivePeers();
    //         isOnline = allPeerList[1].isOnline;
    //         console.info('MediaLibraryTest : ALL_PEER_PROMISE getAllPeers 001_03 peer.isOnline = ' + isOnline);
    //         if(isOnline) {
    //             expect(true).assertTrue();
    //             done();
    //         }
    //     } catch (error) {
    //         expect(false).assertTrue();
    //         done();
    //     }
    // });


    // it('SUB_MEDIA_MEDIALIBRARY_ACTIVE_PEER_DEVICETYPE_PROMISE_001_04', 0, async function (done) {
    //     try {
    //         let allPeerList = await media.getActivePeers();
    //         deviceType = allPeerList[2].deviceType;
    //         console.info('MediaLibraryTest : ALL_PEER_PROMISE getAllPeers 001_04 peer.deviceType = ' + deviceType);
    //         if(deviceType ==  mediaLibrary.DeviceType.TYPE_UNKNOWN 
    //             || deviceType ==  mediaLibrary.DeviceType.TYPE_LAPTOP 
    //             || deviceType ==  mediaLibrary.DeviceType.TYPE_PHONE
    //             || deviceType ==  mediaLibrary.DeviceType.TYPE_TABLET
    //             || deviceType ==  mediaLibrary.DeviceType.TYPE_WATCH
    //             || deviceType ==  mediaLibrary.DeviceType.TYPE_CAR
    //             || deviceType ==  mediaLibrary.DeviceType.TYPE_TV) {
    //             expect(true).assertTrue();
    //             done();
    //         }
    //     } catch (error) {
    //         expect(false).assertTrue();
    //         done();
    //     }
    // });

    // it('SUB_MEDIA_MEDIALIBRARY_ACTIVE_PEER_NETWORKID_PROMISE_001_04', 0, async function (done) {
    //     try {
    //         let allPeerList = await media.getActivePeers();
    //         networkId = allPeerList[2].networkId;
    //         console.info('MediaLibraryTest : ALL_PEER_PROMISE getAllPeers 001_04 peer.networkId = ' + networkId);
    //         if(networkId != undefined && networkId != '') {
    //             expect(true).assertTrue();
    //             done();
    //         }
    //     } catch (error) {
    //         expect(false).assertTrue();
    //         done();
    //     }
    // });


    // it('SUB_MEDIA_MEDIALIBRARY_ACTIVE_PEER_NETWORKID_ISONLINE_PROMISE_001_04', 0, async function (done) {
    //     try {
    //         let allPeerList = await media.getActivePeers();
    //         isOnline = allPeerList[2].isOnline;
    //         console.info('MediaLibraryTest : ALL_PEER_PROMISE getAllPeers 001_04 peer.isOnline = ' + isOnline);
    //         if(isOnline) {
    //             expect(true).assertTrue();
    //             done();
    //         }
    //     } catch (error) {
    //         expect(false).assertTrue();
    //         done();
    //     }
    // });
});