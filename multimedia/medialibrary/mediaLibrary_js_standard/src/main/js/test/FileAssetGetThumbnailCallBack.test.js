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

import mediaLibrary from '@ohos.multimedia.medialibrary';
import image from '@@ohos.multimedia.image';
import featureAbility from '@ohos.ability.featureAbility';

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'deccjsunit/index';

describe('GetFileAssets_GetCount_GetAllObjects', function () {
    var context = featureAbility.getContext();
    console.info('MediaLibraryTest : getMediaLibrary IN');
    var media = mediaLibrary.getMediaLibrary(context);
    console.info('MediaLibraryTest : getMediaLibrary OUT');

    var URI;
    var name;
    var result1;
    var albumName;
    var albumId;
    var i;
    var fileAsset;
    var MAXNUM = 100;
    var PATH = 'data';
    var MEDIA_TYPE = 'media_type';
    let fileKeyObj = mediaLibrary.FileKey;

    let type = mediaLibrary.MediaType.IMAGE;
    let videoType = mediaLibrary.MediaType.VIDEO;
    let audioType = mediaLibrary.MediaType.AUDIO;
    let fetchOp = {
        selections: fileKeyObj.MEDIA_TYPE + '=?',
        selectionArgs: [type.toString()],
        order: fileKeyObj.dateAdded,
    };
    let videoFetchOp = {
        selections: fileKeyObj.MEDIA_TYPE + '=?',
        selectionArgs: [videoType.toString()],
        order: fileKeyObj.dateAdded,
    };
    let audioFetchOp = {
        selections: fileKeyObj.MEDIA_TYPE + '=?',
        selectionArgs: [audioType.toString()],
        order: fileKeyObj.dateAdded,
    };
    beforeAll(function () {
        //onsole.info('beforeAll: Prerequisites at the test suite level, which are executed before the test suite is executed.');
    });

    beforeEach(function () {
        //console.info('MediaLibraryTest: beforeEach: Prerequisites at the test case level, which are executed before each test case is executed.');
    });
    afterEach(function () {
        //console.info('MediaLibraryTest: afterEach: Test case-level clearance conditions, which are executed after each test case is executed.');
    });
    afterAll(function () {
        //console.info('MediaLibraryTest: afterAll: Test suite-level cleanup condition, which is executed after the test suite is executed');
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GET_getThumbnail_01
     * @tc.name      : getThumbnail
     * @tc.desc      : getThumbnail by fetchOp & { width: 80, height: 80 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_GET_getThumbnail_01', 0, async function (done) {
        media.getFileAssets(fetchOp, (error, data) => {
            if (data != undefined) {
                console.info('MediaLibraryTest : getFileAssets Successfull ' + data.getCount());
                data.getFirstObject((err1, data1) => {
                    if (data1 != undefined) {
                        let size = { width: 80, height: 80 };
                        data1.getThumbnail(size, (err2, pixelmap) => {
                            console.info('MediaLibraryTest : getThumbnail Successfull ' + pixelmap);
                            pixelmap.getImageInfo((error, info) => {
                                console.info('MediaLibraryTest : pixel image info ' + info);
                                console.info('MediaLibraryTest : pixel width ' + info.size.width);
                                console.info('MediaLibraryTest : pixel height ' + info.size.height);
                                expect(info.size.width == 80).assertTrue();
                                expect(info.size.height == 80).assertTrue();
                                done();
                            });
                        });
                    }
                });
            } else {
                console.info('MediaLibraryTest : getFileAssets Unsuccessfull ' + error.message);
                console.info('MediaLibraryTest : getFileAssets :FAIL');
                expect(false).assertTrue();
                done();
            }
        });
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GET_getThumbnail_02
     * @tc.name      : getThumbnail
     * @tc.desc      : getThumbnail by fetchOp & { width: 400, height: 400 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_GET_getThumbnail_02', 0, async function (done) {
        media.getFileAssets(fetchOp, (error, data) => {
            if (data != undefined) {
                console.info('MediaLibraryTest : getFileAssets Successfull ' + data.getCount());
                data.getFirstObject((err1, data1) => {
                    if (data1 != undefined) {
                        let size = { width: 400, height: 400 };
                        data1.getThumbnail(size, (err2, pixelmap) => {
                            console.info('MediaLibraryTest : getThumbnail Successfull ' + pixelmap);
                            pixelmap.getImageInfo((error, info) => {
                                console.info('MediaLibraryTest : pixel image info ' + info);
                                console.info('MediaLibraryTest : pixel width ' + info.size.width);
                                console.info('MediaLibraryTest : pixel height ' + info.size.height);
                                expect(info.size.width == 400).assertTrue();
                                expect(info.size.height == 400).assertTrue();
                                done();
                            });
                        });
                    }
                });
            } else {
                console.info('MediaLibraryTest : getFileAssets Unsuccessfull ' + error.message);
                console.info('MediaLibraryTest : getFileAssets :FAIL');
                expect(false).assertTrue();
                done();
            }
        });
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GET_getThumbnail_03
     * @tc.name      : getThumbnail
     * @tc.desc      : getThumbnail by videoFetchOp & { width: 80, height: 80 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_GET_getThumbnail_03', 0, async function (done) {
        media.getFileAssets(videoFetchOp, (error, data) => {
            if (data != undefined) {
                console.info('MediaLibraryTest : getFileAssets Successfull ' + data.getCount());
                data.getFirstObject((err1, data1) => {
                    if (data1 != undefined) {
                        let size = { width: 80, height: 80 };
                        data1.getThumbnail(size, (err2, pixelmap) => {
                            console.info('MediaLibraryTest : getThumbnail Successfull ' + pixelmap);
                            pixelmap.getImageInfo((error, info) => {
                                console.info('MediaLibraryTest : pixel image info ' + info);
                                console.info('MediaLibraryTest : pixel width ' + info.size.width);
                                console.info('MediaLibraryTest : pixel height ' + info.size.height);
                                expect(info.size.width == 80).assertTrue();
                                expect(info.size.height == 80).assertTrue();
                                done();
                            });
                        });
                    }
                });
            } else {
                console.info('MediaLibraryTest : getFileAssets Unsuccessfull ' + error.message);
                console.info('MediaLibraryTest : getFileAssets :FAIL');
                expect(false).assertTrue();
                done();
            }
        });
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GET_getThumbnail_04
     * @tc.name      : getThumbnail
     * @tc.desc      : getThumbnail by videoFetchOp & { width: 400, height: 400 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_GET_getThumbnail_04', 0, async function (done) {
        media.getFileAssets(videoFetchOp, (error, data) => {
            if (data != undefined) {
                console.info('MediaLibraryTest : getFileAssets Successfull ' + data.getCount());
                data.getFirstObject((err1, data1) => {
                    if (data1 != undefined) {
                        let size = { width: 400, height: 400 };
                        data1.getThumbnail(size, (err2, pixelmap) => {
                            console.info('MediaLibraryTest : getThumbnail Successfull ' + pixelmap);
                            pixelmap.getImageInfo((error, info) => {
                                console.info('MediaLibraryTest : pixel image info ' + info);
                                console.info('MediaLibraryTest : pixel width ' + info.size.width);
                                console.info('MediaLibraryTest : pixel height ' + info.size.height);
                                expect(info.size.width == 400).assertTrue();
                                expect(info.size.height == 400).assertTrue();
                                done();
                            });
                        });
                    }
                });
            } else {
                console.info('MediaLibraryTest : getFileAssets Unsuccessfull ' + error.message);
                console.info('MediaLibraryTest : getFileAssets :FAIL');
                expect(false).assertTrue();
                done();
            }
        });
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GET_getThumbnail_05
     * @tc.name      : getThumbnail
     * @tc.desc      : getThumbnail by audioFetchOp & { width: 400, height: 400 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_GET_getThumbnail_05', 0, async function (done) {
        media.getFileAssets(audioFetchOp, (error, data) => {
            if (data != undefined) {
                console.info('MediaLibraryTest : getFileAssets Successfull ' + data.getCount());
                data.getFirstObject((err1, data1) => {
                    if (data1 != undefined) {
                        let size = { width: 80, height: 80 };
                        data1.getThumbnail(size, (err2, pixelmap) => {
                            console.info('MediaLibraryTest : getThumbnail Successfull ' + pixelmap);
                            pixelmap.getImageInfo((error, info) => {
                                console.info('MediaLibraryTest : pixel image info ' + info);
                                console.info('MediaLibraryTest : pixel width ' + info.size.width);
                                console.info('MediaLibraryTest : pixel height ' + info.size.height);
                                expect(info.size.width == 80).assertTrue();
                                expect(info.size.height == 80).assertTrue();
                                done();
                            });
                        });
                    }
                });
            } else {
                console.info('MediaLibraryTest : getFileAssets Unsuccessfull ' + error.message);
                console.info('MediaLibraryTest : getFileAssets :FAIL');
                expect(false).assertTrue();
                done();
            }
        });
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GET_getThumbnail_06
     * @tc.name      : getThumbnail
     * @tc.desc      : getThumbnail by audioFetchOp & { width: 400, height: 400 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_GET_getThumbnail_06', 0, async function (done) {
        media.getFileAssets(audioFetchOp, (error, data) => {
            if (data != undefined) {
                console.info('MediaLibraryTest : getFileAssets Successfull ' + data.getCount());
                data.getFirstObject((err1, data1) => {
                    if (data1 != undefined) {
                        let size = { width: 400, height: 400 };
                        data1.getThumbnail(size, (err2, pixelmap) => {
                            console.info('MediaLibraryTest : getThumbnail Successfull ' + pixelmap);
                            pixelmap.getImageInfo((error, info) => {
                                console.info('MediaLibraryTest : pixel image info ' + info);
                                console.info('MediaLibraryTest : pixel width ' + info.size.width);
                                console.info('MediaLibraryTest : pixel height ' + info.size.height);
                                expect(info.size.width == 400).assertTrue();
                                expect(info.size.height == 400).assertTrue();
                                done();
                            });
                        });
                    }
                });
            } else {
                console.info('MediaLibraryTest : getFileAssets Unsuccessfull ' + error.message);
                console.info('MediaLibraryTest : getFileAssets :FAIL');
                expect(false).assertTrue();
                done();
            }
        });
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GET_getThumbnail_07
     * @tc.name      : getThumbnail
     * @tc.desc      : getThumbnail by fetchOp & & The default size
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_GET_getThumbnail_07', 0, async function (done) {
        media.getFileAssets(fetchOp, (error, data) => {
            if (data != undefined) {
                console.info('MediaLibraryTest : getFileAssets Successfull ' + data.getCount());
                data.getFirstObject((err1, data1) => {
                    if (data1 != undefined) {
                        let size = { width: 256, height: 256 };
                        data1.getThumbnail((err2, pixelmap) => {
                            console.info('MediaLibraryTest : getThumbnail Successfull ' + pixelmap);
                            pixelmap.getImageInfo((error, info) => {
                                console.info('MediaLibraryTest : pixel image info ' + info);
                                console.info('MediaLibraryTest : pixel width ' + info.size.width);
                                console.info('MediaLibraryTest : pixel height ' + info.size.height);
                                expect(info.size.width == size.width).assertTrue();
                                expect(info.size.height == size.height).assertTrue();
                                done();
                            });
                        });
                    }
                });
            } else {
                console.info('MediaLibraryTest : getFileAssets Unsuccessfull ' + error.message);
                console.info('MediaLibraryTest : getFileAssets :FAIL');
                expect(false).assertTrue();
                done();
            }
        });
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GET_getThumbnail_08
     * @tc.name      : getThumbnail
     * @tc.desc      : getThumbnail by fetchOp & { width: 1, height: 1 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_GET_getThumbnail_08', 0, async function (done) {
        media.getFileAssets(fetchOp, (error, data) => {
            if (data != undefined) {
                console.info('MediaLibraryTest : getFileAssets Successfull ' + data.getCount());
                data.getFirstObject((err1, data1) => {
                    if (data1 != undefined) {
                        let size = { width: 1, height: 1 };
                        data1.getThumbnail(size, (err2, pixelmap) => {
                            console.info('MediaLibraryTest : getThumbnail Successfull ' + pixelmap);
                            pixelmap.getImageInfo((error, info) => {
                                console.info('MediaLibraryTest : pixel image info ' + info);
                                console.info('MediaLibraryTest : pixel width ' + info.size.width);
                                console.info('MediaLibraryTest : pixel height ' + info.size.height);
                                expect(info.size.width == size.width).assertTrue();
                                expect(info.size.height == size.height).assertTrue();
                                done();
                            });
                        });
                    }
                });
            } else {
                console.info('MediaLibraryTest : getFileAssets Unsuccessfull ' + error.message);
                console.info('MediaLibraryTest : getFileAssets :FAIL');
                expect(false).assertTrue();
                done();
            }
        });
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GET_getThumbnail_09
     * @tc.name      : getThumbnail
     * @tc.desc      : getThumbnail by fetchOp & { width: 0, height: 0 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_GET_getThumbnail_08', 0, async function (done) {
        media.getFileAssets(fetchOp, (error, data) => {
            if (data != undefined) {
                console.info('MediaLibraryTest : getFileAssets Successfull ' + data.getCount());
                data.getFirstObject((err1, data1) => {
                    if (data1 != undefined) {
                        let size = { width: 0, height: 0 };
                        data1.getThumbnail(size, (err2, pixelmap) => {
                            console.info('MediaLibraryTest : getThumbnail Successfull ' + pixelmap);
                            pixelmap.getImageInfo((error, info) => {
                                console.info('MediaLibraryTest : pixel image info ' + info);
                                console.info('MediaLibraryTest : pixel width ' + info.size.width);
                                console.info('MediaLibraryTest : pixel height ' + info.size.height);
                                expect(false).assertTrue();
                                done();
                            });
                        });
                    }
                });
            } else {
                console.info('MediaLibraryTest : getFileAssets Unsuccessfull ' + error.message);
                console.info('MediaLibraryTest : getFileAssets :FAIL');
                expect(true).assertTrue();
                done();
            }
        });
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GET_getThumbnail_010
     * @tc.name      : getThumbnail
     * @tc.desc      : getThumbnail by fetchOp & { width: -80, height: -80 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_GET_getThumbnail_09', 0, async function (done) {
        media.getFileAssets(fetchOp, (error, data) => {
            if (data != undefined) {
                console.info('MediaLibraryTest : getFileAssets Successfull ' + data.getCount());
                data.getFirstObject((err1, data1) => {
                    if (data1 != undefined) {
                        let size = { width: -80, height: -80 };
                        data1.getThumbnail(size, (err2, pixelmap) => {
                            console.info('MediaLibraryTest : getThumbnail Successfull ' + pixelmap);
                            pixelmap.getImageInfo((error, info) => {
                                console.info('MediaLibraryTest : pixel image info ' + info);
                                console.info('MediaLibraryTest : pixel width ' + info.size.width);
                                console.info('MediaLibraryTest : pixel height ' + info.size.height);
                                expect(false).assertTrue();
                                done();
                            });
                        });
                    }
                });
            } else {
                console.info('MediaLibraryTest : getFileAssets Unsuccessfull ' + error.message);
                console.info('MediaLibraryTest : getFileAssets :FAIL');
                expect(true).assertTrue();
                done();
            }
        });
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GET_getThumbnail_011
     * @tc.name      : getThumbnail
     * @tc.desc      : getThumbnail by videoFetchOp & & The default size
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_GET_getThumbnail_07', 0, async function (done) {
        media.getFileAssets(videoFetchOp, (error, data) => {
            if (data != undefined) {
                console.info('MediaLibraryTest : getFileAssets Successfull ' + data.getCount());
                data.getFirstObject((err1, data1) => {
                    if (data1 != undefined) {
                        let size = { width: 256, height: 256 };
                        data1.getThumbnail((err2, pixelmap) => {
                            console.info('MediaLibraryTest : getThumbnail Successfull ' + pixelmap);
                            pixelmap.getImageInfo((error, info) => {
                                console.info('MediaLibraryTest : pixel image info ' + info);
                                console.info('MediaLibraryTest : pixel width ' + info.size.width);
                                console.info('MediaLibraryTest : pixel height ' + info.size.height);
                                expect(info.size.width == size.width).assertTrue();
                                expect(info.size.height == size.height).assertTrue();
                                done();
                            });
                        });
                    }
                });
            } else {
                console.info('MediaLibraryTest : getFileAssets Unsuccessfull ' + error.message);
                console.info('MediaLibraryTest : getFileAssets :FAIL');
                expect(false).assertTrue();
                done();
            }
        });
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GET_getThumbnail_012
     * @tc.name      : getThumbnail
     * @tc.desc      : getThumbnail by videoFetchOp & { width: 1, height: 1 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_GET_getThumbnail_012', 0, async function (done) {
        media.getFileAssets(videoFetchOp, (error, data) => {
            if (data != undefined) {
                console.info('MediaLibraryTest : getFileAssets Successfull ' + data.getCount());
                data.getFirstObject((err1, data1) => {
                    if (data1 != undefined) {
                        let size = { width: 1, height: 1 };
                        data1.getThumbnail(size, (err2, pixelmap) => {
                            console.info('MediaLibraryTest : getThumbnail Successfull ' + pixelmap);
                            pixelmap.getImageInfo((error, info) => {
                                console.info('MediaLibraryTest : pixel image info ' + info);
                                console.info('MediaLibraryTest : pixel width ' + info.size.width);
                                console.info('MediaLibraryTest : pixel height ' + info.size.height);
                                expect(info.size.width == size.width).assertTrue();
                                expect(info.size.height == size.height).assertTrue();
                                done();
                            });
                        });
                    }
                });
            } else {
                console.info('MediaLibraryTest : getFileAssets Unsuccessfull ' + error.message);
                console.info('MediaLibraryTest : getFileAssets :FAIL');
                expect(false).assertTrue();
                done();
            }
        });
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GET_getThumbnail_013
     * @tc.name      : getThumbnail
     * @tc.desc      : getThumbnail by videoFetchOp & { width: 0, height: 0 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_GET_getThumbnail_013', 0, async function (done) {
        media.getFileAssets(videoFetchOp, (error, data) => {
            if (data != undefined) {
                console.info('MediaLibraryTest : getFileAssets Successfull ' + data.getCount());
                data.getFirstObject((err1, data1) => {
                    if (data1 != undefined) {
                        let size = { width: 0, height: 0 };
                        data1.getThumbnail(size, (err2, pixelmap) => {
                            console.info('MediaLibraryTest : getThumbnail Successfull ' + pixelmap);
                            pixelmap.getImageInfo((error, info) => {
                                console.info('MediaLibraryTest : pixel image info ' + info);
                                console.info('MediaLibraryTest : pixel width ' + info.size.width);
                                console.info('MediaLibraryTest : pixel height ' + info.size.height);
                                expect(false).assertTrue();
                                done();
                            });
                        });
                    }
                });
            } else {
                console.info('MediaLibraryTest : getFileAssets Unsuccessfull ' + error.message);
                console.info('MediaLibraryTest : getFileAssets :FAIL');
                expect(true).assertTrue();
                done();
            }
        });
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GET_getThumbnail_014
     * @tc.name      : getThumbnail
     * @tc.desc      : getThumbnail by videoFetchOp & { width: -80, height: -80 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_GET_getThumbnail_014', 0, async function (done) {
        media.getFileAssets(videoFetchOp, (error, data) => {
            if (data != undefined) {
                console.info('MediaLibraryTest : getFileAssets Successfull ' + data.getCount());
                data.getFirstObject((err1, data1) => {
                    if (data1 != undefined) {
                        let size = { width: -80, height: -80 };
                        data1.getThumbnail(size, (err2, pixelmap) => {
                            console.info('MediaLibraryTest : getThumbnail Successfull ' + pixelmap);
                            pixelmap.getImageInfo((error, info) => {
                                console.info('MediaLibraryTest : pixel image info ' + info);
                                console.info('MediaLibraryTest : pixel width ' + info.size.width);
                                console.info('MediaLibraryTest : pixel height ' + info.size.height);
                                expect(false).assertTrue();
                                done();
                            });
                        });
                    }
                });
            } else {
                console.info('MediaLibraryTest : getFileAssets Unsuccessfull ' + error.message);
                console.info('MediaLibraryTest : getFileAssets :FAIL');
                expect(true).assertTrue();
                done();
            }
        });
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GET_getThumbnail_015
     * @tc.name      : getThumbnail
     * @tc.desc      : getThumbnail by audioFetchOp & & The default size
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_GET_getThumbnail_015', 0, async function (done) {
        media.getFileAssets(audioFetchOp, (error, data) => {
            if (data != undefined) {
                console.info('MediaLibraryTest : getFileAssets Successfull ' + data.getCount());
                data.getFirstObject((err1, data1) => {
                    if (data1 != undefined) {
                        let size = { width: 256, height: 256 };
                        data1.getThumbnail((err2, pixelmap) => {
                            console.info('MediaLibraryTest : getThumbnail Successfull ' + pixelmap);
                            pixelmap.getImageInfo((error, info) => {
                                console.info('MediaLibraryTest : pixel image info ' + info);
                                console.info('MediaLibraryTest : pixel width ' + info.size.width);
                                console.info('MediaLibraryTest : pixel height ' + info.size.height);
                                expect(info.size.width == size.width).assertTrue();
                                expect(info.size.height == size.height).assertTrue();
                                done();
                            });
                        });
                    }
                });
            } else {
                console.info('MediaLibraryTest : getFileAssets Unsuccessfull ' + error.message);
                console.info('MediaLibraryTest : getFileAssets :FAIL');
                expect(false).assertTrue();
                done();
            }
        });
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GET_getThumbnail_016
     * @tc.name      : getThumbnail
     * @tc.desc      : getThumbnail by audioFetchOp & { width: 1, height: 1 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_GET_getThumbnail_016', 0, async function (done) {
        media.getFileAssets(audioFetchOp, (error, data) => {
            if (data != undefined) {
                console.info('MediaLibraryTest : getFileAssets Successfull ' + data.getCount());
                data.getFirstObject((err1, data1) => {
                    if (data1 != undefined) {
                        let size = { width: 1, height: 1 };
                        data1.getThumbnail(size, (err2, pixelmap) => {
                            console.info('MediaLibraryTest : getThumbnail Successfull ' + pixelmap);
                            pixelmap.getImageInfo((error, info) => {
                                console.info('MediaLibraryTest : pixel image info ' + info);
                                console.info('MediaLibraryTest : pixel width ' + info.size.width);
                                console.info('MediaLibraryTest : pixel height ' + info.size.height);
                                expect(info.size.width == size.width).assertTrue();
                                expect(info.size.height == size.height).assertTrue();
                                done();
                            });
                        });
                    }
                });
            } else {
                console.info('MediaLibraryTest : getFileAssets Unsuccessfull ' + error.message);
                console.info('MediaLibraryTest : getFileAssets :FAIL');
                expect(false).assertTrue();
                done();
            }
        });
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GET_getThumbnail_017
     * @tc.name      : getThumbnail
     * @tc.desc      : getThumbnail by audioFetchOp & { width: 0, height: 0 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_GET_getThumbnail_017', 0, async function (done) {
        media.getFileAssets(audioFetchOp, (error, data) => {
            if (data != undefined) {
                console.info('MediaLibraryTest : getFileAssets Successfull ' + data.getCount());
                data.getFirstObject((err1, data1) => {
                    if (data1 != undefined) {
                        let size = { width: 0, height: 0 };
                        data1.getThumbnail(size, (err2, pixelmap) => {
                            console.info('MediaLibraryTest : getThumbnail Successfull ' + pixelmap);
                            pixelmap.getImageInfo((error, info) => {
                                console.info('MediaLibraryTest : pixel image info ' + info);
                                console.info('MediaLibraryTest : pixel width ' + info.size.width);
                                console.info('MediaLibraryTest : pixel height ' + info.size.height);
                                expect(false).assertTrue();
                                done();
                            });
                        });
                    }
                });
            } else {
                console.info('MediaLibraryTest : getFileAssets Unsuccessfull ' + error.message);
                console.info('MediaLibraryTest : getFileAssets :FAIL');
                expect(true).assertTrue();
                done();
            }
        });
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GET_getThumbnail_018
     * @tc.name      : getThumbnail
     * @tc.desc      : getThumbnail by audioFetchOp & { width: -80, height: -80 }
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_GET_getThumbnail_018', 0, async function (done) {
        media.getFileAssets(audioFetchOp, (error, data) => {
            if (data != undefined) {
                console.info('MediaLibraryTest : getFileAssets Successfull ' + data.getCount());
                data.getFirstObject((err1, data1) => {
                    if (data1 != undefined) {
                        let size = { width: -80, height: -80 };
                        data1.getThumbnail(size, (err2, pixelmap) => {
                            console.info('MediaLibraryTest : getThumbnail Successfull ' + pixelmap);
                            pixelmap.getImageInfo((error, info) => {
                                console.info('MediaLibraryTest : pixel image info ' + info);
                                console.info('MediaLibraryTest : pixel width ' + info.size.width);
                                console.info('MediaLibraryTest : pixel height ' + info.size.height);
                                expect(false).assertTrue();
                                done();
                            });
                        });
                    }
                });
            } else {
                console.info('MediaLibraryTest : getFileAssets Unsuccessfull ' + error.message);
                console.info('MediaLibraryTest : getFileAssets :FAIL');
                expect(true).assertTrue();
                done();
            }
        });
    });
});
