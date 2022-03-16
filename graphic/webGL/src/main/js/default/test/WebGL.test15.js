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
import webgl from "@ohos.webglnapi";
import Context from '@ohos.napi_context'

import {
	describe,
	beforeAll,
	beforeEach,
	afterEach,
	afterAll,
	it,
	expect
} from 'deccjsunit/index'

describe('webgl1Test', function() {
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
	beforeAll(async function(done) {
		console.info('webgltest beforeAll called');
		initContext();
		done();
	});

	/**
	 * run after testClass
	 */
	afterAll(async function(done) {
		console.info('webgltest afterEach called');
		deleteContext();
		done();
	})

	/**
	 * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TESTWEBGL_0136
	 * @tc.name webgl_test_endTransformFeedback
	 * @tc.desc Test endTransformFeedback.
	 */
	it('webgl_test_endTransformFeedback', 0, async function(done) {
		//initContext();
		console.info("webgltest into endTransformFeedback");
		let transformFeedback = gl2.createTransformFeedback();
		gl2.bindTransformFeedback(gl2.TRANSFORM_FEEDBACK, transformFeedback);
		gl2.beginTransformFeedback(gl.TRIANGLES);
		gl.drawArrays(gl.TRIANGLES, 0, 3);
		gl2.endTransformFeedback();
		let errorCode = gl.getError();
		console.info("webgltest framebufferTexture2D getError: " + errorCode);
		expect(errorCode).assertEqual(gl.NO_ERROR);
		//deleteContext();
		done();
	});

	/**
	 * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TESTWEBGL_0194
	 * @tc.name testGetProgramParameterFirst
	 * @tc.desc Test getProgramParameter.
	 */
	it('testGetProgramParameterFirst', 0, async function(done) {
		//initContext();
		console.info('jsWebGL getProgramParameter test start ...' + JSON.stringify(gl));
		const program = gl.createProgram();
		gl.deleteProgram(program);
		const deleteStatus = gl.getProgramParameter(program, gl.DELETE_STATUS);
		console.info('deleteStatus' + deleteStatus);
		expect(deleteStatus).assertEqual(true);
		done();
	});


	/**
	 * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TESTWEBGL_0195
	 * @tc.name testGetProgramParameterSecond
	 * @tc.desc Test getProgramParameter.
	 */
	it('testGetProgramParameterSecond', 0, async function(done) {
		//initContext();
		console.info('jsWebGL getProgramParameter test start ...' + JSON.stringify(gl));
		const program = gl.createProgram();
		gl.deleteProgram(program);
		gl.linkProgram(program);
		const linkStatus = gl.getProgramParameter(program, gl.LINK_STATUS);
		console.info('linkStatus' + linkStatus);
		expect(linkStatus).assertEqual(true);
		done();
	});

	/**
	 * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TESTWEBGL_0196
	 * @tc.name testGetProgramParameterThird
	 * @tc.desc Test getProgramParameter.
	 */
	it('testGetProgramParameterThird', 0, async function(done) {
		//initContext();
		console.info('jsWebGL getProgramParameter test start ...' + JSON.stringify(gl));
		const program = gl.createProgram();
		gl.deleteProgram(program);
		gl.linkProgram(program);
		gl.validateProgram(program);
		const validateStatus = gl.getProgramParameter(program, gl.VALIDATE_STATUS);
		console.info('validateStatus' + validateStatus);
		expect(validateStatus).assertEqual(true);
		done();
	});

	/**
	 * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TESTWEBGL_0205
	 * @tc.name testGetShaderParameterFirst
	 * @tc.desc Test getShaderParameter.
	 */
	it('testGetShaderParameterFirst', 0, async function(done) {
		//initContext();
		console.info('jsWebGL getShaderParameter test start ...' + JSON.stringify(gl));
		const vertexShader = gl.createShader(gl.VERTEX_SHADER);
		//        const fragmentShader = gl.createShader(gl.FRAGMENT_SHADER);
		gl.deleteShader(vertexShader);
		const deleteStatus = gl.getShaderParameter(vertexShader, gl.DELETE_STATUS);
		console.info('deleteStatus' + deleteStatus);
		expect(deleteStatus).assertEqual(true);
		done();
	});

	/**
	 * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TESTWEBGL_0220
	 * @tc.name testGetParameter3
	 * @tc.desc Test getParameter.
	 */
	it('testGetParameter3', 0, async function(done) {
		//initContext();
		console.info('jsWebGL getParameter test start ...' + JSON.stringify(gl));
		const buffer = gl.getParameter(gl.ARRAY_BUFFER_BINDING);
		console.info("buffer: " + buffer);
		gl.bindBuffer(gl.ARRAY_BUFFER, buffer);
		const isBuffer = gl.isBuffer(buffer);
		console.info("isBuffer: " + isBuffer);
		expect(isBuffer).assertEqual(true);
		done();
	});

	
	/**
	 * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TESTWEBGL_0231
	 * @tc.name testGetVertexAttribFirst
	 * @tc.desc Test getVertexAttrib.
	 */
	it('testGetVertexAttribFirst', 0, async function(done) {
		//initContext();
		console.info('jsWebGL getVertexAttrib test start ...' + JSON.stringify(gl));
		const vertexBuffer = gl.createBuffer();
		gl.bindBuffer(gl.ARRAY_BUFFER, vertexBuffer);
		const shaderProgram = globalFunction();
		const aVertexPosition = gl.getAttribLocation(shaderProgram, "a_position");

		gl.enableVertexAttribArray(aVertexPosition);
		gl.vertexAttribPointer(aVertexPosition, 3, gl.FLOAT, false, 20, 0);

		gl.drawArrays(gl.TRIANGLES, 0, 8);
		gl.vertexAttrib1f(0, 2.8);
		const type = gl.getVertexAttrib(0, gl.VERTEX_ATTRIB_ARRAY_ENABLED);
		console.info("getVertexAttrib: type" + type);
		expect(type).assertEqual(true);
		done();
	});

	/**
	 * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TESTWEBGL_0268
	 * @tc.name testGetShaderSourceError
	 * @tc.desc Test getShaderSource.
	 */
	it('testGetShaderSourceError', 0, async function(done) {
		//initContext();
		console.info('jsWebGL getShaderSource test start ...' + JSON.stringify(gl));
		var shader = gl.createShader(gl.VERTEX_SHADER);

		var source = gl.getShaderSource(shader);
		console.info("getShaderSource source: " + source);
		expect(source).assertEqual();
		done();
	});

	/**
	 * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TESTWEBGL_0273
	 * @tc.name testGetActiveUniformBlockName
	 * @tc.desc Test getActiveUniformBlockName.
	 */
	it('testGetActiveUniformBlockName', 0, async function(done) {
		//initContext();
		console.info('jsWebGL2 getActiveUniformBlockName test start ...' + JSON.stringify(gl2));
		const program = gl.createProgram();
		const blockIndex = gl2.getUniformBlockIndex(program, 'UBOData');
		console.info("getActiveUniformBlockName blockIndex" + blockIndex);

		gl2.uniformBlockBinding(program, blockIndex, 1);
		const blockName = gl2.getActiveUniformBlockName(program, blockIndex);
		console.info("blockName" + blockName);
		expect(blockName).assertEqual('UBOData');
		done();
	});

	/**
	 * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TESTWEBGL_0274
	 * @tc.name testUniformBlockBinding
	 * @tc.desc Test uniformBlockBinding.
	 */
	it('testUniformBlockBinding', 0, async function(done) {
		//initContext();
		console.info('jsWebGL2 uniformBlockBinding test start ...' + JSON.stringify(gl2));
		const program = gl.createProgram();
		const blockIndex = gl2.getUniformBlockIndex(program, 'UBOData');
		gl2.uniformBlockBinding(program, blockIndex, 1);
		const blockName = gl2.getActiveUniformBlockName(program, blockIndex);
		console.info("blockName" + blockName);

		expect(blockName).assertEqual('UBOData');
		done();
	});

	/**
	 * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TESTWEBGL_0365
	 * @tc.name testIsProgram_04
	 * @tc.desc Test isProgram.
	 */
	it('testIsProgram_04', 0, async function(done) {
		//initContext();
		console.info('jsWebGL testIsProgram_04 test start ...66');
		var texture = gl.createTexture();
		const programError = gl.getError();
		console.info("createProgram --> programError: " + programError);
		const isProgram = gl.isProgram(texture);
		console.info("createProgram --> isProgram: " + isProgram);
		expect(isProgram).assertEqual(true);
		done();
	})

	/**
	 * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TESTWEBGL_0370
	 * @tc.name testIsRenderbuffer_04
	 * @tc.desc Test isRenderbuffer.
	 */
	it('testIsRenderbuffer_04', 0, async function(done) {
		//initContext();
		console.info('jsWebGL testIsRenderbuffer_04 test start ...66');
		var texture = gl.createTexture();
		const isrenderbuffer = gl.isRenderbuffer(texture);
		console.info("createRenderbuffer --> isRenderbuffer: " + isrenderbuffer);
		expect(isrenderbuffer).assertEqual(true);
		done();
	})

	/**
	 * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TESTWEBGL_0381
	 * @tc.name testGetShaderParameter_1
	 * @tc.desc Test getShaderParameter.
	 */
	it('testGetShaderParameter_1', 0, async function(done) {
		//initContext();
		console.info('jsWebGL getShaderParameter test start ...' + JSON.stringify(gl));
		const vertexShader = gl.createShader(gl.VERTEX_SHADER);
		//        const fragmentShader = gl.createShader(gl.FRAGMENT_SHADER);
		gl.deleteShader(vertexShader);
		const shaderType = gl.getShaderParameter(vertexShader, gl.SHADER_TYPE);
		console.info('shaderType' + shaderType);
		expect(shaderType).assertEqual(120);
		done();
	});

	/**
	 * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TESTWEBGL_0386
	 * @tc.name testLinkProgram_01
	 * @tc.desc Test linkProgram.
	 */
	it('testLinkProgram_01', 0, async function(done) {
		//initContext();
		console.info('jsWebGL testLinkProgram_01 test start ...66');
		var renderbuffer = gl.createRenderbuffer();
		gl.linkProgram(renderbuffer);
		const linkProgramError = gl.getError();
		console.info("linkProgramError: " + linkProgramError);
		expect(linkProgramError).assertEqual(0);
		done();
	})

	/**
	 * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TESTWEBGL_0387
	 * @tc.name testLinkProgram_02
	 * @tc.desc Test linkProgram.
	 */
	it('testLinkProgram_02', 0, async function(done) {
		//initContext();
		console.info('jsWebGL testLinkProgram_02 test start ...66');
		const framebuffer = gl.createFramebuffer();
		gl.linkProgram(framebuffer);
		const linkProgramError = gl.getError();
		console.info("linkProgramError: " + linkProgramError);
		expect(linkProgramError).assertEqual(0);
		done();
	})

	/**
	 * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TESTWEBGL_0445
	 * @tc.name testUniform3fv_3
	 * @tc.desc Test uniform3fv.
	 */
	it('testUniform3fv_3', 0, async function(done) {
		//initContext();
		console.info('jsWebGL testUniform3fv_3 test start ...66');
		const renderbuffer = gl.createRenderbuffer();
		const uniformlocationObj = gl.getUniformLocation(renderbuffer, "a_Position");
		const flaot32list = new Float32Array([1, 2]);
		gl.uniform3fv(uniformlocationObj, flaot32list);
		const uniform3fvError = gl.getError();
		console.info("uniform3fvError: " + uniform3fvError);
		expect(uniform3fvError).assertEqual(gl.NO_ERROR);
		done();
	})

	/**
	 * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TESTWEBGL_0449
	 * @tc.name testUniform4fv_02
	 * @tc.desc Test uniform4fv.
	 */
	it('testUniform4fv_02', 0, async function(done) {
		//initContext();
		console.info('jsWebGL testUniform4fv_02 test start ...66');
		const renderbuffer = gl.createRenderbuffer();
		const uniformlocationObj = gl.getUniformLocation(renderbuffer, "a_Position");
		const flaot32list = new Float32Array([1, 2]);
		gl.uniform4fv(uniformlocationObj, flaot32list);
		const uniform4fvError = gl.getError();
		console.info("uniform4fvError: " + uniform4fvError);
		expect(uniform4fvError).assertEqual(gl.INVALID_OPERATION);
		done();
	})

	/**
	 * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TESTWEBGL_0460
	 * @tc.name testUniform2iv_03
	 * @tc.desc Test uniform2iv.
	 */
	it('testUniform2iv_03', 0, async function(done) {
		//initContext();
		console.info('jsWebGL testUniform2iv_03 test start ...66');
		const framebuffer = gl.createFramebuffer();
		const uniformlocationObj = gl.getUniformLocation(framebuffer, "a_Position");
		const int32list = new Int32Array([1, 2]);
		gl.uniform2iv(uniformlocationObj, int32list);
		const uniform2ivError = gl.getError();
		console.info("testUniform2ivError: " + uniform2ivError);
		expect(uniform2ivError).assertEqual(gl.NO_ERROR);
		done();
	})

	/**
	 * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TESTWEBGL_0464
	 * @tc.name testUniform3iv_02
	 * @tc.desc Test uniform3iv.
	 */
	it('testUniform3iv_02', 0, async function(done) {
		//initContext();
		console.info('jsWebGL testUniform3iv_02 test start ...66');
		const renderbuffer = gl.createRenderbuffer();
		const uniformlocationObj = gl.getUniformLocation(renderbuffer, "a_Position");
		const int32list = new Int32Array([1, 2]);
		gl.uniform3iv(uniformlocationObj, int32list);
		const uniform3ivError = gl.getError();
		console.info("testUniform3ivError: " + uniform3ivError);
		expect(uniform3ivError).assertEqual(gl.NO_ERROR);
		done();
	})

	/**
	 * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TESTWEBGL_0474
	 * @tc.name testUniformMatrix2fv_02
	 * @tc.desc Test uniformMatrix2fv.
	 */
	it('testUniformMatrix2fv_02', 0, async function(done) {
		//initContext();
		console.info('jsWebGL testUniformMatrix2fv_02 test start ...66');
		const buffer = gl.createBuffer();
		const uniformlocationObj = gl.getUniformLocation(buffer, "a_Position1");
		const flaot32list = new Float32Array([1, 2]);
		gl.uniformMatrix2fv(uniformlocationObj, true, flaot32list);
		const uniformMatrix2fvError = gl.getError();
		console.info("uniformMatrix2fvError: " + uniformMatrix2fvError);
		expect(uniformMatrix2fvError).assertEqual(gl.NO_ERROR);
		done();
	})

	/**
	 * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TESTWEBGL_0501
	 * @tc.name testReadBuffer
	 * @tc.desc Test readBuffer.
	 */
	it('testReadBuffer', 0, async function(done) {
		//initContext();
		console.info('jsWebGL testReadBuffer test start ...66');
		console.info('jsWebGL testReadBuffer test start ...' + JSON.stringify(gl));
		gl2.readBuffer(gl.COLOR_ATTACHMENT0);
		const readBufferError = gl.getError();
		console.info("readBufferError: " + readBufferError);
		expect(readBufferError).assertEqual(0);
		done();
	})

	/**
	 * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TESTWEBGL_0507
	 * @tc.name testGetTransformFeedbackVarying
	 * @tc.desc Test getTransformFeedbackVarying.
	 */
	it('testGetTransformFeedbackVarying', 0, async function(done) {
		//initContext();
		try {
			console.info('jsWebGL testGetTransformFeedbackVarying test start ...66');
			console.info('jsWebGL testGetTransformFeedbackVarying test start ...' + JSON.stringify(
				gl));
			const programObj = createProgram(gl);
			const programError = gl.getError();
			console.info("programError: " + programError);
			var getTransformFeedbackVaryingobject = gl2.getTransformFeedbackVarying(programObj, 0);
			console.info("getTransformFeedbackVaryingobject: " + getTransformFeedbackVaryingobject);
			const getTransformFeedbackVaryingError = gl.getError();
			console.info("getTransformFeedbackVaryingError: " + getTransformFeedbackVaryingError);
			expect(getTransformFeedbackVaryingError).assertEqual(gl.NO_ERROR);
			//deleteContext();
			done();
		} catch (e) {
			console.log("testGetTransformFeedbackVarying has failed for " + e)
			expect(null).assertFail()
		}
	})

	/**
	 * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TESTWEBGL_0526
	 * @tc.name testGetActiveUniforms_07
	 * @tc.desc Test getActiveUniforms.
	 */
	it('testGetActiveUniforms_07', 0, async function(done) {
		//initContext();
		try {
			console.info('jsWebGL testGetActiveUniforms_07 test start ...66');
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
			const uniformIndices = [-1, -2, -3];
			const uniformOffset = gl2.getActiveUniforms(programObj, uniformIndices, gl2
				.UNIFORM_IS_ROW_MAJOR)
			const glintlist = [-1, false, false];
			//判断数据值是否正确
			expect(uniformOffset.toString() != glintlist.toString()).assertEqual(true);
			//deleteContext();
			done();
		} catch (e) {
			console.log("testGetActiveUniforms_07 has failed for " + e)
			expect(null).assertFail()
		}
		done();
	})

	/**
	 * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TESTWEBGL_0610
	 * @tc.name webgl_test_blendFunc2
	 * @tc.desc Test blendFunc.
	 */
	it('webgl_test_blendFunc2', 0, async function(done) {
		//initContext();
		console.info("webgltest into blendFunc");

		gl.enable(gl.BLEND);

		gl.blendFunc(gl.SRC_COLOR);

		const blendFuncValue = gl.getParameter(gl.BLEND_SRC_RGB);
		console.info("blendFunc --> getParameter: " + blendFuncValue);
		expect(blendFuncValue).assertEqual(gl.SRC_COLOR);

		//deleteContext();
		done();
	});

	/**
	 * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TESTWEBGL_0611
	 * @tc.name webgl_test_blendFuncSeparate2
	 * @tc.desc Test blendFuncSeparate.
	 */
	it('webgl_test_blendFuncSeparate2', 0, async function(done) {
		//initContext();
		console.info("webgltest into blendFuncSeparate");

		gl.enable(gl.BLEND);

		gl.blendFuncSeparate(gl.SRC_COLOR, gl.DST_COLOR, gl.ONE);

		const blendFuncSeparateParameter = gl.getParameter(gl.BLEND_SRC_RGB)
		console.info("blendFuncSeparate --> getParameter: " + blendFuncSeparateParameter);
		expect(blendFuncSeparateParameter).assertEqual(gl.SRC_COLOR);

		//deleteContext();
		done();
	});

	/**
	 * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TESTWEBGL_0612
	 * @tc.name webgl_test_checkFramebufferStatus22
	 * @tc.desc Test checkFramebufferStatus.
	 */
	it('webgl_test_checkFramebufferStatus22', 0, async function(done) {
		//initContext();
		console.info("webgltest into checkFramebufferStatus");

		//        var framebuffer = gl.createFramebuffer();
		gl.bindFramebuffer(gl.FRAMEBUFFER, 'framebuffer');

		const checkFramebufferStatus = gl.checkFramebufferStatus(gl.FRAMEBUFFER);
		console.info("createFramebuffer --> bindFramebuffer --> checkFramebufferStatus: " +
			checkFramebufferStatus);
		expect(checkFramebufferStatus).assertEqual(gl.FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT);

		//deleteContext();
		done();
	});

	/**
	 * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TESTWEBGL_0619
	 * @tc.name webgl_test_colorMask22
	 * @tc.desc Test colorMask.
	 */
	it('webgl_test_colorMask22', 0, async function(done) {
		//initContext();
		console.info("webgltest into colorMask");

		gl.colorMask(true, true, 2, false);
		// 要获取当前的颜色掩码，请查询COLOR_WRITEMASK返回Array.
		const colorMaskValue = gl.getParameter(gl.COLOR_WRITEMASK);
		// [true, true, true, false]
		console.info("webgltest colorMask --> getParameter: " + colorMaskValue);

		expect(colorMaskValue.toString()).assertEqual('true,true,true,false');
		//deleteContext();
		done();
	});

	/**
	 * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TESTWEBGL_0621
	 * @tc.name webgl_test_compileShader2
	 * @tc.desc Test compileShader.
	 */
	it('webgl_test_compileShader2', 0, async function(done) {
		//initContext();
		console.info("webgltest into compileShader");

		var shader = gl.createShader(gl.VERTEX_SHADER);
		gl.shaderSource(shader, 1);
		gl.compileShader(shader);

		let errorCode = gl.getError();
		console.info("webgltest compileShader getError: " + errorCode);
		expect(errorCode).assertEqual(gl.INVALID_FRAMEBUFFER_OPERATION);

		//deleteContext();
		done();
	});

	/**
	 * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TESTWEBGL_0631
	 * @tc.name webgl_test_createQuery2
	 * @tc.desc Test createQuery.
	 */
	it('webgl_test_createQuery2', 0, async function(done) {
		//initContext();
		console.info("webgltest into createQuery");

		const query = gl2.createQuery('error');
		gl2.beginQuery(0x8C2F, query);

		const currentQuery = gl2.getQuery(0x8C2F, 0x8865);
		const isQuery = gl2.isQuery(currentQuery);

		console.info("webgltest createQuery isQuery: " + isQuery);
		expect(isQuery).assertEqual(false);
		//deleteContext();
		done();
	});

	/**
	 * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TESTWEBGL_0632
	 * @tc.name webgl_test_beginQuery2
	 * @tc.desc Test beginQuery.
	 */
	it('webgl_test_beginQuery2', 0, async function(done) {
		//initContext();
		console.info("webgltest into beginQuery");

		var query = gl2.createQuery();
		gl2.beginQuery(0x8C2F, 'query');

		const currentQuery = gl2.getQuery(0x8C2F, 0x8865);
		const isQuery1 = gl2.isQuery(currentQuery);
		console.info("webgltest createQuery isQuery1: " + isQuery1);
		expect(isQuery1).assertEqual(false);
		//deleteContext();
		done();
	});

	/**
	 * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TESTWEBGL_0633
	 * @tc.name webgl_test_deleteQuery2
	 * @tc.desc Test deleteQuery.
	 */
	it('webgl_test_deleteQuery2', 0, async function(done) {
		//initContext();
		console.info("webgltest into deleteQuery");

		var query = gl2.createQuery();
		gl2.beginQuery(0x8C2F, query);

		const currentQuery = gl2.getQuery(0x8C2F, 0x8865);
		const isQuery1 = gl2.isQuery(currentQuery);
		console.info("webgltest createQuery isQuery1: " + isQuery1);
		expect(isQuery1).assertEqual(false);

		gl2.deleteQuery('currentQuery');

		const isQuery2 = gl2.isQuery(currentQuery);
		console.info("webgltest createQuery deleteQuery isQuery2: " + isQuery2);

		expect(isQuery2).assertEqual(false);
		//deleteContext();
		done();
	});

	/**
	 * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TESTWEBGL_0634
	 * @tc.name webgl_test_beginQuery22
	 * @tc.desc Test beginQuery.
	 */
	it('webgl_test_beginQuery22', 0, async function(done) {
		//initContext();
		console.info("webgltest into beginQuery");

		var query = gl2.createQuery();
		gl2.beginQuery(0x8C2F, 'query');

		const currentQuery = gl2.getQuery(0x8C2F, 0x8865);
		const isQuery1 = gl2.isQuery(currentQuery);
		console.info("webgltest createQuery isQuery1: " + isQuery1);
		expect(isQuery1).assertEqual(false);
		//deleteContext();
		done();
	});

	/**
	 * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TESTWEBGL_0635
	 * @tc.name webgl_test_endQuery2
	 * @tc.desc Test endQuery.
	 */
	it('webgl_test_endQuery2', 0, async function(done) {
		//initContext();
		console.info("webgltest into endQuery");

		var query = gl2.createQuery();
		gl2.beginQuery(0x8C2F, query);

		const currentQuery = gl2.getQuery(0x8C2F, 0x8865);
		const isQuery1 = gl2.isQuery(currentQuery);
		console.info("webgltest createQuery isQuery1: " + isQuery1);
		expect(isQuery1).assertEqual(false);

		gl2.endQuery('0x8C2F');

		const isQuery2 = gl2.isQuery(currentQuery);
		console.info("webgltest createQuery isQuery2: " + isQuery2);
		expect(isQuery2).assertEqual(false);

		//deleteContext();
		done();
	});

	/**
	 * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TESTWEBGL_0636
	 * @tc.name webgl_test_getQueryParameter22
	 * @tc.desc Test getQueryParameter.
	 */
	it('webgl_test_getQueryParameter22', 0, async function(done) {
		//initContext();
		console.info("webgltest into getQueryParameter");
		var query = gl2.createQuery();
		gl2.beginQuery(0x8C2F, query);

		var currentQuery = gl2.getQuery(0x8C2F, 0x8865);
		const isQuery1 = gl2.isQuery(currentQuery);
		console.info("webgltest createQuery isQuery1: " + isQuery1);
		expect(isQuery1).assertEqual(false);

		// 返回一个GLboolean 指示查询结果是否可用。
		var result = gl2.getQueryParameter(currentQuery, '0x8867');

		console.info("webgltest createQuery beginQuery getQueryParameter: " + result);
		expect(result).assertEqual(undefined);
		//deleteContext();
		done();
	});

	/**
	 * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TESTWEBGL_0801
	 * @tc.name webgl_test_clearBufferfi24
	 * @tc.desc Test clearBufferfi.
	 */
	it('webgl_test_clearBufferfi24', 0, async function(done) {
		//initContext();
		console.info("webgltest into clearBufferfi");

		gl2.clearBufferfi(gl.DEPTH_STENCIL, 0, 1.0, 0);

		let errorCode = gl.getError();
		console.info("webgltest clearBufferfi getError: " + errorCode);
		expect(errorCode).assertEqual(gl.INVALID_FRAMEBUFFER_OPERATION);
		//deleteContext();
		done();
	});

	/**
	 * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TESTWEBGL_0803
	 * @tc.name webgl_test_beginQuery23
	 * @tc.desc Test beginQuery.
	 */
	it('webgl_test_beginQuery23', 0, async function(done) {
		//initContext();
		console.info("webgltest into beginQuery");

		var query = gl2.createQuery();
		gl2.beginQuery(0x8D6A, query);

		const currentQuery = gl2.getQuery(gl2.ANY_SAMPLES_PASSED_CONSERVATIVE, gl2.CURRENT_QUERY);
		//        const currentQuery = gl2.getQuery(0x8D6A, 0x8865);
		const isQuery1 = gl2.isQuery(currentQuery);
		console.info("webgltest createQuery isQuery1: " + isQuery1);
		expect(isQuery1).assertEqual(false);
		//deleteContext();
		done();
	});

	/**
	 * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TESTWEBGL_0804
	 * @tc.name webgl_test_endQuery23
	 * @tc.desc Test endQuery.
	 */
	it('webgl_test_endQuery23', 0, async function(done) {
		//initContext();
		console.info("webgltest into endQuery");

		var query = gl2.createQuery();
		gl2.beginQuery(gl2.ANY_SAMPLES_PASSED_CONSERVATIVE, query);

		const currentQuery = gl2.getQuery(gl2.ANY_SAMPLES_PASSED_CONSERVATIVE, gl2.CURRENT_QUERY);
		const isQuery1 = gl2.isQuery(currentQuery);
		console.info("webgltest createQuery isQuery1: " + isQuery1);
		expect(isQuery1).assertEqual(false);

		gl2.endQuery(0x8C2F);

		const isQuery2 = gl2.isQuery(currentQuery);
		console.info("webgltest createQuery isQuery2: " + isQuery2);
		expect(isQuery2).assertEqual(false);

		//deleteContext();
		done();
	});

	/**
	 * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TESTWEBGL_0806
	 * @tc.name webgl_test_getQuery23
	 * @tc.desc Test endQuery.
	 */
	it('webgl_test_getQuery23', 0, async function(done) {
		//initContext();
		console.info("webgltest into endQuery");

		var query = gl2.createQuery();
		gl2.beginQuery(gl2.ANY_SAMPLES_PASSED_CONSERVATIVE, query);

		const currentQuery = gl2.getQuery(gl2.ANY_SAMPLES_PASSED_CONSERVATIVE, gl2.CURRENT_QUERY);
		const isQuery1 = gl2.isQuery(currentQuery);
		console.info("webgltest createQuery isQuery1: " + isQuery1);
		expect(isQuery1).assertEqual(false);

		gl2.endQuery(0x8C2F);

		const isQuery2 = gl2.isQuery(currentQuery);
		console.info("webgltest createQuery isQuery2: " + isQuery2);
		expect(isQuery2).assertEqual(false);

		//deleteContext();
		done();
	});

	/**
	 * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TESTWEBGL_0923
	 * @tc.name testCopyBufferSubData_1_01
	 * @tc.desc Test copyBufferSubData.
	 */
	it('testCopyBufferSubData_1_01', 0, async function(done) {
		//initContext();
		console.info('jsWebGL testCopyBufferSubData_1_01 test start ...66');
		const srcBuffer = gl.createBuffer();
		const dstBuffer = gl.createBuffer();
		const vertices = [1, 2];
		const data = new Float32Array(vertices);
		const length = vertices.length * 4;
		gl.bindBuffer(gl.ARRAY_BUFFER, srcBuffer);
		gl.bufferData(gl.ARRAY_BUFFER, data, gl.STATIC_DRAW);
		gl.bindBuffer(gl.COPY_READ_BUFFER, srcBuffer);
		gl.bindBuffer(gl.ARRAY_BUFFER, dstBuffer);
		gl.bufferData(gl.ARRAY_BUFFER, new Float32Array(length), gl.STATIC_DRAW);
		gl2.copyBufferSubData(gl.ELEMENT_ARRAY_BUFFER, gl.ARRAY_BUFFER, 0, 0, length);
		const copyBufferSubDataError = gl.getError();
		console.info("copyBufferSubDataError: " + copyBufferSubDataError);
		expect(copyBufferSubDataError).assertEqual(gl.INVALID_VALUE);
		done();
	})

	/**
	 * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TESTWEBGL_0930
	 * @tc.name testGetBufferSubData_1_01
	 * @tc.desc Test getBufferSubData.
	 */
	it('testGetBufferSubData_1_01', 0, async function(done) {
		//initContext();
		console.info('jsWebGL testGetBufferSubData_1_01 test start ...66');
		var buffer = gl.createBuffer();
		gl.bindBuffer(gl.ARRAY_BUFFER, buffer);
		const vertices = [1, 2];
		gl.bufferData(gl.ARRAY_BUFFER, new Float32Array(vertices), gl.STATIC_DRAW);
		var arrBuffer = new ArrayBuffer(vertices.length * Float32Array.BYTES_PER_ELEMENT);
		gl2.getBufferSubData(gl.ELEMENT_ARRAY_BUFFER, 0, new Float32Array(arrBuffer), 0, 0);
		const getBufferSubDataError = gl.getError();
		console.info("getBufferSubDataError: " + getBufferSubDataError);
		expect(getBufferSubDataError).assertEqual(0);
		done();
	})

	/**
	 * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TESTWEBGL_0991
	 * @tc.name testGetBufferParameter3
	 * @tc.desc Test getBufferParameter.
	 */
	it('testGetBufferParameter3', 0, async function(done) {
		//initContext();
		console.info('jsWebGL getBufferParameter test start ...' + JSON.stringify(gl));
		const buffer = gl.createBuffer();
		gl.bindBuffer(gl.ARRAY_BUFFER, buffer);
		gl.bufferData(gl.ARRAY_BUFFER, 1024, gl.STATIC_DRAW);
		const bufferSize = gl.getBufferParameter(gl.ELEMENT_ARRAY_BUFFER, gl.BUFFER_SIZE);
		console.info('bufferSize' + bufferSize);
		expect(bufferSize).assertEqual(8);
		done();
	});

	/**
	 * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TESTWEBGL_0992
	 * @tc.name testGetFramebufferAttachmentParameter1
	 * @tc.desc Test getFramebufferAttachmentParameter.
	 */
	it('testGetFramebufferAttachmentParameter1', 0, async function(done) {
		//initContext();
		console.info('jsWebGL getFramebufferAttachmentParameter test start ...' + JSON.stringify(
			gl));
		const renderBuffer = gl.createRenderbuffer();
		gl.bindRenderbuffer(gl.RENDERBUFFER, renderBuffer);
		gl.framebufferRenderbuffer(gl.FRAMEBUFFER, gl.COLOR_ATTACHMENT0, gl.RENDERBUFFER,
			renderBuffer);
		const framebuffer = gl.getFramebufferAttachmentParameter(gl.FRAMEBUFFER, gl
			.DEPTH_ATTACHMENT,
			gl.FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE);
		console.info('Framebuffer' + framebuffer);
		const errorCode = gl.getError();
		console.info("jsWebGL getFramebufferAttachmentParameter errorCode: " + errorCode);
		expect(errorCode).assertEqual(gl.NO_ERROR);
		done();
	});

	/**
	 * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TESTWEBGL_1035
	 * @tc.name testStencilMaskSeparate1
	 * @tc.desc Test stencilMaskSeparate.
	 */
	it('testStencilMaskSeparate1', 0, async function(done) {
		//initContext();
		console.info('jsWebGL stencilMaskSeparate test start ...' + JSON.stringify(gl));
		gl.stencilMaskSeparate(gl.BACK, 110101);
		const stencilMaskSeparateParameter = gl.getParameter(gl.STENCIL_WRITEMASK);
		console.info("stencilMaskSeparate stencilMaskSeparateParameter: " +
			stencilMaskSeparateParameter);
		expect(stencilMaskSeparateParameter).assertEqual(110101);
		done();
	});

	/**
	 * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TESTWEBGL_1156
	 * @tc.name testTexImage2D_1_1
	 * @tc.desc Test texImage2D.
	 */
	it('testTexImage2D_1_1', 0, async function(done) {
		//initContext();
		console.info('jsWebGL2 texImage2D test start ...' + JSON.stringify(gl2));
		var buffer = new ArrayBuffer(8);
		var view = new DataView(buffer, 0);
		view.setInt16(1, 42);
		gl2.texImage2D(gl.TEXTURE_2D, 0, gl2.RG16F, 1, 1, 0, gl2.RG, gl2.HALF_FLOAT, view, 0);
		const errorCode = gl.getError();
		console.info("webgl2test texImage2D getError: " + errorCode);
		expect(errorCode).assertEqual(gl.INVALID_OPERATION);
		done();
	});

	/**
	 * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TESTWEBGL_1157
	 * @tc.name testTexImage2D_1_2
	 * @tc.desc Test texImage2D.
	 */
	it('testTexImage2D_1_2', 0, async function(done) {
		//initContext();
		console.info('jsWebGL2 texImage2D test start ...' + JSON.stringify(gl2));
		var buffer = new ArrayBuffer(8);
		var view = new DataView(buffer, 0);
		view.setInt16(1, 42);
		gl2.texImage2D(gl.TEXTURE_2D, 0, gl2.R32F, 1, 1, 0, gl2.RED, gl.FLOAT, view, 0);
		const errorCode = gl.getError();
		console.info("webgl2test texImage2D getError: " + errorCode);
		expect(errorCode).assertEqual(gl.INVALID_OPERATION);
		done();
	});

	/**
	 * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TESTWEBGL_1158
	 * @tc.name testTexImage2D_1_3
	 * @tc.desc Test texImage2D.
	 */
	it('testTexImage2D_1_3', 0, async function(done) {
		//initContext();
		console.info('jsWebGL2 texImage2D test start ...' + JSON.stringify(gl2));
		var buffer = new ArrayBuffer(8);
		var view = new DataView(buffer, 0);
		view.setInt16(1, 42);
		gl2.texImage2D(gl.TEXTURE_2D, 0, gl2.RG32F, 1, 1, 0, gl2.RG, gl.FLOAT, view, 0);
		const errorCode = gl.getError();
		console.info("webgl2test texImage2D getError: " + errorCode);
		expect(errorCode).assertEqual(gl.INVALID_OPERATION);
		done();
	});

	/**
	 * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TESTWEBGL_1159
	 * @tc.name testTexImage2D_1_4
	 * @tc.desc Test texImage2D.
	 */
	it('testTexImage2D_1_4', 0, async function(done) {
		//initContext();
		console.info('jsWebGL2 texImage2D test start ...' + JSON.stringify(gl2));
		var buffer = new ArrayBuffer(8);
		var view = new DataView(buffer, 0);
		view.setInt16(1, 42);
		gl2.texImage2D(gl.TEXTURE_2D, 0, gl2.RG8UI, 1, 1, 0, gl2.RG_INTEGER, gl.UNSIGNED_BYTE, view,
			0);
		const errorCode = gl.getError();
		console.info("webgl2test texImage2D getError: " + errorCode);
		expect(errorCode).assertEqual(gl.INVALID_OPERATION);
		done();
	});

	/**
	 * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TESTWEBGL_1161
	 * @tc.name testTexImage2D_1_6
	 * @tc.desc Test texImage2D.
	 */
	it('testTexImage2D_1_6', 0, async function(done) {
		//initContext();
		console.info('jsWebGL2 texImage2D test start ...' + JSON.stringify(gl2));
		var buffer = new ArrayBuffer(8);
		var view = new DataView(buffer, 0);
		view.setInt16(1, 42);
		gl2.texImage2D(gl.TEXTURE_2D, 0, gl2.R11F_G11F_B10F, 1, 1, 0, gl.RGB,
			gl2.UNSIGNED_INT_10F_11F_11F_REV, view, 0);
		const errorCode = gl.getError();
		console.info("webgl2test texImage2D getError: " + errorCode);
		expect(errorCode).assertEqual(gl.INVALID_OPERATION);
		done();
	});

	/**
	 * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TESTWEBGL_1162
	 * @tc.name testTexImage2D_1_7
	 * @tc.desc Test texImage2D.
	 */
	it('testTexImage2D_1_7', 0, async function(done) {
		//initContext();
		console.info('jsWebGL2 texImage2D test start ...' + JSON.stringify(gl2));
		var buffer = new ArrayBuffer(8);
		var view = new DataView(buffer, 0);
		view.setInt16(1, 42);
		gl2.texImage2D(gl.TEXTURE_2D, 0, gl2.RGB9_E5, 1, 1, 0, gl.RGB, gl2.HALF_FLOAT, view, 0);
		const errorCode = gl.getError();
		console.info("webgl2test texImage2D getError: " + errorCode);
		expect(errorCode).assertEqual(gl.INVALID_OPERATION);
		done();
	});

	/**
	 * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TESTWEBGL_1163
	 * @tc.name testTexImage2D_1_8
	 * @tc.desc Test texImage2D.
	 */
	it('testTexImage2D_1_8', 0, async function(done) {
		//initContext();
		console.info('jsWebGL2 texImage2D test start ...' + JSON.stringify(gl2));
		var buffer = new ArrayBuffer(8);
		var view = new DataView(buffer, 0);
		view.setInt16(1, 42);
		gl2.texImage2D(gl.TEXTURE_2D, 0, gl2.RGB16F, 1, 1, 0, gl.RGB, gl2.HALF_FLOAT, view, 0);
		const errorCode = gl.getError();
		console.info("webgl2test texImage2D getError: " + errorCode);
		expect(errorCode).assertEqual(gl.INVALID_OPERATION);
		done();
	});

	/**
	 * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TESTWEBGL_1164
	 * @tc.name testTexImage2D_1_9
	 * @tc.desc Test texImage2D.
	 */
	it('testTexImage2D_1_9', 0, async function(done) {
		//initContext();
		console.info('jsWebGL2 texImage2D test start ...' + JSON.stringify(gl2));
		var buffer = new ArrayBuffer(8);
		var view = new DataView(buffer, 0);
		view.setInt16(1, 42);
		gl2.texImage2D(gl.TEXTURE_2D, 0, gl2.RGB32F, 1, 1, 0, gl.RGB, gl.FLOAT, view, 0);
		const errorCode = gl.getError();
		console.info("webgl2test texImage2D getError: " + errorCode);
		expect(errorCode).assertEqual(gl.INVALID_OPERATION);
		done();
	});

	/**
	 * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TESTWEBGL_1165
	 * @tc.name testTexImage2D_1_10
	 * @tc.desc Test texImage2D.
	 */
	it('testTexImage2D_1_10', 0, async function(done) {
		//initContext();
		console.info('jsWebGL2 texImage2D test start ...' + JSON.stringify(gl2));
		var buffer = new ArrayBuffer(8);
		var view = new DataView(buffer, 0);
		view.setInt16(1, 42);
		gl2.texImage2D(gl.TEXTURE_2D, 0, gl2.SRGB8_ALPHA8, 1, 1, 0, gl.RGBA, gl.UNSIGNED_BYTE, view,
			0);
		const errorCode = gl.getError();
		console.info("webgl2test texImage2D getError: " + errorCode);
		expect(errorCode).assertEqual(gl.INVALID_OPERATION);
		done();
	});

	/**
	 * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TESTWEBGL_1166
	 * @tc.name testTexImage2D_1_11
	 * @tc.desc Test texImage2D.
	 */
	it('testTexImage2D_1_11', 0, async function(done) {
		//initContext();
		console.info('jsWebGL2 texImage2D test start ...' + JSON.stringify(gl2));
		var buffer = new ArrayBuffer(8);
		var view = new DataView(buffer, 0);
		view.setInt16(1, 42);
		gl2.texImage2D(gl.TEXTURE_2D, 0, gl2.RGB10_A2, 1, 1, 0, gl.RGBA, gl2
			.UNSIGNED_INT_2_10_10_10_REV, view, 0);
		const errorCode = gl.getError();
		console.info("webgl2test texImage2D getError: " + errorCode);
		expect(errorCode).assertEqual(gl.INVALID_OPERATION);
		done();
	});

	/**
	 * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TESTWEBGL_1167
	 * @tc.name testTexImage2D_1_12
	 * @tc.desc Test texImage2D.
	 */
	it('testTexImage2D_1_12', 0, async function(done) {
		//initContext();
		console.info('jsWebGL2 texImage2D test start ...' + JSON.stringify(gl2));
		var buffer = new ArrayBuffer(8);
		var view = new DataView(buffer, 0);
		view.setInt16(1, 42);
		gl2.texImage2D(gl.TEXTURE_2D, 0, gl2.RGBA16F, 1, 1, 0, gl.RGBA, gl2.HALF_FLOAT, view, 0);
		const errorCode = gl.getError();
		console.info("webgl2test texImage2D getError: " + errorCode);
		expect(errorCode).assertEqual(gl.INVALID_OPERATION);
		done();
	});

	/**
	 * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TESTWEBGL_1168
	 * @tc.name testTexImage2D_1_13
	 * @tc.desc Test texImage2D.
	 */
	it('testTexImage2D_1_13', 0, async function(done) {
		//initContext();
		console.info('jsWebGL2 texImage2D test start ...' + JSON.stringify(gl2));
		var buffer = new ArrayBuffer(8);
		var view = new DataView(buffer, 0);
		view.setInt16(1, 42);
		gl2.texImage2D(gl.TEXTURE_2D, 0, gl2.RGBA32F, 1, 1, 0, gl.RGBA, gl.FLOAT, view, 0);
		const errorCode = gl.getError();
		console.info("webgl2test texImage2D getError: " + errorCode);
		expect(errorCode).assertEqual(gl.INVALID_OPERATION);
		done();
	});

	/**
	 * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TESTWEBGL_1169
	 * @tc.name testTexImage2D_1_14
	 * @tc.desc Test texImage2D.
	 */
	it('testTexImage2D_1_14', 0, async function(done) {
		//initContext();
		console.info('jsWebGL2 texImage2D test start ...' + JSON.stringify(gl2));
		var buffer = new ArrayBuffer(8);
		var view = new DataView(buffer, 0);
		view.setInt16(1, 42);
		gl2.texImage2D(gl.TEXTURE_2D, 0, gl2.RGBA8UI, 1, 1, 0, gl2.RGBA_INTEGER, gl.UNSIGNED_BYTE,
			view, 0);
		const errorCode = gl.getError();
		console.info("webgl2test texImage2D getError: " + errorCode);
		expect(errorCode).assertEqual(gl.INVALID_OPERATION);
		done();
	});

	/**
	 * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TESTWEBGL_1209
	 * @tc.name webgl_test_copyTexImage2D_1
	 * @tc.desc Test copyTexImage2D.
	 */
	it('webgl_test_copyTexImage2D_1', 0, async function(done) {
		//initContext();
		console.info("webgltest into copyTexImage2D");
		gl.copyTexImage2D(gl.TEXTURE_2D, 0, gl.LUMINANCE_ALPHA, 0, 0, 512, 512, 0);
		let errorCode = gl.getError();
		console.info("webgltest copyTexImage2D getError: " + errorCode);
		expect(errorCode).assertEqual(gl.INVALID_FRAMEBUFFER_OPERATION);

		//deleteContext();
		done();
	});

	/**
	 * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TESTWEBGL_1240
	 * @tc.name testRenderbufferStorageMultisample_1
	 * @tc.desc Test renderbufferStorageMultisample.
	 */
	it('testRenderbufferStorageMultisample_1', 0, async function(done) {
		//initContext();
		console.info('jsWebGL testRenderbufferStorageMultisample test start ...66');
		gl2.renderbufferStorageMultisample(gl.RENDERBUFFER, 4, gl.DEPTH_COMPONENT16, 256, 256);
		const renderbufferStorageMultisampleError = gl.getError();
		console.info("renderbufferStorageMultisampleError: " + renderbufferStorageMultisampleError);
		expect(renderbufferStorageMultisampleError).assertEqual(0);
		done();
	})

	/**
	 * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TESTWEBGL_1245
	 * @tc.name testRenderbufferStorageMultisample_6
	 * @tc.desc Test renderbufferStorageMultisample.
	 */
	it('testRenderbufferStorageMultisample_6', 0, async function(done) {
		//initContext();
		console.info('jsWebGL testRenderbufferStorageMultisample test start ...66');
		gl2.renderbufferStorageMultisample(gl.RENDERBUFFER, 4, gl.STENCIL_INDEX8, 256, 256);
		const renderbufferStorageMultisampleError = gl.getError();
		console.info("renderbufferStorageMultisampleError: " + renderbufferStorageMultisampleError);
		expect(renderbufferStorageMultisampleError).assertEqual(0);
		done();
	})

	/**
	 * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TESTWEBGL_1297
	 * @tc.name testGetFramebufferAttachmentParameter3_7
	 * @tc.desc Test getFramebufferAttachmentParameter.
	 */
	it('testGetFramebufferAttachmentParameter3_7', 0, async function(done) {
		//initContext();
		console.info('jsWebGL getFramebufferAttachmentParameter test start ...' + JSON.stringify(
			gl));
		const renderBuffer = gl.createRenderbuffer();
		gl.bindRenderbuffer(gl.RENDERBUFFER, renderBuffer);
		gl.framebufferRenderbuffer(gl.FRAMEBUFFER, gl.COLOR_ATTACHMENT0, gl.RENDERBUFFER,
			renderBuffer);
		const framebuffer = gl.getFramebufferAttachmentParameter(gl.FRAMEBUFFER, gl
			.DEPTH_STENCIL_ATTACHMENT,
			gl.FRAMEBUFFER_ATTACHMENT_OBJECT_NAME);
		console.info('Framebuffer' + framebuffer);
		const errorCode = gl.getError();
		console.info("jsWebGL getFramebufferAttachmentParameter errorCode: " + errorCode);
		expect(errorCode).assertEqual(0);
		done();
	});

	/**
	 * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TESTWEBGL_1305
	 * @tc.name testGetFramebufferAttachmentParameter3_15
	 * @tc.desc Test getFramebufferAttachmentParameter.
	 */
	it('testGetFramebufferAttachmentParameter3_15', 0, async function(done) {
		//initContext();
		console.info('jsWebGL getFramebufferAttachmentParameter test start ...' + JSON.stringify(
			gl));
		const renderBuffer = gl.createRenderbuffer();
		gl.bindRenderbuffer(gl.RENDERBUFFER, renderBuffer);
		gl.framebufferRenderbuffer(gl.FRAMEBUFFER, gl.COLOR_ATTACHMENT0, gl.RENDERBUFFER,
			renderBuffer);
		const framebuffer = gl.getFramebufferAttachmentParameter(gl.FRAMEBUFFER, gl
			.DEPTH_STENCIL_ATTACHMENT,
			gl2.FRAMEBUFFER_DEFAULT);
		console.info('Framebuffer' + framebuffer);
		const errorCode = gl.getError();
		console.info("jsWebGL getFramebufferAttachmentParameter errorCode: " + errorCode);
		expect(errorCode).assertEqual(0);
		done();
	});

	/**
	 * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TESTWEBGL_1333
	 * @tc.name testRangeMin
	 * @tc.desc Test RangeMin.
	 */
	it('testRangeMin', 0, async function(done) {
		console.info('jsWebGL testRangeMin test start');
		gl.getShaderPrecisionFormat(gl.VERTEX_SHADER, gl.MEDIUM_FLOAT).rangeMin;
		gl.getShaderPrecisionFormat(gl.FRAGMENT_SHADER, gl.LOW_INT).rangeMin;
		const min = gl.getShaderPrecisionFormat(gl.FRAGMENT_SHADER, gl.LOW_INT).rangeMin;
		const max = gl.getShaderPrecisionFormat(gl.VERTEX_SHADER, gl.MEDIUM_FLOAT).rangeMax;
		expect(min).assertEqual(24);
		expect(max).assertEqual(127);
		done();
	});

	/**
	 * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TESTWEBGL_1334
	 * @tc.name testAttributeBae
	 * @tc.desc Test AttributeBae.
	 */
	it('testAttributeBae', 0, async function(done) {
		console.info('jsWebGL testAttributeBae test start');
		var frameBuffer = gl.createBuffer();
		gl.bindBuffer(gl.FRAMEBUFFER, frameBuffer);
		const framebufferParameter = gl.getParameter(gl.FRAMEBUFFER_BINDING);
		const isFramebuffer = gl.isFramebuffer(framebufferParameter);
		expect(isFamebuffer).assertEqual(true);
		done();
	});

	/**
	 * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TESTWEBGL_1335
	 * @tc.name testTypeBase
	 * @tc.desc Test TypeBase.
	 */
	it('testTypeBase', 0, async function(done) {
		console.info('jsWebGL testTypeBasetest start');
		const progamObj = globalFunction();
		const info = gl.getActiveAttrib(programObj, 0);
		info.size = 123;
		info.name = 'name';
		info.type = Number;
		const size = info.size;
		const name  = info.name;
		const type = info.type;
		expect(size).assertEqual(info.size);
		expect(name).assertEqual(info.name);
		expect(type).assertEqual(info.type);
		done();
	});
	
	/**
	 * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TESTWEBGL_1336
	 * @tc.name testWebGLTypeBase
	 * @tc.desc Test WebGLTypeBase.
	 */
	it('testWebGLTypeBase', 0, async function(done) {
		console.info('jsWebGL testWebGLTypeBase test start');
		var x =1 ;
		expect(x).assertEqual(gl.ONE);
		var x1 = 0x8892;
		expect(x1).assertEqual(gl.ARRAY_BUFFER);
		var x2 = 0x0405;
		expect(x2).assertEqual(gl.BACK);
		var x3 = 0;
		expect(x3).assertEqual(gl.NO_ERROR);
		var x4 = 0x0502;
		expect(x4).assertEqual(gl.INVALID_OPERATION);
		var x5 = 0x80AA;
		expect(x5).assertEqual(gl.SAMPLE_COVERAGE_VALUE);
		var x6 = 0x80AB;
		expect(x6).assertEqual(gl.SAMPLE_COVERAGE_INVERT);
		var x7 = 0x1400;
		expect(x7).assertEqual(gl.BYTE);
		var x8 = 0x1404;
		expect(x8).assertEqual(gl.INT);
		var x9 = 0x1406;
		expect(x9).assertEqual(gl.FLOAT);
		var x10 = 0x1907;
		expect(x10).assertEqual(gl.RGB);
		var x11 = 0x8B89;
		expect(x11).assertEqual(gl.ACTIVE_ATTRIBUTES);
		var x12 = 0x0DE1;
		expect(x12).assertEqual(gl.TEXTURE_2D);
		
		var x13 = 0x1702;
		expect(x13).assertEqual(gl.TEXTURE);
		
		var x14 = 0x84C0;
		expect(x14).assertEqual(gl.TEXTURE0);
		var x15 = 0x8D40;
		expect(x15).assertEqual(gl.FRAMEBUFFER);
		var x16 = 0x8D41;
		expect(x16).assertEqual(gl.RENDERBUFFER);
		var x17 = 0x8894;
		expect(x17).assertEqual(gl.ARRAY_BUFFER);
		var x18 = 0;
		expect(x18).assertEqual(gl.NONE);
		var x19 =0x9242;
		expect(x19).assertEqual(gl.CONTEXT_LOST_WEBGL);
		var x20 = 0x8892;
		expect(x20).assertEqual(gl.ARRAY_BUFFER)
		done();
	});

	/**
	 * @tc.number GRAPHIC_FUNCTION_JS_WEBGL_TESTWEBGL_1338
	 * @tc.name testAttributeBase
	 * @tc.desc Test testAttributeBase.
	 */
	it('testAttributeBase', 0, async function(done) {
		console.info('jsWebGL testAttributeBase test start');
		var attribute = gl.getContextAttributes();
		expect(atttribute.desynchronized).assertEqual(false);
		expect(atttribute.antialias).assertEqual(true);
		expect(atttribute.premultipliedAlpha).assertEqual(true);
		expect(atttribute.preserveDrawingBuffer).assertEqual(false);
		expect(atttribute.failIfMajorPerformanceCaveat).assertEqual(false);
		done()
	});
})
