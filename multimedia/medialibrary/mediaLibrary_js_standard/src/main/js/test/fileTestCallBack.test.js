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
import fileio from '@ohos.fileio';

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'deccjsunit/index';
let fileKeyObj = mediaLibrary.FileKey;
let fileType = mediaLibrary.MediaType.FILE;
let imageType = mediaLibrary.MediaType.IMAGE;
let videoType = mediaLibrary.MediaType.VIDEO;
let audioType = mediaLibrary.MediaType.AUDIO;

let imagesfetchOp = {
    selections: fileKeyObj.MEDIA_TYPE + '= ?',
    selectionArgs: [imageType.toString()],
};
let videosfetchOp = {
    selections: fileKeyObj.MEDIA_TYPE + '= ?',
    selectionArgs: [videoType.toString()],
};
let audiosfetchOp = {
    selections: fileKeyObj.MEDIA_TYPE + '= ?',
    selectionArgs: [audioType.toString()],
};
let filesfetchOp = {
    selections: fileKeyObj.MEDIA_TYPE + '= ?',
    selectionArgs: [fileType.toString()],
};

function checkAssetAttr(done, attr, test_num, asset, checkType) {
    if (checkType && asset[attr] != checkType) {
        console.info(`MediaLibraryTest : ASSET_CALLBACK createAsset ${test_num} failed`);
        expect(false).assertTrue();
        done();
    } else if (asset[attr] == undefined) {
        console.info(`MediaLibraryTest : ASSET_CALLBACK createAsset ${test_num} failed`);
        expect(false).assertTrue();
        done();
    }
}

function executeAtError(test_num, error, done) {
    console.info(
        `MediaLibraryTest : ASSET_CALLBACK createAsset ${test_num} failed, message = ${error}`
    );
    expect(false).assertTrue();
    if (typeof done === 'function') {
        done();
    }
}
describe('fileTestCallBack.test', function () {
    var context = featureAbility.getContext();
    console.info('MediaLibraryTest : getMediaLibrary IN');
    var media = mediaLibrary.getMediaLibrary(context);
    console.info('MediaLibraryTest : getMediaLibrary OUT');
    beforeAll(function () { });
    beforeEach(function () { });
    afterEach(function () { });
    afterAll(function () { });

    function copyFile(fd1, fd2, test_num, done, callback) {
        try {
            fileio.fstat(fd1, (error, stat) => {
                let buf = new ArrayBuffer(stat.size);
                try {
                    fileio.read(fd1, buf, () => {
                        try {
                            fileio.write(fd2, buf, () => {
                                try {
                                    if (typeof callback === 'function') {
                                        callback();
                                    }
                                } catch (error) {
                                    executeAtError(test_num, error, done);
                                }
                            });
                        } catch (error) {
                            executeAtError(test_num, error, done);
                        }
                    });
                } catch (error) {
                    executeAtError(test_num, error, done);
                }
            });
        } catch (error) {
            executeAtError(test_num, error, done);
        }
    }

    // ------------------------------- image type start ----------------------------
    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_001_01
     * @tc.name      : createAsset
     * @tc.desc      : Insert two database records, read a unique identifier, expectations are not equal
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_001_01', 0, async function (done) {
        const test_num = '001_01';
        try {
            media.getPublicDirectory(mediaLibrary.DirectoryType.DIR_IMAGE, (error, path) => {
                try {
                    media.getFileAssets(imagesfetchOp, (error, fileAssets) => {
                        try {
                            fileAssets.getAllObject((error, dataList) => {
                                try {
                                    const asset1 = dataList[0];
                                    media.createAsset(
                                        imageType,
                                        'image03.jpg',
                                        path,
                                        (error, creatAsset1) => {
                                            try {
                                                asset1.open('rw', (error, fd1) => {
                                                    try {
                                                        creatAsset1.open(
                                                            'rw',
                                                            (error, creatAssetFd1) => {
                                                                try {
                                                                    copyFile(
                                                                        fd1,
                                                                        creatAssetFd1,
                                                                        test_num,
                                                                        done,
                                                                        () => {
                                                                            try {
                                                                                creatAsset1.close(
                                                                                    creatAssetFd1,
                                                                                    () => {
                                                                                        try {
                                                                                            asset1.close(
                                                                                                fd1,
                                                                                                () => {
                                                                                                    try {
                                                                                                        const asset2 =
                                                                                                            dataList[1];
                                                                                                        media.createAsset(
                                                                                                            imageType,
                                                                                                            'image04.jpg',
                                                                                                            path,
                                                                                                            (
                                                                                                                error,
                                                                                                                creatAsset2
                                                                                                            ) => {
                                                                                                                try {
                                                                                                                    asset2.open(
                                                                                                                        'rw',
                                                                                                                        (
                                                                                                                            error,
                                                                                                                            fd2
                                                                                                                        ) => {
                                                                                                                            try {
                                                                                                                                creatAsset2.open(
                                                                                                                                    'rw',
                                                                                                                                    (
                                                                                                                                        error,
                                                                                                                                        creatAssetFd2
                                                                                                                                    ) => {
                                                                                                                                        try {
                                                                                                                                            copyFile(
                                                                                                                                                fd2,
                                                                                                                                                creatAssetFd2,
                                                                                                                                                test_num,
                                                                                                                                                done,
                                                                                                                                                () => {
                                                                                                                                                    creatAsset2.close(
                                                                                                                                                        creatAssetFd2,
                                                                                                                                                        () => {
                                                                                                                                                            asset2.close(
                                                                                                                                                                fd2,
                                                                                                                                                                () => {
                                                                                                                                                                    if (
                                                                                                                                                                        creatAsset1.id !=
                                                                                                                                                                        creatAsset2.id
                                                                                                                                                                    ) {
                                                                                                                                                                        console.info(
                                                                                                                                                                            `MediaLibraryTest : ASSET_CALLBACK createAsset ${test_num} passed`
                                                                                                                                                                        );
                                                                                                                                                                        expect(
                                                                                                                                                                            true
                                                                                                                                                                        ).assertTrue();
                                                                                                                                                                        done();
                                                                                                                                                                    } else {
                                                                                                                                                                        console.info(
                                                                                                                                                                            `MediaLibraryTest : ASSET_CALLBACK createAsset ${test_num} failed`
                                                                                                                                                                        );
                                                                                                                                                                        expect(
                                                                                                                                                                            false
                                                                                                                                                                        ).assertTrue();
                                                                                                                                                                        done();
                                                                                                                                                                    }
                                                                                                                                                                }
                                                                                                                                                            );
                                                                                                                                                        }
                                                                                                                                                    );
                                                                                                                                                }
                                                                                                                                            );
                                                                                                                                        } catch (error) {
                                                                                                                                            executeAtError(
                                                                                                                                                test_num,
                                                                                                                                                error,
                                                                                                                                                done
                                                                                                                                            );
                                                                                                                                        }
                                                                                                                                    }
                                                                                                                                );
                                                                                                                            } catch (error) {
                                                                                                                                executeAtError(
                                                                                                                                    test_num,
                                                                                                                                    error,
                                                                                                                                    done
                                                                                                                                );
                                                                                                                            }
                                                                                                                        }
                                                                                                                    );
                                                                                                                } catch (error) {
                                                                                                                    executeAtError(
                                                                                                                        test_num,
                                                                                                                        error,
                                                                                                                        done
                                                                                                                    );
                                                                                                                }
                                                                                                            }
                                                                                                        );
                                                                                                    } catch (error) {
                                                                                                        executeAtError(
                                                                                                            test_num,
                                                                                                            error,
                                                                                                            done
                                                                                                        );
                                                                                                    }
                                                                                                }
                                                                                            );
                                                                                        } catch (error) {
                                                                                            executeAtError(
                                                                                                test_num,
                                                                                                error,
                                                                                                done
                                                                                            );
                                                                                        }
                                                                                    }
                                                                                );
                                                                            } catch (error) {
                                                                                executeAtError(
                                                                                    test_num,
                                                                                    error,
                                                                                    done
                                                                                );
                                                                            }
                                                                        }
                                                                    );
                                                                } catch (error) {
                                                                    executeAtError(
                                                                        test_num,
                                                                        error,
                                                                        done
                                                                    );
                                                                }
                                                            }
                                                        );
                                                    } catch (error) {
                                                        executeAtError(test_num, error, done);
                                                    }
                                                });
                                            } catch (error) {
                                                executeAtError(test_num, error, done);
                                            }
                                        }
                                    );
                                } catch (error) {
                                    executeAtError(test_num, error, done);
                                }
                            });
                        } catch (error) {
                            executeAtError(test_num, error, done);
                        }
                    });
                } catch (error) {
                    executeAtError(test_num, error, done);
                }
            });
        } catch (error) {
            executeAtError(test_num, error, done);
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_001_02
     * @tc.name      : createAsset
     * @tc.desc      : Access to the file displayName and validation is not undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_001_02', 0, async function (done) {
        const test_num = '001_02';
        try {
            media.getFileAssets(imagesfetchOp, (error, fileAssets) => {
                try {
                    fileAssets.getAllObject((error, dataList) => {
                        const firstAsset = dataList[0];
                        checkAssetAttr(done, 'displayName', test_num, firstAsset);
                        const midAsset = dataList[Math.floor(dataList.length / 2)];
                        checkAssetAttr(done, 'displayName', test_num, midAsset);
                        const lastAsset = dataList[dataList.length - 1];
                        checkAssetAttr(done, 'displayName', test_num, lastAsset);
                        console.info(
                            `MediaLibraryTest : ASSET_CALLBACK createAsset ${test_num} passed`
                        );
                        expect(true).assertTrue();
                        done();
                    });
                } catch (error) {
                    executeAtError(test_num, error, done);
                }
            });
        } catch (error) {
            executeAtError(test_num, error, done);
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_001_03
     * @tc.name      : createAsset
     * @tc.desc      : Access to the file relativePath  and validation is not undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_001_03', 0, async function (done) {
        const test_num = '001_03';
        try {
            media.getFileAssets(imagesfetchOp, (error, fileAssets) => {
                try {
                    fileAssets.getAllObject((error, dataList) => {
                        try {
                            const firstAsset = dataList[0];
                            checkAssetAttr(done, 'relativePath', test_num, firstAsset);

                            const midAsset = dataList[Math.floor(dataList.length / 2)];
                            checkAssetAttr(done, 'relativePath', test_num, midAsset);

                            const lastAsset = dataList[dataList.length - 1];
                            checkAssetAttr(done, 'relativePath', test_num, lastAsset);

                            console.info(
                                `MediaLibraryTest : ASSET_CALLBACK createAsset ${test_num} passed`
                            );
                            expect(true).assertTrue();
                            done();
                        } catch (error) {
                            executeAtError(test_num, error, done);
                        }
                    });
                } catch (error) {
                    executeAtError(test_num, error, done);
                }
            });
        } catch (error) {
            executeAtError(test_num, error, done);
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_001_04
     * @tc.name      : createAsset
     * @tc.desc      : Access to the file size and validation is not undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_001_04', 0, async function (done) {
        const test_num = '001_04';
        try {
            media.getFileAssets(imagesfetchOp, (error, fileAssets) => {
                try {
                    fileAssets.getAllObject((error, dataList) => {
                        const firstAsset = dataList[0];
                        checkAssetAttr(done, 'size', test_num, firstAsset);

                        const midAsset = dataList[Math.floor(dataList.length / 2)];
                        checkAssetAttr(done, 'size', test_num, midAsset);

                        const lastAsset = dataList[dataList.length - 1];
                        checkAssetAttr(done, 'size', test_num, lastAsset);
                        console.info(
                            `MediaLibraryTest : ASSET_CALLBACK createAsset ${test_num} passed`
                        );
                        expect(true).assertTrue();
                        done();
                    });
                } catch (error) {
                    executeAtError(test_num, error, done);
                }
            });
        } catch (error) {
            executeAtError(test_num, error, done);
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_001_05
     * @tc.name      : createAsset
     * @tc.desc      : Access to the file dateAdded and validation is not undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_001_05', 0, async function (done) {
        const test_num = '001_05';
        try {
            media.getFileAssets(imagesfetchOp, (error, fileAssets) => {
                try {
                    fileAssets.getAllObject((error, dataList) => {
                        try {
                            const firstAsset = dataList[0];
                            checkAssetAttr(done, 'dateAdded', test_num, firstAsset);

                            const midAsset = dataList[Math.floor(dataList.length / 2)];
                            checkAssetAttr(done, 'dateAdded', test_num, midAsset);

                            const lastAsset = dataList[dataList.length - 1];
                            checkAssetAttr(done, 'dateAdded', test_num, lastAsset);

                            console.info(
                                `MediaLibraryTest : ASSET_CALLBACK createAsset ${test_num} passed`
                            );
                            expect(true).assertTrue();
                            done();
                        } catch (error) {
                            executeAtError(test_num, error, done);
                        }
                    });
                } catch (error) {
                    executeAtError(test_num, error, done);
                }
            });
        } catch (error) {
            executeAtError(test_num, error, done);
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_001_07
     * @tc.name      : createAsset
     * @tc.desc      : Access to the file dateModified and validation is not undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_001_07', 0, async function (done) {
        const test_num = '001_07';
        try {
            media.getFileAssets(imagesfetchOp, (error, fileAssets) => {
                try {
                    fileAssets.getAllObject((error, dataList) => {
                        try {
                            const asset = dataList[0];
                            asset.title = `title_${new Date().getTime()}`;
                            asset.commitModify(() => {
                                try {
                                    const id = asset.id;
                                    const idOP = {
                                        selections: fileKeyObj.ID + '= ?',
                                        selectionArgs: ['' + id],
                                    };
                                    media.getFileAssets(idOP, (error, newAssets) => {
                                        try {
                                            newAssets.getAllObject((error, newdataList) => {
                                                try {
                                                    const newAsset = newdataList[0];
                                                    if (asset.dateModified != undefined) {
                                                        if (
                                                            newAsset.dateModified !=
                                                            asset.dateModified
                                                        ) {
                                                            console.info(
                                                                `MediaLibraryTest : ASSET_CALLBACK createAsset ${test_num} passed`
                                                            );
                                                            expect(true).assertTrue();
                                                            done();
                                                        } else {
                                                            console.info(
                                                                `MediaLibraryTest : ASSET_CALLBACK createAsset ${test_num} failed`
                                                            );
                                                            expect(false).assertTrue();
                                                            done();
                                                        }
                                                    } else if (newAsset.dateModified != undefined) {
                                                        console.info(
                                                            `MediaLibraryTest : ASSET_CALLBACK createAsset ${test_num} passed`
                                                        );
                                                        expect(true).assertTrue();
                                                        done();
                                                    } else {
                                                        console.info(
                                                            `MediaLibraryTest : ASSET_CALLBACK createAsset ${test_num} failed`
                                                        );
                                                        expect(false).assertTrue();
                                                        done();
                                                    }

                                                } catch (error) {
                                                    executeAtError(test_num, error, done);
                                                }
                                            });
                                        } catch (error) {
                                            executeAtError(test_num, error, done);
                                        }
                                    });
                                } catch (error) {
                                    executeAtError(test_num, error, done);
                                }
                            });
                        } catch (error) {
                            executeAtError(test_num, error, done);
                        }
                    });
                } catch (error) {
                    executeAtError(test_num, error, done);
                }
            });
        } catch (error) {
            executeAtError(test_num, error, done);
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_001_08
     * @tc.name      : createAsset
     * @tc.desc      : Insert a picture record, the retrieve attributes for images
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_001_08', 0, async function (done) {
        const test_num = '001_08';
        try {
            media.getFileAssets(imagesfetchOp, (error, fileAssets) => {
                try {
                    fileAssets.getAllObject((error, dataList) => {
                        try {
                            const firstAsset = dataList[0];
                            checkAssetAttr(done, 'mediaType', test_num, firstAsset, imageType);

                            const midAsset = dataList[Math.floor(dataList.length / 2)];
                            checkAssetAttr(done, 'mediaType', test_num, midAsset, imageType);

                            const lastAsset = dataList[dataList.length - 1];
                            checkAssetAttr(done, 'mediaType', test_num, lastAsset, imageType);

                            console.info(
                                `MediaLibraryTest : ASSET_CALLBACK createAsset ${test_num} passed`
                            );
                            expect(true).assertTrue();
                            done();
                        } catch (error) {
                            executeAtError(test_num, error, done);
                        }
                    });
                } catch (error) {
                    executeAtError(test_num, error, done);
                }
            });
        } catch (error) {
            executeAtError(test_num, error, done);
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_001_09
     * @tc.name      : createAsset
     * @tc.desc      : Get the width attribute
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_001_09', 0, async function (done) {
        const test_num = '001_09';
        try {
            media.getFileAssets(imagesfetchOp, (error, fileAssets) => {
                try {
                    fileAssets.getAllObject((error, dataList) => {
                        try {
                            const firstAsset = dataList[0];
                            checkAssetAttr(done, 'width', test_num, firstAsset);

                            const midAsset = dataList[Math.floor(dataList.length / 2)];
                            checkAssetAttr(done, 'width', test_num, midAsset);

                            const lastAsset = dataList[dataList.length - 1];
                            checkAssetAttr(done, 'width', test_num, lastAsset);

                            console.info(
                                `MediaLibraryTest : ASSET_CALLBACK createAsset ${test_num} passed`
                            );
                            expect(true).assertTrue();
                            done();
                        } catch (error) {
                            executeAtError(test_num, error, done);
                        }
                    });
                } catch (error) {
                    executeAtError(test_num, error, done);
                }
            });
        } catch (error) {
            executeAtError(test_num, error, done);
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_001_10
     * @tc.name      : createAsset
     * @tc.desc      : Get the height attribute
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_001_10', 0, async function (done) {
        const test_num = '001_10';
        try {
            media.getFileAssets(imagesfetchOp, (error, fileAssets) => {
                try {
                    fileAssets.getAllObject((error, dataList) => {
                        try {
                            const firstAsset = dataList[0];
                            checkAssetAttr(done, 'height', test_num, firstAsset);

                            const midAsset = dataList[Math.floor(dataList.length / 2)];
                            checkAssetAttr(done, 'height', test_num, midAsset);

                            const lastAsset = dataList[dataList.length - 1];
                            checkAssetAttr(done, 'height', test_num, lastAsset);

                            console.info(
                                `MediaLibraryTest : ASSET_CALLBACK createAsset ${test_num} passed`
                            );
                            expect(true).assertTrue();
                            done();
                        } catch (error) {
                            executeAtError(test_num, error, done);
                        }
                    });
                } catch (error) {
                    executeAtError(test_num, error, done);
                }
            });
        } catch (error) {
            executeAtError(test_num, error, done);
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_001_11
     * @tc.name      : createAsset
     * @tc.desc      : Get the orientaion attribute
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_001_11', 0, async function (done) {
        const test_num = '001_11';
        try {
            media.getFileAssets(imagesfetchOp, (error, fileAssets) => {
                try {
                    fileAssets.getAllObject((error, dataList) => {
                        try {
                            const firstAsset = dataList[0];
                            checkAssetAttr(done, 'orientation', test_num, firstAsset);

                            const midAsset = dataList[Math.floor(dataList.length / 2)];
                            checkAssetAttr(done, 'orientation', test_num, midAsset);

                            const lastAsset = dataList[dataList.length - 1];
                            checkAssetAttr(done, 'orientation', test_num, lastAsset);

                            console.info(
                                `MediaLibraryTest : ASSET_CALLBACK createAsset ${test_num} passed`
                            );
                            expect(true).assertTrue();
                            done();
                        } catch (error) {
                            executeAtError(test_num, error, done);
                        }
                    });
                } catch (error) {
                    executeAtError(test_num, error, done);
                }
            });
        } catch (error) {
            executeAtError(test_num, error, done);
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_001_12
     * @tc.name      : createAsset
     * @tc.desc      : Insert a picture record and get the property as picture
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_001_12', 0, async function (done) {
        const test_num = '001_12';
        try {
            media.getPublicDirectory(mediaLibrary.DirectoryType.DIR_IMAGE, (error, path) => {
                try {
                    media.getFileAssets(imagesfetchOp, (error, fileAssets) => {
                        try {
                            fileAssets.getAllObject((error, dataList) => {
                                try {
                                    const asset1 = dataList[0];
                                    media.createAsset(
                                        imageType,
                                        'image3.jpg',
                                        path,
                                        (error, creatAsset1) => {
                                            try {
                                                asset1.open('rw', (error, fd1) => {
                                                    try {
                                                        creatAsset1.open(
                                                            'rw',
                                                            (error, creatAssetFd1) => {
                                                                try {
                                                                    copyFile(
                                                                        fd1,
                                                                        creatAssetFd1,
                                                                        test_num,
                                                                        done,
                                                                        () => {
                                                                            try {
                                                                                creatAsset1.close(
                                                                                    creatAssetFd1,
                                                                                    () => {
                                                                                        try {
                                                                                            asset1.close(
                                                                                                fd1,
                                                                                                () => {
                                                                                                    if (
                                                                                                        creatAsset1.mediaType ==
                                                                                                        imageType
                                                                                                    ) {
                                                                                                        console.info(
                                                                                                            `MediaLibraryTest : ASSET_CALLBACK createAsset ${test_num} passed`
                                                                                                        );
                                                                                                        expect(
                                                                                                            true
                                                                                                        ).assertTrue();
                                                                                                        done();
                                                                                                    } else {
                                                                                                        console.info(
                                                                                                            `MediaLibraryTest : ASSET_CALLBACK createAsset ${test_num} failed`
                                                                                                        );
                                                                                                        expect(
                                                                                                            false
                                                                                                        ).assertTrue();
                                                                                                        done();
                                                                                                    }
                                                                                                }
                                                                                            );
                                                                                        } catch (error) {
                                                                                            executeAtError(
                                                                                                test_num,
                                                                                                error,
                                                                                                done
                                                                                            );
                                                                                        }
                                                                                    }
                                                                                );
                                                                            } catch (error) {
                                                                                executeAtError(
                                                                                    test_num,
                                                                                    error,
                                                                                    done
                                                                                );
                                                                            }
                                                                        }
                                                                    );
                                                                } catch (error) {
                                                                    executeAtError(
                                                                        test_num,
                                                                        error,
                                                                        done
                                                                    );
                                                                }
                                                            }
                                                        );
                                                    } catch (error) {
                                                        executeAtError(test_num, error, done);
                                                    }
                                                });
                                            } catch (error) {
                                                executeAtError(test_num, error, done);
                                            }
                                        }
                                    );
                                } catch (error) {
                                    executeAtError(test_num, error, done);
                                }
                            });
                        } catch (error) {
                            executeAtError(test_num, error, done);
                        }
                    });
                } catch (error) {
                    executeAtError(test_num, error, done);
                }
            });
        } catch (error) {
            executeAtError(test_num, error, done);
        }
    });
    // -------------------------------  image type end -----------------------------

    // ------------------------------- video type start ----------------------------
    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_002_01
     * @tc.name      : createAsset
     * @tc.desc      : Insert two database records, read a unique identifier, expectations are not equal
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_002_01', 0, async function (done) {
        const test_num = '002_01';
        try {
            media.getPublicDirectory(mediaLibrary.DirectoryType.DIR_VIDEO, (error, path) => {
                try {
                    media.getFileAssets(videosfetchOp, (error, fileAssets) => {
                        try {
                            fileAssets.getAllObject((error, dataList) => {
                                try {
                                    const asset1 = dataList[0];
                                    media.createAsset(
                                        videoType,
                                        'video03.mp4',
                                        path,
                                        (error, creatAsset1) => {
                                            try {
                                                asset1.open('rw', (error, fd1) => {
                                                    try {
                                                        creatAsset1.open(
                                                            'rw',
                                                            (error, creatAssetFd1) => {
                                                                try {
                                                                    copyFile(
                                                                        fd1,
                                                                        creatAssetFd1,
                                                                        test_num,
                                                                        done,
                                                                        () => {
                                                                            try {
                                                                                creatAsset1.close(
                                                                                    creatAssetFd1,
                                                                                    () => {
                                                                                        try {
                                                                                            asset1.close(
                                                                                                fd1,
                                                                                                () => {
                                                                                                    try {
                                                                                                        const asset2 =
                                                                                                            dataList[0];
                                                                                                        media.createAsset(
                                                                                                            videoType,
                                                                                                            'video04.mp4',
                                                                                                            path,
                                                                                                            (
                                                                                                                error,
                                                                                                                creatAsset2
                                                                                                            ) => {
                                                                                                                try {
                                                                                                                    asset2.open(
                                                                                                                        'rw',
                                                                                                                        (
                                                                                                                            error,
                                                                                                                            fd2
                                                                                                                        ) => {
                                                                                                                            try {
                                                                                                                                creatAsset2.open(
                                                                                                                                    'rw',
                                                                                                                                    (
                                                                                                                                        error,
                                                                                                                                        creatAssetFd2
                                                                                                                                    ) => {
                                                                                                                                        try {
                                                                                                                                            copyFile(
                                                                                                                                                fd2,
                                                                                                                                                creatAssetFd2,
                                                                                                                                                test_num,
                                                                                                                                                done,
                                                                                                                                                () => {
                                                                                                                                                    try {
                                                                                                                                                        creatAsset2.close(
                                                                                                                                                            creatAssetFd2,
                                                                                                                                                            () => {
                                                                                                                                                                try {
                                                                                                                                                                    asset2.close(
                                                                                                                                                                        fd2,
                                                                                                                                                                        () => {
                                                                                                                                                                            try {
                                                                                                                                                                                if (
                                                                                                                                                                                    creatAsset1.id !=
                                                                                                                                                                                    creatAsset2.id
                                                                                                                                                                                ) {
                                                                                                                                                                                    console.info(
                                                                                                                                                                                        `MediaLibraryTest : ASSET_CALLBACK createAsset ${test_num} passed`
                                                                                                                                                                                    );
                                                                                                                                                                                    expect(
                                                                                                                                                                                        true
                                                                                                                                                                                    ).assertTrue();
                                                                                                                                                                                    done();
                                                                                                                                                                                } else {
                                                                                                                                                                                    console.info(
                                                                                                                                                                                        `MediaLibraryTest : ASSET_CALLBACK createAsset ${test_num} failed`
                                                                                                                                                                                    );
                                                                                                                                                                                    expect(
                                                                                                                                                                                        false
                                                                                                                                                                                    ).assertTrue();
                                                                                                                                                                                    done();
                                                                                                                                                                                }
                                                                                                                                                                            } catch (error) {
                                                                                                                                                                                executeAtError(
                                                                                                                                                                                    test_num,
                                                                                                                                                                                    error,
                                                                                                                                                                                    done
                                                                                                                                                                                );
                                                                                                                                                                            }
                                                                                                                                                                        }
                                                                                                                                                                    );
                                                                                                                                                                } catch (error) {
                                                                                                                                                                    executeAtError(
                                                                                                                                                                        test_num,
                                                                                                                                                                        error,
                                                                                                                                                                        done
                                                                                                                                                                    );
                                                                                                                                                                }
                                                                                                                                                            }
                                                                                                                                                        );
                                                                                                                                                    } catch (error) {
                                                                                                                                                        executeAtError(
                                                                                                                                                            test_num,
                                                                                                                                                            error,
                                                                                                                                                            done
                                                                                                                                                        );
                                                                                                                                                    }
                                                                                                                                                }
                                                                                                                                            );
                                                                                                                                        } catch (error) {
                                                                                                                                            executeAtError(
                                                                                                                                                test_num,
                                                                                                                                                error,
                                                                                                                                                done
                                                                                                                                            );
                                                                                                                                        }
                                                                                                                                    }
                                                                                                                                );
                                                                                                                            } catch (error) {
                                                                                                                                executeAtError(
                                                                                                                                    test_num,
                                                                                                                                    error,
                                                                                                                                    done
                                                                                                                                );
                                                                                                                            }
                                                                                                                        }
                                                                                                                    );
                                                                                                                } catch (error) {
                                                                                                                    executeAtError(
                                                                                                                        test_num,
                                                                                                                        error,
                                                                                                                        done
                                                                                                                    );
                                                                                                                }
                                                                                                            }
                                                                                                        );
                                                                                                    } catch (error) {
                                                                                                        executeAtError(
                                                                                                            test_num,
                                                                                                            error,
                                                                                                            done
                                                                                                        );
                                                                                                    }
                                                                                                }
                                                                                            );
                                                                                        } catch (error) {
                                                                                            executeAtError(
                                                                                                test_num,
                                                                                                error,
                                                                                                done
                                                                                            );
                                                                                        }
                                                                                    }
                                                                                );
                                                                            } catch (error) {
                                                                                executeAtError(
                                                                                    test_num,
                                                                                    error,
                                                                                    done
                                                                                );
                                                                            }
                                                                        }
                                                                    );
                                                                } catch (error) {
                                                                    executeAtError(
                                                                        test_num,
                                                                        error,
                                                                        done
                                                                    );
                                                                }
                                                            }
                                                        );
                                                    } catch (error) {
                                                        executeAtError(test_num, error, done);
                                                    }
                                                });
                                            } catch (error) {
                                                executeAtError(test_num, error, done);
                                            }
                                        }
                                    );
                                } catch (error) {
                                    executeAtError(test_num, error, done);
                                }
                            });
                        } catch (error) {
                            executeAtError(test_num, error, done);
                        }
                    });
                } catch (error) {
                    executeAtError(test_num, error, done);
                }
            });
        } catch (error) {
            executeAtError(test_num, error, done);
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_002_02
     * @tc.name      : createAsset
     * @tc.desc      : Access to the file displayName and validation is not undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_002_02', 0, async function (done) {
        const test_num = '002_02';
        try {
            media.getFileAssets(videosfetchOp, (error, fileAssets) => {
                try {
                    fileAssets.getAllObject((error, dataList) => {
                        try {
                            const firstAsset = dataList[0];
                            checkAssetAttr(done, 'displayName', test_num, firstAsset);

                            const midAsset = dataList[Math.floor(dataList.length / 2)];
                            checkAssetAttr(done, 'displayName', test_num, midAsset);

                            const lastAsset = dataList[dataList.length - 1];
                            checkAssetAttr(done, 'displayName', test_num, lastAsset);

                            console.info(
                                `MediaLibraryTest : ASSET_CALLBACK createAsset ${test_num} passed`
                            );
                            expect(true).assertTrue();
                            done();
                        } catch (error) {
                            executeAtError(test_num, error, done);
                        }
                    });
                } catch (error) {
                    executeAtError(test_num, error, done);
                }
            });
        } catch (error) {
            executeAtError(test_num, error, done);
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_002_03
     * @tc.name      : createAsset
     * @tc.desc      : Access to the file relativePath  and validation is not undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_002_03', 0, async function (done) {
        const test_num = '002_03';
        try {
            media.getFileAssets(videosfetchOp, (error, fileAssets) => {
                try {
                    fileAssets.getAllObject((error, dataList) => {
                        try {
                            const firstAsset = dataList[0];
                            checkAssetAttr(done, 'relativePath', test_num, firstAsset);

                            const midAsset = dataList[Math.floor(dataList.length / 2)];
                            checkAssetAttr(done, 'relativePath', test_num, midAsset);

                            const lastAsset = dataList[dataList.length - 1];
                            checkAssetAttr(done, 'relativePath', test_num, lastAsset);

                            console.info(
                                `MediaLibraryTest : ASSET_CALLBACK createAsset ${test_num} passed`
                            );
                            expect(true).assertTrue();
                            done();
                        } catch (error) {
                            executeAtError(test_num, error, done);
                        }
                    });
                } catch (error) {
                    executeAtError(test_num, error, done);
                }
            });
        } catch (error) {
            executeAtError(test_num, error, done);
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_002_04
     * @tc.name      : createAsset
     * @tc.desc      : Access to the file size and validation is not undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_002_04', 0, async function (done) {
        const test_num = '002_04';
        try {
            media.getFileAssets(videosfetchOp, (error, fileAssets) => {
                try {
                    fileAssets.getAllObject((error, dataList) => {
                        try {
                            const firstAsset = dataList[0];
                            checkAssetAttr(done, 'size', test_num, firstAsset);

                            const midAsset = dataList[Math.floor(dataList.length / 2)];
                            checkAssetAttr(done, 'size', test_num, midAsset);

                            const lastAsset = dataList[dataList.length - 1];
                            checkAssetAttr(done, 'size', test_num, lastAsset);

                            console.info(
                                `MediaLibraryTest : ASSET_CALLBACK createAsset ${test_num} passed`
                            );
                            expect(true).assertTrue();
                            done();
                        } catch (error) {
                            executeAtError(test_num, error, done);
                        }
                    });
                } catch (error) {
                    executeAtError(test_num, error, done);
                }
            });
        } catch (error) {
            executeAtError(test_num, error, done);
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_002_05
     * @tc.name      : createAsset
     * @tc.desc      : Access to the file dateAdded and validation is not undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_002_05', 0, async function (done) {
        const test_num = '002_05';
        try {
            media.getFileAssets(videosfetchOp, (error, fileAssets) => {
                try {
                    fileAssets.getAllObject((error, dataList) => {
                        try {
                            const firstAsset = dataList[0];
                            checkAssetAttr(done, 'dateAdded', test_num, firstAsset);

                            const midAsset = dataList[Math.floor(dataList.length / 2)];
                            checkAssetAttr(done, 'dateAdded', test_num, midAsset);

                            const lastAsset = dataList[dataList.length - 1];
                            checkAssetAttr(done, 'dateAdded', test_num, lastAsset);

                            console.info(
                                `MediaLibraryTest : ASSET_CALLBACK createAsset ${test_num} passed`
                            );
                            expect(true).assertTrue();
                            done();
                        } catch (error) {
                            executeAtError(test_num, error, done);
                        }
                    });
                } catch (error) {
                    executeAtError(test_num, error, done);
                }
            });
        } catch (error) {
            executeAtError(test_num, error, done);
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_002_07
     * @tc.name      : createAsset
     * @tc.desc      : Access to the file dateModified and validation is not undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_002_07', 0, async function (done) {
        const test_num = '002_07';
        try {
            media.getFileAssets(videosfetchOp, (error, fileAssets) => {
                try {
                    fileAssets.getAllObject((error, dataList) => {
                        try {
                            const asset = dataList[0];
                            asset.title = `title_${new Date().getTime()}`;
                            asset.commitModify(() => {
                                try {
                                    const id = asset.id;
                                    const idOP = {
                                        selections: fileKeyObj.ID + '= ?',
                                        selectionArgs: ['' + id],
                                    };
                                    media.getFileAssets(idOP, (error, newAssets) => {
                                        try {
                                            newAssets.getAllObject((error, newdataList) => {
                                                try {
                                                    const newAsset = newdataList[0];
                                                    if (asset.dateModified != undefined) {
                                                        if (
                                                            newAsset.dateModified !=
                                                            asset.dateModified
                                                        ) {
                                                            console.info(
                                                                `MediaLibraryTest : ASSET_CALLBACK createAsset ${test_num} passed`
                                                            );
                                                            expect(true).assertTrue();
                                                            done();
                                                        } else {
                                                            console.info(
                                                                `MediaLibraryTest : ASSET_CALLBACK createAsset ${test_num} failed`
                                                            );
                                                            expect(false).assertTrue();
                                                            done();
                                                        }
                                                    } else if (newAsset.dateModified != undefined) {
                                                        console.info(
                                                            `MediaLibraryTest : ASSET_CALLBACK createAsset ${test_num} passed`
                                                        );
                                                        expect(true).assertTrue();
                                                        done();
                                                    } else {
                                                        console.info(
                                                            `MediaLibraryTest : ASSET_CALLBACK createAsset ${test_num} failed`
                                                        );
                                                        expect(false).assertTrue();
                                                        done();
                                                    }

                                                } catch (error) {
                                                    executeAtError(test_num, error, done);
                                                }
                                            });
                                        } catch (error) {
                                            executeAtError(test_num, error, done);
                                        }
                                    });
                                } catch (error) {
                                    executeAtError(test_num, error, done);
                                }
                            });
                        } catch (error) {
                            executeAtError(test_num, error, done);
                        }
                    });
                } catch (error) {
                    executeAtError(test_num, error, done);
                }
            });
        } catch (error) {
            executeAtError(test_num, error, done);
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_002_08
     * @tc.name      : createAsset
     * @tc.desc      : Insert a picture record, the retrieve attributes for images
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_002_08', 0, async function (done) {
        const test_num = '002_08';
        try {
            media.getFileAssets(videosfetchOp, (error, fileAssets) => {
                try {
                    fileAssets.getAllObject((error, dataList) => {
                        try {
                            const firstAsset = dataList[0];
                            checkAssetAttr(done, 'mediaType', test_num, firstAsset, videoType);

                            const midAsset = dataList[Math.floor(dataList.length / 2)];
                            checkAssetAttr(done, 'mediaType', test_num, midAsset, videoType);

                            const lastAsset = dataList[dataList.length - 1];
                            checkAssetAttr(done, 'mediaType', test_num, lastAsset, videoType);

                            console.info(
                                `MediaLibraryTest : ASSET_CALLBACK createAsset ${test_num} passed`
                            );
                            expect(true).assertTrue();
                            done();
                        } catch (error) {
                            executeAtError(test_num, error, done);
                        }
                    });
                } catch (error) {
                    executeAtError(test_num, error, done);
                }
            });
        } catch (error) {
            executeAtError(test_num, error, done);
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_002_09
     * @tc.name      : createAsset
     * @tc.desc      : Get the width attribute
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_002_09', 0, async function (done) {
        const test_num = '002_09';
        try {
            media.getFileAssets(videosfetchOp, (error, fileAssets) => {
                try {
                    fileAssets.getAllObject((error, dataList) => {
                        try {
                            const firstAsset = dataList[0];
                            checkAssetAttr(done, 'width', test_num, firstAsset);

                            const midAsset = dataList[Math.floor(dataList.length / 2)];
                            checkAssetAttr(done, 'width', test_num, midAsset);

                            const lastAsset = dataList[dataList.length - 1];
                            checkAssetAttr(done, 'width', test_num, lastAsset);

                            console.info(
                                `MediaLibraryTest : ASSET_CALLBACK createAsset ${test_num} passed`
                            );
                            expect(true).assertTrue();
                            done();
                        } catch (error) {
                            executeAtError(test_num, error, done);
                        }
                    });
                } catch (error) {
                    executeAtError(test_num, error, done);
                }
            });
        } catch (error) {
            executeAtError(test_num, error, done);
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_002_10
     * @tc.name      : createAsset
     * @tc.desc      : Get the height attribute
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_002_10', 0, async function (done) {
        const test_num = '002_10';
        try {
            media.getFileAssets(videosfetchOp, (error, fileAssets) => {
                try {
                    fileAssets.getAllObject((error, dataList) => {
                        try {
                            const firstAsset = dataList[0];
                            checkAssetAttr(done, 'height', test_num, firstAsset);

                            const midAsset = dataList[Math.floor(dataList.length / 2)];
                            checkAssetAttr(done, 'height', test_num, midAsset);

                            const lastAsset = dataList[dataList.length - 1];
                            checkAssetAttr(done, 'height', test_num, lastAsset);

                            console.info(
                                `MediaLibraryTest : ASSET_CALLBACK createAsset ${test_num} passed`
                            );
                            expect(true).assertTrue();
                            done();
                        } catch (error) {
                            executeAtError(test_num, error, done);
                        }
                    });
                } catch (error) {
                    executeAtError(test_num, error, done);
                }
            });
        } catch (error) {
            executeAtError(test_num, error, done);
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_002_11
     * @tc.name      : createAsset
     * @tc.desc      : Get the orientaion attribute
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_002_11', 0, async function (done) {
        const test_num = '002_11';
        try {
            media.getFileAssets(videosfetchOp, (error, fileAssets) => {
                try {
                    fileAssets.getAllObject((error, dataList) => {
                        try {
                            const firstAsset = dataList[0];
                            checkAssetAttr(done, 'orientation', test_num, firstAsset);

                            const midAsset = dataList[Math.floor(dataList.length / 2)];
                            checkAssetAttr(done, 'orientation', test_num, midAsset);

                            const lastAsset = dataList[dataList.length - 1];
                            checkAssetAttr(done, 'orientation', test_num, lastAsset);

                            console.info(
                                `MediaLibraryTest : ASSET_CALLBACK createAsset ${test_num} passed`
                            );
                            expect(true).assertTrue();
                            done();
                        } catch (error) {
                            executeAtError(test_num, error, done);
                        }
                    });
                } catch (error) {
                    executeAtError(test_num, error, done);
                }
            });
        } catch (error) {
            executeAtError(test_num, error, done);
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_002_12
     * @tc.name      : createAsset
     * @tc.desc      : Get the duration attribute
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_002_12', 0, async function (done) {
        const test_num = '002_12';
        try {
            media.getFileAssets(videosfetchOp, (error, fileAssets) => {
                try {
                    fileAssets.getAllObject((error, dataList) => {
                        try {
                            const firstAsset = dataList[0];
                            checkAssetAttr(done, 'duration', test_num, firstAsset);

                            const midAsset = dataList[Math.floor(dataList.length / 2)];
                            checkAssetAttr(done, 'duration', test_num, midAsset);

                            const lastAsset = dataList[dataList.length - 1];
                            checkAssetAttr(done, 'duration', test_num, lastAsset);

                            console.info(
                                `MediaLibraryTest : ASSET_CALLBACK createAsset ${test_num} passed`
                            );
                            expect(true).assertTrue();
                            done();
                        } catch (error) {
                            executeAtError(test_num, error, done);
                        }
                    });
                } catch (error) {
                    executeAtError(test_num, error, done);
                }
            });
        } catch (error) {
            executeAtError(test_num, error, done);
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_002_13
     * @tc.name      : createAsset
     * @tc.desc      : Insert a picture record and get the property as picture
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_002_13', 0, async function (done) {
        const test_num = '002_13';
        try {
            media.getPublicDirectory(mediaLibrary.DirectoryType.DIR_VIDEO, (error, path) => {
                try {
                    media.getFileAssets(videosfetchOp, (error, fileAssets) => {
                        try {
                            fileAssets.getAllObject((error, dataList) => {
                                try {
                                    const asset1 = dataList[0];
                                    media.createAsset(
                                        videoType,
                                        'video3.mp4',
                                        path,
                                        (error, creatAsset1) => {
                                            try {
                                                asset1.open('rw', (error, fd1) => {
                                                    try {
                                                        creatAsset1.open(
                                                            'rw',
                                                            (error, creatAssetFd1) => {
                                                                try {
                                                                    copyFile(
                                                                        fd1,
                                                                        creatAssetFd1,
                                                                        test_num,
                                                                        done,
                                                                        () => {
                                                                            try {
                                                                                creatAsset1.close(
                                                                                    creatAssetFd1,
                                                                                    () => {
                                                                                        try {
                                                                                            asset1.close(
                                                                                                fd1,
                                                                                                () => {
                                                                                                    try {
                                                                                                        if (
                                                                                                            creatAsset1.mediaType ==
                                                                                                            videoType
                                                                                                        ) {
                                                                                                            console.info(
                                                                                                                `MediaLibraryTest : ASSET_CALLBACK createAsset ${test_num} passed`
                                                                                                            );
                                                                                                            expect(
                                                                                                                true
                                                                                                            ).assertTrue();
                                                                                                            done();
                                                                                                        } else {
                                                                                                            console.info(
                                                                                                                `MediaLibraryTest : ASSET_CALLBACK createAsset ${test_num} failed`
                                                                                                            );
                                                                                                            expect(
                                                                                                                false
                                                                                                            ).assertTrue();
                                                                                                            done();
                                                                                                        }
                                                                                                    } catch (error) {
                                                                                                        executeAtError(
                                                                                                            test_num,
                                                                                                            error,
                                                                                                            done
                                                                                                        );
                                                                                                    }
                                                                                                }
                                                                                            );
                                                                                        } catch (error) {
                                                                                            executeAtError(
                                                                                                test_num,
                                                                                                error,
                                                                                                done
                                                                                            );
                                                                                        }
                                                                                    }
                                                                                );
                                                                            } catch (error) {
                                                                                executeAtError(
                                                                                    test_num,
                                                                                    error,
                                                                                    done
                                                                                );
                                                                            }
                                                                        }
                                                                    );
                                                                } catch (error) {
                                                                    executeAtError(
                                                                        test_num,
                                                                        error,
                                                                        done
                                                                    );
                                                                }
                                                            }
                                                        );
                                                    } catch (error) {
                                                        executeAtError(test_num, error, done);
                                                    }
                                                });
                                            } catch (error) {
                                                executeAtError(test_num, error, done);
                                            }
                                        }
                                    );
                                } catch (error) {
                                    executeAtError(test_num, error, done);
                                }
                            });
                        } catch (error) {
                            executeAtError(test_num, error, done);
                        }
                    });
                } catch (error) {
                    executeAtError(test_num, error, done);
                }
            });
        } catch (error) {
            executeAtError(test_num, error, done);
        }
    });
    // -------------------------------  video type end -----------------------------

    // ------------------------------- audio type start ----------------------------
    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_003_01
     * @tc.name      : createAsset
     * @tc.desc      : Insert two database records, read a unique identifier, expectations are not equal
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_003_01', 0, async function (done) {
        const test_num = '003_01';
        try {
            media.getPublicDirectory(mediaLibrary.DirectoryType.DIR_AUDIO, (error, path) => {
                try {
                    media.getFileAssets(audiosfetchOp, (error, fileAssets) => {
                        try {
                            fileAssets.getAllObject((error, dataList) => {
                                try {
                                    const asset1 = dataList[0];
                                    media.createAsset(
                                        audioType,
                                        'audio03.mp3',
                                        path,
                                        (error, creatAsset1) => {
                                            try {
                                                asset1.open('rw', (error, fd1) => {
                                                    try {
                                                        creatAsset1.open(
                                                            'rw',
                                                            (error, creatAssetFd1) => {
                                                                try {
                                                                    copyFile(
                                                                        fd1,
                                                                        creatAssetFd1,
                                                                        test_num,
                                                                        done,
                                                                        () => {
                                                                            try {
                                                                                creatAsset1.close(
                                                                                    creatAssetFd1,
                                                                                    () => {
                                                                                        try {
                                                                                            asset1.close(
                                                                                                fd1,
                                                                                                () => {
                                                                                                    try {
                                                                                                        const asset2 =
                                                                                                            dataList[0];
                                                                                                        media.createAsset(
                                                                                                            audioType,
                                                                                                            'audio04.mp3',
                                                                                                            path,
                                                                                                            (
                                                                                                                error,
                                                                                                                creatAsset2
                                                                                                            ) => {
                                                                                                                try {
                                                                                                                    asset2.open(
                                                                                                                        'rw',
                                                                                                                        (
                                                                                                                            error,
                                                                                                                            fd2
                                                                                                                        ) => {
                                                                                                                            try {
                                                                                                                                creatAsset2.open(
                                                                                                                                    'rw',
                                                                                                                                    (
                                                                                                                                        error,
                                                                                                                                        creatAssetFd2
                                                                                                                                    ) => {
                                                                                                                                        try {
                                                                                                                                            copyFile(
                                                                                                                                                fd2,
                                                                                                                                                creatAssetFd2,
                                                                                                                                                test_num,
                                                                                                                                                done,
                                                                                                                                                () => {
                                                                                                                                                    try {
                                                                                                                                                        creatAsset2.close(
                                                                                                                                                            creatAssetFd2,
                                                                                                                                                            () => {
                                                                                                                                                                try {
                                                                                                                                                                    asset2.close(
                                                                                                                                                                        fd2,
                                                                                                                                                                        () => {
                                                                                                                                                                            try {
                                                                                                                                                                                if (
                                                                                                                                                                                    creatAsset1.id !=
                                                                                                                                                                                    creatAsset2.id
                                                                                                                                                                                ) {
                                                                                                                                                                                    console.info(
                                                                                                                                                                                        `MediaLibraryTest : ASSET_CALLBACK createAsset ${test_num} passed`
                                                                                                                                                                                    );
                                                                                                                                                                                    expect(
                                                                                                                                                                                        true
                                                                                                                                                                                    ).assertTrue();
                                                                                                                                                                                    done();
                                                                                                                                                                                } else {
                                                                                                                                                                                    console.info(
                                                                                                                                                                                        `MediaLibraryTest : ASSET_CALLBACK createAsset ${test_num} failed`
                                                                                                                                                                                    );
                                                                                                                                                                                    expect(
                                                                                                                                                                                        false
                                                                                                                                                                                    ).assertTrue();
                                                                                                                                                                                    done();
                                                                                                                                                                                }
                                                                                                                                                                            } catch (error) {
                                                                                                                                                                                executeAtError(
                                                                                                                                                                                    test_num,
                                                                                                                                                                                    error,
                                                                                                                                                                                    done
                                                                                                                                                                                );
                                                                                                                                                                            }
                                                                                                                                                                        }
                                                                                                                                                                    );
                                                                                                                                                                } catch (error) {
                                                                                                                                                                    executeAtError(
                                                                                                                                                                        test_num,
                                                                                                                                                                        error,
                                                                                                                                                                        done
                                                                                                                                                                    );
                                                                                                                                                                }
                                                                                                                                                            }
                                                                                                                                                        );
                                                                                                                                                    } catch (error) {
                                                                                                                                                        executeAtError(
                                                                                                                                                            test_num,
                                                                                                                                                            error,
                                                                                                                                                            done
                                                                                                                                                        );
                                                                                                                                                    }
                                                                                                                                                }
                                                                                                                                            );
                                                                                                                                        } catch (error) {
                                                                                                                                            executeAtError(
                                                                                                                                                test_num,
                                                                                                                                                error,
                                                                                                                                                done
                                                                                                                                            );
                                                                                                                                        }
                                                                                                                                    }
                                                                                                                                );
                                                                                                                            } catch (error) {
                                                                                                                                executeAtError(
                                                                                                                                    test_num,
                                                                                                                                    error,
                                                                                                                                    done
                                                                                                                                );
                                                                                                                            }
                                                                                                                        }
                                                                                                                    );
                                                                                                                } catch (error) {
                                                                                                                    executeAtError(
                                                                                                                        test_num,
                                                                                                                        error,
                                                                                                                        done
                                                                                                                    );
                                                                                                                }
                                                                                                            }
                                                                                                        );
                                                                                                    } catch (error) {
                                                                                                        executeAtError(
                                                                                                            test_num,
                                                                                                            error,
                                                                                                            done
                                                                                                        );
                                                                                                    }
                                                                                                }
                                                                                            );
                                                                                        } catch (error) {
                                                                                            executeAtError(
                                                                                                test_num,
                                                                                                error,
                                                                                                done
                                                                                            );
                                                                                        }
                                                                                    }
                                                                                );
                                                                            } catch (error) {
                                                                                executeAtError(
                                                                                    test_num,
                                                                                    error,
                                                                                    done
                                                                                );
                                                                            }
                                                                        }
                                                                    );
                                                                } catch (error) {
                                                                    executeAtError(
                                                                        test_num,
                                                                        error,
                                                                        done
                                                                    );
                                                                }
                                                            }
                                                        );
                                                    } catch (error) {
                                                        executeAtError(test_num, error, done);
                                                    }
                                                });
                                            } catch (error) {
                                                executeAtError(test_num, error, done);
                                            }
                                        }
                                    );
                                } catch (error) {
                                    executeAtError(test_num, error, done);
                                }
                            });
                        } catch (error) {
                            executeAtError(test_num, error, done);
                        }
                    });
                } catch (error) {
                    executeAtError(test_num, error, done);
                }
            });
        } catch (error) {
            executeAtError(test_num, error, done);
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_003_02
     * @tc.name      : createAsset
     * @tc.desc      : Access to the file name and validation is not undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_003_02', 0, async function (done) {
        const test_num = '003_02';
        try {
            media.getFileAssets(audiosfetchOp, (error, fileAssets) => {
                try {
                    fileAssets.getAllObject((error, dataList) => {
                        try {
                            const firstAsset = dataList[0];
                            checkAssetAttr(done, 'displayName', test_num, firstAsset);

                            const midAsset = dataList[Math.floor(dataList.length / 2)];
                            checkAssetAttr(done, 'displayName', test_num, midAsset);

                            const lastAsset = dataList[dataList.length - 1];
                            checkAssetAttr(done, 'displayName', test_num, lastAsset);

                            console.info(
                                `MediaLibraryTest : ASSET_CALLBACK createAsset ${test_num} passed`
                            );
                            expect(true).assertTrue();
                            done();
                        } catch (error) {
                            executeAtError(test_num, error, done);
                        }
                    });
                } catch (error) {
                    executeAtError(test_num, error, done);
                }
            });
        } catch (error) {
            executeAtError(test_num, error, done);
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_003_03
     * @tc.name      : createAsset
     * @tc.desc      : Access to the file relativePath  and validation is not undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_003_03', 0, async function (done) {
        const test_num = '003_03';
        try {
            media.getFileAssets(audiosfetchOp, (error, fileAssets) => {
                try {
                    fileAssets.getAllObject((error, dataList) => {
                        try {
                            const firstAsset = dataList[0];
                            checkAssetAttr(done, 'relativePath', test_num, firstAsset);

                            const midAsset = dataList[Math.floor(dataList.length / 2)];
                            checkAssetAttr(done, 'relativePath', test_num, midAsset);

                            const lastAsset = dataList[dataList.length - 1];
                            checkAssetAttr(done, 'relativePath', test_num, lastAsset);

                            console.info(
                                `MediaLibraryTest : ASSET_CALLBACK createAsset ${test_num} passed`
                            );
                            expect(true).assertTrue();
                            done();
                        } catch (error) {
                            executeAtError(test_num, error, done);
                        }
                    });
                } catch (error) {
                    executeAtError(test_num, error, done);
                }
            });
        } catch (error) {
            executeAtError(test_num, error, done);
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_003_04
     * @tc.name      : createAsset
     * @tc.desc      : Access to the file size and validation is not undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_003_04', 0, async function (done) {
        const test_num = '003_04';
        try {
            media.getFileAssets(filesfetchOp, (error, fileAssets) => {
                try {
                    fileAssets.getAllObject((error, dataList) => {
                        try {
                            const firstAsset = dataList[0];
                            checkAssetAttr(done, 'size', test_num, firstAsset);

                            const midAsset = dataList[Math.floor(dataList.length / 2)];
                            checkAssetAttr(done, 'size', test_num, midAsset);

                            const lastAsset = dataList[dataList.length - 1];
                            checkAssetAttr(done, 'size', test_num, lastAsset);

                            console.info(
                                `MediaLibraryTest : ASSET_CALLBACK createAsset ${test_num} passed`
                            );
                            expect(true).assertTrue();
                            done();
                        } catch (error) {
                            executeAtError(test_num, error, done);
                        }
                    });
                } catch (error) {
                    executeAtError(test_num, error, done);
                }
            });
        } catch (error) {
            executeAtError(test_num, error, done);
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_003_05
     * @tc.name      : createAsset
     * @tc.desc      : Access to the file dateAdded and validation is not undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_003_05', 0, async function (done) {
        const test_num = '003_05';
        try {
            media.getFileAssets(audiosfetchOp, (error, fileAssets) => {
                try {
                    fileAssets.getAllObject((error, dataList) => {
                        try {
                            const firstAsset = dataList[0];
                            checkAssetAttr(done, 'dateAdded', test_num, firstAsset);

                            const midAsset = dataList[Math.floor(dataList.length / 2)];
                            checkAssetAttr(done, 'dateAdded', test_num, midAsset);

                            const lastAsset = dataList[dataList.length - 1];
                            checkAssetAttr(done, 'dateAdded', test_num, lastAsset);

                            console.info(
                                `MediaLibraryTest : ASSET_CALLBACK createAsset ${test_num} passed`
                            );
                            expect(true).assertTrue();
                            done();
                        } catch (error) {
                            executeAtError(test_num, error, done);
                        }
                    });
                } catch (error) {
                    executeAtError(test_num, error, done);
                }
            });
        } catch (error) {
            executeAtError(test_num, error, done);
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_003_07
     * @tc.name      : createAsset
     * @tc.desc      : Access to the file dateModified and validation is not undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_003_07', 0, async function (done) {
        const test_num = '003_07';
        try {
            media.getFileAssets(audiosfetchOp, (error, fileAssets) => {
                try {
                    fileAssets.getAllObject((error, dataList) => {
                        try {
                            const asset = dataList[0];
                            asset.title = `title_${new Date().getTime()}`;
                            asset.commitModify(() => {
                                try {
                                    const id = asset.id;
                                    const idOP = {
                                        selections: fileKeyObj.ID + '= ?',
                                        selectionArgs: ['' + id],
                                    };
                                    media.getFileAssets(idOP, (error, newAssets) => {
                                        try {
                                            newAssets.getAllObject((error, newdataList) => {
                                                try {
                                                    const newAsset = newdataList[0];
                                                    if (asset.dateModified != undefined) {
                                                        if (
                                                            newAsset.dateModified !=
                                                            asset.dateModified
                                                        ) {
                                                            console.info(
                                                                `MediaLibraryTest : ASSET_CALLBACK createAsset ${test_num} passed`
                                                            );
                                                            expect(true).assertTrue();
                                                            done();
                                                        } else {
                                                            console.info(
                                                                `MediaLibraryTest : ASSET_CALLBACK createAsset ${test_num} failed`
                                                            );
                                                            expect(false).assertTrue();
                                                            done();
                                                        }
                                                    } else if (newAsset.dateModified != undefined) {
                                                        console.info(
                                                            `MediaLibraryTest : ASSET_CALLBACK createAsset ${test_num} passed`
                                                        );
                                                        expect(true).assertTrue();
                                                        done();
                                                    } else {
                                                        console.info(
                                                            `MediaLibraryTest : ASSET_CALLBACK createAsset ${test_num} failed`
                                                        );
                                                        expect(false).assertTrue();
                                                        done();
                                                    }

                                                } catch (error) {
                                                    executeAtError(test_num, error, done);
                                                }
                                            });
                                        } catch (error) {
                                            executeAtError(test_num, error, done);
                                        }
                                    });
                                } catch (error) {
                                    executeAtError(test_num, error, done);
                                }
                            });
                        } catch (error) {
                            executeAtError(test_num, error, done);
                        }
                    });
                } catch (error) {
                    executeAtError(test_num, error, done);
                }
            });
        } catch (error) {
            executeAtError(test_num, error, done);
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_003_08
     * @tc.name      : createAsset
     * @tc.desc      : Insert a picture record, the retrieve attributes for images
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_003_08', 0, async function (done) {
        const test_num = '003_08';
        try {
            media.getFileAssets(audiosfetchOp, (error, fileAssets) => {
                try {
                    fileAssets.getAllObject((error, dataList) => {
                        try {
                            const firstAsset = dataList[0];
                            checkAssetAttr(done, 'mediaType', test_num, firstAsset, audioType);

                            const midAsset = dataList[Math.floor(dataList.length / 2)];
                            checkAssetAttr(done, 'mediaType', test_num, midAsset, audioType);

                            const lastAsset = dataList[dataList.length - 1];
                            checkAssetAttr(done, 'mediaType', test_num, lastAsset, audioType);

                            console.info(
                                `MediaLibraryTest : ASSET_CALLBACK createAsset ${test_num} passed`
                            );
                            expect(true).assertTrue();
                            done();
                        } catch (error) {
                            executeAtError(test_num, error, done);
                        }
                    });
                } catch (error) {
                    executeAtError(test_num, error, done);
                }
            });
        } catch (error) {
            executeAtError(test_num, error, done);
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_003_09
     * @tc.name      : createAsset
     * @tc.desc      : Get the artist attribute
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_003_09', 0, async function (done) {
        const test_num = '003_09';
        try {
            media.getFileAssets(audiosfetchOp, (error, fileAssets) => {
                try {
                    fileAssets.getAllObject((error, dataList) => {
                        try {
                            const firstAsset = dataList[0];
                            checkAssetAttr(done, 'width', test_num, firstAsset);

                            const midAsset = dataList[Math.floor(dataList.length / 2)];
                            checkAssetAttr(done, 'width', test_num, midAsset);

                            const lastAsset = dataList[dataList.length - 1];
                            checkAssetAttr(done, 'width', test_num, lastAsset);

                            console.info(
                                `MediaLibraryTest : ASSET_CALLBACK createAsset ${test_num} passed`
                            );
                            expect(true).assertTrue();
                            done();
                        } catch (error) {
                            executeAtError(test_num, error, done);
                        }
                    });
                } catch (error) {
                    executeAtError(test_num, error, done);
                }
            });
        } catch (error) {
            executeAtError(test_num, error, done);
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_003_10
     * @tc.name      : createAsset
     * @tc.desc      : Get the album attribute
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_003_10', 0, async function (done) {
        const test_num = '003_10';
        try {
            media.getFileAssets(audiosfetchOp, (error, fileAssets) => {
                try {
                    fileAssets.getAllObject((error, dataList) => {
                        try {
                            const firstAsset = dataList[0];
                            checkAssetAttr(done, 'albumName', test_num, firstAsset);

                            const midAsset = dataList[Math.floor(dataList.length / 2)];
                            checkAssetAttr(done, 'albumName', test_num, midAsset);

                            const lastAsset = dataList[dataList.length - 1];
                            checkAssetAttr(done, 'albumName', test_num, lastAsset);

                            console.info(
                                `MediaLibraryTest : ASSET_CALLBACK createAsset ${test_num} passed`
                            );
                            expect(true).assertTrue();
                            done();
                        } catch (error) {
                            executeAtError(test_num, error, done);
                        }
                    });
                } catch (error) {
                    executeAtError(test_num, error, done);
                }
            });
        } catch (error) {
            executeAtError(test_num, error, done);
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_003_11
     * @tc.name      : createAsset
     * @tc.desc      : Get the duration attribute
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_003_11', 0, async function (done) {
        const test_num = '003_11';
        try {
            media.getFileAssets(audiosfetchOp, (error, fileAssets) => {
                try {
                    fileAssets.getAllObject((error, dataList) => {
                        try {
                            const firstAsset = dataList[0];
                            checkAssetAttr(done, 'duration', test_num, firstAsset);

                            const midAsset = dataList[Math.floor(dataList.length / 2)];
                            checkAssetAttr(done, 'duration', test_num, midAsset);

                            const lastAsset = dataList[dataList.length - 1];
                            checkAssetAttr(done, 'duration', test_num, lastAsset);

                            console.info(
                                `MediaLibraryTest : ASSET_CALLBACK createAsset ${test_num} passed`
                            );
                            expect(true).assertTrue();
                            done();
                        } catch (error) {
                            executeAtError(test_num, error, done);
                        }
                    });
                } catch (error) {
                    executeAtError(test_num, error, done);
                }
            });
        } catch (error) {
            executeAtError(test_num, error, done);
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_003_12
     * @tc.name      : createAsset
     * @tc.desc      : Insert a picture record and get the property as picture
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_003_12', 0, async function (done) {
        const test_num = '003_12';
        try {
            media.getPublicDirectory(mediaLibrary.DirectoryType.DIR_AUDIO, (error, path) => {
                media.getFileAssets(audiosfetchOp, (error, fileAssets) => {
                    try {
                        fileAssets.getAllObject((error, dataList) => {
                            try {
                                const asset1 = dataList[0];
                                media.createAsset(
                                    audioType,
                                    'audio3.mp3',
                                    path,
                                    (error, creatAsset1) => {
                                        try {
                                            asset1.open('rw', (error, fd1) => {
                                                try {
                                                    creatAsset1.open(
                                                        'rw',
                                                        (error, creatAssetFd1) => {
                                                            try {
                                                                copyFile(
                                                                    fd1,
                                                                    creatAssetFd1,
                                                                    test_num,
                                                                    done,
                                                                    () => {
                                                                        try {
                                                                            creatAsset1.close(
                                                                                creatAssetFd1,
                                                                                () => {
                                                                                    try {
                                                                                        asset1.close(
                                                                                            fd1,
                                                                                            () => {
                                                                                                try {
                                                                                                    if (
                                                                                                        creatAsset1.mediaType ==
                                                                                                        audioType
                                                                                                    ) {
                                                                                                        console.info(
                                                                                                            `MediaLibraryTest : ASSET_CALLBACK createAsset ${test_num} passed`
                                                                                                        );
                                                                                                        expect(
                                                                                                            true
                                                                                                        ).assertTrue();
                                                                                                        done();
                                                                                                    } else {
                                                                                                        console.info(
                                                                                                            `MediaLibraryTest : ASSET_CALLBACK createAsset ${test_num} failed`
                                                                                                        );
                                                                                                        expect(
                                                                                                            false
                                                                                                        ).assertTrue();
                                                                                                        done();
                                                                                                    }
                                                                                                } catch (error) {
                                                                                                    executeAtError(
                                                                                                        test_num,
                                                                                                        error,
                                                                                                        done
                                                                                                    );
                                                                                                }
                                                                                            }
                                                                                        );
                                                                                    } catch (error) {
                                                                                        executeAtError(
                                                                                            test_num,
                                                                                            error,
                                                                                            done
                                                                                        );
                                                                                    }
                                                                                }
                                                                            );
                                                                        } catch (error) {
                                                                            executeAtError(
                                                                                test_num,
                                                                                error,
                                                                                done
                                                                            );
                                                                        }
                                                                    }
                                                                );
                                                            } catch (error) {
                                                                executeAtError(
                                                                    test_num,
                                                                    error,
                                                                    done
                                                                );
                                                            }
                                                        }
                                                    );
                                                } catch (error) {
                                                    executeAtError(test_num, error, done);
                                                }
                                            });
                                        } catch (error) {
                                            executeAtError(test_num, error, done);
                                        }
                                    }
                                );
                            } catch (error) {
                                executeAtError(test_num, error, done);
                            }
                        });
                    } catch (error) {
                        executeAtError(test_num, error, done);
                    }
                });
            });
        } catch (error) {
            executeAtError(test_num, error, done);
        }
    });
    // -------------------------------  audio type end -----------------------------

    // ------------------------------- file type start ----------------------------
    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_004_01
     * @tc.name      : createAsset
     * @tc.desc      : Insert two database records, read a unique identifier, expectations are not equal
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_004_01', 0, async function (done) {
        const test_num = '004_01';
        try {
            media.getPublicDirectory(mediaLibrary.DirectoryType.DIR_DOWNLOAD, (error, path) => {
                try {
                    media.getFileAssets(filesfetchOp, (error, fileAssets) => {
                        try {
                            fileAssets.getAllObject((error, dataList) => {
                                try {
                                    const asset1 = dataList[0];
                                    media.createAsset(
                                        fileType,
                                        'file03.txt',
                                        path,
                                        (error, creatAsset1) => {
                                            try {
                                                asset1.open('rw', (error, fd1) => {
                                                    try {
                                                        creatAsset1.open(
                                                            'rw',
                                                            (error, creatAssetFd1) => {
                                                                try {
                                                                    copyFile(
                                                                        fd1,
                                                                        creatAssetFd1,
                                                                        test_num,
                                                                        done,
                                                                        () => {
                                                                            try {
                                                                                creatAsset1.close(
                                                                                    creatAssetFd1,
                                                                                    () => {
                                                                                        try {
                                                                                            asset1.close(
                                                                                                fd1,
                                                                                                () => {
                                                                                                    try {
                                                                                                        const asset2 =
                                                                                                            dataList[0];
                                                                                                        media.createAsset(
                                                                                                            fileType,
                                                                                                            'file04.txt',
                                                                                                            path,
                                                                                                            (
                                                                                                                error,
                                                                                                                creatAsset2
                                                                                                            ) => {
                                                                                                                try {
                                                                                                                    asset2.open(
                                                                                                                        'rw',
                                                                                                                        (
                                                                                                                            error,
                                                                                                                            fd2
                                                                                                                        ) => {
                                                                                                                            try {
                                                                                                                                creatAsset2.open(
                                                                                                                                    'rw',
                                                                                                                                    (
                                                                                                                                        error,
                                                                                                                                        creatAssetFd2
                                                                                                                                    ) => {
                                                                                                                                        try {
                                                                                                                                            copyFile(
                                                                                                                                                fd2,
                                                                                                                                                creatAssetFd2,
                                                                                                                                                test_num,
                                                                                                                                                done,
                                                                                                                                                () => {
                                                                                                                                                    try {
                                                                                                                                                        creatAsset2.close(
                                                                                                                                                            creatAssetFd2,
                                                                                                                                                            () => {
                                                                                                                                                                try {
                                                                                                                                                                    asset2.close(
                                                                                                                                                                        fd2,
                                                                                                                                                                        () => {
                                                                                                                                                                            try {
                                                                                                                                                                                if (
                                                                                                                                                                                    creatAsset1.id !=
                                                                                                                                                                                    creatAsset2.id
                                                                                                                                                                                ) {
                                                                                                                                                                                    console.info(
                                                                                                                                                                                        `MediaLibraryTest : ASSET_CALLBACK createAsset ${test_num} passed`
                                                                                                                                                                                    );
                                                                                                                                                                                    expect(
                                                                                                                                                                                        true
                                                                                                                                                                                    ).assertTrue();
                                                                                                                                                                                    done();
                                                                                                                                                                                } else {
                                                                                                                                                                                    console.info(
                                                                                                                                                                                        `MediaLibraryTest : ASSET_CALLBACK createAsset ${test_num} failed`
                                                                                                                                                                                    );
                                                                                                                                                                                    expect(
                                                                                                                                                                                        false
                                                                                                                                                                                    ).assertTrue();
                                                                                                                                                                                    done();
                                                                                                                                                                                }
                                                                                                                                                                            } catch (error) {
                                                                                                                                                                                executeAtError(
                                                                                                                                                                                    test_num,
                                                                                                                                                                                    error,
                                                                                                                                                                                    done
                                                                                                                                                                                );
                                                                                                                                                                            }
                                                                                                                                                                        }
                                                                                                                                                                    );
                                                                                                                                                                } catch (error) {
                                                                                                                                                                    executeAtError(
                                                                                                                                                                        test_num,
                                                                                                                                                                        error,
                                                                                                                                                                        done
                                                                                                                                                                    );
                                                                                                                                                                }
                                                                                                                                                            }
                                                                                                                                                        );
                                                                                                                                                    } catch (error) {
                                                                                                                                                        executeAtError(
                                                                                                                                                            test_num,
                                                                                                                                                            error,
                                                                                                                                                            done
                                                                                                                                                        );
                                                                                                                                                    }
                                                                                                                                                }
                                                                                                                                            );
                                                                                                                                        } catch (error) {
                                                                                                                                            executeAtError(
                                                                                                                                                test_num,
                                                                                                                                                error,
                                                                                                                                                done
                                                                                                                                            );
                                                                                                                                        }
                                                                                                                                    }
                                                                                                                                );
                                                                                                                            } catch (error) {
                                                                                                                                executeAtError(
                                                                                                                                    test_num,
                                                                                                                                    error,
                                                                                                                                    done
                                                                                                                                );
                                                                                                                            }
                                                                                                                        }
                                                                                                                    );
                                                                                                                } catch (error) {
                                                                                                                    executeAtError(
                                                                                                                        test_num,
                                                                                                                        error,
                                                                                                                        done
                                                                                                                    );
                                                                                                                }
                                                                                                            }
                                                                                                        );
                                                                                                    } catch (error) {
                                                                                                        executeAtError(
                                                                                                            test_num,
                                                                                                            error,
                                                                                                            done
                                                                                                        );
                                                                                                    }
                                                                                                }
                                                                                            );
                                                                                        } catch (error) {
                                                                                            executeAtError(
                                                                                                test_num,
                                                                                                error,
                                                                                                done
                                                                                            );
                                                                                        }
                                                                                    }
                                                                                );
                                                                            } catch (error) {
                                                                                executeAtError(
                                                                                    test_num,
                                                                                    error,
                                                                                    done
                                                                                );
                                                                            }
                                                                        }
                                                                    );
                                                                } catch (error) {
                                                                    executeAtError(
                                                                        test_num,
                                                                        error,
                                                                        done
                                                                    );
                                                                }
                                                            }
                                                        );
                                                    } catch (error) {
                                                        executeAtError(test_num, error, done);
                                                    }
                                                });
                                            } catch (error) {
                                                executeAtError(test_num, error, done);
                                            }
                                        }
                                    );
                                } catch (error) {
                                    executeAtError(test_num, error, done);
                                }
                            });
                        } catch (error) {
                            executeAtError(test_num, error, done);
                        }
                    });
                } catch (error) {
                    executeAtError(test_num, error, done);
                }
            });
        } catch (error) {
            executeAtError(test_num, error, done);
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_004_02
     * @tc.name      : createAsset
     * @tc.desc      : Access to the file name and validation is not undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_004_02', 0, async function (done) {
        const test_num = '004_02';
        try {
            media.getFileAssets(filesfetchOp, (error, fileAssets) => {
                try {
                    fileAssets.getAllObject((error, dataList) => {
                        try {
                            const firstAsset = dataList[0];
                            checkAssetAttr(done, 'displayName', test_num, firstAsset);

                            const midAsset = dataList[Math.floor(dataList.length / 2)];
                            checkAssetAttr(done, 'displayName', test_num, midAsset);

                            const lastAsset = dataList[dataList.length - 1];
                            checkAssetAttr(done, 'displayName', test_num, lastAsset);

                            console.info(
                                `MediaLibraryTest : ASSET_CALLBACK createAsset ${test_num} passed`
                            );
                            expect(true).assertTrue();
                            done();
                        } catch (error) {
                            executeAtError(test_num, error, done);
                        }
                    });
                } catch (error) {
                    executeAtError(test_num, error, done);
                }
            });
        } catch (error) {
            executeAtError(test_num, error, done);
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_004_03
     * @tc.name      : createAsset
     * @tc.desc      : Access to the file relativePath  and validation is not undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_004_03', 0, async function (done) {
        const test_num = '004_03';
        try {
            media.getFileAssets(filesfetchOp, (error, fileAssets) => {
                try {
                    fileAssets.getAllObject((error, dataList) => {
                        try {
                            const firstAsset = dataList[0];
                            checkAssetAttr(done, 'relativePath', test_num, firstAsset);

                            const midAsset = dataList[Math.floor(dataList.length / 2)];
                            checkAssetAttr(done, 'relativePath', test_num, midAsset);

                            const lastAsset = dataList[dataList.length - 1];
                            checkAssetAttr(done, 'relativePath', test_num, lastAsset);

                            console.info(
                                `MediaLibraryTest : ASSET_CALLBACK createAsset ${test_num} passed`
                            );
                            expect(true).assertTrue();
                            done();
                        } catch (error) {
                            executeAtError(test_num, error, done);
                        }
                    });
                } catch (error) {
                    executeAtError(test_num, error, done);
                }
            });
        } catch (error) {
            executeAtError(test_num, error, done);
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_004_04
     * @tc.name      : createAsset
     * @tc.desc      : Access to the file size and validation is not undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_004_04', 0, async function (done) {
        const test_num = '004_04';
        try {
            media.getFileAssets(filesfetchOp, (error, fileAssets) => {
                try {
                    fileAssets.getAllObject((error, dataList) => {
                        try {
                            const firstAsset = dataList[0];
                            checkAssetAttr(done, 'size', test_num, firstAsset);

                            const midAsset = dataList[Math.floor(dataList.length / 2)];
                            checkAssetAttr(done, 'size', test_num, midAsset);

                            const lastAsset = dataList[dataList.length - 1];
                            checkAssetAttr(done, 'size', test_num, lastAsset);

                            console.info(
                                `MediaLibraryTest : ASSET_CALLBACK createAsset ${test_num} passed`
                            );
                            expect(true).assertTrue();
                            done();
                        } catch (error) {
                            executeAtError(test_num, error, done);
                        }
                    });
                } catch (error) {
                    executeAtError(test_num, error, done);
                }
            });
        } catch (error) {
            executeAtError(test_num, error, done);
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_004_05
     * @tc.name      : createAsset
     * @tc.desc      : Access to the file dateAdded and validation is not undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_004_05', 0, async function (done) {
        const test_num = '004_05';
        try {
            media.getFileAssets(filesfetchOp, (error, fileAssets) => {
                try {
                    fileAssets.getAllObject((error, dataList) => {
                        try {
                            const firstAsset = dataList[0];
                            checkAssetAttr(done, 'dateAdded', test_num, firstAsset);

                            const midAsset = dataList[Math.floor(dataList.length / 2)];
                            checkAssetAttr(done, 'dateAdded', test_num, midAsset);

                            const lastAsset = dataList[dataList.length - 1];
                            checkAssetAttr(done, 'dateAdded', test_num, lastAsset);

                            console.info(
                                `MediaLibraryTest : ASSET_CALLBACK createAsset ${test_num} passed`
                            );
                            expect(true).assertTrue();
                            done();
                        } catch (error) {
                            console.info(
                                `MediaLibraryTest : ASSET_CALLBACK createAsset 004_05 failed, message = ${error}`
                            );
                            expect(false).assertTrue();
                            done();
                        }
                    });
                } catch (error) {
                    executeAtError(test_num, error, done);
                }
            });
        } catch (error) {
            executeAtError(test_num, error, done);
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_004_07
     * @tc.name      : createAsset
     * @tc.desc      : Access to the file dateModified and validation is not undefined
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_004_07', 0, async function (done) {
        const test_num = '004_07';
        try {
            media.getFileAssets(filesfetchOp, (error, fileAssets) => {
                try {
                    fileAssets.getAllObject((error, dataList) => {
                        try {
                            const asset = dataList[0];
                            asset.title = `title_${new Date().getTime()}`;
                            asset.commitModify(() => {
                                const id = asset.id;
                                const idOP = {
                                    selections: fileKeyObj.ID + '= ?',
                                    selectionArgs: ['' + id],
                                };
                                media.getFileAssets(idOP, (error, newAssets) => {
                                    try {
                                        newAssets.getAllObject((error, newdataList) => {
                                            try {
                                                const newAsset = newdataList[0];
                                                if (asset.dateModified != undefined) {
                                                    if (
                                                        newAsset.dateModified != asset.dateModified
                                                    ) {
                                                        console.info(
                                                            `MediaLibraryTest : ASSET_CALLBACK createAsset ${test_num} passed`
                                                        );
                                                        expect(true).assertTrue();
                                                        done();
                                                    } else {
                                                        console.info(
                                                            `MediaLibraryTest : ASSET_CALLBACK createAsset ${test_num} failed`
                                                        );
                                                        expect(false).assertTrue();
                                                        done();
                                                    }
                                                } else if (newAsset.dateModified != undefined) {
                                                    console.info(
                                                        `MediaLibraryTest : ASSET_CALLBACK createAsset ${test_num} passed`
                                                    );
                                                    expect(true).assertTrue();
                                                    done();
                                                } else {
                                                    console.info(
                                                        `MediaLibraryTest : ASSET_CALLBACK createAsset ${test_num} failed`
                                                    );
                                                    expect(false).assertTrue();
                                                    done();
                                                }

                                            } catch (error) {
                                                executeAtError(test_num, error, done);
                                            }
                                        });
                                    } catch (error) {
                                        executeAtError(test_num, error, done);
                                    }
                                });
                            });
                        } catch (error) {
                            executeAtError(test_num, error, done);
                        }
                    });
                } catch (error) {
                    executeAtError(test_num, error, done);
                }
            });
        } catch (error) {
            executeAtError(test_num, error, done);
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_004_08
     * @tc.name      : createAsset
     * @tc.desc      : Insert a picture record, the retrieve attributes for images
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_004_08', 0, async function (done) {
        const test_num = '004_08';
        try {
            media.getFileAssets(filesfetchOp, (error, fileAssets) => {
                try {
                    fileAssets.getAllObject((error, dataList) => {
                        try {
                            const firstAsset = dataList[0];
                            checkAssetAttr(done, 'mediaType', test_num, firstAsset, fileType);

                            const midAsset = dataList[Math.floor(dataList.length / 2)];
                            checkAssetAttr(done, 'mediaType', test_num, midAsset, fileType);

                            const lastAsset = dataList[dataList.length - 1];
                            checkAssetAttr(done, 'mediaType', test_num, lastAsset, fileType);

                            console.info(
                                `MediaLibraryTest : ASSET_CALLBACK createAsset ${test_num} passed`
                            );
                            expect(true).assertTrue();
                            done();
                        } catch (error) {
                            executeAtError(test_num, error, done);
                        }
                    });
                } catch (error) {
                    executeAtError(test_num, error, done);
                }
            });
        } catch (error) {
            executeAtError(test_num, error, done);
        }
    });

    /**
     * @tc.number    : SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_004_09
     * @tc.name      : createAsset
     * @tc.desc      : Insert two database records, read a unique identifier, expectations are not equal
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it('SUB_MEDIA_MEDIALIBRARY_CREATEASSET_CALLBACK_004_09', 0, async function (done) {
        const test_num = '004_09';
        try {
            media.getPublicDirectory(mediaLibrary.DirectoryType.DIR_DOWNLOAD, (error, path) => {
                try {
                    media.getFileAssets(filesfetchOp, (error, fileAssets) => {
                        try {
                            fileAssets.getAllObject((error, dataList) => {
                                try {
                                    const asset1 = dataList[0];
                                    media.createAsset(
                                        fileType,
                                        'file3.txt',
                                        path,
                                        (error, creatAsset1) => {
                                            try {
                                                asset1.open('rw', (error, fd1) => {
                                                    try {
                                                        creatAsset1.open(
                                                            'rw',
                                                            (error, creatAssetFd1) => {
                                                                try {
                                                                    copyFile(
                                                                        fd1,
                                                                        creatAssetFd1,
                                                                        test_num,
                                                                        done,
                                                                        () => {
                                                                            try {
                                                                                creatAsset1.close(
                                                                                    creatAssetFd1,
                                                                                    () => {
                                                                                        try {
                                                                                            asset1.close(
                                                                                                fd1,
                                                                                                () => {
                                                                                                    try {
                                                                                                        if (
                                                                                                            creatAsset1.mediaType ==
                                                                                                            fileType
                                                                                                        ) {
                                                                                                            console.info(
                                                                                                                `MediaLibraryTest : ASSET_CALLBACK createAsset ${test_num} passed`
                                                                                                            );
                                                                                                            expect(
                                                                                                                true
                                                                                                            ).assertTrue();
                                                                                                            done();
                                                                                                        } else {
                                                                                                            console.info(
                                                                                                                `MediaLibraryTest : ASSET_CALLBACK createAsset ${test_num} failed`
                                                                                                            );
                                                                                                            expect(
                                                                                                                false
                                                                                                            ).assertTrue();
                                                                                                            done();
                                                                                                        }
                                                                                                    } catch (error) {
                                                                                                        executeAtError(
                                                                                                            test_num,
                                                                                                            error,
                                                                                                            done
                                                                                                        );
                                                                                                    }
                                                                                                }
                                                                                            );
                                                                                        } catch (error) {
                                                                                            executeAtError(
                                                                                                test_num,
                                                                                                error,
                                                                                                done
                                                                                            );
                                                                                        }
                                                                                    }
                                                                                );
                                                                            } catch (error) {
                                                                                executeAtError(
                                                                                    test_num,
                                                                                    error,
                                                                                    done
                                                                                );
                                                                            }
                                                                        }
                                                                    );
                                                                } catch (error) {
                                                                    executeAtError(
                                                                        test_num,
                                                                        error,
                                                                        done
                                                                    );
                                                                }
                                                            }
                                                        );
                                                    } catch (error) {
                                                        executeAtError(test_num, error, done);
                                                    }
                                                });
                                            } catch (error) {
                                                executeAtError(test_num, error, done);
                                            }
                                        }
                                    );
                                } catch (error) {
                                    executeAtError(test_num, error, done);
                                }
                            });
                        } catch (error) {
                            executeAtError(test_num, error, done);
                        }
                    });
                } catch (error) {
                    executeAtError(test_num, error, done);
                }
            });
        } catch (error) {
            executeAtError(test_num, error, done);
        }
    });
    // -------------------------------  file type end -----------------------------
});
