// @ts-nocheck
/**
 * Copyright (c) 2023 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import photoAccessHelper from '@ohos.file.photoAccessHelper';
import dataSharePredicates from '@ohos.data.dataSharePredicates';
import buffer from '@ohos.buffer';
import fs from '@ohos.file.fs';
import { BusinessError } from '@ohos.base';
import { getPermission, photoKeys } from '../../../../../../../common'
import { checkSet,checkUri,columns,photoExtensions,videoExtensions,sizes } from './common.ets'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';

export default function PhotoAccessHelperStabilityTest() {

    describe('PhotoAccessHelperStabilityTest', function () {
        let predicates: dataSharePredicates.DataSharePredicates = new dataSharePredicates.DataSharePredicates();
        let fetchOptions: photoAccessHelper.FetchOptions = {
            fetchColumns: [],
            predicates: predicates
        };
        let options: photoAccessHelper.CreateOptions = {
            title: 'testPhoto'
        }
        const context = globalThis.abilityContext
        const imageType = photoAccessHelper.PhotoType.IMAGE
        const videoType = photoAccessHelper.PhotoType.VIDEO
        const CREATE_EVENT = 'getPhotoAccessHelper';
        const GET_ASSETS_CALLBACK_EVENT = 'getAssetsCallback';
        const GET_ASSETS_PROMISE_EVENT = 'getAssetsCallPromise';
        const PRODUCE_EXTENSION = 'create_extension'
        const CREATE_ASSET_CALLBACK_OPTIONS_EVENT = 'createAssetCallbackOptions';
        const CREATE_ASSET_CALLBACK_EVENT = 'createAssetCallback';
        const CREATE_ASSET_PROMISE_OPTIONS_EVENT = 'createAssetPromiseOptions';
        const GET_PHOTOASSET_EVENT = 'getPhotoAsset'
        const REGISTER_CHANGE_EVENT = 'registerChange'
        const PHOTOASSET_GET_ATTRS_EVENT = 'getPhotoAssetAttrs'
        const RELEASE_CALLBACK_EVENT = 'releaseCallback'
        const RELEASE_PROMISE_EVENT = 'releasePromise'
        const END_EVENT = 'end'
        const FAIL_EVENT = 'fail'

        let events = require('events');
        let eventEmitter = new events.EventEmitter();

        function toNextStep(phAccessHelper, fetchOptions, param1, param2, options, steps, done) {
            if (steps[0] == END_EVENT) {
                console.info('case success!!');
                done();
            } else if (steps[0] == FAIL_EVENT) {
                console.error('case failed!!');
                done();
            } else {
                console.info('next step: ' + steps[0])
                eventEmitter.emit(steps[0], phAccessHelper, fetchOptions, param1, param2, options, steps, done);
            }
        }

        function toNextStepAfterRelease(fetchOptions, param1, param2, options, steps, done) {
            if (steps[0] == END_EVENT) {
                console.info('case success!!');
                done();
            } else if (steps[0] == FAIL_EVENT) {
                console.error('case failed!!');
                done();
            } else {
                console.info('next step: ' + steps[0])
                eventEmitter.emit(steps[0], fetchOptions, param1, param2, options, steps, done);
            }
        }

        eventEmitter.on(CREATE_EVENT, (fetchOptions, param1, param2, options, steps, done) => {
            steps.shift();
            let phAccessHelper = getPhotoHelper(context)
            toNextStep(phAccessHelper, fetchOptions, param1, param2, options, steps, done)
        });

        eventEmitter.on(GET_ASSETS_CALLBACK_EVENT, (phAccessHelper, fetchOptions, param1, param2, options, steps, done) => {
            steps.shift();
            phAccessHelper.getAssets(fetchOptions, (err, fetchResult) => {
                if (fetchResult != undefined) {
                    toNextStep(phAccessHelper, fetchOptions, param1, param2, options, steps, done)
                } else {
                    console.error(`GET_ASSETS_CALLBACK_EVENT fetchResult fail, err is: ` + err);
                    expect(false).assertTrue();
                }
            });
        });

        eventEmitter.on(GET_ASSETS_PROMISE_EVENT, async (phAccessHelper, fetchOptions, param1, param2, options, steps, done) => {
            steps.shift();
            try {
                let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await phAccessHelper.getAssets(fetchOptions);
                if (fetchResult != undefined) {
                    console.info('fetchResult success');
                    toNextStep(phAccessHelper, fetchOptions, param1, param2, options, steps, done)
                }
            } catch (err) {
                console.error('GET_ASSETS_PROMISE_EVENT failed, message = ', err);
            }
        });

        eventEmitter.on(PRODUCE_EXTENSION, (phAccessHelper, fetchOptions, param1, param2, options, steps, done) => {
            steps.shift();
            try {
                if(param1==imageType){
                    param2 = photoExtensions[Math.floor(Math.random() * photoExtensions.length)];
                }else if(param1==videoType){
                    param2 = videoExtensions[Math.floor(Math.random() * videoExtensions.length)];
                }
                toNextStep(phAccessHelper, fetchOptions, param1, param2, options, steps, done)
            } catch (err) {
                console.error('PRODUCE_EXTENSION failed, message = ', err);
            }
        });

        eventEmitter.on(CREATE_ASSET_CALLBACK_OPTIONS_EVENT, (phAccessHelper, fetchOptions, photoType, extension, options, steps, done) => {
            steps.shift();
            try {
                phAccessHelper.createAsset(photoType, extension, options, (err, uri) => {
                    if (uri != undefined) {
                        console.info('createAsset uri' + uri);
                        console.info('createAsset successfully');
                        checkUri(uri,photoType, extension)
                        toNextStep(phAccessHelper, fetchOptions, photoType, extension, options, steps, done)
                    } else {
                        console.error('createAsset failed, message = ', err);
                    }
                });
            } catch (err) {
                console.error('CREATE_ASSET_CALLBACK_OPTIONS_EVENT failed, message = ', err);
            }
        });

        eventEmitter.on(CREATE_ASSET_CALLBACK_EVENT, (phAccessHelper, fetchOptions, photoType, extension, options, steps, done) => {
            steps.shift();
            try {
                phAccessHelper.createAsset(photoType, extension, (err, uri) => {
                    if (uri != undefined) {
                        console.info('createAsset uri' + uri);
                        console.info('createAsset successfully');
                        checkUri(uri,photoType, extension)
                        toNextStep(phAccessHelper, fetchOptions, photoType, extension, options, steps, done)
                    } else {
                        console.error('createAsset failed, message = ', err);
                    }
                });
            } catch (err) {
                console.error('CREATE_ASSET_CALLBACK_EVENT failed, message = ', err);
            }
        });

        eventEmitter.on(CREATE_ASSET_PROMISE_OPTIONS_EVENT, async (phAccessHelper, fetchOptions, photoType, extension, options, steps, done) => {
            steps.shift();
            try {
                let uri: string = await phAccessHelper.createAsset(photoType, extension, options);
                checkUri(uri,photoType, extension)
                toNextStep(phAccessHelper, fetchOptions, photoType, extension, options, steps, done)
            } catch (err) {
                console.error('CREATE_ASSET_PROMISE_OPTIONS_EVENT failed, message = ', err);
            }
        });

        eventEmitter.on(GET_PHOTOASSET_EVENT, async (phAccessHelper, fetchOptions, param1, param2, options, steps, done) => {
            steps.shift();
            try {
                let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await phAccessHelper.getAssets(fetchOptions);
                let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
                toNextStep(phAccessHelper, fetchOptions, fetchResult, photoAsset, options, steps, done)
            } catch (err) {
                console.error('GET_PHOTOASSET_EVENT failed, message = ', err);
            }
        });

        eventEmitter.on(REGISTER_CHANGE_EVENT, async (phAccessHelper, fetchOptions, fetchResult, photoAsset, options, steps, done) => {
            steps.shift();
            try {
                let onCallback1 = (changeData: photoAccessHelper.ChangeData) => {
                    console.info('onCallback1 success, changData: ' + JSON.stringify(changeData));
                }
                let callBackSet = Math.random() > 0.5;
                let uriSet = Math.random() > 0.5;
                let forChildUris = Math.random() > 0.5;
                checkSet(callBackSet, uriSet, phAccessHelper, forChildUris, photoAsset, onCallback1)
                toNextStep(phAccessHelper, fetchOptions, fetchResult, photoAsset, options, steps, done)
            } catch (err) {
                console.error('REGISTER_CHANGE_EVENT failed, message = ', err);
            }
        });

        eventEmitter.on(PHOTOASSET_GET_ATTRS_EVENT, async (phAccessHelper, fetchOptions, fetchResult, photoAsset, options, steps, done) => {
            steps.shift();
            try {
                let randomIndex;
                if(fetchOptions.fetchColumns!=[]){
                    randomIndex = Math.floor(Math.random() * columns.length);
                }else{
                    randomIndex = Math.floor(Math.random() * 3);
                }
                console.info(`photoAsset Get randomIndex = `, randomIndex);
                console.info(`photoAsset Get ${columns[randomIndex]} = `, columns[randomIndex]);
                let getPhotoAssetAttr: photoAccessHelper.MemberType = photoAsset.get(columns[randomIndex].toString());
                console.info(`photoAsset Get ${columns[randomIndex]} = `, getPhotoAssetAttr);
                toNextStep(phAccessHelper, fetchOptions, fetchResult, photoAsset, options, steps, done)
            } catch (err) {
                console.error('PHOTOASSET_GET_ATTRS_EVENT failed, message = ', err);
            }
        });

        eventEmitter.on(RELEASE_CALLBACK_EVENT, (phAccessHelper, fetchOptions, param1, param2, options, steps, done) => {
            steps.shift();
            phAccessHelper.release((err) => {
                console.info('releaseDemo');
                if (err != undefined) {
                    console.error('release failed. message = ', err);
                    expect(false).assertTrue();
                } else {
                    console.info('release ok.');
                    toNextStepAfterRelease(fetchOptions, param1, param2, options, steps, done)
                }
            });
        });

        eventEmitter.on(RELEASE_PROMISE_EVENT, async (phAccessHelper, fetchOptions, param1, param2, options, steps, done) => {
            steps.shift();
            try {
                await phAccessHelper.release();
                console.info('release ok.');
                toNextStepAfterRelease(fetchOptions, param1, param2, options, steps, done)
            } catch (err) {
                console.error('release failed. message = ', err);
                expect(false).assertTrue();
            }
        });

        function getPhotoHelper(context){
            return photoAccessHelper.getPhotoAccessHelper(context);
        }

        beforeAll(async function() {
            console.info('beforeAll case');
            await getPermission();
        })

        beforeEach(async function() {
            console.info('beforeEach case');
        })

        afterEach(async function() {
            console.info('afterEach case');
            fetchOptions.fetchColumns = []
            options = {
                title: 'testPhoto'
            }
        })

        afterAll(async function() {
            console.info('afterAll case');
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_STABILITY_0100
           * @tc.name      : 001.getPhotoAccessHelper stability test
           * @tc.desc      : getPhotoAccessHelper and release 1000 times
           * @tc.size      : MediumTest
           * @tc.type      : Stability test
           * @tc.level     : Level2
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_STABILITY_0100', 1, function (done) {
            let mySteps = new Array(
                // getPhotoAccessHelper and release
                CREATE_EVENT, RELEASE_CALLBACK_EVENT
            );
            for(let i = 0; i< 999;i++)
            {
                mySteps.push(
                    // getPhotoAccessHelper
                    CREATE_EVENT,
                    // release
                    RELEASE_CALLBACK_EVENT,
                )
            }
            mySteps.push(
                // end
                END_EVENT
            )
            eventEmitter.emit(mySteps[0],fetchOptions, imageType, "svg", options, mySteps, done);
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_STABILITY_0200
           * @tc.name      : 002.getAssets stability test
           * @tc.desc      : getAssets callback with 1000 times
           * @tc.size      : MediumTest
           * @tc.type      : Stability test
           * @tc.level     : Level2
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_STABILITY_0200', 1, function (done) {
            let mySteps = new Array(
                // getPhotoAccessHelper and getAssets
                CREATE_EVENT, GET_ASSETS_CALLBACK_EVENT
            );
            for(let i = 0; i< 999;i++)
            {
                mySteps.push(
                    // getAssets callback
                    GET_ASSETS_CALLBACK_EVENT
                )
            }
            mySteps.push(
                // release
                RELEASE_CALLBACK_EVENT,
                // end
                END_EVENT
            )
            eventEmitter.emit(mySteps[0],fetchOptions, imageType, "svg", options, mySteps, done);
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_STABILITY_0300
           * @tc.name      : 003.getAssets
           * @tc.desc      : getAssets promise with 1000 times
           * @tc.size      : MediumTest
           * @tc.type      : Stability test
           * @tc.level     : Level2
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_STABILITY_0300', 1, function (done) {
            let mySteps = new Array(
                // getPhotoAccessHelper and getAssets
                CREATE_EVENT, GET_ASSETS_PROMISE_EVENT
            );
            for(let i = 0; i< 999;i++)
            {
                mySteps.push(
                    // getAssets Promise
                    GET_ASSETS_PROMISE_EVENT
                )
            }
            mySteps.push(
                // release
                RELEASE_CALLBACK_EVENT,
                // end
                END_EVENT
            )
            eventEmitter.emit(mySteps[0],fetchOptions, imageType, "svg", options, mySteps, done);
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_STABILITY_0400
           * @tc.name      : 004.createAsset
           * @tc.desc      : createAsset callback 1000 times with imageType and photoExtensions
           * @tc.size      : MediumTest
           * @tc.type      : Stability test
           * @tc.level     : Level2
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_STABILITY_0400', 2, function (done) {
            let mySteps = new Array(
                // getPhotoAccessHelper and createAsset
                CREATE_EVENT, PRODUCE_EXTENSION, CREATE_ASSET_CALLBACK_OPTIONS_EVENT
            );
            for(let i = 0; i< 999;i++)
            {
                mySteps.push(
                    // createAsset callback
                    PRODUCE_EXTENSION, CREATE_ASSET_CALLBACK_OPTIONS_EVENT
                )
            }
            mySteps.push(
                // release
                RELEASE_CALLBACK_EVENT,
                // end
                END_EVENT
            )
            eventEmitter.emit(mySteps[0],fetchOptions, imageType, "svg", options, mySteps, done);
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_STABILITY_0500
           * @tc.name      : 005.createAsset
           * @tc.desc      : createAsset callback 1000 times with videoType and videoExtensions
           * @tc.size      : MediumTest
           * @tc.type      : Stability test
           * @tc.level     : Level2
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_STABILITY_0500', 2, function (done) {
            let mySteps = new Array(
                // getPhotoAccessHelper and createAsset
                CREATE_EVENT, PRODUCE_EXTENSION, CREATE_ASSET_CALLBACK_OPTIONS_EVENT
            );
            for(let i = 0; i< 999;i++)
            {
                mySteps.push(
                    // createAsset callback
                    PRODUCE_EXTENSION, CREATE_ASSET_CALLBACK_OPTIONS_EVENT
                )
            }
            mySteps.push(
                // release
                RELEASE_CALLBACK_EVENT,
                // end
                END_EVENT
            )
            eventEmitter.emit(mySteps[0],fetchOptions, videoType, "mp4", options, mySteps, done);
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_STABILITY_0600
           * @tc.name      : 006.createAsset
           * @tc.desc      : createAsset without options callback 1000 times with imageType and photoExtensions
           * @tc.size      : MediumTest
           * @tc.type      : Stability test
           * @tc.level     : Level2
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_STABILITY_0600', 2, function (done) {
            let mySteps = new Array(
                // getPhotoAccessHelper and createAsset
                CREATE_EVENT, PRODUCE_EXTENSION, CREATE_ASSET_CALLBACK_EVENT
            );
            for(let i = 0; i< 999;i++)
            {
                mySteps.push(
                    // createAsset callback
                    PRODUCE_EXTENSION, CREATE_ASSET_CALLBACK_EVENT
                )
            }
            mySteps.push(
                // release
                RELEASE_CALLBACK_EVENT,
                // end
                END_EVENT
            )
            eventEmitter.emit(mySteps[0],fetchOptions, imageType, "svg", options, mySteps, done);
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_STABILITY_0700
           * @tc.name      : 007.createAsset
           * @tc.desc      : createAsset without options callback 1000 times with videoType and videoExtensions
           * @tc.size      : MediumTest
           * @tc.type      : Stability test
           * @tc.level     : Level2
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_STABILITY_0700', 2, function (done) {
            let mySteps = new Array(
                // getPhotoAccessHelper and createAsset
                CREATE_EVENT, PRODUCE_EXTENSION, CREATE_ASSET_CALLBACK_EVENT
            );
            for(let i = 0; i< 999;i++)
            {
                mySteps.push(
                    // createAsset callback
                    PRODUCE_EXTENSION, CREATE_ASSET_CALLBACK_EVENT
                )
            }
            mySteps.push(
                // release
                RELEASE_CALLBACK_EVENT,
                // end
                END_EVENT
            )
            eventEmitter.emit(mySteps[0],fetchOptions, videoType, "mp4", options, mySteps, done);
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_STABILITY_0800
           * @tc.name      : 008.createAsset
           * @tc.desc      : createAsset promise 1000 times with imageType and photoExtensions
           * @tc.size      : MediumTest
           * @tc.type      : Stability test
           * @tc.level     : Level2
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_STABILITY_0800', 2, function (done) {
            let mySteps = new Array(
                // getPhotoAccessHelper and createAsset
                CREATE_EVENT, PRODUCE_EXTENSION, CREATE_ASSET_PROMISE_OPTIONS_EVENT
            );
            for(let i = 0; i< 999;i++)
            {
                mySteps.push(
                    // createAsset callback
                    PRODUCE_EXTENSION, CREATE_ASSET_PROMISE_OPTIONS_EVENT
                )
            }
            mySteps.push(
                // release
                RELEASE_CALLBACK_EVENT,
                // end
                END_EVENT
            )
            eventEmitter.emit(mySteps[0],fetchOptions, imageType, "svg", options, mySteps, done);
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_STABILITY_0900
           * @tc.name      : 009.createAsset
           * @tc.desc      : createAsset promise 1000 times with videoType and videoExtensions
           * @tc.size      : MediumTest
           * @tc.type      : Stability test
           * @tc.level     : Level2
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_STABILITY_0900', 2, function (done) {
            let mySteps = new Array(
                // getPhotoAccessHelper and createAsset
                CREATE_EVENT, PRODUCE_EXTENSION, CREATE_ASSET_PROMISE_OPTIONS_EVENT
            );
            for(let i = 0; i< 999;i++)
            {
                mySteps.push(
                    // createAsset callback
                    PRODUCE_EXTENSION, CREATE_ASSET_PROMISE_OPTIONS_EVENT
                )
            }
            mySteps.push(
                // release
                RELEASE_CALLBACK_EVENT,
                // end
                END_EVENT
            )
            eventEmitter.emit(mySteps[0],fetchOptions, videoType, "mp4", options, mySteps, done);
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_STABILITY_1000
           * @tc.name      : 010.registerChange
           * @tc.desc      : registerChange and unRegisterChange 1000 times with different attrs
           * @tc.size      : MediumTest
           * @tc.type      : Stability test
           * @tc.level     : Level2
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_STABILITY_1000', 2, function (done) {
            let mySteps = new Array(
                // getPhotoAccessHelper and createAsset
                CREATE_EVENT, GET_PHOTOASSET_EVENT, REGISTER_CHANGE_EVENT
            );
            for(let i = 0; i< 999;i++)
            {
                mySteps.push(
                    // createAsset callback
                    REGISTER_CHANGE_EVENT
                )
            }
            mySteps.push(
                // release
                RELEASE_CALLBACK_EVENT,
                // end
                END_EVENT
            )
            eventEmitter.emit(mySteps[0],fetchOptions, videoType, "mp4", options, mySteps, done);
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_STABILITY_1100
           * @tc.name      : 011.release
           * @tc.desc      : release callback 1000 times
           * @tc.size      : MediumTest
           * @tc.type      : Stability test
           * @tc.level     : Level2
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_STABILITY_1100', 2, function (done) {
            let mySteps = new Array(
                // getPhotoAccessHelper and createAsset
                CREATE_EVENT, RELEASE_CALLBACK_EVENT
            );
            for(let i = 0; i< 999;i++)
            {
                mySteps.push(
                    // createAsset callback
                    CREATE_EVENT, RELEASE_CALLBACK_EVENT
                )
            }
            mySteps.push(
                // end
                END_EVENT
            )
            eventEmitter.emit(mySteps[0],fetchOptions, videoType, "mp4", options, mySteps, done);
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_STABILITY_1200
           * @tc.name      : 012.release
           * @tc.desc      : release promise 1000 times
           * @tc.size      : MediumTest
           * @tc.type      : Stability test
           * @tc.level     : Level2
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_STABILITY_1200', 2, function (done) {
            let mySteps = new Array(
                // getPhotoAccessHelper and createAsset
                CREATE_EVENT, RELEASE_PROMISE_EVENT
            );
            for(let i = 0; i< 999;i++)
            {
                mySteps.push(
                    // createAsset callback
                    CREATE_EVENT, RELEASE_PROMISE_EVENT
                )
            }
            mySteps.push(
                // end
                END_EVENT
            )
            eventEmitter.emit(mySteps[0],fetchOptions, videoType, "mp4", options, mySteps, done);
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_STABILITY_1300
           * @tc.name      : 013.photoAsset.get
           * @tc.desc      : photoAsset.get 1000 times for all photoKeys of columns
           * @tc.size      : MediumTest
           * @tc.type      : Stability test
           * @tc.level     : Level2
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_STABILITY_1300', 2, function (done) {
            let mySteps = new Array(
                // getPhotoAccessHelper and getPhotoAsset
                CREATE_EVENT, GET_PHOTOASSET_EVENT, PHOTOASSET_GET_ATTRS_EVENT
            );
            for(let i = 0; i< 999;i++)
            {
                mySteps.push(
                    // photoAsset.get
                    PHOTOASSET_GET_ATTRS_EVENT
                )
            }
            mySteps.push(
                // release
                RELEASE_CALLBACK_EVENT,
                // end
                END_EVENT
            )
            fetchOptions.fetchColumns = columns
            eventEmitter.emit(mySteps[0],fetchOptions, videoType, "mp4", options, mySteps, done);
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_STABILITY_1400
           * @tc.name      : 014.photoAsset.get
           * @tc.desc      : photoAsset.get 1000 times for uri,displayName,photoType of columns
           * @tc.size      : MediumTest
           * @tc.type      : Stability test
           * @tc.level     : Level2
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_STABILITY_1400', 2, function (done) {
            let mySteps = new Array(
                // getPhotoAccessHelper and getPhotoAsset
                CREATE_EVENT, GET_PHOTOASSET_EVENT, PHOTOASSET_GET_ATTRS_EVENT
            );
            for(let i = 0; i< 999;i++)
            {
                mySteps.push(
                    // photoAsset.get
                    PHOTOASSET_GET_ATTRS_EVENT
                )
            }
            mySteps.push(
                // release
                RELEASE_CALLBACK_EVENT,
                // end
                END_EVENT
            )
            eventEmitter.emit(mySteps[0],fetchOptions, videoType, "mp4", options, mySteps, done);
        })
    })
}
