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
import zlib from '@ohos.zlib'
import fileio from '@ohos.fileio'


import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'

console.log("-----------------888888888------------------");

describe('ZlibTest', function () {
    var FLUSH_TYPE_NO_FLUSH = 0;
    var FLUSH_TYPE_PARTIAL_FLUSH = 1;
    var FLUSH_TYPE_SYNC_FLUSH = 2;
    var FLUSH_TYPE_FULL_FLUSH = 3;
    var FLUSH_TYPE_FINISH = 4;
    var FLUSH_TYPE_BLOCK = 5;
    var FLUSH_TYPE_TREES = 6;
    var COMPRESS_LEVEL_NO_COMPRESSION = 0;
    var COMPRESS_LEVEL_BEST_SPEED = 1;
    var COMPRESS_LEVEL_BEST_COMPRESSION = 9;
    var COMPRESS_LEVEL_DEFAULT_COMPRESSION = -1;
    var COMPRESS_STRATEGY_DEFAULT_STRATEGY = 0;
    var COMPRESS_STRATEGY_FILTERED = 1;
    var COMPRESS_STRATEGY_HUFFMAN_ONLY = 2;
    var COMPRESS_STRATEGY_RLE = 3;
    var COMPRESS_STRATEGY_FIXED = 4;
    var MEM_LEVEL_MIN_MEMLEVEL = 1;
    var MEM_LEVEL_DEFAULT_MEMLEVEL = 8;
    var MEM_LEVEL_MAX_MEMLEVEL = 9;



/*
 * @tc.number: ACTS_zipFile_0100
 * @tc.name: zipFile :
 * @tc.desc:
 */
    function zipFileCallBack(err, data){
        console.log("zipFileCallBack_0100 err: " + err.code);
        console.log("zipFileCallBack_0100 data: " + data);
        expect(err).assertEqual(0);
        expect(data).assertEqual(0);
    }
    it('ACTS_zipFile_0100', 0, async function (done) {
        console.log("==================ACTS_zipFile_0100 start==================");
        var src ="";
        var dest ="";

        //        zlib.zipFile(src,dest,option,zipFileCallBack);
        zlib.zipFile(src,dest,
            (err, data) => {
                console.log("zipFileCallBack_0100 err: " + err.code);
                console.log("zipFileCallBack_0100 data: " + data);
                expect(err).assertEqual(0);
                expect(data).assertEqual(0);
            });

        function timeout() {
            expect().assertFail();
            console.debug('ACTS_zipFile_0100=====timeout======');
        }
        setTimeout(timeout, 5000);
        done();
    })
/*
 * @tc.number: ACTS_zipFile_0200
 * @tc.name: zipFile :
 * @tc.desc:
 */
    it('ACTS_zipFile_0200', 0, async function (done) {
        console.log("==================ACTS_zipFile_0200 start==================");
        var src ="/data/test/";
        var dest ="/data/test/zip_amsZipfileUnzipfileST-signed.zip";

//        zlib.zipFile(src,dest,option,zipFileCallBack);
        zlib.zipFile(src,dest,
            (err, data) => {
                console.log("zipFileCallBack_0200 err: " + err.code);
                console.log("zipFileCallBack_0200 data: " + data);
                expect(err).assertEqual(0);
                expect(data).assertEqual(0);
            });

        function timeout() {
            expect().assertFail();
            console.debug('ACTS_zipFile_0100=====timeout======');
        }
        setTimeout(timeout, 5000);
        done();
    })
/*
 * @tc.number: ACTS_zipFile_0300
 * @tc.name: zipFile :
 * @tc.desc:
 */
    it('ACTS_zipFile_0300', 0, async function (done) {
        console.log("==================ACTS_zipFile_0300 start==================");
        var src ="/data/test/amsZipfileUnzipfileST-signed.hap";
        var dest ="";

        //        zlib.zipFile(src,dest,option,zipFileCallBack);
        zlib.zipFile(src,dest,
            (err, data) => {
                console.log("zipFileCallBack_0300 err: " + err.code);
                console.log("zipFileCallBack_0300 data: " + data);
                expect(err).assertEqual(0);
                expect(data).assertEqual(0);
            });

        function timeout() {
            expect().assertFail();
            console.debug('ACTS_zipFile_0300=====timeout======');
        }
        setTimeout(timeout, 5000);
        done();
    })
/*
 * @tc.number: ACTS_zipFile_0400
 * @tc.name: zipFile :
 * @tc.desc:
 */
    it('ACTS_zipFile_0400', 0, async function (done) {
        console.log("==================ACTS_zipFile_0400 start==================");
        var src ="/data/test/";
        var dest ="/data/testA/zip_amsZipfileUnzipfileST-signed.zip";

        //        zlib.zipFile(src,dest,option,zipFileCallBack);
        zlib.zipFile(src,dest,
            (err, data) => {
                console.log("zipFileCallBack_0400 err: " + err.code);
                console.log("zipFileCallBack_0400 data: " + data);
                expect(err).assertEqual(0);
                expect(data).assertEqual(0);
            });

        function timeout() {
            expect().assertFail();
            console.debug('ACTS_zipFile_0400=====timeout======');
        }
        setTimeout(timeout, 5000);
        done();
    })
/*
 * @tc.number: ACTS_zipFile_0500
 * @tc.name: zipFile :
 * @tc.desc:
 */
    it('ACTS_zipFile_0500', 0, async function (done) {
        console.log("==================ACTS_zipFile_0500 start==================");
        var src ="/data/test/amsZipfileUnzipfileST-signed.hap";
        var dest ="/data/test/zip_amsZipfileUnzipfileST-signed.zip";

        try{
            var Options= {
                flush:FLUSH_TYPE_NO_FLUSH,
            };
        }catch(err) {
            console.error('ACTS_zipFile_0500  zip  err:' + err);
        }
        if (Options.flush == 0){
            console.log("ACTS_zipFile_0500 It is an orange!");
        }
        else {
            console.log("ACTS_zipFile_0500 It is NOT an orange");
        }
        try{
            zlib.zipFile(src,dest,Options,
                (err, data) => {
                    console.log("ACTS_zipFile_0500 err: " + err.code);
                    console.log("ACTS_zipFile_0500 data: " + data);
                    expect(err).assertEqual(0);
                    expect(data).assertEqual(0);
                });
        }catch(err) {
            console.error('ACTS_zipFile_0500  size  err:' + err);
        }
        let sizePath = '/data/test/amsZipfileUnzipfileST-signed.hap'
        let testPath ='/data/test/zip_amsZipfileUnzipfileST-signed.zip'
        try{
            var big = fileio.statSync(sizePath).size;
        }catch(err) {
            console.error('ACTS_zipFile_0500  big  err:' + err);
        }
         var small = fileio.statSync(testPath).size;
        try{
            expect(big>=small).assertEqual(1);
            console.log("big=" + big);
            console.log("small=" + small);
        }catch(err) {
            console.error('ACTS_zipFile_0500  assertTure  err:' + err);
        }
        console.debug('ACTS_zipFile_0500=====size======');
       try{
           expect(fileio.accessSync(testPath) != null).assertEqual(1);
        }
        catch(err){
            console.error("state +B presence");
        }
        console.debug('ACTS_zipFile_0500=====test======');


        function timeout() {
            try{
            expect().assertFail();
            }catch(err) {
                console.error('ACTS_zipFile_0500  assertFail  err:' + err);
            }
            console.debug('ACTS_zipFile_0500=====timeout======');
            done();
        }

        setTimeout(timeout, 5000);

    })
/*
 * @tc.number: ACTS_zipFile_0600
 * @tc.name: zipFile :
 * @tc.desc:
 */
    it('ACTS_zipFile_0600', 0, async function (done) {
        console.log("==================ACTS_zipFile_0600 start==================");
        var src ="/data/test/amsZipfileUnzipfileST-signed.hap";
        var dest ="/data/test/zip_amsZipfileUnzipfileST-signed.zip";

        try{
            var Options= {
                flush:FLUSH_TYPE_PARTIAL_FLUSH,
            };
        }catch(err) {
            console.error('ACTS_zipFile_0600  zip  err:' + err);
        }
        if (Options.flush == 1){
            console.log("ACTS_zipFile_0600 It is an orange!");
        }
        else {
            console.log("ACTS_zipFile_0600 It is NOT an orange");
        }
        try{
            zlib.zipFile(src,dest,Options,
                (err, data) => {
                    console.log("ACTS_zipFile_0600 err: "  +  err.code);
                    console.log("ACTS_zipFile_0600 data: "  +  data);
                    expect(err).assertEqual(0);
                    expect(data).assertEqual(0);
                });
        }catch(err) {
            console.error('ACTS_zipFile_0600  size  err:' + err);
        }
        let sizePath = '/data/test/amsZipfileUnzipfileST-signed.hap'
        let testPath ='/data/test/zip_amsZipfileUnzipfileST-signed.zip'
        try{
            var big = fileio.statSync(sizePath).size;
        }catch(err) {
            console.error('ACTS_zipFile_0600  big  err:' + err);
        }
        var small = fileio.statSync(testPath).size;
        try{
            expect(big>=small).assertEqual(1);
           // let result = big >= small;
            console.log("big=" + big);
            console.log("small=" + small);
        }catch(err) {
            console.error('ACTS_zipFile_0600  assertTure  err:' + err);
        }
        console.debug('ACTS_zipFile_0600=====size======');
        try{
            expect(fileio.accessSync(testPath) != null).assertEqual(0);
        }
        catch(err){
            console.error("state +B presence");
        }
        console.debug('ACTS_zipFile_0600=====test======');
        function timeout() {
            try{
                expect().assertFail();
            }catch(err) {
                console.error('ACTS_zipFile_0600  assertFail  err:' + err);
            }
            console.debug('ACTS_zipFile_0600=====timeout======');
            done();
        }

        setTimeout(timeout, 5000);

    })
/*
 * @tc.number: ACTS_zipFile_700
 * @tc.name: zipFile :
 * @tc.desc:
 */
    it('ACTS_zipFile_0700', 0, async function (done) {
        console.log("==================ACTS_zipFile_0700 start==================");
        var src ="/data/test/amsZipfileUnzipfileST-signed.hap";
        var dest ="/data/test/zip_amsZipfileUnzipfileST-signed.zip";

        try{
            var Options= {
                flush:FLUSH_TYPE_PARTIAL_FLUSH,
            };
        }catch(err) {
            console.error('ACTS_zipFile_0700  zip  err:' + err);
        }
        if (Options.flush == 1){
            console.log("ACTS_zipFile_0700 It is an orange!");
        }
        else {
            console.log("ACTS_zipFile_0700 It is NOT an orange");
        }
        try{
            zlib.zipFile(src,dest,Options,
                (err, data) => {
                    console.log("ACTS_zipFile_0700 err: " + err.code);
                    console.log("ACTS_zipFile_0700 data: " + data);
                    expect(err).assertEqual(0);
                    expect(data).assertEqual(0);
                });
        }catch(err) {
            console.error('ACTS_zipFile_0700  size  err:' + err);
        }
        let sizePath = '/data/test/amsZipfileUnzipfileST-signed.hap'
        let testPath ='/data/test/zip_amsZipfileUnzipfileST-signed.zip'
        try{
            var big = fileio.statSync(sizePath).size;
        }catch(err) {
            console.error('ACTS_zipFile_0700  big  err:' + err);
        }
        var small = fileio.statSync(testPath).size;
        try{
            expect(big>=small).assertEqual(1);
            console.log("big=" + big);
            console.log("small=" + small);
        }catch(err) {
            console.error('ACTS_zipFile_0700  assertTure  err:' + err);
        }
        console.debug('ACTS_zipFile_0700=====size======');
        try{
            expect(fileio.accessSync(testPath) != null).assertEqual(0);
        }
        catch(err){
            console.error("state +B presence");
        }
        console.debug('ACTS_zipFile_0700=====test======');
        function timeout() {
            try{
                expect().assertFail();
            }catch(err) {
                console.error('ACTS_zipFile_0700  assertFail  err:' + err);
            }
            console.debug('ACTS_zipFile_0700=====timeout======');
            done();
        }

        setTimeout(timeout, 5000);

    })
/*
 * @tc.number: ACTS_zipFile_0800
 * @tc.name: zipFile :
 * @tc.desc:
 */
    it('ACTS_zipFile_0800', 0, async function (done) {
        console.log("==================ACTS_zipFile_0800 start==================");
        var src ="/data/test/aamsZipfileUnzipfileST-signed.hap";
        var dest ="/data/test/zip_amsZipfileUnzipfileST-signed.zip";

        try{
            var Options= {
                flush:FLUSH_TYPE_FULL_FLUSH,
            };
        }catch(err) {
            console.error('ACTS_zipFile_0800  zip  err:' + err);
        }
        if (Options.flush == 3){
            console.log("ACTS_zipFile_0800 It is an orange!");
        }
        else {
            console.log("ACTS_zipFile_0800 It is NOT an orange");
        }
        try{
            zlib.zipFile(src,dest,Options,
                (err, data) => {
                    console.log("ACTS_zipFile_0800 err: " + err.code);
                    console.log("ACTS_zipFile_0800 data: " + data);
                    expect(err).assertEqual(0);
                    expect(data).assertEqual(0);
                });
        }catch(err) {
            console.error('ACTS_zipFile_0800  size  err:' + err);
        }
        let sizePath = '/data/test/amsZipfileUnzipfileST-signed.hap'
        let testPath ='/data/test/zip_amsZipfileUnzipfileST-signed.zip'
        try{
            var big = fileio.statSync(sizePath).size;
        }catch(err) {
            console.error('ACTS_zipFile_0800  big  err:' + err);
        }
        var small = fileio.statSync(testPath).size;
        try{
            expect(big>=small).assertEqual(1);
            console.log("big=" + big);
            console.log("small=" + small);
        }catch(err) {
            console.error('ACTS_zipFile_0800  assertTure  err:' + err);
        }
        console.debug('ACTS_zipFile_0800=====size======');
        try{
            expect(fileio.accessSync(testPath) != null).assertEqual(0);
        }
        catch(err){
            console.error("state +B presence");
        }
        console.debug('ACTS_zipFile_0800=====test======');
        function timeout() {
            try{
                expect().assertFail();
            }catch(err) {
                console.error('ACTS_zipFile_0800  assertFail  err:' + err);
            }
            console.debug('ACTS_zipFile_0800=====timeout======');
            done();
        }

        setTimeout(timeout, 5000);

    })
/*
 * @tc.number: ACTS_zipFile_0900
 * @tc.name: zipFile :
 * @tc.desc:
 */
    it('ACTS_zipFile_0900', 0, async function (done) {
        console.log("==================ACTS_zipFile_08900 start==================");
        var src ="/data/test/amsZipfileUnzipfileST-signed.hap";
        var dest ="/data/test/zip_amsZipfileUnzipfileST-signed.zip";

        try{
            var Options= {
                flush:FLUSH_TYPE_FINISH,
            };
        }catch(err) {
            console.error('ACTS_zipFile_08900  zip  err:' + err);
        }
        if (Options.flush == 4){
            console.log("ACTS_zipFile_0900 It is an orange!");
        }
        else {
            console.log("ACTS_zipFile_08900 It is NOT an orange");
        }
        try{
            zlib.zipFile(src,dest,Options,
                (err, data) => {
                    console.log("ACTS_zipFile_0900 err: " + err.code);
                    console.log("ACTS_zipFile_0900 data: " + data);
                    expect(err).assertEqual(0);
                    expect(data).assertEqual(0);
                });
        }catch(err) {
            console.error('ACTS_zipFile_0900  size  err:' + err);
        }
        let sizePath = '/data/test/amsZipfileUnzipfileST-signed.hap'
        let testPath ='/data/test/zip_amsZipfileUnzipfileST-signed.zip'
        try{
            var big = fileio.statSync(sizePath).size;
        }catch(err) {
            console.error('ACTS_zipFile_0900  big  err:' + err);
        }
        var small = fileio.statSync(testPath).size;
        try{
            expect(big>=small).assertEqual(1);
            console.log("big=" + big);
            console.log("small=" + small);
        }catch(err) {
            console.error('ACTS_zipFile_0900  assertTure  err:' + err);
        }
        console.debug('ACTS_zipFile_0900=====size======');
        try{
            expect(fileio.accessSync(testPath) != null).assertEqual(0);
        }
        catch(err){
            console.error("state +B presence");
        }
        console.debug('ACTS_zipFile_0900=====test======');
        function timeout() {
            try{
                expect().assertFail();
            }catch(err) {
                console.error('ACTS_zipFile_0900  assertFail  err:' + err);
            }
            console.debug('ACTS_zipFile_0900=====timeout======');
            done();
        }

        setTimeout(timeout, 5000);

    })
/*
 * @tc.number: ACTS_zipFile_1000
 * @tc.name: zipFile :
 * @tc.desc:
 */
    it('ACTS_zipFile_1000', 0, async function (done) {
        console.log("==================ACTS_zipFile_1000 start==================");
        var src ="/data/test/amsZipfileUnzipfileST-signed.hap";
        var dest ="/data/test/zip_amsZipfileUnzipfileST-signed.zip";

        try{
            var Options= {
                flush:FLUSH_TYPE_BLOCK,
            };
        }catch(err) {
            console.error('ACTS_zipFile_1000  zip  err:' + err);
        }
        if (Options.flush == 5){
            console.log("ACTS_zipFile_1000 It is an orange!");
        }
        else {
            console.log("ACTS_zipFile_1000 It is NOT an orange");
        }
        try{
            zlib.zipFile(src,dest,Options,
                (err, data) => {
                    console.log("ACTS_zipFile_1000 err: " + err.code);
                    console.log("ACTS_zipFile_1000 data: " + data);
                    expect(err).assertEqual(0);
                    expect(data).assertEqual(0);
                });
        }catch(err) {
            console.error('ACTS_zipFile_1000  size  err:' + err);
        }
        let sizePath = '/data/test/amsZipfileUnzipfileST-signed.hap'
        let testPath ='/data/test/zip_amsZipfileUnzipfileST-signed.zip'
        try{
            var big = fileio.statSync(sizePath).size;
        }catch(err) {
            console.error('ACTS_zipFile_1000  big  err:' + err);
        }
        var small = fileio.statSync(testPath).size;
        try{
            expect(big>=small).assertEqual(1);
            console.log("big=" + big);
            console.log("small=" + small);
        }catch(err) {
            console.error('ACTS_zipFile_1000  assertTure  err:' + err);
        }
        console.debug('ACTS_zipFile_1000=====size======');
        try{
            expect(fileio.accessSync(testPath) != null).assertEqual(0);
        }
        catch(err){
            console.error("state +B presence");
        }
        console.debug('ACTS_zipFile_1000=====test======');
        function timeout() {
            try{
                expect().assertFail();
            }catch(err) {
                console.error('ACTS_zipFile_1000  assertFail  err:' + err);
            }
            console.debug('ACTS_zipFile_1000=====timeout======');
            done();
        }

        setTimeout(timeout, 5000);

    })
/*
 * @tc.number: ACTS_zipFile_1100
 * @tc.name: zipFile :
 * @tc.desc:
 */
    it('ACTS_zipFile_1100', 0, async function (done) {
        console.log("==================ACTS_zipFile_1100 start==================");
        var src ="/data/test/amsZipfileUnzipfileST-signed.hap";
        var dest ="/data/test/zip_amsZipfileUnzipfileST-signed.zip";

        try{
            var Options= {
                flush:FLUSH_TYPE_TREES,
            };
        }catch(err) {
            console.error('ACTS_zipFile_1100  zip  err:' + err);
        }
        if (Options.flush == 6){
            console.log("ACTS_zipFile_1100 It is an orange!");
        }
        else {
            console.log("ACTS_zipFile_1100 It is NOT an orange");
        }
        try{
            zlib.zipFile(src,dest,Options,
                (err, data) => {
                    console.log("ACTS_zipFile_1100 err: " + err.code);
                    console.log("ACTS_zipFile_1100 data: " + data);
                    expect(err).assertEqual(0);
                    expect(data).assertEqual(0);
                });
        }catch(err) {
            console.error('ACTS_zipFile_1100  size  err:' + err);
        }
        let sizePath = '/data/test/amsZipfileUnzipfileST-signed.hap'
        let testPath ='/data/test/zip_amsZipfileUnzipfileST-signed.zip'
        try{
            var big = fileio.statSync(sizePath).size;
        }catch(err) {
            console.error('ACTS_zipFile_1100  big  err:' + err);
        }
        var small = fileio.statSync(testPath).size;
        try{
            expect(big>=small).assertEqual(1);
            console.log("big=" + big);
            console.log("small=" + small);
        }catch(err) {
            console.error('ACTS_zipFile_1100  assertTure  err:' + err);
        }
        console.debug('ACTS_zipFile_1100=====size======');
        try{
            expect(fileio.accessSync(testPath) != null).assertEqual(0);
        }
        catch(err){
            console.error("state +B presence");
        }
        console.debug('ACTS_zipFile_1100=====test======');
        function timeout() {
            try{
                expect().assertFail();
            }catch(err) {
                console.error('ACTS_zipFile_1100  assertFail  err:' + err);
            }
            console.debug('ACTS_zipFile_1100=====timeout======');
            done();
        }

        setTimeout(timeout, 5000);

    })
/*
 * @tc.number: ACTS_zipFile_1200
 * @tc.name: zipFile :
 * @tc.desc:
 */
    it('ACTS_zipFile_1200', 0, async function (done) {
        console.log("==================ACTS_zipFile_1200 start==================");
        var src ="/data/test/amsZipfileUnzipfileST-signed.hap";
        var dest ="/data/test/zip_amsZipfileUnzipfileST-signed.zip";

        try{
            var Options= {
                finishFlush:FLUSH_TYPE_NO_FLUSH,
            };
        }catch(err) {
            console.error('ACTS_zipFile_1200  zip  err:' + err);
        }
        if (Options.finishFlush == 0){
            console.log("ACTS_zipFile_1200 It is an orange!");
        }
        else {
            console.log("ACTS_zipFile_1200 It is NOT an orange");
        }
        try{
            zlib.zipFile(src,dest,Options,
                (err, data) => {
                    console.log("ACTS_zipFile_1200 err: " + err.code);
                    console.log("ACTS_zipFile_1200 data: " + data);
                    expect(err).assertEqual(0);
                    expect(data).assertEqual(0);
                });
        }catch(err) {
            console.error('ACTS_zipFile_1200   size  err:' + err);
        }
        let sizePath = '/data/test/amsZipfileUnzipfileST-signed.hap'
        let testPath ='/data/test/zip_amsZipfileUnzipfileST-signed.zip'
        try{
            var big = fileio.statSync(sizePath).size;
        }catch(err) {
            console.error('ACTS_zipFile_1200  big  err:' + err);
        }
        var small = fileio.statSync(testPath).size;
        try{
            expect(big>=small).assertEqual(1);
            console.log("big=" + big);
            console.log("small=" + small);
        }catch(err) {
            console.error('ACTS_zipFile_1200  assertTure  err:' + err);
        }
        console.debug('ACTS_zipFile_1200=====size======');
        try{
            expect(fileio.accessSync(testPath) != null).assertEqual(0);
        }
        catch(err){
            console.error("state +B presence");
        }
        console.debug('ACTS_zipFile_1200=====test======');


        function timeout() {
            try{
                expect().assertFail();
            }catch(err) {
                console.error('ACTS_zipFile_1200  assertFail  err:' + err);
            }
            console.debug('ACTS_zipFile_1200=====timeout======');
            done();
        }

        setTimeout(timeout, 5000);

    })
/*
 * @tc.number: ACTS_zipFile_1300
 * @tc.name: zipFile :
 * @tc.desc:
 */
    it('ACTS_zipFile_1300', 0, async function (done) {
        console.log("==================ACTS_zipFile_1300 start==================");
        var src ="/data/test/amsZipfileUnzipfileST-signed.hap";
        var dest ="/data/test/zip_amsZipfileUnzipfileST-signed.zip";

        try{
            var Options= {
                finishFlush:FLUSH_TYPE_PARTIAL_FLUSH,
            };
        }catch(err) {
            console.error('ACTS_zipFile_1300  zip  err:' + err);
        }
        if (Options.finishFlush == 1){
            console.log("ACTS_zipFile_1300 It is an orange!");
        }
        else {
            console.log("ACTS_zipFile_1300 It is NOT an orange");
        }
        try{
            zlib.zipFile(src,dest,Options,
                (err, data) => {
                    console.log("ACTS_zipFile_1300 err: " + err.code);
                    console.log("ACTS_zipFile_1300 data: " + data);
                    expect(err).assertEqual(0);
                    expect(data).assertEqual(0);
                });
        }catch(err) {
            console.error('ACTS_zipFile_1300  size  err:' + err);
        }
        let sizePath = '/data/testamsZipfileUnzipfileST-signed.hap'
        let testPath ='/data/test/zip_amsZipfileUnzipfileST-signed.zip'
        try{
            var big = fileio.statSync(sizePath).size;
        }catch(err) {
            console.error('ACTS_zipFile_1300  big  err:' + err);
        }
        var small = fileio.statSync(testPath).size;
        try{
            expect(big>=small).assertEqual(1);
            console.log("big=" + big);
            console.log("small=" + small);
        }catch(err) {
            console.error('ACTS_zipFile_1300  assertTure  err:' + err);
        }
        console.debug('ACTS_zipFile_1300=====size======');
        try{
            expect(fileio.accessSync(testPath) != null).assertEqual(0);
        }
        catch(err){
            console.error("state +B presence");
        }
        console.debug('ACTS_zipFile_1300=====test======');
        function timeout() {
            try{
                expect().assertFail();
            }catch(err) {
                console.error('ACTS_zipFile_1300  assertFail  err:' + err);
            }
            console.debug('ACTS_zipFile_1300=====timeout======');
            done();
        }

        setTimeout(timeout, 5000);

    })
/*
 * @tc.number: ACTS_zipFile_1400
 * @tc.name: zipFile :
 * @tc.desc:
 */
    it('ACTS_zipFile_1400', 0, async function (done) {
        console.log("==================ACTS_zipFile_1400 start==================");
        var src ="/data/test/amsZipfileUnzipfileST-signed.hap";
        var dest ="/data/test/zip_amsZipfileUnzipfileST-signed.zip";

        try{
            var Options= {
                finishFlush:FLUSH_TYPE_SYNC_FLUSH,
            };
        }catch(err) {
            console.error('ACTS_zipFile_1400  zip  err:' + err);
        }
        if (Options.finishFlush== 2){
            console.log("ACTS_zipFile_1400 It is an orange!");
        }
        else {
            console.log("ACTS_zipFile_1400 It is NOT an orange");
        }
        try{
            zlib.zipFile(src,dest,Options,
                (err, data) => {
                    console.log("ACTS_zipFile_1400 err: " + err.code);
                    console.log("ACTS_zipFile_1400 data: " + data);
                    expect(err).assertEqual(0);
                    expect(data).assertEqual(0);
                });
        }catch(err) {
            console.error('ACTS_zipFile_1400  size  err:' + err);
        }
        let sizePath = '/data/test/amsZipfileUnzipfileST-signed.hap'
        let testPath ='/data/test/zip_amsZipfileUnzipfileST-signed.zip'
        try{
            var big = fileio.statSync(sizePath).size;
        }catch(err) {
            console.error('ACTS_zipFile_1400  big  err:' + err);
        }
        var small = fileio.statSync(testPath).size;
        try{
            expect(big>=small).assertEqual(1);
            console.log("big=" + big);
            console.log("small=" + small);
        }catch(err) {
            console.error('ACTS_zipFile_1400  assertTure  err:' + err);
        }
        console.debug('ACTS_zipFile_1400=====size======');
        try{
            expect(fileio.accessSync(testPath) != null).assertEqual(0);
        }
        catch(err){
            console.error("state +B presence");
        }
        console.debug('ACTS_zipFile_1400=====test======');
        function timeout() {
            try{
                expect().assertFail();
            }catch(err) {
                console.error('ACTS_zipFile_1400  assertFail  err:' + err);
            }
            console.debug('ACTS_zipFile_1400=====timeout======');
            done();
        }

        setTimeout(timeout, 5000);

    })
/*
 * @tc.number: ACTS_zipFile_1500
 * @tc.name: zipFile :
 * @tc.desc:
 */
    it('ACTS_zipFile_1500', 0, async function (done) {
        console.log("==================ACTS_zipFile_1500 start==================");
        var src ="/data/test/amsZipfileUnzipfileST-signed.hap";
        var dest ="/data/test/zip_amsZipfileUnzipfileST-signed.zip";

        try{
            var Options= {
                finishFlush:FLUSH_TYPE_FULL_FLUSH,
            };
        }catch(err) {
            console.error('ACTS_zipFile_1500  zip  err:' + err);
        }
        if (Options.finishFlush == 3){
            console.log("ACTS_zipFile_1500 It is an orange!");
        }
        else {
            console.log("ACTS_zipFile_1500 It is NOT an orange");
        }
        try{
            zlib.zipFile(src,dest,Options,
                (err, data) => {
                    console.log("ACTS_zipFile_1500 err: " + err.code);
                    console.log("ACTS_zipFile_1500 data: " + data);
                    expect(err).assertEqual(0);
                    expect(data).assertEqual(0);
                });
        }catch(err) {
            console.error('ACTS_zipFile_1500  size  err:' +  err);
        }
        let sizePath = '/data/test/amsZipfileUnzipfileST-signed.hap'
        let testPath ='/data/test/zip_amsZipfileUnzipfileST-signed.zip'
        try{
            var big = fileio.statSync(sizePath).size;
        }catch(err) {
            console.error('ACTS_zipFile_1500  big  err:' + err);
        }
        var small = fileio.statSync(testPath).size;
        try{
            expect(big>=small).assertEqual(1);
            console.log("big=" + big);
            console.log("small=" + small);
        }catch(err) {
            console.error('ACTS_zipFile_1500  assertTure  err:' + err);
        }
        console.debug('ACTS_zipFile_1500=====size======');
        try{
            expect(fileio.accessSync(testPath) != null).assertEqual(0);
        }
        catch(err){
            console.error("state +B presence");
        }
        console.debug('ACTS_zipFile_1500=====test======');
        function timeout() {
            try{
                expect().assertFail();
            }catch(err) {
                console.error('ACTS_zipFile_1500  assertFail  err:' + err);
            }
            console.debug('ACTS_zipFile_1500=====timeout======');
            done();
        }

        setTimeout(timeout, 5000);

    })
/*
 * @tc.number: ACTS_zipFile_1600
 * @tc.name: zipFile :
 * @tc.desc:
 */
    it('ACTS_zipFile_1600', 0, async function (done) {
        console.log("==================ACTS_zipFile_1600 start==================");
        var src ="/data/test/amsZipfileUnzipfileST-signed.hap";
        var dest ="/data/test/zip_amsZipfileUnzipfileST-signed.zip";

        try{
            var Options= {
                finishFlush:FLUSH_TYPE_FINISH,
            };
        }catch(err) {
            console.error('ACTS_zipFile_1600  zip  err:' + err);
        }
        if (Options.finishFlush == 4){
            console.log("ACTS_zipFile_1600 It is an orange!");
        }
        else {
            console.log("ACTS_zipFile_1600 It is NOT an orange");
        }
        try{
            zlib.zipFile(src,dest,Options,
                (err, data) => {
                    console.log("ACTS_zipFile_1600 err: " + err.code);
                    console.log("ACTS_zipFile_1600 data: " + data);
                    expect(err).assertEqual(0);
                    expect(data).assertEqual(0);
                });
        }catch(err) {
            console.error('ACTS_zipFile_1600  size  err:' + err);
        }
        let sizePath = '/data/test/amsZipfileUnzipfileST-signed.hap'
        let testPath ='/data/test/zip_amsZipfileUnzipfileST-signed.zip'
        try{
            var big = fileio.statSync(sizePath).size;
        }catch(err) {
            console.error('ACTS_zipFile_1600  big  err:' + err);
        }
        var small = fileio.statSync(testPath).size;
        try{
            expect(big>=small).assertEqual(1);
            console.log("big=" + big);
            console.log("small=" + small);
        }catch(err) {
            console.error('ACTS_zipFile_1600  assertTure  err:' + err);
        }
        console.debug('ACTS_zipFile_1600=====size======');
        try{
            expect(fileio.accessSync(testPath) != null).assertEqual(0);
        }
        catch(err){
            console.error("state +B presence");
        }
        console.debug('ACTS_zipFile_1600=====test======');
        function timeout() {
            try{
                expect().assertFail();
            }catch(err) {
                console.error('ACTS_zipFile_1600  assertFail  err:' + err);
            }
            console.debug('ACTS_zipFile_1600=====timeout======');
            done();
        }

        setTimeout(timeout, 5000);

    })
/*
 * @tc.number: ACTS_zipFile_1700
 * @tc.name: zipFile :
 * @tc.desc:
 */
    it('ACTS_zipFile_1700', 0, async function (done) {
        console.log("==================ACTS_zipFile_1700 start==================");
        var src ="/data/test/amsZipfileUnzipfileST-signed.hap";
        var dest ="/data/test/zip_amsZipfileUnzipfileST-signed.zip";

        try{
            var Options= {
                finishFlush:FLUSH_TYPE_BLOCK,
            };
        }catch(err) {
            console.error('ACTS_zipFile_1700  zip  err:' + err);
        }
        if (Options.finishFlush == 5){
            console.log("ACTS_zipFile_1700 It is an orange!");
        }
        else {
            console.log("ACTS_zipFile_1700 It is NOT an orange");
        }
        try{
            zlib.zipFile(src,dest,Options,
                (err, data) => {
                    console.log("ACTS_zipFile_1700 err: " + err.code);
                    console.log("ACTS_zipFile_1700 data: " + data);
                    expect(err).assertEqual(0);
                    expect(data).assertEqual(0);
                });
        }catch(err) {
            console.error('ACTS_zipFile_1700  size  err:' + err);
        }
        let sizePath = '/data/test/amsZipfileUnzipfileST-signed.hap'
        let testPath ='/data/test/zip_amsZipfileUnzipfileST-signed.zip'
        try{
            var big = fileio.statSync(sizePath).size;
        }catch(err) {
            console.error('ACTS_zipFile_1700  big  err:' + err);
        }
        var small = fileio.statSync(testPath).size;
        try{
            expect(big>=small).assertEqual(1);
            console.log("big=" + big);
            console.log("small=" + small);
        }catch(err) {
            console.error('ACTS_zipFile_1700  assertTure  err:' + err);
        }
        console.debug('ACTS_zipFile_1700=====size======');
        try{
            expect(fileio.accessSync(testPath) != null).assertEqual(0);
        }
        catch(err){
            console.error("state +B presence");
        }
        console.debug('ACTS_zipFile_1700=====test======');
        function timeout() {
            try{
                expect().assertFail();
            }catch(err) {
                console.error('ACTS_zipFile_1700  assertFail  err:' + err);
            }
            console.debug('ACTS_zipFile_1700=====timeout======');
            done();
        }

        setTimeout(timeout, 5000);

    })
/*
 * @tc.number: ACTS_zipFile_1800
 * @tc.name: zipFile :
 * @tc.desc:
 */
    it('ACTS_zipFile_1800', 0, async function (done) {
        console.log("==================ACTS_zipFile_1800 start==================");
        var src ="/data/test/amsZipfileUnzipfileST-signed.hap";
        var dest ="/data/test/zip_amsZipfileUnzipfileST-signed.zip";

        try{
            var Options= {
                finishFlush:FLUSH_TYPE_TREES,
            };
        }catch(err) {
            console.error('ACTS_zipFile_1800  zip  err:' + err);
        }
        if (Options.finishFlush == 6){
            console.log("ACTS_zipFile_1800 It is an orange!");
        }
        else {
            console.log("ACTS_zipFile_1800 It is NOT an orange");
        }
        try{
            zlib.zipFile(src,dest,Options,
                (err, data) => {
                    console.log("ACTS_zipFile_1800 err: " + err.code);
                    console.log("ACTS_zipFile_1800 data: " + data);
                    expect(err).assertEqual(0);
                    expect(data).assertEqual(0);
                });
        }catch(err) {
            console.error('ACTS_zipFile_1800  size  err:' + err);
        }
        let sizePath = '/data/test/amsZipfileUnzipfileST-signed.hap'
        let testPath ='/data/test/zip_amsZipfileUnzipfileST-signed.zip'
        try{
            var big = fileio.statSync(sizePath).size;
        }catch(err) {
            console.error('ACTS_zipFile_1800  big  err:' + err);
        }
        var small = fileio.statSync(testPath).size;
        try{
            expect(big>=small).assertEqual(1);
            console.log("big=" + big);
            console.log("small=" + small);
        }catch(err) {
            console.error('ACTS_zipFile_1800  assertTure  err:' + err);
        }
        console.debug('ACTS_zipFile_1800=====size======');
        try{
            expect(fileio.accessSync(testPath) != null).assertEqual(0);
        }
        catch(err){
            console.error("state +B presence");
        }
        console.debug('ACTS_zipFile_1800=====test======');
        function timeout() {
            try{
                expect().assertFail();
            }catch(err) {
                console.error('ACTS_zipFile_1800  assertFail  err:' + err);
            }
            console.debug('ACTS_zipFile_1800=====timeout======');
            done();
        }

        setTimeout(timeout, 5000);

    })
/*
 * @tc.number: ACTS_zipFile_1900
 * @tc.name: zipFile :
 * @tc.desc:
 */
    it('ACTS_zipFile_1900', 0, async function (done) {
        console.log("==================ACTS_zipFile_1300 start==================");
        var src ="/data/test/amsZipfileUnzipfileST-signed.hap";
        var dest ="/data/test/zip_amsZipfileUnzipfileST-signed.zip";

        try{
            var Options= {
                chunkSize:64,
            };
        }catch(err) {
            console.error('ACTS_zipFile_1900  zip  err:' + err);
        }
        if (Options.flush == 0){
            console.log("ACTS_zipFile_1900 It is an orange!");
        }
        else {
            console.log("ACTS_zipFile_1900 It is NOT an orange");
        }
        try{
            zlib.zipFile(src,dest,Options,
                (err, data) => {
                    console.log("ACTS_zipFile_1900 err: " + err.code);
                    console.log("ACTS_zipFile_1900 data: " + data);
                    expect(err).assertEqual(0);
                    expect(data).assertEqual(0);
                });
        }catch(err) {
            console.error('ACTS_zipFile_1900  size  err:' + err);
        }
        let sizePath = '/data/test/amsZipfileUnzipfileST-signed.hap'
        let testPath ='/data/test/zip_amsZipfileUnzipfileST-signed.zip'
        try{
            var big = fileio.statSync(sizePath).size;
        }catch(err) {
            console.error('ACTS_zipFile_1900  big  err:' + err);
        }
        var small = fileio.statSync(testPath).size;
        try{
            expect(big>=small).assertEqual(1);
            console.log("big=" + big);
            console.log("small=" + small);
        }catch(err) {
            console.error('ACTS_zipFile_1900  assertTure  err:' + err);
        }
        console.debug('ACTS_zipFile_1900=====size======');
        try{
            expect(fileio.accessSync(testPath) != null).assertEqual(0);
        }
        catch(err){
            console.error("state +B presence");
        }
        console.debug('ACTS_zipFile_1900=====test======');
        function timeout() {
            try{
                expect().assertFail();
            }catch(err) {
                console.error('ACTS_zipFile_1900  assertFail  err:' + err);
            }
            console.debug('ACTS_zipFile_1900=====timeout======');
            done();
        }

        setTimeout(timeout, 5000);

    })
/*
 * @tc.number: ACTS_zipFile_2000
 * @tc.name: zipFile :
 * @tc.desc:
 */
    it('ACTS_zipFile_2000', 0, async function (done) {
        console.log("==================ACTS_zipFile_2000 start==================");
        var src ="/data/test/amsZipfileUnzipfileST-signed.hap";
        var dest ="/data/test/zip_amsZipfileUnzipfileST-signed.zip";

        try{
            var Options= {
                chunkSize:1024,
            };
        }catch(err) {
            console.error('ACTS_zipFile_2000  zip  err:' + err);
        }
        if (Options.flush == 0){
            console.log("ACTS_zipFile_2000 It is an orange!");
        }
        else {
            console.log("ACTS_zipFile_2000 It is NOT an orange");
        }
        try{
            zlib.zipFile(src,dest,Options,
                (err, data) => {
                    console.log("ACTS_zipFile_2000 err: " + err.code);
                    console.log("ACTS_zipFile_2000 data: " + data);
                    expect(err).assertEqual(0);
                    expect(data).assertEqual(0);
                });
        }catch(err) {
            console.error('ACTS_zipFile_2000  size  err:' + err);
        }
        let sizePath = '/data/test/amsZipfileUnzipfileST-signed.hap'
        let testPath ='/data/test/zip_amsZipfileUnzipfileST-signed.zip'
        try{
            var big = fileio.statSync(sizePath).size;
        }catch(err) {
            console.error('ACTS_zipFile_2000  big  err:' + err);
        }
        var small = fileio.statSync(testPath).size;
        try{
            expect(big>=small).assertEqual(1);
            console.log("big=" + big);
            console.log("small=" + small);
        }catch(err) {
            console.error('ACTS_zipFile_2000  assertTure  err:' + err);
        }
        console.debug('ACTS_zipFile_2000=====size======');
        try{
            expect(fileio.accessSync(testPath) != null).assertEqual(0);
        }
        catch(err){
            console.error("state +B presence");
        }
        console.debug('ACTS_zipFile_2000=====test======');
        function timeout() {
            try{
                expect().assertFail();
            }catch(err) {
                console.error('ACTS_zipFile_2000  assertFail  err:' + err);
            }
            console.debug('ACTS_zipFile_2000=====timeout======');
            done();
        }

        setTimeout(timeout, 5000);

    })
/*
 * @tc.number: ACTS_zipFile_2100
 * @tc.name: zipFile :
 * @tc.desc:
 */
    it('ACTS_zipFile_2100', 0, async function (done) {
        console.log("==================ACTS_zipFile_2100 start==================");
        var src ="/data/test/amsZipfileUnzipfileST-signed.hap";
        var dest ="/data/test/zip_amsZipfileUnzipfileST-signed.zip";

        try{
            var Options= {
                chunkSize:999,
            };
        }catch(err) {
            console.error('ACTS_zipFile_2100  zip  err:' + err);
        }
        if (Options.flush == 0){
            console.log("ACTS_zipFile_2100 It is an orange!");
        }
        else {
            console.log("ACTS_zipFile_2100 It is NOT an orange");
        }
        try{
            zlib.zipFile(src,dest,Options,
                (err, data) => {
                    console.log("ACTS_zipFile_2100 err: " + err.code);
                    console.log("ACTS_zipFile_2100 data: " + data);
                    expect(err).assertEqual(0);
                    expect(data).assertEqual(0);
                });
        }catch(err) {
            console.error('ACTS_zipFile_2100  size  err:' + err);
        }
        let sizePath = '/data/test/amsZipfileUnzipfileST-signed.hap'
        let testPath ='/data/test/zip_amsZipfileUnzipfileST-signed.zip'
        try{
            var big = fileio.statSync(sizePath).size;
        }catch(err) {
            console.error('ACTS_zipFile_2100  big  err:' + err);
        }
        var small = fileio.statSync(testPath).size;
        try{
            expect(big>=small).assertEqual(1);
            console.log("big=" + big);
            console.log("small=" + small);
        }catch(err) {
            console.error('ACTS_zipFile_2100  assertTure  err:' + err);
        }
        console.debug('ACTS_zipFile_2100=====size======');
        try{
            expect(fileio.accessSync(testPath) != null).assertEqual(0);
        }
        catch(err){
            console.error("state +B presence");
        }
        console.debug('ACTS_zipFile_2100=====test======');
        function timeout() {
            try{
                expect().assertFail();
            }catch(err) {
                console.error('ACTS_zipFile_2100  assertFail  err:' + err);
            }
            console.debug('ACTS_zipFile_2100=====timeout======');
            done();
        }

        setTimeout(timeout, 5000);

    })
/*
 * @tc.number: ACTS_zipFile_2200
 * @tc.name: zipFile :
 * @tc.desc:
 */
    it('ACTS_zipFile_2200', 0, async function (done) {
        console.log("==================ACTS_zipFile_2200 start==================");
        var src ="/data/test/amsZipfileUnzipfileST-signed.hap";
        var dest ="/data/test/zip_amsZipfileUnzipfileST-signed.zip";

        try{
            var Options= {
                level:COMPRESS_LEVEL_NO_COMPRESSION,
            };
        }catch(err) {
            console.error('ACTS_zipFile_2200  zip  err:' + err);
        }
        if (Options.level == 0){
            console.log("ACTS_zipFile_2200 It is an orange!");
        }
        else {
            console.log("ACTS_zipFile_2200 It is NOT an orange");
        }
        try{
            zlib.zipFile(src,dest,Options,
                (err, data) => {
                    console.log("ACTS_zipFile_2200 err: " + err.code);
                    console.log("ACTS_zipFile_2200 data: " + data);
                    expect(err).assertEqual(0);
                    expect(data).assertEqual(0);
                });
        }catch(err) {
            console.error('ACTS_zipFile_2200  size  err:' + err);
        }
        let sizePath = '/data/test/amsZipfileUnzipfileST-signed.hap'
        let testPath ='/data/test/zip_amsZipfileUnzipfileST-signed.zip'
        try{
            var big = fileio.statSync(sizePath).size;
        }catch(err) {
            console.error('ACTS_zipFile_2200  big  err:' + err);
        }
        var small = fileio.statSync(testPath).size;
        try{
            expect(big>=small).assertEqual(1);
            console.log("big=" + big);
            console.log("small=" + small);
        }catch(err) {
            console.error('ACTS_zipFile_2200  assertTure  err:' + err);
        }
        console.debug('ACTS_zipFile_2200=====size======');
        try{
            expect(fileio.accessSync(testPath) != null).assertEqual(0);
        }
        catch(err){
            console.error("state +B presence");
        }
        console.debug('ACTS_zipFile_2200=====test======');
        function timeout() {
            try{
                expect().assertFail();
            }catch(err) {
                console.error('ACTS_zipFile_2200  assertFail  err:' + err);
            }
            console.debug('ACTS_zipFile_2200=====timeout======');
            done();
        }

        setTimeout(timeout, 5000);

    })
/*
 * @tc.number: ACTS_zipFile_2300
 * @tc.name: zipFile :
 * @tc.desc:
 */
    it('ACTS_zipFile_2300', 0, async function (done) {
        console.log("==================ACTS_zipFile_2300 start==================");
        var src ="/data/test/amsZipfileUnzipfileST-signed.hap";
        var dest ="/data/test/zip_amsZipfileUnzipfileST-signed.zip";

        try{
            var Options= {
                level:COMPRESS_LEVEL_BEST_SPEED,
            };
        }catch(err) {
            console.error('ACTS_zipFile_2300  zip  err:' + err);
        }
        if (Options.level == 1){
            console.log("ACTS_zipFile_2300 It is an orange!");
        }
        else {
            console.log("ACTS_zipFile_2300 It is NOT an orange");
        }
        try{
            zlib.zipFile(src,dest,Options,
                (err, data) => {
                    console.log("ACTS_zipFile_2300 err: " + err.code);
                    console.log("ACTS_zipFile_2300 data: " + data);
                    expect(err).assertEqual(0);
                    expect(data).assertEqual(0);
                });
        }catch(err) {
            console.error('ACTS_zipFile_2300  size  err:' + err);
        }
        let sizePath = '/data/test/amsZipfileUnzipfileST-signed.hap'
        let testPath ='/data/test/zip_amsZipfileUnzipfileST-signed.zip'
        try{
            var big = fileio.statSync(sizePath).size;
        }catch(err) {
            console.error('ACTS_zipFile_2000  big  err:' + err);
        }
        var small = fileio.statSync(testPath).size;
        try{
            expect(big>=small).assertEqual(1);
            console.log("big=" + big);
            console.log("small=" + small);
        }catch(err) {
            console.error('ACTS_zipFile_2300  assertTure  err:' +  err);
        }
        console.debug('ACTS_zipFile_2300=====size======');
        try{
            expect(fileio.accessSync(testPath) != null).assertEqual(0);
        }
        catch(err){
            console.error("state +B presence");
        }
        console.debug('ACTS_zipFile_2300=====test======');
        function timeout() {
            try{
                expect().assertFail();
            }catch(err) {
                console.error('ACTS_zipFile_2000  assertFail  err:' + err);
            }
            console.debug('ACTS_zipFile_2000=====timeout======');
            done();
        }

        setTimeout(timeout, 5000);

    })
/*
 * @tc.number: ACTS_zipFile_2400
 * @tc.name: zipFile :
 * @tc.desc:
 */
    it('ACTS_zipFile_2000', 0, async function (done) {
        console.log("==================ACTS_zipFile_2400 start==================");
        var src ="/data/test/amsZipfileUnzipfileST-signed.hap";
        var dest ="/data/test/zip_amsZipfileUnzipfileST-signed.zip";

        try{
            var Options= {
                level:COMPRESS_LEVEL_BEST_COMPRESSION,
            };
        }catch(err) {
            console.error('ACTS_zipFile_2400  zip  err:' + err);
        }
        if (Options.level == 9){
            console.log("ACTS_zipFile_2400 It is an orange!");
        }
        else {
            console.log("ACTS_zipFile_2400 It is NOT an orange");
        }
        try{
            zlib.zipFile(src,dest,Options,
                (err, data) => {
                    console.log("ACTS_zipFile_2400 err: " + err.code);
                    console.log("ACTS_zipFile_2400 data: " + data);
                    expect(err).assertEqual(0);
                    expect(data).assertEqual(0);
                });
        }catch(err) {
            console.error('ACTS_zipFile_2000  size  err:' + err);
        }
        let sizePath = '/data/test/amsZipfileUnzipfileST-signed.hap'
        let testPath ='/data/test/zip_amsZipfileUnzipfileST-signed.zip'
        try{
            var big = fileio.statSync(sizePath).size;
        }catch(err) {
            console.error('ACTS_zipFile_2400  big  err:' + err);
        }
        var small = fileio.statSync(testPath).size;
        try{
            expect(big>=small).assertEqual(1);
            console.log("big=" + big);
            console.log("small=" + small);
        }catch(err) {
            console.error('ACTS_zipFile_2400  assertTure  err:' + err);
        }
        console.debug('ACTS_zipFile_2400=====size======');
        try{
            expect(fileio.accessSync(testPath) != null).assertEqual(0);
        }
        catch(err){
            console.error("state +B presence");
        }
        console.debug('ACTS_zipFile_2400=====test======');
        function timeout() {
            try{
                expect().assertFail();
            }catch(err) {
                console.error('ACTS_zipFile_2400  assertFail  err:' + err);
            }
            console.debug('ACTS_zipFile_2400=====timeout======');
            done();
        }

        setTimeout(timeout, 5000);

    })
/*
 * @tc.number: ACTS_zipFile_2500
 * @tc.name: zipFile :
 * @tc.desc:
 */
    it('ACTS_zipFile_2500', 0, async function (done) {
        console.log("==================ACTS_zipFile_2500 start==================");
        var src ="/data/test/amsZipfileUnzipfileST-signed.hap";
        var dest ="/data/test/zip_amsZipfileUnzipfileST-signed.zip";

        try{
            var Options= {
                level:COMPRESS_LEVEL_DEFAULT_COMPRESSION,
            };
        }catch(err) {
            console.error('ACTS_zipFile_2500  zip  err:' + err);
        }
        if (Options.level == -1){
            console.log("ACTS_zipFile_2500 It is an orange!");
        }
        else {
            console.log("ACTS_zipFile_2500 It is NOT an orange");
        }
        try{
            zlib.zipFile(src,dest,Options,
                (err, data) => {
                    console.log("ACTS_zipFile_2500 err: " + err.code);
                    console.log("ACTS_zipFile_2500 data: " + data);
                    expect(err).assertEqual(0);
                    expect(data).assertEqual(0);
                });
        }catch(err) {
            console.error('ACTS_zipFile_2500  size  err:' + err);
        }
        let sizePath = '/data/test/amsZipfileUnzipfileST-signed.hap'
        let testPath ='/data/test/zip_amsZipfileUnzipfileST-signed.zip'
        try{
            var big = fileio.statSync(sizePath).size;
        }catch(err) {
            console.error('ACTS_zipFile_2500  big  err:' + err);
        }
        var small = fileio.statSync(testPath).size;
        try{
            expect(big>=small).assertEqual(1);
            console.log("big=" + big);
            console.log("small=" + small);
        }catch(err) {
            console.error('ACTS_zipFile_2500  assertTure  err:' + err);
        }
        console.debug('ACTS_zipFile_2500=====size======');
        try{
            expect(fileio.accessSync(testPath) != null).assertEqual(0);
        }
        catch(err){
            console.error("state +B presence");
        }
        console.debug('ACTS_zipFile_2500=====test======');
        function timeout() {
            try{
                expect().assertFail();
            }catch(err) {
                console.error('ACTS_zipFile_2500  assertFail  err:' + err);
            }
            console.debug('ACTS_zipFile_2500=====timeout======');
            done();
        }

        setTimeout(timeout, 5000);

    })
/*
 * @tc.number: ACTS_zipFile_2600
 * @tc.name: zipFile :
 * @tc.desc:
 */
    it('ACTS_zipFile_2600', 0, async function (done) {
        console.log("==================ACTS_zipFile_2600 start==================");
        var src ="/data/test/amsZipfileUnzipfileST-signed.hap";
        var dest ="/data/test/zip_amsZipfileUnzipfileST-signed.zip";

        try{
            var Options= {
                memLevel:MEM_LEVEL_MIN_MEMLEVEL,
            };
        }catch(err) {
            console.error('ACTS_zipFile_2600  zip  err:' + err);
        }
        if (Options.memLevel == 1){
            console.log("ACTS_zipFile_2600 It is an orange!");
        }
        else {
            console.log("ACTS_zipFile_2600 It is NOT an orange");
        }
        try{
            zlib.zipFile(src,dest,Options,
                (err, data) => {
                    console.log("ACTS_zipFile_2600 err: " + err.code);
                    console.log("ACTS_zipFile_2600 data: " + data);
                    expect(err).assertEqual(0);
                    expect(data).assertEqual(0);
                });
        }catch(err) {
            console.error('ACTS_zipFile_2600  size  err:' + err);
        }
        let sizePath = '/data/test/amsZipfileUnzipfileST-signed.hap'
        let testPath ='/data/test/zip_amsZipfileUnzipfileST-signed.zip'
        try{
            var big = fileio.statSync(sizePath).size;
        }catch(err) {
            console.error('ACTS_zipFile_2600  big  err:' + err);
        }
        var small = fileio.statSync(testPath).size;
        try{
            expect(big>=small).assertEqual(1);
            console.log("big=" + big);
            console.log("small=" + small);
        }catch(err) {
            console.error('ACTS_zipFile_2600  assertTure  err:' + err);
        }
        console.debug('ACTS_zipFile_2600=====size======');
        try{
            expect(fileio.accessSync(testPath) != null).assertEqual(0);
        }
        catch(err){
            console.error("state +B presence");
        }
        console.debug('ACTS_zipFile_2600=====test======');
        function timeout() {
            try{
                expect().assertFail();
            }catch(err) {
                console.error('ACTS_zipFile_2600  assertFail  err:' + err);
            }
            console.debug('ACTS_zipFile_2600=====timeout======');
            done();
        }

        setTimeout(timeout, 5000);

    })
/*
 * @tc.number: ACTS_zipFile_2700
 * @tc.name: zipFile :
 * @tc.desc:
 */
    it('ACTS_zipFile_2700', 0, async function (done) {
        console.log("==================ACTS_zipFile_2700 start==================");
        var src ="/data/test/amsZipfileUnzipfileST-signed.hap";
        var dest ="/data/test/zip_amsZipfileUnzipfileST-signed.zip";

        try{
            var Options= {
                memLevel:MEM_LEVEL_MAX_MEMLEVEL,
            };
        }catch(err) {
            console.error('ACTS_zipFile_2700  zip  err:' + err);
        }
        if (Options.memLevel == 9){
            console.log("ACTS_zipFile_2700 It is an orange!");
        }
        else {
            console.log("ACTS_zipFile_2700 It is NOT an orange");
        }
        try{
            zlib.zipFile(src,dest,Options,
                (err, data) => {
                    console.log("ACTS_zipFile_2700 err: " + err.code);
                    console.log("ACTS_zipFile_2700 data: " + data);
                    expect(err).assertEqual(0);
                    expect(data).assertEqual(0);
                });
        }catch(err) {
            console.error('ACTS_zipFile_2700  size  err:' + err);
        }
        let sizePath = '/data/test/amsZipfileUnzipfileST-signed.hap'
        let testPath ='/data/test/zip_amsZipfileUnzipfileST-signed.zip'
        try{
            var big = fileio.statSync(sizePath).size;
        }catch(err) {
            console.error('ACTS_zipFile_2700  big  err:' + err);
        }
        var small = fileio.statSync(testPath).size;
        try{
            expect(big>=small).assertEqual(1);
            console.log("big=" + big);
            console.log("small=" + small);
        }catch(err) {
            console.error('ACTS_zipFile_2700  assertTure  err:' + err);
        }
        console.debug('ACTS_zipFile_2700=====size======');
        try{
            expect(fileio.accessSync(testPath) != null).assertEqual(0);
        }
        catch(err){
            console.error("state +B presence");
        }
        console.debug('ACTS_zipFile_2700=====test======');
        function timeout() {
            try{
                expect().assertFail();
            }catch(err) {
                console.error('ACTS_zipFile_2700  assertFail  err:' + err);
            }
            console.debug('ACTS_zipFile_2700=====timeout======');
            done();
        }

        setTimeout(timeout, 5000);

    })
/*
 * @tc.number: ACTS_zipFile_2800
 * @tc.name: zipFile :
 * @tc.desc:
 */
    it('ACTS_zipFile_2800', 0, async function (done) {
        console.log("==================ACTS_zipFile_2800 start==================");
        var src ="/data/test/amsZipfileUnzipfileST-signed.hap";
        var dest ="/data/test/zip_amsZipfileUnzipfileST-signed.zip";

        try{
            var Options= {
                memLevel:MEM_LEVEL_DEFAULT_MEMLEVEL,
            };
        }catch(err) {
            console.error('ACTS_zipFile_2800  zip  err:' + err);
        }
        if (Options.memLevel == 8){
            console.log("ACTS_zipFile_2800 It is an orange!");
        }
        else {
            console.log("ACTS_zipFile_2800 It is NOT an orange");
        }
        try{
            zlib.zipFile(src,dest,Options,
                (err, data) => {
                    console.log("ACTS_zipFile_2800 err: " + err.code);
                    console.log("ACTS_zipFile_2800 data: " + data);
                    expect(err).assertEqual(0);
                    expect(data).assertEqual(0);
                });
        }catch(err) {
            console.error('ACTS_zipFile_2800  size  err:' + err);
        }
        let sizePath = '/data/test/amsZipfileUnzipfileST-signed.hap'
        let testPath ='/data/test/zip_amsZipfileUnzipfileST-signed.zip'
        try{
            var big = fileio.statSync(sizePath).size;
        }catch(err) {
            console.error('ACTS_zipFile_2800  big  err:' + err);
        }
        var small = fileio.statSync(testPath).size;
        try{
            expect(big>=small).assertEqual(1);
            console.log("big=" + big);
            console.log("small=" + small);
        }catch(err) {
            console.error('ACTS_zipFile_2800  assertTure  err:' + err);
        }
        console.debug('ACTS_zipFile_2800=====size======');
        try{
            expect(fileio.accessSync(testPath) != null).assertEqual(0);
        }
        catch(err){
            console.error("state +B presence");
        }
        console.debug('ACTS_zipFile_2800=====test======');
        function timeout() {
            try{
                expect().assertFail();
            }catch(err) {
                console.error('ACTS_zipFile_2800  assertFail  err:' + err);
            }
            console.debug('ACTS_zipFile_2800=====timeout======');
            done();
        }

        setTimeout(timeout, 5000);

    })
/*
 * @tc.number: ACTS_zipFile_2900
 * @tc.name: zipFile :
 * @tc.desc:
 */
    it('ACTS_zipFile_2900', 0, async function (done) {
        console.log("==================ACTS_zipFile_2900 start==================");
        var src ="/data/test/amsZipfileUnzipfileST-signed.hap";
        var dest ="/data/test/zip_amsZipfileUnzipfileST-signed.zip";

        try{
            var Options= {
                strategy:COMPRESS_STRATEGY_DEFAULT_STRATEGY,
            };
        }catch(err) {
            console.error('ACTS_zipFile_2900  zip  err:' + err);
        }
        if (Options.strategy == 0){
            console.log("ACTS_zipFile_2900 It is an orange!");
        }
        else {
            console.log("ACTS_zipFile_2900 It is NOT an orange");
        }
        try{
            zlib.zipFile(src,dest,Options,
                (err, data) => {
                    console.log("ACTS_zipFile_2900 err: " + err.code);
                    console.log("ACTS_zipFile_2900 data: " + data);
                    expect(err).assertEqual(0);
                    expect(data).assertEqual(0);
                });
        }catch(err) {
            console.error('ACTS_zipFile_2900  size  err:' + err);
        }
        let sizePath = '/data/test/amsZipfileUnzipfileST-signed.hap'
        let testPath ='/data/test/zip_amsZipfileUnzipfileST-signed.zip'
        try{
            var big = fileio.statSync(sizePath).size;
        }catch(err) {
            console.error('ACTS_zipFile_2900  big  err:' + err);
        }
        var small = fileio.statSync(testPath).size;
        try{
            expect(big>=small).assertEqual(1);
            console.log("big=" + big);
            console.log("small=" + small);
        }catch(err) {
            console.error('ACTS_zipFile_2900  assertTure  err:' + err);
        }
        console.debug('ACTS_zipFile_2900=====size======');
        try{
            expect(fileio.accessSync(testPath) != null).assertEqual(0);
        }
        catch(err){
            console.error("state +B presence");
        }
        console.debug('ACTS_zipFile_2900=====test======');
        function timeout() {
            try{
                expect().assertFail();
            }catch(err) {
                console.error('ACTS_zipFile_2900  assertFail  err:' + err);
            }
            console.debug('ACTS_zipFile_2900=====timeout======');
            done();
        }

        setTimeout(timeout, 5000);

    })
/*
 * @tc.number: ACTS_zipFile_3000
 * @tc.name: zipFile :
 * @tc.desc:
 */
    it('ACTS_zipFile_3000', 0, async function (done) {
        console.log("==================ACTS_zipFile_3000 start==================");
        var src ="/data/test/amsZipfileUnzipfileST-signed.hap";
        var dest ="/data/test/zip_amsZipfileUnzipfileST-signed.zip";

        try{
            var Options= {
                strategy:COMPRESS_STRATEGY_FILTERED,
            };
        }catch(err) {
            console.error('ACTS_zipFile_3000  zip  err:' + err);
        }
        if (Options.strategy == 1){
            console.log("ACTS_zipFile_3000 It is an orange!");
        }
        else {
            console.log("ACTS_zipFile_3000 It is NOT an orange");
        }
        try{
            zlib.zipFile(src,dest,Options,
                (err, data) => {
                    console.log("ACTS_zipFile_3000 err: " + err.code);
                    console.log("ACTS_zipFile_3000 data: " + data);
                    expect(err).assertEqual(0);
                    expect(data).assertEqual(0);
                });
        }catch(err) {
            console.error('ACTS_zipFile_3000  size  err:' + err);
        }
        let sizePath = '/data/test/amsZipfileUnzipfileST-signed.hap'
        let testPath ='/data/test/zip_amsZipfileUnzipfileST-signed.zip'
        try{
            var big = fileio.statSync(sizePath).size;
        }catch(err) {
            console.error('ACTS_zipFile_3000  big  err:'+err);
        }
        var small = fileio.statSync(testPath).size;
        try{
            expect(big>=small).assertEqual(1);
            console.log("big=" + big);
            console.log("small=" + small);
        }catch(err) {
            console.error('ACTS_zipFile_3000  assertTure  err:' + err);
        }
        console.debug('ACTS_zipFile_3000=====size======');
        try{
            expect(fileio.accessSync(testPath) != null).assertEqual(0);
        }
        catch(err){
            console.error("state +B presence");
        }
        console.debug('ACTS_zipFile_3000=====test======');
        function timeout() {
            try{
                expect().assertFail();
            }catch(err) {
                console.error('ACTS_zipFile_3000  assertFail  err:' + err);
            }
            console.debug('ACTS_zipFile_3000=====timeout======');
            done();
        }

        setTimeout(timeout, 5000);

    })
/*
 * @tc.number: ACTS_zipFile_3100
 * @tc.name: zipFile :
 * @tc.desc:
 */
    it('ACTS_zipFile_3100', 0, async function (done) {
        console.log("==================ACTS_zipFile_3100 start==================");
        var src ="/data/test/amsZipfileUnzipfileST-signed.hap";
        var dest ="/data/test/zip_amsZipfileUnzipfileST-signed.zip";

        try{
            var Options= {
                strategy:COMPRESS_STRATEGY_HUFFMAN_ONLY,
            };
        }catch(err) {
            console.error('ACTS_zipFile_3100  zip  err:' + err);
        }
        if (Options.strategy == 2){
            console.log("ACTS_zipFile_3100 It is an orange!");
        }
        else {
            console.log("ACTS_zipFile_3100 It is NOT an orange");
        }
        try{
            zlib.zipFile(src,dest,Options,
                (err, data) => {
                    console.log("ACTS_zipFile_3100 err: " + err.code);
                    console.log("ACTS_zipFile_3100 data: " + data);
                    expect(err).assertEqual(0);
                    expect(data).assertEqual(0);
                });
        }catch(err) {
            console.error('ACTS_zipFile_3100  size  err:' + err);
        }
        let sizePath = '/data/test/amsZipfileUnzipfileST-signed.hap'
        let testPath ='/data/test/zip_amsZipfileUnzipfileST-signed.zip'
        try{
            var big = fileio.statSync(sizePath).size;
        }catch(err) {
            console.error('ACTS_zipFile_3100  big  err:' + err);
        }
        var small = fileio.statSync(testPath).size;
        try{
            expect(big>=small).assertEqual(1);
            console.log("big=" + big);
            console.log("small=" + small);
        }catch(err) {
            console.error('ACTS_zipFile_3100  assertTure  err:' + err);
        }
        console.debug('ACTS_zipFile_3100=====size======');
        try{
            expect(fileio.accessSync(testPath) != null).assertEqual(0);
        }
        catch(err){
            console.error("state +B presence");
        }
        console.debug('ACTS_zipFile_3100=====test======');
        function timeout() {
            try{
                expect().assertFail();
            }catch(err) {
                console.error('ACTS_zipFile_3100  assertFail  err:' + err);
            }
            console.debug('ACTS_zipFile_3100=====timeout======');
            done();
        }

        setTimeout(timeout, 5000);

    })
/*
 * @tc.number: ACTS_zipFile_3200
 * @tc.name: zipFile :
 * @tc.desc:
 */
    it('ACTS_zipFile_3200', 0, async function (done) {
        console.log("==================ACTS_zipFile_3200 start==================");
        var src ="/data/test/amsZipfileUnzipfileST-signed.hap";
        var dest ="/data/test/zip_amsZipfileUnzipfileST-signed.zip";

        try{
            var Options= {
                strategy:COMPRESS_STRATEGY_RLE,
            };
        }catch(err) {
            console.error('ACTS_zipFile_3200  zip  err:' + err);
        }
        if (Options.strategy == 3){
            console.log("ACTS_zipFile_3200 It is an orange!");
        }
        else {
            console.log("ACTS_zipFile_3200 It is NOT an orange");
        }
        try{
            zlib.zipFile(src,dest,Options,
                (err, data) => {
                    console.log("ACTS_zipFile_3200 err: " + err.code);
                    console.log("ACTS_zipFile_3200 data: " + data);
                    expect(err).assertEqual(0);
                    expect(data).assertEqual(0);
                });
        }catch(err) {
            console.error('ACTS_zipFile_3200  size  err:' + err);
        }
        let sizePath = '/data/test/amsZipfileUnzipfileST-signed.hap'
        let testPath ='/data/test/zip_amsZipfileUnzipfileST-signed.zip'
        try{
            var big = fileio.statSync(sizePath).size;
        }catch(err) {
            console.error('ACTS_zipFile_3200  big  err:' + err);
        }
        var small = fileio.statSync(testPath).size;
        try{
            expect(big>=small).assertEqual(1);
            console.log("big=" + big);
            console.log("small=" + small);
        }catch(err) {
            console.error('ACTS_zipFile_3200  assertTure  err:' + err);
        }
        console.debug('ACTS_zipFile_3200=====size======');
        try{
            expect(fileio.accessSync(testPath) != null).assertEqual(0);
        }
        catch(err){
            console.error("state +B presence");
        }
        console.debug('ACTS_zipFile_3200=====test======');
        function timeout() {
            try{
                expect().assertFail();
            }catch(err) {
                console.error('ACTS_zipFile_3200  assertFail  err:' + err);
            }
            console.debug('ACTS_zipFile_3200=====timeout======');
            done();
        }

        setTimeout(timeout, 5000);

    })
/*
 * @tc.number: ACTS_zipFile_3300
 * @tc.name: zipFile :
 * @tc.desc:
 */
    it('ACTS_zipFile_3300', 0, async function (done) {
        console.log("==================ACTS_zipFile_3300 start==================");
        var src ="/data/test/amsZipfileUnzipfileST-signed.hap";
        var dest ="/data/test/zip_amsZipfileUnzipfileST-signed.zip";

        try{
            var Options= {
                strategy:COMPRESS_STRATEGY_FIXED,
            };
        }catch(err) {
            console.error('ACTS_zipFile_3300  zip  err:' + err);
        }
        if (Options.strategy == 4){
            console.log("ACTS_zipFile_3300 It is an orange!");
        }
        else {
            console.log("ACTS_zipFile_3300 It is NOT an orange");
        }
        try{
            zlib.zipFile(src,dest,Options,
                (err, data) => {
                    console.log("ACTS_zipFile_3300 err: " + err.code);
                    console.log("ACTS_zipFile_3300 data: " + data);
                    expect(err).assertEqual(0);
                    expect(data).assertEqual(0);
                });
        }catch(err) {
            console.error('ACTS_zipFile_3300  size  err:' + err);
        }
        let sizePath = '/data/test/amsZipfileUnzipfileST-signed.hap'
        let testPath ='/data/test/zip_amsZipfileUnzipfileST-signed.zip'
        try{
            var big = fileio.statSync(sizePath).size;
        }catch(err) {
            console.error('ACTS_zipFile_3300  big  err:' + err);
        }
        var small = fileio.statSync(testPath).size;
        try{
            expect(big>=small).assertEqual(1);
            console.log("big=" + big);
            console.log("small=" + small);
        }catch(err) {
            console.error('ACTS_zipFile_3300  assertTure  err:' + err);
        }
        console.debug('ACTS_zipFile_3300=====size======');
        try{
            expect(fileio.accessSync(testPath) != null).assertEqual(0);
        }
        catch(err){
            console.error("state +B presence");
        }
        console.debug('ACTS_zipFile_3300=====test======');
        function timeout() {
            try{
                expect().assertFail();
            }catch(err) {
                console.error('ACTS_zipFile_3300  assertFail  err:' + err);
            }
            console.debug('ACTS_zipFile_3300=====timeout======');
            done();
        }

        setTimeout(timeout, 5000);

    })
/*
 * @tc.number: ACTS_unzipFile_0100
 * @tc.name: unzipFile :
 * @tc.desc:
 */
    it('ACTS_unzipFile_0100', 0, async function (done) {
        var src ="";
            var dest ="";
             zlib.unzipFile(src,dest,
                (err, data) => {
                    console.log("ACTS_unzipFile_0100 err: " + err.code);
                    console.log("ACTS_unzipFile_0100 data: " + data);
                    expect(err).assertEqual(0);
                    expect(data).assertEqual(0);
                });

            function timeout() {
                expect().assertFail();
                console.debug('ACTS_unzipFile_0100=====timeout======');
                done();
            }
            setTimeout(timeout, 5000);
        })
/*
 * @tc.number: ACTS_unzipFile_0200
 * @tc.name: unzipFile :
 * @tc.desc:
 */
    it('ACTS_unzipFile_0200', 0, async function (done) {
        var src ="/data/test/amsZipfileUnzipfileST-signed.hap";
        var dest ="/data/test/";


        zlib.unzipFile(src,dest,
            (err, data) => {
                console.log("ACTS_unzipFile_0200 err: " + err.code);
                console.log("ACTS_unzipFile_0200 data: " + data);
                expect(err).assertEqual(0);
                expect(data).assertEqual(0);
            });

        function timeout() {
            expect().assertFail();
            console.debug('ACTS_unzipFile_0200=====timeout======');
            done();
        }
        setTimeout(timeout, 5000);
    })
/*
 * @tc.number: ACTS_unzipFile_0300
 * @tc.name: unzipFile :
 * @tc.desc:
 */
    it('ACTS_unzipFile_0300', 0, async function (done) {
        var src ="/data/test/amsZipfileUnzipfileST-signed.hap";
        var dest ="/data/test/amsZipfileUnzipfileST-signed.hap";

        zlib.unzipFile(src,dest,
            (err, data) => {
                console.log("ACTS_unzipFile_0300 err: " + err.code);
                console.log("ACTS_unzipFile_0300 data: " + data);
                expect(err).assertEqual(0);
                expect(data).assertEqual(0);
            });

        function timeout() {
            expect().assertFail();
            console.debug('ACTS_unzipFile_0300=====timeout======');
            done();
        }
        setTimeout(timeout, 5000);
    })
/*
 * @tc.number: ACTS_unzipFile_0400
 * @tc.name: unzipFile :
 * @tc.desc:
 */
    it('ACTS_unzipFile_0400', 0, async function (done) {
        var src ="/data/test/zip_amsZipfileUnzipfileST-signed.zip";
        var dest ="/data/testA/amsZipfileUnzipfileST-signed.hap";


        zlib.unzipFile(src,dest,
            (err, data) => {
                console.log("ACTS_unzipFile_0400 err: " + err.code);
                console.log("ACTS_unzipFile_0400 data: " + data);
                expect(err).assertEqual(0);
                expect(data).assertEqual(0);
            });

        function timeout() {
            expect().assertFail();
            console.debug('ACTS_unzipFile_0400=====timeout======');
            done();
        }
        setTimeout(timeout, 5000);
    })
/*
 * @tc.number: ACTS_unzipFile_0500
 * @tc.name: unzipFile :
 * @tc.desc:
 */
    it('ACTS_unzipFile_0500', 0, async function (done) {
        console.log("==================ACTS_unzipFile_0500 start==================");
        var src ="/data/test/zip_amsZipfileUnzipfileST-signed.zip";
        var dest ="/data/test/amsZipfileUnzipfileST-signed.hap";

        try{
            var Options= {
                finishFlush:FLUSH_TYPE_NO_FLUSH,
            };
        }catch(err) {
            console.error('ACTS_unzipFile_0500  zip  err:' + err);
        }
        if (Options.finishFlush == 0){
            console.log("ACTS_unzipFile_0500 It is an orange!");
        }
        else {
            console.log("ACTS_unzipFile_0500 It is NOT an orange");
        }
        try{
            zlib.unzipFile(src,dest,Options,
                (err, data) => {
                    console.log("ACTS_unzipFile_0500 err: " + err.code);
                    console.log("ACTS_unzipFile_0500 data: " + data);
                    expect(err).assertEqual(0);
                    expect(data).assertEqual(0);
                });
        }catch(err) {
            console.error('ACTS_unzipFile_0500  size  err:' + err);
        }
        let sizePath = '/data/test/zip_amsZipfileUnzipfileST-signed.zip'
        let testPath ='/data/test/amsZipfileUnzipfileST-signed.hap'
        try{
            var big = fileio.statSync(sizePath).size;
        }catch(err) {
            console.error('ACTS_unzipFile_0500  big  err:' + err);
        }
        var small = fileio.statSync(testPath).size;
        try{
            expect(big<=small).assertEqual(1);
            console.log("big=" + big);
            console.log("small=" + small);
        }catch(err) {
            console.error('ACTS_unzipFile_0500  assertTure  err:' + err);
        }
        console.debug('ACTS_unzipFile_0500=====size======');
        try{
            expect(fileio.accessSync(testPath) != null).assertEqual(0);
        }
        catch(err){
            console.error("state +B presence");
        }
        console.debug('ACTS_unzipFile_0500=====test======');
        function timeout() {
            try{
                expect().assertFail();
            }catch(err) {
                console.error('ACTS_unzipFile_0500  assertFail  err:' + err);
            }
            console.debug('ACTS_unzipFile_0500=====timeout======');
            done();
        }

        setTimeout(timeout, 5000);

    })
/*
 * @tc.number: ACTS_unzipFile_0600
 * @tc.name: unzipFile :
 * @tc.desc:
 */
    it('ACTS_unzipFile_0600', 0, async function (done) {
        console.log("==================ACTS_unzipFile_0600 start==================");
        var src ="/data/test/zip_amsZipfileUnzipfileST-signed.zip";
        var dest ="/data/test/amsZipfileUnzipfileST-signed.hap";

        try{
            var Options= {
                finishFlush:FLUSH_TYPE_PARTIAL_FLUSH,
            };
        }catch(err) {
            console.error('ACTS_unzipFile_0600  zip  err:' + err);
        }
        if (Options.finishFlush == 1){
            console.log("ACTS_unzipFile_0600 It is an orange!");
        }
        else {
            console.log("ACTS_unzipFile_0600 It is NOT an orange");
        }
        try{
            zlib.unzipFile(src,dest,Options,
                (err, data) => {
                    console.log("ACTS_unzipFile_0600 err: " + err.code);
                    console.log("ACTS_unzipFile_0600 data: " + data);
                    expect(err).assertEqual(0);
                    expect(data).assertEqual(0);
                });
        }catch(err) {
            console.error('ACTS_unzipFile_0600  size  err:' + err);
        }
        let sizePath = '/data/test/zip_amsZipfileUnzipfileST-signed.zip'
        let testPath ='/data/test/amsZipfileUnzipfileST-signed.hap'
        try{
            var big = fileio.statSync(sizePath).size;
        }catch(err) {
            console.error('ACTS_unzipFile_0600  big  err:' + err);
        }
        var small = fileio.statSync(testPath).size;
        try{
            expect(big<=small).assertEqual(1);
            console.log("big=" + big);
            console.log("small=" + small);
        }catch(err) {
            console.error('ACTS_unzipFile_0600  assertTure  err:' + err);
        }
        console.debug('ACTS_unzipFile_0600=====size======');
        try{
            expect(fileio.accessSync(testPath) != null).assertEqual(0);
        }
        catch(err){
            console.error("state +B presence");
        }
        console.debug('ACTS_unzipFile_0600=====test======');
        function timeout() {
            try{
                expect().assertFail();
            }catch(err) {
                console.error('ACTS_unzipFile_0600  assertFail  err:' + err);
            }
            console.debug('ACTS_unzipFile_0600=====timeout======');
            done();
        }

        setTimeout(timeout, 5000);

    })
/*
 * @tc.number: ACTS_unzipFile_0700
 * @tc.name: unzipFile :
 * @tc.desc:
 */
    it('ACTS_unzipFile_0700', 0, async function (done) {
        console.log("==================ACTS_unzipFile_0700 start==================");
        var src ="/data/test/zip_amsZipfileUnzipfileST-signed.zip";
        var dest ="/data/test/amsZipfileUnzipfileST-signed.hap";

        try{
            var Options= {
                finishFlush:FLUSH_TYPE_SYNC_FLUSH,
            };
        }catch(err) {
            console.error('ACTS_unzipFile_0700  zip  err:'+err);
        }
        if (Options.finishFlush == 2){
            console.log("ACTS_unzipFile_0700 It is an orange!");
        }
        else {
            console.log("ACTS_unzipFile_0700 It is NOT an orange");
        }
        try{
            zlib.unzipFile(src,dest,Options,
                (err, data) => {
                    console.log("ACTS_unzipFile_0700 err: " + err.code);
                    console.log("ACTS_unzipFile_0700 data: " + data);
                    expect(err).assertEqual(0);
                    expect(data).assertEqual(0);
                });
        }catch(err) {
            console.error('ACTS_unzipFile_0700  size  err:' + err);
        }
        let sizePath = '/data/test/zip_amsZipfileUnzipfileST-signed.zip'
        let testPath ='/data/test/amsZipfileUnzipfileST-signed.hap'
        try{
            var big = fileio.statSync(sizePath).size;
        }catch(err) {
            console.error('ACTS_unzipFile_0700  big  err:' + err);
        }
        var small = fileio.statSync(testPath).size;
        try{
            expect(big<=small).assertEqual(1);
            console.log("big=" + big);
            console.log("small=" + small);
        }catch(err) {
            console.error('ACTS_unzipFile_0700  assertTure  err:' + err);
        }
        console.debug('ACTS_unzipFile_0700=====size======');
        try{
            expect(fileio.accessSync(testPath) != null).assertEqual(0);
        }
        catch(err){
            console.error("state +B presence");
        }
        console.debug('ACTS_unzipFile_0700=====test======');
        function timeout() {
            try{
                expect().assertFail();
            }catch(err) {
                console.error('ACTS_unzipFile_0700  assertFail  err:' + err);
            }
            console.debug('ACTS_unzipFile_0700=====timeout======');
            done();
        }

        setTimeout(timeout, 5000);

    })
/*
 * @tc.number: ACTS_unzipFile_0800
 * @tc.name: unzipFile :
 * @tc.desc:
 */
    it('ACTS_unzipFile_0800', 0, async function (done) {
        console.log("==================ACTS_unzipFile_0800 start==================");
        var src ="/data/test/zip_amsZipfileUnzipfileST-signed.zip";
        var dest ="/data/test/amsZipfileUnzipfileST-signed.hap";

        try{
            var Options= {
                finishFlush:FLUSH_TYPE_FULL_FLUSH,
            };
        }catch(err) {
            console.error('ACTS_unzipFile_0800  zip  err:' + err);
        }
        if (Options.finishFlush == 3){
            console.log("ACTS_unzipFile_0800 It is an orange!");
        }
        else {
            console.log("ACTS_unzipFile_0800 It is NOT an orange");
        }
        try{
            zlib.unzipFile(src,dest,Options,
                (err, data) => {
                    console.log("ACTS_unzipFile_0800 err: " + err.code);
                    console.log("ACTS_unzipFile_0800 data: " + data);
                    expect(err).assertEqual(0);
                    expect(data).assertEqual(0);
                });
        }catch(err) {
            console.error('ACTS_unzipFile_0800  size  err:' + err);
        }
        let sizePath = '/data/test/zip_amsZipfileUnzipfileST-signed.zip'
        let testPath ='/data/test/amsZipfileUnzipfileST-signed.hap'
        try{
            var big = fileio.statSync(sizePath).size;
        }catch(err) {
            console.error('ACTS_unzipFile_0800  big  err:' + err);
        }
        var small = fileio.statSync(testPath).size;
        try{
            expect(big<=small).assertEqual(1);
            console.log("big=" + big);
            console.log("small=" + small);
        }catch(err) {
            console.error('ACTS_unzipFile_0800  assertTure  err:' + err);
        }
        console.debug('ACTS_unzipFile_0800=====size======');
        try{
            expect(fileio.accessSync(testPath) != null).assertEqual(0);
        }
        catch(err){
            console.error("state +B presence");
        }
        console.debug('ACTS_unzipFile_0800=====test======');
        function timeout() {
            try{
                expect().assertFail();
            }catch(err) {
                console.error('ACTS_unzipFile_0800  assertFail  err:' + err);
            }
            console.debug('ACTS_unzipFile_0800=====timeout======');
            done();
        }

        setTimeout(timeout, 5000);

    })
/*
 * @tc.number: ACTS_unzipFile_0900
 * @tc.name: unzipFile :
 * @tc.desc:
 */
    it('ACTS_unzipFile_0900', 0, async function (done) {
        console.log("==================ACTS_unzipFile_0900 start==================");
        var src ="/data/test/zip_amsZipfileUnzipfileST-signed.zip";
        var dest ="/data/test/amsZipfileUnzipfileST-signed.hap";

        try{
            var Options= {
                finishFlush:FLUSH_TYPE_FINISH,
            };
        }catch(err) {
            console.error('ACTS_unzipFile_0900  zip  err:' + err);
        }
        if (Options.finishFlush == 4){
            console.log("ACTS_unzipFile_0900 It is an orange!");
        }
        else {
            console.log("ACTS_unzipFile_0900 It is NOT an orange");
        }
        try{
            zlib.unzipFile(src,dest,Options,
                (err, data) => {
                    console.log("ACTS_unzipFile_0900 err: " + err.code);
                    console.log("ACTS_unzipFile_0900 data: " + data);
                    expect(err).assertEqual(0);
                    expect(data).assertEqual(0);
                });
        }catch(err) {
            console.error('ACTS_unzipFile_0900  size  err:' + err);
        }
        let sizePath = '/data/test/zip_amsZipfileUnzipfileST-signed.zip'
        let testPath ='/data/test/amsZipfileUnzipfileST-signed.hap'
        try{
            var big = fileio.statSync(sizePath).size;
        }catch(err) {
            console.error('ACTS_unzipFile_0900  big  err:' + err);
        }
        var small = fileio.statSync(testPath).size;
        try{
            expect(big<=small).assertEqual(1);
            console.log("big=" + big);
            console.log("small=" + small);
        }catch(err) {
            console.error('ACTS_unzipFile_0900  assertTure  err:' + err);
        }
        console.debug('ACTS_unzipFile_0900=====size======');
        try{
            expect(fileio.accessSync(testPath) != null).assertEqual(0);
        }
        catch(err){
            console.error("state +B presence");
        }
        console.debug('ACTS_unzipFile_0900=====test======');
        function timeout() {
            try{
                expect().assertFail();
            }catch(err) {
                console.error('ACTS_unzipFile_0900  assertFail  err:' + err);
            }
            console.debug('ACTS_unzipFile_0900=====timeout======');
            done();
        }

        setTimeout(timeout, 5000);

    })
/*
 * @tc.number: ACTS_unzipFile_1000
 * @tc.name: unzipFile :
 * @tc.desc:
 */
    it('ACTS_unzipFile_1000', 0, async function (done) {
        console.log("==================ACTS_unzipFile_1000 start==================");
        var src ="/data/test/zip_amsZipfileUnzipfileST-signed.zip";
        var dest ="/data/test/amsZipfileUnzipfileST-signed.hap";

        try{
            var Options= {
                finishFlush:FLUSH_TYPE_BLOCK,
            };
        }catch(err) {
            console.error('ACTS_unzipFile_1000  zip  err:' + err);
        }
        if (Options.finishFlush == 5){
            console.log("ACTS_unzipFile_1000 It is an orange!");
        }
        else {
            console.log("ACTS_unzipFile_1000 It is NOT an orange");
        }
        try{
            zlib.unzipFile(src,dest,Options,
                (err, data) => {
                    console.log("ACTS_unzipFile_1000 err: " + err.code);
                    console.log("ACTS_unzipFile_1000 data: " + data);
                    expect(err).assertEqual(0);
                    expect(data).assertEqual(0);
                });
        }catch(err) {
            console.error('ACTS_unzipFile_1000  size  err:' + err);
        }
        let sizePath = '/data/test/zip_amsZipfileUnzipfileST-signed.zip'
        let testPath ='/data/test/amsZipfileUnzipfileST-signed.hap'
        try{
            var big = fileio.statSync(sizePath).size;
        }catch(err) {
            console.error('ACTS_unzipFile_1000  big  err:' + err);
        }
        var small = fileio.statSync(testPath).size;
        try{
            expect(big<=small).assertEqual(1);
            console.log("big=" + big);
            console.log("small=" + small);
        }catch(err) {
            console.error('ACTS_unzipFile_1000  assertTure  err:' + err);
        }
        console.debug('ACTS_unzipFile_1000=====size======');
        try{
            expect(fileio.accessSync(testPath) != null).assertEqual(0);
        }
        catch(err){
            console.error("state +B presence");
        }
        console.debug('ACTS_unzipFile_1000=====test======');
        function timeout() {
            try{
                expect().assertFail();
            }catch(err) {
                console.error('ACTS_unzipFile_1000  assertFail  err:' + err);
            }
            console.debug('ACTS_unzipFile_1000=====timeout======');
            done();
        }

        setTimeout(timeout, 5000);

    })
/*
 * @tc.number: ACTS_unzipFile_1100
 * @tc.name: unzipFile :
 * @tc.desc:
 */
    it('ACTS_unzipFile_1100', 0, async function (done) {
        console.log("==================ACTS_unzipFile_1100 start==================");
        var src ="/data/test/zip_amsZipfileUnzipfileST-signed.zip";
        var dest ="/data/test/amsZipfileUnzipfileST-signed.hap";

        try{
            var Options= {
                finishFlush:FLUSH_TYPE_TREES,
            };
        }catch(err) {
            console.error('ACTS_unzipFile_1100  zip  err:' +  err);
        }
        if (Options.finishFlush == 6){
            console.log("ACTS_unzipFile_1100 It is an orange!");
        }
        else {
            console.log("ACTS_unzipFile_1100 It is NOT an orange");
        }
        try{
            zlib.unzipFile(src,dest,Options,
                (err, data) => {
                    console.log("ACTS_unzipFile_1100 err: " + err.code);
                    console.log("ACTS_unzipFile_1100 data: " + data);
                    expect(err).assertEqual(0);
                    expect(data).assertEqual(0);
                });
        }catch(err) {
            console.error('ACTS_unzipFile_1100  size  err:' + err);
        }
        let sizePath = '/data/test/zip_amsZipfileUnzipfileST-signed.zip'
        let testPath ='/data/test/amsZipfileUnzipfileST-signed.hap'
        try{
            var big = fileio.statSync(sizePath).size;
        }catch(err) {
            console.error('ACTS_unzipFile_1100  big  err:' + err);
        }
        var small = fileio.statSync(testPath).size;
        try{
            expect(big<=small).assertEqual(1);
            console.log("big=" + big);
            console.log("small=" + small);
        }catch(err) {
            console.error('ACTS_unzipFile_1100  assertTure  err:' + err);
        }
        console.debug('ACTS_unzipFile_1100=====size======');
        try{
            expect(fileio.accessSync(testPath) != null).assertEqual(0);
        }
        catch(err){
            console.error("state +B presence");
        }
        console.debug('ACTS_unzipFile_1100=====test======');
        function timeout() {
            try{
                expect().assertFail();
            }catch(err) {
                console.error('ACTS_unzipFile_1100  assertFail  err:' + err);
            }
            console.debug('ACTS_unzipFile_1100=====timeout======');
            done();
        }

        setTimeout(timeout, 5000);
    })
})
