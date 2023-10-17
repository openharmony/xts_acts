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
import app from '@system.app'
import {describe,beforeAll,beforeEach,afterEach,afterAll,it,expect} from '@ohos/hypium'

export default function webgl1Test_webgl8() {
	describe('webgl1Test_webgl8', function () {
		console.info('webgltest start');
		var gl;
		var gl2;

		var indices = new Uint16Array([0, 1, 2, 1, 3, 4]);
		var vertices = new Uint16Array([
			-0.5, 0.5, 0.0,
			0.0, 0.5, 0.0,
			-0.25, 0.25, 0.0,
			0.5, 0.5, 0.0,
			0.25, 0.25, 0.0,
		])

		//顶点着色器程序
		var VSHADER_SOURCE =
			"attribute vec4 a_Position;" +
			"void main() {" +
			//设置坐标
			"gl_Position = a_Position; " +
			//    "gl_PointSize = 10.0;" +
			"} ";

		//片元着色器
		var FSHADER_SOURCE =
			"void main() {" +
			//设置颜色
			"gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0);" +
			"}";

		function globalFunction() {
			const vertexShader = gl.createShader(gl.VERTEX_SHADER);
			gl.shaderSource(vertexShader, VSHADER_SOURCE);
			gl.compileShader(vertexShader);
			const fragmentShader = gl.createShader(gl.FRAGMENT_SHADER);
			gl.shaderSource(fragmentShader, FSHADER_SOURCE);
			gl.compileShader(fragmentShader);
			const programObj = gl.createProgram();
			console.info("testUseProgram has failed for " + programObj)
			const useProgramError1 = gl.getError();
			console.info("useProgramError: " + useProgramError1);
			const renderBufferValue1 = gl.getParameter(gl.CURRENT_PROGRAM);
			console.info("testUseProgram has failed for " + renderBufferValue1)
			gl.attachShader(programObj, vertexShader);
			gl.attachShader(programObj, fragmentShader);
			gl.linkProgram(programObj);
			gl.useProgram(programObj);
			return programObj;
		}


		function createProgram(gl) {
			//顶点着色器程序
			var VSHADER_SOURCE =
				'attribute vec4 a_Position;\n' +
				'void main() {\n' +
				'  gl_Position = a_Position;\n' +
				'}\n';

			// 片元着色器程序
			var FSHADER_SOURCE =
				'precision mediump float;\n' +
				'uniform vec4 u_FragColor;\n' +
				'void main() {\n' +
				'  gl_FragColor = u_FragColor;\n' +
				'}\n';
			var vertexShader = gl.createShader(gl.VERTEX_SHADER);
			gl.shaderSource(vertexShader, VSHADER_SOURCE);
			gl.compileShader(vertexShader);
			var fragmentShader = gl.createShader(gl.FRAGMENT_SHADER);
			gl.shaderSource(fragmentShader, FSHADER_SOURCE);
			gl.compileShader(fragmentShader);
			const programObj = gl.createProgram();
			console.log("testUseProgram has failed for " + programObj)
			const useProgramError1 = gl.getError();
			console.info("useProgramError: " + useProgramError1);
			const renderBufferValue1 = gl.getParameter(gl.CURRENT_PROGRAM);
			console.log("testUseProgram has failed for " + renderBufferValue1)
			gl.attachShader(programObj, vertexShader);
			gl.attachShader(programObj, fragmentShader);
			gl.linkProgram(programObj);
			gl.useProgram(programObj);
			return programObj;
		}

		function initShaders(gl, vshader, fshader) {
			var program = createProgramExternal(gl, vshader, fshader);
			console.log("======createProgram program: " + JSON.stringify(program));

			if (!program) {
				console.log('Failed to create program');
				return false;
			}

			gl.useProgram(program);
			gl.program = program;

			return true;
		}

		function createProgramExternal(gl, vshader, fshader) {
			// Create shader object
			var vertexShader = loadShader(gl, gl.VERTEX_SHADER, vshader);
			console.log("======vertexShader: " + vertexShader);
			var fragmentShader = loadShader(gl, gl.FRAGMENT_SHADER, fshader);
			if (!vertexShader || !fragmentShader) {
				return null;
			}

			// Create a program object
			var program = gl.createProgram();
			console.log("======createProgram program: " + JSON.stringify(program));

			if (!program) {
				return null;
			}

			// Attach the shader objects
			gl.attachShader(program, vertexShader);
			gl.attachShader(program, fragmentShader);

			// Link the program object
			gl.linkProgram(program);

			// Check the result of linking
			var linked = gl.getProgramParameter(program, 0x8B82);
			console.log("======getProgramParameter linked: " + linked);

			const getUniformLocationValue = gl.getUniformLocation(program, "a_Position");
			console.log("======getUniformLocation: " + JSON.stringify(getUniformLocationValue));


			if (!linked) {
				var error = gl.getProgramInfoLog(program);
				console.log('Failed to link program: ' + error);
				gl.deleteProgram(program);
				gl.deleteShader(fragmentShader);
				gl.deleteShader(vertexShader);
				return null;
			}

			return program;
		}

		function loadShader(gl, type, source) {
			console.log("======into loadShader====");
			// Create shader object
			var shader = gl.createShader(type);
			if (shader == null) {
				console.log('unable to create shader');
				return null;
			}

			const isShaderValue = gl.isShader(shader);
			console.log('isShader: ' + isShaderValue);

			// Set the shader program
			gl.shaderSource(shader, source);

			// Compile the shader
			gl.compileShader(shader);

			// Check the result of compilation
			var compiled = gl.getShaderParameter(shader, gl.COMPILE_STATUS);
			if (!compiled) {
				var error = gl.getShaderInfoLog(shader);
				console.log('Failed to compile shader: ' + error);
				gl.deleteShader(shader);
				return null;
			}

			var vertex = gl.getShaderParameter(shader, gl.VERTEX_SHADER);
			console.log('getShaderParameter VERTEX_SHADER: ' + vertex);


			return shader;
		}

		function initVertexBuffers(gl) {
			var vertices = new Float32Array([
				0.0, -1.0, -0.5, 0, 0.5, 0
			]);

			var n = 3; // 点的个数

			// 创建缓冲区对象
			var vertexBuffer = gl.createBuffer();
			if (!vertexBuffer) {
				console.log('Failed to create the buffer object');
				return -1;
			}

			// 将缓冲区对象绑定到目标
			gl.bindBuffer(gl.ARRAY_BUFFER, vertexBuffer);
			// 向缓冲区对象写入数据
			gl.bufferData(gl.ARRAY_BUFFER, vertices.buffer, gl.STATIC_DRAW);

			var aPosition = gl.getAttribLocation(gl.program, 'a_Position');
			console.info("webgl# getAttribLocation getAttribLocation success:" + JSON.stringify(gl.program));
			console.info("webgl# getAttribLocation getAttribLocation success:" + aPosition);
			if (aPosition < 0) {
				console.log('Failed to get the storage location of a_Position');
				return -1;
			}
			// 将缓冲区对象分配给a_Position变量
			gl.vertexAttribPointer(aPosition, 2, gl.FLOAT, false, 0, 0);

			// 连接a_Position变量与分配给它的缓冲区对象
			gl.enableVertexAttribArray(aPosition);

			return n;
		}


		var float1 = new Float32Array([1.1, 1.2, 1.3, 1.4]);
		var int1 = new Int8Array([1, 1, 1, 1]);
		var uint1 = new Uint8Array([1, 1, 1, 1]);
		var float2 = [1.1, 1.2, 1.3, 1.4];
		var int2 = [1, 1, 1, 1];
		var uint2 = [1, 1, 1, 1];

		function initContext() {
			console.info('initContext start');
			// 获取canvas元素
			const el = global.el;
			const el2 = global.el2;
			// 获取webgl上下文
			gl = el.getContext('webgl');
			if (!gl) {
				console.log('webgltest Failed to get the rendering context for WebGL');
			}
			gl2 = el2.getContext('webgl2');
			if (!gl) {
				console.log('webgltest Failed to get the rendering context for WebGL2');
			}
			console.info('webgltest initContext finish');
		}

		function deleteContext() {
			if (gl != null) {
				gl = null;
				console.info("webgltest gl has null");
			}
			if (gl2 != null) {
				console.info("webgltest gl2 has null");
				gl2 = null;
			}
		}

		/**
		 * run before testClass
		 */
		beforeAll(async function (done) {
			console.info('webgltest beforeAll called');
			initContext();
			done();
		});

		/**
		 * run after testClass
		 */
		afterAll(async function (done) {
			console.info('webgltest afterEach called');
			deleteContext();
			done();
		})


		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_0100
		 * @tc.name testFramebufferTextureLayer_01
		 * @tc.desc Test framebufferTextureLayer.
		 */
		it('testFramebufferTextureLayer_01', 0, async function (done) {
			
			console.info('jsWebGL testFramebufferTextureLayer_01 test start ...66');
			const shader = gl.createShader(gl.VERTEX_SHADER);
			gl2.framebufferTextureLayer(-gl.FRAMEBUFFER, -gl.COLOR_ATTACHMENT0, shader, -0, -8)
			const framebufferTextureLayerError = gl.getError();
			console.info("framebufferTextureLayerError: " + framebufferTextureLayerError);
			expect(framebufferTextureLayerError).assertLarger(gl.NO_ERROR);
			for(let err; (err = gl.getError()) != gl.NO_ERROR;) {}
			done();
		})

		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_0200
		 * @tc.name testFramebufferTextureLayer_02
		 * @tc.desc Test framebufferTextureLayer.
		 */
		it('testFramebufferTextureLayer_02', 0, async function (done) {
			
			console.info('jsWebGL testFramebufferTextureLayer_02 test start ...66');
			const texture = gl.createTexture();
			gl.bindTexture(gl2.TEXTURE_2D_ARRAY, texture);
			gl2.texStorage3D(gl2.TEXTURE_2D_ARRAY, 1, gl2.RGBA8, 256, 256, 8);
			gl.texParameteri(gl2.TEXTURE_CUBE_MAP, gl2.TEXTURE_MAG_FILTER, gl2.NEAREST);
			const framebuffer = gl.createFramebuffer();
			gl.bindFramebuffer(gl.FRAMEBUFFER, framebuffer);
			gl2.framebufferTextureLayer(gl.FRAMEBUFFER, gl.COLOR_ATTACHMENT0, texture, 0, 8)
			const framebufferTextureLayerError = gl.getError();
			console.info("framebufferTextureLayerError: " + framebufferTextureLayerError);
			var openGLVersion = gl.getParameter(gl.VERSION);
			console.info("openGLVersion: " + openGLVersion);
			var version = "OpenGL,ES,3";
			if (openGLVersion > version) {
			    expect(framebufferTextureLayerError).assertEqual(0);
			} else {
			    expect(framebufferTextureLayerError).assertEqual(gl.INVALID_OPERATION);
			}
			done();
		})

		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_0300
		 * @tc.name testInvalidateFramebuffer_01
		 * @tc.desc Test invalidateFramebuffer.
		 */
		it('testInvalidateFramebuffer_01', 0, async function (done) {
			
			console.info('jsWebGL testInvalidateFramebuffer_01 test start ...66');
			gl2.invalidateFramebuffer(-0,
				[-0, -gl.COLOR_ATTACHMENT1]);
			const invalidateFramebufferError = gl.getError();
			console.info("invalidateFramebufferError: " + invalidateFramebufferError);
			expect(invalidateFramebufferError).assertEqual(gl.INVALID_ENUM);
			done();
		})

		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_0400
		 * @tc.name testInvalidateFramebuffer_02
		 * @tc.desc Test invalidateFramebuffer.
		 */
		it('testInvalidateFramebuffer_02', 0, async function (done) {
			
			console.info('jsWebGL testInvalidateFramebuffer_02 test start ...66');
			gl2.invalidateFramebuffer(-gl.READ_FRAMEBUFFER,
				[gl.COLOR_ATTACHMENT0, -gl.COLOR_ATTACHMENT1]);
			const invalidateFramebufferError = gl.getError();
			console.info("invalidateFramebufferError: " + invalidateFramebufferError);
			expect(invalidateFramebufferError).assertEqual(gl.INVALID_ENUM);
			done();
		})


		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_0500
		 * @tc.name testInvalidateSubFramebuffer_01
		 * @tc.desc Test invalidateSubFramebuffer.
		 */
		it('testInvalidateSubFramebuffer_01', 0, async function (done) {
			
			console.info('jsWebGL testInvalidateSubFramebuffer_01 test start ...66');
			console.info('jsWebGL testInvalidateSubFramebuffer test start ...' + JSON.stringify(gl));
			gl2.invalidateSubFramebuffer(-gl.READ_FRAMEBUFFER,
				[gl.COLOR_ATTACHMENT0, -gl.COLOR_ATTACHMENT1],
				0, 0, 256, 256);
			const invalidateSubFramebufferError = gl.getError();
			console.info("invalidateSubFramebufferError: " + invalidateSubFramebufferError);
			expect(invalidateSubFramebufferError).assertEqual(gl.INVALID_ENUM);
			done();
		})


		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_0600
		 * @tc.name testInvalidateSubFramebuffer_02
		 * @tc.desc Test invalidateSubFramebuffer.
		 */
		it('testInvalidateSubFramebuffer_02', 0, async function (done) {
			
			console.info('jsWebGL testInvalidateSubFramebuffer_02 test start ...66');
			console.info('jsWebGL testInvalidateSubFramebuffer test start ...' + JSON.stringify(gl));
			gl2.invalidateSubFramebuffer(-gl.READ_FRAMEBUFFER,
				[-0, -gl.COLOR_ATTACHMENT1],
				0, -0, 256, -256);
			const invalidateSubFramebufferError = gl.getError();
			console.info("invalidateSubFramebufferError: " + invalidateSubFramebufferError);
			expect(invalidateSubFramebufferError).assertLarger(gl.NO_ERROR);
			done();
		})

		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_0700
		 * @tc.name testReadBuffer_01
		 * @tc.desc Test readBuffer.
		 */
		it('testReadBuffer_01', 0, async function (done) {
			
			console.info('jsWebGL testReadBuffer_01 test start ...66');
			gl2.readBuffer(-gl.COLOR_ATTACHMENT0);
			const readBufferError = gl.getError();
			console.info("readBufferError: " + readBufferError);
			expect(readBufferError).assertEqual(gl.INVALID_ENUM);
			done();
		})

		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_0800
		 * @tc.name testReadBuffer_02
		 * @tc.desc Test readBuffer.
		 */
		it('testReadBuffer_02', 0, async function (done) {
			
			console.info('jsWebGL testReadBuffer_02 test start ...66');
			gl2.readBuffer(gl.INVALID_ENUM);
			const readBufferError = gl.getError();
			console.info("readBufferError: " + readBufferError);
			expect(readBufferError).assertEqual(gl.INVALID_ENUM);
			done();
		})


		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_0900
		 * @tc.name testGetInternalformatParameter_02
		 * @tc.desc Test getInternalformatParameter.
		 */
		it('testGetInternalformatParameter_02', 0, async function (done) {
			
			console.info('jsWebGL testGetInternalformatParameter_02 test start ...66');
			var samples = gl2.getInternalformatParameter(gl.RENDERBUFFER, gl2.RGBA8, gl.SAMPLES);
			console.info("samples: " + samples);
			const int32list = [-1, -1, -1];
			expect(samples.constructor == int32list.constructor).assertEqual(false);
			done();
		})


		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_1000
		 * @tc.name testRenderbufferStorageMultisample_01
		 * @tc.desc Test renderbufferStorageMultisample.
		 */
		it('testRenderbufferStorageMultisample_01', 0, async function (done) {
			
			console.info('jsWebGL testRenderbufferStorageMultisample test start ...66');
			gl2.renderbufferStorageMultisample(-gl.RENDERBUFFER, -4, -gl.RBGA4, -256, -256);
			const renderbufferStorageMultisampleError = gl.getError();
			console.info("renderbufferStorageMultisampleError: " + renderbufferStorageMultisampleError);
			expect(renderbufferStorageMultisampleError).assertEqual(gl.INVALID_ENUM);
			done();
		})


		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_1100
		 * @tc.name testRenderbufferStorageMultisample_02
		 * @tc.desc Test renderbufferStorageMultisample.
		 */
		it('testRenderbufferStorageMultisample_02', 0, async function (done) {
			
			console.info('jsWebGL testRenderbufferStorageMultisample test start ...66');
			gl2.renderbufferStorageMultisample(gl.ONE_MINUS_DST_COLOR, -0, -0, 256, 256);
			const renderbufferStorageMultisampleError = gl.getError();
			console.info("renderbufferStorageMultisampleError: " + renderbufferStorageMultisampleError);
			expect(renderbufferStorageMultisampleError).assertEqual(gl.INVALID_ENUM);
			done();
		})


		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_1200
		 * @tc.name testTexStorage2D_01
		 * @tc.desc Test texStorage2D.
		 */
		it('testTexStorage2D_01', 0, async function (done) {
			
			console.info('jsWebGL testTexStorage2D_01 test start ...66');
			gl2.texStorage2D(-gl.TEXTURE_2D, -1, -gl.RGB8, -256, -256);
			const texStorage2DError = gl.getError();
			console.info("texStorage2DError: " + texStorage2DError);
			expect(texStorage2DError).assertLarger(gl.NO_ERROR);
			for(let err; (err = gl.getError()) != gl.NO_ERROR;) {}
			done();
		})

		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_1300
		 * @tc.name testTexStorage2D_02
		 * @tc.desc Test texStorage2D.
		 */
		it('testTexStorage2D_02', 0, async function (done) {
			
			console.info('jsWebGL testTexStorage2D_02 test start ...66');
			gl2.texStorage2D(-gl.SRC_ALPHA_SATURATE, -0, -gl.RGB8, 256, -256);
			const texStorage2DError = gl.getError();
			console.info("texStorage2DError: " + texStorage2DError);
			expect(texStorage2DError).assertLarger(gl.NO_ERROR);
			for(let err; (err = gl.getError()) != gl.NO_ERROR;) {}
			done();
		})

		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_1400
		 * @tc.name testTransformFeedbackVaryings_01
		 * @tc.desc Test transformFeedbackVaryings.
		 */
		it('testTransformFeedbackVaryings_01', 0, async function (done) {
			
			console.info('jsWebGL testTransformFeedbackVaryings_01 test start ...66');
			const program = gl.createProgram();
			var transformFeedbackOutputs = ['-gl_Position', 'anotherOutput'];
			gl2.transformFeedbackVaryings(program, transformFeedbackOutputs, -gl.INTERLEAVED_ATTRIBS);
			const transformFeedbackVaryingsError = gl.getError();
			console.info("transformFeedbackVaryingsError: " + transformFeedbackVaryingsError);
			expect(transformFeedbackVaryingsError).assertEqual(gl.INVALID_ENUM);
			done();
		})

		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_1500
		 * @tc.name testTransformFeedbackVaryings_02
		 * @tc.desc Test transformFeedbackVaryings.
		 */
		it('testTransformFeedbackVaryings_02', 0, async function (done) {
			
			console.info('jsWebGL testTransformFeedbackVaryings_02 test start ...66');
			const program = gl.createProgram();
			var transformFeedbackOutputs = [-'gl_Position', -'anotherOutput'];
			gl2.transformFeedbackVaryings(program, transformFeedbackOutputs, gl.ONE_MINUS_DST_COLOR);
			const transformFeedbackVaryingsError = gl.getError();
			console.info("transformFeedbackVaryingsError: " + transformFeedbackVaryingsError);
			expect(transformFeedbackVaryingsError).assertEqual(gl.INVALID_ENUM);
			done();
		})

		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_1600
		 * @tc.name testGetTransformFeedbackVarying_01
		 * @tc.desc Test getTransformFeedbackVarying.
		 */
		it('testGetTransformFeedbackVarying_01', 0, async function (done) {
			
			try {
				console.info('jsWebGL testGetTransformFeedbackVarying_01 test start ...66');
				const programObj = createProgram(gl);
				var getTransformFeedbackVaryingobject = gl2.getTransformFeedbackVarying(-programObj, -
				0);
				console.info("getTransformFeedbackVaryingobject: " + getTransformFeedbackVaryingobject);
				const getTransformFeedbackVaryingError = gl.getError();
				console.info("getTransformFeedbackVaryingError: " + getTransformFeedbackVaryingError);
				expect(getTransformFeedbackVaryingError).assertEqual(gl.NO_ERROR);
				
				done();
			} catch (e) {
				console.log("testGetTransformFeedbackVarying has failed for " + e)
				expect(null).assertFail()
			}
		})

		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_1700
		 * @tc.name testBindBufferBase_01
		 * @tc.desc Test bindBufferBase.
		 */
		it('testBindBufferBase_01', 0, async function (done) {
			
			try {
				console.info('jsWebGL testBindBufferBase_01 test start ...66');
				let buffer = gl.createBuffer();
				gl2.bindBufferBase(-gl.TRANSFORM_FEEDBACK_BUFFER, -0, buffer);
				const bindBufferBaseError = gl.getError();
				console.info("bindBufferBaseError: " + bindBufferBaseError);
				expect(bindBufferBaseError).assertEqual(gl.INVALID_ENUM);
				
				done();
			} catch (e) {
				console.log("bindBufferBaseError has failed for " + e)
				expect(null).assertFail()
			}
		})

		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_1800
		 * @tc.name testBindBufferBase_02
		 * @tc.desc Test bindBufferBase.
		 */
		it('testBindBufferBase_02', 0, async function (done) {
			
			try {
				console.info('jsWebGL testBindBufferBase_02 test start ...66');
				var programobject = gl.createProgram();
				gl2.bindBufferBase(-gl.SRC_ALPHA_SATURATE, -0, programobject);
				const bindBufferBaseError = gl.getError();
				console.info("bindBufferBaseError: " + bindBufferBaseError);
				expect(bindBufferBaseError).assertEqual(gl.INVALID_ENUM);
				
				done();
			} catch (e) {
				console.log("bindBufferBaseError has failed for " + e)
				expect(null).assertFail()
			}
		})

		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_1900
		 * @tc.name testGetTransformFeedbackVarying_02
		 * @tc.desc Test getTransformFeedbackVarying.
		 */
		it('testGetTransformFeedbackVarying_02', 0, async function (done) {
			
			try {
				console.info('jsWebGL testGetTransformFeedbackVarying_02 test start ...66');
				const programObj = gl.createProgram();
				var getTransformFeedbackVaryingobject = gl2.getTransformFeedbackVarying(programObj, 0);
				console.info("getTransformFeedbackVaryingobject: " + getTransformFeedbackVaryingobject);
				const getTransformFeedbackVaryingError = gl.getError();
				console.info("getTransformFeedbackVaryingError: " + getTransformFeedbackVaryingError);
				expect(getTransformFeedbackVaryingError).assertLarger(gl.NO_ERROR);
				
				done();
			} catch (e) {
				console.log("testGetTransformFeedbackVarying has failed for " + e)
				expect(null).assertFail()
			}
		})


		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_2000
		 * @tc.name bindBufferRange
		 * @tc.desc Test bindBufferRange.
		 */
		it('bindBufferRange', 0, async function (done) {
			
			try {
				console.info('jsWebGL bindBufferRange test start ...66');
				const buffer = gl.createBuffer();
				gl2.bindBufferRange(gl.TRANSFORM_FEEDBACK_BUFFER, 1, buffer, 0, 4);
				const bindBufferRangeError = gl.getError();
				console.info("bindBufferRangeError: " + bindBufferRangeError);
				expect(bindBufferRangeError).assertEqual(0);
				
				done();
			} catch (e) {
				console.log("bindBufferRange has failed for " + e)
				expect(null).assertFail()
			}
		})


		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_2100
		 * @tc.name bindBufferRange_01
		 * @tc.desc Test bindBufferRange.
		 */
		it('bindBufferRange_01', 0, async function (done) {
			
			try {
				console.info('jsWebGL bindBufferRange_01 test start ...66');
				const buffer = gl.createBuffer();
				gl2.bindBufferRange(-gl.TRANSFORM_FEEDBACK_BUFFER, -0, buffer, -0, -4);
				const bindBufferRangeError = gl.getError();
				console.info("bindBufferRangeError: " + bindBufferRangeError);
				expect(bindBufferRangeError).assertLarger(gl.NO_ERROR);
				
				done();
			} catch (e) {
				console.log("bindBufferRange has failed for " + e)
				expect(null).assertFail()
			}
		})


		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_2200
		 * @tc.name bindBufferRange_02
		 * @tc.desc Test bindBufferRange.
		 */
		it('bindBufferRange_02', 0, async function (done) {
			
			try {
				console.info('jsWebGL bindBufferRange_01 test start ...66');
				const buffer = gl.createBuffer();
				gl2.bindBufferRange(-gl.TRANSFORM_FEEDBACK_BUFFER, -1, buffer, -0, 4);
				const bindBufferRangeError = gl.getError();
				console.info("bindBufferRangeError: " + bindBufferRangeError);
				expect(bindBufferRangeError).assertEqual(gl.INVALID_ENUM);
				
				done();
			} catch (e) {
				console.log("bindBufferRange has failed for " + e)
				expect(null).assertFail()
			}
		})


		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_2300
		 * @tc.name testIsShader_05
		 * @tc.desc Test isShader.
		 */
		it('testIsShader_05', 0, async function (done) {
			
			console.info('jsWebGL testIsShader_05 test start ...66');
			var programobject = gl.createProgram();
			const isShader = gl.isShader(-0);
			console.info("createShader --> isShader: " + isShader);
			expect(isShader).assertEqual(false);
			done();
		})

		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_2400
		 * @tc.name testLinkProgram_05
		 * @tc.desc Test linkProgram.
		 */
		it('testLinkProgram_05', 0, async function (done) {
			
			console.info('jsWebGL testLinkProgram_05 test start ...66');
			const fragmentShader = gl.createShader(gl.FRAGMENT_SHADER);
			gl.linkProgram(fragmentShader);
			const linkProgramError = gl.getError();
			console.info("linkProgramError: " + linkProgramError);
			expect(linkProgramError).assertEqual(gl.INVALID_OPERATION);
			done();
		})


		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_2500
		 * @tc.name testPauseTransformFeedback_01
		 * @tc.desc Test pauseTransformFeedback.
		 */
		it('testPauseTransformFeedback_01', 0, async function (done) {
			
			try {
				console.info('jsWebGL testPauseTransformFeedback_01 test start ...66');
				const transformFeedback = gl2.createTransformFeedback();
				gl2.bindTransformFeedback(gl.TRANSFORM_FEEDBACK, transformFeedback);
				gl2.beginTransformFeedback(gl2.TRIANGLES);
				gl2.pauseTransformFeedback();
				const pauseTransformFeedbackError = gl.getError();
				console.info("pauseTransformFeedbackError: " + pauseTransformFeedbackError);
				expect(pauseTransformFeedbackError == gl.INVALID_OPERATION).assertEqual(true);
				
				done();
			} catch (e) {
				console.log("testPauseTransformFeedback_01 has failed for " + e)
				expect(null).assertFail()
			}
		})

		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_2600
		 * @tc.name testResumeTransformFeedback_01
		 * @tc.desc Test resumeTransformFeedback.
		 */
		it('testResumeTransformFeedback_01', 0, async function (done) {
			
			try {
				console.info('jsWebGL testResumeTransformFeedback_01 test start ...66');
				gl2.resumeTransformFeedback();
				const resumeTransformFeedbackError = gl.getError();
				console.info("resumeTransformFeedbackError: " + resumeTransformFeedbackError);
				expect(resumeTransformFeedbackError == gl.INVALID_OPERATION).assertEqual(true);
				
				done();
			} catch (e) {
				console.log("testResumeTransformFeedback_01 has failed for " + e)
				expect(null).assertFail()
			}
		});


		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_2700
		 * @tc.name webgl_test_blendEquation2
		 * @tc.desc Test blendEquation.
		 */
		it('webgl_test_blendEquation2', 0, async function (done) {
			
			console.info("webgltest into blendEquation");

			gl.blendEquation(gl.FUNC_REVERSE_SUBTRACT);

			const blendEquationValue = gl.getParameter(gl.BLEND_EQUATION_RGB);
			console.info("blendEquation --> getParameter: " + blendEquationValue);
			expect(blendEquationValue).assertEqual(gl.FUNC_REVERSE_SUBTRACT);

			
			done();
		});


		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_2800
		 * @tc.name webgl_test_activeTexture_01
		 * @tc.desc Test activeTexture_01.
		 */
		it('webgl_test_activeTexture_01', 0, async function (done) {
			
			console.info("webgltest into activeTexture_01");
			gl.activeTexture(gl.TEXTURE2);
			const activeTextureParameter = gl.getParameter(gl.ACTIVE_TEXTURE);
			console.info("webgltest activeTexture_01 --> getParameter: " + activeTextureParameter);
			expect(activeTextureParameter).assertEqual(33986);
			
			done();
		});


		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_2900
		 * @tc.name webgl_test_activeTexture_02
		 * @tc.desc Test activeTexture_02.
		 */
		it('webgl_test_activeTexture_02', 0, async function (done) {
			
			console.info("webgltest into activeTexture_02");
			gl.activeTexture(gl.TEXTURE3);
			const activeTextureParameter = gl.getParameter(gl.ACTIVE_TEXTURE);
			console.info("webgltest activeTexture_02 --> getParameter: " + activeTextureParameter);
			expect(activeTextureParameter).assertEqual(33987);
			
			done();
		});


		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_3000
		 * @tc.name webgl_test_bindAttribLocation
		 * @tc.desc Test bindAttribLocation.
		 */
		it('webgl_test_bindAttribLocation', 0, async function (done) {
			
			console.info("webgltest into bindAttribLocation");

			//顶点着色器程序
			var VSHADER_SOURCE =
				'attribute vec4 a_Position;\n' +
				'void main() {\n' +
				'  gl_Position = a_Position;\n' +
				'}\n';

			// 片元着色器程序
			var FSHADER_SOURCE =
				'precision mediump float;\n' +
				'uniform vec4 u_FragColor;\n' +
				'void main() {\n' +
				'  gl_FragColor = u_FragColor;\n' +
				'}\n';
			var vertexShader = gl.createShader(gl.VERTEX_SHADER);
			gl.shaderSource(vertexShader, VSHADER_SOURCE);
			gl.compileShader(vertexShader);
			var fragmentShader = gl.createShader(gl.FRAGMENT_SHADER);
			gl.shaderSource(fragmentShader, FSHADER_SOURCE);
			gl.compileShader(fragmentShader);
			const programObj = gl.createProgram();
			console.log("testUseProgram has failed for " + programObj)
			const useProgramError1 = gl.getError();
			console.info("useProgramError: " + useProgramError1);
			const renderBufferValue1 = gl.getParameter(gl.CURRENT_PROGRAM);
			console.log("testUseProgram has failed for " + renderBufferValue1)
			gl.attachShader(programObj, vertexShader);
			gl.attachShader(programObj, fragmentShader);
			gl.linkProgram(programObj);
			gl.useProgram(programObj);

			gl.bindAttribLocation(programObj, -1, 'a_Position');

			let errorCode = gl.getError();
			console.info("webgltest bindAttribLocation getError: " + errorCode);
			expect(errorCode).assertEqual(gl.INVALID_VALUE);
			
			done();
		});


		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_3100
		 * @tc.name webgl_test_bindBuffer_2
		 * @tc.desc Test bindBuffer.
		 */
		it('webgl_test_bindBuffer_2', 0, async function (done) {
			
			console.info("webgltest into bindBuffer");

			var buffer = gl.createBuffer();

			gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, buffer);

			//bind后isBuffer为true
			const isBufferValue = gl.isBuffer(buffer);
			console.info("isBufferValue: " + isBufferValue);
			expect(isBufferValue).assertEqual(true);

			
			done();
		});


		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_3200
		 * @tc.name webgl_test_bindTexture_2
		 * @tc.desc Test bindTexture.
		 */
		it('webgl_test_bindTexture_2', 0, async function (done) {
			
			console.info("webgltest into bindTexture");

			var texture = gl.createTexture();

			const isTexture0 = gl.isTexture(texture);
			console.info("createTexture --> isTexture: " + isTexture0);
			expect(isTexture0).assertEqual(false);

			gl.bindTexture(gl.TEXTURE_CUBE_MAP, texture);

			const isTexture1 = gl.isTexture(texture);
			console.info("createTexture --> bindTexture --> isTexture: " + isTexture1);
			expect(isTexture1).assertEqual(true);

			
			done();
		});


		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_3300
		 * @tc.name webgl_test_blendEquation__2
		 * @tc.desc Test blendEquation.
		 */
		it('webgl_test_blendEquation__2', 0, async function (done) {
			
			console.info("webgltest into blendEquation");

			gl.blendEquation(gl.FUNC_ADD);

			const blendEquationValue = gl.getParameter(gl.BLEND_EQUATION_RGB);
			console.info("blendEquation --> getParameter: " + blendEquationValue);
			expect(blendEquationValue).assertEqual(32774);

			
			done();
		});


		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_3400
		 * @tc.name webgl_test_blendEquation_3
		 * @tc.desc Test blendEquation.
		 */
		it('webgl_test_blendEquation_3', 0, async function (done) {
			
			console.info("webgltest into blendEquation");

			gl.blendEquation(gl.FUNC_SUBTRACT);

			const blendEquationValue = gl.getParameter(gl.BLEND_EQUATION_RGB);
			console.info("blendEquation --> getParameter: " + blendEquationValue);
			expect(blendEquationValue).assertEqual(gl.FUNC_SUBTRACT);

			
			done();
		});


		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_3500
		 * @tc.name webgl_test_blendEquationSeparate_2
		 * @tc.desc Test blendEquationSeparate.
		 */
		it('webgl_test_blendEquationSeparate_2', 0, async function (done) {
			
			console.info("webgltest into blendEquationSeparate");
			gl.blendEquationSeparate(gl.FUNC_ADD, gl.FUNC_REVERSE_SUBTRACT);

			const blendEquationSeparateValue = gl.getParameter(gl.BLEND_EQUATION_RGB);
			console.info("blendEquationSeparate --> getParameter: " + blendEquationSeparateValue);
			expect(blendEquationSeparateValue).assertEqual(gl.FUNC_ADD);

			
			done();
		});


		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_3600
		 * @tc.name webgl_test_blendEquationSeparate_3
		 * @tc.desc Test blendEquationSeparate.
		 */
		it('webgl_test_blendEquationSeparate_3', 0, async function (done) {
			
			console.info("webgltest into blendEquationSeparate");
			gl.blendEquationSeparate(gl.FUNC_SUBTRACT, gl.FUNC_REVERSE_SUBTRACT);

			const blendEquationSeparateValue = gl.getParameter(gl.BLEND_EQUATION_RGB);
			console.info("blendEquationSeparate --> getParameter: " + blendEquationSeparateValue);
			expect(blendEquationSeparateValue).assertEqual(gl.FUNC_SUBTRACT);

			
			done();
		});


		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_3700
		 * @tc.name webgl_test_blendFunc_2
		 * @tc.desc Test blendFunc.
		 */
		it('webgl_test_blendFunc_2', 0, async function (done) {
			
			console.info("webgltest into blendFunc");

			gl.enable(gl.BLEND);

			gl.blendFunc(gl.ZERO, gl.ONE);

			const blendFuncValue = gl.getParameter(gl.BLEND_SRC_RGB);
			console.info("blendFunc --> getParameter: " + blendFuncValue);
			expect(blendFuncValue).assertEqual(gl.ZERO);

			
			done();
		});


		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_3800
		 * @tc.name webgl_test_blendFunc_3
		 * @tc.desc Test blendFunc.
		 */
		it('webgl_test_blendFunc_3', 0, async function (done) {
			
			console.info("webgltest into blendFunc");

			gl.enable(gl.BLEND);

			gl.blendFunc(gl.SRC_ALPHA, gl.DST_ALPHA);

			const blendFuncValue = gl.getParameter(gl.BLEND_SRC_RGB);
			console.info("blendFunc --> getParameter: " + blendFuncValue);
			expect(blendFuncValue).assertEqual(gl.SRC_ALPHA);

			
			done();
		});


		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_3900
		 * @tc.name webgl_test_blendFuncSeparate_2
		 * @tc.desc Test blendFuncSeparate.
		 */
		it('webgl_test_blendFuncSeparate_2', 0, async function (done) {
			
			console.info("webgltest into blendFuncSeparate");

			gl.enable(gl.BLEND);

			gl.blendFuncSeparate(gl.DST_ALPHA, gl.CONSTANT_COLOR, gl.CONSTANT_ALPHA, gl
				.ONE_MINUS_CONSTANT_ALPHA);

			const blendFuncSeparateParameter = gl.getParameter(gl.BLEND_SRC_RGB)
			console.info("blendFuncSeparate --> getParameter: " + blendFuncSeparateParameter);
			expect(blendFuncSeparateParameter).assertEqual(gl.DST_ALPHA);

			
			done();
		});


		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_4000
		 * @tc.name webgl_test_blendFuncSeparate_3
		 * @tc.desc Test blendFuncSeparate.
		 */
		it('webgl_test_blendFuncSeparate_3', 0, async function (done) {
			
			console.info("webgltest into blendFuncSeparate");

			gl.enable(gl.BLEND);

			gl.blendFuncSeparate(gl.SRC_ALPHA, gl.ONE_MINUS_SRC_ALPHA, gl.DST_ALPHA, gl
				.ONE_MINUS_DST_ALPHA);

			const blendFuncSeparateParameter = gl.getParameter(gl.BLEND_SRC_RGB)
			console.info("blendFuncSeparate --> getParameter: " + blendFuncSeparateParameter);
			expect(blendFuncSeparateParameter).assertEqual(gl.SRC_ALPHA);

			
			done();
		});


		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_4100
		 * @tc.name webgl_test_checkFramebufferStatus22
		 * @tc.desc Test checkFramebufferStatus.
		 */
		it('webgl_test_checkFramebufferStatus22', 0, async function (done) {
			
			console.info("webgltest into checkFramebufferStatus");

			var framebuffer = gl.createFramebuffer();
			gl.bindFramebuffer(gl.FRAMEBUFFER, framebuffer);

			const checkFramebufferStatus = gl.checkFramebufferStatus(gl.FRAMEBUFFER);
			console.info("createFramebuffer --> bindFramebuffer --> checkFramebufferStatus: " +
			checkFramebufferStatus);
			expect(checkFramebufferStatus).assertEqual(gl.FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT);

			
			done();
		});


		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_4200
		 * @tc.name webgl_test_clear_2
		 * @tc.desc Test clear.
		 */
		it('webgl_test_clear_2', 0, async function (done) {
			
			console.info("webgltest into clear");
			gl.clear(gl.DEPTH_BUFFER_BIT);
			var float32Array = new Float32Array([0, 0, 0, 0]);
			const clearParameter = gl.getParameter(gl.DEPTH_CLEAR_VALUE);
			console.info("webgltest clear getParameter: " + clearParameter);
			expect(typeof (clearParameter)).assertEqual('number');
			
			done();
		});


		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_4300
		 * @tc.name webgl_test_clear_3
		 * @tc.desc Test clear.
		 */
		it('webgl_test_clear_3', 0, async function (done) {
			
			console.info("webgltest into clear");
			gl.clear(gl.STENCIL_BUFFER_BIT);
			var float32Array = new Float32Array([0, 0, 0, 0]);
			const clearParameter = gl.getParameter(gl.STENCIL_CLEAR_VALUE);
			console.info("webgltest clear getParameter: " + clearParameter);
			expect(typeof (clearParameter)).assertEqual('number');
			
			done();
		});


		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_4400
		 * @tc.name webgl_test_clearColor_2
		 * @tc.desc Test clearColor.
		 */
		it('webgl_test_clearColor_2', 0, async function (done) {
			
			console.info("webgltest into clearColor");
			gl.clearColor(1, 3, 0.5, 3);

			const clearColorParameter = gl.getParameter(gl.COLOR_CLEAR_VALUE);

			var float32ArrayValue = new Float32Array([1, 3, 0.5, 3]);

			console.info("webgltest clearColor: " + clearColorParameter);
			expect(clearColorParameter.toString()).assertEqual(float32ArrayValue.toString());
			
			done();
		});


		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_4500
		 * @tc.name webgl_test_copyTexImage2D_2
		 * @tc.desc Test copyTexImage2D.
		 */
		it('webgl_test_copyTexImage2D_2', 0, async function (done) {
			
			console.info("webgltest into copyTexImage2D");
			gl.copyTexImage2D(gl.TEXTURE_CUBE_MAP_POSITIVE_X, 0, gl.ALPHA, 0, 0, 512, 512, 0);
			let errorCode = gl.getError();
			console.info("webgltest copyTexImage2D getError: " + errorCode);
			expect(errorCode).assertEqual(gl.INVALID_FRAMEBUFFER_OPERATION);

			
			done();
		});


		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_4600
		 * @tc.name webgl_test_copyTexImage2D_3
		 * @tc.desc Test copyTexImage2D.
		 */
		it('webgl_test_copyTexImage2D_3', 0, async function (done) {
			
			console.info("webgltest into copyTexImage2D");
			gl.copyTexImage2D(gl.TEXTURE_CUBE_MAP_POSITIVE_Y, 0, gl.LUMINANCE, 0, 0, 512, 512, 0);
			let errorCode = gl.getError();
			console.info("webgltest copyTexImage2D getError: " + errorCode);
			expect(errorCode).assertEqual(gl.INVALID_FRAMEBUFFER_OPERATION);

			
			done();
		});


		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_4700
		 * @tc.name webgl_test_copyTexSubImage2D_2
		 * @tc.desc Test copyTexSubImage2D.
		 */
		it('webgl_test_copyTexSubImage2D_2', 0, async function (done) {
			
			console.info("webgltest into copyTexSubImage2D");

			gl.copyTexSubImage2D(gl.TEXTURE_CUBE_MAP_POSITIVE_X, 0, 0, 0, 0, 0, 16, 16);
			let errorCode = gl.getError();
			console.info("webgltest copyTexSubImage2D getError: " + errorCode);
			expect(errorCode).assertLarger(gl.NO_ERROR);
			for(let err; (err = gl.getError()) != gl.NO_ERROR;) {}
			
			done();
		});


		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_4800
		 * @tc.name webgl_test_copyTexSubImage2D_3
		 * @tc.desc Test copyTexSubImage2D.
		 */
		it('webgl_test_copyTexSubImage2D_3', 0, async function (done) {
			
			console.info("webgltest into copyTexSubImage2D");

			gl.copyTexSubImage2D(gl.TEXTURE_CUBE_MAP_NEGATIVE_Y, 0, 0, 0, 0, 0, 16, 16);
			let errorCode = gl.getError();
			console.info("webgltest copyTexSubImage2D getError: " + errorCode);
			expect(errorCode).assertLarger(gl.NO_ERROR);
			for(let err; (err = gl.getError()) != gl.NO_ERROR;) {}
			
			done();
		});


		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_4900
		 * @tc.name webgl_test_copyTexSubImage2D_4
		 * @tc.desc Test copyTexSubImage2D.
		 */
		it('webgl_test_copyTexSubImage2D_4', 0, async function (done) {
			
			console.info("webgltest into copyTexSubImage2D");

			gl.copyTexSubImage2D(gl.TEXTURE_CUBE_MAP_POSITIVE_Z, 0, 0, 0, 0, 0, 16, 16);
			let errorCode = gl.getError();
			console.info("webgltest copyTexSubImage2D getError: " + errorCode);
			expect(errorCode).assertLarger(gl.NO_ERROR);
			for(let err; (err = gl.getError()) != gl.NO_ERROR;) {}
			
			done();
		});


		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_5000
		 * @tc.name webgl_test_createShader_2
		 * @tc.desc Test createShader.
		 */
		it('webgl_test_createShader_2', 0, async function (done) {
			
			console.info("webgltest into createShader");

			const shader = gl.createShader(gl.FRAGMENT_SHADER);
			const isShader = gl.isShader(shader);
			console.info("webgltest createShader isShader: " + isShader);
			expect(isShader).assertEqual(true);

			
			done();
		});


		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_5100
		 * @tc.name webgl_test_disable_22
		 * @tc.desc Test disable.
		 */
		it('webgl_test_disable_22', 0, async function (done) {
			
			console.info("webgltest into disable");
			gl.enable(gl.BLEND);
			const isEnabled2 = gl.isEnabled(gl.BLEND);
			// true
			console.info("webgltest disable isEnabled2: " + isEnabled2);
			expect(isEnabled2).assertEqual(true);

			gl.disable(gl.BLEND);
			// 要检查功能是否被禁用，请使用以下WebGLRenderingContext.isEnabled()方法：
			const isEnabled = gl.isEnabled(gl.BLEND);
			// false
			console.info("webgltest disable isEnabled: " + isEnabled);
			expect(isEnabled).assertEqual(false);

			
			done();
		});


		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_5200
		 * @tc.name webgl_test_disable_23
		 * @tc.desc Test disable.
		 */
		it('webgl_test_disable_23', 0, async function (done) {
			
			console.info("webgltest into disable");
			gl.enable(gl.BLEND);
			const isEnabled2 = gl.isEnabled(gl.BLEND);
			// true
			console.info("webgltest disable isEnabled2: " + isEnabled2);
			expect(isEnabled2).assertEqual(true);

			gl.disable(gl.BLEND);
			// 要检查功能是否被禁用，请使用以下WebGLRenderingContext.isEnabled()方法：
			const isEnabled = gl.isEnabled(gl.BLEND);
			// false
			console.info("webgltest disable isEnabled: " + isEnabled);
			expect(isEnabled).assertEqual(false);

			
			done();
		});


		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_5300
		 * @tc.name webgl_test_disable_24
		 * @tc.desc Test disable.
		 */
		it('webgl_test_disable_24', 0, async function (done) {
			
			console.info("webgltest into disable");
			gl.enable(gl.DEPTH_TEST);
			const isEnabled2 = gl.isEnabled(gl.DEPTH_TEST);
			// true
			console.info("webgltest disable isEnabled2: " + isEnabled2);
			expect(isEnabled2).assertEqual(true);

			gl.disable(gl.DEPTH_TEST);
			// 要检查功能是否被禁用，请使用以下WebGLRenderingContext.isEnabled()方法：
			const isEnabled = gl.isEnabled(gl.DEPTH_TEST);
			// false
			console.info("webgltest disable isEnabled: " + isEnabled);
			expect(isEnabled).assertEqual(false);

			
			done();
		});


		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_5400
		 * @tc.name webgl_test_disable_25
		 * @tc.desc Test disable.
		 */
		it('webgl_test_disable_25', 0, async function (done) {
			
			console.info("webgltest into disable");
			gl.enable(gl.POLYGON_OFFSET_FILL);
			const isEnabled2 = gl.isEnabled(gl.POLYGON_OFFSET_FILL);
			// true
			console.info("webgltest disable isEnabled2: " + isEnabled2);
			expect(isEnabled2).assertEqual(true);

			gl.disable(gl.POLYGON_OFFSET_FILL);
			// 要检查功能是否被禁用，请使用以下WebGLRenderingContext.isEnabled()方法：
			const isEnabled = gl.isEnabled(gl.POLYGON_OFFSET_FILL);
			// false
			console.info("webgltest disable isEnabled: " + isEnabled);
			expect(isEnabled).assertEqual(false);

			
			done();
		});


		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_5500
		 * @tc.name webgl_test_disable_26
		 * @tc.desc Test disable.
		 */
		it('webgl_test_disable_26', 0, async function (done) {
			
			console.info("webgltest into disable");
			gl.enable(gl.SCISSOR_TEST);
			const isEnabled2 = gl.isEnabled(gl.SCISSOR_TEST);
			// true
			console.info("webgltest disable isEnabled2: " + isEnabled2);
			expect(isEnabled2).assertEqual(true);

			gl.disable(gl.SCISSOR_TEST);
			// 要检查功能是否被禁用，请使用以下WebGLRenderingContext.isEnabled()方法：
			const isEnabled = gl.isEnabled(gl.SCISSOR_TEST);
			// false
			console.info("webgltest disable isEnabled: " + isEnabled);
			expect(isEnabled).assertEqual(false);

			
			done();
		});


		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_5600
		 * @tc.name webgl_test_disableVertexAttribArray_2
		 * @tc.desc Test disableVertexAttribArray.
		 */
		it('webgl_test_disableVertexAttribArray_2', 0, async function (done) {
			
			console.info("webgltest into disableVertexAttribArray");
			gl.disableVertexAttribArray(-1);
			let errorCode = gl.getError();
			console.info("webgltest disableVertexAttribArray getError: " + errorCode);
			expect(errorCode).assertEqual(gl.INVALID_VALUE);
			
			done();
		});


		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_5700
		 * @tc.name webgl_test_drawArrays2
		 * @tc.desc Test drawArrays.
		 */
		it('webgl_test_drawArrays2', 0, async function (done) {
			
			console.info("webgltest into drawArrays");

			gl.drawArrays(gl.LINE_STRIP, 0, 8);
			let errorCode = gl.getError();
			console.info("webgltest drawArrays getError: " + errorCode);
			expect(errorCode).assertEqual(gl.INVALID_FRAMEBUFFER_OPERATION);

			
			done();
		});


		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_5800
		 * @tc.name webgl_test_drawArrays3
		 * @tc.desc Test drawArrays.
		 */
		it('webgl_test_drawArrays3', 0, async function (done) {
			
			console.info("webgltest into drawArrays");

			gl.drawArrays(gl.LINE_LOOP, 0, 8);
			let errorCode = gl.getError();
			console.info("webgltest drawArrays getError: " + errorCode);
			expect(errorCode).assertEqual(gl.INVALID_FRAMEBUFFER_OPERATION);

			
			done();
		});


		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_5900
		 * @tc.name webgl_test_drawArrays4
		 * @tc.desc Test drawArrays.
		 */
		it('webgl_test_drawArrays4', 0, async function (done) {
			
			console.info("webgltest into drawArrays");

			gl.drawArrays(gl.LINES, 0, 8);
			let errorCode = gl.getError();
			console.info("webgltest drawArrays getError: " + errorCode);
			expect(errorCode).assertEqual(gl.INVALID_FRAMEBUFFER_OPERATION);

			
			done();
		});


		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_6000
		 * @tc.name webgl_test_drawArrays5
		 * @tc.desc Test drawArrays.
		 */
		it('webgl_test_drawArrays5', 0, async function (done) {
			
			console.info("webgltest into drawArrays");

			gl.drawArrays(gl.TRIANGLE_STRIP, 0, 8);
			let errorCode = gl.getError();
			console.info("webgltest drawArrays getError: " + errorCode);
			expect(errorCode).assertEqual(gl.INVALID_FRAMEBUFFER_OPERATION);

			
			done();
		});


		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_6100
		 * @tc.name webgl_test_drawArrays6
		 * @tc.desc Test drawArrays.
		 */
		it('webgl_test_drawArrays6', 0, async function (done) {
			
			console.info("webgltest into drawArrays");

			gl.drawArrays(gl.TRIANGLE_FAN, 0, 8);
			let errorCode = gl.getError();
			console.info("webgltest drawArrays getError: " + errorCode);
			expect(errorCode).assertEqual(gl.INVALID_FRAMEBUFFER_OPERATION);

			
			done();
		});


		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_6200
		 * @tc.name webgl_test_drawArrays7
		 * @tc.desc Test drawArrays.
		 */
		it('webgl_test_drawArrays7', 0, async function (done) {
			
			console.info("webgltest into drawArrays");

			gl.drawArrays(gl.TRIANGLES, 0, 8);
			let errorCode = gl.getError();
			console.info("webgltest drawArrays getError: " + errorCode);
			expect(errorCode).assertEqual(gl.INVALID_FRAMEBUFFER_OPERATION);

			
			done();
		});


		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_6300
		 * @tc.name webgl_test_drawElements22
		 * @tc.desc Test drawElements.
		 */
		it('webgl_test_drawElements22', 0, async function (done) {
			
			console.info("webgltest into drawElements");


			// 初始化着色器
			if (!initShaders(gl, VSHADER_SOURCE, FSHADER_SOURCE)) {
				console.log('Failed to intialize shaders.');
				return;
			}

			// 设置顶点位置
			var n = initVertexBuffers(gl);
			if (n < 0) {
				console.log('Failed to set the positions of the vertices');
				return;
			}

			var viewPortParameter = gl.getParameter(gl.MAX_VIEWPORT_DIMS);
			console.log('viewPortParameter: ' + viewPortParameter);

			const isContextLostValue = gl.isContextLost();
			console.info("isContextLostValue: " + isContextLostValue);

			// 指定清空<canvas>的颜色
			gl.clearColor(0.0, 0.0, 0.0, 1.0);

			// 清空<canvas>
			// COLOR_BUFFER_BIT	0x00004000
			gl.clear(gl.COLOR_BUFFER_BIT);

			console.info("indices.length: " + indices.length)
			gl.drawElements(gl.TRIANGLES, indices.length, gl.UNSIGNED_SHORT, 0);

			let errorCode = gl.getError();
			console.info("webgltest drawArrays getError: " + errorCode);
			expect(errorCode).assertLarger(gl.NO_ERROR);
			
			done();
		});


		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_6400
		 * @tc.name webgl_test_drawElements23
		 * @tc.desc Test drawElements.
		 */
		it('webgl_test_drawElements23', 0, async function (done) {
			
			console.info("webgltest into drawElements");


			// 初始化着色器
			if (!initShaders(gl, VSHADER_SOURCE, FSHADER_SOURCE)) {
				console.log('Failed to intialize shaders.');
				return;
			}

			// 设置顶点位置
			var n = initVertexBuffers(gl);
			if (n < 0) {
				console.log('Failed to set the positions of the vertices');
				return;
			}

			var viewPortParameter = gl.getParameter(gl.MAX_VIEWPORT_DIMS);
			console.log('viewPortParameter: ' + viewPortParameter);

			const isContextLostValue = gl.isContextLost();
			console.info("isContextLostValue: " + isContextLostValue);

			// 指定清空<canvas>的颜色
			gl.clearColor(0.0, 0.0, 0.0, 1.0);

			// 清空<canvas>
			// COLOR_BUFFER_BIT	0x00004000
			gl.clear(gl.COLOR_BUFFER_BIT);

			console.info("indices.length: " + indices.length)
			gl.drawElements(gl.TRIANGLES, indices.length, gl.UNSIGNED_SHORT, 0);

			let errorCode = gl.getError();
			console.info("webgltest drawArrays getError: " + errorCode);
			expect(errorCode).assertLarger(gl.NO_ERROR);
			
			done();
		});


		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_6500
		 * @tc.name webgl_test_drawElements24
		 * @tc.desc Test drawElements.
		 */
		it('webgl_test_drawElements24', 0, async function (done) {
			
			console.info("webgltest into drawElements");


			// 初始化着色器
			if (!initShaders(gl, VSHADER_SOURCE, FSHADER_SOURCE)) {
				console.log('Failed to intialize shaders.');
				return;
			}

			// 设置顶点位置
			var n = initVertexBuffers(gl);
			if (n < 0) {
				console.log('Failed to set the positions of the vertices');
				return;
			}

			var viewPortParameter = gl.getParameter(gl.MAX_VIEWPORT_DIMS);
			console.log('viewPortParameter: ' + viewPortParameter);

			const isContextLostValue = gl.isContextLost();
			console.info("isContextLostValue: " + isContextLostValue);

			// 指定清空<canvas>的颜色
			gl.clearColor(0.0, 0.0, 0.0, 1.0);

			// 清空<canvas>
			// COLOR_BUFFER_BIT	0x00004000
			gl.clear(gl.COLOR_BUFFER_BIT);

			console.info("indices.length: " + indices.length)
			gl.drawElements(gl.TRIANGLES, indices.length, gl.UNSIGNED_SHORT, 0);

			let errorCode = gl.getError();
			console.info("webgltest drawArrays getError: " + errorCode);
			expect(errorCode).assertLarger(gl.NO_ERROR);
			
			done();
		});


		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_6600
		 * @tc.name webgl_test_enable
		 * @tc.desc Test enable.
		 */
		it('webgl_test_enable', 0, async function (done) {
			
			console.info("webgltest into enable");

			gl.enable(gl.BLEND);

			const isEnabled = gl.isEnabled(gl.BLEND);
			// true
			console.info("webgltest enable isEnabled: " + isEnabled);
			expect(isEnabled).assertEqual(true);

			
			done();
		});

		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_6700
		 * @tc.name webgl_test_enable22
		 * @tc.desc Test enable.
		 */
		it('webgl_test_enable22', 0, async function (done) {
			
			console.info("webgltest into enable");

			gl.enable(gl.CULL_FACE);

			const isEnabled = gl.isEnabled(gl.CULL_FACE);
			// true
			console.info("webgltest enable isEnabled: " + isEnabled);
			expect(isEnabled).assertEqual(true);

			
			done();
		});

		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_6800
		 * @tc.name webgl_test_enable23
		 * @tc.desc Test enable.
		 */
		it('webgl_test_enable23', 0, async function (done) {
			
			console.info("webgltest into enable");

			gl.enable(gl.DEPTH_TEST);

			const isEnabled = gl.isEnabled(gl.DEPTH_TEST);
			// true
			console.info("webgltest enable isEnabled: " + isEnabled);
			expect(isEnabled).assertEqual(true);

			
			done();
		});

		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_6900
		 * @tc.name webgl_test_enable24
		 * @tc.desc Test enable.
		 */
		it('webgl_test_enable24', 0, async function (done) {
			
			console.info("webgltest into enable");

			gl.enable(gl.DITHER);

			const isEnabled = gl.isEnabled(gl.DITHER);
			// true
			console.info("webgltest enable isEnabled: " + isEnabled);
			expect(isEnabled).assertEqual(true);

			
			done();
		});

		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_7000
		 * @tc.name webgl_test_enable25
		 * @tc.desc Test enable.
		 */
		it('webgl_test_enable25', 0, async function (done) {
			
			console.info("webgltest into enable");

			gl.enable(gl.POLYGON_OFFSET_FILL);

			const isEnabled = gl.isEnabled(gl.POLYGON_OFFSET_FILL);
			// true
			console.info("webgltest enable isEnabled: " + isEnabled);
			expect(isEnabled).assertEqual(true);

			
			done();
		});

		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_7100
		 * @tc.name webgl_test_enable26
		 * @tc.desc Test enable.
		 */
		it('webgl_test_enable26', 0, async function (done) {
			
			console.info("webgltest into enable");

			gl.enable(gl.SAMPLE_ALPHA_TO_COVERAGE);

			const isEnabled = gl.isEnabled(gl.SAMPLE_ALPHA_TO_COVERAGE);
			// true
			console.info("webgltest enable isEnabled: " + isEnabled);
			expect(isEnabled).assertEqual(true);

			
			done();
		});

		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_7200
		 * @tc.name webgl_test_enable27
		 * @tc.desc Test enable.
		 */
		it('webgl_test_enable27', 0, async function (done) {
			
			console.info("webgltest into enable");

			gl.enable(gl.SAMPLE_COVERAGE);

			const isEnabled = gl.isEnabled(gl.SAMPLE_COVERAGE);
			// true
			console.info("webgltest enable isEnabled: " + isEnabled);
			expect(isEnabled).assertEqual(true);

			
			done();
		});

		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_7300
		 * @tc.name webgl_test_enable28
		 * @tc.desc Test enable.
		 */
		it('webgl_test_enable28', 0, async function (done) {
			
			console.info("webgltest into enable");

			gl.enable(gl.SCISSOR_TEST);

			const isEnabled = gl.isEnabled(gl.SCISSOR_TEST);
			// true
			console.info("webgltest enable isEnabled: " + isEnabled);
			expect(isEnabled).assertEqual(true);

			
			done();
		});

		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_7400
		 * @tc.name webgl_test_enable29
		 * @tc.desc Test enable.
		 */
		it('webgl_test_enable29', 0, async function (done) {
			
			console.info("webgltest into enable");

			gl.enable(gl.STENCIL_TEST);

			const isEnabled = gl.isEnabled(gl.STENCIL_TEST);
			// true
			console.info("webgltest enable isEnabled: " + isEnabled);
			expect(isEnabled).assertEqual(true);

			
			done();
		});


		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_7500
		 * @tc.name webgl_test_framebufferRenderbuffer22
		 * @tc.desc Test framebufferRenderbuffer.
		 */
		it('webgl_test_framebufferRenderbuffer22', 0, async function (done) {
			
			console.info("webgltest into framebufferRenderbuffer");

			const renderbuffer = gl.createRenderbuffer();
			gl.framebufferRenderbuffer(gl.DRAW_FRAMEBUFFER, gl.COLOR_ATTACHMENT0, gl.RENDERBUFFER,
				renderbuffer);

			let errorCode = gl.getError();
			console.info("webgltest framebufferRenderbuffer getError: " + errorCode);
			expect(errorCode).assertEqual(gl.NO_ERROR);
			
			done();
		});


		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_7600
		 * @tc.name webgl_test_framebufferRenderbuffer23
		 * @tc.desc Test framebufferRenderbuffer.
		 */
		it('webgl_test_framebufferRenderbuffer23', 0, async function (done) {
			
			console.info("webgltest into framebufferRenderbuffer");

			const renderbuffer = gl.createRenderbuffer();
			gl.framebufferRenderbuffer(gl.DRAW_FRAMEBUFFER, gl.DEPTH_ATTACHMENT, gl.RENDERBUFFER,
				renderbuffer);

			let errorCode = gl.getError();
			console.info("webgltest framebufferRenderbuffer getError: " + errorCode);
			expect(errorCode).assertEqual(gl.NO_ERROR);
			
			done();
		});


		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_7700
		 * @tc.name webgl_test_framebufferRenderbuffer24
		 * @tc.desc Test framebufferRenderbuffer.
		 */
		it('webgl_test_framebufferRenderbuffer24', 0, async function (done) {
			
			console.info("webgltest into framebufferRenderbuffer");

			const renderbuffer = gl.createRenderbuffer();
			gl.framebufferRenderbuffer(gl.DRAW_FRAMEBUFFER, gl.DEPTH_STENCIL_ATTACHMENT, gl
				.RENDERBUFFER, renderbuffer);

			let errorCode = gl.getError();
			console.info("webgltest framebufferRenderbuffer getError: " + errorCode);
			expect(errorCode).assertEqual(gl.NO_ERROR);
			
			done();
		});


		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_7800
		 * @tc.name webgl_test_framebufferRenderbuffer25
		 * @tc.desc Test framebufferRenderbuffer.
		 */
		it('webgl_test_framebufferRenderbuffer25', 0, async function (done) {
			
			console.info("webgltest into framebufferRenderbuffer");

			const renderbuffer = gl.createRenderbuffer();
			gl.framebufferRenderbuffer(gl.DRAW_FRAMEBUFFER, gl.STENCIL_ATTACHMENT, gl.RENDERBUFFER,
				renderbuffer);

			let errorCode = gl.getError();
			console.info("webgltest framebufferRenderbuffer getError: " + errorCode);
			expect(errorCode).assertEqual(gl.NO_ERROR);
			
			done();
		});


		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_7900
		 * @tc.name webgl_test_framebufferTexture2D22
		 * @tc.desc Test framebufferTexture2D.
		 */
		it('webgl_test_framebufferTexture2D22', 0, async function (done) {
			
			console.info("webgltest into framebufferTexture2D");
			const texture = gl.createTexture();
			gl.framebufferTexture2D(gl.DRAW_FRAMEBUFFER, gl.DEPTH_ATTACHMENT, gl.TEXTURE_2D, texture,
				0);

			let errorCode = gl.getError();
			console.info("webgltest framebufferTexture2D getError: " + errorCode);
			expect(errorCode).assertEqual(gl.NO_ERROR);

			
			done();
		});


		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_8000
		 * @tc.name webgl_test_framebufferTexture2D23
		 * @tc.desc Test framebufferTexture2D.
		 */
		it('webgl_test_framebufferTexture2D23', 0, async function (done) {
			
			console.info("webgltest into framebufferTexture2D");
			const texture = gl.createTexture();
			gl.framebufferTexture2D(gl.DRAW_FRAMEBUFFER, gl.STENCIL_ATTACHMENT, gl.TEXTURE_2D, texture,
				0);

			let errorCode = gl.getError();
			console.info("webgltest framebufferTexture2D getError: " + errorCode);
			expect(errorCode).assertEqual(gl.NO_ERROR);

			
			done();
		});


		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_8100
		 * @tc.name webgl_test_framebufferTexture2D24
		 * @tc.desc Test framebufferTexture2D.
		 */
		it('webgl_test_framebufferTexture2D24', 0, async function (done) {
			
			console.info("webgltest into framebufferTexture2D");
			const texture = gl.createTexture();
			gl.framebufferTexture2D(gl.DRAW_FRAMEBUFFER, gl.COLOR_ATTACHMENT0, gl
				.TEXTURE_CUBE_MAP_POSITIVE_X, texture, 0);

			let errorCode = gl.getError();
			console.info("webgltest framebufferTexture2D getError: " + errorCode);
			expect(errorCode).assertEqual(gl.NO_ERROR);

			
			done();
		});


		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_8200
		 * @tc.name webgl_test_framebufferTexture2D25
		 * @tc.desc Test framebufferTexture2D.
		 */
		it('webgl_test_framebufferTexture2D25', 0, async function (done) {
			
			console.info("webgltest into framebufferTexture2D");
			const texture = gl.createTexture();
			gl.framebufferTexture2D(gl.DRAW_FRAMEBUFFER, gl.COLOR_ATTACHMENT0, gl
				.TEXTURE_CUBE_MAP_POSITIVE_Y, texture, 0);

			let errorCode = gl.getError();
			console.info("webgltest framebufferTexture2D getError: " + errorCode);
			expect(errorCode).assertEqual(gl.NO_ERROR);

			
			done();
		});


		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_8300
		 * @tc.name webgl_test_framebufferTexture2D26
		 * @tc.desc Test framebufferTexture2D.
		 */
		it('webgl_test_framebufferTexture2D26', 0, async function (done) {
			
			console.info("webgltest into framebufferTexture2D");
			const texture = gl.createTexture();
			gl.framebufferTexture2D(gl.DRAW_FRAMEBUFFER, gl.COLOR_ATTACHMENT0, gl
				.TEXTURE_CUBE_MAP_POSITIVE_Z, texture, 0);

			let errorCode = gl.getError();
			console.info("webgltest framebufferTexture2D getError: " + errorCode);
			expect(errorCode).assertEqual(gl.NO_ERROR);

			
			done();
		});


		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_8400
		 * @tc.name webgl_test_framebufferTexture2D27
		 * @tc.desc Test framebufferTexture2D.
		 */
		it('webgl_test_framebufferTexture2D27', 0, async function (done) {
			
			console.info("webgltest into framebufferTexture2D");
			const texture = gl.createTexture();
			gl.framebufferTexture2D(gl.DRAW_FRAMEBUFFER, gl.COLOR_ATTACHMENT0, gl.TEXTURE_2D, texture,
				0);

			let errorCode = gl.getError();
			console.info("webgltest framebufferTexture2D getError: " + errorCode);
			expect(errorCode).assertEqual(gl.NO_ERROR);

			
			done();
		});


		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_8500
		 * @tc.name webgl_test_drawBuffers22
		 * @tc.desc Test drawBuffers.
		 */
		it('webgl_test_drawBuffers22', 0, async function (done) {
			
			console.info("webgltest into drawBuffers");

			gl2.drawBuffers([gl2.BACK, gl2.COLOR_ATTACHMENT2]);

			let errorCode = gl.getError();
			console.info("webgltest drawBuffers getError: " + errorCode);
			expect(errorCode).assertEqual(gl.NO_ERROR);
			
			done();
		});


		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_8600
		 * @tc.name webgl_test_drawBuffers23
		 * @tc.desc Test drawBuffers.
		 */
		it('webgl_test_drawBuffers23', 0, async function (done) {
			
			console.info("webgltest into drawBuffers");

			gl2.drawBuffers([gl2.NONE, gl2.COLOR_ATTACHMENT3]);

			let errorCode = gl.getError();
			console.info("webgltest drawBuffers getError: " + errorCode);
			expect(errorCode).assertEqual(gl.NO_ERROR);
			
			done();
		});


		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_8700
		 * @tc.name webgl_test_drawBuffers24
		 * @tc.desc Test drawBuffers.
		 */
		it('webgl_test_drawBuffers24', 0, async function (done) {
			
			console.info("webgltest into drawBuffers");

			gl2.drawBuffers([gl2.BACK, gl2.COLOR_ATTACHMENT4]);

			let errorCode = gl.getError();
			console.info("webgltest drawBuffers getError: " + errorCode);
			expect(errorCode).assertEqual(gl.NO_ERROR);
			
			done();
		});


		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_8800
		 * @tc.name webgl_test_drawBuffers25
		 * @tc.desc Test drawBuffers.
		 */
		it('webgl_test_drawBuffers25', 0, async function (done) {
			
			console.info("webgltest into drawBuffers");

			gl2.drawBuffers([gl2.NONE, gl2.COLOR_ATTACHMENT5]);

			let errorCode = gl.getError();
			console.info("webgltest drawBuffers getError: " + errorCode);
			expect(errorCode).assertEqual(gl.NO_ERROR);
			
			done();
		});

		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_8900
		 * @tc.name webgl_test_drawBuffers26
		 * @tc.desc Test drawBuffers.
		 */
		it('webgl_test_drawBuffers26', 0, async function (done) {
			
			console.info("webgltest into drawBuffers");

			gl2.drawBuffers([gl2.BACK, gl2.COLOR_ATTACHMENT6]);

			let errorCode = gl.getError();
			console.info("webgltest drawBuffers getError: " + errorCode);
			expect(errorCode).assertEqual(gl.NO_ERROR);
			
			done();
		});


		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_9000
		 * @tc.name webgl_test_clearBufferfv22
		 * @tc.desc Test clearBufferfv.
		 */
		it('webgl_test_clearBufferfv22', 0, async function (done) {
			
			console.info("webgltest into clearBufferfv");

			gl2.clearBufferfv(gl.DEPTH, 0, [0.0, 0.0, 0.0, 0.0]);

			let errorCode = gl.getError();
			console.info("webgltest webgl_test_clearBufferfv getError: " + errorCode);
			expect(errorCode).assertEqual(gl.NO_ERROR);
			
			done();
		});


		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_9100
		 * @tc.name webgl_test_clearBufferfv_22
		 * @tc.desc Test clearBufferfv.
		 */
		it('webgl_test_clearBufferfv_22', 0, async function (done) {
			
			console.info("webgltest into clearBufferfv");

			gl2.clearBufferfv(gl.STENCIL, 0, [0.0, 0.0, 0.0, 0.0]);

			let errorCode = gl.getError();
			console.info("webgltest webgl_test_clearBufferfv getError: " + errorCode);
			expect(errorCode).assertEqual(gl.NO_ERROR);
			for(let err; (err = gl.getError()) != gl.NO_ERROR;) {}
			
			done();
		});


		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_9200
		 * @tc.name webgl_test_clearBufferfv23
		 * @tc.desc Test clearBufferfv.
		 */
		it('webgl_test_clearBufferfv23', 0, async function (done) {
			
			console.info("webgltest into clearBufferfv");

			gl2.clearBufferfv(gl.DEPTH_STENCIL, 0, [0.0, 0.0, 0.0, 0.0]);

			let errorCode = gl.getError();
			console.info("webgltest webgl_test_clearBufferfv getError: " + errorCode);
			expect(errorCode).assertLarger(gl.NO_ERROR);
			for(let err; (err = gl.getError()) != gl.NO_ERROR;) {}
			
			done();
		});


		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_9300
		 * @tc.name webgl_test_clearBufferiv22
		 * @tc.desc Test clearBufferiv.
		 */
		it('webgl_test_clearBufferiv22', 0, async function (done) {
			
			console.info("webgltest into clearBufferiv");

			gl2.clearBufferiv(gl.DEPTH, 0, new Int32Array([0, 1, 0, 0.5]));

			let errorCode = gl.getError();
			console.info("webgltest clearBufferiv getError: " + errorCode);
			expect(errorCode).assertEqual(gl.NO_ERROR);
			
			done();
		});


		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_9400
		 * @tc.name webgl_test_clearBufferiv23
		 * @tc.desc Test clearBufferiv.
		 */
		it('webgl_test_clearBufferiv23', 0, async function (done) {
			
			console.info("webgltest into clearBufferiv");

			gl2.clearBufferiv(gl.STENCIL, 0, new Int32Array([0, 1, 0, 0.5]));

			let errorCode = gl.getError();
			console.info("webgltest clearBufferiv getError: " + errorCode);
			expect(errorCode).assertEqual(gl.NO_ERROR);
			
			done();
		});

		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_9500
		 * @tc.name webgl_test_clearBufferiv24
		 * @tc.desc Test clearBufferiv.
		 */
		it('webgl_test_clearBufferiv24', 0, async function (done) {
			
			console.info("webgltest into clearBufferiv");

			gl2.clearBufferiv(gl.DEPTH_STENCIL, 0, new Int32Array([0, 1, 0, 0.5]));

			let errorCode = gl.getError();
			console.info("webgltest clearBufferiv getError: " + errorCode);
			expect(errorCode).assertEqual(gl.NO_ERROR);
			
			done();
		});

		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_9600
		 * @tc.name webgl_test_clearBufferuiv23
		 * @tc.desc Test clearBufferuiv.
		 */
		it('webgl_test_clearBufferuiv23', 0, async function (done) {
			
			console.info("webgltest into clearBufferuiv");

			gl2.clearBufferuiv(gl.DEPTH, 0, new Uint32Array([0, 1, 0, 0]));

			let errorCode = gl.getError();
			console.info("webgltest clearBufferuiv getError: " + errorCode);
			expect(errorCode).assertEqual(gl.NO_ERROR);
			
			done();
		});

		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_9700
		 * @tc.name webgl_test_clearBufferuiv24
		 * @tc.desc Test clearBufferuiv.
		 */
		it('webgl_test_clearBufferuiv24', 0, async function (done) {
			
			console.info("webgltest into clearBufferuiv");

			gl2.clearBufferuiv(gl.STENCIL, 0, new Uint32Array([0, 1, 0, 0]));

			let errorCode = gl.getError();
			console.info("webgltest clearBufferuiv getError: " + errorCode);
			expect(errorCode).assertEqual(gl.NO_ERROR);
			
			done();
		});


		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_9800
		 * @tc.name webgl_test_clearBufferuiv25
		 * @tc.desc Test clearBufferuiv.
		 */
		it('webgl_test_clearBufferuiv25', 0, async function (done) {
			
			console.info("webgltest into clearBufferuiv");

			gl2.clearBufferuiv(gl.DEPTH_STENCIL, 0, new Uint32Array([0, 1, 0, 0]));

			let errorCode = gl.getError();
			console.info("webgltest clearBufferuiv getError: " + errorCode);
			expect(errorCode).assertEqual(gl.NO_ERROR);
			
			done();
		});


		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_9900
		 * @tc.name webgl_test_clearBufferfi22
		 * @tc.desc Test clearBufferfi.
		 */
		it('webgl_test_clearBufferfi22', 0, async function (done) {
			
			console.info("webgltest into clearBufferfi");

			gl2.clearBufferfi(gl.DEPTH, 0, 1.0, 0);

			let errorCode = gl.getError();
			console.info("webgltest clearBufferfi getError: " + errorCode);
			expect(errorCode).assertEqual(gl.NO_ERROR);
			
			done();
		});


		/**
		 * @tc.number SUB_BASIC_GRAPHICS_SPECIAL_XTS_WEBGL_08_9901
		 * @tc.name webgl_test_clearBufferfi23
		 * @tc.desc Test clearBufferfi.
		 */
		it('webgl_test_clearBufferfi23', 0, async function (done) {
			
			console.info("webgltest into clearBufferfi");

			gl2.clearBufferfi(gl.STENCIL, 0, 1.0, 0);

			let errorCode = gl.getError();
			console.info("webgltest clearBufferfi getError: " + errorCode);
			expect(errorCode).assertEqual(gl.NO_ERROR);
			
			done();
		});
	})
}