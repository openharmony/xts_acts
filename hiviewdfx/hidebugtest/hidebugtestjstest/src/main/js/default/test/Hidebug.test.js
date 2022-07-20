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
import hidebug from '@ohos.hidebug'
import fileio from '@ohos.fileio'
import {describe, it, expect} from 'deccjsunit/index'

describe('HidebugJsTest', function () {

    /*
     * @tc.number    : DFX_DFR_Hiprofiler_Interface_0001
     * @tc.name      : getNativeHeapSize
     * @tc.desc      : Get total native heap memory size
     */
    it('DFX_DFR_Hiprofiler_Interface_0001', 0, function() {
        console.log('************* DFX_DFR_Hiprofiler_Interface_0001 Test start*************');
        try {
            let heapSize = hidebug.getNativeHeapSize();
            expect(heapSize>=BigInt(0)).assertTrue();
        } catch (error) {
            expect().assertFail();
        }
        console.log('************* DFX_DFR_Hiprofiler_Interface_0001 Test end*************');
    });

    /*
     * @tc.number    : DFX_DFR_Hiprofiler_Interface_0002
     * @tc.name      : getNativeHeapAllocatedSize
     * @tc.desc      : Get Native heap memory allocation size.
     */
    it('DFX_DFR_Hiprofiler_Interface_0002', 0, function() {
        console.log('************* DFX_DFR_Hiprofiler_Interface_0002 Test start*************');
        try {
            let heapAllocatedSize = hidebug.getNativeHeapAllocatedSize();
            expect(heapAllocatedSize>=BigInt(0)).assertTrue();
        } catch (error) {
            expect().assertFail();
        }
        console.log('************* DFX_DFR_Hiprofiler_Interface_0002 Test end*************');
    });

    /*
     * @tc.number    : DFX_DFR_Hiprofiler_Interface_0003
     * @tc.name      : getNativeHeapFreeSize
     * @tc.desc      : Get Native heap memory free size
     */
    it('DFX_DFR_Hiprofiler_Interface_0003', 0, function() {
        console.log('************* DFX_DFR_Hiprofiler_Interface_0003 Test start*************');
        try {
            let heapFreeSize = hidebug.getNativeHeapFreeSize();
            expect(heapFreeSize>=BigInt(0)).assertTrue();
        } catch (error) {
            expect().assertFail();
        }
        console.log('************* DFX_DFR_Hiprofiler_Interface_0003 Test end*************');
    });

    /*
     * @tc.number    : DFX_DFR_Hiprofiler_Interface_0004
     * @tc.name      : getPss
     * @tc.desc      : Get application process proportional set size memory information
     */
    it('DFX_DFR_Hiprofiler_Interface_0004', 0, function () {
        console.log('************* DFX_DFR_Hiprofiler_Interface_0004 Test start*************');
        try {
            const times = 3;
            let pssValue = BigInt(0);
            for(let i = 0; i < times; i++){
                let arr = new Array(i*100000).fill(1);
                let tmp = hidebug.getPss();
                console.info('No.' + i + ' tmp: ' + tmp);
                expect(tmp).assertLarger(pssValue);
                pssValue = tmp;
            }
        } catch (error) {
            expect().assertFail();
        }
        console.log('************* DFX_DFR_Hiprofiler_Interface_0004 Test end*************');
    });

    /*
     * @tc.number    : DFX_DFR_Hiprofiler_Interface_0005
     * @tc.name      : getSharedDirty
     * @tc.desc      : Obtains the size of the shared dirty memory of a process.
     */
    it('DFX_DFR_Hiprofiler_Interface_0005', 0, function () {
        console.log('************* DFX_DFR_Hiprofiler_Interface_0005 Test start*************');
        try {
            let dirty = hidebug.getSharedDirty();
            let temp = hidebug.getSharedDirty();
            expect(dirty).assertEqual(temp);
        } catch (error) {
            expect().assertFail();
        }
        console.log('************* DFX_DFR_Hiprofiler_Interface_0005 Test end*************');
    });

    /*
     * @tc.number    : DFX_DFR_Hiprofiler_Interface_0006
     * @tc.name      : startProfiling with normal parameter
     * @tc.desc      : Start CPU Profiling.
     */
    it('DFX_DFR_Hiprofiler_Interface_0006', 0, function () {
        console.log('************* DFX_DFR_Hiprofiler_Interface_0006 Test start*************');
        try {
            let timestamp = Date.now();
            let filename = 'cpuprofiler-' + timestamp.toString();
            console.info(filename);
            let path = '/data/app/el2/100/base/com.hidebug.test/files/' + filename + '.json'
            hidebug.startProfiling(filename);
            let temp = 100;
            hidebug.stopProfiling();
            console.info('file is exists:', path);
            expect(true).assertTrue();
        } catch (error) {
            expect().assertFail();
        }
        console.log('************* DFX_DFR_Hiprofiler_Interface_0006 Test end*************');
    });

    /*
     * @tc.number    : DFX_DFR_Hiprofiler_Interface_0007
     * @tc.name      : startProfiling repeatedly
     * @tc.desc      : Start CPU Profiling.
     */
    it('DFX_DFR_Hiprofiler_Interface_0007', 0, function () {
        console.log('************* DFX_DFR_Hiprofiler_Interface_0007 Test start*************');
        try {
            let path1 = '/data/app/el2/100/base/com.hidebug.test/files/cpuprofiler-111.json'
            let path2 = '/data/app/el2/100/base/com.hidebug.test/files/cpuprofiler-222.json'
            let path3 = '/data/app/el2/100/base/com.hidebug.test/files/cpuprofiler-333.json'
            hidebug.startProfiling('cpuprofiler-111');
            hidebug.startProfiling('cpuprofiler-222');
            hidebug.startProfiling('cpuprofiler-333');
            let temp = 100;
            hidebug.stopProfiling();
            hidebug.stopProfiling();
            console.info('file is exists:', path1);
            console.info('file is exists:', path2);
            console.info('file is exists:', path3);
            expect(true).assertTrue();
        } catch (error) {
            expect().assertFail();
        }
        console.log('************* DFX_DFR_Hiprofiler_Interface_0007 Test end*************');
    });

    /*
     * @tc.number    : DFX_DFR_Hiprofiler_Interface_0008
     * @tc.name      : startProfiling with empty parameter
     * @tc.desc      : Start CPU Profiling.
     */
    it('DFX_DFR_Hiprofiler_Interface_0008', 0, function () {
        console.log('************* DFX_DFR_Hiprofiler_Interface_0008 Test start*************');
        let path = '/data/app/el2/100/base/com.hidebug.test/files/undefined.json'
        try {
            fileio.accessSync(path, 0);
            let res = fileio.unlinkSync(path);
            console.log(JSON.stringify(res));
        } catch(e) {
            console.info('the file is not exists');
        }
        try {
            hidebug.startProfiling('');
            let temp = 100;
            hidebug.stopProfiling();
            console.info('file is exists:', path);
            expect(true).assertTrue();
        } catch (error) {
            expect().assertFail();
        }
        console.log('************* DFX_DFR_Hiprofiler_Interface_0008 Test end*************');
    });

    /*
     * @tc.number    : DFX_DFR_Hiprofiler_Interface_0009
     * @tc.name      : startProfiling with overlong parameter
     * @tc.desc      : Start CPU Profiling.
     */
    it('DFX_DFR_Hiprofiler_Interface_0009', 0, function () {
        console.log('************* DFX_DFR_Hiprofiler_Interface_0009 Test start*************');
        let path = '/data/app/el2/100/base/com.hidebug.test/files/undefined.json'
        try {
            fileio.accessSync(path, 0);
            let res = fileio.unlinkSync(path);
            console.log(JSON.stringify(res));
        } catch(e) {
            console.info('the file is not exists');
        }
        let str = '';
        for (let i = 0; i < 1000; i++) {
            str += 'abcd';
        }
        try {
            hidebug.startProfiling(str);
            let temp = 100;
            hidebug.stopProfiling();
            console.info('file is exists:', path);
            expect(true).assertTrue();
        } catch (error) {
            expect().assertFail();
        }
        console.log('************* DFX_DFR_Hiprofiler_Interface_0009 Test end*************');
    });

    /*
     * @tc.number    : DFX_DFR_Hiprofiler_Interface_0010
     * @tc.name      : dumpHeapData with normal parameter
     * @tc.desc      : Dump JS Virtual Machine Heap Snapshot.
     */
    it('DFX_DFR_Hiprofiler_Interface_0010', 0, function () {
        console.log('************* DFX_DFR_Hiprofiler_Interface_0010 Test start*************');
        try {
            let timestamp = Date.now();
            let filename = 'heap-' + timestamp.toString();
            console.info(filename);
            let path = '/data/app/el2/100/base/com.hidebug.test/files/' + filename + '.heapsnapshot'
            hidebug.dumpHeapData(filename);
            console.info('file is exists:', path);
            expect(true).assertTrue();
        } catch (error) {
            expect().assertFail();
        }
        console.log('************* DFX_DFR_Hiprofiler_Interface_0010 Test end*************');
      });

    /*
     * @tc.number    : DFX_DFR_Hiprofiler_Interface_0011
     * @tc.name      : dumpHeapData with empty parameter
     * @tc.desc      : Dump JS Virtual Machine Heap Snapshot.
     */
    it('DFX_DFR_Hiprofiler_Interface_0011', 0, function () {
        console.log('************* DFX_DFR_Hiprofiler_Interface_0011 Test start*************');
        let path = '/data/app/el2/100/base/com.hidebug.test/files/undefined.heapsnapshot'
        try {
            fileio.accessSync(path, 0);
            let res = fileio.unlinkSync(path);
            console.log(JSON.stringify(res));
        } catch(e) {
            console.info('the file is not exists');
        }
        try {
            hidebug.dumpHeapData('');
            console.info('file is exists:', path);
            expect(true).assertTrue();
        } catch (error) {
            expect().assertFail();
        }
        console.log('************* DFX_DFR_Hiprofiler_Interface_0011 Test end*************');
      });

    /*
     * @tc.number    : DFX_DFR_Hiprofiler_Interface_0012
     * @tc.name      : dumpHeapData with overlog parameter
     * @tc.desc      : Dump JS Virtual Machine Heap Snapshot.
     */
    it('DFX_DFR_Hiprofiler_Interface_0012', 0, function () {
        console.log('************* DFX_DFR_Hiprofiler_Interface_0012 Test start*************');
        let path = '/data/app/el2/100/base/com.hidebug.test/files/undefined.heapsnapshot'
        try {
            fileio.accessSync(path, 0);
            let res = fileio.unlinkSync(path);
            console.log(JSON.stringify(res));
        } catch(e) {
            console.info('the file is not exists');
        }
        let str = '';
        for (let i = 0; i < 1000; i++) {
            str += 'abcd';
        }
        try {
            hidebug.dumpHeapData(str);
            console.info('file is exists:', path);
            expect(true).assertTrue();
        } catch (error) {
            expect().assertFail();
        }
        console.log('************* DFX_DFR_Hiprofiler_Interface_0012 Test end*************');
    });

    /*
     * @tc.number    : DFX_DFR_Hiprofiler_Interface_0013
     * @tc.name      : getPrivateDirty
     * @tc.desc      : Get the size of the private dirty memory
     */
    it('DFX_DFR_Hiprofiler_Interface_0013', 0, function() {
        console.log('************* DFX_DFR_Hiprofiler_Interface_0013 Test start*************');
        try {
            let temp = hidebug.getPrivateDirty();
            expect(temp>=BigInt(0)).assertTrue();
        } catch (error) {
            expect().assertFail();
        }
        console.log('************* DFX_DFR_Hiprofiler_Interface_0013 Test end*************');
    });

    /*
     * @tc.number    : DFX_DFR_Hiprofiler_Interface_0014
     * @tc.name      : getCpuUsage
     * @tc.desc      : Get the cpu usage of a process
     */
    it('DFX_DFR_Hiprofiler_Interface_0014', 0, function() {
        console.log('************* DFX_DFR_Hiprofiler_Interface_0014 Test start*************');
        try {
            let temp = -1;
            for(let i=0;i<=101;i++){
                for(let j=0;j<=101;j++){
                    if(i+j == 202){
                        temp = hidebug.getCpuUsage();
                        console.info("CpuUsage is " + temp);
                    }
                }
            }
            expect(temp>=0 && temp<=1).assertTrue();
        } catch (error) {
            expect().assertFail();
        }
        console.log('************* DFX_DFR_Hiprofiler_Interface_0014 Test end*************');
    });

    /*
     * @tc.number    : DFX_DFR_Hiprofiler_Interface_0015
     * @tc.name      : getServiceDump with normal parameter
     * @tc.desc      : getServiceDump
     */
    it('DFX_DFR_Hiprofiler_Interface_0015', 0, function() {
        console.log('************* DFX_DFR_Hiprofiler_Interface_0015 Test start*************');
        try {
            let temp = hidebug.getServiceDump(10);
            console.info("ServiceDump is " + temp);
            expect(temp.indexOf('Success')!=-1).assertTrue();
        } catch (error) {
            expect().assertFail();
        }
        console.log('************* DFX_DFR_Hiprofiler_Interface_0015 Test end*************');
    });

    /*
     * @tc.number    : DFX_DFR_Hiprofiler_Interface_0016
     * @tc.name      : getServiceDump with abnormal parameter
     * @tc.desc      : getServiceDump
     */
    it('DFX_DFR_Hiprofiler_Interface_0016', 0, function() {
        console.log('************* DFX_DFR_Hiprofiler_Interface_0016 Test start*************');
        try {
            let temp = hidebug.getServiceDump(-1);
            console.info("ServiceDump is " + temp);
            expect(temp=="Error: no such system ability service.").assertTrue();
        } catch (error) {
            expect().assertFail();
        }
        console.log('************* DFX_DFR_Hiprofiler_Interface_0016 Test end*************');
    });

    /*
     * @tc.number    : DFX_DFR_Hiprofiler_Interface_0017
     * @tc.name      : getServiceDump with overlog parameter
     * @tc.desc      : getServiceDump
     */
    it('DFX_DFR_Hiprofiler_Interface_0017', 0, function() {
        console.log('************* DFX_DFR_Hiprofiler_Interface_0017 Test start*************');
        try {
            let temp = hidebug.getServiceDump(9007199254740993);
            console.info("ServiceDump is " + temp);
            expect(temp=="Error: invalid param").assertTrue();
        } catch (error) {
            expect().assertFail();
        }
        console.log('************* DFX_DFR_Hiprofiler_Interface_0017 Test end*************');
    });
    
})
