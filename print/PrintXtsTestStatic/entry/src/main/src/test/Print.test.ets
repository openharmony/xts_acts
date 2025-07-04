/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import print from '@ohos.print';
import Context from 'application.Context';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { BusinessError } from '@ohos.base';


const domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
const tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

function registerPrintTask(printTask: print.PrintTask) {
  printTask.on('block', () => {
    hilog.info(domain, tag, 'print state is block');
  })
  printTask.on('succeed', () => {
    hilog.info(domain, tag, 'print state is succeed');
  })
  printTask.on('fail', () => {
    hilog.info(domain, tag, 'print state is fail');
  })
  printTask.on('cancel', () => {
    hilog.info(domain, tag, 'print state is cancel');
  })
}

function UnregisterPrintTask(printTask: print.PrintTask) {
  printTask.off('block', () => {
    hilog.info(domain, tag, 'unregister print state is blocked');
  })
  printTask.off('succeed', () => {
    hilog.info(domain, tag, 'unregister print state is succeed');
  })
  printTask.off('fail', () => {
    hilog.info(domain, tag, 'unregister print state is fail');
  })
  printTask.off('cancel', () => {
    hilog.info(domain, tag, 'unregister print state is cancel');
  })
}
class MyPrintDocumentAdapter implements print.PrintDocumentAdapter {
  onStartLayoutWrite(jobId: string, oldAttrs: print.PrintAttributes, newAttrs: print.PrintAttributes, fd: number,
    writeResultCallback: (jobId: string, writeResult: print.PrintFileCreationState) => void) {
    writeResultCallback(jobId, print.PrintFileCreationState.PRINT_FILE_CREATED);
    writeResultCallback(jobId, print.PrintFileCreationState.PRINT_FILE_CREATION_FAILED);
    writeResultCallback(jobId, print.PrintFileCreationState.PRINT_FILE_CREATED_UNRENDERED);
  };

  onJobStateChanged(jobId: string, state: print.PrintDocumentAdapterState) {
    if (state == print.PrintDocumentAdapterState.PREVIEW_DESTROY) {
      hilog.info(domain, tag, '%{public}s', 'PREVIEW_DESTROY');
    } else if (state == print.PrintDocumentAdapterState.PRINT_TASK_SUCCEED) {
      hilog.info(domain, tag, '%{public}s', 'PRINT_TASK_SUCCEED');
    } else if (state == print.PrintDocumentAdapterState.PRINT_TASK_FAIL) {
      hilog.info(domain, tag, '%{public}s', 'PRINT_TASK_FAIL');
    } else if (state == print.PrintDocumentAdapterState.PRINT_TASK_CANCEL) {
      hilog.info(domain, tag, '%{public}s', 'PRINT_TASK_CANCEL');
    } else if (state == print.PrintDocumentAdapterState.PRINT_TASK_BLOCK) {
      hilog.info(domain, tag, '%{public}s', 'PRINT_TASK_BLOCK');
    }
  };
}

export default function printTest() {

  describe("printTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');
    /**
     * @tc.number print_function_0100
     * @tc.name print_function_0100
     * @tc.desc check the print function
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('print_function_0100', Level.LEVEL0, () => {
      hilog.info(domain, tag, '%{public}s', 'print_function_0100 start');
      try {
        const fileList = new Array<string>();
        fileList.push('file://data/print/a.png');
        fileList.push('file://data/print/b.png');
        hilog.info(domain, tag, 'begin test print');
        print.print(fileList, (err: BusinessError<void>|null, printTask: print.PrintTask | undefined) => {
          hilog.info(domain, tag, '%{public}s', 'enter print callback');
        })
      } catch (err) {
        hilog.error(domain, tag, 'print_function_0100 error');
        expect().assertFail();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_0100 end');
    })

    /**
     * @tc.number print_function_0200
     * @tc.name print_function_0200
     * @tc.desc check the enum api
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('print_function_0200', Level.LEVEL0, () => {
      hilog.info(domain, tag, '%{public}s', 'print_function_0200 start');
      try {
        let printDuplexMode = [
          print.PrintDuplexMode.DUPLEX_MODE_NONE,
          print.PrintDuplexMode.DUPLEX_MODE_LONG_EDGE,
          print.PrintDuplexMode.DUPLEX_MODE_SHORT_EDGE,
        ];

        let printColorMode = [
          print.PrintColorMode.COLOR_MODE_MONOCHROME,
          print.PrintColorMode.COLOR_MODE_COLOR,
        ];

        let printDirectionMode = [
          print.PrintDirectionMode.DIRECTION_MODE_AUTO,
          print.PrintDirectionMode.DIRECTION_MODE_PORTRAIT,
          print.PrintDirectionMode.DIRECTION_MODE_LANDSCAPE,
        ];

        let printPageType = [
          print.PrintPageType.PAGE_ISO_A3,
          print.PrintPageType.PAGE_ISO_A4,
          print.PrintPageType.PAGE_ISO_A5,
          print.PrintPageType.PAGE_JIS_B5,
          print.PrintPageType.PAGE_ISO_C5,
          print.PrintPageType.PAGE_ISO_DL,
          print.PrintPageType.PAGE_LETTER,
          print.PrintPageType.PAGE_LEGAL,
          print.PrintPageType.PAGE_PHOTO_4X6,
          print.PrintPageType.PAGE_PHOTO_5X7,
          print.PrintPageType.PAGE_INT_DL_ENVELOPE,
          print.PrintPageType.PAGE_B_TABLOID,
        ];

        let printDocumentAdapterState = [
          print.PrintDocumentAdapterState.PREVIEW_DESTROY,
          print.PrintDocumentAdapterState.PRINT_TASK_SUCCEED,
          print.PrintDocumentAdapterState.PRINT_TASK_FAIL,
          print.PrintDocumentAdapterState.PRINT_TASK_CANCEL,
          print.PrintDocumentAdapterState.PRINT_TASK_BLOCK,
        ];

        let printFileCreationState = [
          print.PrintFileCreationState.PRINT_FILE_CREATED,
          print.PrintFileCreationState.PRINT_FILE_CREATION_FAILED,
          print.PrintFileCreationState.PRINT_FILE_CREATED_UNRENDERED,
        ];
      } catch (err) {
        hilog.error(domain, tag, 'print_function_0200 error');
        expect().assertFail();
      }
    })

    /**
     * @tc.number print_function_0300
     * @tc.name print_function_0300
     * @tc.desc check the enum api
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('print_function_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_0300 start');
      try {
        const extensionList = ['extension1', 'extension2'];
        print.startDiscoverPrinter(extensionList).then(() => {
          hilog.info(domain, tag, 'print_function_0300 success');
          done();
        }).catch((err: Object | null | undefined) => {
          let error = err as BusinessError;
          hilog.error(domain, tag, 'print_function_0300 error, %{public}s', JSON.stringify(error));
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_0300 error');
        expect().assertFail();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_0300 end');
    })

    /**
     * @tc.number print_function_0400
     * @tc.name print_function_0400
     * @tc.desc check the enum api
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('print_function_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_0400 start');

      try {
        const extensionList = ['extension1', 'extension2'];
        print.startDiscoverPrinter(extensionList, (err: Object | null | undefined) => {
          if (err) {
            const error = err as BusinessError;
            hilog.error(domain, tag, 'print_function_0400 error, code: %{public}d, message: %{public}s',
              error.code, error.message);
          } else {
            hilog.info(domain, tag, 'print_function_0400 success');
          }
          done();
        });
      } catch (err) {
        const error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_0400 error');
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_0400 end');
    });

    /**
     * @tc.number print_function_0500
     * @tc.name print_function_0500
     * @tc.desc check the enum api
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('print_function_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_0500 start');
      try {
        print.stopDiscoverPrinter().then(() => {
          hilog.info(domain, tag, 'print_function_0500 success');
          done();
        }).catch((err: Object | null | undefined) => {
          let error = err as BusinessError;
          hilog.error(domain, tag, 'print_function_0500 error, %{public}s', JSON.stringify(error));
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_0500 error');
        expect().assertFail();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_0500 end');
    })

    /**
     * @tc.number print_function_0600
     * @tc.name print_function_0600
     * @tc.desc check the enum api
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('print_function_0600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_0600 start');

      try {
        print.stopDiscoverPrinter((err: Object | null | undefined) => {
          if (err) {
            const error = err as BusinessError;
            hilog.error(domain, tag, 'print_function_0600 error, code: %{public}d, message: %{public}s',
              error.code, error.message);
          } else {
            hilog.info(domain, tag, 'print_function_0600 success');
          }
          done();
        });
      } catch (err) {
        const error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_0600 error');
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_0600 end');
    });

    /**
     * @tc.number print_function_0700
     * @tc.name print_function_0700
     * @tc.desc check the enum api
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('print_function_0700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_0700 start');
      try {
        let printerId : string = 'testPrinterId';
        print.connectPrinter(printerId).then(() => {
          hilog.info(domain, tag, 'print_function_0700 success');
          done();
        }).catch((err: Object | null | undefined) => {
          let error = err as BusinessError;
          hilog.error(domain, tag, 'print_function_0700 error, %{public}s', JSON.stringify(error));
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_0700 error');
        expect().assertFail();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_0700 end');
    })

    /**
     * @tc.number print_function_0800
     * @tc.name print_function_0800
     * @tc.desc check the enum api
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('print_function_0800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_0800 start');

      try {
        let printerId : string = 'testPrinterId';
        print.connectPrinter(printerId, (err: Object | null | undefined) => {
          if (err) {
            const error = err as BusinessError;
            hilog.error(domain, tag, 'print_function_0800 error, code: %{public}d, message: %{public}s',
              error.code, error.message);
          } else {
            hilog.info(domain, tag, 'print_function_0800 success');
          }
          done();
        });
      } catch (err) {
        const error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_0800 error');
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_0800 end');
    });

    /**
     * @tc.number print_function_0900
     * @tc.name print_function_0900
     * @tc.desc check the enum api
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('print_function_0900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_0900 start');
      try {
        let printerId : string = 'testPrinterId';
        print.disconnectPrinter(printerId).then(() => {
          hilog.info(domain, tag, 'print_function_0900 success');
          done();
        }).catch((err: Object | null | undefined) => {
          let error = err as BusinessError;
          hilog.error(domain, tag, 'print_function_0900 error, %{public}s', JSON.stringify(error));
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_0900 error');
        expect().assertFail();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_0900 end');
    })

    /**
     * @tc.number print_function_1000
     * @tc.name print_function_1000
     * @tc.desc check the enum api
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('print_function_1000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_1000 start');

      try {
        let printerId : string = 'testPrinterId';
        print.disconnectPrinter(printerId, (err: Object | null | undefined) => {
          if (err) {
            const error = err as BusinessError;
            hilog.error(domain, tag, 'print_function_1000 error, code: %{public}d, message: %{public}s',
              error.code, error.message);
          } else {
            hilog.info(domain, tag, 'print_function_1000 success');
          }
          done();
        });
      } catch (err) {
        const error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_1000 error');
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_1000 end');
    });

    /**
     * @tc.number print_function_1100
     * @tc.name print_function_1100
     * @tc.desc check the enum api
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('print_function_1100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_1100 start');
      try {
        let printerId : string = 'testPrinterId';
        print.queryPrinterCapability(printerId).then(() => {
          hilog.info(domain, tag, 'print_function_1100 success');
          done();
        }).catch((err: Object | null | undefined) => {
          let error = err as BusinessError;
          hilog.error(domain, tag, 'print_function_1100 error, %{public}s', JSON.stringify(error));
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_1100 error');
        expect().assertFail();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_1100 end');
    })

    /**
     * @tc.number print_function_1200
     * @tc.name print_function_1200
     * @tc.desc check the enum api
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('print_function_1200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_1200 start');

      try {
        let printerId : string = 'testPrinterId';
        print.queryPrinterCapability(printerId, (err: Object | null | undefined) => {
          if (err) {
            const error = err as BusinessError;
            hilog.error(domain, tag, 'print_function_1200 error, code: %{public}d, message: %{public}s',
              error.code, error.message);
          } else {
            hilog.info(domain, tag, 'print_function_1200 success');
          }
          done();
        });
      } catch (err) {
        const error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_1200 error');
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_1200 end');
    });

    /**
     * @tc.number print_function_1300
     * @tc.name print_function_1300
     * @tc.desc check the enum api
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('print_function_1300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_1300 start');
      try {
        let printerId : string = 'testPrinterId';
        print.cancelPrintJob(printerId).then(() => {
          hilog.info(domain, tag, 'print_function_1300 success');
          done();
        }).catch((err: Object | null | undefined) => {
          let error = err as BusinessError;
          hilog.error(domain, tag, 'print_function_1300 error, %{public}s', JSON.stringify(error));
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_1300 error');
        expect().assertFail();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_1300 end');
    })

    /**
     * @tc.number print_function_1400
     * @tc.name print_function_1400
     * @tc.desc check the enum api
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('print_function_1400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_1400 start');

      try {
        let printerId : string = 'testPrinterId';
        print.cancelPrintJob(printerId, (err: Object | null | undefined) => {
          if (err) {
            const error = err as BusinessError;
            hilog.error(domain, tag, 'print_function_1400 error, code: %{public}d, message: %{public}s',
              error.code, error.message);
          } else {
            hilog.info(domain, tag, 'print_function_1400 success');
          }
          done();
        });
      } catch (err) {
        const error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_1400 error');
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_1400 end');
    });

    /**
     * @tc.number print_function_1500
     * @tc.name print_function_1500
     * @tc.desc check the enum api
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('print_function_1500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_1500 start');
      try {
        let printerIds: Array<string> = ['1', '2', '3'];
        print.removePrinters(printerIds).then(() => {
          hilog.info(domain, tag, 'print_function_1500 success');
          done();
        }).catch((err: Object | null | undefined) => {
          let error = err as BusinessError;
          hilog.error(domain, tag, 'print_function_1500 error, %{public}s', JSON.stringify(error));
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_1500 error');
        expect().assertFail();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_1500 end');
    })

    /**
     * @tc.number print_function_1600
     * @tc.name print_function_1600
     * @tc.desc check the enum api
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('print_function_1600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_1600 start');

      try {
        let printerIds: Array<string> = ['1', '2', '3'];
        print.removePrinters(printerIds, (err: Object | null | undefined) => {
          if (err) {
            const error = err as BusinessError;
            hilog.error(domain, tag, 'print_function_1600 error, code: %{public}d, message: %{public}s',
              error.code, error.message);
          } else {
            hilog.info(domain, tag, 'print_function_1600 success');
          }
          done();
        });
      } catch (err) {
        const error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_1600 error');
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_1600 end');
    });

    /**
     * @tc.number print_function_1700
     * @tc.name print_function_1700
     * @tc.desc check the enum api
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('print_function_1700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_1700 start');
      try {
        let printerId : string = 'testPrinterId';
        let state = print.PrinterState.PRINTER_CONNECTED;
        print.updatePrinterState(printerId, state).then(() => {
          hilog.info(domain, tag, 'print_function_1700 success');
          done();
        }).catch((err: Object | null | undefined) => {
          let error = err as BusinessError;
          hilog.error(domain, tag, 'print_function_1700 error, %{public}s', JSON.stringify(error));
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_1700 error');
        expect().assertFail();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_1700 end');
    })

    /**
     * @tc.number print_function_1800
     * @tc.name print_function_1800
     * @tc.desc check the enum api
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('print_function_1800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_1800 start');

      try {
        let printerId : string = 'testPrinterId';
        let state = print.PrinterState.PRINTER_CONNECTED;
        print.updatePrinterState(printerId, state, (err: Object | null | undefined) => {
          if (err) {
            const error = err as BusinessError;
            hilog.error(domain, tag, 'print_function_1800 error, code: %{public}d, message: %{public}s',
              error.code, error.message);
          } else {
            hilog.info(domain, tag, 'print_function_1800 success');
          }
          done();
        });
      } catch (err) {
        const error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_1800 error');
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_1800 end');
    });

    /**
     * @tc.number print_function_1900
     * @tc.name print_function_1900
     * @tc.desc check the enum api
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('print_function_1900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_1900 start');
      try {
        let printerId : string = 'testPrinterId';
        print.updateExtensionInfo(printerId).then(() => {
          hilog.info(domain, tag, 'print_function_1900 success');
          done();
        }).catch((err: Object | null | undefined) => {
          let error = err as BusinessError;
          hilog.error(domain, tag, 'print_function_1900 error, %{public}s', JSON.stringify(error));
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_1900 error');
        expect().assertFail();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_1900 end');
    })

    /**
     * @tc.number print_function_2000
     * @tc.name print_function_2000
     * @tc.desc check the enum api
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('print_function_2000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_2000 start');

      try {
        let printerId : string = 'testPrinterId';
        print.updateExtensionInfo(printerId, (err: Object | null | undefined) => {
          if (err) {
            const error = err as BusinessError;
            hilog.error(domain, tag, 'print_function_2000 error, code: %{public}d, message: %{public}s',
              error.code, error.message);
          } else {
            hilog.info(domain, tag, 'print_function_2000 success');
          }
          done();
        });
      } catch (err) {
        const error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_2000 error');
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_2000 end');
    });

    /**
     * @tc.number print_function_2100
     * @tc.name print_function_2100
     * @tc.desc check the enum api
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('print_function_2100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_2100 start');
      try {
        print.queryAllPrintJobs().then(() => {
          hilog.info(domain, tag, 'print_function_2100 success');
          done();
        }).catch((err: Object | null | undefined) => {
          let error = err as BusinessError;
          hilog.error(domain, tag, 'print_function_2100 error, %{public}s', JSON.stringify(error));
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_2100 error');
        expect().assertFail();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_2100 end');
    })

    /**
     * @tc.number print_function_2200
     * @tc.name print_function_2200
     * @tc.desc check the enum api
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('print_function_2200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_2200 start');

      try {
        print.queryAllPrintJobs((err: Object | null | undefined) => {
          if (err) {
            const error = err as BusinessError;
            hilog.error(domain, tag, 'print_function_2200 error, code: %{public}d, message: %{public}s',
              error.code, error.message);
          } else {
            hilog.info(domain, tag, 'print_function_2200 success');
          }
          done();
        });
      } catch (err) {
        const error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_2200 error');
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_2200 end');
    });

    /**
     * @tc.number print_function_2300
     * @tc.name print_function_2300
     * @tc.desc check the enum api
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('print_function_2300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_2300 start');
      try {
        let jobId : string = "testJobId";
        let state = print.PrintJobState.PRINT_JOB_QUEUED;
        let subState = print.PrintJobSubState.PRINT_JOB_COMPLETED_CANCELLED;
        print.updatePrintJobState(jobId, state, subState).then(() => {
          hilog.info(domain, tag, 'print_function_2300 success');
          done();
        }).catch((err: Object | null | undefined) => {
          let error = err as BusinessError;
          hilog.error(domain, tag, 'print_function_2300 error, %{public}s', JSON.stringify(error));
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_2300 error');
        expect().assertFail();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_2300 end');
    })

    /**
     * @tc.number print_function_2400
     * @tc.name print_function_2400
     * @tc.desc check the enum api
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('print_function_2400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_2400 start');

      try {
        let jobId : string = "testJobId";
        let state = print.PrintJobState.PRINT_JOB_QUEUED;
        let subState = print.PrintJobSubState.PRINT_JOB_COMPLETED_CANCELLED;
        print.updatePrintJobState(jobId, state, subState, (err: Object | null | undefined) => {
          if (err) {
            const error = err as BusinessError;
            hilog.error(domain, tag, 'print_function_2400 error, code: %{public}d, message: %{public}s',
              error.code, error.message);
          } else {
            hilog.info(domain, tag, 'print_function_2400 success');
          }
          done();
        });
      } catch (err) {
        const error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_2400 error');
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_2400 end');
    });

    /**
     * @tc.number print_function_2500
     * @tc.name print_function_2500
     * @tc.desc check the enum api
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('print_function_2500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_2500 start');
      try {
        let jobId : string = "testJobId";
        let type = 'spooler_closed_for_cancelled';
        print.notifyPrintService(jobId, type).then(() => {
          hilog.info(domain, tag, 'print_function_2500 success');
          done();
        }).catch((err: Object | null | undefined) => {
          let error = err as BusinessError;
          hilog.error(domain, tag, 'print_function_2500 error, %{public}s', JSON.stringify(error));
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_2500 error');
        expect().assertFail();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_2500 end');
    })

    /**
     * @tc.number print_function_2600
     * @tc.name print_function_2600
     * @tc.desc check the enum api
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('print_function_2600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_2600 start');

      try {
        let printerId : string = 'testPrinterId';
        let jobId : string = "testJobId";
        let type = 'spooler_closed_for_cancelled';
        print.notifyPrintService(jobId, type, (err: Object | null | undefined) => {
          if (err) {
            const error = err as BusinessError;
            hilog.error(domain, tag, 'print_function_2600 error, code: %{public}d, message: %{public}s',
              error.code, error.message);
          } else {
            hilog.info(domain, tag, 'print_function_2600 success');
          }
          done();
        });
      } catch (err) {
        const error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_2600 error');
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_2600 end');
    });

    /**
     * @tc.number print_function_2700
     * @tc.name print_function_2700
     * @tc.desc check the enum api
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('print_function_2700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_2700 start');
      try {
        let event = print.ApplicationEvent.APPLICATION_CLOSED_FOR_STARTED;
        print.notifyPrintServiceEvent(event).then(() => {
          hilog.info(domain, tag, 'print_function_2700 success');
          done();
        }).catch((err: Object | null | undefined) => {
          let error = err as BusinessError;
          hilog.error(domain, tag, 'print_function_2700 error, %{public}s', JSON.stringify(error));
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_2700 error');
        expect().assertFail();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_2700 end');
    })

    /**
     * @tc.number print_function_2800
     * @tc.name print_function_2800
     * @tc.desc check the enum api
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('print_function_2800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_2800 start');
      try {
        let printerId : string = 'testPrinterId';
        print.removePrinterFromDiscovery(printerId).then(() => {
          hilog.info(domain, tag, 'print_function_2800 success');
          done();
        }).catch((err: Object | null | undefined) => {
          let error = err as BusinessError;
          hilog.error(domain, tag, 'print_function_2800 error, %{public}s', JSON.stringify(error));
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_2800 error');
        expect().assertFail();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_2800 end');
    })

    /**
     * @tc.number print_function_2900
     * @tc.name print_function_2900
     * @tc.desc check the enum api
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('print_function_2900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_2900 start');
      try {
        const printerInfos: Array<print.PrinterInfo> = [
          {
            printerId: 'printer1',
            printerName: '办公室打印机',
            printerState: print.PrinterState.PRINTER_ADDED
          },
          {
            printerId: 'printer2',
            printerName: '财务部打印机',
            printerState: print.PrinterState.PRINTER_REMOVED
          }
        ];
        print.addPrinters(printerInfos).then(() => {
          hilog.info(domain, tag, 'print_function_2900 success');
          done();
        }).catch((err: Object | null | undefined) => {
          let error = err as BusinessError;
          hilog.error(domain, tag, 'print_function_2900 error, %{public}s', JSON.stringify(error));
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_2900 error');
        expect().assertFail();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_2900 end');
    })

    /**
     * @tc.number print_function_3000
     * @tc.name print_function_3000
     * @tc.desc check the enum api
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('print_function_3000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_3000 start');

      try {
        const printerInfos: Array<print.PrinterInfo> = [
          {
            printerId: 'printer1',
            printerName: '办公室打印机',
            printerState: print.PrinterState.PRINTER_ADDED
          },
          {
            printerId: 'printer2',
            printerName: '财务部打印机',
            printerState: print.PrinterState.PRINTER_REMOVED
          }
        ];
        print.addPrinters(printerInfos, (err: Object | null | undefined) => {
          if (err) {
            const error = err as BusinessError;
            hilog.error(domain, tag, 'print_function_3000 error, code: %{public}d, message: %{public}s',
              error.code, error.message);
          } else {
            hilog.info(domain, tag, 'print_function_3000 success');
          }
          done();
        });
      } catch (err) {
        const error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_3000 error');
        expect().assertFail();
        done();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_3000 end');
    });

    /**
     * @tc.number print_function_3100
     * @tc.name print_function_3100
     * @tc.desc check the enum api
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('print_function_3100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_3100 start');
      try {
        const printerInfos: Array<print.PrinterInfo> = [
          {
            printerId: 'printer1',
            printerName: '办公室打印机',
            printerState: print.PrinterState.PRINTER_ADDED
          },
          {
            printerId: 'printer2',
            printerName: '财务部打印机',
            printerState: print.PrinterState.PRINTER_REMOVED
          }
        ];
        print.updatePrinters(printerInfos).then(() => {
          hilog.info(domain, tag, 'print_function_3100 success');
          done();
        }).catch((err: Object | null | undefined) => {
          let error = err as BusinessError;
          hilog.error(domain, tag, 'print_function_3100 error, %{public}s', JSON.stringify(error));
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_3100 error');
        expect().assertFail();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_3100 end');
    })

    /**
     * @tc.number print_function_3200
     * @tc.name print_function_3200
     * @tc.desc check the enum api
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('print_function_3200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_3200 start');
      try {
        let printerId : string = "testPrintId";
        print.getPrinterInfoById(printerId).then((info : print.PrinterInfo) => {
          hilog.info(domain, tag, 'print_function_3200 success, info = %{public}s', JSON.stringify(info));
          done();
        }).catch((err: Object | null | undefined) => {
          let error = err as BusinessError;
          hilog.error(domain, tag, 'print_function_3200 error, %{public}s', JSON.stringify(error));
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_3200 error');
        expect().assertFail();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_3200 end');
    })

    /**
     * @tc.number print_function_3300
     * @tc.name print_function_3300
     * @tc.desc check the enum api
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('print_function_3300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_3300 start');
      try {
        let info : print.PrinterInformation = {
          printerId : "printerIdTest",
          printerName : "printerNameTest",
          printerStatus : print.PrinterStatus.PRINTER_BUSY,
        };
        print.addPrinterToDiscovery(info).then(() => {
          hilog.info(domain, tag, '%{public}s', 'print_function_3300 success');
          done();
        }).catch((err: Object | null | undefined) => {
          let error = err as BusinessError;
          hilog.error(domain, tag, 'print_function_3300 error, %{public}s', JSON.stringify(error));
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_3300 error');
        expect().assertFail();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_3200 end');
    })

    /**
     * @tc.number print_function_3400
     * @tc.name print_function_3400
     * @tc.desc check the enum api
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('print_function_3400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_3400 start');
      try {
        let info : print.PrinterInformation = {
          printerId : "printerIdTest",
          printerName : "printerNameTest",
          printerStatus : print.PrinterStatus.PRINTER_BUSY,
        };
        print.updatePrinterInDiscovery(info).then(() => {
          hilog.info(domain, tag, 'print_function_3400 success');
          done();
        }).catch((err: Object | null | undefined) => {
          let error = err as BusinessError;
          hilog.error(domain, tag, 'print_function_3400 error, %{public}s', JSON.stringify(error));
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_3400 error');
        expect().assertFail();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_3400 end');
    })

    /**
     * @tc.number print_function_3500
     * @tc.name print_function_3500
     * @tc.desc check the enum api
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('print_function_3500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_3500 start');
      try {
        let printerId : string = 'testPrinterId';
        print.getPrinterInformationById(printerId).then((info: print.PrinterInformation) => {
          hilog.info(domain, tag, 'print_function_3500 success, %{public}s', JSON.stringify(info));
          done();
        }).catch((err: Object | null | undefined) => {
          let error = err as BusinessError;
          hilog.error(domain, tag, 'print_function_3500 error, %{public}s', JSON.stringify(error));
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_3500 error');
        expect().assertFail();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_3500 end');
    })

    /**
     * @tc.number print_function_3600
     * @tc.name print_function_3600
     * @tc.desc check the enum api
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('print_function_3600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_3600 start');
      try {
        let printJob : print.PrintJob = {
          fdList : [1, 2, 3],
          jobId : "123",
          printerId : "testPrintId",
          jobState : print.PrintJobState.PRINT_JOB_QUEUED,
          jobSubstate : print.PrintJobSubState.PRINT_JOB_COMPLETED_CANCELLED,
          copyNumber : 1,
          pageRange : {
            startPage : 1,
            endPage : 2,
            pages : [1, 2, 3]
          },
          isSequential : false,
          pageSize : {
            id : 'idTest',
            name : 'nameTest',
            width : 1,
            height : 2,
          }
        };
        print.requestPrintPreview(printJob).then((ret : number) => {
          hilog.info(domain, tag, 'print_function_3600 success, %{public}d', ret);
          done();
        }).catch((err: Object | null | undefined) => {
          let error = err as BusinessError;
          hilog.error(domain, tag, 'print_function_3600 error, %{public}s', JSON.stringify(error));
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_3600 error, %{public}s', JSON.stringify(error));
        expect().assertFail();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_3600 end');
    });

    /**
     * @tc.number print_function_3700
     * @tc.name print_function_3700
     * @tc.desc check the enum api
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('print_function_3700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_3700 start');

      try {
        let printJob : print.PrintJob = {
          fdList : [1, 2, 3],
          jobId : "123",
          printerId : "testPrintId",
          jobState : print.PrintJobState.PRINT_JOB_QUEUED,
          jobSubstate : print.PrintJobSubState.PRINT_JOB_COMPLETED_CANCELLED,
          copyNumber : 1,
          pageRange : {
            startPage : 1,
            endPage : 2,
            pages : [1, 2, 3]
          },
          isSequential : false,
          pageSize : {
            id : "idTest",
            name : "nameTest",
            width : 1,
            height : 2,
          }
        };
        print.requestPrintPreview(printJob, (err: Object | null | undefined) => {
          if (err) {
            const error = err as BusinessError;
            hilog.error(domain, tag, 'print_function_3700 error, code: %{public}d, message: %{public}s',
              error.code, error.message);
          } else {
            hilog.info(domain, tag, 'print_function_3700 success');
          }
          done();
        });
      } catch (err) {
        const error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_3700 error');
        expect().assertFail();
        done();
      }

      hilog.info(domain, tag, '%{public}s', 'print_function_3700 end');
    });

    /**
     * @tc.number print_function_3800
     * @tc.name print_function_3800
     * @tc.desc check the enum api
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('print_function_3800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_3800 start');
      try {
        let jobId : string = "testJobId";
        print.queryPrintJobById(jobId).then(() => {
          hilog.info(domain, tag, 'print_function_3800 success');
          done();
        }).catch((err: Object | null | undefined) => {
          let error = err as BusinessError;
          hilog.error(domain, tag, 'print_function_3800 error, %{public}s', JSON.stringify(error));
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_3800 error, %{public}s', JSON.stringify(error));
        expect().assertFail();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_3800 end');
    });

    /**
     * @tc.number print_function_3900
     * @tc.name print_function_3900
     * @tc.desc check the enum api
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('print_function_3900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_3900 start');
      try {
        let jobId : string = "testJobId";
        print.queryPrintJobById(jobId, (err: Object | null | undefined) => {
          if (err) {
            const error = err as BusinessError;
            hilog.error(domain, tag, 'print_function_3900 error, code: %{public}d, message: %{public}s',
              error.code, error.message);
          } else {
            hilog.info(domain, tag, 'print_function_3900 success');
          }
          done();
        });
      } catch (err) {
        const error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_3900 error');
        expect().assertFail();
        done();
      }

      hilog.info(domain, tag, '%{public}s', 'print_function_3900 end');
    });

    /**
     * @tc.number print_function_4000
     * @tc.name print_function_4000
     * @tc.desc check the enum api
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('print_function_4000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_4000 start');
      try {
        let printJob : print.PrintJob = {
          fdList : [1, 2, 3],
          jobId : '123',
          printerId : 'testPrintId',
          jobState : print.PrintJobState.PRINT_JOB_QUEUED,
          jobSubstate : print.PrintJobSubState.PRINT_JOB_COMPLETED_CANCELLED,
          copyNumber : 1,
          pageRange : {
            startPage : 1,
            endPage : 2,
            pages : [1, 2, 3]
          },
          isSequential : false,
          pageSize : {
            id : 'idTest',
            name : 'nameTest',
            width : 1,
            height : 2,
          }
        };
        print.startPrintJob(printJob).then(() => {
          hilog.info(domain, tag, 'print_function_4000 success');
          done();
        }).catch((err: Object | null | undefined) => {
          let error = err as BusinessError;
          hilog.error(domain, tag, 'print_function_4000 error, %{public}s', JSON.stringify(error));
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_4000 error, %{public}s', JSON.stringify(error));
        expect().assertFail();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_4000 end');
    });

    /**
     * @tc.number print_function_4100
     * @tc.name print_function_4100
     * @tc.desc check the enum api
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('print_function_4100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_4100 start');

      try {
        let printJob : print.PrintJob = {
          fdList : [1, 2, 3],
          jobId : '123',
          printerId : 'testPrintId',
          jobState : print.PrintJobState.PRINT_JOB_QUEUED,
          jobSubstate : print.PrintJobSubState.PRINT_JOB_COMPLETED_CANCELLED,
          copyNumber : 1,
          pageRange : {
            startPage : 1,
            endPage : 2,
            pages : [1, 2, 3]
          },
          isSequential : false,
          pageSize : {
            id : 'idTest',
            name : 'nameTest',
            width : 1,
            height : 2,
          }
        };
        print.startPrintJob(printJob, (err: Object | null | undefined) => {
          if (err) {
            const error = err as BusinessError;
            hilog.error(domain, tag, 'print_function_4100 error, code: %{public}d, message: %{public}s',
              error.code, error.message);
          } else {
            hilog.info(domain, tag, 'print_function_4100 success');
          }
          done();
        });
      } catch (err) {
        const error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_4100 error');
        expect().assertFail();
        done();
      }

      hilog.info(domain, tag, '%{public}s', 'print_function_4100 end');
    });

    /**
     * @tc.number print_function_4200
     * @tc.name print_function_4200
     * @tc.desc check the enum api
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('print_function_4200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_4200 start');
      try {
        print.queryPrintJobList().then((job) => {
          const printJob = job as Array<print.PrintJob>;
          hilog.info(domain, tag, 'print_function_4200 success');
          done();
        }).catch((err: Object | null | undefined) => {
          let error = err as BusinessError;
          hilog.error(domain, tag, 'print_function_4200 error, %{public}s', JSON.stringify(error));
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_4200 error, %{public}s', JSON.stringify(error));
        expect().assertFail();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_4200 end');
    });

    /**
     * @tc.number print_function_4300
     * @tc.name print_function_4300
     * @tc.desc check the enum api
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('print_function_4300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_4300 start');

      try {
        print.queryPrintJobList((err: Object | null | undefined) => {
          hilog.info(domain, tag, 'print_function_4300 success');
          done();
        });
      } catch (err) {
        const error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_4300 error');
        expect().assertFail();
        done();
      }

      hilog.info(domain, tag, '%{public}s', 'print_function_4300 end');
    });

    /**
     * @tc.number print_function_4400
     * @tc.name print_function_4400
     * @tc.desc check the enum api
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('print_function_4400', Level.LEVEL0, ():void => {
      hilog.info(domain, tag, '%{public}s', 'print_function_4400 start');

      try {
        let jobId : string = 'testJobId';
        let printAttributes : print.PrintAttributes = {
          copyNumber : 1,
          pageRange : {
            startPage : 1,
            endPage : 2,
            pages : [1, 2, 3],
          },
          pageSize : {
            id : 'idTest',
            name : 'nameTest',
            width : 1,
            height : 2,
          },
          directionMode : print.PrintDirectionMode.DIRECTION_MODE_PORTRAIT,
          colorMode : print.PrintColorMode.COLOR_MODE_MONOCHROME,
          duplexMode : print.PrintDuplexMode.DUPLEX_MODE_LONG_EDGE
        };
        let fd : number = 1;
        print.startGettingPrintFile(jobId, printAttributes, fd, (state: Object | null | undefined) => {
          hilog.info(domain, tag, 'print_function_4400 success');
        });
      } catch (err) {
        const error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_4400 error');
        expect().assertFail();
      }

      hilog.info(domain, tag, '%{public}s', 'print_function_4400 end');
    });

    /**
     * @tc.number print_function_4500
     * @tc.name print_function_4500
     * @tc.desc check the enum api
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('print_function_4500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_4500 start');
      try {
        print.getAddedPrinters().then((printers : Array<string>) => {
          hilog.info(domain, tag, 'print_function_4500 success');
          done();
        }).catch((err: Object | null | undefined) => {
          let error = err as BusinessError;
          hilog.error(domain, tag, 'print_function_4500 error, %{public}s', JSON.stringify(error));
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_4500 error, %{public}s', JSON.stringify(error));
        expect().assertFail();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_4500 end');
    });

    /**
     * @tc.number print_function_4600
     * @tc.name print_function_4600
     * @tc.desc check the enum api
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('print_function_4600', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_4600 start');
      try {
        print.queryAllPrinterExtensionInfos().then((infos) => {
          hilog.info(domain, tag, 'print_function_4600 success');
          done();
        }).catch((err: Object | null | undefined) => {
          let error = err as BusinessError;
          hilog.error(domain, tag, 'print_function_4600 error, %{public}s', JSON.stringify(error));
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_4600 error, %{public}s', JSON.stringify(error));
        expect().assertFail();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_4600 end');
    });

    /**
     * @tc.number print_function_4700
     * @tc.name print_function_4700
     * @tc.desc check the enum api
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('print_function_4700', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_4700 start');

      try {
        print.queryAllPrinterExtensionInfos((err: Object | null | undefined) => {
          if (err) {
            const error = err as BusinessError;
            hilog.error(domain, tag, 'print_function_4700 error, code: %{public}d, message: %{public}s',
              error.code, error.message);
          } else {
            hilog.info(domain, tag, 'print_function_4700 success');
          }
          done();
        });
      } catch (err) {
        const error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_4700 error');
        expect().assertFail();
        done();
      }

      hilog.info(domain, tag, '%{public}s', 'print_function_4700 end');
    });

    /**
     * @tc.number print_function_4800
     * @tc.name print_function_4800
     * @tc.desc check the enum api
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('print_function_4800', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_4800 start');

      try {
        let files: Array<string> = ['1', '2', '3'];
        print.print(files, (task: Object | null | undefined) => {
          if (task) {
            hilog.info(domain, tag, 'print_function_4800 error');
          } else {
            hilog.info(domain, tag, 'print_function_4800 success');
          }
          done();
        });
      } catch (err) {
        const error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_4800 error');
        expect().assertFail();
        done();
      }

      hilog.info(domain, tag, '%{public}s', 'print_function_4800 end');
    });

    /**
     * @tc.number print_function_4900
     * @tc.name print_function_4900
     * @tc.desc check the enum api
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('print_function_4900', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_4900 start');
      try {
        let files: Array<string> = ['1', '2', '3'];
        print.print(files).then((task) => {
          hilog.info(domain, tag, 'print_function_4900 success');
          done();
        }).catch((err: Object | null | undefined) => {
          hilog.error(domain, tag, 'print_function_4900 error');
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_4900 error, %{public}s', JSON.stringify(error));
        expect().assertFail();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_4900 end');
    });

    /**
     * @tc.number print_function_5000
     * @tc.name print_function_5000
     * @tc.desc check the enum api
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('print_function_5000', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_5000 start');

      try {
        let files: Array<string> = ['1', '2', '3'];
        let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
        let context : Context = abilityDelegator.getAppContext();
        print.print(files, context, (task: Object | null | undefined) => {
          if (task) {
            hilog.info(domain, tag, 'print_function_5000 error');
          } else {
            hilog.info(domain, tag, 'print_function_5000 success');
          }
          done();
        });
      } catch (err) {
        const error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_5000 error');
        expect().assertFail();
        done();
      }

      hilog.info(domain, tag, '%{public}s', 'print_function_5000 end');
    });

    /**
     * @tc.number print_function_5100
     * @tc.name print_function_5100
     * @tc.desc check the enum api
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('print_function_5100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_5100 start');
      try {
        let files: Array<string> = ['1', '2', '3'];
        let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
        let context : Context = abilityDelegator.getAppContext();
        print.print(files, context).then((task: Object | null | undefined) => {
          hilog.info(domain, tag, 'print_function_5100 success');
          let printTask = task as print.PrintTask;
          registerPrintTask(printTask);
          UnregisterPrintTask(printTask);
          done();
        }).catch((err: Object | null | undefined) => {
          hilog.error(domain, tag, 'print_function_5100 error');
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_5100 error, %{public}s', JSON.stringify(error));
        expect().assertFail();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_5100 end');
    });

    /**
     * @tc.number print_function_5200
     * @tc.name print_function_5200
     * @tc.desc check the enum api
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('print_function_5200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', 'print_function_5200 start');
      try {
        let jobName : string = 'testJobName';
        let printAdapter: print.PrintDocumentAdapter = new MyPrintDocumentAdapter();
        let printAttributes: print.PrintAttributes = {
          copyNumber : 1,
        };
        let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator();
        let context : Context = abilityDelegator.getAppContext();
        print.print(jobName, printAdapter, printAttributes, context).then((task: Object | null | undefined) => {
          hilog.info(domain, tag, 'print_function_5200 succeed');
          let printTask = task as print.PrintTask;
          registerPrintTask(printTask);
          UnregisterPrintTask(printTask);
          done();
        }).catch((err: Object | null | undefined) => {
          hilog.error(domain, tag, 'print_function_5200 error');
          done();
        });
      } catch (err) {
        let error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_5200 error, %{public}s', JSON.stringify(error));
        expect().assertFail();
      }
      hilog.info(domain, tag, '%{public}s', 'print_function_5200 end');
    });

    /**
     * @tc.number print_function_5300
     * @tc.name print_function_5300
     * @tc.desc check the enum api
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('print_function_5300', Level.LEVEL0, ():void => {
      hilog.info(domain, tag, '%{public}s', 'print_function_5300 start');

      try {
        let type : string = 'printerStateChange';
        print.on(type, (state: print.PrinterState, info: print.PrinterInfo) => {
          hilog.info(domain, tag, 'print_function_5300 success');
        });
      } catch (err) {
        const error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_5300 error');
        expect().assertFail();
      }

      hilog.info(domain, tag, '%{public}s', 'print_function_5300 end');
    });

    /**
     * @tc.number print_function_5400
     * @tc.name print_function_5400
     * @tc.desc check the enum api
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('print_function_5400', Level.LEVEL0, ():void => {
      hilog.info(domain, tag, '%{public}s', 'print_function_5400 start');

      try {
        let type : string = 'jobStateChange';
        print.on(type, (state: print.PrintJobState, job: print.PrintJob) => {
          hilog.info(domain, tag, 'print_function_5400 success');
        });
      } catch (err) {
        const error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_5400 error');
        expect().assertFail();
      }

      hilog.info(domain, tag, '%{public}s', 'print_function_5400 end');
    });

    /**
     * @tc.number print_function_5500
     * @tc.name print_function_5500
     * @tc.desc check the enum api
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('print_function_5500', Level.LEVEL0, ():void => {
      hilog.info(domain, tag, '%{public}s', 'print_function_5500 start');

      try {
        let type : string = 'extInfoChange';
        print.on(type, (extensionId: string, info: string) => {
          hilog.info(domain, tag, 'print_function_5500 success');
        });
      } catch (err) {
        const error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_5500 error');
        expect().assertFail();
      }

      hilog.info(domain, tag, '%{public}s', 'print_function_5500 end');
    });

    /**
     * @tc.number print_function_5600
     * @tc.name print_function_5600
     * @tc.desc check the enum api
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('print_function_5600', Level.LEVEL0, ():void => {
      hilog.info(domain, tag, '%{public}s', 'print_function_5600 start');

      try {
        let type : string = 'printerStateChange';
        print.off(type, (state: boolean) => {
          hilog.info(domain, tag, 'print_function_5600 success');
        });
      } catch (err) {
        const error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_5600 error');
        expect().assertFail();
      }

      hilog.info(domain, tag, '%{public}s', 'print_function_5600 end');
    });

    /**
     * @tc.number print_function_5700
     * @tc.name print_function_5700
     * @tc.desc check the enum api
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('print_function_5700', Level.LEVEL0, ():void => {
      hilog.info(domain, tag, '%{public}s', 'print_function_5700 start');

      try {
        let type : string = 'jobStateChange';
        print.off(type, (state: boolean) => {
          hilog.info(domain, tag, 'print_function_5700 success');
        });
      } catch (err) {
        const error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_5700 error');
        expect().assertFail();
      }

      hilog.info(domain, tag, '%{public}s', 'print_function_5700 end');
    });

    /**
     * @tc.number print_function_5800
     * @tc.name print_function_5800
     * @tc.desc check the enum api
     * @tc.size MEDIUM
     * @tc.type Function
     * @tc.level Level 0
     */
    it('print_function_5800', Level.LEVEL0, ():void => {
      hilog.info(domain, tag, '%{public}s', 'print_function_5800 start');

      try {
        let type : string = 'extInfoChange';
        print.off(type, (state: boolean) => {
          hilog.info(domain, tag, 'print_function_5800 success');
        });
      } catch (err) {
        const error = err as BusinessError;
        hilog.error(domain, tag, 'print_function_5800 error');
        expect().assertFail();
      }

      hilog.info(domain, tag, '%{public}s', 'print_function_5800 end');
    });
    hilog.info(domain, tag, '%{public}s', 'printTest end');
  });
}