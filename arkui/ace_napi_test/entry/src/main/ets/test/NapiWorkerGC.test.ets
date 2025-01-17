/*
 * Copyright (c) 2024 SwanLink (Jiangsu) Technology Development Co., LTD.
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

import { describe, expect, it } from '@ohos/hypium';
import { worker } from '@kit.ArkTS';

declare class ArkTools {
  static forceFullGC(): void;
}

export const sleep = (ms: number | undefined) => {
  return new Promise <void>(resolve => setTimeout(resolve, ms));
}

export default function NapiWorkerGCTest() {

  describe('napiWorkerGCTest', () => {
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_0100
     * @tc.name      : testNapiWorkerGC0001
     * @tc.desc      : NapiWorkerTest getLastError
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0001', 0, async () => {
      const caseName = 'testNapiWorkerGC0001';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        ArkTools.forceFullGC();
        myWorker.postMessage('getLastError');
        await new Promise<void>((resolve, reject) => {
          myWorker.onmessage = (e) => {
            console.log(`${caseName} result: ` + JSON.stringify(e));
            try {
              expect(e.data).assertEqual(2000);
              resolve();
            } catch (error) {
              reject(error);
            } finally {
              myWorker.terminate();
            }
          };
          myWorker.onexit = (code) => {
            console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
            resolve();
          };
          myWorker.onerror = (e) => {
            console.error(`${caseName} worker error: ` + JSON.stringify(e));
            reject(e);
          };
        });
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_0200
     * @tc.name      : testNapiWorkerGC0002
     * @tc.desc      : NapiWorkerTest isError
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0002', 0, async () => {
      const caseName: string = 'testNapiWorkerGC0002';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        ArkTools.forceFullGC();
        myWorker.postMessage('isError');
        await new Promise<void>((resolve, reject) => {
          myWorker.onmessage = (e) => {
            console.log(`${caseName} result: ` + JSON.stringify(e));
            try {
              expect(e.data).assertEqual(false);
              resolve();
            } catch (error) {
              reject(error);
            } finally {
              myWorker.terminate();
            }
          };
          myWorker.onexit = (code) => {
            console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
            resolve();
          };
          myWorker.onerror = (e) => {
            console.error(`${caseName} worker error: ` + JSON.stringify(e));
            reject(e);
          };
        });
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_0300
     * @tc.name      : testNapiWorkerGC0003
     * @tc.desc      : NapiWorkerTest createError
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0003', 0, async () => {
      const caseName = 'testNapiWorkerGC0003';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        ArkTools.forceFullGC();
        myWorker.postMessage('createError');
        await new Promise<void>((resolve, reject) => {
          myWorker.onmessage = (e) => {
            console.log(`${caseName} result: ` + JSON.stringify(e));
            try {
              expect(e.data).assertEqual(0);
              resolve();
            } catch (error) {
              reject(error);
            } finally {
              myWorker.terminate();
            }
          };
          myWorker.onexit = (code) => {
            console.log(`${caseName} main onexit code: ` + code);
            resolve();
          };
          myWorker.onerror = (e) => {
            console.error(`${caseName} worker error: ` + JSON.stringify(e));
            reject(e);
          };
        });
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_0400
     * @tc.name      : testNapiWorkerGC0004
     * @tc.desc      : NapiWorkerTest createRangeError
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0004', 0, async () => {
      const caseName = 'testNapiWorkerGC0004';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        ArkTools.forceFullGC();
        myWorker.postMessage('createRangeError');
        await new Promise<void>((resolve, reject) => {
          myWorker.onmessage = (e) => {
            console.log(`${caseName} result: ` + JSON.stringify(e));
            try {
              expect(e.data).assertEqual(0);
              resolve();
            } catch (error) {
              reject(error);
            } finally {
              myWorker.terminate();
            }
          };
          myWorker.onexit = (code) => {
            console.log(`${caseName} main onexit code: ` + code);
            resolve();
          };
          myWorker.onerror = (e) => {
            console.error(`${caseName} worker error: ` + JSON.stringify(e));
            reject(e);
          };
        });
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_0500
     * @tc.name      : testNapiWorkerGC0005
     * @tc.desc      : NapiWorkerTest isExceptionPending
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0005', 0, async () => {
      const caseName = 'testNapiWorkerGC0005';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        ArkTools.forceFullGC();
        myWorker.postMessage('isExceptionPending');
        await new Promise<void>((resolve, reject) => {
          myWorker.onmessage = (e) => {
            console.log(`${caseName} result: ` + JSON.stringify(e));
            try {
              expect(e.data).assertEqual(0);
              resolve();
            } catch (error) {
              reject(error);
            } finally {
              myWorker.terminate();
            }
          };
          myWorker.onexit = (code) => {
            console.log(`${caseName} main onexit code: ` + code);
            resolve();
          };
          myWorker.onerror = (e) => {
            console.error(`${caseName} worker error: ` + JSON.stringify(e));
            reject(e);
          };
        });
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_0600
     * @tc.name      : testNapiWorkerGC0006
     * @tc.desc      : NapiWorkerTest createReference
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0006', 0, async () => {
      const caseName = 'testNapiWorkerGC0006';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        ArkTools.forceFullGC();
        myWorker.postMessage('createReference');
        await new Promise<void>((resolve, reject) => {
          myWorker.onmessage = (e) => {
            console.log(`${caseName} result: ` + JSON.stringify(e));
            try {
              expect(e.data).assertEqual(0);
              resolve();
            } catch (error) {
              reject(error);
            } finally {
              myWorker.terminate();
            }
          };
          myWorker.onexit = (code) => {
            console.log(`${caseName} main onexit code: ` + code);
            resolve();
          };
          myWorker.onerror = (e) => {
            console.error(`${caseName} worker error: ` + JSON.stringify(e));
            reject(e);
          };
        });
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_0700
     * @tc.name      : testNapiWorkerGC0007
     * @tc.desc      : NapiWorkerTest referenceRefAndUnref
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0007', 0, async () => {
      const caseName = 'testNapiWorkerGC0007';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        ArkTools.forceFullGC();
        myWorker.postMessage('referenceRefAndUnref');
        await new Promise<void>((resolve, reject) => {
          myWorker.onmessage = (e) => {
            console.log(`${caseName} result: ` + JSON.stringify(e));
            try {
              expect(e.data).assertEqual(0);
              resolve();
            } catch (error) {
              reject(error);
            } finally {
              myWorker.terminate();
            }
          };
          myWorker.onexit = (code) => {
            console.log(`${caseName} main onexit code: ` + code);
            resolve();
          };
          myWorker.onerror = (e) => {
            console.error(`${caseName} worker error: ` + JSON.stringify(e));
            reject(e);
          };
        });
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_0800
     * @tc.name      : testNapiWorkerGC0008
     * @tc.desc      : NapiWorkerTest createArrayAndGetLength
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0008', 0, async () => {
      const caseName = 'testNapiWorkerGC0008';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        ArkTools.forceFullGC();
        myWorker.postMessage('createArrayAndGetLength');
        await new Promise<void>((resolve, reject) => {
          myWorker.onmessage = (e) => {
            console.log(`${caseName} result: ` + JSON.stringify(e));
            try {
              expect(e.data).assertEqual('[1,2]');
              resolve();
            } catch (error) {
              reject(error);
            } finally {
              myWorker.terminate();
            }
          };
          myWorker.onexit = (code) => {
            console.log(`${caseName} main onexit code: ` + code);
            resolve();
          };
          myWorker.onerror = (e) => {
            console.error(`${caseName} worker error: ` + JSON.stringify(e));
            reject(e);
          };
        });
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_0900
     * @tc.name      : testNapiWorkerGC0009
     * @tc.desc      : NapiWorkerTest createExternal
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0009', 0, async () => {
      const caseName = 'testNapiWorkerGC0009';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        ArkTools.forceFullGC();
        myWorker.postMessage('createExternal');
        await new Promise<void>((resolve, reject) => {
          myWorker.onmessage = (e) => {
            console.log(`${caseName} result: ` + JSON.stringify(e));
            try {
              expect(e.data).assertEqual(0);
              resolve();
            } catch (error) {
              reject(error);
            } finally {
              myWorker.terminate();
            }
          };
          myWorker.onexit = (code) => {
            console.log(`${caseName} main onexit code: ` + code);
            resolve();
          };
          myWorker.onerror = (e) => {
            console.error(`${caseName} worker error: ` + JSON.stringify(e));
            reject(e);
          };
        });
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_1000
     * @tc.name      : testNapiWorkerGC0010
     * @tc.desc      : NapiWorkerTest createExternalArraybuffer
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0010', 0, async () => {
      const caseName = 'testNapiWorkerGC0010';
      console.info(`${caseName} test start`);
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        ArkTools.forceFullGC();
        myWorker.postMessage('createExternalArraybuffer');
        await new Promise<void>((resolve, reject) => {
          myWorker.onmessage = (e) => {
            console.log(`${caseName} result: ` + JSON.stringify(e));
            try {
              expect(e.data).assertEqual(true);
              resolve();
            } catch (error) {
              reject(error);
            } finally {
              myWorker.terminate();
            }
          };
          myWorker.onexit = (code) => {
            console.log(`${caseName} main onexit code: ` + code);
            resolve();
          };
          myWorker.onerror = (e) => {
            console.error(`${caseName} worker error: ` + JSON.stringify(e));
            reject(e);
          };
        });
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_1100
     * @tc.name      : testNapiWorkerGC0011
     * @tc.desc      : NapiWorkerTest createObject
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0011', 0, async () => {
      const caseName: string = 'testNapiWorkerGC0011';
      console.info(`${caseName} test start`);
      let state: boolean = false;
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        ArkTools.forceFullGC();
        myWorker.postMessage('createObject');
        myWorker.onmessage = (e) => {
          console.log(`${caseName} result: ` + JSON.stringify(e));
          expect(e.data).assertEqual(true);
          myWorker.terminate();
        }
        myWorker.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_1200
     * @tc.name      : testNapiWorkerGC0012
     * @tc.desc      : NapiWorkerTest createSymbol
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0012', 0, async () => {
      const caseName: string = 'testNapiWorkerGC0012';
      console.info(`${caseName} test start`);
      let state: boolean = false;
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        ArkTools.forceFullGC();
        myWorker.postMessage('createSymbol');
        myWorker.onmessage = (e) => {
          console.log(`${caseName} result: ` + JSON.stringify(e));
          expect(e.data).assertEqual(0);
          myWorker.terminate();
        }
        myWorker.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_1300
     * @tc.name      : testNapiWorkerGC0013
     * @tc.desc      : NapiWorkerTest createTypeArray
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0013', 0, async () => {
      const caseName: string = 'testNapiWorkerGC0013';
      console.info(`${caseName} test start`);
      let state: boolean = false;
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        ArkTools.forceFullGC();
        myWorker.postMessage('createTypeArray');
        myWorker.onmessage = (e) => {
          console.log(`${caseName} result: ` + JSON.stringify(e));
          expect(e.data).assertTrue();
          myWorker.terminate();
        }
        myWorker.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_1400
     * @tc.name      : testNapiWorkerGC0014
     * @tc.desc      : NapiWorkerTest getValueBool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0014', 0, async () => {
      const caseName: string = 'testNapiWorkerGC0014';
      console.info(`${caseName} test start`);
      let state: boolean = false;
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        ArkTools.forceFullGC();
        myWorker.postMessage('getValueBool');
        myWorker.onmessage = (e) => {
          console.log(`${caseName} result: ` + JSON.stringify(e));
          expect(e.data).assertFalse();
          myWorker.terminate();
        }
        myWorker.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_1500
     * @tc.name      : testNapiWorkerGC0015
     * @tc.desc      : NapiWorkerTest createAndGetInt32
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0015', 0, async () => {
      const caseName: string = 'testNapiWorkerGC0015';
      console.info(`${caseName} test start`);
      let state: boolean = false;
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        ArkTools.forceFullGC();
        myWorker.postMessage('createAndGetInt32');
        myWorker.onmessage = (e) => {
          console.log(`${caseName} result: ` + JSON.stringify(e));
          expect(e.data).assertEqual(32);
          myWorker.terminate();
        }
        myWorker.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_1600
     * @tc.name      : testNapiWorkerGC0016
     * @tc.desc      : NapiWorkerTest createAndGetUInt32
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0016', 0, async () => {
      const caseName: string = 'testNapiWorkerGC0016';
      console.info(`${caseName} test start`);
      let state: boolean = false;
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        ArkTools.forceFullGC();
        myWorker.postMessage('createAndGetUInt32');
        myWorker.onmessage = (e) => {
          console.log(`${caseName} result: ` + JSON.stringify(e));
          expect(e.data).assertEqual(32);
          myWorker.terminate();
        }
        myWorker.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_1700
     * @tc.name      : testNapiWorkerGC0017
     * @tc.desc      : NapiWorkerTest createAndGetInt64
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0017', 0, async () => {
      const caseName: string = 'testNapiWorkerGC0017';
      console.info(`${caseName} test start`);
      let state: boolean = false;
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        ArkTools.forceFullGC();
        myWorker.postMessage('createAndGetInt64');
        myWorker.onmessage = (e) => {
          console.log(`${caseName} result: ` + JSON.stringify(e));
          expect(e.data).assertEqual(23);
          myWorker.terminate();
        }
        myWorker.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_1800
     * @tc.name      : testNapiWorkerGC0018
     * @tc.desc      : NapiWorkerTest createDouble
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0018', 0, async () => {
      const caseName: string = 'testNapiWorkerGC0018';
      console.info(`${caseName} test start`);
      let state: boolean = false;
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        ArkTools.forceFullGC();
        myWorker.postMessage('createDouble');
        myWorker.onmessage = (e) => {
          console.log(`${caseName} result: ` + JSON.stringify(e));
          expect(e.data).assertEqual(24.67);
          myWorker.terminate();
        }
        myWorker.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_1900
     * @tc.name      : testNapiWorkerGC0019
     * @tc.desc      : NapiWorkerTest createAndGetStringUtf16
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0019', 0, async () => {
      const caseName: string = 'testNapiWorkerGC0019';
      console.info(`${caseName} test start`);
      let state: boolean = false;
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        ArkTools.forceFullGC();
        myWorker.postMessage('createAndGetStringUtf16');
        myWorker.onmessage = (e) => {
          console.log(`${caseName} result: ` + JSON.stringify(e));
          expect(e.data).assertEqual('he');
          myWorker.terminate();
        }
        myWorker.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_2000
     * @tc.name      : testNapiWorkerGC0020
     * @tc.desc      : NapiWorkerTest stringUtf16OfCase
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0020', 0, async () => {
      const caseName: string = 'testNapiWorkerGC0020';
      console.info(`${caseName} test start`);
      let state: boolean = false;
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        ArkTools.forceFullGC();
        myWorker.postMessage('stringUtf16OfCase');
        myWorker.onmessage = (e) => {
          console.log(`${caseName} result: ` + JSON.stringify(e));
          expect(e.data).assertEqual('abc2');
          myWorker.terminate();
        }
        myWorker.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_2100
     * @tc.name      : testNapiWorkerGC0021
     * @tc.desc      : NapiWorkerTest getValueDouble
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0021', 0, async () => {
      const caseName: string = 'testNapiWorkerGC0021';
      console.info(`${caseName} test start`);
      let state: boolean = false;
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        ArkTools.forceFullGC();
        myWorker.postMessage('getValueDouble');
        myWorker.onmessage = (e) => {
          console.log(`${caseName} result: ` + JSON.stringify(e));
          expect(e.data).assertEqual(24.5);
          myWorker.terminate();
        }
        myWorker.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_2200
     * @tc.name      : testNapiWorkerGC0022
     * @tc.desc      : NapiWorkerTest getValueExternal
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0022', 0, async () => {
      const caseName: string = 'testNapiWorkerGC0022';
      console.info(`${caseName} test start`);
      let state: boolean = false;
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        ArkTools.forceFullGC();
        myWorker.postMessage('getValueExternal');
        myWorker.onmessage = (e) => {
          console.log(`${caseName} result: ` + JSON.stringify(e));
          expect(e.data).assertEqual(0);
          myWorker.terminate();
        }
        myWorker.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_2300
     * @tc.name      : testNapiWorkerGC0023
     * @tc.desc      : NapiWorkerTest getNull
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0023', 0, async () => {
      const caseName: string = 'testNapiWorkerGC0023';
      console.info(`${caseName} test start`);
      let state: boolean = false;
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        ArkTools.forceFullGC();
        myWorker.postMessage('getNull');
        myWorker.onmessage = (e) => {
          console.log(`${caseName} result: ` + JSON.stringify(e));
          expect(e.data).assertEqual(0);
          myWorker.terminate();
        }
        myWorker.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_2400
     * @tc.name      : testNapiWorkerGC0024
     * @tc.desc      : NapiWorkerTest getUndefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0024', 0, async () => {
      const caseName: string = 'testNapiWorkerGC0024';
      console.info(`${caseName} test start`);
      let state: boolean = false;
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        ArkTools.forceFullGC();
        myWorker.postMessage('getUndefined');
        myWorker.onmessage = (e) => {
          console.log(`${caseName} result: ` + JSON.stringify(e));
          expect(e.data).assertEqual(0);
          myWorker.terminate();
        }
        myWorker.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_2500
     * @tc.name      : testNapiWorkerGC0025
     * @tc.desc      : NapiWorkerTest coerceToBool
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0025', 0, async () => {
      const caseName: string = 'testNapiWorkerGC0025';
      console.info(`${caseName} test start`);
      let state: boolean = false;
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        ArkTools.forceFullGC();
        myWorker.postMessage('coerceToBool');
        myWorker.onmessage = (e) => {
          console.log(`${caseName} result: ` + JSON.stringify(e));
          expect(e.data).assertFalse();
          myWorker.terminate();
        }
        myWorker.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_2600
     * @tc.name      : testNapiWorkerGC0026
     * @tc.desc      : NapiWorkerTest coerceToNumber
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0026', 0, async () => {
      const caseName: string = 'testNapiWorkerGC0026';
      console.info(`${caseName} test start`);
      let state: boolean = false;
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        ArkTools.forceFullGC();
        myWorker.postMessage('coerceToNumber');
        myWorker.onmessage = (e) => {
          console.log(`${caseName} result: ` + JSON.stringify(e));
          expect(e.data).assertEqual(12);
          myWorker.terminate();
        }
        myWorker.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    })
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_2700
     * @tc.name      : testNapiWorkerGC0027
     * @tc.desc      : NapiWorkerTest coerceToObject
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0027', 0, async () => {
      const caseName: string = 'testNapiWorkerGC0027';
      console.info(`${caseName} test start`);
      let state: boolean = false;
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        ArkTools.forceFullGC();
        myWorker.postMessage('coerceToObject');
        myWorker.onmessage = (e) => {
          console.log(`${caseName} result: ` + JSON.stringify(e));
          expect(e.data).assertEqual('[2,3]');
          myWorker.terminate();
        }
        myWorker.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_2800
     * @tc.name      : testNapiWorkerGC0028
     * @tc.desc      : NapiWorkerTest coerceToString
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0028', 0, async () => {
      const caseName: string = 'testNapiWorkerGC0028';
      console.info(`${caseName} test start`);
      let state: boolean = false;
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        ArkTools.forceFullGC();
        myWorker.postMessage('coerceToString');
        myWorker.onmessage = (e) => {
          console.log(`${caseName} result: ` + JSON.stringify(e));
          expect(e.data).assertEqual('123');
          myWorker.terminate();
        }
        myWorker.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_2900
     * @tc.name      : testNapiWorkerGC0029
     * @tc.desc      : NapiWorkerTest typeOf
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0029', 0, async () => {
      const caseName: string = 'testNapiWorkerGC0029';
      console.info(`${caseName} test start`);
      let state: boolean = false;
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        ArkTools.forceFullGC();
        myWorker.postMessage('typeOf');
        myWorker.onmessage = (e) => {
          console.log(`${caseName} result: ` + JSON.stringify(e));
          expect(e.data).assertEqual(0);
          myWorker.terminate();
        }
        myWorker.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_3000
     * @tc.name      : testNapiWorkerGC0030
     * @tc.desc      : NapiWorkerTest isArray
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0030', 0, async () => {
      const caseName: string = 'testNapiWorkerGC0030';
      console.info(`${caseName} test start`);
      let state: boolean = false;
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        ArkTools.forceFullGC();
        myWorker.postMessage('isArray');
        myWorker.onmessage = (e) => {
          console.log(`${caseName} result: ` + JSON.stringify(e));
          expect(e.data).assertEqual(0);
          myWorker.terminate();
        }
        myWorker.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_3100
     * @tc.name      : testNapiWorkerGC0031
     * @tc.desc      : NapiWorkerTest strictEquals
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0031', 0, async () => {
      const caseName: string = 'testNapiWorkerGC0031';
      console.info(`${caseName} test start`);
      let state: boolean = false;
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        ArkTools.forceFullGC();
        myWorker.postMessage('strictEquals');
        myWorker.onmessage = (e) => {
          console.log(`${caseName} result: ` + JSON.stringify(e));
          expect(e.data).assertEqual(0);
          myWorker.terminate();
        }
        myWorker.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_3200
     * @tc.name      : testNapiWorkerGC0032
     * @tc.desc      : NapiWorkerTest getPropertyNames
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0032', 0, async () => {
      const caseName: string = 'testNapiWorkerGC0032';
      console.info(`${caseName} test start`);
      let state: boolean = false;
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        ArkTools.forceFullGC();
        myWorker.postMessage('getPropertyNames');
        myWorker.onmessage = (e) => {
          console.log(`${caseName} result: ` + JSON.stringify(e));
          expect(e.data).assertEqual(0);
          myWorker.terminate();
        }
        myWorker.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_3300
     * @tc.name      : testNapiWorkerGC0033
     * @tc.desc      : NapiWorkerTest setProperty
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0033', 0, async () => {
      const caseName: string = 'testNapiWorkerGC0033';
      console.info(`${caseName} test start`);
      let state: boolean = false;
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        ArkTools.forceFullGC();
        myWorker.postMessage('setProperty');
        myWorker.onmessage = (e) => {
          console.log(`${caseName} result: ` + JSON.stringify(e));
          expect(e.data).assertTrue();
          myWorker.terminate();
        }
        myWorker.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_3400
     * @tc.name      : testNapiWorkerGC0034
     * @tc.desc      : NapiWorkerTest getProperty
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0034', 0, async () => {
      const caseName: string = 'testNapiWorkerGC0034';
      console.info(`${caseName} test start`);
      let state: boolean = false;
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        ArkTools.forceFullGC();
        myWorker.postMessage('getProperty');
        myWorker.onmessage = (e) => {
          console.log(`${caseName} result: ` + JSON.stringify(e));
          expect(e.data).assertTrue();
          myWorker.terminate();
        }
        myWorker.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_3500
     * @tc.name      : testNapiWorkerGC0035
     * @tc.desc      : NapiWorkerTest hasProperty
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0035', 0, async () => {
      const caseName: string = 'testNapiWorkerGC0035';
      console.info(`${caseName} test start`);
      let state: boolean = false;
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        ArkTools.forceFullGC();
        myWorker.postMessage('hasProperty');
        myWorker.onmessage = (e) => {
          console.log(`${caseName} result: ` + JSON.stringify(e));
          expect(e.data).assertEqual(0);
          myWorker.terminate();
        }
        myWorker.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_3600
     * @tc.name      : testNapiWorkerGC0036
     * @tc.desc      : NapiWorkerTest setAndDeleteProperty
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0036', 0, async () => {
      const caseName: string = 'testNapiWorkerGC0036';
      console.info(`${caseName} test start`);
      let state: boolean = false;
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        ArkTools.forceFullGC();
        myWorker.postMessage('setAndDeleteProperty');
        myWorker.onmessage = (e) => {
          console.log(`${caseName} result: ` + JSON.stringify(e));
          expect(e.data).assertEqual(0);
          myWorker.terminate();
        }
        myWorker.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_3700
     * @tc.name      : testNapiWorkerGC0037
     * @tc.desc      : NapiWorkerTest hasOwnProperty
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0037', 0, async () => {
      const caseName: string = 'testNapiWorkerGC0037';
      console.info(`${caseName} test start`);
      let state: boolean = false;
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        ArkTools.forceFullGC();
        myWorker.postMessage('hasOwnProperty');
        myWorker.onmessage = (e) => {
          console.log(`${caseName} result: ` + JSON.stringify(e));
          expect(e.data).assertTrue();
          myWorker.terminate();
        }
        myWorker.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_3800
     * @tc.name      : testNapiWorkerGC0038
     * @tc.desc      : NapiWorkerTest setNamedProperty
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0038', 0, async () => {
      const caseName: string = 'testNapiWorkerGC0038';
      console.info(`${caseName} test start`);
      let state: boolean = false;
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        ArkTools.forceFullGC();
        myWorker.postMessage('setNamedProperty');
        myWorker.onmessage = (e) => {
          console.log(`${caseName} result: ` + JSON.stringify(e));
          expect(e.data).assertTrue();
          myWorker.terminate();
        }
        myWorker.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_3900
     * @tc.name      : testNapiWorkerGC0039
     * @tc.desc      : NapiWorkerTest getNamedProperty
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0039', 0, async () => {
      const caseName: string = 'testNapiWorkerGC0039';
      console.info(`${caseName} test start`);
      let state: boolean = false;
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        ArkTools.forceFullGC();
        myWorker.postMessage('getNamedProperty');
        myWorker.onmessage = (e) => {
          console.log(`${caseName} result: ` + JSON.stringify(e));
          expect(e.data).assertEqual('zhangsan');
          myWorker.terminate();
        }
        myWorker.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_4000
     * @tc.name      : testNapiWorkerGC0040
     * @tc.desc      : NapiWorkerTest hasNamedProperty
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0040', 0, async () => {
      const caseName = 'testNapiWorkerGC0040';
      console.info(`${caseName} test start`);
      let state = false;
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        ArkTools.forceFullGC();
        myWorker.postMessage('hasNamedProperty');
        myWorker.onmessage = (e) => {
          console.log(`${caseName} result: ` + JSON.stringify(e));
          expect(e.data).assertTrue();
          myWorker.terminate();
        }
        myWorker.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_4100
     * @tc.name      : testNapiWorkerGC0041
     * @tc.desc      : NapiWorkerTest setElement
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0041', 0, async () => {
      const caseName = 'testNapiWorkerGC0041';
      console.info(`${caseName} test start`);
      let state = false;
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        ArkTools.forceFullGC();
        myWorker.postMessage('setElement');
        myWorker.onmessage = (e) => {
          console.log(`${caseName} result: ` + JSON.stringify(e));
          expect(e.data).assertTrue();
          myWorker.terminate();
        }
        myWorker.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_4200
     * @tc.name      : testNapiWorkerGC0042
     * @tc.desc      : NapiWorkerTest getElement
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0042', 0, async () => {
      const caseName = 'testNapiWorkerGC0042';
      console.info(`${caseName} test start`);
      let state = false;
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        ArkTools.forceFullGC();
        myWorker.postMessage('getElement');
        myWorker.onmessage = (e) => {
          console.log(`${caseName} result: ` + JSON.stringify(e));
          expect(e.data).assertTrue();
          myWorker.terminate();
        }
        myWorker.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_4300
     * @tc.name      : testNapiWorkerGC0043
     * @tc.desc      : NapiWorkerTest hasElement
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0043', 0, async () => {
      const caseName = 'testNapiWorkerGC0043';
      console.info(`${caseName} test start`);
      let state = false;
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        ArkTools.forceFullGC();
        myWorker.postMessage('hasElement');
        myWorker.onmessage = (e) => {
          console.log(`${caseName} result: ` + JSON.stringify(e));
          expect(e.data).assertTrue();
          myWorker.terminate();
        }
        myWorker.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_4400
     * @tc.name      : testNapiWorkerGC0044
     * @tc.desc      : NapiWorkerTest deleteElement
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0044', 0, async () => {
      const caseName = 'testNapiWorkerGC0044';
      console.info(`${caseName} test start`);
      let state = false;
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        ArkTools.forceFullGC();
        myWorker.postMessage('deleteElement');
        myWorker.onmessage = (e) => {
          console.log(`${caseName} result: ` + JSON.stringify(e));
          expect(e.data).assertTrue();
          myWorker.terminate();
        }
        myWorker.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_4500
     * @tc.name      : testNapiWorkerGC0045
     * @tc.desc      : NapiWorkerTest defineProperties
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0045', 0, async () => {
      const caseName = 'testNapiWorkerGC0045';
      console.info(`${caseName} test start`);
      let state = false;
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        ArkTools.forceFullGC();
        myWorker.postMessage('defineProperties');
        myWorker.onmessage = (e) => {
          console.log(`${caseName} result: ` + JSON.stringify(e));
          expect(e.data).assertTrue();
          myWorker.terminate();
        }
        myWorker.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_4600
     * @tc.name      : testNapiWorkerGC0046
     * @tc.desc      : NapiWorkerTest callFunctionNull
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0046', 0, async () => {
      const caseName = 'testNapiWorkerGC0046';
      console.info(`${caseName} test start`);
      let state = false;
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        ArkTools.forceFullGC();
        myWorker.postMessage('callFunctionNull');
        myWorker.onmessage = (e) => {
          console.log(`${caseName} result: ` + JSON.stringify(e));
          expect(e.data).assertEqual(1);
          myWorker.terminate();
        }
        myWorker.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_4700
     * @tc.name      : testNapiWorkerGC0047
     * @tc.desc      : NapiWorkerTest napiCreateFunctionFuncNull
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0047', 0, async () => {
      const caseName = 'testNapiWorkerGC0047';
      console.info(`${caseName} test start`);
      let state = false;
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        ArkTools.forceFullGC();
        myWorker.postMessage('napiCreateFunctionFuncNull');
        myWorker.onmessage = (e) => {
          console.log(`${caseName} result: ` + JSON.stringify(e));
          expect(e.data).assertEqual(0);
          myWorker.terminate();
        }
        myWorker.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_4800
     * @tc.name      : testNapiWorkerGC0048
     * @tc.desc      : NapiWorkerTest napiGetCbInfo
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0048', 0, async () => {
      const caseName = 'testNapiWorkerGC0048';
      console.info(`${caseName} test start`);
      let state = false;
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        ArkTools.forceFullGC();
        myWorker.postMessage('napiGetCbInfo');
        myWorker.onmessage = (e) => {
          console.log(`${caseName} result: ` + JSON.stringify(e));
          expect(e.data).assertEqual(12.06);
          myWorker.terminate();
        }
        myWorker.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_4900
     * @tc.name      : testNapiWorkerGC0049
     * @tc.desc      : NapiWorkerTest unwrap
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0049', 0, async () => {
      const caseName = 'testNapiWorkerGC0049';
      console.info(`${caseName} test start`);
      let state = false;
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        ArkTools.forceFullGC();
        myWorker.postMessage('unwrap');
        myWorker.onmessage = (e) => {
          console.log(`${caseName} result: ` + JSON.stringify(e));
          expect(e.data).assertEqual(0);
          myWorker.terminate();
        }
        myWorker.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_5000
     * @tc.name      : testNapiWorkerGC0050
     * @tc.desc      : NapiWorkerTest removeWrap
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0050', 0, async () => {
      const caseName = 'testNapiWorkerGC0050';
      console.info(`${caseName} test start`);
      let state = false;
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        ArkTools.forceFullGC();
        myWorker.postMessage('removeWrap');
        myWorker.onmessage = (e) => {
          console.log(`${caseName} result: ` + JSON.stringify(e));
          expect(e.data).assertEqual(0);
          myWorker.terminate();
        }
        myWorker.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_5100
     * @tc.name      : testNapiWorkerGC0051
     * @tc.desc      : NapiWorkerTest getVersion
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0051', 0, async () => {
      const caseName = 'testNapiWorkerGC0051';
      console.info(`${caseName} test start`);
      let state = false;
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        ArkTools.forceFullGC();
        myWorker.postMessage('getVersion');
        myWorker.onmessage = (e) => {
          console.log(`${caseName} result: ` + JSON.stringify(e));
          expect(e.data).assertEqual(8);
          myWorker.terminate();
        }
        myWorker.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_5200
     * @tc.name      : testNapiWorkerGC0052
     * @tc.desc      : NapiWorkerTest createPromise
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0052', 0, async () => {
      const caseName = 'testNapiWorkerGC0052';
      console.info(`${caseName} test start`);
      let state = false;
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        ArkTools.forceFullGC();
        myWorker.postMessage('createPromise');
        myWorker.onmessage = (e) => {
          console.log(`${caseName} result: ` + JSON.stringify(e));
          expect(e.data).assertEqual(0);
          myWorker.terminate();
        }
        myWorker.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_5300
     * @tc.name      : testNapiWorkerGC0053
     * @tc.desc      : NapiWorkerTest resolveAndRejectDeferred
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0053', 0, async () => {
      const caseName = 'testNapiWorkerGC0053';
      console.info(`${caseName} test start`);
      let state = false;
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        ArkTools.forceFullGC();
        myWorker.postMessage('resolveAndRejectDeferred');
        myWorker.onmessage = (e) => {
          console.log(`${caseName} result: ` + JSON.stringify(e));
          expect(e.data).assertEqual(0);
          myWorker.terminate();
        }
        myWorker.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_5400
     * @tc.name      : testNapiWorkerGC0054
     * @tc.desc      : NapiWorkerTest isPromise
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0054', 0, async () => {
      const caseName = 'testNapiWorkerGC0054';
      console.info(`${caseName} test start`);
      let state = false;
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        ArkTools.forceFullGC();
        myWorker.postMessage('isPromise');
        myWorker.onmessage = (e) => {
          console.log(`${caseName} result: ` + JSON.stringify(e));
          expect(e.data).assertEqual(0);
          myWorker.terminate();
        }
        myWorker.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_5500
     * @tc.name      : testNapiWorkerGC0055
     * @tc.desc      : NapiWorkerTest napiCreateThreadsafeFunction
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0055', 0, async () => {
      const caseName = 'testNapiWorkerGC0055';
      console.info(`${caseName} test start`);
      let state = false;
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        ArkTools.forceFullGC();
        myWorker.postMessage('napiCreateThreadsafeFunction');
        myWorker.onmessage = (e) => {
          console.log(`${caseName} result: ` + JSON.stringify(e));
          expect(e.data).assertEqual(0);
          myWorker.terminate();
        }
        myWorker.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_5600
     * @tc.name      : testNapiWorkerGC0056
     * @tc.desc      : NapiWorkerTest napiDeleteSerializationData
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0056', 0, async () => {
      const caseName = 'testNapiWorkerGC0056';
      console.info(`${caseName} test start`);
      let state = false;
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        ArkTools.forceFullGC();
        myWorker.postMessage('napiDeleteSerializationDataTest');
        myWorker.onmessage = (e) => {
          console.log(`${caseName} result: ` + JSON.stringify(e));
          expect(e.data).assertEqual(2000);
          myWorker.terminate();
        }
        myWorker.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_5700
     * @tc.name      : testNapiWorkerGC0057
     * @tc.desc      : NapiWorkerTest napiCallThreadsafeFunction
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0057', 0, async () => {
      const caseName = 'testNapiWorkerGC0057';
      console.info(`${caseName} test start`);
      let state = false;
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        ArkTools.forceFullGC();
        myWorker.postMessage('napiCallThreadsafeFunction');
        myWorker.onmessage = (e) => {
          console.log(`${caseName} result: ` + JSON.stringify(e));
          expect(e.data).assertEqual(0);
          myWorker.terminate();
        }
        myWorker.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_5800
     * @tc.name      : testNapiWorkerGC0058
     * @tc.desc      : NapiWorkerTest napiAnotherThreadSafeTest
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0058', 0, async () => {
      const caseName = 'testNapiWorkerGC0058';
      console.info(`${caseName} test start`);
      let state = false;
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        ArkTools.forceFullGC();
        myWorker.postMessage('napiAnotherThreadSafeTest');
        myWorker.onmessage = (e) => {
          console.log(`${caseName} result: ` + JSON.stringify(e));
          expect(e.data).assertEqual(1);
          myWorker.terminate();
        }
        myWorker.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_5900
     * @tc.name      : testNapiWorkerGC0059
     * @tc.desc      : NapiWorkerTest napiRefThreadsafeFunction
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0059', 0, async () => {
      const caseName = 'testNapiWorkerGC0059';
      console.info(`${caseName} test start`);
      let state = false;
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        ArkTools.forceFullGC();
        myWorker.postMessage('napiRefThreadsafeFunction');
        myWorker.onmessage = (e) => {
          console.log(`${caseName} result: ` + JSON.stringify(e));
          expect(e.data).assertEqual(0);
          myWorker.terminate();
        }
        myWorker.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_6000
     * @tc.name      : testNapiWorkerGC0060
     * @tc.desc      : NapiWorkerTest napiCreateDate
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0060', 0, async () => {
      const caseName = 'testNapiWorkerGC0060';
      console.info(`${caseName} test start`);
      let state = false;
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        ArkTools.forceFullGC();
        myWorker.postMessage('napiCreateDate');
        myWorker.onmessage = (e) => {
          console.log(`${caseName} result: ` + JSON.stringify(e));
          expect(e.data).assertEqual(1);
          myWorker.terminate();
        }
        myWorker.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_6100
     * @tc.name      : testNapiWorkerGC0061
     * @tc.desc      : NapiWorkerTest napiCreateBigintInt64
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0061', 0, async () => {
      const caseName = 'testNapiWorkerGC0061';
      console.info(`${caseName} test start`);
      let state = false;
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        ArkTools.forceFullGC();
        myWorker.postMessage('napiCreateBigintInt64');
        myWorker.onmessage = (e) => {
          console.log(`${caseName} result: ` + JSON.stringify(e));
          expect(e.data).assertEqual(1);
          myWorker.terminate();
        }
        myWorker.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_6200
     * @tc.name      : testNapiWorkerGC0062
     * @tc.desc      : NapiWorkerTest napiCreateBigintUint64
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0062', 0, async () => {
      const caseName = 'testNapiWorkerGC0062';
      console.info(`${caseName} test start`);
      let state = false;
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        ArkTools.forceFullGC();
        myWorker.postMessage('napiCreateBigintUint64');
        myWorker.onmessage = (e) => {
          console.log(`${caseName} result: ` + JSON.stringify(e));
          expect(e.data).assertEqual(1);
          myWorker.terminate();
        }
        myWorker.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_6300
     * @tc.name      : testNapiWorkerGC0063
     * @tc.desc      : NapiWorkerTest napiCreateBigintWords
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0063', 0, async () => {
      const caseName = 'testNapiWorkerGC0063';
      console.info(`${caseName} test start`);
      let state = false;
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        ArkTools.forceFullGC();
        myWorker.postMessage('napiCreateBigintWords');
        myWorker.onmessage = (e) => {
          console.log(`${caseName} result: ` + JSON.stringify(e));
          expect(e.data).assertEqual(1);
          myWorker.terminate();
        }
        myWorker.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_6400
     * @tc.name      : testNapiWorkerGC0064
     * @tc.desc      : NapiWorkerTest GetAllPropertyNamesEnvNull
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0064', 0, async () => {
      const caseName = 'testNapiWorkerGC0064';
      console.info(`${caseName} test start`);
      let state = false;
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        ArkTools.forceFullGC();
        myWorker.postMessage('GetAllPropertyNamesEnvNull');
        myWorker.onmessage = (e) => {
          console.log(`${caseName} result: ` + JSON.stringify(e));
          expect(e.data).assertEqual(1);
          myWorker.terminate();
        }
        myWorker.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_6500
     * @tc.name      : testNapiWorkerGC0065
     * @tc.desc      : NapiWorkerTest napiSetInstanceData
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0065', 0, async () => {
      const caseName = 'testNapiWorkerGC0065';
      console.info(`${caseName} test start`);
      let state = false;
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        ArkTools.forceFullGC();
        myWorker.postMessage('napiSetInstanceData');
        myWorker.onmessage = (e) => {
          console.log(`${caseName} result: ` + JSON.stringify(e));
          expect(e.data).assertEqual(1);
          myWorker.terminate();
        }
        myWorker.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_6600
     * @tc.name      : testNapiWorkerGC0066
     * @tc.desc      : NapiWorkerTest getModuleFileName
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0066', 0, async () => {
      const caseName = 'testNapiWorkerGC0066';
      console.info(`${caseName} test start`);
      let state = false;
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        ArkTools.forceFullGC();
        myWorker.postMessage('getModuleFileName');
        myWorker.onmessage = (e) => {
          console.log(`${caseName} result: ` + JSON.stringify(e));
          expect(e.data < 0).assertTrue();
          myWorker.terminate();
        }
        myWorker.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_6700
     * @tc.name      : testNapiWorkerGC0067
     * @tc.desc      : NapiWorkerTest createAsyncResource
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0067', 0, async () => {
      const caseName = 'testNapiWorkerGC0067';
      console.info(`${caseName} test start`);
      let state = false;
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        ArkTools.forceFullGC();
        myWorker.postMessage('createAsyncResource');
        myWorker.onmessage = (e) => {
          console.log(`${caseName} result: ` + JSON.stringify(e));
          expect(e.data instanceof Object).assertTrue();
          myWorker.terminate();
        }
        myWorker.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_6800
     * @tc.name      : testNapiWorkerGC0068
     * @tc.desc      : NapiWorkerTest asyncWorkWithQos
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0068', 0, async () => {
      const caseName = 'testNapiWorkerGC0068';
      console.info(`${caseName} test start`);
      let state = false;
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        ArkTools.forceFullGC();
        myWorker.postMessage('asyncWorkWithQos');
        myWorker.onmessage = (e) => {
          console.log(`${caseName} result: ` + JSON.stringify(e));
          expect(e.data).assertEqual(0);
          myWorker.terminate();
        }
        myWorker.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_6900
     * @tc.name      : testNapiWorkerGC0069
     * @tc.desc      : NapiWorkerTest napiRunScriptPathEnvNull
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0069', 0, async () => {
      const caseName = 'testNapiWorkerGC0069';
      console.info(`${caseName} test start`);
      let state = false;
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        ArkTools.forceFullGC();
        myWorker.postMessage('napiRunScriptPathEnvNull');
        myWorker.onmessage = (e) => {
          console.log(`${caseName} result: ` + JSON.stringify(e));
          expect(e.data).assertEqual(1);
          myWorker.terminate();
        }
        myWorker.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_7000
     * @tc.name      : testNapiWorkerGC0070
     * @tc.desc      : NapiWorkerTest napiLoadModule
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0070', 0, async () => {
      const caseName = 'testNapiWorkerGC0070';
      console.info(`${caseName} test start`);
      let state = false;
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        ArkTools.forceFullGC();
        myWorker.postMessage('napiLoadModuleTest');
        myWorker.onmessage = (e) => {
          console.log(`${caseName} result: ` + JSON.stringify(e));
          expect(e.data).assertEqual(0);
          myWorker.terminate();
        }
        myWorker.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_7100
     * @tc.name      : testNapiWorkerGC0071
     * @tc.desc      : NapiWorkerTest createObjectWithProperties
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0071', 0, async () => {
      const caseName = 'testNapiWorkerGC0071';
      console.info(`${caseName} test start`);
      let state = false;
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        ArkTools.forceFullGC();
        myWorker.postMessage('createObjectWithProperties');
        myWorker.onmessage = (e) => {
          console.log(`${caseName} result: ` + JSON.stringify(e));
          expect(e.data).assertEqual(0);
          myWorker.terminate();
        }
        myWorker.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_7200
     * @tc.name      : testNapiWorkerGC0072
     * @tc.desc      : NapiWorkerTest createObjectWithNamedProperties
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0072', 0, async () => {
      const caseName = 'testNapiWorkerGC0072';
      console.info(`${caseName} test start`);
      let state = false;
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        ArkTools.forceFullGC();
        myWorker.postMessage('createObjectWithNamedProperties');
        myWorker.onmessage = (e) => {
          console.log(`${caseName} result: ` + JSON.stringify(e));
          expect(e.data).assertEqual(0);
          myWorker.terminate();
        }
        myWorker.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_7300
     * @tc.name      : testNapiWorkerGC0073
     * @tc.desc      : NapiWorkerTest coerceToNativeBindingObjectEnvNull
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0073', 0, async () => {
      const caseName = 'testNapiWorkerGC0073';
      console.info(`${caseName} test start`);
      let state = false;
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        ArkTools.forceFullGC();
        myWorker.postMessage('coerceToNativeBindingObjectEnvNull');
        myWorker.onmessage = (e) => {
          console.log(`${caseName} result: ` + JSON.stringify(e));
          expect(e.data).assertEqual(1);
          myWorker.terminate();
        }
        myWorker.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_7400
     * @tc.name      : testNapiWorkerGC0074
     * @tc.desc      : NapiWorkerTest napiSerialize
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0074', 0, async () => {
      const caseName = 'testNapiWorkerGC0074';
      console.info(`${caseName} test start`);
      let state = false;
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        ArkTools.forceFullGC();
        myWorker.postMessage('napiSerializeTest');
        myWorker.onmessage = (e) => {
          console.log(`${caseName} result: ` + JSON.stringify(e));
          expect(e.data).assertEqual(2000);
          myWorker.terminate();
        }
        myWorker.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_WORKER_GC_7500
     * @tc.name      : testNapiWorkerGC0075
     * @tc.desc      : NapiWorkerTest napiDeSerialize
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiWorkerGC0075', 0, async () => {
      const caseName = 'testNapiWorkerGC0075';
      console.info(`${caseName} test start`);
      let state = false;
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        ArkTools.forceFullGC();
        myWorker.postMessage('napiDeSerializeTest');
        myWorker.onmessage = (e) => {
          console.log(`${caseName} result: ` + JSON.stringify(e));
          expect(e.data).assertEqual(2000);
          myWorker.terminate();
        }
        myWorker.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_SENDABLE_WORKER_GC_0100
     * @tc.name      : testNapiSendableWorkerGC0001
     * @tc.desc      : NapiTaskTest NapiIsSendable
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiSendableWorkerGC0001', 0, async () => {
      const caseName = 'testNapiSendableWorkerGC0001';
      console.info(`${caseName} test start`);
      let state = false;
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        ArkTools.forceFullGC();
        myWorker.postMessage('napiIsSendableTest');
        myWorker.onmessage = (e) => {
          console.log(`${caseName} result: ` + JSON.stringify(e));
          expect(e.data).assertEqual(false);
          myWorker.terminate();
        }
        myWorker.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_SENDABLE_WORKER_GC_0200
     * @tc.name      : testNapiSendableWorkerGC0002
     * @tc.desc      : NapiTaskTest NapiCreateSendableObject
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiSendableWorkerGC0002', 0, async () => {
      const caseName = 'testNapiSendableWorkerGC0002';
      console.info(`${caseName} test start`);
      let state = false;
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        ArkTools.forceFullGC();
        myWorker.postMessage('NapiCreateSendableObject');
        myWorker.onmessage = (e) => {
          console.log(`${caseName} result: ` + JSON.stringify(e));
          expect(e.data).assertEqual(true);
          myWorker.terminate();
        }
        myWorker.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_SENDABLE_WORKER_GC_0300
     * @tc.name      : testNapiSendableWorkerGC0003
     * @tc.desc      : NapiTaskTest NapiCreateSendableArray
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiSendableWorkerGC0003', 0, async () => {
      const caseName = 'testNapiSendableWorkerGC0003';
      console.info(`${caseName} test start`);
      let state = false;
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        ArkTools.forceFullGC();
        myWorker.postMessage('NapiCreateSendableArray');
        myWorker.onmessage = (e) => {
          console.log(`${caseName} result: ` + JSON.stringify(e));
          expect(e.data).assertEqual(true);
          myWorker.terminate();
        }
        myWorker.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_SENDABLE_WORKER_GC_0400
     * @tc.name      : testNapiSendableWorkerGC0004
     * @tc.desc      : NapiTaskTest NapiCreateSendableArrayWithLength
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiSendableWorkerGC0004', 0, async () => {
      const caseName = 'testNapiSendableWorkerGC0004';
      console.info(`${caseName} test start`);
      let state = false;
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        ArkTools.forceFullGC();
        myWorker.postMessage('NapiCreateSendableArrayWithLength');
        myWorker.onmessage = (e) => {
          console.log(`${caseName} result: ` + JSON.stringify(e));
          expect(e.data).assertEqual(true);
          myWorker.terminate();
        }
        myWorker.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_SENDABLE_WORKER_GC_0500
     * @tc.name      : testNapiSendableWorkerGC0005
     * @tc.desc      : NapiTaskTest NapiCreateSendableArrayBuffer
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiSendableWorkerGC0005', 0, async () => {
      const caseName = 'testNapiSendableWorkerGC0005';
      console.info(`${caseName} test start`);
      let state = false;
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        ArkTools.forceFullGC();
        myWorker.postMessage('NapiCreateSendableArrayBuffer');
        myWorker.onmessage = (e) => {
          console.log(`${caseName} result: ` + JSON.stringify(e));
          expect(e.data).assertEqual(true);
          myWorker.terminate();
        }
        myWorker.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_SENDABLE_WORKER_GC_0600
     * @tc.name      : testNapiSendableWorkerGC0006
     * @tc.desc      : NapiTaskTest NapiCreateSendableTypedArray
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiSendableWorkerGC0006', 0, async () => {
      const caseName = 'testNapiSendableWorkerGC0006';
      console.info(`${caseName} test start`);
      let state = false;
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        ArkTools.forceFullGC();
        myWorker.postMessage('NapiCreateSendableTypedArray');
        myWorker.onmessage = (e) => {
          console.log(`${caseName} result: ` + JSON.stringify(e));
          expect(e.data).assertEqual(true);
          myWorker.terminate();
        }
        myWorker.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_SENDABLE_WORKER_GC_0700
     * @tc.name      : testNapiSendableWorkerGC0007
     * @tc.desc      : NapiTaskTest NapiWrapSendable
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiSendableWorkerGC0007', 0, async () => {
      const caseName = 'testNapiSendableWorkerGC0007';
      console.info(`${caseName} test start`);
      let state = false;
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        ArkTools.forceFullGC();
        myWorker.postMessage('NapiWrapSendable');
        myWorker.onmessage = (e) => {
          console.log(`${caseName} result: ` + JSON.stringify(e));
          expect(e.data).assertEqual(true);
          myWorker.terminate();
        }
        myWorker.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });

    /**
     * @tc.number    : SUB_ACE_BASIC_ETS_NAPI_SENDABLE_WORKER_GC_0800
     * @tc.name      : testNapiSendableWorkerGC0008
     * @tc.desc      : NapiTaskTest NapiWrapSendableWithSize
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testNapiSendableWorkerGC0008', 0, async () => {
      const caseName = 'testNapiSendableWorkerGC0008';
      console.info(`${caseName} test start`);
      let state = false;
      try {
        const myWorker = new worker.ThreadWorker('../workers/WorkerGC.ets');
        ArkTools.forceFullGC();
        myWorker.postMessage('NapiWrapSendableWithSize');
        myWorker.onmessage = (e) => {
          console.log(`${caseName} result: ` + JSON.stringify(e));
          expect(e.data).assertEqual(true);
          myWorker.terminate();
        }
        myWorker.onexit = (code) => {
          console.log(`${caseName} main onexit code: ` + JSON.stringify(code));
          state = true;
        }
        while (!state) {
          await sleep(100);
        }
      } catch (error) {
        console.error(`${caseName} catch error: code => ${error.code} message => ${error.message}`);
        expect().assertFail();
      }
      console.info(`${caseName} test end`);
    });
  })
}