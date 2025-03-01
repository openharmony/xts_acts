import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium'
import { UiDriver, BY } from '@ohos.UiTest';
import { JSON } from '@kit.ArkTS';
import { bundleManager } from "@kit.AbilityKit";
import { buffer } from '@kit.ArkTS';
import serial from '@ohos.usbManager.serial';

const TAG: string = "[SerialTest]";

const SYSPARAM_INVALID_INPUT: number = 401;
const SERIAL_SYSAPI_PERMISSION_DENIED: number = 202;
const SERIAL_SERVICE_ABNORMAL: number = 31400001;
const SERIAL_INTERFACE_PERMISSION_DENIED: number = 31400002;
const SERIAL_PORT_NOT_EXIST: number = 31400003;
const SERIAL_PORT_OCCUPIED: number = 31400004;
const SERIAL_PORT_NOT_OPEN: number = 31400005;
const SERIAL_TIMED_OUT: number = 31400006;
const SERIAL_IO_EXCEPTION: number = 31400007;

function sleep(ms: number): Promise<void> {
  return new Promise<void>(resolve => setTimeout(resolve, ms));
}

async function getPermission(gPortList: Readonly<serial.SerialPort>[]) {
  console.info('**************getPermission**************');
  try {
    serial.requestSerialRight(gPortList[0].portId).then(hasRight => {
      console.info(TAG, `usb requestRight success, hasRight: ${hasRight}`);
    })
  } catch (err) {
    console.info(TAG, `usb getPermission to requestRight hasRight fail: `, err);
    return;
  }
}

async function driveFn() {
  console.info('**************driveFn**************');
  try {
    let driver = await UiDriver.create();
    console.info(TAG, ` come in driveFn`);
    console.info(TAG, `driver is ${JSON.stringify(driver)}`);
    await sleep(1000);
    let button = await driver.findComponent(BY.text('允许'));
    console.info(TAG, `button is ${JSON.stringify(button)}`);
    await sleep(1000);
    await button.click();
  } catch (err) {
    console.info(TAG, 'err is ' + err);
    return;
  }
}

export default function SerialTest() {
  describe('SerialTest', () => {
    let openPortId: number = -1;
    beforeAll(async (done: Function) => {
      try {
        let portList: serial.SerialPort[] = serial.getPortList();
        if (portList && portList.length > 0) {
          openPortId = portList[0].portId;
          console.info(TAG, 'openPortId: ', openPortId);
          let hasRight: boolean = serial.hasSerialRight(openPortId);
          if (!hasRight) {
            console.info(TAG, 'beforeEach: requestSerialRight start');
            let futureRes: Promise<boolean> = serial.requestSerialRight(openPortId);
            await driveFn();
            try {
              let hasRight: boolean = await futureRes;
              console.info(TAG, 'getPermission isAgree: ', hasRight);
            } catch (err) {
              console.error(TAG, 'getPermission catch err name: ', err.name, ', message: ', err.message);
            }
          }
        } else {
          done();
        }
      } catch (error) {
        console.info(TAG, 'beforeAll error: ', JSON.stringify(error));
      }
    })
    afterAll(async () => {
      console.info(TAG, 'afterEach');
      if (serial.hasSerialRight(openPortId)){
        serial.close(openPortId);
        serial.cancelSerialRight(openPortId);
      }
    })

    /**
     * @tc.number   : SUB_USB_HostMgr_Serial_JS_getPortList_Func_0100
     * @tc.name     : testGetPortList001
     * @tc.desc     : getportlist successfully.
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 0
     */
    it('testGetPortList001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        console.info(TAG, 'testGetPortList001 start');
        let portList: serial.SerialPort[] = serial.getPortList();
        console.info(TAG, 'testGetPortList001 portList: ', JSON.stringify(portList));
        if (portList && portList.length > 0) {
            openPortId = portList[0].portId;
            console.info(TAG, 'testGetPortList001 openPortId: ', openPortId);
        }
        expect(portList.length > 0).assertTrue();
        done();
      } catch (err) {
        expect().assertFail();
        console.error(TAG, 'testGetPortList001 catch err code: ', err.code, ', message: ', err.message);
      }
    })

    /**
     * @tc.number   : SUB_USB_HostMgr_Serial_JS_hasSerialRight_Func_0100
     * @tc.name     : testHasSerialRight001
     * @tc.desc     : hasSerialRight successfully.
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 0
     */
    it('testHasSerialRight001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        console.info(TAG, 'testHasSerialRight001 start');
        let hasRight: boolean = serial.hasSerialRight(openPortId);
        console.info(TAG, 'testHasSerialRight001 hasRight: ', hasRight);
        expect(hasRight).assertTrue();
        done();
      } catch (error) {
        expect().assertFail();
        console.error(TAG, 'testHasSerialRight001 catch err code: ', error.code, ', message: ', error.message);
      }
    })

    /**
     * @tc.number   : SUB_USB_HostMgr_Serial_JS_hasSerialRight_ErrCode_0100
     * @tc.name     : testHasSerialRight002
     * @tc.desc     : invalidPort hasSerialRight failed.
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testHasSerialRight002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        console.info(TAG, 'testHasSerialRight002 start');
        let invalidPort: number = -1;
        let hasRight: boolean = serial.hasSerialRight(invalidPort);
        console.info(TAG, 'testHasSerialRight002 hasRight: ', hasRight);
        expect().assertFail();
      } catch (error) {
        expect(error.code).assertEqual(SYSPARAM_INVALID_INPUT);
        console.error(TAG, 'testHasSerialRight002 catch err code: ', error.code, ', message: ', error.message);
        done();
      }
    })

    /**
     * @tc.number   : SUB_USB_HostMgr_Serial_JS_requestSerialRight_Func_0100
     * @tc.name     : testRequestSerialRight001
     * @tc.desc     : requestSerialRight successfully.
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 0
     */
    it('testRequestSerialRight001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        console.info(TAG, 'testRequestSerialRight001 start, openPortId: ', openPortId);
        serial.cancelSerialRight(openPortId);
        await sleep(500);
        expect(serial.hasSerialRight(openPortId)).assertFalse();
        console.info(TAG, 'it requestSerialRight start');
        let futureRes: Promise<boolean> = serial.requestSerialRight(openPortId);
        await driveFn();
        try {
          let hasRight: boolean = await futureRes;
          console.info(TAG, 'getPermission isAgree: ', hasRight);
          expect(hasRight).assertTrue();
          done();
        } catch (err) {
          console.error(TAG, 'getPermission catch err name: ', err.name, ', message: ', err.message);
          expect().assertFail();
        }
      } catch (err) {
        console.error(TAG, 'testRequestSerialRight001 catch err code: ', err.code, ', message: ', err.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.number   : SUB_USB_HostMgr_Serial_JS_requestSerialRight_ErrCode_0200
     * @tc.name     : testRequestSerialRight002
     * @tc.desc     : invalidPort requestSerialRight failed.
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testRequestSerialRight002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try{
        console.info(TAG, 'testRequestSerialRight001 start');
        let invalidPort: number = -1;
        let futureRes: Promise<boolean> = serial.requestSerialRight(invalidPort);
        await driveFn();
        try {
          let hasRight: boolean = await futureRes;
          console.info(TAG, 'getPermission isAgree: ', hasRight);
          expect().assertFail();
        } catch (err) {
          console.error(TAG, 'getPermission catch err name: ', err.name, ', message: ', err.message);
          expect().assertFail();
        }
      } catch (error) {
        expect(error.code).assertEqual(SYSPARAM_INVALID_INPUT);
        console.error(TAG, 'testRequestSerialRight002 catch err code: ', error.code, ', message: ', error.message);
        done();
      }
    })

    /**
     * @tc.number   : SUB_USB_HostMgr_Serial_JS_open_Func_0100
     * @tc.name     : testOpen001
     * @tc.desc     : open successfully.
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 0
     */
    it('testOpen001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        console.info(TAG, 'testOpen001 start');
        serial.open(openPortId);
        expect().assertEqual(undefined);
        serial.close(openPortId);
        done();
      } catch (error) {
        expect().assertFail();
        console.error(TAG, 'testOpen001 catch err code: ', error.code, ', message: ', error.message);
      }
    })

    /**
     * @tc.number   : SUB_USB_HostMgr_Serial_JS_open_ErrCode_0100
     * @tc.name     : testOpen002
     * @tc.desc     : invalidPort open failed.
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testOpen002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        console.info(TAG, 'testOpen002 start');
        let invalidInput: number = -1;
        serial.open(invalidInput);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, 'testOpen002 catch err code: ', error.code, ', message: ', error.message);
        expect(error.code).assertEqual(SYSPARAM_INVALID_INPUT);
        done();
      }
    })

    /**
     * @tc.number   : SUB_USB_HostMgr_Serial_JS_open_ErrCode_0200
     * @tc.name     : testOpen003
     * @tc.desc     : Repeated open.
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testOpen003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        console.info(TAG, 'testOpen003 start');
        serial.open(openPortId);
        serial.open(openPortId);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, 'testOpen003 catch err code: ', error.code, ', message: ', error.message);
        expect(error.code).assertEqual(SERIAL_PORT_OCCUPIED);
        serial.close(openPortId);
        done();
      }
    })

    /**
     * @tc.number   : SUB_USB_HostMgr_Serial_JS_open_ErrCode_0300
     * @tc.name     : testOpen004
     * @tc.desc     : not exist port to open.
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testOpen004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        console.info(TAG, 'testOpen004 start');
        let invalidPort: number = 10;
        serial.open(invalidPort);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, 'testOpen004 catch err code: ', error.code, ', message: ', error.message);
        expect(error.code).assertEqual(SERIAL_PORT_NOT_EXIST);
        done();
      }
    })

    /**
     * @tc.number   : SUB_USB_HostMgr_Serial_JS_addSerialRight_ErrCode_0100
     * @tc.name     : testAddSerialRight001
     * @tc.desc     : not system app.
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testAddSerialRight001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        let bundleFlags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION;
        await bundleManager.getBundleInfoForSelf(bundleFlags).then((bundleInfo: bundleManager.BundleInfo) => {
          console.info(TAG, 'getBundleInfoForSelf success Data: ', JSON.stringify(bundleInfo));
          let tokenId: number = bundleInfo.appInfo.accessTokenId;
          console.info(TAG, ' testAddSerialRight001 begin'+ JSON.stringify(tokenId));
          serial.addSerialRight(tokenId, openPortId);
          expect().assertFail();
        })
      } catch (error) {
        console.info(TAG, 'testAddSerialRight001 catch err code: ', error.code, ', message: ', error.message);
        expect(error.code).assertEqual(SERIAL_SYSAPI_PERMISSION_DENIED);
        done();
      }
    })

    /**
     * @tc.number   : SUB_USB_HostMgr_Serial_JS_setAttribute_Func_0100
     * @tc.name     : testSetAttribute001
     * @tc.desc     : setAttribute successfully.
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 0
     */
    it('testSetAttribute001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        console.info(TAG, 'testSetAttribute001 start');
        let attribute: serial.SerialAttribute = {
          baudRate: serial.BaudRates.BAUDRATE_9600,
          dataBits: serial.DataBits.DATABIT_8,
          parity: serial.Parity.PARITY_NONE,
          stopBits: serial.StopBits.STOPBIT_1
        };
        serial.open(openPortId);
        serial.setAttribute(openPortId, attribute);
        expect().assertEqual(undefined);
        serial.close(openPortId);
        done();
      } catch (error) {
        console.error(TAG, 'testSetAttribute001 catch err code: ', error.code, ', message: ', error.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.number   : SUB_USB_HostMgr_Serial_JS_setAttribute_ErrCode_0100
     * @tc.name     : testSetAttribute002
     * @tc.desc     : not openPortId to setAttribute.
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testSetAttribute002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        console.info(TAG, 'testSetAttribute002 start');
        let attribute: serial.SerialAttribute = {
          baudRate: serial.BaudRates.BAUDRATE_9600,
          dataBits: serial.DataBits.DATABIT_8,
          parity: serial.Parity.PARITY_NONE,
          stopBits: serial.StopBits.STOPBIT_1
        };
        serial.setAttribute(openPortId, attribute);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, 'testSetAttribute002 catch err code: ', error.code, ', message: ', error.message);
        expect(error.code).assertEqual(SERIAL_PORT_NOT_OPEN);
        done();
      }
    })

    /**
     * @tc.number   : SUB_USB_HostMgr_Serial_JS_setAttribute_ErrCode_0200
     * @tc.name     : testSetAttribute003
     * @tc.desc     : invalid PortId to setAttribute.
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testSetAttribute003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        console.info(TAG, 'testSetAttribute003 start');
        let attribute: serial.SerialAttribute = {
          baudRate: serial.BaudRates.BAUDRATE_9600,
          dataBits: serial.DataBits.DATABIT_8,
          parity: serial.Parity.PARITY_NONE,
          stopBits: serial.StopBits.STOPBIT_1
        }
        let invalidInput: number = -1;
        serial.setAttribute(invalidInput, attribute);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, 'testSetAttribute003 catch err code: ', error.code, ', message: ', error.message);
        expect(error.code).assertEqual(SYSPARAM_INVALID_INPUT);
        done();
      }
    })

    /**
     * @tc.number   : SUB_USB_HostMgr_Serial_JS_getAttribute_Func_0100
     * @tc.name     : testGetAttribute001
     * @tc.desc     : getAttribute successfully.
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 0
     */
    it('testGetAttribute001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        console.info(TAG, 'testGetAttribute001 start');
        serial.open(openPortId);
        let attribute: serial.SerialAttribute = serial.getAttribute(openPortId);
        console.info('getAttribute attribute=', JSON.stringify(attribute));
        expect(attribute.dataBits).assertEqual(8);
        serial.close(openPortId);
        done();
      } catch (error) {
        console.error(TAG, 'testGetAttribute001 catch err code: ', error.code, ', message: ', error.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.number   : SUB_USB_HostMgr_Serial_JS_getAttribute_ErrCode_0100
     * @tc.name     : testGetAttribute002
     * @tc.desc     : not openPortId to getAttribute.
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testGetAttribute002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        console.info(TAG, 'testGetAttribute002 start');
        serial.getAttribute(openPortId);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, 'testGetAttribute002 catch err code: ', error.code, ', message: ', error.message);
        expect(error.code).assertEqual(SERIAL_PORT_NOT_OPEN);
        done();
      }
    })

    /**
     * @tc.number   : SUB_USB_HostMgr_Serial_JS_getAttribute_ErrCode_0200
     * @tc.name     : testGetAttribute003
     * @tc.desc     : invalid openPortId to getAttribute.
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testGetAttribute003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        console.info(TAG, 'testGetAttribute003 start');
        let invalidInput: number = -1;
        serial.getAttribute(invalidInput);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, 'testGetAttribute003 catch err code: ', error.code, ', message: ', error.message);
        expect(error.code).assertEqual(SYSPARAM_INVALID_INPUT);
        done();
      }
    })

    /**
     * @tc.number   : SUB_USB_HostMgr_Serial_JS_close_Func_0100
     * @tc.name     : testClose001
     * @tc.desc     : close port successfully.
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 0
     */
    it('testClose001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        console.info(TAG, 'testClose001 start');
        serial.open(openPortId);
        serial.close(openPortId);
        expect().assertEqual(undefined);
        done();
      } catch (error) {
        console.error(TAG, 'testClose001 catch err code: ', error.code, ', message: ', error.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.number   : SUB_USB_HostMgr_Serial_JS_close_ErrCode_0100
     * @tc.name     : testClose002
     * @tc.desc     : Repeated close.
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testClose002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        console.info(TAG, 'testClose002 start');
        serial.open(openPortId);
        serial.close(openPortId);
        serial.close(openPortId);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, 'testClose002 catch err code: ', error.code, ', message: ', error.message);
        expect(error.code).assertEqual(SERIAL_PORT_OCCUPIED);
        done();
      }
    })

    /**
     * @tc.number   : SUB_USB_HostMgr_Serial_JS_close_ErrCode_0200
     * @tc.name     : testClose003
     * @tc.desc     : invalid Port to close.
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testClose003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        console.info(TAG, 'testClose003 start');
        let invalidPort: number = -1;
        serial.open(openPortId);
        serial.close(invalidPort);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, 'testClose003 catch err code: ', error.code, ', message: ', error.message);
        expect(error.code).assertEqual(SYSPARAM_INVALID_INPUT);
        serial.close(openPortId);
        done();
      }
    })

    /**
     * @tc.number   : SUB_USB_HostMgr_Serial_JS_write_Func_0100
     * @tc.name     : testWrite001
     * @tc.desc     : write successfully.
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 0
     */
    it('testWrite001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(TAG, 'testWrite001 start');
      let writeBuffer: Uint8Array = new Uint8Array(buffer.from('Hello World', 'utf-8').buffer)
      serial.open(openPortId);
      serial.write(openPortId, writeBuffer, 500)
        .then((length: number) => {
          expect(length >= 0).assertTrue();
          serial.close(openPortId);
          done();
        })
        .catch((error: Error) => {
          console.error(TAG, 'testWrite001 catch err name: ', error.name, ', message: ', error.message);
          expect().assertFail();
        });
    })

    /**
     * @tc.number   : SUB_USB_HostMgr_Serial_JS_write_ErrCode_0100
     * @tc.name     : testWrite002
     * @tc.desc     : invalid PortId to write.
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testWrite002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try{
        console.info(TAG, 'testWrite002 start');
        let writeBuffer: Uint8Array = new Uint8Array(buffer.from('Hello World', 'utf-8').buffer)
        let invalidInput: number = -1;
        serial.write(invalidInput, writeBuffer, 500)
          .then((length: number) => {
            expect().assertFail();
          })
      } catch (error) {
        console.error(TAG, 'testWrite002 catch err name: ', error.name, ', message: ', error.message);
        expect(error.code).assertEqual(SYSPARAM_INVALID_INPUT);
        done();
      };
    })

    /**
     * @tc.number   : SUB_USB_HostMgr_Serial_JS_write_ErrCode_0200
     * @tc.name     : testWrite003
     * @tc.desc     : not openPortId to write.
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testWrite003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try{
        console.info(TAG, 'testWrite003 start');
        let writeBuffer: Uint8Array = new Uint8Array(buffer.from('Hello World', 'utf-8').buffer)
        await serial.write(openPortId, writeBuffer, 500);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, 'testWrite003 catch err name: ', error);
        expect(error).assertEqual(SERIAL_PORT_NOT_OPEN);
        done();
      };
    })

    /**
     * @tc.number   : SUB_USB_HostMgr_Serial_JS_writeSync_Func_0100
     * @tc.name     : testWriteSync001
     * @tc.desc     : writeSync successfully.
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 0
     */
    it('testWriteSync001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        console.info(TAG, 'testWriteSync001 start');
        let writeSyncBuffer: Uint8Array = new Uint8Array(buffer.from('Hello World', 'utf-8').buffer)
        serial.open(openPortId);
        let length: number = serial.writeSync(openPortId, writeSyncBuffer, 500);
        expect(length >= 0).assertTrue();
        serial.close(openPortId);
        done();
      } catch (error) {
        console.error(TAG, 'testWriteSync001 catch err code: ', error.code, ', message: ', error.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.number   : SUB_USB_HostMgr_Serial_JS_writeSync_ErrCode_0100
     * @tc.name     : testWriteSync002
     * @tc.desc     : not openPortId to writeSync.
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testWriteSync002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        console.info(TAG, 'testWriteSync002 start');
        let writeSyncBuffer: Uint8Array = new Uint8Array(buffer.from('Hello World', 'utf-8').buffer)
        serial.writeSync(openPortId, writeSyncBuffer, 500);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, 'testWriteSync002 catch err code: ', error.code, ', message: ', error.message);
        expect(error.code).assertEqual(SERIAL_PORT_NOT_OPEN);
        done();
      }
    })

    /**
     * @tc.number   : SUB_USB_HostMgr_Serial_JS_writeSync_ErrCode_0200
     * @tc.name     : testWriteSync003
     * @tc.desc     : invalidPortId to writeSync.
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testWriteSync003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        console.info(TAG, 'testWriteSync003 start');
        let invalidInput: number = -1;
        let writeSyncBuffer: Uint8Array = new Uint8Array(buffer.from('Hello World', 'utf-8').buffer)
        serial.writeSync(invalidInput, writeSyncBuffer, 500);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, 'testWriteSync003 catch err code: ', error.code, ', message: ', error.message);
        expect(error.code).assertEqual(SYSPARAM_INVALID_INPUT);
        done();
      }
    })

    /**
     * @tc.number   : SUB_USB_HostMgr_Serial_JS_read_Func_0100
     * @tc.name     : testRead001
     * @tc.desc     : read successfully.
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 0
     */
    it('testRead001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      console.info(TAG, 'testRead001 start');
      let readBuffer: Uint8Array = new Uint8Array(8192);
      serial.open(openPortId);
      serial.read(openPortId, readBuffer, 1000)
        .then((length: number) => {
          console.info(TAG, 'testRead001 length = ' + length);
          expect(length >= 0).assertTrue();
          serial.close(openPortId);
          done();
        })
        .catch((error: Error) => {
          console.error(TAG, 'testRead001 catch err name: ', error.name, ', message: ', error.message);
          expect().assertFail();
        })
    })

    /**
     * @tc.number   : SUB_USB_HostMgr_Serial_JS_read_ErrCode_0100
     * @tc.name     : testRead002
     * @tc.desc     : read buffer overflow.
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testRead002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {   
      await sleep(1000);    
      try {
        console.info(TAG, 'testRead002 start');
        let readBuffer: Uint8Array = new Uint8Array(1);
        serial.open(openPortId);
        await serial.read(openPortId, readBuffer, 1000);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, 'testRead002 catch err name: ', error);
        expect(error).assertEqual(SERIAL_IO_EXCEPTION);
        serial.close(openPortId);
        done();
      }
    })

    /**
     * @tc.number   : SUB_USB_HostMgr_Serial_JS_read_ErrCode_0200
     * @tc.name     : testRead003
     * @tc.desc     : port not open.
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testRead003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      await sleep(1000); 
      try {
        console.info(TAG, 'testRead003 start');
        let readBuffer: Uint8Array = new Uint8Array(8192);
        await serial.read(openPortId, readBuffer, 1000);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, 'testRead003 catch err name: ', error);
        expect(error).assertEqual(SERIAL_PORT_NOT_OPEN);
        done();
      }
    })

    /**
     * @tc.number   : SUB_USB_HostMgr_Serial_JS_read_ErrCode_0300
     * @tc.name     : testRead004
     * @tc.desc     : invalidPort to read.
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testRead004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        console.info(TAG, 'testRead004 start');
        let readBuffer: Uint8Array = new Uint8Array(8192);
        let invalid: number = -1;
        serial.read(invalid, readBuffer, 1000)
          .then((length: number) => {
            expect().assertFail();
          })
      } catch (error) {
        console.error(TAG, 'testRead004 catch err code: ', error.code, ', message: ', error.message);
        expect(error.code).assertEqual(SYSPARAM_INVALID_INPUT);
        done();
      }
    })

    /**
     * @tc.number   : SUB_USB_HostMgr_Serial_JS_readSync_Func_0100
     * @tc.name     : testReadSync001
     * @tc.desc     : readsync successfully.
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 0
     */
    it('testReadSync001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      try {
        console.info(TAG, 'testReadSync001 start');
        serial.open(openPortId);
        let readSyncBuffer: Uint8Array = new Uint8Array(8192);
        let length: number = serial.readSync(openPortId, readSyncBuffer, 500);
        console.info(TAG, 'testReadSync001 length = ' + length);
        expect(length >= 0).assertTrue();
        serial.close(openPortId);
        done();
      } catch (error) {
        console.error(TAG, 'testReadSync001 catch err code: ', error.code, ', message: ', error.message);
        expect().assertFail();
      }
    })

    /**
     * @tc.number   : SUB_USB_HostMgr_Serial_JS_readSync_ErrCode_0100
     * @tc.name     : testReadSync002
     * @tc.desc     : port not open.
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testReadSync002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      await sleep(1000);
      try {
        console.info(TAG, 'testReadSync002 start');
        let readSyncBuffer: Uint8Array = new Uint8Array(8192);
        serial.readSync(openPortId, readSyncBuffer, 500);
        expect().assertFail();
      } catch (error) {
        console.error(TAG, 'testReadSync002 catch err code: ', error.code, ', message: ', error.message);
        expect(error.code).assertEqual(SERIAL_PORT_NOT_OPEN);
        done();
      }
    })

    /**
     * @tc.number   : SUB_USB_HostMgr_Serial_JS_readSync_ErrCode_0200
     * @tc.name     : testReadSync003
     * @tc.desc     : invalidport to open.
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testReadSync003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        console.info(TAG, 'testReadSync003 start');
        let invalid: number = -1;
        let readSyncBuffer: Uint8Array = new Uint8Array(8192);
        let length: number = serial.readSync(invalid, readSyncBuffer, 500)
        expect().assertFail();
      } catch (error) {
        console.error(TAG, 'testReadSync003 catch err code: ', error.code, ', message: ', error.message);
        expect(error.code).assertEqual(SYSPARAM_INVALID_INPUT);
        done();
      }
    })

    /**
     * @tc.number   : SUB_USB_HostMgr_Serial_JS_open_Func_0400
     * @tc.name     : testOpen005
     * @tc.desc     : open failed.
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testOpen005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      try {
        console.info(TAG, 'testOpen005 start');
        serial.cancelSerialRight(openPortId);
        serial.open(openPortId);
        expect().assertFail();
      } catch (err) {
        console.error(TAG, 'testOpen005 catch err code: ', err.code, ', message: ', err.message);
        expect(err.code).assertEqual(SERIAL_INTERFACE_PERMISSION_DENIED);
        done();
      }
    })
  })
}