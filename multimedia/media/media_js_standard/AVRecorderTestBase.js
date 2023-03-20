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

import media from '@ohos.multimedia.media'
import * as mediaTestBase from './MediaTestBase.js';

export async function idle(avRecorder) {
    console.info('case createAVRecorder called');
    await media.createAVRecorder().then((recorder) => {
        if (recorder != null) {
            avRecorder = recorder;
            console.info('createAVRecorder success');
        } else {
            console.info('createAVRecorder fail');
        }
    }).catch((error) => {
        console.info(`createAVRecorder catchCallback, error:${error}`);
    });
    return avRecorder;
}

export const AV_RECORDER_STATE = {
    IDLE : 'idle',
    PREPARED : 'prepared',
    STARTED : 'started',
    PAUSED : 'paused',
    STOPPED : 'stopped',
    RELEASED : 'released',
    ERROR : 'error',
}

export function prepareCallback(avRecorder, avConfig) {
    if (typeof(avRecorder) == 'undefined') {
        return;
    }
    avRecorder.prepare(avConfig, (err) => {
        console.info('case prepare called' + err);
        if (err == null) {
            console.info('prepare success');
        } else {
            console.error(`case prepare error, errMessage is ${err.message}`);
        }
    })
}

export function preparePromise(avRecorder, avConfig) {
    if (typeof(avRecorder) == 'undefined') {
        return;
    }
    avRecorder.prepare(avConfig).then(() => {
        console.info('prepare success');
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback); 
}

export function getInputSurfacePromise(avRecorder) {
    let surfaceID = null;
    if (typeof(avRecorder) == 'undefined') {
        return;
    } 
    avRecorder.getInputSurface().then((surfaceId) => {
        console.info('getInputSurface success');
        surfaceID = surfaceId;
    }).catch((err) => {
        console.info('getInputSurface failed and catch error is ' + err.message);
    });
    
    // videoOutput = await cameraManager.createVideoOutput(videoProfiles[0], surfaceID);
}

export function getInputSurfaceCallback(avRecorder) {
    if (typeof(avRecorder) == 'undefined') {
        return;
    }
    let surfaceID = null;
    avRecorder.getInputSurface((err, surfaceId) => {
        if (err == null) {
            console.info('getInputSurface success');
            surfaceID = surfaceId;
        } else {
            console.info('getInputSurface failed and error is ' + err.message);
        }
    });
    // videoOutput = await cameraManager.createVideoOutput(videoProfiles[0], surfaceID);
}

export function startCallback(avRecorder) {
    if (typeof(avRecorder) == 'undefined') {
        return;
    }
    avRecorder.start((err) => {
        console.info('case start called');
        if (err == null) {
            console.info('start AVRecorder success');
        } else {
            console.info('start AVRecorder failed and error is ' + err.message);
        }
    })
}

export function startPromise(avRecorder) {
    if (typeof(avRecorder) == 'undefined') {
        return;
    }
    avRecorder.start().then(() => {
        console.info('start success');
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback); 
}

export function pauseCallback(avRecorder) {
    if (typeof(avRecorder) == 'undefined') {
        return;
    }
    avRecorder.pause((err) => {
        console.info('case pause called');
        if (err == null) {
            console.info('pause AVRecorder success');
        } else {
            console.info('pause AVRecorder failed and error is ' + err.message);
        }
    })
}

export function pausePromise(avRecorder) {
    if (typeof(avRecorder) == 'undefined') {
        return;
    }
    avRecorder.pause().then(() => {
        console.info('pause success');
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback); 
}

export function resumeCallback(avRecorder) {
    if (typeof(avRecorder) == 'undefined') {
        return;
    }
    avRecorder.resume((err) => {
        console.info('case resume called');
        if (err == null) {
            console.info('resume AVRecorder success');
        } else {
            console.info('resume AVRecorder failed and error is ' + err.message);
        }
    })
}

export function resumePromise(avRecorder) {
    if (typeof(avRecorder) == 'undefined') {
        return;
    }
    avRecorder.resume().then(() => {
        console.info('resume success');
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback); 
}

export function stopCallback(avRecorder) {
    if (typeof(avRecorder) == 'undefined') {
        return;
    }
    avRecorder.stop((err) => {
        console.info('case stop called');
        if (err == null) {
            console.info('stop AVRecorder success');
        } else {
            console.info('stop AVRecorder failed and error is ' + err.message);
        }
    })
}

export function stopPromise(avRecorder) {
    if (typeof(avRecorder) == 'undefined') {
        return;
    }
    avRecorder.stop().then(() => {
        console.info('stop success');
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback); 
}

export function resetCallback(avRecorder) {
    if (typeof(avRecorder) == 'undefined') {
        return;
    }
    avRecorder.reset((err) => {
        console.info('case reset called');
        if (err == null) {
            console.info('reset AVRecorder success');
        } else {
            console.info('reset AVRecorder failed and error is ' + err.message);
        }
    })
}

export function resetPromise(avRecorder) {
    if (typeof(avRecorder) == 'undefined') {
        return;
    }
    avRecorder.reset().then(() => {
        console.info('reset success');
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback); 
}

export function releaseCallback(avRecorder) {
    if (typeof(avRecorder) == 'undefined') {
        return;
    }
    avRecorder.release((err) => {
        console.info('case release called');
        if (err == null) {
            console.info('release AVRecorder success');
        } else {
            console.info('release AVRecorder failed and error is ' + err.message);
        }
    })
}

export function releasePromise(avRecorder) {
    if (typeof(avRecorder) == 'undefined') {
        return;
    }
    avRecorder.release().then(() => {
        console.info('release success');
    }, mediaTestBase.failureCallback).catch(mediaTestBase.catchCallback); 
}

export function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}

export function offCallback(avRecorder, typeArr)
{
    if (avRecorder == null) {
        return;
    }
    for (let i = 0; i < typeArr.length; i++) { 
        switch (typeArr[i]) {
            case 'stateChange':
                avRecorder.off('stateChange');
                break;
            case 'error':
                avRecorder.off('error');
                break;
            default:
                break;
        }
    }
}

export async function setOnCallback(avConfig, avRecorder, recorderTime, done) {
    console.info(`case setOnCallback in`);
    avRecorder.on('stateChange', async (state, reason) => {
        console.info('case state has changed, new state is :' + state);
        switch (state) {
            case AV_RECORDER_STATE.IDLE:
                console.info(`case avRecorderWithCallBack is idle`);
                expect(avRecorder.state).assertEqual("idle");
                //start->stop->release
                prepareCallback(avRecorder, avConfig);
                break;
            case AV_RECORDER_STATE.PREPARED:
                console.info(`case avRecorderWithCallBack is prepared`);
                expect(avRecorder.state).assertEqual('prepared');
                startCallback(avRecorder);
                break;
            case AV_RECORDER_STATE.STARTED:
                console.info(`case avRecorderWithCallBack is started`)
                expect(avRecorder.state).assertEqual('started');
                await sleep(recorderTime);
                stopCallback(avRecorder);
                break;
            case AV_RECORDER_STATE.PAUSED:
                console.info(`case avRecorderWithCallBackis paused`)
                expect(avRecorder.state).assertEqual('paused');
                break;
            case AV_RECORDER_STATE.STOPPED:
                console.info(`case avRecorderWithCallBack is stopped`)
                expect(avRecorder.state).assertEqual('stopped');
                avRecorder.release()
                break;
            case AV_RECORDER_STATE.RELEASED:
                console.info(`case avRecorderWithCallBack is released`);
                expect(avRecorder.state).assertEqual('released');
                done();
                break;
            case AV_RECORDER_STATE.ERROR:
                console.info(`case avRecorderWithCallBack is error`)
                expect(avRecorder.state).assertEqual('error');
                break;
            default:
                console.info('case state is unknown');
        }
    });
    
    avRecorder.on('error', (err) => {
        console.info('case avRecorder.on(error) called, errMessage is ' + err.message);
    });
}

export async function setPrepareOnCallback(avConfig, avRecorder, recorderTime, done) {
    console.info(`case setOnCallback in`);
    avRecorder.on('stateChange', async (state, reason) => {
        console.info('case state has changed, new state is :' + state);
        switch (state) {
            case AV_RECORDER_STATE.PREPARED:
                console.info(`case AV_RECORDER_STATE.PREPARED`);
                expect(avRecorder.state).assertEqual('prepared');
                releaseCallback(avRecorder);
                break;
            case AV_RECORDER_STATE.RELEASED:
                console.info(`case avRecorderReliabilitTest03 is released`);
                expect(avRecorder.state).assertEqual('released');
                done();
                break;
            case AV_RECORDER_STATE.ERROR:
                console.info(`case AV_RECORDER_STATE.ERROR`)
                expect(avRecorder.state).assertEqual('error');
                break;
            default:
                console.info('case state is unknown');
        }
    });
}

export async function avRecorderWithCallBack(avConfig, avRecorder, recorderTime, done) {
    avRecorder = await idle(avRecorder)
    setOnCallback(avConfig, avRecorder, recorderTime, done);
    await avRecorder.prepare(avConfig)
}

export async function avRecorderReliabilitTest01(avConfig, avRecorder, recorderTime, done) {
    let result = true;
    avRecorder = await idle(avRecorder);
    console.info('case avConfig.url is ' + avConfig.url);
    await avRecorder.pause().then(() => {
        console.info('pause AVRecorder success');
    }).catch((err) => {
        console.info('pause AVRecorder failed and catch error is ' + err.message);
        result = false
    });
    expect(result).assertEqual(false);
    await avRecorder.prepare(avConfig).then(() => {
        expect(avRecorder.state).assertEqual(AV_RECORDER_STATE.PREPARED);
        console.info('prepare success');
    }).catch((err) => {
        console.info('prepare failed and catch error is ' + err.message);
    });
    await avRecorder.release().then(() => {
        console.info('release AVRecorder success');
        expect(avRecorder.state).assertEqual(AV_RECORDER_STATE.RELEASED);
        done();
    }).catch((err) => {
        console.info('release AVRecorder failed and catch error is ' + err.message);
    });
}

export async function avRecorderReliabilitTest02(avConfig, avRecorder, recorderTime, done) {
    avRecorder = await idle(avRecorder);
    await avRecorder.prepare(avConfig).then(() => {
        expect(avRecorder.state).assertEqual(AV_RECORDER_STATE.PREPARED);
        console.info('avRecorderReliabilitTest02 prepare success');
    }).catch((err) => {
        console.info('avRecorderReliabilitTest02 prepare failed and catch error is ' + err.message);
    });
    await avRecorder.release().then(() => {
        console.info('avRecorderReliabilitTest02 release AVRecorder success');
        expect(avRecorder.state).assertEqual(AV_RECORDER_STATE.RELEASED);
        done();
    }).catch((err) => {
        console.info('avRecorderReliabilitTest02 release AVRecorder failed and catch error is ' + err.message);
    });
}

export async function avRecorderReliabilitTest03(avConfig, avRecorder, recorderTime, done) {
    avRecorder = await idle(avRecorder);
    setPrepareOnCallback(avConfig, avRecorder, recorderTime, done)
    await avRecorder.prepare(avConfig)
}



