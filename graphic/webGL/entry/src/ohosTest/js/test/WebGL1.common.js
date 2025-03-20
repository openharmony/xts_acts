/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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

import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';

import {checkError, createProgram, getColorUint8Array} from './WebGL1';


export default function webgl1_common() {
    
	describe('webgl1_common', function () {
        let gl = global.gl;
        // Defines a test suite. Two parameters are supported: test suite name and test suite function.
        beforeAll(function () {
            hilog.info(0x0000, 'testTag', '%{public}s', 'webgl1_test_01 start');
            // Presets an action, which is performed only once before all test cases of the test suite start.
            // This API supports only one parameter: preset action function.
        })
        beforeEach(function () {
            // Presets an action, which is performed before each unit test case starts.
            // The number of execution times is the same as the number of test cases defined by **it**.
            // This API supports only one parameter: preset action function.
            checkError(gl);
        })
        afterEach(function () {
            // Presets a clear action, which is performed after each unit test case ends.
            // The number of execution times is the same as the number of test cases defined by **it**.
            // This API supports only one parameter: clear action function.
            checkError(gl);
        })
        afterAll(function () {
            // Presets a clear action, which is performed after all test cases of the test suite end.
            // This API supports only one parameter: clear action function.
            hilog.info(0x0000, 'testTag', '%{public}s', 'webgl1_test_01 end');
        })

        function createProgram(gl, vSource, fSource) {
            let createShader = (gl, type, source) => {
                let shader = gl.createShader(type); // 创建顶点着色器
                if (shader == null) {
                    console.log('unable to create shader');
                    return null;
                }
                gl.shaderSource(shader, source); // 设置着色器代码
                gl.compileShader(shader); // 编译
                let shaderParameter = gl.getShaderParameter(shader, gl.COMPILE_STATUS);
                if (!shaderParameter) { // 如果编译失败
                    let error = gl.getShaderInfoLog(shader);
                    console.log('failed to compile shader: ' + error);
                    gl.deleteShader(shader); // 删除着色器
                    return null;
                }
                return shader;
            }
            let vertexShader = createShader(gl, gl.VERTEX_SHADER, vSource);
            let fragmentShader = createShader(gl, gl.FRAGMENT_SHADER, fSource);
            if (!vertexShader || !fragmentShader) {
                console.log('failed to link program');
                return null;
            }
            let program = gl.createProgram();
            if (!program) {
                console.log('failed to link program');
                return null;
            }
            gl.attachShader(program, vertexShader);
            gl.attachShader(program, fragmentShader);
            gl.linkProgram(program);
            let linked = gl.getProgramParameter(program, gl.LINK_STATUS);
            if (!linked) {
                let error = gl.getProgramInfoLog(program);
                console.log('failed to link program: ' + error);
                gl.deleteProgram(program);
                gl.deleteShader(fragmentShader);
                gl.deleteShader(vertexShader);
                return null;
            }
            gl.useProgram(program);
            gl.program = program;
            return {
                program, vertexShader, fragmentShader
            };
        }

        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0001
         * @tc.name webgl_test_finish
         * @tc.desc Test finish.
         */
        it('webgl_test_finish', 0, async function (done) {
            console.info("webgltest [webgl_test_finish] finish");
            gl.finish();
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            checkError(gl);
            done();
        });

        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0002
         * @tc.name webgl_test_flush
         * @tc.desc Test flush.
         */
        it('webgl_test_flush', 0, async function (done) {
            console.info("webgltest [webgl_test_flush] flush");
            gl.flush();
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            checkError(gl);
            done();
        });

        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0003
         * @tc.name webgl_test_getError
         * @tc.desc Test getError.
         */
        it('webgl_test_getError', 0, async function (done) {
            console.info("webgltest [webgl_test_getError] getError");
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            let vShader = gl.createShader(1);
            expect(checkError(gl)).assertEqual(gl.INVALID_ENUM);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            checkError(gl);
            done();
        })

        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0004
         * @tc.name webgl_test_isContextLost
         * @tc.desc Test isContextLost.
         */
        it('webgl_test_isContextLost', 0, async function (done) {
            console.info("webgltest [webgl_test_isContextLost] isContextLost");
            let isContextLost = gl.isContextLost();
            console.info("webgltest isContextLost:", isContextLost);
            expect(isContextLost).assertEqual(false);
            checkError(gl);
            done();
        })

        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0005
         * @tc.name webgl_test_isEnabled
         * @tc.desc Test isEnabled.
         */
        it('webgl_test_isEnabled', 0, async function (done) {
            let srcEnable = gl.isEnabled(gl.DEPTH_TEST);
            console.info("webgltest [webgl_test_isEnabled] isEnabled");
            gl.disable(gl.DEPTH_TEST);
            expect(gl.isEnabled(gl.DEPTH_TEST)).assertEqual(false);
            gl.enable(gl.DEPTH_TEST);
            console.log("webgltest DEPTH_TEST:", gl.isEnabled(gl.DEPTH_TEST));
            expect(gl.isEnabled(gl.DEPTH_TEST)).assertEqual(true);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            console.log("webgltest RASTERIZER_DISCARD:", gl.isEnabled(gl.RASTERIZER_DISCARD));
            expect(checkError(gl)).assertEqual(gl.INVALID_ENUM);
            if (srcEnable) {
                gl.enable(gl.DEPTH_TEST);
            } else {
                gl.disable(gl.DEPTH_TEST);
            }
            checkError(gl);
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0006
         * @tc.name webgl_test_isEnabled_1
         * @tc.desc Test isEnabled.
         */
        it('webgl_test_isEnabled_1', 0, async function (done) {
            console.info("webgltest [webgl_test_isEnabled] isEnabled1");
            const isEnabled = gl.isEnabled(gl.BLEND)
            console.log("webgltest gl.isEnabled(gl.BLEND):", isEnabled);
            console.log("webgltest gl.enable(gl.BLEND)");
            gl.enable(gl.BLEND)
            console.log("webgltest gl.isEnabled(gl.BLEND):", gl.isEnabled(gl.BLEND));
            expect(gl.isEnabled(gl.BLEND)).assertEqual(true)
            if (isEnabled) {
                gl.enable(gl.BLEND)
            } else {
                gl.disable(gl.BLEND)
            }
            checkError(gl);
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0007
         * @tc.name webgl_test_isEnabled_2
         * @tc.desc Test isEnabled.
         */
        it('webgl_test_isEnabled_2', 0, async function (done) {
            console.info("webgltest [webgl_test_isEnabled] isEnabled2");
            const isEnabled = gl.isEnabled(gl.CULL_FACE)
            console.log("webgltest gl.isEnabled(gl.CULL_FACE):", isEnabled);
            console.log("webgltest gl.enable(gl.CULL_FACE)");
            gl.enable(gl.CULL_FACE)
            console.log("webgltest gl.isEnabled(gl.CULL_FACE):", gl.isEnabled(gl.CULL_FACE));
            expect(gl.isEnabled(gl.CULL_FACE)).assertEqual(true)
            if (isEnabled) {
                gl.enable(gl.CULL_FACE)
            } else {
                gl.disable(gl.CULL_FACE)
            }
            checkError(gl);
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0008
         * @tc.name webgl_test_isEnabled_3
         * @tc.desc Test isEnabled.
         */
        it('webgl_test_isEnabled_3', 0, async function (done) {
            console.info("webgltest [webgl_test_isEnabled] isEnabled3");
            const isEnabled = gl.isEnabled(gl.DEPTH_TEST)
            console.log("webgltest gl.isEnabled(gl.DEPTH_TEST):", isEnabled);
            console.log("webgltest gl.enable(gl.DEPTH_TEST)");
            gl.enable(gl.DEPTH_TEST)
            console.log("webgltest gl.isEnabled(gl.DEPTH_TEST):", gl.isEnabled(gl.DEPTH_TEST));
            expect(gl.isEnabled(gl.DEPTH_TEST)).assertEqual(true)
            if (isEnabled) {
                gl.enable(gl.DEPTH_TEST)
            } else {
                gl.disable(gl.DEPTH_TEST)
            }
            checkError(gl);
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0009
         * @tc.name webgl_test_isEnabled_4
         * @tc.desc Test isEnabled.
         */
        it('webgl_test_isEnabled_4', 0, async function (done) {
            console.info("webgltest [webgl_test_isEnabled] isEnabled4");
            const isEnabled = gl.isEnabled(gl.DITHER)
            console.log("webgltest gl.isEnabled(gl.DITHER):", isEnabled);
            expect(isEnabled).assertEqual(true)
            console.log("webgltest gl.enable(gl.DITHER)");
            gl.disable(gl.DITHER)
            console.log("webgltest gl.isEnabled(gl.DITHER):", gl.isEnabled(gl.DITHER));
            expect(gl.isEnabled(gl.DITHER)).assertEqual(false)
            if (isEnabled) {
                gl.enable(gl.DITHER)
            } else {
                gl.disable(gl.DITHER)
            }
            checkError(gl);
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0010
         * @tc.name webgl_test_isEnabled_5
         * @tc.desc Test isEnabled.
         */
        it('webgl_test_isEnabled_5', 0, async function (done) {
            console.info("webgltest [webgl_test_isEnabled] isEnabled5");
            const isEnabled = gl.isEnabled(gl.POLYGON_OFFSET_FILL)
            console.log("webgltest gl.isEnabled(gl.POLYGON_OFFSET_FILL):", isEnabled);
            console.log("webgltest gl.enable(gl.POLYGON_OFFSET_FILL)");
            gl.enable(gl.POLYGON_OFFSET_FILL)
            console.log("webgltest gl.isEnabled(gl.POLYGON_OFFSET_FILL):", gl.isEnabled(gl.POLYGON_OFFSET_FILL));
            expect(gl.isEnabled(gl.POLYGON_OFFSET_FILL)).assertEqual(true)
            if (isEnabled) {
                gl.enable(gl.POLYGON_OFFSET_FILL)
            } else {
                gl.disable(gl.POLYGON_OFFSET_FILL)
            }
            checkError(gl);
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0011
         * @tc.name webgl_test_isEnabled_6
         * @tc.desc Test isEnabled.
         */
        it('webgl_test_isEnabled_6', 0, async function (done) {
            console.info("webgltest [webgl_test_isEnabled] isEnabled6");
            const isEnabled = gl.isEnabled(gl.SAMPLE_ALPHA_TO_COVERAGE)
            console.log("webgltest gl.isEnabled(gl.SAMPLE_ALPHA_TO_COVERAGE):", isEnabled);
            console.log("webgltest gl.enable(gl.SAMPLE_ALPHA_TO_COVERAGE)");
            gl.enable(gl.SAMPLE_ALPHA_TO_COVERAGE)
            console.log("webgltest gl.isEnabled(gl.SAMPLE_ALPHA_TO_COVERAGE):", gl.isEnabled(gl.SAMPLE_ALPHA_TO_COVERAGE));
            expect(gl.isEnabled(gl.SAMPLE_ALPHA_TO_COVERAGE)).assertEqual(true)
            if (isEnabled) {
                gl.enable(gl.SAMPLE_ALPHA_TO_COVERAGE)
            } else {
                gl.disable(gl.SAMPLE_ALPHA_TO_COVERAGE)
            }
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0012
         * @tc.name webgl_test_isEnabled_7
         * @tc.desc Test isEnabled.
         */
        it('webgl_test_isEnabled_7', 0, async function (done) {
            console.info("webgltest [webgl_test_isEnabled] isEnabled7");
            const isEnabled = gl.isEnabled(gl.SAMPLE_COVERAGE)
            console.log("webgltest gl.isEnabled(gl.SAMPLE_COVERAGE):", isEnabled);
            console.log("webgltest gl.enable(gl.SAMPLE_COVERAGE)");
            gl.enable(gl.SAMPLE_COVERAGE)
            console.log("webgltest gl.isEnabled(gl.SAMPLE_COVERAGE):", gl.isEnabled(gl.SAMPLE_COVERAGE));
            expect(gl.isEnabled(gl.SAMPLE_COVERAGE)).assertEqual(true)
            if (isEnabled) {
                gl.enable(gl.SAMPLE_COVERAGE)
            } else {
                gl.disable(gl.SAMPLE_COVERAGE)
            }
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0013
         * @tc.name webgl_test_isEnabled_8
         * @tc.desc Test isEnabled.
         */
        it('webgl_test_isEnabled_8', 0, async function (done) {
            console.info("webgltest [webgl_test_isEnabled] isEnabled8");
            const isEnabled = gl.isEnabled(gl.SCISSOR_TEST)
            console.log("webgltest gl.isEnabled(gl.SCISSOR_TEST):", isEnabled);
            console.log("webgltest gl.enable(gl.SCISSOR_TEST)");
            gl.enable(gl.SCISSOR_TEST)
            console.log("webgltest gl.isEnabled(gl.SCISSOR_TEST):", gl.isEnabled(gl.SCISSOR_TEST));
            expect(gl.isEnabled(gl.SCISSOR_TEST)).assertEqual(true)
            if (isEnabled) {
                gl.enable(gl.SCISSOR_TEST)
            } else {
                gl.disable(gl.SCISSOR_TEST)
            }
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0014
         * @tc.name webgl_test_isEnabled_9
         * @tc.desc Test isEnabled.
         */
        it('webgl_test_isEnabled_9', 0, async function (done) {
            console.info("webgltest [webgl_test_isEnabled] isEnabled9");
            const isEnabled = gl.isEnabled(gl.STENCIL_TEST)
            console.log("webgltest gl.isEnabled(gl.STENCIL_TEST):", isEnabled);
            console.log("webgltest gl.enable(gl.STENCIL_TEST)");
            gl.enable(gl.STENCIL_TEST)
            console.log("webgltest gl.isEnabled(gl.STENCIL_TEST):", gl.isEnabled(gl.STENCIL_TEST));
            expect(gl.isEnabled(gl.STENCIL_TEST)).assertEqual(true)
            if (isEnabled) {
                gl.enable(gl.STENCIL_TEST)
            } else {
                gl.disable(gl.STENCIL_TEST)
            }
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0015
         * @tc.name webgl_test_isEnabled_Error
         * @tc.desc Test isEnabled.
         */
        it('webgl_test_isEnabled_Error', 0, async function (done) {
            console.info("webgltest [webgl_test_isEnabled] isEnabled Error");
            expect(gl.isEnabled(undefined)).assertEqual(false);
            expect(checkError(gl)).assertEqual(gl.INVALID_ENUM);
            expect(gl.isEnabled(null)).assertEqual(false);
            expect(checkError(gl)).assertEqual(gl.INVALID_ENUM);
            expect(gl.isEnabled(-1)).assertEqual(false);
            expect(checkError(gl)).assertEqual(gl.INVALID_ENUM);
            expect(gl.isEnabled(200)).assertEqual(false);
            expect(checkError(gl)).assertEqual(gl.INVALID_ENUM);
            done();
        })

        const checkEnable = (cap) => {
            console.info(`webgltest [webgl_test_enable] enable(${cap})`);
            const defaultValue = gl.isEnabled(cap)
            console.log("webgltest DEPTH_TEST defaultValue enable:", defaultValue);
            gl.enable(cap)
            console.log("webgltest DEPTH_TEST currentValue enable:", gl.isEnabled(cap));
            if (!defaultValue) {
                gl.disable(cap)
            }
        }

        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0016
         * @tc.name webgl_test_enable
         * @tc.desc Test enable.
         */
        it('webgl_test_enable', 0, async function (done) {
            console.info("webgltest [webgl_test_enable] enable");
            console.info("webgltest disable DEPTH_TEST");
            gl.disable(gl.DEPTH_TEST);
            console.log("webgltest DEPTH_TEST:", gl.isEnabled(gl.DEPTH_TEST));
            expect(gl.isEnabled(gl.DEPTH_TEST)).assertEqual(false);

            console.info("webgltest enable DEPTH_TEST");
            gl.enable(gl.DEPTH_TEST);
            console.log("webgltest DEPTH_TEST:", gl.isEnabled(gl.DEPTH_TEST));
            expect(gl.isEnabled(gl.DEPTH_TEST)).assertTrue();
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            gl.disable(gl.DEPTH_TEST);
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0017
         * @tc.name webgl_test_enable_1
         * @tc.desc Test enable.
         */
        it('webgl_test_enable_1', 0, async function (done) {
            checkEnable(gl.BLEND)
            done()
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0018
         * @tc.name webgl_test_enable_2
         * @tc.desc Test enable.
         */
        it('webgl_test_enable_2', 0, async function (done) {
            checkEnable(gl.CULL_FACE)
            done()
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0019
         * @tc.name webgl_test_enable_3
         * @tc.desc Test enable.
         */
        it('webgl_test_enable_3', 0, async function (done) {
            checkEnable(gl.DITHER)
            done()
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0020
         * @tc.name webgl_test_enable_4
         * @tc.desc Test enable.
         */
        it('webgl_test_enable_4', 0, async function (done) {
            checkEnable(gl.POLYGON_OFFSET_FILL)
            done()
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0021
         * @tc.name webgl_test_enable_5
         * @tc.desc Test enable.
         */
        it('webgl_test_enable_5', 0, async function (done) {
            checkEnable(gl.SAMPLE_ALPHA_TO_COVERAGE)
            done()
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0022
         * @tc.name webgl_test_enable_6
         * @tc.desc Test enable.
         */
        it('webgl_test_enable_6', 0, async function (done) {
            checkEnable(gl.SAMPLE_COVERAGE)
            done()
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0023
         * @tc.name webgl_test_enable_7
         * @tc.desc Test enable.
         */
        it('webgl_test_enable_7', 0, async function (done) {
            checkEnable(gl.SCISSOR_TEST)
            done()
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0024
         * @tc.name webgl_test_enable_8
         * @tc.desc Test enable.
         */
        it('webgl_test_enable_8', 0, async function (done) {
            checkEnable(gl.STENCIL_TEST)
            done()
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0025
         * @tc.name webgl_test_enable_Error
         * @tc.desc Test enable.
         */
        it('webgl_test_enable_Error', 0, async function (done) {
            console.info("webgltest [webgl_test_enable] enable Error");
            console.info("webgltest enable undefined");
            gl.enable(undefined)
            expect(checkError(gl)).assertEqual(gl.INVALID_ENUM);
            console.info("webgltest enable null");
            gl.enable(null)
            expect(checkError(gl)).assertEqual(gl.INVALID_ENUM);
            console.info("webgltest enable -1");
            gl.enable(-1)
            expect(checkError(gl)).assertEqual(gl.INVALID_ENUM);
            console.info("webgltest enable 200");
            gl.enable(200)
            expect(checkError(gl)).assertEqual(gl.INVALID_ENUM);
            done();
        })

        const checkDisable = (cap) => {
            console.info(`webgltest [webgl_test_disable] disable(${cap})`);
            const defaultValue = gl.isEnabled(cap)
            console.log("webgltest DEPTH_TEST defaultValue disable:", defaultValue);
            gl.disable(cap)
            console.log("webgltest DEPTH_TEST currentValue disable:", gl.isEnabled(cap));
            if (defaultValue) {
                gl.enable(cap)
            }
        }

        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0026
         * @tc.name webgl_test_disable
         * @tc.desc Test disable.
         */
        it('webgl_test_disable', 0, async function (done) {
            console.info("webgltest [webgl_test_disable] disable");
            console.info("webgltest enable DEPTH_TEST");
            gl.enable(gl.DEPTH_TEST);
            console.log("webgltest DEPTH_TEST:", gl.isEnabled(gl.DEPTH_TEST));
            expect(gl.isEnabled(gl.DEPTH_TEST)).assertTrue();

            console.info("webgltest disable DEPTH_TEST");
            gl.disable(gl.DEPTH_TEST);
            console.log("webgltest DEPTH_TEST:", gl.isEnabled(gl.DEPTH_TEST));
            expect(gl.isEnabled(gl.DEPTH_TEST)).assertEqual(false);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0027
         * @tc.name webgl_test_disable_1
         * @tc.desc Test disable.
         */
        it('webgl_test_disable_1', 0, async function (done) {
            checkDisable(gl.BLEND)
            done()
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0028
         * @tc.name webgl_test_disable_2
         * @tc.desc Test disable.
         */
        it('webgl_test_disable_2', 0, async function (done) {
            checkDisable(gl.CULL_FACE)
            done()
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0029
         * @tc.name webgl_test_disable_3
         * @tc.desc Test disable.
         */
        it('webgl_test_disable_3', 0, async function (done) {
            checkDisable(gl.DITHER)
            done()
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0030
         * @tc.name webgl_test_disable_4
         * @tc.desc Test disable.
         */
        it('webgl_test_disable_4', 0, async function (done) {
            checkDisable(gl.POLYGON_OFFSET_FILL)
            done()
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0031
         * @tc.name webgl_test_disable_5
         * @tc.desc Test disable.
         */
        it('webgl_test_disable_5', 0, async function (done) {
            checkDisable(gl.SAMPLE_ALPHA_TO_COVERAGE)
            done()
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0032
         * @tc.name webgl_test_disable_6
         * @tc.desc Test disable.
         */
        it('webgl_test_disable_6', 0, async function (done) {
            checkDisable(gl.SAMPLE_COVERAGE)
            done()
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0033
         * @tc.name webgl_test_disable_7
         * @tc.desc Test disable.
         */
        it('webgl_test_disable_7', 0, async function (done) {
            checkDisable(gl.SCISSOR_TEST)
            done()
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0034
         * @tc.name webgl_test_disable_8
         * @tc.desc Test disable.
         */
        it('webgl_test_disable_8', 0, async function (done) {
            checkDisable(gl.STENCIL_TEST)
            done()
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0035
         * @tc.name webgl_test_disable_Error
         * @tc.desc Test disable.
         */
        it('webgl_test_disable_Error', 0, async function (done) {
            console.info("webgltest [webgl_test_enable] disable Error");
            console.info("webgltest disable undefined");
            gl.disable(undefined)
            expect(checkError(gl)).assertEqual(gl.INVALID_ENUM);
            console.info("webgltest disable null");
            gl.disable(null)
            expect(checkError(gl)).assertEqual(gl.INVALID_ENUM);
            console.info("webgltest disable -1");
            gl.disable(-1)
            expect(checkError(gl)).assertEqual(gl.INVALID_ENUM);
            console.info("webgltest disable 200");
            gl.disable(200)
            expect(checkError(gl)).assertEqual(gl.INVALID_ENUM);
            done();
        })

        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0036
         * @tc.name webgl_test_getContextAttributes
         * @tc.desc Test getContextAttributes.
         */
        it('webgl_test_getContextAttributes', 0, async function (done) {
            console.info("webgltest [webgl_test_getContextAttributes] getContextAttributes");
            const value = gl.getContextAttributes();
            console.info("webgltest getContextAttributes: ", value);
            if (value) {
                expect(typeof (value["alpha"])).assertEqual("boolean");
                expect(typeof (value["depth"])).assertEqual("boolean");
                expect(typeof (value["stencil"])).assertEqual("boolean");
                expect(typeof (value["antialias"])).assertEqual("boolean");
                expect(typeof (value["premultipliedAlpha"])).assertEqual("boolean");
                expect(typeof (value["preserveDrawingBuffer"])).assertEqual("boolean");
                expect(typeof (value["failIfMajorPerformanceCaveat"])).assertEqual("boolean");
                expect(typeof (value["desynchronized"])).assertEqual("boolean");
                expect(typeof (value["powerPreference"])).assertEqual("string");
                expect(value["powerPreference"]).assertEqual("default" || "low-power" || "high-performance");
            } else {
                expect(value).assertEqual(null);
            }
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0037
         * @tc.name webgl_test_getContextAttributes_Error
         * @tc.desc Test getContextAttributes.
         */
        it('webgl_test_getContextAttributes_Error', 0, async function (done) {
            console.info("webgltest [webgl_test_getContextAttributesError] getContextAttributesError");
            console.info("webgltest getContextAttributes(null)", null);
            const value = gl.getContextAttributes(null);
            console.info("webgltest getContextAttributes: ", value);
            expect(typeof value).assertEqual("object");
            done();
        })

        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0038
         * @tc.name webgl_test_isContextLost
         * @tc.desc Test isContextLost.
         */
        it('webgl_test_isContextLost', 0, async function (done) {
            console.info("webgltest [webgl_test_isContextLost] isContextLost");
            const isContextLostValue = gl.isContextLost();
            console.info("webgltest isContextLost: " + isContextLostValue);
            expect(isContextLostValue).assertEqual(false);
            done();
        })

        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0039
         * @tc.name webgl_test_clearColor
         * @tc.desc Test clearColor.
         */
        it('webgl_test_clearColor', 0, async function (done) {
            console.info("webgltest [webgl_test_clearColor] clearColor");
            gl.clearColor(0.5, 0.5, 0.5, 1.0);
            console.info('set clearColor:', 0.5, 0.5, 0.5, 1.0);
            let value = gl.getParameter(gl.COLOR_CLEAR_VALUE);
            console.info('COLOR_CLEAR_VALUE:', value);
            expect(value[0]).assertEqual(0.5);
            expect(value[1]).assertEqual(0.5);
            expect(value[2]).assertEqual(0.5);
            expect(value[3]).assertEqual(1.0);
            gl.clearColor(0, 0, 0, 0);
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0040
         * @tc.name webgl_test_clearColor_Error
         * @tc.desc Test clearColor.
         */
        it('webgl_test_clearColor_Error', 0, async function (done) {
            console.info("webgltest [webgl_test_clearColor] clearColor error");
            console.info("webgltest [webgl_test_clearColor] clearColor string");
            gl.clearColor('1', '1', '1', '1');
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            console.info("webgltest [webgl_test_clearColor] clearColor undefined");
            gl.clearColor(undefined, undefined, undefined, undefined);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            console.info("webgltest [webgl_test_clearColor] clearColor null");
            gl.clearColor(null, null, null, null);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            done();
        })

        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0041
         * @tc.name webgl_test_clearDepth
         * @tc.desc Test clearDepth.
         */
        it('webgl_test_clearDepth', 0, async function (done) {
            console.info("webgltest [webgl_test_clearDepth] clearDepth");
            gl.clearDepth(0.5)
            console.info('set clearDepth:', 0.5);
            let value = gl.getParameter(gl.DEPTH_CLEAR_VALUE);
            console.info('COLOR_CLEAR_VALUE:', value);
            expect(value).assertEqual(0.5);
            gl.clearDepth(1)
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0042
         * @tc.name webgl_test_clearDepth_Error
         * @tc.desc Test clearDepth.
         */
        it('webgl_test_clearDepth_Error', 0, async function (done) {
            console.info("webgltest [webgl_test_clearDepth] clearDepth Error");
            console.info("webgltest [webgl_test_clearDepth] clearDepth big than 1");
            gl.clearDepth(2)
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            console.info("webgltest [webgl_test_clearDepth] clearDepth string");
            gl.clearDepth('')
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            console.info("webgltest [webgl_test_clearDepth] clearDepth small than 0");
            gl.clearDepth(-1)
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            console.info("webgltest [webgl_test_clearDepth] clearDepth undefined");
            gl.clearDepth(undefined)
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            console.info("webgltest [webgl_test_clearDepth] clearDepth null");
            gl.clearDepth(null)
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            done();
        })

        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0043
         * @tc.name webgl_test_clear
         * @tc.desc Test clear.
         */
        it('webgl_test_clear', 0, async function (done) {
            console.info("webgltest [webgl_test_clear] clear");
            gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT | gl.STENCIL_BUFFER_BIT);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            gl.clear(-1);
            expect(checkError(gl)).assertEqual(gl.INVALID_VALUE);
            done();
        })

        /**
         * WebGL API 的方法返回传递的参数名称的值。
         */
        const checkGetParameter = (pname, typeName, length) => {
            console.info("webgltest [webgl_test_getParameter] getParameter");
            console.info(`webgltest [webgl_test_getParameter] getParameter(${pname}) type is ${typeName}`);
            expect(gl.getParameter(pname) !== undefined).assertEqual(true);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR)
            if (length !== undefined) {
                console.info(`webgltest [webgl_test_getParameter] getParameter(${pname}) type is ${typeName} and length is ${length}`);
                expect(gl.getParameter(pname).length).assertEqual(length);
            }
        }


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0044
         * @tc.name webgl_test_getParameter
         * @tc.desc Test getParameter.
         */
        it('webgl_test_getParameter', 0, async function (done) {
            console.info("webgltest [webgl_test_getParameter] getParameter");
            console.info("webgltest ACTIVE_TEXTURE:", gl.getParameter(gl.ACTIVE_TEXTURE));
            gl.activeTexture(gl.TEXTURE0);
            expect(gl.getParameter(gl.ACTIVE_TEXTURE)).assertEqual(gl.TEXTURE0);
            console.info("webgltest  gl.activeTexture(gl.TEXTURE12);");
            gl.activeTexture(gl.TEXTURE12);
            console.info("webgltest ACTIVE_TEXTURE:", gl.getParameter(gl.ACTIVE_TEXTURE));
            expect(gl.getParameter(gl.ACTIVE_TEXTURE)).assertEqual(gl.TEXTURE12);
            gl.activeTexture(gl.TEXTURE0);
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0045
         * @tc.name webgl_test_getParameter_1
         * @tc.desc Test getParameter.
         */
        it('webgl_test_getParameter_1', 0, async function (done) {
            checkGetParameter(gl.ALIASED_LINE_WIDTH_RANGE, 'Float32Array', 2)
            done()
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0046
         * @tc.name webgl_test_getParameter_2
         * @tc.desc Test getParameter.
         */
        it('webgl_test_getParameter_2', 0, async function (done) {
            checkGetParameter(gl.ALIASED_POINT_SIZE_RANGE, 'Float32Array', 2)
            done()
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0047
         * @tc.name webgl_test_getParameter_3
         * @tc.desc Test getParameter.
         */
        it('webgl_test_getParameter_3', 0, async function (done) {
            checkGetParameter(gl.ALPHA_BITS, 'Number')
            done()
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0048
         * @tc.name webgl_test_getParameter_4
         * @tc.desc Test getParameter.
         */
        it('webgl_test_getParameter_4', 0, async function (done) {
            let webGLBuffer = gl.createBuffer();
            gl.bindBuffer(gl.ARRAY_BUFFER, webGLBuffer)
            checkGetParameter(gl.ARRAY_BUFFER_BINDING, 'WebGLBuffer')
            gl.deleteBuffer(webGLBuffer)
            done()
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0049
         * @tc.name webgl_test_getParameter_5
         * @tc.desc Test getParameter.
         */
        it('webgl_test_getParameter_5', 0, async function (done) {
            checkGetParameter(gl.BLEND, 'Boolean')
            done()
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0050
         * @tc.name webgl_test_getParameter_6
         * @tc.desc Test getParameter.
         */
        it('webgl_test_getParameter_6', 0, async function (done) {
            checkGetParameter(gl.BLEND_COLOR, 'Float32Array', 4)
            done()
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0051
         * @tc.name webgl_test_getParameter_7
         * @tc.desc Test getParameter.
         */
        it('webgl_test_getParameter_7', 0, async function (done) {
            checkGetParameter(gl.BLEND_DST_ALPHA, 'Number')
            done()
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0052
         * @tc.name webgl_test_getParameter_8
         * @tc.desc Test getParameter.
         */
        it('webgl_test_getParameter_8', 0, async function (done) {
            checkGetParameter(gl.BLEND_DST_RGB, 'Number')
            done()
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0053
         * @tc.name webgl_test_getParameter_9
         * @tc.desc Test getParameter.
         */
        it('webgl_test_getParameter_9', 0, async function (done) {
            checkGetParameter(gl.BLEND_EQUATION, 'Number')
            done()
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0054
         * @tc.name webgl_test_getParameter_10
         * @tc.desc Test getParameter.
         */
        it('webgl_test_getParameter_10', 0, async function (done) {
            checkGetParameter(gl.BLEND_EQUATION_ALPHA, 'Number')
            done()
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0055
         * @tc.name webgl_test_getParameter_11
         * @tc.desc Test getParameter.
         */
        it('webgl_test_getParameter_11', 0, async function (done) {
            checkGetParameter(gl.BLEND_EQUATION_RGB, 'Number')
            done()
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0056
         * @tc.name webgl_test_getParameter_12
         * @tc.desc Test getParameter.
         */
        it('webgl_test_getParameter_12', 0, async function (done) {
            checkGetParameter(gl.BLEND_SRC_ALPHA, 'Number')
            done()
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0057
         * @tc.name webgl_test_getParameter_13
         * @tc.desc Test getParameter.
         */
        it('webgl_test_getParameter_13', 0, async function (done) {
            checkGetParameter(gl.BLEND_SRC_RGB, 'Number')
            done()
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0058
         * @tc.name webgl_test_getParameter_14
         * @tc.desc Test getParameter.
         */
        it('webgl_test_getParameter_14', 0, async function (done) {
            checkGetParameter(gl.BLUE_BITS, 'Number')
            done()
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0059
         * @tc.name webgl_test_getParameter_15
         * @tc.desc Test getParameter.
         */
        it('webgl_test_getParameter_15', 0, async function (done) {
            checkGetParameter(gl.COLOR_CLEAR_VALUE, 'Float32Array', 4)
            done()
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0060
         * @tc.name webgl_test_getParameter_16
         * @tc.desc Test getParameter.
         */
        it('webgl_test_getParameter_16', 0, async function (done) {
            checkGetParameter(gl.COLOR_WRITEMASK, 'Array', 4)
            done()
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0061
         * @tc.name webgl_test_getParameter_17
         * @tc.desc Test getParameter.
         */
        it('webgl_test_getParameter_17', 0, async function (done) {
            checkGetParameter(gl.COMPRESSED_TEXTURE_FORMATS, 'Uint32Array')
            done()
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0062
         * @tc.name webgl_test_getParameter_18
         * @tc.desc Test getParameter.
         */
        it('webgl_test_getParameter_18', 0, async function (done) {
            checkGetParameter(gl.CULL_FACE, 'Boolean')
            done()
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0063
         * @tc.name webgl_test_getParameter_19
         * @tc.desc Test getParameter.
         */
        it('webgl_test_getParameter_19', 0, async function (done) {
            checkGetParameter(gl.CULL_FACE_MODE, 'Number')
            done()
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0064
         * @tc.name webgl_test_getParameter_20
         * @tc.desc Test getParameter.
         */
        it('webgl_test_getParameter_20', 0, async function (done) {
            let {program} = createProgram(gl, `
                attribute vec4 a_Position;
                attribute vec2 a_TexCoord;
                varying vec2 v_TexCoord;
                void main(){
                    gl_Position = a_Position;
                    v_TexCoord = a_TexCoord;
                }
            `, `
                precision mediump float;
                precision highp sampler2D;
                uniform sampler2D u_Sampler;
                varying vec2 v_TexCoord;
                void main(){
                    gl_FragColor = texture2D(u_Sampler, v_TexCoord);
                }
            `);
            checkGetParameter(gl.CURRENT_PROGRAM, 'WebGLProgram')
            gl.deleteProgram(program)
            done()
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0065
         * @tc.name webgl_test_getParameter_21
         * @tc.desc Test getParameter.
         */
        it('webgl_test_getParameter_21', 0, async function (done) {
            checkGetParameter(gl.DEPTH_BITS, 'Number')
            done()
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0066
         * @tc.name webgl_test_getParameter_22
         * @tc.desc Test getParameter.
         */
        it('webgl_test_getParameter_22', 0, async function (done) {
            checkGetParameter(gl.DEPTH_CLEAR_VALUE, 'Number')
            done()
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0067
         * @tc.name webgl_test_getParameter_23
         * @tc.desc Test getParameter.
         */
        it('webgl_test_getParameter_23', 0, async function (done) {
            checkGetParameter(gl.DEPTH_FUNC, 'Number')
            done()
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0068
         * @tc.name webgl_test_getParameter_24
         * @tc.desc Test getParameter.
         */
        it('webgl_test_getParameter_24', 0, async function (done) {
            checkGetParameter(gl.DEPTH_RANGE, 'Float32Array', 2)
            done()
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0069
         * @tc.name webgl_test_getParameter_25
         * @tc.desc Test getParameter.
         */
        it('webgl_test_getParameter_25', 0, async function (done) {
            checkGetParameter(gl.DEPTH_TEST, 'Boolean')
            done()
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0070
         * @tc.name webgl_test_getParameter_26
         * @tc.desc Test getParameter.
         */
        it('webgl_test_getParameter_26', 0, async function (done) {
            checkGetParameter(gl.DEPTH_WRITEMASK, 'Boolean')
            done()
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0071
         * @tc.name webgl_test_getParameter_27
         * @tc.desc Test getParameter.
         */
        it('webgl_test_getParameter_27', 0, async function (done) {
            checkGetParameter(gl.DITHER, 'Boolean')
            done()
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0072
         * @tc.name webgl_test_getParameter_28
         * @tc.desc Test getParameter.
         */
        it('webgl_test_getParameter_28', 0, async function (done) {
            let webGLBuffer = gl.createBuffer();
            gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, webGLBuffer)
            checkGetParameter(gl.ELEMENT_ARRAY_BUFFER_BINDING, 'WebGLBuffer')
            gl.deleteBuffer(webGLBuffer)
            done()
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0073
         * @tc.name webgl_test_getParameter_30
         * @tc.desc Test getParameter.
         */
        it('webgl_test_getParameter_30', 0, async function (done) {
            checkGetParameter(gl.FRONT_FACE, 'Number')
            done()
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0074
         * @tc.name webgl_test_getParameter_31
         * @tc.desc Test getParameter.
         */
        it('webgl_test_getParameter_31', 0, async function (done) {
            checkGetParameter(gl.GENERATE_MIPMAP_HINT, 'Number')
            done()
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0075
         * @tc.name webgl_test_getParameter_32
         * @tc.desc Test getParameter.
         */
        it('webgl_test_getParameter_32', 0, async function (done) {
            checkGetParameter(gl.GREEN_BITS, 'Number')
            done()
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0076
         * @tc.name webgl_test_getParameter_33
         * @tc.desc Test getParameter.
         */
        it('webgl_test_getParameter_33', 0, async function (done) {
            checkGetParameter(gl.IMPLEMENTATION_COLOR_READ_FORMAT, 'Number')
            done()
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0077
         * @tc.name webgl_test_getParameter_34
         * @tc.desc Test getParameter.
         */
        it('webgl_test_getParameter_34', 0, async function (done) {
            checkGetParameter(gl.IMPLEMENTATION_COLOR_READ_TYPE, 'Number')
            done()
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0078
         * @tc.name webgl_test_getParameter_35
         * @tc.desc Test getParameter.
         */
        it('webgl_test_getParameter_35', 0, async function (done) {
            checkGetParameter(gl.LINE_WIDTH, 'Number')
            done()
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0079
         * @tc.name webgl_test_getParameter_36
         * @tc.desc Test getParameter.
         */
        it('webgl_test_getParameter_36', 0, async function (done) {
            checkGetParameter(gl.MAX_COMBINED_TEXTURE_IMAGE_UNITS, 'Number')
            done()
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0080
         * @tc.name webgl_test_getParameter_37
         * @tc.desc Test getParameter.
         */
        it('webgl_test_getParameter_37', 0, async function (done) {
            checkGetParameter(gl.MAX_TEXTURE_SIZE, 'Number')
            done()
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0081
         * @tc.name webgl_test_getParameter_38
         * @tc.desc Test getParameter.
         */
        it('webgl_test_getParameter_38', 0, async function (done) {
            checkGetParameter(gl.MAX_VARYING_VECTORS, 'Number')
            done()
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0082
         * @tc.name webgl_test_getParameter_39
         * @tc.desc Test getParameter.
         */
        it('webgl_test_getParameter_39', 0, async function (done) {
            checkGetParameter(gl.MAX_VERTEX_ATTRIBS, 'Number')
            done()
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0083
         * @tc.name webgl_test_getParameter_40
         * @tc.desc Test getParameter.
         */
        it('webgl_test_getParameter_40', 0, async function (done) {
            checkGetParameter(gl.MAX_VERTEX_TEXTURE_IMAGE_UNITS, 'Number')
            done()
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0084
         * @tc.name webgl_test_getParameter_41
         * @tc.desc Test getParameter.
         */
        it('webgl_test_getParameter_41', 0, async function (done) {
            checkGetParameter(gl.MAX_VERTEX_UNIFORM_VECTORS, 'Number')
            done()
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0085
         * @tc.name webgl_test_getParameter_42
         * @tc.desc Test getParameter.
         */
        it('webgl_test_getParameter_42', 0, async function (done) {
            checkGetParameter(gl.MAX_VIEWPORT_DIMS, 'Int32Array', 2)
            done()
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0086
         * @tc.name webgl_test_getParameter_43
         * @tc.desc Test getParameter.
         */
        it('webgl_test_getParameter_43', 0, async function (done) {
            checkGetParameter(gl.PACK_ALIGNMENT, 'Number')
            done()
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0087
         * @tc.name webgl_test_getParameter_44
         * @tc.desc Test getParameter.
         */
        it('webgl_test_getParameter_44', 0, async function (done) {
            checkGetParameter(gl.POLYGON_OFFSET_FACTOR, 'Number')
            done()
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0088
         * @tc.name webgl_test_getParameter_45
         * @tc.desc Test getParameter.
         */
        it('webgl_test_getParameter_45', 0, async function (done) {
            checkGetParameter(gl.POLYGON_OFFSET_FILL, 'Boolean')
            done()
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0089
         * @tc.name webgl_test_getParameter_46
         * @tc.desc Test getParameter.
         */
        it('webgl_test_getParameter_46', 0, async function (done) {
            checkGetParameter(gl.POLYGON_OFFSET_UNITS, 'Number')
            done()
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0090
         * @tc.name webgl_test_getParameter_47
         * @tc.desc Test getParameter.
         */
        it('webgl_test_getParameter_47', 0, async function (done) {
            checkGetParameter(gl.RED_BITS, 'Number')
            done()
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0091
         * @tc.name webgl_test_getParameter_49
         * @tc.desc Test getParameter.
         */
        it('webgl_test_getParameter_49', 0, async function (done) {
            checkGetParameter(gl.RENDERER, 'String')
            done()
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0092
         * @tc.name webgl_test_getParameter_50
         * @tc.desc Test getParameter.
         */
        it('webgl_test_getParameter_50', 0, async function (done) {
            checkGetParameter(gl.SAMPLE_BUFFERS, 'Number')
            done()
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0093
         * @tc.name webgl_test_getParameter_51
         * @tc.desc Test getParameter.
         */
        it('webgl_test_getParameter_51', 0, async function (done) {
            checkGetParameter(gl.SAMPLE_COVERAGE_INVERT, 'Boolean')
            done()
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0094
         * @tc.name webgl_test_getParameter_52
         * @tc.desc Test getParameter.
         */
        it('webgl_test_getParameter_52', 0, async function (done) {
            checkGetParameter(gl.SAMPLE_COVERAGE_VALUE, 'Number')
            done()
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0095
         * @tc.name webgl_test_getParameter_53
         * @tc.desc Test getParameter.
         */
        it('webgl_test_getParameter_53', 0, async function (done) {
            checkGetParameter(gl.SAMPLES, 'Number')
            done()
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0096
         * @tc.name webgl_test_getParameter_54
         * @tc.desc Test getParameter.
         */
        it('webgl_test_getParameter_54', 0, async function (done) {
            checkGetParameter(gl.SCISSOR_BOX, 'Int32Array', 4)
            done()
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0097
         * @tc.name webgl_test_getParameter_55
         * @tc.desc Test getParameter.
         */
        it('webgl_test_getParameter_55', 0, async function (done) {
            checkGetParameter(gl.SCISSOR_TEST, 'Boolean')
            done()
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0098
         * @tc.name webgl_test_getParameter_56
         * @tc.desc Test getParameter.
         */
        it('webgl_test_getParameter_56', 0, async function (done) {
            checkGetParameter(gl.SHADING_LANGUAGE_VERSION, 'String')
            done()
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0099
         * @tc.name webgl_test_getParameter_57
         * @tc.desc Test getParameter.
         */
        it('webgl_test_getParameter_57', 0, async function (done) {
            checkGetParameter(gl.STENCIL_BACK_FAIL, 'Number')
            done()
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0100
         * @tc.name webgl_test_getParameter_58
         * @tc.desc Test getParameter.
         */
        it('webgl_test_getParameter_58', 0, async function (done) {
            checkGetParameter(gl.STENCIL_BACK_FUNC, 'Number')
            done()
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0101
         * @tc.name webgl_test_getParameter_59
         * @tc.desc Test getParameter.
         */
        it('webgl_test_getParameter_59', 0, async function (done) {
            checkGetParameter(gl.STENCIL_BACK_PASS_DEPTH_FAIL, 'Number')
            done()
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0102
         * @tc.name webgl_test_getParameter_60
         * @tc.desc Test getParameter.
         */
        it('webgl_test_getParameter_60', 0, async function (done) {
            checkGetParameter(gl.STENCIL_BACK_PASS_DEPTH_PASS, 'Number')
            done()
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0103
         * @tc.name webgl_test_getParameter_61
         * @tc.desc Test getParameter.
         */
        it('webgl_test_getParameter_61', 0, async function (done) {
            checkGetParameter(gl.STENCIL_BACK_REF, 'Number')
            done()
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0104
         * @tc.name webgl_test_getParameter_62
         * @tc.desc Test getParameter.
         */
        it('webgl_test_getParameter_62', 0, async function (done) {
            checkGetParameter(gl.STENCIL_BACK_VALUE_MASK, 'Number')
            done()
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0105
         * @tc.name webgl_test_getParameter_63
         * @tc.desc Test getParameter.
         */
        it('webgl_test_getParameter_63', 0, async function (done) {
            checkGetParameter(gl.STENCIL_BACK_WRITEMASK, 'Number')
            done()
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0106
         * @tc.name webgl_test_getParameter_64
         * @tc.desc Test getParameter.
         */
        it('webgl_test_getParameter_64', 0, async function (done) {
            checkGetParameter(gl.STENCIL_BITS, 'Number')
            done()
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0107
         * @tc.name webgl_test_getParameter_65
         * @tc.desc Test getParameter.
         */
        it('webgl_test_getParameter_65', 0, async function (done) {
            checkGetParameter(gl.STENCIL_CLEAR_VALUE, 'Number')
            done()
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0108
         * @tc.name webgl_test_getParameter_66
         * @tc.desc Test getParameter.
         */
        it('webgl_test_getParameter_66', 0, async function (done) {
            checkGetParameter(gl.STENCIL_FAIL, 'Number')
            done()
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0109
         * @tc.name webgl_test_getParameter_67
         * @tc.desc Test getParameter.
         */
        it('webgl_test_getParameter_67', 0, async function (done) {
            checkGetParameter(gl.STENCIL_FUNC, 'Number')
            done()
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0110
         * @tc.name webgl_test_getParameter_68
         * @tc.desc Test getParameter.
         */
        it('webgl_test_getParameter_68', 0, async function (done) {
            checkGetParameter(gl.STENCIL_PASS_DEPTH_FAIL, 'Number')
            done()
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0111
         * @tc.name webgl_test_getParameter_69
         * @tc.desc Test getParameter.
         */
        it('webgl_test_getParameter_69', 0, async function (done) {
            checkGetParameter(gl.STENCIL_PASS_DEPTH_PASS, 'Number')
            done()
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0112
         * @tc.name webgl_test_getParameter_70
         * @tc.desc Test getParameter.
         */
        it('webgl_test_getParameter_70', 0, async function (done) {
            checkGetParameter(gl.STENCIL_REF, 'Number')
            done()
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0113
         * @tc.name webgl_test_getParameter_71
         * @tc.desc Test getParameter.
         */
        it('webgl_test_getParameter_71', 0, async function (done) {
            checkGetParameter(gl.STENCIL_TEST, 'Boolean')
            done()
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0114
         * @tc.name webgl_test_getParameter_72
         * @tc.desc Test getParameter.
         */
        it('webgl_test_getParameter_72', 0, async function (done) {
            checkGetParameter(gl.STENCIL_VALUE_MASK, 'Number')
            done()
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0115
         * @tc.name webgl_test_getParameter_73
         * @tc.desc Test getParameter.
         */
        it('webgl_test_getParameter_73', 0, async function (done) {
            checkGetParameter(gl.STENCIL_WRITEMASK, 'Number')
            done()
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0116
         * @tc.name webgl_test_getParameter_74
         * @tc.desc Test getParameter.
         */
        it('webgl_test_getParameter_74', 0, async function (done) {
            checkGetParameter(gl.SUBPIXEL_BITS, 'Number')
            done()
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0117
         * @tc.name webgl_test_getParameter_75
         * @tc.desc Test getParameter.
         */
        it('webgl_test_getParameter_75', 0, async function (done) {
            let texture = gl.createTexture();
            gl.bindTexture(gl.TEXTURE_2D, texture);
            checkGetParameter(gl.TEXTURE_BINDING_2D, 'WebGLTexture')
            gl.deleteTexture(texture)
            done()
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0118
         * @tc.name webgl_test_getParameter_76
         * @tc.desc Test getParameter.
         */
        it('webgl_test_getParameter_76', 0, async function (done) {
            let texture = gl.createTexture();
            gl.bindTexture(gl.TEXTURE_CUBE_MAP, texture);
            checkGetParameter(gl.TEXTURE_BINDING_CUBE_MAP, 'WebGLTexture')
            gl.deleteTexture(texture)
            done()
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0119
         * @tc.name webgl_test_getParameter_77
         * @tc.desc Test getParameter.
         */
        it('webgl_test_getParameter_77', 0, async function (done) {
            checkGetParameter(gl.UNPACK_ALIGNMENT, 'Number')
            done()
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0120
         * @tc.name webgl_test_getParameter_78
         * @tc.desc Test getParameter.
         */
        it('webgl_test_getParameter_78', 0, async function (done) {
            checkGetParameter(gl.UNPACK_COLORSPACE_CONVERSION_WEBGL, 'Number')
            done()
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0121
         * @tc.name webgl_test_getParameter_79
         * @tc.desc Test getParameter.
         */
        it('webgl_test_getParameter_79', 0, async function (done) {
            checkGetParameter(gl.UNPACK_FLIP_Y_WEBGL, 'Boolean')
            done()
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0122
         * @tc.name webgl_test_getParameter_80
         * @tc.desc Test getParameter.
         */
        it('webgl_test_getParameter_80', 0, async function (done) {
            checkGetParameter(gl.UNPACK_PREMULTIPLY_ALPHA_WEBGL, 'Boolean')
            done()
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0123
         * @tc.name webgl_test_getParameter_81
         * @tc.desc Test getParameter.
         */
        it('webgl_test_getParameter_81', 0, async function (done) {
            checkGetParameter(gl.VENDOR, 'String')
            done()
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0124
         * @tc.name webgl_test_getParameter_82
         * @tc.desc Test getParameter.
         */
        it('webgl_test_getParameter_82', 0, async function (done) {
            checkGetParameter(gl.VERSION, 'String')
            done()
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0125
         * @tc.name webgl_test_getParameter_83
         * @tc.desc Test getParameter.
         */
        it('webgl_test_getParameter_83', 0, async function (done) {
            checkGetParameter(gl.VIEWPORT, 'Int32Array', 4)
            done()
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0126
         * @tc.name webgl_test_getParameter_Error
         * @tc.desc Test getParameter.
         */
        it('webgl_test_getParameter_Error', 0, async function (done) {
            console.info("webgltest [webgl_test_getParameterError] getParameter");
            console.info("webgltest ACTIVE_TEXTURE:undefined");
            expect(gl.getParameter(undefined)).assertEqual(null);
            console.info("webgltest ACTIVE_TEXTURE:null");
            expect(gl.getParameter(null)).assertEqual(null);
            done();
        })

        /**
         * getExtension(name) 方法启用 WebGL 扩展。
         * @param name 要启用的 WebGL 扩展的名称的字符串。
         */

        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0127
         * @tc.name webgl_test_getExtension
         * @tc.desc Test getExtension.
         */
        it('webgl_test_getExtension', 0, async function (done) {
            console.info("webgltest [webgl_test_getExtension] getExtension");
            console.info("webgltest getExtension('');", gl.getExtension(''));
            expect(gl.getExtension('')).assertEqual(null);
            console.info("webgltest gl.getExtension('WEBGL_lose_context');", gl.getExtension('WEBGL_lose_context'));
            expect(gl.getExtension('WEBGL_lose_context') != null).assertTrue();
            let extension = gl.getExtension("WEBGL_lose_context");
            console.info("webgltest loseContext(): ", extension['loseContext']);
            expect(extension['loseContext'] != null).assertTrue();
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0128
         * @tc.name webgl_test_getExtension_Error
         * @tc.desc Test getExtension.
         */
        it('webgl_test_getExtension_Error', 0, async function (done) {
            console.info("webgltest [webgl_test_getExtensionError] getExtensionError");
            console.info("webgltest getExtension(undefined);", gl.getExtension(undefined));
            expect(gl.getExtension(undefined)).assertEqual(null);
            console.info("webgltest gl.getExtension('null');", gl.getExtension('null'));
            expect(gl.getExtension(null)).assertEqual(null);
            console.info("webgltest gl.getExtension('-1');", gl.getExtension(-1));
            let extension = gl.getExtension(-1);
            expect(extension).assertEqual(null);
            done();
        })

        /**
         *  返回所有受支持的 WebGL 扩展的列表。
         */

        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0129
         * @tc.name webgl_test_getSupportedExtensions
         * @tc.desc Test getSupportedExtensions.
         */
        it('webgl_test_getSupportedExtensions', 0, async function (done) {
            console.info("webgltest [webgl_test_getSupportedExtensions] getSupportedExtensions");
            let supportedExtensions = gl.getSupportedExtensions();
            console.info("webgltest getSupportedExtensions();", supportedExtensions);
            expect(supportedExtensions != null).assertTrue();
            expect(supportedExtensions.length > 0).assertTrue();
            done();
        })

        /**
         *WebGL API的方法设置视口，它指定x和y从标准化设备坐标到窗口坐标的仿射变换。
         */

        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0130
         * @tc.name webgl_test_viewport
         * @tc.desc Test viewport.
         */
        it('webgl_test_viewport', 0, async function (done) {
            console.info("webgltest [webgl_test_viewport] viewport");
            let defaultViewPort = gl.getParameter(gl.VIEWPORT);
            console.info("webgltest viewPort:", defaultViewPort);
            console.info("webgltest gl.viewport(0, 0, 600, 400);");
            gl.viewport(0, 0, 600, 400);
            let viewPort = gl.getParameter(gl.VIEWPORT);
            console.info("webgltest viewPort:", viewPort);
            expect(viewPort[0]).assertEqual(0);
            expect(viewPort[1]).assertEqual(0);
            expect(viewPort[2]).assertEqual(600);
            expect(viewPort[3]).assertEqual(400);
            gl.viewport(defaultViewPort.x, defaultViewPort.y, defaultViewPort, defaultViewPort.height);
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0131
         * @tc.name webgl_test_viewport_Error
         * @tc.desc Test viewport.
         */
        it('webgl_test_viewport_Error', 0, async function (done) {
            console.info("webgltest [webgl_test_viewportError] viewportError");
            console.info("webgltest [webgl_test_viewportError] viewport(x=undefined) ");
            let srcViewport = gl.getParameter(gl.VIEWPORT);
            gl.viewport(undefined, 0, 600, 400);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR)
            console.info("webgltest [webgl_test_viewportError] viewport(y=undefined) ");
            gl.viewport(0, undefined, 600, 400);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR)
            console.info("webgltest [webgl_test_viewportError] viewport(width=undefined) ");
            gl.viewport(0, 0, undefined, 400);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR)
            console.info("webgltest [webgl_test_viewportError] viewport(height=undefined) ");
            gl.viewport(0, 0, 600, undefined);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR)
            console.info("webgltest [webgl_test_viewportError] viewport(x=undefined,y=undefined,width=undefined,height=undefined) ");
            gl.viewport(undefined, undefined, undefined, undefined);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR)
            gl.viewport(srcViewport[0],srcViewport[1],srcViewport[2],srcViewport[3]);
            done();
        })

        /**
         *WebGL API的方法指定了某些行为的提示。这些提示的解释取决于实现。
         */

        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0132
         * @tc.name webgl_test_hint
         * @tc.desc Test hint.
         */
        it('webgl_test_hint', 0, async function (done) {
            console.info("webgltest [webgl_test_hint] hint");
            let check = () => {
                let generateMipMapHint = gl.getParameter(gl.GENERATE_MIPMAP_HINT);
                switch (generateMipMapHint) {
                    case gl.FASTEST:
                        console.info("webgltest GENERATE_MIPMAP_HINT gl.FASTEST");
                        break;
                    case gl.NICEST:
                        console.info("webgltest GENERATE_MIPMAP_HINT gl.NICEST");
                        break;
                    case gl.DONT_CARE:
                        console.info("webgltest GENERATE_MIPMAP_HINT gl.DONT_CARE");
                        break;
                }
                return generateMipMapHint;
            }
            let defaultGenerateMipMapHint = check();
            console.info("webgltest gl.hint(gl.GENERATE_MIPMAP_HINT, gl.FASTEST);");
            gl.hint(gl.GENERATE_MIPMAP_HINT, gl.FASTEST);
            let generateMipMapHint = check();
            expect(generateMipMapHint).assertEqual(gl.FASTEST);
            console.info("webgltest reset config");
            gl.hint(gl.GENERATE_MIPMAP_HINT, defaultGenerateMipMapHint);
            check();
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0133
         * @tc.name webgl_test_hint_Error
         * @tc.desc Test hint.
         */
        it('webgl_test_hint_Error', 0, async function (done) {
            console.info("webgltest [webgl_test_hintError] webgl_test_hint");
            console.info("webgltest [webgl_test_hintError] hint(target=undefined) ");
            gl.hint(undefined, gl.FASTEST);
            expect(checkError(gl)).assertEqual(gl.INVALID_ENUM)
            console.info("webgltest [webgl_test_hintError] hint(mode=undefined) ");
            gl.hint(gl.GENERATE_MIPMAP_HINT, undefined);
            expect(checkError(gl)).assertEqual(gl.INVALID_ENUM)
            console.info("webgltest [webgl_test_hintError] hint(target=undefined,mode=undefined) ");
            gl.hint(undefined, undefined);
            expect(checkError(gl)).assertEqual(gl.INVALID_ENUM)
            console.info("webgltest [webgl_test_hintError] hint(target=-1,mode=undefined) ");
            gl.hint(-1, undefined);
            expect(checkError(gl)).assertEqual(gl.INVALID_ENUM)
            console.info("webgltest [webgl_test_hintError] hint(target=undefined,mode=-1) ");
            gl.hint(undefined, -1);
            expect(checkError(gl)).assertEqual(gl.INVALID_ENUM)
            console.info("webgltest [webgl_test_hintError] hint(target=-1,mode=-1) ");
            gl.hint(-1, -1);
            expect(checkError(gl)).assertEqual(gl.INVALID_ENUM)
            done();
        })

        /**
         * WebGL API 的 WebGLRenderingContext.lineWidth（） 方法设置栅格化线的线宽。
         */

        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0134
         * @tc.name webgl_test_lineWidth
         * @tc.desc Test lineWidth.
         */
        it('webgl_test_lineWidth', 0, async function (done) {
            console.info("webgltest [webgl_test_lineWidth] lineWidth");
            let defaultLineWidth = gl.getParameter(gl.LINE_WIDTH);
            console.info("webgltest LINE_WIDTH:", defaultLineWidth);
            console.info("webgltest gl.lineWidth(10);");
            gl.lineWidth(10);
            let lineWidth = gl.getParameter(gl.LINE_WIDTH);
            console.info("webgltest LINE_WIDTH:", lineWidth);
            expect(lineWidth).assertEqual(10);
            gl.lineWidth(defaultLineWidth);
            console.info("webgltest rest LINE_WIDTH");
            console.info("webgltest LINE_WIDTH:", gl.getParameter(gl.LINE_WIDTH));
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0135
         * @tc.name webgl_test_lineWidth_Error
         * @tc.desc Test lineWidth.
         */
        it('webgl_test_lineWidth_Error', 0, async function (done) {
            let defaultLineWidth = gl.getParameter(gl.LINE_WIDTH);
            console.info("webgltest [webgl_test_lineWidthError] webgl_test_lineWidthError");
            console.info("webgltest [webgl_test_lineWidthError] lineWidth(width=undefined) ");
            gl.lineWidth(undefined);
            expect(checkError(gl)).assertEqual(gl.INVALID_VALUE)
            console.info("webgltest [webgl_test_lineWidthError] lineWidth(width=null) ");
            gl.lineWidth(null);
            expect(checkError(gl)).assertEqual(gl.INVALID_VALUE)
            console.info("webgltest [webgl_test_lineWidthError] lineWidth(width=-1) ");
            gl.lineWidth(-1);
            expect(checkError(gl)).assertEqual(gl.INVALID_VALUE)
            gl.lineWidth(defaultLineWidth);
            done();
        })

        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0136
         * @tc.name webgl_test_readPixels
         * @tc.desc Test readPixels.
         */
        it('webgl_test_readPixels', 0, async function (done) {
            console.info("webgltest [webgl_test_readPixels] readPixels");
            console.info("webgltest gl.clearColor(1.0, 0.0, 0.0, 1);");
            gl.clearColor(1.0, 0.0, 0.0, 1);
            gl.clear(gl.COLOR_BUFFER_BIT);
            console.info("webgltest gl.drawingBufferWidth :", gl.drawingBufferWidth, "gl.drawingBufferHeight", gl.drawingBufferHeight);
            const pixels = new Uint8Array(gl.drawingBufferWidth * gl.drawingBufferHeight * 4);
            console.info("gl.readPixels(0, 0, gl.drawingBufferWidth, gl.drawingBufferHeight, gl.RGBA, gl.UNSIGNED_BYTE, pixels);");
            gl.readPixels(0, 0, gl.drawingBufferWidth, gl.drawingBufferHeight, gl.RGBA, gl.UNSIGNED_BYTE, pixels);
            console.info("webgltest gl.readPixels ", pixels);
            expect(pixels[0]).assertEqual(255);
            expect(pixels[1]).assertEqual(0);
            expect(pixels[2]).assertEqual(0);
            expect(pixels[3]).assertEqual(255);
            gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT | gl.STENCIL_BUFFER_BIT);
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0137
         * @tc.name webgl_test_readPixels_Error
         * @tc.desc Test readPixels.
         */
        it('webgl_test_readPixels_Error', 0, async function (done) {
            const pixels = new Uint8Array(gl.drawingBufferWidth * gl.drawingBufferHeight * 4);
            console.info("webgltest [webgl_test_readPixelsError] webgl_test_readPixelsError");
            console.info("webgltest [webgl_test_lineWidthError] readPixels(x=undefined) ");
            gl.readPixels(undefined, 0, gl.drawingBufferWidth, gl.drawingBufferHeight, gl.RGBA, gl.UNSIGNED_BYTE, pixels);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR)
            console.info("webgltest [webgl_test_lineWidthError] readPixels(y=undefined) ");
            gl.readPixels(0, undefined, gl.drawingBufferWidth, gl.drawingBufferHeight, gl.RGBA, gl.UNSIGNED_BYTE, pixels);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR)
            console.info("webgltest [webgl_test_lineWidthError] readPixels(width=undefined) ");
            gl.readPixels(0, 0, undefined, gl.drawingBufferHeight, gl.RGBA, gl.UNSIGNED_BYTE, pixels);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR)
            console.info("webgltest [webgl_test_lineWidthError] readPixels(height=undefined) ");
            gl.readPixels(0, 0, gl.drawingBufferWidth, undefined, gl.RGBA, gl.UNSIGNED_BYTE, pixels);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR)
            console.info("webgltest [webgl_test_lineWidthError] readPixels(format=undefined) ");
            gl.readPixels(0, 0, gl.drawingBufferWidth, gl.drawingBufferHeight, undefined, gl.UNSIGNED_BYTE, pixels);
            expect(checkError(gl)).assertEqual(gl.INVALID_ENUM)
            console.info("webgltest [webgl_test_lineWidthError] readPixels(type=undefined) ");
            gl.readPixels(0, 0, gl.drawingBufferWidth, gl.drawingBufferHeight, gl.RGBA, undefined, pixels);
            expect(checkError(gl)).assertEqual(gl.INVALID_ENUM)
            console.info("webgltest [webgl_test_lineWidthError] readPixels(type=undefined) ");
            gl.readPixels(0, 0, gl.drawingBufferWidth, gl.drawingBufferHeight, gl.RGBA, gl.UNSIGNED_BYTE, undefined);
            expect(checkError(gl)).assertEqual(gl.INVALID_VALUE)
            gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT | gl.STENCIL_BUFFER_BIT);
            done();
        })

        /**
         * 用于设置源和目标混合因子
         */

        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0138
         * @tc.name webgl_test_blendColor
         * @tc.desc Test blendColor.
         */
        it('webgl_test_blendColor', 0, async function (done) {
            console.info("webgltest [webgl_test_blendColor] blendColor");
            let src = gl.getParameter(gl.BLEND_COLOR);
            console.info("webgltest gl.blendColor(1.0, 0.5, 1, 1);");
            gl.blendColor(1.0, 0.5, 1, 1);
            let blendColor = gl.getParameter(gl.BLEND_COLOR);
            console.info("webgltest blendColor:", blendColor);
            expect(blendColor[0]).assertEqual(1.0);
            expect(blendColor[1]).assertEqual(0.5);
            expect(blendColor[2]).assertEqual(1.0);
            expect(blendColor[3]).assertEqual(1.0);
            gl.blendColor(src[0], src[1], src[2], src[3]);
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0139
         * @tc.name webgl_test_blendColor_Error
         * @tc.desc Test blendColor.
         */
        it('webgl_test_blendColor_Error', 0, async function (done) {
            console.info("webgltest [webgl_test_blendColorError] blendColorError");
            let src = gl.getParameter(gl.BLEND_COLOR);
            console.info("webgltest [webgl_test_lineWidthError] blendColor(red=undefined) ");
            gl.blendColor(undefined, 0.5, 1, 1);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR)
            console.info("webgltest [webgl_test_lineWidthError] blendColor(green=undefined) ");
            gl.blendColor(0.5, undefined, 1, 1);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR)
            console.info("webgltest [webgl_test_lineWidthError] blendColor(blue=undefined) ");
            gl.blendColor(0.5, 0.5, undefined, 1);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR)
            console.info("webgltest [webgl_test_lineWidthError] blendColor(alpha=undefined) ");
            gl.blendColor(0.5, 0.5, 1, undefined);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR)
            console.info("webgltest [webgl_test_lineWidthError] blendColor(alpha=undefined) ");
            gl.blendColor(-1, -1, -1, -1);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR)
            gl.blendColor(src[0], src[1], src[2], src[3]);
            done();
        })

        /**
         * WebGL API 的 WebGLRenderingContext.blendEquation（） 方法用于将 RGB 混合方程和 alpha 混合方程设置为单个方程。
         * gl.FUNC_ADD: source + destination (default value)
         * gl.FUNC_SUBTRACT: source - destination
         * gl.FUNC_REVERSE_SUBTRACT: destination - source
         */

        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0140
         * @tc.name webgl_test_blendEquation
         * @tc.desc Test blendEquation.
         */
        it('webgl_test_blendEquation', 0, async function (done) {
            console.info("webgltest [webgl_test_blendEquation] blendEquation");
            console.info("webgltest default value");
            let srcRgb = gl.getParameter(gl.BLEND_EQUATION_RGB);
            let srcAlpha = gl.getParameter(gl.BLEND_EQUATION_ALPHA);
            console.info("webgltest BLEND_EQUATION_RGB ", gl.getParameter(gl.BLEND_EQUATION_RGB));
            console.info("webgltest BLEND_EQUATION_ALPHA ", gl.getParameter(gl.BLEND_EQUATION_ALPHA));
            console.info("webgltest gl.blendEquation(gl.FUNC_SUBTRACT);", gl.FUNC_SUBTRACT);
            gl.blendEquation(gl.FUNC_SUBTRACT);
            console.info("webgltest BLEND_EQUATION_RGB ", gl.getParameter(gl.BLEND_EQUATION_RGB));
            console.info("webgltest BLEND_EQUATION_ALPHA ", gl.getParameter(gl.BLEND_EQUATION_ALPHA));
            expect(gl.getParameter(gl.BLEND_EQUATION_RGB)).assertEqual(gl.FUNC_SUBTRACT);
            expect(gl.getParameter(gl.BLEND_EQUATION_ALPHA)).assertEqual(gl.FUNC_SUBTRACT);
            console.info("webgltest gl.blendEquation(gl.FUNC_ADD);", gl.FUNC_ADD);
            gl.blendEquation(gl.FUNC_ADD);
            console.info("webgltest BLEND_EQUATION_RGB ", gl.getParameter(gl.BLEND_EQUATION_RGB));
            console.info("webgltest BLEND_EQUATION_ALPHA ", gl.getParameter(gl.BLEND_EQUATION_ALPHA));
            expect(gl.getParameter(gl.BLEND_EQUATION_RGB)).assertEqual(gl.FUNC_ADD);
            expect(gl.getParameter(gl.BLEND_EQUATION_ALPHA)).assertEqual(gl.FUNC_ADD);
            console.info("webgltest gl.blendEquation(gl.FUNC_REVERSE_SUBTRACT);", gl.FUNC_REVERSE_SUBTRACT);
            gl.blendEquation(gl.FUNC_REVERSE_SUBTRACT);
            console.info("webgltest BLEND_EQUATION_RGB ", gl.getParameter(gl.BLEND_EQUATION_RGB));
            console.info("webgltest BLEND_EQUATION_ALPHA ", gl.getParameter(gl.BLEND_EQUATION_ALPHA));
            expect(gl.getParameter(gl.BLEND_EQUATION_RGB)).assertEqual(gl.FUNC_REVERSE_SUBTRACT);
            expect(gl.getParameter(gl.BLEND_EQUATION_ALPHA)).assertEqual(gl.FUNC_REVERSE_SUBTRACT);
            gl.blendEquation(srcRgb);
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0141
         * @tc.name webgl_test_blendEquation_Error
         * @tc.desc Test blendEquation.
         */
        it('webgl_test_blendEquation_Error', 0, async function (done) {
            console.info("webgltest [webgl_test_blendEquationError] blendEquationError");
            let srcRgb = gl.getParameter(gl.BLEND_EQUATION_RGB);
            console.info("webgltest [webgl_test_lineWidthError] blendEquation(undefined) ");
            gl.blendEquation(undefined);
            expect(checkError(gl)).assertEqual(gl.INVALID_ENUM)
            console.info("webgltest [webgl_test_lineWidthError] blendEquation(null) ");
            gl.blendEquation(null);
            expect(checkError(gl)).assertEqual(gl.INVALID_ENUM)
            console.info("webgltest [webgl_test_lineWidthError] blendEquation(-1) ");
            gl.blendEquation(-1);
            expect(checkError(gl)).assertEqual(gl.INVALID_ENUM)
            gl.blendEquation(srcRgb);
            done();
        })

        /**
         * WebGL API 的 WebGLRenderingContext.blendEquationSeparate（） 方法用于分别设置 RGB 混合方程和 alpha 混合方程。
         *
         */

        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0142
         * @tc.name webgl_test_blendEquationSeparate
         * @tc.desc Test blendEquationSeparate.
         */
        it('webgl_test_blendEquationSeparate', 0, async function (done) {
            console.info("webgltest [webgl_test_blendEquationSeparate] blendEquationSeparate");
            console.info("webgltest default value");
            let srcRgb = gl.getParameter(gl.BLEND_EQUATION_RGB);
            let srcAlpha = gl.getParameter(gl.BLEND_EQUATION_ALPHA);
            console.info("webgltest BLEND_EQUATION_RGB ", gl.getParameter(gl.BLEND_EQUATION_RGB));
            console.info("webgltest BLEND_EQUATION_ALPHA ", gl.getParameter(gl.BLEND_EQUATION_ALPHA));
            console.info("webgltest gl.blendEquationSeparate(gl.FUNC_ADD, gl.FUNC_SUBTRACT);", gl.FUNC_ADD, gl.FUNC_SUBTRACT);
            gl.blendEquationSeparate(gl.FUNC_ADD, gl.FUNC_SUBTRACT);
            console.info("webgltest BLEND_EQUATION_RGB ", gl.getParameter(gl.BLEND_EQUATION_RGB));
            console.info("webgltest BLEND_EQUATION_ALPHA ", gl.getParameter(gl.BLEND_EQUATION_ALPHA));
            expect(gl.getParameter(gl.BLEND_EQUATION_RGB)).assertEqual(gl.FUNC_ADD);
            expect(gl.getParameter(gl.BLEND_EQUATION_ALPHA)).assertEqual(gl.FUNC_SUBTRACT);
            console.info("webgltest gl.blendEquationSeparate(gl.FUNC_SUBTRACT, gl.FUNC_REVERSE_SUBTRACT);", gl.FUNC_SUBTRACT, gl.FUNC_REVERSE_SUBTRACT);
            gl.blendEquationSeparate(gl.FUNC_SUBTRACT, gl.FUNC_REVERSE_SUBTRACT);
            console.info("webgltest BLEND_EQUATION_RGB ", gl.getParameter(gl.BLEND_EQUATION_RGB));
            console.info("webgltest BLEND_EQUATION_ALPHA ", gl.getParameter(gl.BLEND_EQUATION_ALPHA));
            expect(gl.getParameter(gl.BLEND_EQUATION_RGB)).assertEqual(gl.FUNC_SUBTRACT);
            expect(gl.getParameter(gl.BLEND_EQUATION_ALPHA)).assertEqual(gl.FUNC_REVERSE_SUBTRACT);
            gl.blendEquationSeparate(srcRgb, srcAlpha);
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0143
         * @tc.name webgl_test_blendEquationSeparate_Error
         * @tc.desc Test blendEquationSeparate.
         */
        it('webgl_test_blendEquationSeparate_Error', 0, async function (done) {
            console.info("webgltest [webgl_test_blendEquationSeparateError] blendEquationSeparateError");
            console.info("webgltest default value");
            let srcRgb = gl.getParameter(gl.BLEND_EQUATION_RGB);
            let srcAlpha = gl.getParameter(gl.BLEND_EQUATION_ALPHA);
            console.info("webgltest [webgl_test_blendEquationSeparateError] blendEquationSeparate(modeRgb = undefined) ");
            gl.blendEquationSeparate(undefined, gl.FUNC_SUBTRACT);
            expect(checkError(gl)).assertEqual(gl.INVALID_ENUM)
            console.info("webgltest [webgl_test_blendEquationSeparateError] blendEquationSeparate(modeAlpha = undefined) ");
            gl.blendEquationSeparate(gl.FUNC_SUBTRACT, undefined);
            expect(checkError(gl)).assertEqual(gl.INVALID_ENUM)
            gl.blendEquationSeparate(srcRgb, srcAlpha);
            done();
        })

        /**
         * WebGL API 的 WebGLRenderingContext.blendFunc（） 方法定义了用于混合像素计算的函数。
         */

        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0144
         * @tc.name webgl_test_blendFunc
         * @tc.desc Test blendFunc.
         */
        it('webgl_test_blendFunc', 0, async function (done) {
            console.info("webgltest [webgl_test_blendFunc] blendFunc");
            console.info("webgltest default value");
            let isEnable = gl.isEnabled(gl.BLEND);
            let src = gl.getParameter(gl.BLEND_SRC_RGB);
            let dst = gl.getParameter(gl.BLEND_DST_RGB);
            gl.enable(gl.BLEND);
            console.info("webgltest gl.getParameter(gl.BLEND_SRC_RGB) ", gl.getParameter(gl.BLEND_SRC_RGB));
            console.info("webgltest gl.getParameter(gl.BLEND_DST_RGB) ", gl.getParameter(gl.BLEND_DST_RGB));
            console.info("webgltest gl.blendFunc(gl.SRC_COLOR, gl.DST_COLOR);", gl.SRC_COLOR, gl.DST_COLOR);
            gl.blendFunc(gl.SRC_COLOR, gl.DST_COLOR);
            console.info("webgltest gl.getParameter(gl.BLEND_SRC_RGB) ", gl.getParameter(gl.BLEND_SRC_RGB));
            console.info("webgltest gl.getParameter(gl.BLEND_DST_RGB) ", gl.getParameter(gl.BLEND_DST_RGB));
            expect(gl.getParameter(gl.BLEND_SRC_RGB)).assertEqual(gl.SRC_COLOR);
            expect(gl.getParameter(gl.BLEND_DST_RGB)).assertEqual(gl.DST_COLOR);
            console.info("webgltest reset");
            gl.blendFunc(src, dst);
            console.info("webgltest gl.getParameter(gl.BLEND_SRC_RGB) ", gl.getParameter(gl.BLEND_SRC_RGB));
            console.info("webgltest gl.getParameter(gl.BLEND_DST_RGB) ", gl.getParameter(gl.BLEND_DST_RGB));
            if (isEnable) {
                gl.enable(gl.BLEND);
            } else {
                gl.disable(gl.BLEND);
            }
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0145
         * @tc.name webgl_test_blendFunc_Error
         * @tc.desc Test blendFunc.
         */
        it('webgl_test_blendFunc_Error', 0, async function (done) {
            console.info("webgltest [webgl_test_blendFuncError] blendFunc");
            console.info("webgltest default value");
            let isEnable = gl.isEnabled(gl.BLEND);
            let src = gl.getParameter(gl.BLEND_SRC_RGB);
            let dst = gl.getParameter(gl.BLEND_DST_RGB);
            gl.enable(gl.BLEND);
            console.info("webgltest [webgl_test_blendFuncError] blendFunc(sfactor = undefined) ");
            gl.blendFunc(undefined, gl.DST_COLOR);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR)
            console.info("webgltest [webgl_test_blendFuncError] blendFunc(dfactor = undefined) ");
            gl.blendFunc(gl.SRC_COLOR, undefined);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR)
            console.info("webgltest [webgl_test_blendFuncError] blendFunc(sfactor = undefined,dfactor = undefined) ");
            gl.blendFunc(undefined, undefined);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR)
            gl.blendFunc(src, dst);
            if (isEnable) {
                gl.enable(gl.BLEND);
            } else {
                gl.disable(gl.BLEND);
            }
            done();
        })

        /**
         * blendFuncSeparate(srcRGB, dstRGB, srcAlpha, dstAlpha)
         * 方法定义了哪个函数用于分别混合 RGB 和 alpha 组件的像素计算。
         */

        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0146
         * @tc.name webgl_test_blendFuncSeparate
         * @tc.desc Test blendFuncSeparate.
         */
        it('webgl_test_blendFuncSeparate', 0, async function (done) {
            console.info("webgltest [webgl_test_blendFuncSeparate] blendFuncSeparate");
            let isEnable = gl.isEnabled(gl.BLEND);
            let src = gl.getParameter(gl.BLEND_SRC_RGB);
            let srcAlpha = gl.getParameter(gl.BLEND_SRC_ALPHA);
            let dst = gl.getParameter(gl.BLEND_DST_RGB);
            let dstAlpha = gl.getParameter(gl.BLEND_DST_ALPHA);
            gl.enable(gl.BLEND);
            console.info("webgltest gl.blendFuncSeparate(gl.SRC_COLOR, gl.DST_COLOR, gl.ONE, gl.ZERO);", gl.SRC_COLOR, gl.DST_COLOR, gl.ONE, gl.ZERO);
            gl.blendFuncSeparate(gl.SRC_COLOR, gl.DST_COLOR, gl.ONE, gl.ZERO);
            console.info("webgltest gl.getParameter(gl.BLEND_SRC_RGB) ", gl.getParameter(gl.BLEND_SRC_RGB));
            console.info("webgltest gl.getParameter(gl.BLEND_DST_RGB) ", gl.getParameter(gl.BLEND_DST_RGB));
            console.info("webgltest gl.getParameter(gl.BLEND_SRC_ALPHA) ", gl.getParameter(gl.BLEND_SRC_ALPHA));
            console.info("webgltest gl.getParameter(gl.BLEND_DST_ALPHA) ", gl.getParameter(gl.BLEND_DST_ALPHA));
            expect(gl.getParameter(gl.BLEND_SRC_RGB)).assertEqual(gl.SRC_COLOR);
            expect(gl.getParameter(gl.BLEND_DST_RGB)).assertEqual(gl.DST_COLOR);
            expect(gl.getParameter(gl.BLEND_SRC_ALPHA)).assertEqual(gl.ONE);
            expect(gl.getParameter(gl.BLEND_DST_ALPHA)).assertEqual(gl.ZERO);
            gl.blendFuncSeparate(src, dst, srcAlpha, dstAlpha);
            console.info("webgltest reset");
            console.info("webgltest gl.getParameter(gl.BLEND_SRC_RGB) ", gl.getParameter(gl.BLEND_SRC_RGB));
            console.info("webgltest gl.getParameter(gl.BLEND_DST_RGB) ", gl.getParameter(gl.BLEND_DST_RGB));
            console.info("webgltest gl.getParameter(gl.BLEND_SRC_ALPHA) ", gl.getParameter(gl.BLEND_SRC_ALPHA));
            console.info("webgltest gl.getParameter(gl.BLEND_DST_ALPHA) ", gl.getParameter(gl.BLEND_DST_ALPHA));
            if (isEnable) {
                gl.enable(gl.BLEND);
            } else {
                gl.disable(gl.BLEND);
            }
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0147
         * @tc.name webgl_test_blendFuncSeparate_Error
         * @tc.desc Test blendFuncSeparate.
         */
        it('webgl_test_blendFuncSeparate_Error', 0, async function (done) {
            console.info("webgltest [webgl_test_blendFuncSeparateError] blendFuncSeparate");
            let isEnable = gl.isEnabled(gl.BLEND);
            let src = gl.getParameter(gl.BLEND_SRC_RGB);
            let srcAlpha = gl.getParameter(gl.BLEND_SRC_ALPHA);
            let dst = gl.getParameter(gl.BLEND_DST_RGB);
            let dstAlpha = gl.getParameter(gl.BLEND_DST_ALPHA);
            gl.enable(gl.BLEND);
            console.info("webgltest [webgl_test_blendFuncSeparateError] blendFuncSeparate(srcRGB = undefined) ");
            gl.blendFuncSeparate(undefined, gl.DST_COLOR, gl.ONE, gl.ZERO);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR)
            console.info("webgltest [webgl_test_blendFuncSeparateError] blendFuncSeparate(dstRGB = undefined) ");
            gl.blendFuncSeparate(gl.SRC_COLOR, undefined, gl.ONE, gl.ZERO);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR)
            console.info("webgltest [webgl_test_blendFuncSeparateError] blendFuncSeparate(srcAlpha = undefined) ");
            gl.blendFuncSeparate(gl.SRC_COLOR, gl.DST_COLOR, undefined, gl.ZERO);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR)
            console.info("webgltest [webgl_test_blendFuncSeparateError] blendFuncSeparate(dstAlpha = undefined) ");
            gl.blendFuncSeparate(gl.SRC_COLOR, gl.DST_COLOR, gl.ONE, undefined);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR)
            gl.blendFuncSeparate(src, dst, srcAlpha, dstAlpha);
            if (isEnable) {
                gl.enable(gl.BLEND);
            } else {
                gl.disable(gl.BLEND);
            }
            done();
        })

        /**
         * 指定了模板缓冲区的清除值
         */

        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0148
         * @tc.name webgl_test_clearStencil
         * @tc.desc Test clearStencil.
         */
        it('webgl_test_clearStencil', 0, async function (done) {
            console.info("webgltest [webgl_test_clearStencil] clearStencil");
            let src = gl.getParameter(gl.STENCIL_CLEAR_VALUE);
            console.info("webgltest default clearStencil", src);
            console.info("webgltest gl.clearStencil(1);");
            gl.clearStencil(1);
            console.info("webgltest gl.getParameter(gl.STENCIL_CLEAR_VALUE)", gl.getParameter(gl.STENCIL_CLEAR_VALUE));
            expect(gl.getParameter(gl.STENCIL_CLEAR_VALUE)).assertEqual(1);
            console.info("webgltest gl.clearStencil(2);");
            gl.clearStencil(2);
            console.info("webgltest gl.getParameter(gl.STENCIL_CLEAR_VALUE)", gl.getParameter(gl.STENCIL_CLEAR_VALUE));
            expect(gl.getParameter(gl.STENCIL_CLEAR_VALUE)).assertEqual(2);
            gl.clearStencil(src);
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0149
         * @tc.name webgl_test_clearStencil_Error
         * @tc.desc Test clearStencil.
         */
        it('webgl_test_clearStencil_Error', 0, async function (done) {
            console.info("webgltest [webgl_test_clearStencilError] clearStencil");
            let src = gl.getParameter(gl.STENCIL_CLEAR_VALUE);
            console.info("webgltest [webgl_test_clearStencilError] clearStencil(undefined) ");
            gl.clearStencil(undefined);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR)
            console.info("webgltest [webgl_test_clearStencilError] clearStencil(null) ");
            gl.clearStencil(null);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR)
            console.info("webgltest [webgl_test_clearStencilError] clearStencil(-1) ");
            gl.clearStencil(-1);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR)
            gl.clearStencil(src);
            done();
        })

        /**
         * 设置在绘制或渲染到 WebGLFramebuffer 时要启用或禁用的颜色组件。
         */

        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0150
         * @tc.name webgl_test_colorMask
         * @tc.desc Test colorMask.
         */
        it('webgl_test_colorMask', 0, async function (done) {
            console.info("webgltest [webgl_test_colorMask] colorMask");
            let src = gl.getParameter(gl.COLOR_WRITEMASK);
            console.info("webgltest gl.colorMask(false, false, false, false);");
            gl.colorMask(false, false, false, false);
            let colorWriteMask = gl.getParameter(gl.COLOR_WRITEMASK);
            console.info("webgltest colorMask", colorWriteMask);
            expect(colorWriteMask[0]).assertEqual(false);
            expect(colorWriteMask[1]).assertEqual(false);
            expect(colorWriteMask[2]).assertEqual(false);
            expect(colorWriteMask[3]).assertEqual(false);
            console.info("webgltest gl.colorMask(true, true, true, true);");
            gl.colorMask(true, true, true, true);
            colorWriteMask = gl.getParameter(gl.COLOR_WRITEMASK);
            console.info("webgltest colorMask", colorWriteMask);
            expect(colorWriteMask[0]).assertEqual(true);
            expect(colorWriteMask[1]).assertEqual(true);
            expect(colorWriteMask[2]).assertEqual(true);
            expect(colorWriteMask[3]).assertEqual(true);
            gl.colorMask(src[0], src[1], src[2], src[3]);
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0151
         * @tc.name webgl_test_colorMask_Error
         * @tc.desc Test colorMask.
         */
        it('webgl_test_colorMask_Error', 0, async function (done) {
            console.info("webgltest [webgl_test_colorMaskError] colorMask");
            let src = gl.getParameter(gl.COLOR_WRITEMASK);
            console.info("webgltest [webgl_test_colorMaskError] colorMask(red = undefined) ");
            gl.colorMask(undefined, false, false, false);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR)
            console.info("webgltest [webgl_test_colorMaskError] colorMask(green = undefined) ");
            gl.colorMask(false, undefined, false, false);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR)
            console.info("webgltest [webgl_test_colorMaskError] colorMask(blue = undefined) ");
            gl.colorMask(false, false, undefined, false);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR)
            console.info("webgltest [webgl_test_colorMaskError] colorMask(alpha = undefined) ");
            gl.colorMask(false, false, false, undefined);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR)
            gl.colorMask(src[0], src[1], src[2], src[3]);
            done();
        })

        /**
         * 指定是否可以剔除正面和/或背面多边形。
         */

        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0152
         * @tc.name webgl_test_cullFace
         * @tc.desc Test cullFace.
         */
        it('webgl_test_cullFace', 0, async function (done) {
            console.info("webgltest [webgl_test_cullFace] cullFace");
            console.info("webgltest CULL_FACE_MODE default gl.BACK ", gl.BACK);
            let src = gl.getParameter(gl.CULL_FACE_MODE);
            expect(gl.getParameter(gl.CULL_FACE_MODE)).assertEqual(gl.BACK);
            gl.enable(gl.CULL_FACE);
            console.info("webgltest gl.cullFace(gl.FRONT_AND_BACK);");
            gl.cullFace(gl.FRONT_AND_BACK);
            console.info("webgltest CULL_FACE_MODE", gl.getParameter(gl.CULL_FACE_MODE));
            expect(gl.getParameter(gl.CULL_FACE_MODE)).assertEqual(gl.FRONT_AND_BACK);
            gl.cullFace(src);
            gl.disable(gl.CULL_FACE);
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0153
         * @tc.name webgl_test_cullFace_Error
         * @tc.desc Test cullFace.
         */
        it('webgl_test_cullFace_Error', 0, async function (done) {
            console.info("webgltest [webgl_test_cullFaceError] cullFace");
            console.info("webgltest CULL_FACE_MODE default gl.BACK ", gl.BACK);
            let src = gl.getParameter(gl.CULL_FACE_MODE);
            console.info("webgltest [webgl_test_cullFaceError] cullFace(undefined) ");
            gl.cullFace(undefined);
            expect(checkError(gl)).assertEqual(gl.INVALID_ENUM)
            console.info("webgltest [webgl_test_cullFaceError] cullFace(null) ");
            gl.cullFace(undefined);
            expect(checkError(gl)).assertEqual(gl.INVALID_ENUM)
            console.info("webgltest [webgl_test_cullFaceError] cullFace(-1) ");
            gl.cullFace(-1);
            expect(checkError(gl)).assertEqual(gl.INVALID_ENUM)
            gl.cullFace(src);
            gl.disable(gl.CULL_FACE);
            done();
        })

        /**
         * WebGL API 的 WebGLRenderingContext.depthFunc（） 方法指定了一个函数，用于将传入的像素深度与当前深度缓冲区值进行比较。
         */

        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0154
         * @tc.name webgl_test_depthFunc
         * @tc.desc Test depthFunc.
         */
        it('webgl_test_depthFunc', 0, async function (done) {
            console.info("webgltest [webgl_test_depthFunc] depthFunc");
            let isEnable = gl.isEnabled(gl.DEPTH_TEST);
            gl.enable(gl.DEPTH_TEST);
            let src = gl.getParameter(gl.DEPTH_FUNC);
            console.info("webgltest gl.depthFunc(gl.NEVER);");
            gl.depthFunc(gl.NEVER);
            console.info("webgltest gl.getParameter(gl.DEPTH_FUNC);", gl.getParameter(gl.DEPTH_FUNC));
            expect(gl.getParameter(gl.DEPTH_FUNC)).assertEqual(gl.NEVER);
            console.info("webgltest gl.depthFunc(gl.LESS);");
            gl.depthFunc(gl.LESS);
            console.info("webgltest gl.getParameter(gl.DEPTH_FUNC);", gl.getParameter(gl.DEPTH_FUNC));
            expect(gl.getParameter(gl.DEPTH_FUNC)).assertEqual(gl.LESS);
            gl.depthFunc(src);
            if (!isEnable) {
                gl.disable(gl.DEPTH_TEST);
            }
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0155
         * @tc.name webgl_test_depthFunc_Error
         * @tc.desc Test depthFunc.
         */
        it('webgl_test_depthFunc_Error', 0, async function (done) {
            console.info("webgltest [webgl_test_depthFuncError] depthFunc");
            let isEnable = gl.isEnabled(gl.DEPTH_TEST);
            gl.enable(gl.DEPTH_TEST);
            let src = gl.getParameter(gl.DEPTH_FUNC);
            console.info("webgltest [webgl_test_depthFuncError] depthFunc(undefined)");
            gl.depthFunc(-1);
            expect(checkError(gl)).assertEqual(gl.INVALID_ENUM)
            console.info("webgltest [webgl_test_depthFuncError] depthFunc(null) ");
            gl.depthFunc(null);
            expect(checkError(gl)).assertEqual(gl.INVALID_ENUM)
            console.info("webgltest [webgl_test_depthFuncError] depthFunc(-1) ");
            gl.depthFunc(-1);
            expect(checkError(gl)).assertEqual(gl.INVALID_ENUM)
            gl.depthFunc(src);
            if (!isEnable) {
                gl.disable(gl.DEPTH_TEST);
            }
            done();
        })

        /**
         * WebGL API 的 WebGLRenderingContext.depthMask（） 方法设置写入深度缓冲区是启用还是禁用。
         */

        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0156
         * @tc.name webgl_test_depthMask
         * @tc.desc Test depthMask.
         */
        it('webgl_test_depthMask', 0, async function (done) {
            console.info("webgltest [webgl_test_depthMask] depthMask");
            let src = gl.getParameter(gl.DEPTH_WRITEMASK);
            gl.depthMask(false);
            console.info("webgltest gl.depthMask(false);");
            console.info("webgltest gl.getParameter(gl.DEPTH_WRITEMASK)", gl.getParameter(gl.DEPTH_WRITEMASK));
            expect(gl.getParameter(gl.DEPTH_WRITEMASK)).assertEqual(false);
            gl.depthMask(true);
            console.info("webgltest gl.depthMask(true);");
            console.info("webgltest gl.getParameter(gl.DEPTH_WRITEMASK)", gl.getParameter(gl.DEPTH_WRITEMASK));
            expect(gl.getParameter(gl.DEPTH_WRITEMASK)).assertEqual(true);
            gl.depthMask(src);
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0157
         * @tc.name webgl_test_depthMask_Error
         * @tc.desc Test depthMask.
         */
        it('webgl_test_depthMask_Error', 0, async function (done) {
            console.info("webgltest [webgl_test_depthMaskError] depthMask");
            let src = gl.getParameter(gl.DEPTH_WRITEMASK);
            console.info("webgltest [webgl_test_depthFuncError] depthMask(undefined) ");
            gl.depthMask(undefined);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR)
            console.info("webgltest [webgl_test_depthFuncError] depthMask(null) ");
            gl.depthMask(null);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR)
            console.info("webgltest [webgl_test_depthFuncError] depthMask(-1) ");
            gl.depthMask(-1);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR)
            console.info("webgltest [webgl_test_depthFuncError] depthMask(0) ");
            gl.depthMask(0);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR)
            console.info("webgltest [webgl_test_depthFuncError] depthMask(1) ");
            gl.depthMask(1);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR)
            gl.depthMask(src);
            done();
        })

        /**
         * WebGL API 的 WebGLRenderingContext.depthRange（） 方法指定从规范化设备坐标到窗口或视口坐标的深度范围映射。
         */

        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0158
         * @tc.name webgl_test_depthRange
         * @tc.desc Test depthRange.
         */
        it('webgl_test_depthRange', 0, async function (done) {
            console.info("webgltest [webgl_test_depthRange] depthRange");
            let src = gl.getParameter(gl.DEPTH_RANGE);
            console.info("webgltest default depthRange", src);
            console.info("webgltest gl.depthRange(0.0, 1.0);");
            gl.depthRange(0.0, 1.0);
            let arr = gl.getParameter(gl.DEPTH_RANGE);
            console.info("webgltest gl.getParameter(gl.DEPTH_RANGE);", arr);
            expect(arr[0]).assertEqual(0.0);
            expect(arr[1]).assertEqual(1.0);
            gl.depthRange(src[0], src[1]);
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0159
         * @tc.name webgl_test_depthRange_Error
         * @tc.desc Test depthRange.
         */
        it('webgl_test_depthRange_Error', 0, async function (done) {
            console.info("webgltest [webgl_test_depthRangeError] depthRange");
            let src = gl.getParameter(gl.DEPTH_RANGE);
            console.info("webgltest [webgl_test_depthRangeError] depthRange(zNear = undefined) ");
            gl.depthRange(undefined, 1.0);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR)
            console.info("webgltest [webgl_test_depthRangeError] depthRange(zFar = undefined) ");
            gl.depthRange(1.0, undefined);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR)
            console.info("webgltest [webgl_test_depthRangeError] depthRange(zNear = undefined,zFar = undefined) ");
            gl.depthRange(undefined, undefined);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR)
            console.info("webgltest [webgl_test_depthRangeError] depthRange(zNear = -1,zFar = -1) ");
            gl.depthRange(-1, -1);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR)
            gl.depthRange(src[0], src[1]);
            done();
        })
        /**
         * 通过设置绕组方向来指定多边形是正面还是背面。
         */

        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0160
         * @tc.name webgl_test_frontFace
         * @tc.desc Test frontFace.
         */
        it('webgl_test_frontFace', 0, async function (done) {
            console.info("webgltest [webgl_test_frontFace] frontFace");
            let src = gl.getParameter(gl.FRONT_FACE);
            console.info("webgltest gl.frontFace(gl.CW);", gl.CW);
            gl.frontFace(gl.CW);
            console.info("webgltest gl.getParameter(gl.FRONT_FACE);", gl.getParameter(gl.FRONT_FACE));
            expect(gl.getParameter(gl.FRONT_FACE)).assertEqual(gl.CW);
            console.info("webgltest gl.frontFace(gl.CCW);", gl.CCW);
            gl.frontFace(gl.CCW);
            console.info("webgltest gl.getParameter(gl.FRONT_FACE);", gl.getParameter(gl.FRONT_FACE));
            expect(gl.getParameter(gl.FRONT_FACE)).assertEqual(gl.CCW);
            gl.frontFace(src);
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0161
         * @tc.name webgl_test_frontFace_Error
         * @tc.desc Test frontFace.
         */
        it('webgl_test_frontFace_Error', 0, async function (done) {
            console.info("webgltest [webgl_test_frontFaceError] frontFace");
            let src = gl.getParameter(gl.FRONT_FACE);
            console.info("webgltest [webgl_test_depthRangeError] frontFace(undefined) ");
            gl.frontFace(undefined);
            expect(checkError(gl)).assertEqual(gl.INVALID_ENUM)
            console.info("webgltest [webgl_test_depthRangeError] frontFace(null) ");
            gl.frontFace(null);
            expect(checkError(gl)).assertEqual(gl.INVALID_ENUM)
            console.info("webgltest [webgl_test_depthRangeError] frontFace(-1) ");
            gl.frontFace(-1);
            expect(checkError(gl)).assertEqual(gl.INVALID_ENUM)
            gl.frontFace(src);
            done();
        })

        /**
         * 方法设置了模板测试的前端和后端函数和参考值。
         */

        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0162
         * @tc.name webgl_test_stencilFunc
         * @tc.desc Test stencilFunc.
         */
        it('webgl_test_stencilFunc', 0, async function (done) {
            console.info("webgltest [webgl_test_stencilFunc] stencilFunc");
            let isEnable = gl.isEnabled(gl.STENCIL_TEST);
            gl.enable(gl.STENCIL_TEST);
            let defVal = gl.getParameter(gl.STENCIL_VALUE_MASK);
            console.info("webgltest gl.stencilFunc(gl.LESS, 0, 0b11);");
            gl.stencilFunc(gl.LESS, 0, 0b11);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR);
            let stencilFunc = gl.getParameter(gl.STENCIL_FUNC);
            console.info("webgltest STENCIL_FUNC", stencilFunc);
            let stencilValueMask = gl.getParameter(gl.STENCIL_VALUE_MASK);
            console.info("webgltest STENCIL_VALUE_MASK", stencilValueMask);
            let stencilRef = gl.getParameter(gl.STENCIL_REF);
            console.info("webgltest STENCIL_REF", stencilRef);
            let backFunc = gl.getParameter(gl.STENCIL_BACK_FUNC);
            console.info("webgltest STENCIL_BACK_FUNC", backFunc);
            let stencilBackValueMask = gl.getParameter(gl.STENCIL_BACK_VALUE_MASK);
            console.info("webgltest STENCIL_BACK_VALUE_MASK", stencilBackValueMask);
            let stencilBackRef = gl.getParameter(gl.STENCIL_BACK_REF);
            console.info("webgltest STENCIL_BACK_REF", stencilBackRef);
            let stencilBits = gl.getParameter(gl.STENCIL_BITS);
            console.info("webgltest STENCIL_BITS", stencilBits);
            expect(stencilValueMask).assertEqual(3);
            expect(stencilBackValueMask).assertEqual(3);
            gl.stencilFunc(gl.LESS, 0, defVal);
            if (!isEnable) {
                gl.disable(gl.STENCIL_TEST);
            }
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0163
         * @tc.name webgl_test_stencilFunc_Error
         * @tc.desc Test stencilFunc.
         */
        it('webgl_test_stencilFunc_Error', 0, async function (done) {
            let isEnable = gl.isEnabled(gl.STENCIL_TEST);
            gl.enable(gl.STENCIL_TEST);
            let defVal = gl.getParameter(gl.STENCIL_VALUE_MASK);
            console.info("webgltest [webgl_test_stencilFuncError] stencilFunc(func = undefined) ");
            gl.stencilFunc(undefined, 0, defVal);
            expect(checkError(gl)).assertEqual(gl.INVALID_ENUM)
            console.info("webgltest [webgl_test_stencilFuncError] stencilFunc(ref = undefined) ");
            gl.stencilFunc(gl.LESS, undefined, defVal);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR)
            console.info("webgltest [webgl_test_stencilFuncError] stencilFunc(mask = undefined) ");
            gl.stencilFunc(gl.LESS, 0, undefined);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR)
            gl.stencilFunc(gl.LESS, 0, defVal);
            if (!isEnable) {
                gl.disable(gl.STENCIL_TEST);
            }
            done();
        })

        /**
         * WebGL API 的 WebGLRenderingContext.stencilFuncSepar（） 方法设置了模板测试的前端和/或背面函数和参考值。
         */

        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0164
         * @tc.name webgl_test_stencilFuncSeparate
         * @tc.desc Test stencilFuncSeparate.
         */
        it('webgl_test_stencilFuncSeparate', 0, async function (done) {
            console.info("webgltest [webgl_test_stencilFuncSeparate] stencilFuncSeparate");
            let isEnable = gl.isEnabled(gl.STENCIL_TEST);
            gl.enable(gl.STENCIL_TEST);
            let defVal = gl.getParameter(gl.STENCIL_VALUE_MASK);
            console.info("webgltest gl.stencilFuncSeparate(gl.FRONT, gl.LESS, 1, 0b11);", gl.FRONT, gl.LESS);
            console.info("webgltest gl.stencilFuncSeparate(gl.BACK, gl.LESS, 2, 0b111);", gl.BACK, gl.LESS);
            gl.stencilFuncSeparate(gl.FRONT, gl.LESS, 1, 0b11);
            gl.stencilFuncSeparate(gl.BACK, gl.LESS, 2, 0b111);
            expect(gl.getError()).assertEqual(gl.NO_ERROR);
            let stencilFunc = gl.getParameter(gl.STENCIL_FUNC);
            console.info("webgltest STENCIL_FUNC", stencilFunc);
            let stencilValueMask = gl.getParameter(gl.STENCIL_VALUE_MASK);
            console.info("webgltest STENCIL_VALUE_MASK", stencilValueMask);
            let stencilRef = gl.getParameter(gl.STENCIL_REF);
            console.info("webgltest STENCIL_REF", stencilRef);
            let backFunc = gl.getParameter(gl.STENCIL_BACK_FUNC);
            console.info("webgltest STENCIL_BACK_FUNC", backFunc);
            let stencilBackValueMask = gl.getParameter(gl.STENCIL_BACK_VALUE_MASK);
            console.info("webgltest STENCIL_BACK_VALUE_MASK", stencilBackValueMask);
            let stencilBackRef = gl.getParameter(gl.STENCIL_BACK_REF);
            console.info("webgltest STENCIL_BACK_REF", stencilBackRef);
            let stencilBits = gl.getParameter(gl.STENCIL_BITS);
            console.info("webgltest STENCIL_BITS", stencilBits);
            expect(stencilRef).assertEqual(1);
            expect(stencilBackRef).assertEqual(2);
            expect(stencilValueMask).assertEqual(3);
            expect(stencilBackValueMask).assertEqual(7);
            gl.stencilFunc(gl.LESS, 0, defVal);
            if (!isEnable) {
                gl.disable(gl.STENCIL_TEST);
            }
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0165
         * @tc.name webgl_test_stencilFuncSeparate_Error
         * @tc.desc Test stencilFuncSeparate.
         */
        it('webgl_test_stencilFuncSeparate_Error', 0, async function (done) {
            console.info("webgltest [webgl_test_stencilFuncSeparateError] stencilFuncSeparate");
            let isEnable = gl.isEnabled(gl.STENCIL_TEST);
            gl.enable(gl.STENCIL_TEST);
            let defVal = gl.getParameter(gl.STENCIL_VALUE_MASK);
            console.info("webgltest [webgl_test_stencilFuncError] stencilFuncSeparate(face = undefined) ");
            gl.stencilFuncSeparate(undefined, gl.LESS, 1, 0b11);
            expect(checkError(gl)).assertEqual(gl.INVALID_ENUM)
            console.info("webgltest [webgl_test_stencilFuncError] stencilFuncSeparate(func = undefined) ");
            gl.stencilFuncSeparate(gl.FRONT, undefined, 1, 0b11);
            expect(checkError(gl)).assertEqual(gl.INVALID_ENUM)
            console.info("webgltest [webgl_test_stencilFuncError] stencilFuncSeparate(ref = undefined) ");
            gl.stencilFuncSeparate(gl.FRONT, gl.LESS, undefined, 0b11);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR)
            console.info("webgltest [webgl_test_stencilFuncError] stencilFuncSeparate(mask = undefined) ");
            gl.stencilFuncSeparate(gl.FRONT, gl.LESS, 1, undefined);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR)
            gl.stencilFunc(gl.LESS, 0, defVal);
            if (!isEnable) {
                gl.disable(gl.STENCIL_TEST);
            }
            done();
        })

        /**
         * WebGL API 的 WebGLRenderingContext.stencilMask（） 方法控制启用和禁用模板平面中单个位的正面和背面写入。
         */

        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0166
         * @tc.name webgl_test_stencilMask
         * @tc.desc Test stencilMask.
         */
        it('webgl_test_stencilMask', 0, async function (done) {
            console.info("webgltest [webgl_test_stencilMask] stencilMask");
            let srcStencilWriteMask = gl.getParameter(gl.STENCIL_WRITEMASK);
            let srcStencilBackWriteMask = gl.getParameter(gl.STENCIL_BACK_WRITEMASK);
            console.info("webgltest gl.stencilMask(110111);");
            gl.stencilMask(110111);
            console.info("webgltest STENCIL_WRITEMASK", gl.getParameter(gl.STENCIL_WRITEMASK));
            console.info("webgltest STENCIL_BACK_WRITEMASK", gl.getParameter(gl.STENCIL_BACK_WRITEMASK));
            console.info("webgltest STENCIL_BITS", gl.getParameter(gl.STENCIL_BITS));
            expect(gl.getParameter(gl.STENCIL_WRITEMASK)).assertEqual(110111);
            expect(gl.getParameter(gl.STENCIL_BACK_WRITEMASK)).assertEqual(110111);
            gl.stencilMask(srcStencilWriteMask);
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0167
         * @tc.name webgl_test_stencilMask_Error
         * @tc.desc Test stencilMask.
         */
        it('webgl_test_stencilMask_Error', 0, async function (done) {
            console.info("webgltest [webgl_test_stencilMaskError] stencilMask");
            let srcStencilWriteMask = gl.getParameter(gl.STENCIL_WRITEMASK);
            console.info("webgltest [webgl_test_stencilFuncError] stencilMask(undefined) ");
            gl.stencilMask(undefined);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR)
            console.info("webgltest [webgl_test_stencilFuncError] stencilMask(null) ");
            gl.stencilMask(null);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR)
            console.info("webgltest [webgl_test_stencilFuncError] stencilMask(-1) ");
            gl.stencilMask(-1);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR)
            gl.stencilMask(srcStencilWriteMask);
            done();
        })

        /**
         * WebGL API 的 WebGLRenderingContext.stencilMaskSepar（） 方法控制启用和禁用模板平面中单个位的正面和/或背面写入。
         */

        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0168
         * @tc.name webgl_test_stencilMaskSeparate
         * @tc.desc Test stencilMaskSeparate.
         */
        it('webgl_test_stencilMaskSeparate', 0, async function (done) {
            console.info("webgltest [webgl_test_stencilMaskSeparate] stencilMaskSeparate");
            let srcStencilWriteMask = gl.getParameter(gl.STENCIL_WRITEMASK);
            let srcStencilBackWriteMask = gl.getParameter(gl.STENCIL_BACK_WRITEMASK);
            console.info("webgltest gl.stencilMaskSeparate(gl.FRONT, 110101);");
            gl.stencilMaskSeparate(gl.FRONT, 110101);
            console.info("webgltest gl.stencilMaskSeparate(gl.BACK, 110111);");
            gl.stencilMaskSeparate(gl.BACK, 110111);
            let stencilWriteMask = gl.getParameter(gl.STENCIL_WRITEMASK);
            let stencilBackWriteMask = gl.getParameter(gl.STENCIL_BACK_WRITEMASK);
            let stencilBits = gl.getParameter(gl.STENCIL_BITS);
            console.info("webgltest STENCIL_WRITEMASK", stencilWriteMask);
            console.info("webgltest STENCIL_BACK_WRITEMASK", stencilBackWriteMask);
            console.info("webgltest STENCIL_BITS", stencilBits);
            expect(stencilWriteMask).assertEqual(110101);
            expect(stencilBackWriteMask).assertEqual(110111);
            gl.stencilMaskSeparate(gl.FRONT, srcStencilWriteMask);
            gl.stencilMaskSeparate(gl.BACK, srcStencilBackWriteMask);
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0169
         * @tc.name webgl_test_stencilMaskSeparate_Error
         * @tc.desc Test stencilMaskSeparate.
         */
        it('webgl_test_stencilMaskSeparate_Error', 0, async function (done) {
            console.info("webgltest [webgl_test_stencilMaskSeparateError] stencilMaskSeparate");
            let srcStencilWriteMask = gl.getParameter(gl.STENCIL_WRITEMASK);
            let srcStencilBackWriteMask = gl.getParameter(gl.STENCIL_BACK_WRITEMASK);
            console.info("webgltest [webgl_test_stencilFuncError] stencilMaskSeparate(face = undefined) ");
            gl.stencilMaskSeparate(undefined, 110101);
            expect(checkError(gl)).assertEqual(gl.INVALID_ENUM)
            console.info("webgltest [webgl_test_stencilFuncError] stencilMaskSeparate(face = FRONT,mask = undefined) ");
            gl.stencilMaskSeparate(gl.FRONT, undefined);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR)
            console.info("webgltest [webgl_test_stencilFuncError] stencilMaskSeparate(face = BACK,mask = undefined) ");
            gl.stencilMaskSeparate(gl.BACK, undefined);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR)
            gl.stencilMaskSeparate(gl.FRONT, srcStencilWriteMask);
            gl.stencilMaskSeparate(gl.BACK, srcStencilBackWriteMask);
            done();
        })

        /**
         * stencilOp(fail, zfail, zpass) 方法设置正面和背面的模板测试操作。
         */

        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0170
         * @tc.name webgl_test_stencilOp
         * @tc.desc Test stencilOp.
         */
        it('webgl_test_stencilOp', 0, async function (done) {
            console.info("webgltest [webgl_test_stencilOp] stencilOp");
            let isEnable = gl.isEnabled(gl.STENCIL_TEST);
            gl.enable(gl.STENCIL_TEST);
            let getInfo = () => {
                let fail = gl.getParameter(gl.STENCIL_FAIL);
                let passDepthFail = gl.getParameter(gl.STENCIL_PASS_DEPTH_FAIL);
                let passDepthPass = gl.getParameter(gl.STENCIL_PASS_DEPTH_PASS);
                let backFail = gl.getParameter(gl.STENCIL_BACK_FAIL);
                let backPassDepthFail = gl.getParameter(gl.STENCIL_BACK_PASS_DEPTH_FAIL);
                let backPassDepthPass = gl.getParameter(gl.STENCIL_BACK_PASS_DEPTH_PASS);
                let bits = gl.getParameter(gl.STENCIL_BITS);
                console.info("webgltest STENCIL_FAIL", fail);
                console.info("webgltest STENCIL_PASS_DEPTH_FAIL", passDepthFail);
                console.info("webgltest STENCIL_PASS_DEPTH_PASS", passDepthPass);
                console.info("webgltest STENCIL_BACK_FAIL", backFail);
                console.info("webgltest STENCIL_BACK_PASS_DEPTH_FAIL", backPassDepthFail);
                console.info("webgltest STENCIL_BACK_PASS_DEPTH_PASS", backPassDepthPass);
                console.info("webgltest STENCIL_BITS", bits);
                return {
                    fail, passDepthPass, passDepthFail,
                    backFail, backPassDepthPass, backPassDepthFail,
                    bits
                }
            }
            let info = getInfo();
            expect(info.fail).assertEqual(gl.KEEP);
            expect(info.passDepthFail).assertEqual(gl.KEEP);
            expect(info.passDepthPass).assertEqual(gl.KEEP);
            console.info("webgltest gl.stencilOp(gl.INCR, gl.DECR, gl.INVERT);", gl.INCR, gl.DECR, gl.INVERT);
            gl.stencilOp(gl.INCR, gl.DECR, gl.INVERT);
            info = getInfo();
            expect(info.fail).assertEqual(gl.INCR);
            expect(info.passDepthFail).assertEqual(gl.DECR);
            expect(info.passDepthPass).assertEqual(gl.INVERT);
            gl.stencilOp(gl.KEEP, gl.KEEP, gl.KEEP);
            if (!isEnable) {
                gl.disable(gl.STENCIL_TEST);
            }
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0171
         * @tc.name webgl_test_stencilOp_Error
         * @tc.desc Test stencilOp.
         */
        it('webgl_test_stencilOp_Error', 0, async function (done) {
            console.info("webgltest [webgl_test_stencilOpError] stencilOp");
            let isEnable = gl.isEnabled(gl.STENCIL_TEST);
            gl.enable(gl.STENCIL_TEST);
            console.info("webgltest [webgl_test_stencilFuncError] stencilOp(fail = undefined) ");
            gl.stencilOp(undefined, gl.KEEP, gl.KEEP);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR)
            console.info("webgltest [webgl_test_stencilFuncError] stencilOp(zfail = undefined) ");
            gl.stencilOp(gl.KEEP, undefined, gl.KEEP);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR)
            console.info("webgltest [webgl_test_stencilFuncError] stencilOp(zpass = undefined) ");
            gl.stencilOp(gl.KEEP, gl.KEEP, undefined);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR)
            gl.stencilOp(gl.KEEP, gl.KEEP, gl.KEEP);
            if (!isEnable) {
                gl.disable(gl.STENCIL_TEST);
            }
            done();
        })

        /**
         * stencilOpSeparate(face, fail, zfail, zpass)
         */

        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0172
         * @tc.name webgl_test_stencilOpSeparate
         * @tc.desc Test stencilOpSeparate.
         */
        it('webgl_test_stencilOpSeparate', 0, async function (done) {
            console.info("webgltest [webgl_test_stencilOpSeparate] stencilOpSeparate");
            let isEnable = gl.isEnabled(gl.STENCIL_TEST);
            gl.enable(gl.STENCIL_TEST);
            let getInfo = () => {
                let fail = gl.getParameter(gl.STENCIL_FAIL);
                let passDepthFail = gl.getParameter(gl.STENCIL_PASS_DEPTH_FAIL);
                let passDepthPass = gl.getParameter(gl.STENCIL_PASS_DEPTH_PASS);
                let backFail = gl.getParameter(gl.STENCIL_BACK_FAIL);
                let backPassDepthFail = gl.getParameter(gl.STENCIL_BACK_PASS_DEPTH_FAIL);
                let backPassDepthPass = gl.getParameter(gl.STENCIL_BACK_PASS_DEPTH_PASS);
                let bits = gl.getParameter(gl.STENCIL_BITS);
                console.info("webgltest STENCIL_FAIL", fail);
                console.info("webgltest STENCIL_PASS_DEPTH_FAIL", passDepthFail);
                console.info("webgltest STENCIL_PASS_DEPTH_PASS", passDepthPass);
                console.info("webgltest STENCIL_BACK_FAIL", backFail);
                console.info("webgltest STENCIL_BACK_PASS_DEPTH_FAIL", backPassDepthFail);
                console.info("webgltest STENCIL_BACK_PASS_DEPTH_PASS", backPassDepthPass);
                console.info("webgltest STENCIL_BITS", bits);
                return {
                    fail, passDepthPass, passDepthFail,
                    backFail, backPassDepthPass, backPassDepthFail,
                    bits
                }
            }
            let info = getInfo();
            expect(info.fail).assertEqual(gl.KEEP);
            expect(info.passDepthFail).assertEqual(gl.KEEP);
            expect(info.passDepthPass).assertEqual(gl.KEEP);
            expect(info.backFail).assertEqual(gl.KEEP);
            expect(info.backPassDepthFail).assertEqual(gl.KEEP);
            expect(info.backPassDepthPass).assertEqual(gl.KEEP);
            console.info("webgltest gl.stencilOpSeparate(gl.FRONT,gl.INCR, gl.DECR, gl.INVERT);", gl.FRONT, gl.INCR, gl.DECR, gl.INVERT);
            console.info("webgltest gl.stencilOpSeparate(gl.BACK,gl.KEEP, gl.DECR, gl.INVERT);", gl.BACK, gl.KEEP, gl.DECR, gl.INVERT);
            gl.stencilOpSeparate(gl.FRONT, gl.INCR, gl.DECR, gl.INVERT);
            gl.stencilOpSeparate(gl.BACK, gl.KEEP, gl.DECR, gl.INVERT);
            info = getInfo();
            expect(info.fail).assertEqual(gl.INCR);
            expect(info.passDepthFail).assertEqual(gl.DECR);
            expect(info.passDepthPass).assertEqual(gl.INVERT);
            expect(info.backFail).assertEqual(gl.KEEP);
            expect(info.backPassDepthFail).assertEqual(gl.DECR);
            expect(info.backPassDepthPass).assertEqual(gl.INVERT);
            gl.stencilOp(gl.KEEP, gl.KEEP, gl.KEEP);
            if (!isEnable) {
                gl.disable(gl.STENCIL_TEST);
            }
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0173
         * @tc.name webgl_test_stencilOpSeparate_Error
         * @tc.desc Test stencilOpSeparate.
         */
        it('webgl_test_stencilOpSeparate_Error', 0, async function (done) {
            console.info("webgltest [webgl_test_stencilOpSeparateError] stencilOpSeparate");
            let isEnable = gl.isEnabled(gl.STENCIL_TEST);
            gl.enable(gl.STENCIL_TEST);
            console.info("webgltest [webgl_test_stencilOpSeparateError] stencilOpSeparate(face = undefined) ");
            gl.stencilOpSeparate(undefined, gl.KEEP, gl.DECR, gl.INVERT);
            expect(checkError(gl)).assertEqual(gl.INVALID_ENUM)
            console.info("webgltest [webgl_test_stencilOpSeparateError] stencilOpSeparate(fail = undefined) ");
            gl.stencilOpSeparate(gl.BACK, undefined, gl.DECR, gl.INVERT);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR)
            console.info("webgltest [webgl_test_stencilOpSeparateError] stencilOpSeparate(zfail = undefined) ");
            gl.stencilOpSeparate(gl.BACK, gl.KEEP, undefined, gl.INVERT);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR)
            console.info("webgltest [webgl_test_stencilOpSeparateError] stencilOpSeparate(zpss = undefined) ");
            gl.stencilOpSeparate(gl.BACK, gl.KEEP, gl.DECR, undefined);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR)
            gl.stencilOp(gl.KEEP, gl.KEEP, gl.KEEP);
            if (!isEnable) {
                gl.disable(gl.STENCIL_TEST);
            }
            done();
        })

        /**
         * WebGL API 的 WebGLRenderingContext.scissor（） 方法设置了一个剪刀框，将绘图限制为指定的矩形。
         */

        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0174
         * @tc.name webgl_test_scissor
         * @tc.desc Test scissor.
         */
        it('webgl_test_scissor', 0, async function (done) {
            console.info("webgltest [webgl_test_scissor] scissor");
            let isEnable = gl.isEnabled(gl.SCISSOR_TEST);
            let src = gl.getParameter(gl.SCISSOR_BOX);
            console.info("webgltest default ", src);
            gl.enable(gl.SCISSOR_TEST);
            console.info("webgltest gl.scissor(0, 0, 100, 100);");
            gl.scissor(0, 0, 100, 100);
            let box = gl.getParameter(gl.SCISSOR_BOX);
            console.info("webgltest box", box);
            expect(box[0]).assertEqual(0);
            expect(box[1]).assertEqual(0);
            expect(box[2]).assertEqual(100);
            expect(box[3]).assertEqual(100);
            gl.scissor(src[0], src[1], src[2], src[3]);
            if (!isEnable) {
                gl.disable(gl.SCISSOR_TEST);
            }
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0175
         * @tc.name webgl_test_scissor_Error
         * @tc.desc Test scissor.
         */
        it('webgl_test_scissor_Error', 0, async function (done) {
            console.info("webgltest [webgl_test_scissorError] scissor");
            let isEnable = gl.isEnabled(gl.SCISSOR_TEST);
            let src = gl.getParameter(gl.SCISSOR_BOX);
            console.info("webgltest default ", src);
            gl.enable(gl.SCISSOR_TEST);
            console.info("webgltest [webgl_test_scissorError] scissor(x = undefined) ");
            gl.scissor(undefined, 0, 100, 100);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR)
            console.info("webgltest [webgl_test_scissorError] scissor(y = undefined) ");
            gl.scissor(0, undefined, 100, 100);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR)
            console.info("webgltest [webgl_test_scissorError] scissor(width = undefined) ");
            gl.scissor(0, 0, undefined, 100);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR)
            console.info("webgltest [webgl_test_scissorError] scissor(height = undefined) ");
            gl.scissor(0, 0, 100, undefined);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR)
            if (!isEnable) {
                gl.disable(gl.SCISSOR_TEST);
            }
            done();
        })

        /**
         * WebGL API 的 WebGLRenderingContext.polygonOffset（）
         * 方法指定用于计算深度值的比例因子和单位。
         */

        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0176
         * @tc.name webgl_test_polygonOffset
         * @tc.desc Test polygonOffset.
         */
        it('webgl_test_polygonOffset', 0, async function (done) {
            console.info("webgltest [polygonOffset] polygonOffset");
            let isEnable = gl.isEnabled(gl.POLYGON_OFFSET_FILL);
            gl.enable(gl.POLYGON_OFFSET_FILL);
            gl.polygonOffset(0, 0);
            let srcFactor = gl.getParameter(gl.POLYGON_OFFSET_FACTOR);
            let srcUnits = gl.getParameter(gl.POLYGON_OFFSET_UNITS);
            expect(srcFactor).assertEqual(0);
            expect(srcUnits).assertEqual(0);
            console.info("webgltest default ", srcFactor, srcUnits);
            console.info("webgltest gl.polygonOffset(1, 1);");
            gl.polygonOffset(1, 1);
            let factor = gl.getParameter(gl.POLYGON_OFFSET_FACTOR);
            let units = gl.getParameter(gl.POLYGON_OFFSET_UNITS);
            console.info("webgltest factor", factor);
            console.info("webgltest units", units);
            expect(factor).assertEqual(1);
            expect(units).assertEqual(1);
            gl.polygonOffset(srcFactor, srcUnits);
            if (!isEnable) {
                gl.disable(gl.POLYGON_OFFSET_FILL);
            }
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0177
         * @tc.name webgl_test_polygonOffset_Error
         * @tc.desc Test polygonOffset.
         */
        it('webgl_test_polygonOffset_Error', 0, async function (done) {
            console.info("webgltest [webgl_test_polygonOffsetError] polygonOffset");
            let isEnable = gl.isEnabled(gl.POLYGON_OFFSET_FILL);
            gl.enable(gl.POLYGON_OFFSET_FILL);
            gl.polygonOffset(0, 0);
            let srcFactor = gl.getParameter(gl.POLYGON_OFFSET_FACTOR);
            let srcUnits = gl.getParameter(gl.POLYGON_OFFSET_UNITS);
            console.info("webgltest [webgl_test_polygonOffsetError] polygonOffset(factor = undefined) ");
            gl.polygonOffset(undefined, 1);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR)
            console.info("webgltest [webgl_test_polygonOffsetError] polygonOffset(units = undefined) ");
            gl.polygonOffset(1, undefined);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR)
            gl.polygonOffset(srcFactor, srcUnits);
            if (!isEnable) {
                gl.disable(gl.POLYGON_OFFSET_FILL);
            }
            done();
        })

        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0178
         * @tc.name webgl_test_sampleCoverage
         * @tc.desc Test sampleCoverage.
         */
        it('webgl_test_sampleCoverage', 0, async function (done) {
            console.info("webgltest [sampleCoverage] sampleCoverage");
            let isEnable = gl.isEnabled(gl.SAMPLE_COVERAGE);
            gl.enable(gl.SAMPLE_COVERAGE);
            let srcValue = gl.getParameter(gl.SAMPLE_COVERAGE_VALUE);
            let srcInvert = gl.getParameter(gl.SAMPLE_COVERAGE_INVERT);
            expect(srcValue).assertEqual(1);
            expect(srcInvert).assertEqual(false);
            console.info("webgltest default ", srcValue, srcInvert);
            console.info("webgltest gl.sampleCoverage(0.5, true);");
            gl.sampleCoverage(0.5, true);
            let value = gl.getParameter(gl.SAMPLE_COVERAGE_VALUE);
            let invert = gl.getParameter(gl.SAMPLE_COVERAGE_INVERT);
            console.info("webgltest value", value);
            console.info("webgltest invert", invert);
            expect(value).assertEqual(0.5);
            expect(invert).assertEqual(true);
            gl.sampleCoverage(srcValue, srcInvert);
            if (!isEnable) {
                gl.disable(gl.SAMPLE_COVERAGE);
            }
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0179
         * @tc.name webgl_test_sampleCoverage_Error
         * @tc.desc Test sampleCoverage.
         */
        it('webgl_test_sampleCoverage_Error', 0, async function (done) {
            console.info("webgltest [webgl_test_sampleCoverageError] sampleCoverage");
            let isEnable = gl.isEnabled(gl.SAMPLE_COVERAGE);
            gl.enable(gl.SAMPLE_COVERAGE);
            let srcValue = gl.getParameter(gl.SAMPLE_COVERAGE_VALUE);
            let srcInvert = gl.getParameter(gl.SAMPLE_COVERAGE_INVERT);
            console.info("webgltest [webgl_test_sampleCoverageError] sampleCoverage(value = undefined) ");
            gl.sampleCoverage(undefined, true);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR)
            console.info("webgltest [webgl_test_sampleCoverageError] sampleCoverage(value = -1) ");
            gl.sampleCoverage(-1, true);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR)
            console.info("webgltest [webgl_test_sampleCoverageError] sampleCoverage(invert = undefined) ");
            gl.sampleCoverage(0.5, undefined);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR)
            console.info("webgltest [webgl_test_sampleCoverageError] sampleCoverage(value = -1,invert = undefined) ");
            gl.sampleCoverage(-1, undefined);
            expect(checkError(gl)).assertEqual(gl.NO_ERROR)
            gl.sampleCoverage(srcValue, srcInvert);
            if (!isEnable) {
                gl.disable(gl.SAMPLE_COVERAGE);
            }
            done();
        })

        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0180
         * @tc.name webgl_test_pixelStorei
         * @tc.desc Test pixelStorei.
         */
        it('webgl_test_pixelStorei', 0, async function (done) {
            console.info("webgltest [pixelStorei] pixelStorei");
            let srcUnpack = gl.getParameter(gl.UNPACK_ALIGNMENT);
            let srcPack = gl.getParameter(gl.PACK_ALIGNMENT);
            console.info("webgltest default ", srcUnpack, srcPack);
            console.info("webgltest gl.pixelStorei(gl.UNPACK_ALIGNMENT, 2);");
            gl.pixelStorei(gl.UNPACK_ALIGNMENT, 2);
            console.info("webgltest gl.pixelStorei(gl.PACK_ALIGNMENT, 4);");
            gl.pixelStorei(gl.PACK_ALIGNMENT, 4);
            let unpack = gl.getParameter(gl.UNPACK_ALIGNMENT);
            let pack = gl.getParameter(gl.PACK_ALIGNMENT);
            console.info("webgltest unpack", unpack);
            console.info("webgltest pack", pack);
            expect(unpack).assertEqual(2);
            expect(pack).assertEqual(4);
            gl.pixelStorei(gl.UNPACK_ALIGNMENT, srcUnpack);
            gl.pixelStorei(gl.PACK_ALIGNMENT, srcPack);
            done();
        })


        /**
         * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_COMMON_0181
         * @tc.name webgl_test_pixelStorei_Error
         * @tc.desc Test pixelStorei.
         */
        it('webgl_test_pixelStorei_Error', 0, async function (done) {
            console.info("webgltest [webgl_test_pixelStoreiError] pixelStorei");
            let srcUnpack = gl.getParameter(gl.UNPACK_ALIGNMENT);
            let srcPack = gl.getParameter(gl.PACK_ALIGNMENT);
            console.info("webgltest [webgl_test_pixelStoreiError] pixelStorei(pname = undefined) ");
            gl.pixelStorei(undefined, 2);
            expect(checkError(gl)).assertEqual(gl.INVALID_ENUM)
            console.info("webgltest [webgl_test_pixelStoreiError] pixelStorei(param = undefined) ");
            gl.pixelStorei(gl.UNPACK_ALIGNMENT, undefined);
            expect(checkError(gl)).assertEqual(gl.INVALID_VALUE)
            console.info("webgltest [webgl_test_pixelStoreiError] pixelStorei(pname = undefined,param = undefined) ");
            gl.pixelStorei(undefined, undefined);
            expect(checkError(gl)).assertEqual(gl.INVALID_ENUM)
            gl.pixelStorei(gl.UNPACK_ALIGNMENT, srcUnpack);
            gl.pixelStorei(gl.PACK_ALIGNMENT, srcPack);
            done();
        })

    })
}
