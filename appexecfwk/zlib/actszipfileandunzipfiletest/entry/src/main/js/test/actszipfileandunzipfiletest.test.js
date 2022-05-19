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
import featureAbility from '@ohos.ability.featureAbility'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'
var dir = "";
var infos = "";

describe('ActsZlibTest', function () {
    beforeEach(async (done) => {
      var context = featureAbility.getContext();
      context.getCacheDir((err, data) => {
        console.info('ActsZlibTest successful. Data:' + JSON.stringify(data));
        dir = data;
       var objectone = "com.example.amsZipfileUnzipfileST.MainAbility/com.example.amsZipfileUnzipfileST/";
       var objecttwo = "com.example.amsZipfileUnzipfileST.MainAbility/com.example.amsZipfileUnzipfileST/zipunzip";
       var objectthree ="com.example.amsZipfileUnzipfileST.MainAbility/ActsZlibTest/example.amsZipfileUnzipfileST";
        infos =dir + objectone + objecttwo + objectthree;
        done();
      })
    });

/*
* @tc.number: ACTS_ZipFile_0100
* @tc.name: zipFile
* @tc.desc: inFile is empty
*/
it('ACTS_ZipFile_0100', 0, async function (done) {
    console.log("==================ACTS_ZipFile_0100 start==================");
    var path ="";
    var zipDest = dir + "/ACTS_ZipFile_0100.zip"
    var options = {};
    options.level = zlib.CompressLevel.COMPRESS_LEVEL_NO_COMPRESSION;
    zlib.zipFile(path, zipDest, options).then((data) => {
      console.log("ACTS_ZipFile_0100 data: " + data);
      expect(data).assertEqual(zlib.ErrorCode.ERROR_CODE_ERRNO);
      done();
    }).catch((err) => {
      console.log("zipFile fail: " + err);
      expect(err).assertFail();
      done();
    })
    console.log("==================ACTS_ZipFile_0100 end==================");
  })

/*
* @tc.number: ACTS_ZipFile_0200
* @tc.name: zipFile
* @tc.desc: inFile doesn't exist
*/
it('ACTS_ZipFile_0200', 0, async function (done) {
    console.log("==================ACTS_ZipFile_0200 start==================");
    var path = dir + "/ACTS_ZipFile_9999900.txt";
    var src = dir + "/ACTS_ZipFile_999991100.txt";
    var fd = fileio.openSync(path, 0o100 | 0o2, 0o666);
    fileio.write(fd, infos).then(function (number) {
      console.info("ACTS_ZipFile_0200 write data to file successfully:" + number);
      var options = {};
      options.level = zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION;
      zlib.zipFile(src, dir, options).then((data) => {
        console.log("ACTS_ZipFile_0200 data: " + data);
        expect(data).assertEqual(zlib.ErrorCode.ERROR_CODE_ERRNO);
        done();
      }).catch((err) => {
        console.log("zipFile fail: " + err);
        expect(err).assertFail();
        done();
      })
    }).catch(function (err) {
      console.info("ACTS_ZipFile_0200 write data to file failed with error:" + err);
      expect(err).assertFail();
      done();
    });
    console.log("==================ACTS_ZipFile_0200 end==================");
  })

/*
* @tc.number: ACTS_ZipFile_0300
* @tc.name: zipFile
* @tc.desc: output file not specified
*/
it('ACTS_ZipFile_0300', 0, async function (done) {
    console.log("==================ACTS_ZipFile_0300 start==================");
    var path = dir + "/ACTS_ZipFile_0300.txt";
    var zipDest ="";
    var fd = fileio.openSync(path, 0o100 | 0o2, 0o666);
    fileio.write(fd, infos).then(function (number) {
      console.info("ACTS_ZipFile_0300 write data to file successfully:" + number);
      var options = {};
      options.level = zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION;
      zlib.zipFile(path, zipDest, options).then((data) => {
        console.log("ACTS_ZipFile_0300 data: " + data);
        expect(data).assertEqual(zlib.ErrorCode.ERROR_CODE_ERRNO);
        done();
      }).catch((err) => {
        console.log("zipFile fail: " + err);
        expect(err).assertFail();
        done();
      })
    }).catch(function (err) {
      console.info("ACTS_ZipFile_0300 write data to file failed with error:" + err);
      expect(err).assertFail();
      done();
    });
    console.log("==================ACTS_ZipFile_0300 end==================");
  })

/*
* @tc.number: ACTS_ZipFile_0400
* @tc.name: zipFile
* @tc.desc: The output file is a directory that does not exist
*/
it('ACTS_ZipFile_0400', 0, async function (done) {
    console.log("==================ACTS_ZipFile_0400 start==================");
    var path = dir + "/ACTS_ZipFile_0400.txt";
    var zipDest ="/ACTS_ZipFile_0400.zip";
    var fd = fileio.openSync(path, 0o100 | 0o2, 0o666);
    fileio.write(fd, infos).then(function (number) {
      console.info("ACTS_ZipFile_0400 write data to file successfully:" + number);
      var options = {};
      options.level = zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION;
      zlib.zipFile(path, zipDest, options).then((data) => {
        console.log("ACTS_ZipFile_0400 data: " + data);
        expect(data).assertEqual(zlib.ErrorCode.ERROR_CODE_ERRNO);
        done();
      }).catch((err) => {
        console.log("zipFile fail: " + err);
        expect(err).assertFail();
        done();
      })
    }).catch(function (err) {
      console.info("ACTS_ZipFile_0400 write data to file failed with error:" + err);
      expect(err).assertFail();
      done();
    });
    console.log("==================ACTS_ZipFile_0400 end==================");
  })

/*
* @tc.number: ACTS_ZipFile_2200
* @tc.name: zipFile
* @tc.desc: COMPRESS_LEVEL_NO_COMPRESSION,
*/
it('ACTS_ZipFile_2200', 0, async function (done) {
    console.log("==================ACTS_ZipFile_2200 start==================");
    var path = dir + "/ACTS_ZipFile_2200.txt";
    var zipDest = dir + "/ACTS_ZipFile_2200.zip"
    var unzipdir = dir + "/ACTS_ZipFile_2200";
    var unzipresultfile = unzipdir + "/ACTS_ZipFile_2200.txt";
    var options = {};
    options.level = zlib.CompressLevel.COMPRESS_LEVEL_NO_COMPRESSION;
    var fd = fileio.openSync(path, 0o100 | 0o2, 0o666);
    fileio.write(fd, infos).then(function (number) {
      console.info("ACTS_ZipFile_2200 write data to file secondlly successfully:" + number);
      zlib.zipFile(path, zipDest, options).then((data) => {
        var zipStat = fileio.statSync(zipDest);
        var isFile = zipStat.isFile();
        expect(isFile).assertTrue();
        var srcSize = fileio.statSync(path).size;
        var destSize = zipStat.size;
        expect(srcSize > destSize).assertTrue();
        expect(data).assertEqual(zlib.ErrorCode.ERROR_CODE_OK);
        fileio.mkdir(unzipdir).then(function () {
          console.info("ACTS_ZipFile_2200 mkdir successfully");
          zlib.unzipFile(zipDest, unzipdir, options).then((data) => {
            var unzipStat = fileio.statSync(unzipresultfile);
            var isFile = unzipStat.isFile();
            expect(isFile).assertTrue();
            var destSize = unzipStat.size;
            var originSize = fileio.statSync(path).size;
            var result = (originSize == destSize);
            expect(result).assertTrue();
            expect(data).assertEqual(zlib.ErrorCode.ERROR_CODE_OK);
            console.error('ACTS_ZipFile_2200 unzipFile');
            done();
          }).catch((err) => {
            console.log("ACTS_ZipFile_2200 err: " + err);
            expect(err).assertFail();
            done();
          })
        }).catch(function (error) {
          console.info("ACTS_ZipFile_2200 mkdir failed with error:" + error);
          expect(error).assertFail();
          done();
        });
      }).catch((err) => {
          console.log("zipFile fail: " + err);
          expect(err).assertFail();
          done();
      })
    }).catch(function (err) {
        console.info("ACTS_ZipFile_2200 write data to file failed with error:" + err);
        expect(err).assertFail();
        done();
    });
    console.log("==================ACTS_ZipFile_2200 end==================");
  });

/*
* @tc.number: ACTS_ZipFile_2300
* @tc.name: zipFile
* @tc.desc: COMPRESS_LEVEL_BEST_SPEED,
*/
it('ACTS_ZipFile_2300', 0, async function (done) {
    console.log("==================ACTS_ZipFile_2300 start==================");
    var path = dir + "/ACTS_ZipFile_2300.txt";
    var zipDest = dir + "/ACTS_ZipFile_2300.zip"
    var unzipdir = dir + "/ACTS_ZipFile_2300";
    var unzipresultfile = unzipdir + "/ACTS_ZipFile_2300.txt";
    var options = {};
    options.level = zlib.CompressLevel.COMPRESS_LEVEL_BEST_SPEED;
    var fd = fileio.openSync(path, 0o100 | 0o2, 0o666);
    fileio.write(fd, infos).then(function (number) {
      console.info("ACTS_ZipFile_2300 write data to file successfully:" + number);
      zlib.zipFile(path, zipDest, options).then((data) => {
        var zipStat = fileio.statSync(zipDest);
        var isFile = zipStat.isFile();
        expect(isFile).assertTrue();
        var srcSize = fileio.statSync(path).size;
        var destSize = zipStat.size;
        expect(srcSize > destSize).assertTrue();
        expect(data).assertEqual(zlib.ErrorCode.ERROR_CODE_OK);
        fileio.mkdir(unzipdir).then(function () {
          console.info("ACTS_ZipFile_2300 mkdir successfully");
          zlib.unzipFile(zipDest, unzipdir, options).then((data) => {
            var unzipStat = fileio.statSync(unzipresultfile);
            var isFile = unzipStat.isFile();
            expect(isFile).assertTrue();
            var destSize = unzipStat.size;
            var originSize = fileio.statSync(path).size;
            var result = (originSize == destSize);
            expect(result).assertTrue();
            expect(data).assertEqual(zlib.ErrorCode.ERROR_CODE_OK);
            console.error('ACTS_ZipFile_2300 unzipFile');
            done();
          }).catch((err) => {
            console.log("ACTS_ZipFile_2300 err: " + err);
            expect(err).assertFail();
            done();
          })
        }).catch(function (error) {
          console.info("ACTS_ZipFile_2300 mkdir failed with error:" + error);
          expect(error).assertFail();
          done();
        });
      }).catch((err) => {
          console.log("zipFile fail: " + err);
          expect(err).assertFail();
          done();
      })
    }).catch(function (err) {
        console.info("ACTS_ZipFile_2200 write data to file failed with error:" + err);
        expect(err).assertFail();
        done();
    });
     console.log("==================ACTS_ZipFile_2300 end==================");
  })

/*
* @tc.number: ACTS_ZipFile_2400
* @tc.name: zipFile
* @tc.desc: COMPRESS_LEVEL_BEST_COMPRESSION,
*/
it('ACTS_ZipFile_2400', 0, async function (done) {
    console.log("==================ACTS_ZipFile_2400 start==================");
    var path = dir + "/ACTS_ZipFile_2400.txt";
    var zipDest = dir + "/ACTS_ZipFile_2400.zip"
    var unzipdir = dir + "/ACTS_ZipFile_2400";
    var unzipresultfile = unzipdir + "/ACTS_ZipFile_2400.txt";
    var options = {};
    options.level = zlib.CompressLevel.COMPRESS_LEVEL_BEST_COMPRESSION;
    var fd = fileio.openSync(path, 0o100 | 0o2, 0o666);
    fileio.write(fd, infos).then(function (number) {
      console.info("ACTS_ZipFile_2400 write data to file successfully:" + number);
      zlib.zipFile(path, zipDest, options).then((data) => {
        var zipStat = fileio.statSync(zipDest);
        var isFile = zipStat.isFile();
        expect(isFile).assertTrue();
        var srcSize = fileio.statSync(path).size;
        var destSize = zipStat.size;
        expect(srcSize > destSize).assertTrue();
        expect(data).assertEqual(zlib.ErrorCode.ERROR_CODE_OK);
        fileio.mkdir(unzipdir).then(function () {
          console.info("ACTS_ZipFile_2400 mkdir successfully");
          zlib.unzipFile(zipDest, unzipdir, options).then((data) => {
            var unzipStat = fileio.statSync(unzipresultfile);
            var isFile = unzipStat.isFile();
            expect(isFile).assertTrue();
            var destSize = unzipStat.size;
            var originSize = fileio.statSync(path).size;
            var result = (originSize == destSize);
            expect(result).assertTrue();
            expect(data).assertEqual(zlib.ErrorCode.ERROR_CODE_OK);
            console.error('ACTS_ZipFile_2400 unzipFile');
            done();
          }).catch((err) => {
            console.log("ACTS_ZipFile_2400 err: " + err);
            expect(err).assertFail();
            done();
          })
        }).catch(function (error) {
          console.info("ACTS_ZipFile_2400 mkdir failed with error:" + error);
          expect(error).assertFail();
          done();
        });
      }).catch((err) => {
          console.log("zipFile fail: " + err);
          expect(err).assertFail();
          done();
      })
    }).catch(function (err) {
        console.info("ACTS_ZipFile_2400 write data to file failed with error:" + err);
        expect(err).assertFail();
        done();
    });
    console.log("==================ACTS_ZipFile_2400 end==================");
  });

/*
* @tc.number: ACTS_ZipFile_2500
* @tc.name: zipFile
* @tc.desc: COMPRESS_LEVEL_DEFAULT_COMPRESSION,
*/
it('ACTS_ZipFile_2500', 0, async function (done) {
    console.log("==================ACTS_ZipFile_2500 start==================");
    var path = dir + "/ACTS_ZipFile_2500.txt";
    var zipDest = dir + "/ACTS_ZipFile_2500.zip"
    var unzipdir = dir + "/ACTS_ZipFile_2500";
    var unzipresultfile = unzipdir + "/ACTS_ZipFile_2500.txt";
    var options = {};
    options.level = zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION;
    var fd = fileio.openSync(path, 0o100 | 0o2, 0o666);
    fileio.write(fd, infos).then(function (number) {
      console.info("ACTS_ZipFile_2500 write data to file successfully:" + number);
      zlib.zipFile(path, zipDest, options).then((data) => {
        var zipStat = fileio.statSync(zipDest);
        var isFile = zipStat.isFile();
        expect(isFile).assertTrue();
        var srcSize = fileio.statSync(path).size;
        var destSize = zipStat.size;
        expect(srcSize > destSize).assertTrue();
        expect(data).assertEqual(zlib.ErrorCode.ERROR_CODE_OK);
        fileio.mkdir(unzipdir).then(function () {
          console.info("ACTS_ZipFile_2500 mkdir successfully");
          zlib.unzipFile(zipDest, unzipdir, options).then((data) => {
            var unzipStat = fileio.statSync(unzipresultfile);
            var isFile = unzipStat.isFile();
            expect(isFile).assertTrue();
            var destSize = unzipStat.size;
            var originSize = fileio.statSync(path).size;
            var result = (originSize == destSize);
            expect(result).assertTrue();
            expect(data).assertEqual(zlib.ErrorCode.ERROR_CODE_OK);
            console.error('ACTS_ZipFile_2500 unzipFile');
            done();
          }).catch((err) => {
            console.log("ACTS_ZipFile_2500 err: " + err);
            expect(err).assertFail();
            done()
          })
        }).catch(function (error) {
          console.info("ACTS_ZipFile_2500 mkdir failed with error:" + error);
          expect(error).assertFail();
          done();
        });
      }).catch((err) => {
          console.log("zipFile fail: " + err);
          expect(err).assertFail();
          done();
      })
    }).catch(function (err) {
        console.info("ACTS_ZipFile_2500 write data to file failed with error:" + err);
        expect(err).assertFail();
        done();
    });
    console.log("==================ACTS_ZipFile_2500 end==================");
  });

/*
* @tc.number: ACTS_ZipFile_2600
* @tc.name: zipFile
* @tc.desc: MEM_LEVEL_MIN_MEMLEVEL,,
*/
it('ACTS_ZipFile_2600', 0, async function (done) {
    console.log("==================ACTS_ZipFile_2600 start==================");
    var path = dir + "/ACTS_ZipFile_2600.txt";
    var zipDest = dir + "/ACTS_ZipFile_2600.zip"
    var unzipdir = dir + "/ACTS_ZipFile_2600";
    var unzipresultfile = unzipdir + "/ACTS_ZipFile_2600.txt";
    var options = {};
    options.memLevel = zlib.MemLevel.MEM_LEVEL_MIN;
    var fd = fileio.openSync(path, 0o100 | 0o2, 0o666);
    fileio.write(fd, infos).then(function (number) {
      console.info("ACTS_ZipFile_2600 write data to file successfully:" + number);
      zlib.zipFile(path, zipDest, options).then((data) => {
        var zipStat = fileio.statSync(zipDest);
        var isFile = zipStat.isFile();
        expect(isFile).assertTrue();
        var srcSize = fileio.statSync(path).size;
        var destSize = zipStat.size;
        expect(srcSize > destSize).assertTrue();
        expect(data).assertEqual(zlib.ErrorCode.ERROR_CODE_OK);
        fileio.mkdir(unzipdir).then(function () {
          console.info("ACTS_ZipFile_2600 mkdir successfully");
          zlib.unzipFile(zipDest, unzipdir, options).then((data) => {
            var unzipStat = fileio.statSync(unzipresultfile);
            var isFile = unzipStat.isFile();
            expect(isFile).assertTrue();
            var destSize = unzipStat.size;
            var originSize = fileio.statSync(path).size;
            var result = (originSize == destSize);
            expect(result).assertTrue();
            expect(data).assertEqual(zlib.ErrorCode.ERROR_CODE_OK);
            console.error('ACTS_ZipFile_2600 unzipFile');
            done();
          }).catch((err) => {
            console.log("ACTS_ZipFile_2600 err: " + err);
            expect(err).assertFail();
            done();
          })
        }).catch(function (error) {
          console.info("ACTS_ZipFile_2600 mkdir failed with error:" + error);
          expect(error).assertFail();
          done();
        });
      }).catch((err) => {
          console.log("zipFile fail: " + err);
          expect(err).assertFail();
          done();
      })
    }).catch(function (err) {
        console.info("ACTS_ZipFile_2600 write data to file failed with error:" + err);
        expect(err).assertFail();
        done();
    });
    console.log("==================ACTS_ZipFile_2600 end==================");
  });

/*
* @tc.number: ACTS_ZipFile_2700
* @tc.name: zipFile
* @tc.desc: MEM_LEVEL_MAX_MEMLEVEL,,
*/
it('ACTS_ZipFile_2700', 0, async function (done) {
    console.log("==================ACTS_ZipFile_2700 start==================");
    var path = dir + "/ACTS_ZipFile_2700.txt";
    var zipDest = dir + "/ACTS_ZipFile_2700.zip"
    var unzipdir = dir + "/ACTS_ZipFile_2700";
    var unzipresultfile = unzipdir + "/ACTS_ZipFile_2700.txt";
    var options = {};
    options.memLevel = zlib.MemLevel.MEM_LEVEL_MAX;
    var fd = fileio.openSync(path, 0o100 | 0o2, 0o666);
    fileio.write(fd, infos).then(function (number) {
      console.info("ACTS_ZipFile_2700 write data to file successfully:" + number);
      zlib.zipFile(path, zipDest, options).then((data) => {
        var zipStat = fileio.statSync(zipDest);
        var isFile = zipStat.isFile();
        expect(isFile).assertTrue();
        var srcSize = fileio.statSync(path).size;
        var destSize = zipStat.size;
        expect(srcSize > destSize).assertTrue();
        expect(data).assertEqual(zlib.ErrorCode.ERROR_CODE_OK);
        fileio.mkdir(unzipdir).then(function () {
          console.info("ACTS_ZipFile_2700 mkdir successfully");
          zlib.unzipFile(zipDest, unzipdir, options).then((data) => {
            var unzipStat = fileio.statSync(unzipresultfile);
            var isFile = unzipStat.isFile();
            expect(isFile).assertTrue();
            var destSize = unzipStat.size;
            var originSize = fileio.statSync(path).size;
            var result = (originSize == destSize);
            expect(result).assertTrue();
            expect(data).assertEqual(zlib.ErrorCode.ERROR_CODE_OK);
            console.error('ACTS_ZipFile_2700 unzipFile');
            done();
          }).catch((err) => {
            console.log("ACTS_ZipFile_2700 err: " + err);
            expect(err).assertFail();
            done();
          })
        }).catch(function (error) {
          console.info("ACTS_ZipFile_2700 mkdir failed with error:" + error);
          expect(error).assertFail();
          done();
        });
      }).catch((err) => {
          console.log("zipFile fail: " + err);
         expect(err).assertFail();
         done();
      })
    }).catch(function (err) {
        console.info("ACTS_ZipFile_2700 write data to file failed with error:" + err);
        expect(err).assertFail();
        done();
    });
    console.log("==================ACTS_ZipFile_2700 end==================");
  });

/*
* @tc.number: ACTS_ZipFile_2800
* @tc.name: zipFile
* @tc.desc: MEM_LEVEL_DEFAULT_MEMLEVEL,,
*/
it('ACTS_ZipFile_2800', 0, async function (done) {
    console.log("==================ACTS_ZipFile_2800 start==================");
    var path = dir + "/ACTS_ZipFile_2800.txt";
    var zipDest = dir + "/ACTS_ZipFile_2800.zip"
    var unzipdir = dir + "/ACTS_ZipFile_2800";
    var unzipresultfile = unzipdir + "/ACTS_ZipFile_2800.txt";
    var options = {};
    options.memLevel = zlib.MemLevel.MEM_LEVEL_DEFAULT;
    var fd = fileio.openSync(path, 0o100 | 0o2, 0o666);
    fileio.write(fd, infos).then(function (number) {
      console.info("ACTS_ZipFile_2800 write data to file successfully:" + number);
      zlib.zipFile(path, zipDest, options).then((data) => {
        var zipStat = fileio.statSync(zipDest);
        var isFile = zipStat.isFile();
        expect(isFile).assertTrue();
        var srcSize = fileio.statSync(path).size;
        var destSize = zipStat.size;
        expect(srcSize > destSize).assertTrue();
        expect(data).assertEqual(zlib.ErrorCode.ERROR_CODE_OK);
        fileio.mkdir(unzipdir).then(function () {
          console.info("ACTS_ZipFile_2800 mkdir successfully");
          zlib.unzipFile(zipDest, unzipdir, options).then((data) => {
            var unzipStat = fileio.statSync(unzipresultfile);
            var isFile = unzipStat.isFile();
            expect(isFile).assertTrue();
            var destSize = unzipStat.size;
            var originSize = fileio.statSync(path).size;
            var result = (originSize == destSize);
            expect(result).assertTrue();
            expect(data).assertEqual(zlib.ErrorCode.ERROR_CODE_OK);
            console.error('ACTS_ZipFile_2800 unzipFile');
            done();
          }).catch((err) => {
            console.log("ACTS_ZipFile_2800 err: " + err);
            expect(err).assertFail();
            done();
          })
        }).catch(function (error) {
          console.info("ACTS_ZipFile_2800 mkdir failed with error:" + error);
          expect(error).assertFail();
          done();
        });
      }).catch((err) => {
          console.log("zipFile fail: " + err);
          expect(err).assertFail();
          done();
      })
    }).catch(function (err) {
        console.info("ACTS_ZipFile_2800 write data to file failed with error:" + err);
        expect(err).assertFail();
        done();
    });
    console.log("==================ACTS_ZipFile_2800 end==================");
  });

/*
* @tc.number: ACTS_ZipFile_2900
* @tc.name: zipFile
* @tc.desc: COMPRESS_STRATEGY_DEFAULT_STRATEGY,,
*/
it('ACTS_ZipFile_2900', 0, async function (done) {
    console.log("==================ACTS_ZipFile_2900 start==================");
    var path = dir + "/ACTS_ZipFile_2900.txt";
    var zipDest = dir + "/ACTS_ZipFile_2900.zip"
    var unzipdir = dir + "/ACTS_ZipFile_2900";
    var unzipresultfile = unzipdir + "/ACTS_ZipFile_2900.txt";
    var options = {};
    options.strategy = zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY;
    var fd = fileio.openSync(path, 0o100 | 0o2, 0o666);
    fileio.write(fd, infos).then(function (number) {
      console.info("ACTS_ZipFile_2900 write data to file successfully:" + number);
      zlib.zipFile(path, zipDest, options).then((data) => {
        var zipStat = fileio.statSync(zipDest);
        var isFile = zipStat.isFile();
        expect(isFile).assertTrue();
        var srcSize = fileio.statSync(path).size;
        var destSize = zipStat.size;
        expect(srcSize > destSize).assertTrue();
        expect(data).assertEqual(zlib.ErrorCode.ERROR_CODE_OK);
          fileio.mkdir(unzipdir).then(function () {
            console.info("ACTS_ZipFile_2900 mkdir successfully");
            zlib.unzipFile(zipDest, unzipdir, options).then((data) => {
              var unzipStat = fileio.statSync(unzipresultfile);
              var isFile = unzipStat.isFile();
              expect(isFile).assertTrue();
              var destSize = unzipStat.size;
              var originSize = fileio.statSync(path).size;
              var result = (originSize == destSize);
              expect(result).assertTrue();
              expect(data).assertEqual(zlib.ErrorCode.ERROR_CODE_OK);
              console.error('ACTS_ZipFile_2900 unzipFile');
              done();
            }).catch((err) => {
              console.log("ACTS_ZipFile_2900 err: " + err);
              expect(err).assertFail();
              done();
            })
          }).catch(function (error) {
            console.info("ACTS_ZipFile_2900 mkdir failed with error:" + error);
            expect(error).assertFail();
            done();
          });
      }).catch((err) => {
          console.log("zipFile fail: " + err);
          expect(err).assertFail();
          done();
      })
    }).catch(function (err) {
        console.info("ACTS_ZipFile_2900 write data to file failed with error:" + err);
        expect(err).assertFail();
        done();
    });
    console.log("==================ACTS_ZipFile_2900 end==================");
  });

/*
* @tc.number: ACTS_ZipFile_3000
* @tc.name: zipFile
* @tc.desc: COMPRESS_STRATEGY_FILTERED,,
*/
it('ACTS_ZipFile_3000', 0, async function (done) {
    console.log("==================ACTS_ZipFile_3000 start==================");
    var path = dir + "/ACTS_ZipFile_3000.txt";
    var zipDest = dir + "/ACTS_ZipFile_3000.zip"
    var unzipdir = dir + "/ACTS_ZipFile_3000";
    var unzipresultfile = unzipdir + "/ACTS_ZipFile_3000.txt";
    var options = {};
    options.strategy = zlib.CompressStrategy.COMPRESS_STRATEGY_FILTERED;
    var fd = fileio.openSync(path, 0o100 | 0o2, 0o666);
    fileio.write(fd, infos).then(function (number) {
      console.info("ACTS_ZipFile_3000 write data to file successfully:" + number);
      zlib.zipFile(path, zipDest, options).then((data) => {
        var zipStat = fileio.statSync(zipDest);
        var isFile = zipStat.isFile();
        expect(isFile).assertTrue();
        var srcSize = fileio.statSync(path).size;
        var destSize = zipStat.size;
        expect(srcSize > destSize).assertTrue();
        expect(data).assertEqual(zlib.ErrorCode.ERROR_CODE_OK);
        fileio.mkdir(unzipdir).then(function () {
          console.info("ACTS_ZipFile_3000 mkdir successfully");
          zlib.unzipFile(zipDest, unzipdir, options).then((data) => {
            var unzipStat = fileio.statSync(unzipresultfile);
            var isFile = unzipStat.isFile();
            expect(isFile).assertTrue();
            var destSize = unzipStat.size;
            var originSize = fileio.statSync(path).size;
            var result = (originSize == destSize);
            expect(result).assertTrue();
            expect(data).assertEqual(zlib.ErrorCode.ERROR_CODE_OK);
            console.error('ACTS_ZipFile_3000 unzipFile');
            done();
          }).catch((err) => {
            console.log("ACTS_ZipFile_3000 err: " + err);
            expect(err).assertFail();
            done();
          })
        }).catch(function (error) {
          console.info("ACTS_ZipFile_3000 mkdir failed with error:" + error);
          expect(error).assertFail();
          done();
        });
      }).catch((err) => {
          console.log("zipFile fail: " + err);
          expect(err).assertFail();
          done();
      })
    }).catch(function (err) {
        console.info("ACTS_ZipFile_3000 write data to file failed with error:" + err);
        expect(err).assertFail();
        done();
    });
    console.log("==================ACTS_ZipFile_3000 end==================");
  });

/*
* @tc.number: ACTS_ZipFile_3100
* @tc.name: zipFile
* @tc.desc: COMPRESS_STRATEGY_HUFFMAN_ONLY,,
*/
it('ACTS_ZipFile_3100', 0, async function (done) {
    console.log("==================ACTS_ZipFile_3100 start==================");
    var path = dir + "/ACTS_ZipFile_3100.txt";
    var zipDest = dir + "/ACTS_ZipFile_3100.zip"
    var unzipdir = dir + "/ACTS_ZipFile_3100";
    var unzipresultfile = unzipdir + "/ACTS_ZipFile_3100.txt";
    var options = {};
    options.strategy = zlib.CompressStrategy.COMPRESS_STRATEGY_HUFFMAN_ONLY;
    var fd = fileio.openSync(path, 0o100 | 0o2, 0o666);
    fileio.write(fd, infos).then(function (number) {
      console.info("ACTS_ZipFile_3100 write data to file successfully:" + number);
      zlib.zipFile(path, zipDest, options).then((data) => {
        var zipStat = fileio.statSync(zipDest);
        var isFile = zipStat.isFile();
        expect(isFile).assertTrue();
        var srcSize = fileio.statSync(path).size;
        var destSize = zipStat.size;
        expect(srcSize > destSize).assertTrue();
        expect(data).assertEqual(zlib.ErrorCode.ERROR_CODE_OK);
        fileio.mkdir(unzipdir).then(function () {
          console.info("ACTS_ZipFile_3100 mkdir successfully");
          zlib.unzipFile(zipDest, unzipdir, options).then((data) => {
            var unzipStat = fileio.statSync(unzipresultfile);
            var isFile = unzipStat.isFile();
            expect(isFile).assertTrue();
            var destSize = unzipStat.size;
            var originSize = fileio.statSync(path).size;
            var result = (originSize == destSize);
            expect(result).assertTrue();
            expect(data).assertEqual(zlib.ErrorCode.ERROR_CODE_OK);
            console.error('ACTS_ZipFile_3100 unzipFile');
            done();
          }).catch((err) => {
            console.log("ACTS_ZipFile_3100 err: " + err);
            expect(err).assertFail();
            done();
          })
        }).catch(function (error) {
          console.info("ACTS_ZipFile_3100 mkdir failed with error:" + error);
          expect(error).assertFail();
          done();
        });
      }).catch((err) => {
          console.log("zipFile fail: " + err);
          expect(err).assertFail();
          done();
      })
    }).catch(function (err) {
        console.info("ACTS_ZipFile_3100 write data to file failed with error:" + err);
        expect(err).assertFail();
        done();
    });
    console.log("==================ACTS_ZipFile_3100 end==================");
  });

/*
* @tc.number: ACTS_ZipFile_3200
* @tc.name: zipFile
* @tc.desc: COMPRESS_STRATEGY_RLE,,
*/
it('ACTS_ZipFile_3200', 0, async function (done) {
    console.log("==================ACTS_ZipFile_3200 start==================");
    var path = dir + "/ACTS_ZipFile_3200.txt";
    var zipDest = dir + "/ACTS_ZipFile_3200.zip";
    var unzipdir = dir + "/ACTS_ZipFile_3200";
    var unzipresultfile = unzipdir + "/ACTS_ZipFile_3200.txt";
    var options = {};
    options.strategy = zlib.CompressStrategy.COMPRESS_STRATEGY_RLE;
    var fd = fileio.openSync(path, 0o100 | 0o2, 0o666);
    fileio.write(fd, infos).then(function (number) {
      console.info("ACTS_ZipFile_3200 write data to file successfully:" + number);
      zlib.zipFile(path, zipDest, options).then((data) => {
        var zipStat = fileio.statSync(zipDest);
        var isFile = zipStat.isFile();
        expect(isFile).assertTrue();
        var srcSize = fileio.statSync(path).size;
        var destSize = zipStat.size;
        expect(srcSize > destSize).assertTrue();
        expect(data).assertEqual(zlib.ErrorCode.ERROR_CODE_OK);
        fileio.mkdir(unzipdir).then(function () {
          console.info("ACTS_ZipFile_3200 mkdir successfully");
          zlib.unzipFile(zipDest, unzipdir, options).then((data) => {
            var unzipStat = fileio.statSync(unzipresultfile);
            var isFile = unzipStat.isFile();
            expect(isFile).assertTrue();
            var destSize = unzipStat.size;
            var originSize = fileio.statSync(path).size;
            var result = (originSize == destSize);
            expect(result).assertTrue();
            expect(data).assertEqual(zlib.ErrorCode.ERROR_CODE_OK);
            console.error('ACTS_ZipFile_3200 unzipFile');
            done();
          }).catch((err) => {
            console.log("ACTS_ZipFile_3200 err: " + err);done();
            expect(err).assertFail();
            done();
          })
        }).catch(function (error) {
          console.info("ACTS_ZipFile_3200 mkdir failed with error:" + error);
          expect(error).assertFail();
          done();
        });
      }).catch((err) => {
          console.log("zipFile fail: " + err);
          expect(err).assertFail();
          done();
      })
    }).catch(function (err) {
        console.info("ACTS_ZipFile_3200 write data to file failed with error:" + err);
        expect(err).assertFail();
        done();
    });
    console.log("==================ACTS_ZipFile_3200 end==================");
  });

/*
* @tc.number: ACTS_ZipFile_3300
* @tc.name: zipFile
* @tc.desc: COMPRESS_STRATEGY_FILTERED,,
*/
it('ACTS_ZipFile_3300', 0, async function (done) {
    console.log("==================ACTS_ZipFile_3300 start==================");
    var path = dir + "/ACTS_ZipFile_3300.txt";
    var zipDest = dir + "/ACTS_ZipFile_3300.zip"
    var unzipdir = dir + "/ACTS_ZipFile_3300";
    var unzipresultfile = unzipdir + "/ACTS_ZipFile_3300.txt";
    var options = {};
    options.strategy = zlib.CompressStrategy.COMPRESS_STRATEGY_FILTERED;
    var fd = fileio.openSync(path, 0o100 | 0o2, 0o666);
    fileio.write(fd, infos).then(function (number) {
      console.info("ACTS_ZipFile_3300 write data to file successfully:" + number);
      zlib.zipFile(path, zipDest, options).then((data) => {
        var zipStat = fileio.statSync(zipDest);
        var isFile = zipStat.isFile();
        expect(isFile).assertTrue();
        var srcSize = fileio.statSync(path).size;
        var destSize = zipStat.size;
        expect(srcSize > destSize).assertTrue();
        expect(data).assertEqual(zlib.ErrorCode.ERROR_CODE_OK);
        fileio.mkdir(unzipdir).then(function () {
          console.info("ACTS_ZipFile_3300 mkdir successfully");
          zlib.unzipFile(zipDest, unzipdir, options).then((data) => {
            var unzipStat = fileio.statSync(unzipresultfile);
            var isFile = unzipStat.isFile();
            expect(isFile).assertTrue();
            var destSize = unzipStat.size;
            var originSize = fileio.statSync(path).size;
            var result = (originSize == destSize);
            expect(result).assertTrue();
            expect(data).assertEqual(zlib.ErrorCode.ERROR_CODE_OK);
            console.error('ACTS_ZipFile_3300 unzipFile');
            done();
          }).catch((err) => {
            console.log("ACTS_ZipFile_3300 err: " + err);
            expect(err).assertFail();
            done();
          })
        }).catch(function (error) {
          console.info("ACTS_ZipFile_3300 mkdir failed with error:" + error);
          expect(error).assertFail();
          done();
        });
      }).catch((err) => {
          console.log("zipFile fail: " + err);
          expect(err).assertFail();
          done();
      })
    }).catch(function (err) {
        console.info("ACTS_ZipFile_3300 write data to file failed with error:" + err);
        expect(err).assertFail();
        done();
    });
    console.log("==================ACTS_ZipFile_3300 end==================");
  });

/*
* @tc.number: ACTS_ZipFile_3500
* @tc.name: zipFile
* @tc.desc: FLUSH_TYPE_NO_FLUSH,,
*/
it('ACTS_ZipFile_3500', 0, async function (done) {
    console.log("==================ACTS_ZipFile_3500 start==================");
    var path = dir + "/ACTS_ZipFile_3500.txt";
    var src = dir + "/ACTS_ZipFile_9900.txt";
    var unzipdir = dir + "/ACTS_ZipFile_3500";
    var options = {};
    options.strategy = zlib.CompressStrategy.COMPRESS_STRATEGY_FILTERED;
    var fd = fileio.openSync(path, 0o100 | 0o2, 0o666);
    fileio.write(fd, infos).then(function (number) {
      console.info("ACTS_ZipFile_3500 write  successfully:" + number);
      zlib.zipFile(src, dir, options).then((data) => {
        console.log("ACTS_ZipFile_3500 data: " + data);
        expect(data).assertEqual(zlib.ErrorCode.ERROR_CODE_ERRNO);
        done();
      }).catch((err) => {
        console.log("ACTS_ZipFile_3500 err: " + err);
        expect(err).assertFail();
        done();
      });
    }).catch(function (err) {
      console.info("ACTS_ZipFile_3500 write data to file failed with error:" + err);
      expect(err).assertFail();
      done();
    });
    console.log("==================ACTS_ZipFile_3500 end ==================");
  })

/*
* @tc.number: ACTS_ZipFile_3600
* @tc.name: zipFile
* @tc.desc: FLUSH_TYPE_NO_FLUSH,,
*/
it('ACTS_ZipFile_3600', 0, async function (done) {
    console.log("==================ACTS_ZipFile_3600 start==================");
    var path = dir + "/ACTS_ZipFile_3600.txt";
    var zipDest = "";
    var options = {};
    options.strategy = zlib.CompressStrategy.COMPRESS_STRATEGY_FILTERED;
    var fd = fileio.openSync(path, 0o100 | 0o2, 0o666);
    fileio.write(fd, infos).then(function (number) {
      console.info("ACTS_ZipFile_3600 write data to file successfully:" + number);
      zlib.zipFile(path, zipDest, options).then((data) => {
        console.log("ACTS_ZipFile_3600 data: " + data);
        expect(data).assertEqual(zlib.ErrorCode.ERROR_CODE_ERRNO);
        done();
      }).catch((err) => {
        console.log("ACTS_ZipFile_3600 err: " + err);
        expect(err).assertFail();
        done();
      });
    }).catch(function (err) {
      console.info("ACTS_ZipFile_3600 write data to file failed with error:" + err);
      expect(err).assertFail();
      done();
    });
    console.log("==================ACTS_ZipFile_3600 end ==================")
  })

/*
* @tc.number: ACTS_ZipFile_4500
* @tc.name: zipFile
* @tc.desc: COMPRESS_STRATEGY_FILTERED,,
*/
it('ACTS_ZipFile_4500', 0, async function (done) {
    console.log("==================ACTS_ZipFile_4500 start==================");
    var path = dir + "/ACTS_ZipFile_4500.txt";
    var zipDest = dir + "/ACTS_ZipFile_4500.zip"
    var unzipDest = dir + "/ACTS_ZipFile_9900.zip"
    var unzipdir = dir + "/ACTS_ZipFile_4500";
    var zipdir = dir + "/ACTS_ZipFile_9900";
    var options = {};
    options.strategy = zlib.CompressStrategy.COMPRESS_STRATEGY_FILTERED;
    var fd = fileio.openSync(path, 0o100 | 0o2, 0o666);
    fileio.write(fd, infos).then(function (number) {
      console.info("ACTS_ZipFile_4500 write data to file successfully:" + number);
      zlib.zipFile(path, zipDest, options).then((data) => {
        var zipStat = fileio.statSync(zipDest);
        var isFile = zipStat.isFile();
        expect(isFile).assertTrue();
        var srcSize = fileio.statSync(path).size;
        var destSize = zipStat.size;
        expect(srcSize > destSize).assertTrue();
        expect(data).assertEqual(zlib.ErrorCode.ERROR_CODE_OK);
          fileio.mkdir(unzipdir).then(function () {
            console.info("ACTS_ZipFile_4500 mkdir successfully");
            zlib.unzipFile(unzipDest, zipdir, options).then((data) => {
              console.log("ACTS_ZipFile_4500 data: " + data);
              expect(data).assertEqual(zlib.ErrorCode.ERROR_CODE_ERRNO);
              done();
            }).catch((err) => {
              console.log("ACTS_ZipFile_4500 err: " + err);
              expect(err).assertFail();
              done();
            })
          }).catch(function (error) {
            console.info("ACTS_ZipFile_4500 mkdir failed with error:" + error);
            expect(error).assertFail();
            done();
          });
      }).catch((err) => {
         console.log("zipFile fail: " + err);
         expect(err).assertFail();
         done();
      })
    }).catch(function (err) {
        console.info("ACTS_ZipFile_4500 write data to file failed with error:" + err);
        expect(err).assertFail();
        done();
    });
    console.log("==================ACTS_ZipFile_4500 end==================");
  })

/*
* @tc.number: ACTS_ZipFile_4900
* @tc.name: zipFile
* @tc.desc: COMPRESS_STRATEGY_FILTERED,
*/
it('ACTS_ZipFile_4900', 0, async function (done) {
    console.log("==================ACTS_ZipFile_4900 start==================");
    var path = dir + "/ACTS_ZipFile_4900.txt";
    var zipDest = dir + "/ACTS_ZipFile_4900.zip"
    var unzipDest = dir + "/ACTS_ZipFile_4900.zip"
    var unzipdir = dir + "/ACTS_ZipFile_4900";
    var zipdir = dir + "/ACTS_ZipFile_4900";
    var options = {};
    options.strategy = zlib.CompressStrategy.COMPRESS_STRATEGY_FILTERED;
    var fd = fileio.openSync(path, 0o100 | 0o2, 0o666);
    fileio.write(fd, infos).then(function (number) {
      console.info("ACTS_ZipFile_4900 write data to file successfully:" + number);
      zlib.zipFile(path, zipDest, options).then(data => {
        var zipStat = fileio.statSync(zipDest);
        var isFile = zipStat.isFile();
        expect(isFile).assertTrue();
        var srcSize = fileio.statSync(path).size;
        var destSize = zipStat.size;
        expect(srcSize > destSize).assertTrue();
        expect(data).assertEqual(zlib.ErrorCode.ERROR_CODE_OK);
        fileio.mkdir(unzipdir).then(function () {
          console.info("ACTS_ZipFile_4900 mkdir successfully");
          zlib.unzipFile(unzipDest, zipdir, options).then(data => {
            console.log("ACTS_ZipFile_4900 data: " + data);
            expect(data).assertEqual(zlib.ErrorCode.ERROR_CODE_OK);
            done();
          }).catch(err => {
            console.log("unzipFile fail: " + err);
            expect(err).assertFail();
            done();
          })
        }).catch(function (error) {
          console.info("ACTS_ZipFile_4900 mkdir failed with error:" + error);
          expect(error).assertFail();
          done();
        });
      }).catch(err => {
        console.log("zipFile fail: " + err);
        expect(err).assertFail();
        done();
      })
    }).catch(function (err) {
      console.info("ACTS_ZipFile_4900 write data to file failed with error:" + err);
      expect(err).assertFail();
      done();
    });
    console.log("==================ACTS_ZipFile_4900 end==================");
})
    
/*
* @tc.number: ACTS_ZipFile_5000
* @tc.name: zipFile
* @tc.desc: COMPRESS_STRATEGY_FIXED,
*/
it('ACTS_ZipFile_5000', 0, async function (done) {
    console.log("==================ACTS_ZipFile_5000 start==================");
    var path = dir + "/ACTS_ZipFile_5000.txt";
    var zipDest = dir + "/ACTS_ZipFile_5000.zip"
    var unzipdir = dir + "/ACTS_ZipFile_5000";
    var options = {};
    options.strategy = zlib.CompressStrategy.COMPRESS_STRATEGY_FIXED;
    var fd = fileio.openSync(path, 0o100 | 0o2, 0o666);
    fileio.write(fd, infos).then(function (number) {
      console.info("ACTS_ZipFile_5000 write data to file successfully:" + number);
      zlib.zipFile(path, zipDest, options).then(data => {
        var zipStat = fileio.statSync(zipDest);
        var isFile = zipStat.isFile();
        expect(isFile).assertTrue();
        var srcSize = fileio.statSync(path).size;
        var destSize = zipStat.size;
        expect(srcSize > destSize).assertTrue();
        expect(data).assertEqual(zlib.ErrorCode.ERROR_CODE_OK);
        fileio.mkdir(unzipdir).then(function () {
          console.info("ACTS_ZipFile_5000 mkdir successfully");
          zlib.unzipFile(zipDest, unzipdir, options).then(data => {
            console.log("ACTS_ZipFile_5000 data: " + data);
            expect(data).assertEqual(zlib.ErrorCode.ERROR_CODE_OK);
            done();
          }).catch(err => {
            console.log("unzipFile fail: " + err);
            expect(err).assertFail();
            done();
          })
        }).catch(function (error) {
          console.info("ACTS_ZipFile_5000 mkdir failed with error:" + error);
          expect(error).assertFail();
          done();
        });
      }).catch(err => {
        console.log("zipFile fail: " + err);
        expect(err).assertFail();
        done();
      })
    }).catch(function (err) {
      console.info("ACTS_ZipFile_5000 write data to file failed with error:" + err);
      expect(err).assertFail();
      done();
    });
    console.log("==================ACTS_ZipFile_5000 end==================");
    })
})


