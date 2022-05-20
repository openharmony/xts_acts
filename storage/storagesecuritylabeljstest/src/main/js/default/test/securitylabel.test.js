/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
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

import {
    describe, it, expect, securityLabel, nextFileName, fileio
} from './Common';

describe('securitylabel', function () {

    /**
      * @tc.number SUB_DF_SECURITYLABEL_SET_SECURITY_LABEL_SYNC_0000
      * @tc.name securitylabel_test_set_security_label_sync_000
      * @tc.desc Test the setSecurityLabelSync() interface,and the getSecurityLabelSync() interface to get the data label.
      * @tc.size MEDIUM
      * @tc.type Function
      * @tc.level Level 0
      * @tc.require
      */
     it('securitylabel_test_set_security_label_sync_000', 0, async function () {
        try {
            let dataLevel = ["s0","s1","s2","s3","s4"];
            for(let i=0;i<dataLevel.length;i++){
                let fpath = await nextFileName("test"+dataLevel[i]+'.txt');
                fileio.openSync(fpath, 0o102, 0o666);
                securityLabel.setSecurityLabelSync(fpath, dataLevel[i]);
                let level = securityLabel.getSecurityLabelSync(fpath);
                expect(level == dataLevel[i]).assertTrue();
                fileio.unlinkSync(fpath);
            }
            
        } catch (e) {
            console.log('securitylabel_test_set_security_label_sync_000 has failed for ' + e);
            expect(null).assertFail();
        }
    });

    /**
      * @tc.number SUB_DF_SECURITYLABEL_SET_SECURITY_LABEL_SYNC_0010
      * @tc.name securitylabel_test_set_security_label_sync_001
      * @tc.desc Test the setSecurityLabelSync() interface, When the dataLevel is wrong.
      * @tc.size MEDIUM
      * @tc.type Function
      * @tc.level Level 0
      * @tc.require
      */
     it('securitylabel_test_set_security_label_sync_001', 0, async function () {
        let fpath = await nextFileName("test.txt");
        fileio.openSync(fpath, 0o102, 0o666);
        try {
            securityLabel.setSecurityLabelSync(fpath, "abc");
        } catch (err) {
            console.log('securitylabel_test_set_security_label_sync_001 has failed for ' + err);
            expect(err.message == "Invalid Argument of dataLevelEnum").assertTrue();
            fileio.unlinkSync(fpath);
        }
    });


    /**
      * @tc.number SUB_DF_SECURITYLABEL_SET_SECURITY_LABEL_SYNC_0020
      * @tc.name securitylabel_test_set_security_label_sync_002
      * @tc.desc Test the setSecurityLabelSync() interface,When the path does not exist. 
      * @tc.size MEDIUM
      * @tc.type Function
      * @tc.level Level 0
      * @tc.require
      */
     it('securitylabel_test_set_security_label_sync_002', 0, async function () {
        try {
            let result = securityLabel.setSecurityLabelSync("/data/aaa.txt", "s0");
            expect(result.code == -1).assertTrue();
        } catch (e) {
            console.log('securitylabel_test_set_security_label_sync_002 has failed for ' + err);
        }
    });

    /**
      * @tc.number SUB_DF_SECURITYLABEL_SET_SECURITY_LABEL_SYNC_0030
      * @tc.name securitylabel_test_set_security_label_sync_003
      * @tc.desc Test the setSecurityLabelSync() interface,When the dataLevel type is wrong. 
      * @tc.size MEDIUM
      * @tc.type Function
      * @tc.level Level 0
      * @tc.require
      */
     it('securitylabel_test_set_security_label_sync_003', 0, async function () {
        let fpath = await nextFileName("test.txt");
        fileio.openSync(fpath, 0o102, 0o666);
        try {
            securityLabel.setSecurityLabelSync(fpath, 1);
        } catch (err) {
            console.log('securitylabel_test_set_security_label_sync_003 has failed for ' + err);
            expect(err.message == "Invalid dataLevel").assertTrue();
            fileio.unlinkSync(fpath);
        }
    });

    /**
      * @tc.number SUB_DF_SECURITYLABEL_SET_SECURITY_LABEL_SYNC_0040
      * @tc.name securitylabel_test_set_security_label_sync_004
      * @tc.desc Test the setSecurityLabelSync() interface,When there is no datalevel parameter. 
      * @tc.size MEDIUM
      * @tc.type Function
      * @tc.level Level 0
      * @tc.require
      */
     it('securitylabel_test_set_security_label_sync_004', 0, async function () {
        let fpath = await nextFileName("test.txt");
        fileio.openSync(fpath, 0o102, 0o666);
        try {
            securityLabel.setSecurityLabelSync(fpath);
        } catch (err) {
            console.log('securitylabel_test_set_security_label_sync_004 has failed for ' + err);
            expect(err.message == "Number of arguments unmatched").assertTrue();
            fileio.unlinkSync(fpath);
        }
    });

    /**
      * @tc.number SUB_DF_SECURITYLABEL_SET_SECURITY_LABEL_0000
      * @tc.name securitylabel_test_set_security_label_async_000
      * @tc.desc Test that the setSecurityLabel() interface callback to set the data label. Test the getSecurityLabel() interface callback to get the data label.
      * @tc.size MEDIUM
      * @tc.type Function
      * @tc.level Level 0
      * @tc.require
      */
    it('securitylabel_test_set_security_label_async_000', 0, async function (done) {
        let fpath = await nextFileName('test.txt');
        fileio.openSync(fpath, 0o102, 0o666);

        try {
            securityLabel.setSecurityLabel(fpath, 's0', function (err) {
                securityLabel.getSecurityLabel(fpath, function (err, dataLevel) {
                    expect(dataLevel == 's0').assertTrue();
                    fileio.unlinkSync(fpath);
                    done();
                })
            })
        } catch (e) {
            console.log('securitylabel_test_set_security_label_async_000 has failed for ' + e);
            expect(null).assertFail();
        }
    });

    /**
      * @tc.number SUB_DF_SECURITYLABEL_SET_SECURITY_LABEL_0010
      * @tc.name securitylabel_test_set_security_label_async_001
      * @tc.desc Test that the setSecurityLabel() interface callback to set the data label. Test the getSecurityLabel() interface promises to get the data label.
      * @tc.size MEDIUM
      * @tc.type Function
      * @tc.level Level 0
      * @tc.require
      */
    it('securitylabel_test_set_security_label_async_001', 0, async function (done) {
        let fpath = await nextFileName('test1.txt');
        fileio.openSync(fpath, 0o102, 0o666);

        try {
            securityLabel.setSecurityLabel(fpath, 's1', async function (err) {
                let dataLevel = await securityLabel.getSecurityLabel(fpath);
                expect(dataLevel == 's1').assertTrue();
                fileio.unlinkSync(fpath);
                done();
            })
        } catch (e) {
            console.log('securitylabel_test_set_security_label_async_001 has failed for ' + e);
            expect(null).assertFail();
        }
    });

    /**
      * @tc.number SUB_DF_SECURITYLABEL_SET_SECURITY_LABEL_0020
      * @tc.name securitylabel_test_set_security_label_async_002
      * @tc.desc Test that the setSecurityLabel() interface promises to set the data label. Test the getSecurityLabel() interface callback to get the data label.
      * @tc.size MEDIUM
      * @tc.type Function
      * @tc.level Level 0
      * @tc.require
      */
    it('securitylabel_test_set_security_label_async_002', 0, async function (done) {
        let fpath = await nextFileName('test2.txt');
        fileio.openSync(fpath, 0o102, 0o666);

        try {
            await securityLabel.setSecurityLabel(fpath, 's2');
            securityLabel.getSecurityLabel(fpath, function (err, dataLevel) {
                expect(dataLevel == 's2').assertTrue();
                fileio.unlinkSync(fpath);
                done();
            })
        } catch (e) {
            console.log('securitylabel_test_set_security_label_async_002 has failed for ' + e);
            expect(null).assertFail();
        }
    });

    /**
      * @tc.number SUB_DF_SECURITYLABEL_SET_SECURITY_LABEL_0030
      * @tc.name securitylabel_test_set_security_label_async_003
      * @tc.desc Test that the setSecurityLabel() interface promises to set the data label. Test the getSecurityLabel() interface promises to get the data label.
      * @tc.size MEDIUM
      * @tc.type Function
      * @tc.level Level 0
      * @tc.require
      */
    it('securitylabel_test_set_security_label_async_003', 0, async function (done) {
        let fpath = await nextFileName('test3.txt');
        fileio.openSync(fpath, 0o102, 0o666);

        try {
            await securityLabel.setSecurityLabel(fpath, 's3');
            let dataLevel = await securityLabel.getSecurityLabel(fpath);
            expect(dataLevel == 's3').assertTrue();
            fileio.unlinkSync(fpath);
            done();
        } catch (e) {
            console.log('securitylabel_test_set_security_label_async_003 has failed for ' + e);
            expect(null).assertFail();
        }
    });

    /**
      * @tc.number SUB_DF_SECURITYLABEL_SET_SECURITY_LABEL_0040
      * @tc.name securitylabel_test_set_security_label_async_004
      * @tc.desc Test that the setSecurityLabel() interface promises to set the data label. Test the getSecurityLabel() interface promises to get the data label.
      * @tc.size MEDIUM
      * @tc.type Function
      * @tc.level Level 0
      * @tc.require
      */
    it('securitylabel_test_set_security_label_async_004', 0, async function (done) {
        let fpath = await nextFileName('test4.txt');
        fileio.openSync(fpath, 0o102, 0o666);

        try {
            await securityLabel.setSecurityLabel(fpath, 's4');
            let dataLevel = await securityLabel.getSecurityLabel(fpath);
            expect(dataLevel == 's4').assertTrue();
            fileio.unlinkSync(fpath));
            done();
        } catch (e) {
            console.log('securitylabel_test_set_security_label_async_004 has failed for ' + e);
            expect(null).assertFail();
        }
    });

    /**
      * @tc.number SUB_DF_SECURITYLABEL_SET_SECURITY_LABEL_0050
      * @tc.name securitylabel_test_set_security_label_async_005
      * @tc.desc Test setSecurityLabel() interfaces,When the path type is wrong.
      * @tc.size MEDIUM
      * @tc.type Function
      * @tc.level Level 0
      * @tc.require
      */
    it('securitylabel_test_set_security_label_async_005', 0, async function (done) {
        try {
            await securityLabel.setSecurityLabel(123, 's0');
        } catch (err) {
            console.log('securitylabel_test_set_security_label_async_005 has failed for ' + err);
            expect(err.message == "Invalid path").assertTrue();
            done();
        }
    });

    /**
      * @tc.number SUB_DF_SECURITYLABEL_SET_SECURITY_LABEL_0060
      * @tc.name securitylabel_test_set_security_label_async_006
      * @tc.desc Test setSecurityLabel() interfaces,return false when the path is invalid.
      * @tc.size MEDIUM
      * @tc.type Function
      * @tc.level Level 0
      * @tc.require
      */
    it('securitylabel_test_set_security_label_async_006', 0, async function (done) {
        try {
            await securityLabel.setSecurityLabel('/data/test.txt', 's0');
        } catch (err) {
            console.log('securitylabel_test_set_security_label_async_006 has failed for ' + err);
            expect(err.code == -1).assertTrue();
            done();
        }
    });

    /**
      * @tc.number SUB_DF_SECURITYLABEL_SET_SECURITY_LABEL_0070
      * @tc.name securitylabel_test_set_security_label_async_007
      * @tc.desc Test setSecurityLabel() interfaces,Throw exception when path is empty.
      * @tc.size MEDIUM
      * @tc.type Function
      * @tc.level Level 0
      * @tc.require
      */
    it('securitylabel_test_set_security_label_async_007', 0, async function (done) {
        try {
            await securityLabel.setSecurityLabel('s0');
        } catch (err) {
            console.log('securitylabel_test_set_security_label_async_007 has failed for ' + err);
            expect(err.message == "Number of arguments unmatched").assertTrue();
            done();
        }
    });

    /**
      * @tc.number SUB_DF_SECURITYLABEL_SET_SECURITY_LABEL_0080
      * @tc.name securitylabel_test_set_security_label_async_008
      * @tc.desc Test setSecurityLabel() interfaces,When the dataLevel type is wrong.
      * @tc.size MEDIUM
      * @tc.type Function
      * @tc.level Level 0
      * @tc.require
      */
    it('securitylabel_test_set_security_label_async_008', 0, async function (done) {
        let fpath = await nextFileName('test5.txt');
        fileio.openSync(fpath, 0o102, 0o666);

        try {
            await securityLabel.setSecurityLabel(fpath, 1)
        } catch (err) {
            console.log('securitylabel_test_set_security_label_async_008 has failed for ' + err);
            expect(err.message == "Invalid dataLevel").assertTrue();
            done();
        }
    });

    /**
      * @tc.number SUB_DF_SECURITYLABEL_SET_SECURITY_LABEL_0090
      * @tc.name securitylabel_test_set_security_label_async_009
      * @tc.desc Test setSecurityLabel() interfaces,return false when the dataLevel is invalid.
      * @tc.size MEDIUM
      * @tc.type Function
      * @tc.level Level 0
      * @tc.require
      */
    it('securitylabel_test_set_security_label_async_009', 0, async function (done) {
        let fpath = await nextFileName('test6.txt');
        fileio.openSync(fpath, 0o102, 0o666);

        try {
            await securityLabel.setSecurityLabel(fpath, 'ss');
        } catch (err) {
            console.log('securitylabel_test_set_security_label_async_009 has failed for ' + err);
            expect(err.message == "Invalid Argument of dataLevelEnum").assertTrue();
            done();
        }
    });

    /**
      * @tc.number SUB_DF_SECURITYLABEL_SET_SECURITY_LABEL_0100
      * @tc.name securitylabel_test_set_security_label_async_010
      * @tc.desc Test setSecurityLabel() interfaces,Throw exception when dataLevel is empty.
      * @tc.size MEDIUM
      * @tc.type Function
      * @tc.level Level 0
      * @tc.require
      */
    it('securitylabel_test_set_security_label_async_010', 0, async function (done) {
        let fpath = await nextFileName('test7.txt');
        fileio.openSync(fpath, 0o102, 0o666);

        try {
            await securityLabel.setSecurityLabel(fpath);
        } catch (err) {
            console.log('securitylabel_test_set_security_label_async_010 has failed for ' + err);
            fileio.unlinkSync(fpath);
            expect(err.message == "Number of arguments unmatched").assertTrue();
            done();
        }
    });

    /**
      * @tc.number SUB_DF_SECURITYLABEL_SET_SECURITY_LABEL_0110
      * @tc.name securitylabel_test_set_security_label_async_011
      * @tc.desc Test setSecurityLabel() interfaces,Throws an exception when passing multiple parameters.
      * @tc.size MEDIUM
      * @tc.type Function
      * @tc.level Level 0
      * @tc.require
      */
    it('securitylabel_test_set_security_label_async_011', 0, async function (done) {
        let fpath = await nextFileName('test8.txt');
        fileio.openSync(fpath, 0o102, 0o666);

        try {
            securityLabel.setSecurityLabel(fpath, 's0', '', function (err) {
                done();
            })
        } catch (err) {
            console.log('securitylabel_test_set_security_label_async_011 has failed for ' + err);
            fileio.unlinkSync(fpath);
            expect(err.message == "Number of arguments unmatched").assertTrue();
            done();
        }
    });

    /**
      * @tc.number SUB_DF_SECURITYLABEL_GET_SECURITY_LABEL_SYNC_0000
      * @tc.name securitylabel_test_get_security_label_sync_000
      * @tc.desc Test getSecurityLabelSync() interfaces,return empty when path is empty string.
      * @tc.size MEDIUM
      * @tc.type Function
      * @tc.level Level 0
      * @tc.require
      */
     it('securitylabel_test_get_security_label_sync_000', 0, function () {
        try {
            let dataLevel = securityLabel.getSecurityLabelSync('');
            expect(dataLevel == '').assertTrue();
        } catch (e) {
            console.log('securitylabel_test_get_security_label_sync_000 has failed for ' + e);
            expect(null).assertFail();
        }
    });

    /**
      * @tc.number SUB_DF_SECURITYLABEL_GET_SECURITY_LABEL_SYNC_0010
      * @tc.name securitylabel_test_get_security_label_sync_001
      * @tc.desc Test getSecurityLabelSync() interfaces,return empty when the path is invalid.
      * @tc.size MEDIUM
      * @tc.type Function
      * @tc.level Level 0
      * @tc.require
      */
     it('securitylabel_test_get_security_label_sync_001', 0, function () {
        try {
            let dataLevel = securityLabel.getSecurityLabelSync('/data/test.txt');
            expect(dataLevel == '').assertTrue();
        } catch (e) {
            console.log('securitylabel_test_get_security_label_sync_001 has failed for ' + e);
            expect(null).assertFail();
        }
    });

    /**
      * @tc.number SUB_DF_SECURITYLABEL_GET_SECURITY_LABEL_SYNC_0020
      * @tc.name securitylabel_test_get_security_label_sync_002
      * @tc.desc Test getSecurityLabelSync() interfaces,When there are no parameters.
      * @tc.size MEDIUM
      * @tc.type Function
      * @tc.level Level 0
      * @tc.require
      */
     it('securitylabel_test_get_security_label_sync_002', 0, function () {
        try {
            securityLabel.getSecurityLabelSync();
        } catch (err) {
            console.log('securitylabel_test_get_security_label_sync_002 has failed for ' + err);
            expect(err.message == "Number of arguments unmatched").assertTrue();
        }
    });

    /**
      * @tc.number SUB_DF_SECURITYLABEL_GET_SECURITY_LABEL_SYNC_0030
      * @tc.name securitylabel_test_get_security_label_sync_003
      * @tc.desc Test getSecurityLabelSync() interfaces,When the path type is wrong.
      * @tc.size MEDIUM
      * @tc.type Function
      * @tc.level Level 0
      * @tc.require
      */
     it('securitylabel_test_get_security_label_sync_003', 0, function () {
        try {
            securityLabel.getSecurityLabelSync(123);
        } catch (err) {
            console.log('securitylabel_test_get_security_label_sync_003 has failed for ' + err);
            expect(err.message == "Invalid path").assertTrue();
        }
    });

    /**
      * @tc.number SUB_DF_SECURITYLABEL_GET_SECURITY_LABEL_0000
      * @tc.name securitylabel_test_get_security_label_async_000
      * @tc.desc Test getSecurityLabel() interfaces,When the path type is wrong.
      * @tc.size MEDIUM
      * @tc.type Function
      * @tc.level Level 0
      * @tc.require
      */
    it('securitylabel_test_get_security_label_async_000', 0, async function (done) {
        try {
            await securityLabel.getSecurityLabel(123);
        } catch (err) {
            console.log('securitylabel_test_get_security_label_async_000 has failed for ' + err);
            expect(err.message == "Invalid path").assertTrue();
            done();
        }
    });

    /**
      * @tc.number SUB_DF_SECURITYLABEL_GET_SECURITY_LABEL_0010
      * @tc.name securitylabel_test_get_security_label_async_001
      * @tc.desc Test getSecurityLabel() interfaces,return empty when the path is invalid.
      * @tc.size MEDIUM
      * @tc.type Function
      * @tc.level Level 0
      * @tc.require
      */
    it('securitylabel_test_get_security_label_async_001', 0, async function (done) {
        try {
            let dataLevel = await securityLabel.getSecurityLabel('/data/test.txt');
            expect(dataLevel == '').assertTrue();
            done();
        } catch (e) {
            console.log('securitylabel_test_get_security_label_async_001 has failed for ' + e);
            expect(null).assertFail();
            done();
        }
    });
    

    /**
      * @tc.number SUB_DF_SECURITYLABEL_GET_SECURITY_LABEL_0020
      * @tc.name securitylabel_test_get_security_label_async_002
      * @tc.desc Test getSecurityLabel() interfaces,Throw exception when path is empty.
      * @tc.size MEDIUM
      * @tc.type Function
      * @tc.level Level 0
      * @tc.require
      */
    it('securitylabel_test_get_security_label_async_002', 0, async function (done) {
        try {
            await securityLabel.getSecurityLabel();
        } catch (err) {
            console.log('securitylabel_test_get_security_label_async_002 has failed for ' + err);
            expect(err.message == "Number of arguments unmatched").assertTrue();
            done();
        }
    });

    /**
      * @tc.number SUB_DF_SECURITYLABEL_GET_SECURITY_LABEL_0030
      * @tc.name securitylabel_test_get_security_label_async_003
      * @tc.desc Test getSecurityLabel() interfaces,Throws an exception when passing multiple parameters.
      * @tc.size MEDIUM
      * @tc.type Function
      * @tc.level Level 0
      * @tc.require
      */
    it('securitylabel_test_get_security_label_async_003', 0, async function (done) {
        let fpath = await nextFileName('test9.txt');
        fileio.openSync(fpath, 0o102, 0o666);
        try {
            securityLabel.getSecurityLabel(fpath, '', function(err, dataLevel) {
                done();
            });
        } catch (err) {
            console.log('securitylabel_test_get_security_label_async_003 has failed for ' + err);
            fileio.unlinkSync(fpath);
            expect(err.message == "Number of arguments unmatched").assertTrue();
            done();
        }
    });
});
