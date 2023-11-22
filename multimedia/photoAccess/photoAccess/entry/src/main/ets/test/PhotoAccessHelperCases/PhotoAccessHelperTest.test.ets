/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
import { getPermission, photoKeys } from '../../../../../../../common'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';

export default function PhotoAccessHelperTest() {

    describe('PhotoAccessHelperTest', function () {
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
        const DEFAULT_PHOTO_URI = photoAccessHelper.DefaultChangeUri.DEFAULT_PHOTO_URI;
        const photoExtensions = [
            "jpg",
            "jpeg",
            "png",
            "svg",
            "bmp",
            "gif"
        ]
        const videoExtensions = [
            "mp4",
            "ts",
            "webm",
            "mkv"
        ]

        function getPhotoHelper(context){
            return photoAccessHelper.getPhotoAccessHelper(context);
        }

        let keyNum = 0
        function getAssetsForKeysCallback(phAccessHelper, fetchOptions, done){
            console.info('getAssetsForKeysCallback start');
            let columns = [
                photoKeys.URI,
                photoKeys.PHOTO_TYPE,
                photoKeys.DISPLAY_NAME,
                photoKeys.DATE_ADDED,
                photoKeys.DATE_MODIFIED,
                photoKeys.DURATION,
                photoKeys.WIDTH,
                photoKeys.HEIGHT,
                photoKeys.DATE_TAKEN,
                photoKeys.ORIENTATION,
                photoKeys.FAVORITE,
                photoKeys.SIZE,
                photoKeys.TITLE,
                photoKeys.POSITION,
                photoKeys.DATE_TRASHED,
                photoKeys.HIDDEN,
                photoKeys.CAMERA_SHOT_KEY,
                photoKeys.USER_COMMENT,
            ]
            fetchOptions.fetchColumns = [columns[keyNum]]
            console.info(`getAssetsForKeysCallback columns[${keyNum}] is:` + columns[keyNum]);
            phAccessHelper.getAssets(fetchOptions, async (err, fetchResult) => {
                if (fetchResult != undefined) {
                    console.info('getAssetsForKeysCallback fetchResult success');
                    let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
                    console.info('getAssetsForKeysCallback fetchOptions.fetchColumns : ' + fetchOptions.fetchColumns);
                    keyNum++
                    if(keyNum==17){
                        keyNum = 0
                        console.info('getAssetsForKeysCallback getAssets end');
                        releaseHelperCallback(phAccessHelper,done)
                    }else{
                        getAssetsForKeysCallback(phAccessHelper, fetchOptions, done)
                    }
                } else {
                    console.error(`getAssetsForKeysCallback fetchResult fail ${keyNum}` + err);
                    expect(false).assertTrue();
                }
            });

        }

        function getAssetsAndReleaseCallback(phAccessHelper,fetchOptions,done){
            console.info('getAssets start');
            phAccessHelper.getAssets(fetchOptions, async (err, fetchResult) => {
                if (fetchResult != undefined) {
                    console.info('fetchResult success');
                    let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
                    if (photoAsset != undefined) {
                        console.info('photoAsset.displayName : ' + photoAsset.displayName);
                        console.info('photoAsset.uri : ' + photoAsset.uri);
                        console.info('photoAsset.photoType : ' + photoAsset.photoType);
                    }
                    console.info('fetchOptions.fetchColumns : ' + fetchOptions.fetchColumns);
                    console.info('getAssets end');
                    releaseHelperCallback(phAccessHelper,done)
                } else {
                    console.error('fetchResult fail' + err);
                    expect(false).assertTrue();
                }
            });
        }

        async function getAssetsAndReleasePromise(phAccessHelper,fetchOptions,done){
            try {
                let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await phAccessHelper.getAssets(fetchOptions);
                if (fetchResult != undefined) {
                    console.info('fetchResult success');
                    let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
                    if (photoAsset != undefined) {
                        console.info('photoAsset.displayName : ' + photoAsset.displayName);
                        console.info('photoAsset.uri : ' + photoAsset.uri);
                        console.info('photoAsset.photoType : ' + photoAsset.photoType);
                    }
                    releaseHelperPromise(phAccessHelper,done)
                }
            } catch (err) {
                console.error('getAssets failed, message = ', err);
                expect(false).assertTrue();
            }
        }

        function setArgGetAssetsCallback(photoHelper,columns,tag,done){
            try{
                fetchOptions.fetchColumns = columns
                getAssetsAndReleaseCallback(photoHelper,fetchOptions,done)
                console.info(`${tag} excute pass`);
            } catch(err){
                console.info(`${tag} getAssets failed , catch err is ` + err.message);
                expect(false).assertTrue();
                done();
            }
        }

        function setArgGetAssetsPromise(photoHelper,columns,tag,done){
            try{
                fetchOptions.fetchColumns = columns
                getAssetsAndReleasePromise(photoHelper,fetchOptions,done)
                console.info(`${tag} excute pass`);
            } catch(err){
                console.info(`${tag} getAssets failed , catch err is ` + err.message);
                expect(false).assertTrue();
                done();
            }
        }

        function createAsset(phAccessHelper,photoType, extension, options, done) {
            phAccessHelper.createAsset(photoType, extension, options, (err, uri) => {
                if (uri != undefined) {
                    console.info('createAsset uri' + uri);
                    console.info('createAsset successfully');
                    releaseHelperCallback(phAccessHelper,done)
                } else {
                    console.error('createAsset failed, message = ', err);
                    expect(false).assertTrue();
                    done();
                }
            });
        }

        let suffixNum1 = 0
        function createAssetForSuffixesCallback1(phAccessHelper, photoType, extension, options, extensions, done){
            console.info('createAssetForSuffixesCallback1 start');
            extension = extensions[suffixNum1]
            console.info(`createAssetForSuffixesCallback1 set suffix is:` + extension);
            phAccessHelper.createAsset(photoType, extension, options, (err, uri) => {
                if (uri != undefined) {
                    console.info('createAsset uri' + uri);
                    console.info('createAsset successfully');
                    suffixNum1++
                    if(suffixNum1==extensions.length){
                        suffixNum1 = 0
                        console.info('createAssetForSuffixesCallback1 getAssets end');
                        releaseHelperCallback(phAccessHelper,done)
                    }else{
                        createAssetForSuffixesCallback1(phAccessHelper, photoType, extension, options, extensions, done)
                    }
                } else {
                    console.error('createAsset failed, message = ', err);
                    expect(false).assertTrue();
                    done();
                }
            });
        }

        let suffixNum2 = 0
        function createAssetForSuffixesCallback2(phAccessHelper, photoType, extension, extensions, done){
            console.info('createAssetForSuffixesCallback2 start');
            extension = extensions[suffixNum2]
            console.info(`createAssetForSuffixesCallback2 set suffix is:` + extension);
            phAccessHelper.createAsset(photoType, extension, (err, uri) => {
                if (uri != undefined) {
                    console.info('createAsset uri' + uri);
                    console.info('createAsset successfully');
                    suffixNum2++
                    if(suffixNum2==extensions.length){
                        suffixNum2 = 0
                        console.info('createAssetForSuffixesCallback2 getAssets end');
                        releaseHelperCallback(phAccessHelper,done)
                    }else{
                        createAssetForSuffixesCallback2(phAccessHelper, photoType, extension, extensions, done)
                    }
                } else {
                    console.error('createAsset failed, message = ', err);
                    expect(false).assertTrue();
                    done();
                }
            });
        }

        let suffixNum3 = 0
        async function createAssetForSuffixesPromise(phAccessHelper, photoType, extension, options, extensions, done){
            console.info('createAssetForSuffixesPromise start');
            extension = extensions[suffixNum3]
            console.info(`createAssetForSuffixesPromise set suffix is:` + extension);
            try {
                let uri;
                if(options.title == "no"){
                    uri= await phAccessHelper.createAsset(photoType, extension);
                }else {
                    uri= await phAccessHelper.createAsset(photoType, extension, options);
                }
                console.info('createAsset uri' + uri);
                console.info('createAsset successfully');
                suffixNum3++
                if(suffixNum3==extensions.length){
                    suffixNum3 = 0
                    console.info('createAssetForSuffixesPromise getAssets end');
                    releaseHelperPromise(phAccessHelper,done)
                }else{
                    createAssetForSuffixesPromise(phAccessHelper, photoType, extension, options, extensions, done)
                }
            } catch (err) {
                console.error('createAsset failed, message = ', err);
                expect(false).assertTrue();
                done();
            }
        }

        function checkSet(registerSet, callBackSet, uriSet, phAccessHelper, forChildUris, photoAsset, onCallback1){
            if(registerSet){
                if(uriSet){
                    phAccessHelper.registerChange(photoAsset.uri, forChildUris, onCallback1);
                }else{
                    phAccessHelper.registerChange(DEFAULT_PHOTO_URI, forChildUris, onCallback1);
                }
            }else {
                if(uriSet){
                    phAccessHelper.registerChange(photoAsset.uri, forChildUris, onCallback1);
                    if(callBackSet){
                        phAccessHelper.unRegisterChange(photoAsset.uri, onCallback1);
                    }else {
                        phAccessHelper.unRegisterChange(photoAsset.uri);
                    }
                }else{
                    phAccessHelper.registerChange(DEFAULT_PHOTO_URI, forChildUris, onCallback1);
                    if(callBackSet){
                        phAccessHelper.unRegisterChange(photoAsset.uri, onCallback1);
                    }else {
                        phAccessHelper.unRegisterChange(photoAsset.uri);
                    }
                }
            }
        }

        function registerChangeCallback(registerSet, callBackSet, uriSet, phAccessHelper, forChildUris, done){
            phAccessHelper.getAssets(fetchOptions, async (err, fetchResult) => {
                if (fetchResult != undefined) {
                    console.info('fetchResult success');
                    fetchResult.getFirstObject((err, photoAsset) => {
                        if (photoAsset != undefined) {
                            console.info('photoAsset displayName: ', photoAsset.displayName);
                            let onCallback1 = (changeData: photoAccessHelper.ChangeData) => {
                                console.info('onCallback1 success, changData: ' + JSON.stringify(changeData));
                            }
                            checkSet(registerSet, callBackSet, uriSet, phAccessHelper, forChildUris, photoAsset, onCallback1)
                            setTimeout( () => {
                                releaseHelperCallback(phAccessHelper,done)
                            }, 1000);
                        } else {
                            console.error('photoAsset failed with err:' + err);
                        }
                    });

                } else {
                    console.error('fetchResult fail' + err);
                }
            });
        }

        async function registerChangePromise(registerSet, callBackSet, uriSet, phAccessHelper, forChildUris, done){
            let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await phAccessHelper.getAssets(fetchOptions);
            let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
            let onCallback1 = (changeData: photoAccessHelper.ChangeData) => {
                console.info('onCallback1 success, changData: ' + JSON.stringify(changeData));
            }
            checkSet(registerSet, callBackSet, uriSet, phAccessHelper, forChildUris, photoAsset, onCallback1)
            releaseHelperPromise(phAccessHelper,done)
        }

        function createPhotoAssetGet(photoAsset){
            let photoAssetUri: photoAccessHelper.MemberType = photoAsset.get(photoAccessHelper.PhotoKeys.URI.toString());
            console.info('photoAsset.uri : ' + photoAssetUri);
            let photoAssetType: photoAccessHelper.MemberType = photoAsset.get(photoAccessHelper.PhotoKeys.PHOTO_TYPE.toString());
            console.info('photoAsset.photoType : ' + photoAssetType);
            let photoAssetName: photoAccessHelper.MemberType = photoAsset.get(photoAccessHelper.PhotoKeys.DISPLAY_NAME.toString());
            console.info('photoAsset.displayName : ' + photoAssetName);
            // let photoAssetTitle: photoAccessHelper.MemberType = photoAsset.get("title");
        }

        function getPhotoAssetCallback(phAccessHelper,fetchOptions,done){
            console.info('photoAsset.get start');
            phAccessHelper.getAssets(fetchOptions, async (err, fetchResult) => {
                if (fetchResult != undefined) {
                    console.info('fetchResult success1');
                    try{
                        let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
                        console.info('fetchResult success2');
                        if (photoAsset != undefined) {
                            createPhotoAssetGet(photoAsset)
                        }
                    }catch(err){
                        console.error('getFirstObject fail, err is: ' + err.message);
                    }
                    releaseHelperCallback(phAccessHelper,done)
                } else {
                    console.error('fetchResult fail' + err);
                    expect(false).assertTrue();
                }
            });
        }

        async function getPhotoAssetPromise(phAccessHelper,fetchOptions,done) {
            console.info('photoAsset.get start');
            try {
                let fetchResult: photoAccessHelper.FetchResult<photoAccessHelper.PhotoAsset> = await phAccessHelper.getAssets(fetchOptions);
                let photoAsset: photoAccessHelper.PhotoAsset = await fetchResult.getFirstObject();
                createPhotoAssetGet(photoAsset)
                releaseHelperPromise(phAccessHelper,done)
            } catch (err) {
                console.error('release failed. message = ', err);
            }
        }



        function releaseHelperCallback(phAccessHelper,done){
            phAccessHelper.release((err) => {
                console.info('releaseDemo');
                if (err != undefined) {
                    console.error('release failed. message = ', err);
                } else {
                    console.info('release ok.');
                    done();
                }
            });
        }

        async function releaseHelperPromise(phAccessHelper,done){
            try {
                await phAccessHelper.release();
                console.info('release ok.');
                done();
            } catch (err) {
                console.error('release failed. message = ', err);
            }
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
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_0100
           * @tc.name      : 001.getPhotoAccessHelper
           * @tc.desc      : getPhotoAccessHelper with correct context
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level1
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_0100', 0, async function (done) {
            try{
                let photoHelper = getPhotoHelper(context)
                releaseHelperCallback(photoHelper,done)
                console.info('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_0100 excute pass');
            } catch(err){
                console.info('getPhotoAccessHelper failed , catch err is  ' + err.message);
                done();
            }
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_0200
           * @tc.name      : 001.getPhotoAccessHelper
           * @tc.desc      : getPhotoAccessHelper with incorrect argument
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level1
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_0200', 0, async function (done) {
            let photoHelper = getPhotoHelper(context)
            try{
                getAssetsAndReleaseCallback(photoHelper,fetchOptions,done)
            } catch(err){
                console.info('getPhotoAccessHelper 0400 getAssets failed , catch err is  ' + err.message);
                done();
            }
            console.info('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_0400 excute pass');
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_0300
           * @tc.name      : 001.getPhotoAccessHelper
           * @tc.desc      : getPhotoAccessHelper with incorrect argument
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level1
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_0300', 0, async function (done) {
            let photoHelper = getPhotoHelper(context)
            getAssetsForKeysCallback(photoHelper, fetchOptions, done)
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_0400
           * @tc.name      : 001.getPhotoAccessHelper
           * @tc.desc      : getPhotoAccessHelper with incorrect argument
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level1
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_0400', 0, async function (done) {
            let photoHelper = getPhotoHelper(context)
            setArgGetAssetsCallback(photoHelper,[photoKeys.URI,photoKeys.DISPLAY_NAME,photoKeys.PHOTO_TYPE],
                'SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_0800',done)
        })

        // /* *
        //    * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_0900
        //    * @tc.name      : 001.getPhotoAccessHelper
        //    * @tc.desc      : getPhotoAccessHelper with incorrect argument
        //    * @tc.size      : MediumTest
        //    * @tc.type      : Function test
        //    * @tc.level     : Level1
        //    */
        // it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_0700', 0, async function (done) {
        //     let photoHelper = getPhotoHelper(context)
        //     setArgGetAssetsCallback(photoHelper,[photoKeys.URI,"testArg"],
        //         'SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_0700',done)
        // })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_0500
           * @tc.name      : 001.getPhotoAccessHelper
           * @tc.desc      : getPhotoAccessHelper with incorrect argument
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level1
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_0500', 0, function (done) {
            let photoHelper = getPhotoHelper(context)
            createAssetForSuffixesCallback1(photoHelper,imageType, 'jpg', options, photoExtensions, done)
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_0600
           * @tc.name      : 001.getPhotoAccessHelper
           * @tc.desc      : getPhotoAccessHelper with incorrect argument
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level1
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_0600', 0, function (done) {
            let photoHelper = getPhotoHelper(context)
            createAssetForSuffixesCallback1(photoHelper, videoType, 'mp4', options, videoExtensions, done)
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_0700
           * @tc.name      : 001.getPhotoAccessHelper
           * @tc.desc      : getPhotoAccessHelper with incorrect argument
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level1
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_0700', 0, function (done) {
            let photoHelper = getPhotoHelper(context)
            createAssetForSuffixesCallback2(photoHelper, imageType, 'jpg', photoExtensions, done)
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_0800
           * @tc.name      : 001.getPhotoAccessHelper
           * @tc.desc      : getPhotoAccessHelper with incorrect argument
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level1
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_0800', 0, function (done) {
            let photoHelper = getPhotoHelper(context)
            createAssetForSuffixesCallback2(photoHelper, videoType, 'mp4', videoExtensions, done)
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_0900
           * @tc.name      : 001.getPhotoAccessHelper
           * @tc.desc      : getPhotoAccessHelper with incorrect argument
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level1
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_0900', 0, function (done) {
            let photoHelper = getPhotoHelper(context)
            createAssetForSuffixesPromise(photoHelper, imageType, 'jpg', options, photoExtensions, done)
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_1000
           * @tc.name      : 001.getPhotoAccessHelper
           * @tc.desc      : getPhotoAccessHelper with incorrect argument
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level1
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_1000', 0, function (done) {
            let photoHelper = getPhotoHelper(context)
            createAssetForSuffixesPromise(photoHelper, videoType, 'mp4', options, videoExtensions, done)
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_1100
           * @tc.name      : 001.getPhotoAccessHelper
           * @tc.desc      : getPhotoAccessHelper with incorrect argument
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level1
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_1100', 0, function (done) {
            let photoHelper = getPhotoHelper(context)
            let withoutOptions =  {
                title: 'no'
            }
            createAssetForSuffixesPromise(photoHelper, imageType, 'jpg', withoutOptions, photoExtensions, done)
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_1200
           * @tc.name      : 001.getPhotoAccessHelper
           * @tc.desc      : getPhotoAccessHelper with incorrect argument
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level1
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_1200', 0, function (done) {
            let photoHelper = getPhotoHelper(context)
            let withoutOptions =  {
                title: 'no'
            }
            createAssetForSuffixesPromise(photoHelper, videoType, 'mp4', withoutOptions, videoExtensions, done)
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_1300
           * @tc.name      : 001.getPhotoAccessHelper
           * @tc.desc      : getPhotoAccessHelper with incorrect argument
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level1
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_1300', 0, function (done) {
            let photoHelper = getPhotoHelper(context)
            let optionsErr =  {
                date: 'date'
            }
            createAssetForSuffixesPromise(photoHelper, imageType, 'jpg', optionsErr, photoExtensions, done)
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_1400
           * @tc.name      : 001.getPhotoAccessHelper
           * @tc.desc      : getPhotoAccessHelper with incorrect argument
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level1
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_1400', 0, function (done) {
            let photoHelper = getPhotoHelper(context)
            let optionsErr =  {
                date: 'date'
            }
            createAssetForSuffixesPromise(photoHelper, videoType, 'mp4', optionsErr, videoExtensions, done)
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_1500
           * @tc.name      : 001.getPhotoAccessHelper
           * @tc.desc      : getPhotoAccessHelper with incorrect argument
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level1
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_1500', 0, function (done) {
            let photoHelper = getPhotoHelper(context)
            registerChangePromise(true, true, true, photoHelper, true, done)
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_1600
           * @tc.name      : 001.getPhotoAccessHelper
           * @tc.desc      : getPhotoAccessHelper with incorrect argument
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level1
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_1600', 0, function (done) {
            let photoHelper = getPhotoHelper(context)
            registerChangePromise(true, true, true, photoHelper, false, done)
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_1700
           * @tc.name      : 001.getPhotoAccessHelper
           * @tc.desc      : getPhotoAccessHelper with incorrect argument
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level1
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_1700', 0, function (done) {
            let photoHelper = getPhotoHelper(context)
            registerChangePromise(true, true, false, photoHelper, true, done)
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_1800
           * @tc.name      : 001.getPhotoAccessHelper
           * @tc.desc      : getPhotoAccessHelper with incorrect argument
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level1
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_1800', 0, function (done) {
            let photoHelper = getPhotoHelper(context)
            registerChangePromise(true, true, false, photoHelper, false, done)
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_1900
           * @tc.name      : 001.getPhotoAccessHelper
           * @tc.desc      : getPhotoAccessHelper with incorrect argument
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level1
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_1900', 0, function (done) {
            let photoHelper = getPhotoHelper(context)
            registerChangePromise(false, false, true, photoHelper, true, done)
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_2000
           * @tc.name      : 001.getPhotoAccessHelper
           * @tc.desc      : getPhotoAccessHelper with incorrect argument
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level1
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_2000', 0, function (done) {
            let photoHelper = getPhotoHelper(context)
            registerChangePromise(false, false, true, photoHelper, false, done)
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_2100
           * @tc.name      : 001.getPhotoAccessHelper
           * @tc.desc      : getPhotoAccessHelper with incorrect argument
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level1
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_2100', 0, function (done) {
            let photoHelper = getPhotoHelper(context)
            registerChangePromise(false, false, false, photoHelper, true, done)
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_2200
           * @tc.name      : 001.getPhotoAccessHelper
           * @tc.desc      : getPhotoAccessHelper with incorrect argument
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level1
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_2200', 0, function (done) {
            let photoHelper = getPhotoHelper(context)
            registerChangePromise(false, false, false, photoHelper, false, done)
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_2300
           * @tc.name      : 001.getPhotoAccessHelper
           * @tc.desc      : getPhotoAccessHelper with incorrect argument
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level1
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_2300', 0, function (done) {
            let photoHelper = getPhotoHelper(context)
            registerChangePromise(false, true, true, photoHelper, true, done)
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_2400
           * @tc.name      : 001.getPhotoAccessHelper
           * @tc.desc      : getPhotoAccessHelper with incorrect argument
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level1
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_2400', 0, function (done) {
            let photoHelper = getPhotoHelper(context)
            registerChangePromise(false, true, true, photoHelper, false, done)
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_2500
           * @tc.name      : 001.getPhotoAccessHelper
           * @tc.desc      : getPhotoAccessHelper with incorrect argument
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level1
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_2500', 0, function (done) {
            let photoHelper = getPhotoHelper(context)
            registerChangePromise(false, true, false, photoHelper, true, done)
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_2600
           * @tc.name      : 001.getPhotoAccessHelper
           * @tc.desc      : getPhotoAccessHelper with incorrect argument
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level1
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_2600', 0, function (done) {
            let photoHelper = getPhotoHelper(context)
            registerChangePromise(false, true, false, photoHelper, false, done)
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_2700
           * @tc.name      : 001.getPhotoAccessHelper
           * @tc.desc      : getPhotoAccessHelper with incorrect argument
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level1
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_2700', 0, function (done) {
            let photoHelper = getPhotoHelper(context)
            registerChangeCallback(true, true, true, photoHelper, true, done)
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_2800
           * @tc.name      : 001.getPhotoAccessHelper
           * @tc.desc      : getPhotoAccessHelper with incorrect argument
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level1
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_2800', 0, function (done) {
            let photoHelper = getPhotoHelper(context)
            registerChangeCallback(true, true, true, photoHelper, false, done)
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_2900
           * @tc.name      : 001.getPhotoAccessHelper
           * @tc.desc      : getPhotoAccessHelper with incorrect argument
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level1
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_2900', 0, function (done) {
            let photoHelper = getPhotoHelper(context)
            registerChangeCallback(true, true, false, photoHelper, true, done)
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_3000
           * @tc.name      : 001.getPhotoAccessHelper
           * @tc.desc      : getPhotoAccessHelper with incorrect argument
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level1
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_3000', 0, function (done) {
            let photoHelper = getPhotoHelper(context)
            registerChangeCallback(true, true, false, photoHelper, false, done)
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_3100
           * @tc.name      : 001.getPhotoAccessHelper
           * @tc.desc      : getPhotoAccessHelper with incorrect argument
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level1
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_3100', 0, function (done) {
            let photoHelper = getPhotoHelper(context)
            registerChangeCallback(false, false, true, photoHelper, true, done)
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_3200
           * @tc.name      : 001.getPhotoAccessHelper
           * @tc.desc      : getPhotoAccessHelper with incorrect argument
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level1
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_3200', 0, function (done) {
            let photoHelper = getPhotoHelper(context)
            registerChangeCallback(false, false, true, photoHelper, false, done)
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_3300
           * @tc.name      : 001.getPhotoAccessHelper
           * @tc.desc      : getPhotoAccessHelper with incorrect argument
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level1
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_3300', 0, function (done) {
            let photoHelper = getPhotoHelper(context)
            registerChangeCallback(false, false, false, photoHelper, true, done)
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_3400
           * @tc.name      : 001.getPhotoAccessHelper
           * @tc.desc      : getPhotoAccessHelper with incorrect argument
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level1
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_3400', 0, function (done) {
            let photoHelper = getPhotoHelper(context)
            registerChangeCallback(false, false, false, photoHelper, false, done)
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_3500
           * @tc.name      : 001.getPhotoAccessHelper
           * @tc.desc      : getPhotoAccessHelper with incorrect argument
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level1
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_3500', 0, function (done) {
            let photoHelper = getPhotoHelper(context)
            registerChangeCallback(false, true, true, photoHelper, true, done)
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_3600
           * @tc.name      : 001.getPhotoAccessHelper
           * @tc.desc      : getPhotoAccessHelper with incorrect argument
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level1
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_3600', 0, function (done) {
            let photoHelper = getPhotoHelper(context)
            registerChangeCallback(false, true, true, photoHelper, false, done)
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_3700
           * @tc.name      : 001.getPhotoAccessHelper
           * @tc.desc      : getPhotoAccessHelper with incorrect argument
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level1
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_3700', 0, function (done) {
            let photoHelper = getPhotoHelper(context)
            registerChangeCallback(false, true, false, photoHelper, true, done)
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_3800
           * @tc.name      : 001.getPhotoAccessHelper
           * @tc.desc      : getPhotoAccessHelper with incorrect argument
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level1
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_3800', 0, function (done) {
            let photoHelper = getPhotoHelper(context)
            registerChangeCallback(false, true, false, photoHelper, false, done)
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_3900
           * @tc.name      : 001.getPhotoAccessHelper
           * @tc.desc      : getPhotoAccessHelper with incorrect argument
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level1
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_3900', 0, function (done) {
            let photoHelper = getPhotoHelper(context)
            photoHelper.release((err) => {
                console.info('releaseDemo');
                if (err != undefined) {
                    console.error('release failed. message = ', err);
                } else {
                    console.info('release1 ok.');
                    photoHelper.release((err) => {
                        console.info('releaseDemo');
                        if (err != undefined) {
                            console.error('release failed. message = ', err);
                        } else {
                            console.info('release2 ok.');
                            done()
                        }
                    });
                }
            });
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_4000
           * @tc.name      : 001.getPhotoAccessHelper
           * @tc.desc      : getPhotoAccessHelper with incorrect argument
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level1
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_4000', 0, async function (done) {
            let photoHelper = getPhotoHelper(context)
            try {
                await photoHelper.release();
                console.info('release1 ok.');
                await photoHelper.release();
                console.info('release2 ok.');
                done();
            } catch (err) {
                console.error('release failed. message = ', err);
            }
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_4100
           * @tc.name      : 001.getPhotoAccessHelper
           * @tc.desc      : getPhotoAccessHelper with incorrect argument
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level1
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_4100', 0, function (done) {
            let photoHelper = getPhotoHelper(context)
            getPhotoAssetCallback(photoHelper,fetchOptions,done)
        })

        /* *
           * @tc.number    : SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_4200
           * @tc.name      : 001.getPhotoAccessHelper
           * @tc.desc      : getPhotoAccessHelper with incorrect argument
           * @tc.size      : MediumTest
           * @tc.type      : Function test
           * @tc.level     : Level1
           */
        it('SUB_MULTIMEDIA_MEDIA_PHOTOACCESSHELPER_FUNCTION_4200', 0, function (done) {
            let photoHelper = getPhotoHelper(context)
            getPhotoAssetPromise(photoHelper,fetchOptions,done)
        })

    })
}
