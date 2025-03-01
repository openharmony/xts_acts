import { afterEach, beforeEach, describe, expect, it } from "@ohos/hypium";
import serial from '@ohos.usbManager.serial';
import { bundleManager } from "@kit.AbilityKit";
import { buffer } from '@kit.ArkTS';
import { Driver, ON, Component } from '@kit.TestKit';

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


export default function SerialTest() {
  describe('SerialTest', () => {
    let openPortId: number = -1;
    beforeEach(async () => {
      try {
        let portList: serial.SerialPort[] = serial.getPortList();
        if (portList && portList.length > 0) {
          openPortId = portList[0].portId;
          console.info(TAG, 'openPortId: ', openPortId);
          let hasRight: boolean = serial.hasSerialRight(openPortId);
          if (!hasRight) {
            console.info(TAG, 'beforeEach: requestSerialRight start');
            serial.requestSerialRight(openPortId)
              .then((hasRight: boolean) => {
                console.info(TAG, 'getPermission isAgree: ', hasRight);
              })
              .catch((error: Error) => {
                console.error(TAG, 'getPermission catch err name: ', error.name, ', message: ', error.message);
              })
            let driver: Driver = Driver.create();
            await sleep(500);
            let button: Component = await driver.findComponent(ON.text('允许'));
            await button.click();
            await sleep(500);
          }
        } else {
          done();
        }
      } catch (error) {
        console.info(TAG, 'beforeAll error: ', JSON.stringify(error));
      }
    })
    afterEach(async () => {
      console.info(TAG, 'afterEach');
      serial.close(openPortId);
      serial.cancelSerialRight(openPortId);
      await sleep(1000);
    })

    /**
     * @tc.number   : SUB_USB_HostMgr_Serial_JS_getPortList_Func_0100
     * @tc.name     : testGetPortList001
     * @tc.desc     : getportlist successfully.
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testGetPortList001', 0, async () => {
      serial.open(openPortId);
      let portList: serial.SerialPort[] = serial.getPortList();
      console.info(TAG, 'testGetPortList001 portList: ', JSON.stringify(portList));
      if (portList && portList.length > 0) {
        openPortId = portList[0].portId;
        console.info(TAG, 'testGetPortList001 openPortId: ', openPortId);
      }
      expect(portList.length > 0).assertTrue();
    })
    
    /**
     * @tc.number   : SUB_USB_HostMgr_Serial_JS_hasSerialRight_Func_0100
     * @tc.name     : testHasSerialRight001
     * @tc.desc     : hasSerialRight successfully.
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testHasSerialRight001', 0, async () => {
      try {
        serial.open(openPortId);
        console.info(TAG, 'testHasSerialRight001 openPortId: ', openPortId);
        let hasRight: boolean = serial.hasSerialRight(openPortId);
        console.info(TAG, 'testHasSerialRight001 hasRight: ', hasRight);
        expect(hasRight).assertTrue();
      } catch (error) {
        console.error(TAG, 'testHasSerialRight001 catch err code: ', error.code, ', message: ', error.message);
        expect(error !== null).assertFalse();
        serial.open(openPortId);
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
    it('testHasSerialRight002', 0, async () => {
      try {
        serial.open(openPortId);
        let invalidPort: number = -1;
        console.info(TAG, 'testHasSerialRight002 port: ', openPortId);
        let hasRight: boolean = serial.hasSerialRight(invalidPort);
        console.info(TAG, 'testHasSerialRight002 hasRight: ', hasRight);
        expect(hasRight).assertFalse();
      } catch (error) {
        console.error(TAG, 'testHasSerialRight002 catch err code: ', error.code, ', message: ', error.message);
        expect(error.code).assertEqual(SYSPARAM_INVALID_INPUT);
      }
    })

    /**
     * @tc.number   : SUB_USB_HostMgr_Serial_JS_hasSerialRight_Comp_0100
     * @tc.name     : testHasSerialRight003
     * @tc.desc     : cancelSerialRight hasSerialRight equal false.
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testHasSerialRight003', 0, async () => {
      try {
        serial.open(openPortId);
        console.info(TAG, 'testHasSerialRight003 port: ', openPortId);
        serial.cancelSerialRight(openPortId);
        await sleep(500);
        let hasRight: boolean = serial.hasSerialRight(openPortId);
        console.info(TAG, 'testHasSerialRight003 hasRight: ', hasRight);
        expect(hasRight).assertFalse();
        await getPermission(openPortId);
      } catch (error) {
        console.error(TAG, 'testHasSerialRight003 catch err code: ', error.code, ', message: ', error.message);
        expect(error !== null).assertTrue();
        await getPermission(openPortId);
        serial.open(openPortId);
      }
    })

    /**
     * @tc.number   : SUB_USB_HostMgr_Serial_JS_requestSerialRight_Func_0100
     * @tc.name     : testRequestSerialRight001
     * @tc.desc     : requestSerialRight successfully.
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testRequestSerialRight001', 0, async () => {
      console.info(TAG, 'testRequestSerialRight001 start');
      console.info(TAG, 'testRequestSerialRight001 openPortId: ', openPortId);
      serial.open(openPortId);
      serial.cancelSerialRight(openPortId);
      await sleep(500);
      console.info(TAG, 'beforeEach: requestSerialRight start');
      serial.requestSerialRight(openPortId)
        .then((hasRight: boolean) => {
          console.info(TAG, 'getPermission isAgree: ', hasRight);
          expect(hasRight).assertTrue();
        })
        .catch((error: Error) => {
          console.error(TAG, 'getPermission catch err name: ', error.name, ', message: ', error.message);
          expect(error !== null).assertFalse();
        })
      let driver: Driver = Driver.create();
      await sleep(500);
      let button: Component = await driver.findComponent(ON.text('允许'));
      await button.click();
      await sleep(500);
    })

    /**
     * @tc.number   : SUB_USB_HostMgr_Serial_JS_requestSerialRight_ErrCode_0100
     * @tc.name     : testRequestSerialRight002
     * @tc.desc     : nvalidPort requestSerialRight failed.
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testRequestSerialRight002', 0, async () => {
      try{
        console.info(TAG, 'testRequestSerialRight002 start');
        serial.open(openPortId);
        serial.cancelSerialRight(openPortId);
        await sleep(500);
        console.info(TAG, 'beforeEach: requestSerialRight start');
        let invalidPort: number = -1;
        serial.requestSerialRight(invalidPort)
          .then((hasRight: boolean) => {
            console.info(TAG, 'getPermission isAgree: ', hasRight);
            expect(hasRight).assertFalse();
            getPermission(openPortId);
          })
        let driver: Driver = Driver.create();
        await sleep(500);
        let button: Component = await driver.findComponent(ON.text('允许'));
        await button.click();
        await sleep(500);
      } catch(error) {
        console.error(TAG, 'getPermission catch err name: ', error.name, ', message: ', error.message);
        //getErrorCode
        expect(error.code).assertEqual(SYSPARAM_INVALID_INPUT);
        await getPermission(openPortId);
      }
    })

    /**
     * @tc.number   : SUB_USB_HostMgr_Serial_JS_open_Func_0100
     * @tc.name     : testOpen001
     * @tc.desc     : open successfully.
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testOpen001', 0, async () => {
      try {
        console.info(TAG, 'testOpen001 start');
        serial.open(openPortId);
        expect().assertEqual(undefined);
      } catch (error) {
        console.error(TAG, 'testOpen001 catch err code: ', error.code, ', message: ', error.message);
        expect(error !== null).assertFalse();
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
    it('testOpen002', 0, async () => {
      try {
        console.info(TAG, 'testOpen002 start');
        let port: number = -1;
        serial.open(port);
      } catch (error) {
        console.error(TAG, 'testOpen002 catch err code: ', error.code, ', message: ', error.message);
        //get errorCode
        expect(error.code).assertEqual(SYSPARAM_INVALID_INPUT);
        serial.open(openPortId);
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
    it('testOpen003', 0, async () => {
      try {
        console.info(TAG, 'testOpen003 start');
        serial.open(openPortId);
        serial.open(openPortId);
      } catch (error) {
        console.error(TAG, 'testOpen003 catch err code: ', error.code, ', message: ', error.message);
        //get errorCode
        expect(error.code).assertEqual(SERIAL_PORT_OCCUPIED);
      }
    })

    /**
     * @tc.number   : SUB_USB_HostMgr_Serial_JS_open_ErrCode_0300
     * @tc.name     : testOpen004
     * @tc.desc     : no permission to open.
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testOpen004', 0, async () => {
      try {
        console.info(TAG, 'testOpen004 start');
        serial.cancelSerialRight(openPortId);
        await sleep(500);
        serial.open(openPortId);
      } catch (error) {
        console.error(TAG, 'testOpen004 catch err code: ', error.code, ', message: ', error.message);
        //get errorCode
        expect(error.code).assertEqual(SERIAL_INTERFACE_PERMISSION_DENIED);
        await getPermission(openPortId);
        serial.open(openPortId);
      }
    })

    /**
     * @tc.number   : SUB_USB_HostMgr_Serial_JS_open_ErrCode_0400
     * @tc.name     : testOpen005
     * @tc.desc     : not exist port to open.
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testOpen005', 0, async () => {
      try {
        console.info(TAG, 'testOpen005 start');
        serial.cancelSerialRight(openPortId);
        await sleep(500);
        let invalidPort: number = 10;
        serial.open(invalidPort);
      } catch (error) {
        console.error(TAG, 'testOpen005 catch err code: ', error.code, ', message: ', error.message);
        //get errorCode
        expect(error.code).assertEqual(SERIAL_PORT_NOT_EXIST);
        await getPermission(openPortId);
        serial.open(openPortId);
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
    it('testAddSerialRight001', 0, async () => {
      try {
        let bundleFlags: number = bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION;
        await bundleManager.getBundleInfoForSelf(bundleFlags).then((bundleInfo) => {
          console.info(TAG, 'getBundleInfoForSelf success Data: ', JSON.stringify(bundleInfo));
          let tokenId: number = bundleInfo.appInfo.accessTokenId;
          console.info(TAG, ' testAddSerialRight001 begin'+ JSON.stringify(tokenId));
          serial.addSerialRight(tokenId, openPortId);
          let hasRight: boolean = serial.hasSerialRight(openPortId);
          console.info(TAG, 'testAddSerialRight001 hasRight: ', hasRight);
          expect(hasRight).assertTrue();
        })
      } catch (error) {
        console.info(TAG, 'testAddSerialRight001catch err code: ', error.code, ', message: ', error.message);
        expect(error.code).assertEqual(SERIAL_SYSAPI_PERMISSION_DENIED);
      }
    })

    /**
     * @tc.number   : SUB_USB_HostMgr_Serial_JS_read_Func_0100
     * @tc.name     : testRead001
     * @tc.desc     : read successfully.
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testRead001', 0, async () => {
      console.info(TAG, 'testRead001 start');
      let readBuffer: Uint8Array = new Uint8Array(8192);
      serial.open(openPortId)
      serial.read(openPortId, readBuffer, 1000)
        .then((length: number) => {
          console.info(TAG, 'testRead001 length = ' + length);
          expect(length >= 0).assertTrue();
        })
        .catch((error: Error) => {
          console.error(TAG, 'testRead001 catch err name: ', error.name, ', message: ', error.message);
          expect(error !== null).assertFalse();
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
    it('testRead002', 0, async () => {
      await sleep(1000);
      console.info(TAG, 'testRead002 start');
      try{
        let readBuffer: Uint8Array = new Uint8Array(1);
        serial.open(openPortId)
        serial.read(openPortId, readBuffer, 1000)
          .then((length: number) => {
            console.info(TAG, 'testRead002 length = ' + length);
          })
      } catch(error) {
          console.error(TAG, 'testRead002 catch err name: ', error.code, ', message: ', error.message);
          expect(error.code).assertEqual(SERIAL_IO_EXCEPTION);
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
    it('testRead003', 0, async () => {
      console.info(TAG, 'testRead003 start');
      try{
        let readBuffer: Uint8Array = new Uint8Array(8192);
        serial.read(openPortId, readBuffer, 1000)
          .then((length: number) => {
            console.info(TAG, 'testRead003 length = ' + length);
            expect(length < 0).assertTrue();
            serial.open(openPortId)
          })
      } catch(error) {
          console.error(TAG, 'testRead003 catch err name: ', error.code, ', message: ', error.message);
          expect(error.code).assertEqual(SERIAL_PORT_NOT_OPEN);
          serial.open(openPortId)
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
    it('testRead004', 0, async () => {
      console.info(TAG, 'testRead004 start');
      try{
        let readBuffer: Uint8Array = new Uint8Array(8192);
        serial.open(openPortId)
        let invalid: number = -1;
        serial.read(invalid, readBuffer, 1000)
          .then((length: number) => {
            console.info(TAG, 'testRead004 length = ' + length);
            expect(length < 0).assertTrue();
          })
      } catch (error) {
          console.error(TAG, 'testRead004 catch err code: ', error.code, ', message: ', error.message);
          expect(error.code).assertEqual(SYSPARAM_INVALID_INPUT);
        }
    })

    /**
     * @tc.number   : SUB_USB_HostMgr_Serial_JS_readSync_Func_0100
     * @tc.name     : testReadSync001
     * @tc.desc     : readsync successfully.
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testReadSync001', 0, async () => {
      console.info(TAG, 'testReadSync001 start');
      try {
        serial.open(openPortId)
        let readSyncBuffer: Uint8Array = new Uint8Array(8192);
        let length: number = serial.readSync(openPortId, readSyncBuffer, 500)
        console.info(TAG, 'testReadSync001 length = ' + length);
        expect(length >= 0).assertTrue();
      } catch (error) {
        console.error(TAG, 'testReadSync001 catch err code: ', error.code, ', message: ', error.message);
        expect(error !== null).assertFalse();
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
    it('testReadSync002', 0, async () => {
      console.info(TAG, 'testReadSync002 start');
      try {
        let readSyncBuffer: Uint8Array = new Uint8Array(8192);
        let length: number = serial.readSync(openPortId, readSyncBuffer, 500)
        console.info(TAG, 'testReadSync002 length = ' + length);
        expect(length < 0).assertFalse();
        serial.open(openPortId)
      } catch (error) {
        console.error(TAG, 'testReadSync002 catch err code: ', error.code, ', message: ', error.message);
        expect(error.code).assertEqual(SERIAL_PORT_NOT_OPEN);
        serial.open(openPortId)
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
    it('testReadSync003', 0, async () => {
      console.info(TAG, 'testReadSync003 start');
      try {
        serial.open(openPortId)
        let invalid: number = -1;
        let readSyncBuffer: Uint8Array = new Uint8Array(8192);
        let length: number = serial.readSync(invalid, readSyncBuffer, 500)
        console.info(TAG, 'testReadSync003 length = ' + length);
        expect(length < 0).assertFalse();
      } catch (error) {
        console.error(TAG, 'testReadSync003 catch err code: ', error.code, ', message: ', error.message);
        expect(error.code).assertEqual(SYSPARAM_INVALID_INPUT);
      }
    })

    /**
     * @tc.number   : SUB_USB_HostMgr_Serial_JS_write_Func_0100
     * @tc.name     : testWrite001
     * @tc.desc     : write successfully.
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testWrite001', 0, async () => {
      let writeBuffer: Uint8Array = new Uint8Array(buffer.from('Hello World', 'utf-8').buffer)
      serial.open(openPortId)
      serial.write(openPortId, writeBuffer, 500)
        .then((length: number) => {
          expect(length >= 0).assertTrue();
        })
        .catch((error: Error) => {
          console.error(TAG, 'testWrite001 catch err name: ', error.name, ', message: ', error.message);
          expect(error !== null).assertFalse();
        });
    })

    /**
     * @tc.number   : SUB_USB_HostMgr_Serial_JS_write_ErrCode_0100
     * @tc.name     : testWrite002
     * @tc.desc     : not openPortId to write.
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testWrite002', 0, async () => {
      try{
        let writeBuffer: Uint8Array = new Uint8Array(buffer.from('Hello World', 'utf-8').buffer)
        serial.write(openPortId, writeBuffer, 500)
          .then((length: number) => {
            expect(length < 0).assertTrue();
            serial.open(openPortId)
          })
      } catch(error) {
          console.error(TAG, 'testWrite002 catch err name: ', error.code, ', message: ', error.message);
          expect(error.code).assertEqual(SERIAL_PORT_NOT_OPEN);
          serial.open(openPortId)
      };
    })

    /**
     * @tc.number   : SUB_USB_HostMgr_Serial_JS_write_ErrCode_0200
     * @tc.name     : testWrite003
     * @tc.desc     : invalid PortId to write.
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testWrite003', 0, async () => {
      try{
        let writeBuffer: Uint8Array = new Uint8Array(buffer.from('Hello World', 'utf-8').buffer)
        serial.open(openPortId)
        let invalid: number = -1;
        serial.write(invalid, writeBuffer, 500)
          .then((length: number) => {
            expect(length < 0).assertTrue();
          })
      } catch(error) {
        console.error(TAG, 'testWrite003 catch err name: ', error.name, ', message: ', error.message);
        expect(error.code).assertEqual(SYSPARAM_INVALID_INPUT);
      };
    })

    /**
     * @tc.number   : SUB_USB_HostMgr_Serial_JS_writeSync_Func_0100
     * @tc.name     : testWriteSync001
     * @tc.desc     : writeSync successfully.
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testWriteSync001', 0, async () => {
      try {
        let writeSyncBuffer: Uint8Array = new Uint8Array(buffer.from('Hello World', 'utf-8').buffer)
        serial.open(openPortId)
        let length: number = serial.writeSync(openPortId, writeSyncBuffer, 500);
        expect(length >= 0).assertTrue();
      } catch (error) {
        console.error(TAG, 'testWriteSync001 catch err code: ', error.code, ', message: ', error.message);
        expect(error !== null).assertFalse();
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
    it('testWriteSync002', 0, async () => {
      try {
        let writeSyncBuffer: Uint8Array = new Uint8Array(buffer.from('Hello World', 'utf-8').buffer)
        let length: number = serial.writeSync(openPortId, writeSyncBuffer, 500);
        expect(length < 0).assertTrue();
        serial.open(openPortId)
      } catch (error) {
        console.error(TAG, 'testWriteSync002 catch err code: ', error.code, ', message: ', error.message);
        expect(error.code).assertEqual(SERIAL_PORT_NOT_OPEN);
        serial.open(openPortId)
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
    it('testWriteSync003', 0, async () => {
      try {
        serial.open(openPortId)
        let invalid: number = -1;
        let writeSyncBuffer: Uint8Array = new Uint8Array(buffer.from('Hello World', 'utf-8').buffer)
        let length: number = serial.writeSync(invalid, writeSyncBuffer, 500);
        expect(length < 0).assertTrue();
      } catch (error) {
        console.error(TAG, 'testWriteSync003 catch err code: ', error.code, ', message: ', error.message);
        expect(error.code).assertEqual(SYSPARAM_INVALID_INPUT);
      }
    })

    /**
     * @tc.number   : SUB_USB_HostMgr_Serial_JS_setAttribute_Func_0100
     * @tc.name     : testSetAttribute001
     * @tc.desc     : setAttribute successfully.
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testSetAttribute001', 0, async () => {
      try {
        console.info(TAG, 'testSetAttribute001 start');
        let attribute: serial.SerialAttribute = {
          baudRate: serial.BaudRates.BAUDRATE_9600,
          dataBits: serial.DataBits.DATABIT_8,
          parity: serial.Parity.PARITY_NONE,
          stopBits: serial.StopBits.STOPBIT_1
        }
        serial.open(openPortId)
        serial.setAttribute(openPortId, attribute);
        expect().assertEqual(undefined);
      } catch (error) {
        console.error(TAG, 'testSetAttribute001 catch err code: ', error.code, ', message: ', error.message);
        expect(error !== null).assertFalse();
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
    it('testSetAttribute002', 0, async () => {
      try {
        console.info(TAG, 'testSetAttribute002 start');
        let attribute: serial.SerialAttribute = {
          baudRate: serial.BaudRates.BAUDRATE_9600,
          dataBits: serial.DataBits.DATABIT_8,
          parity: serial.Parity.PARITY_NONE,
          stopBits: serial.StopBits.STOPBIT_1
        }
        serial.setAttribute(openPortId, attribute);
        expect().assertNotEqual(undefined);
        serial.open(openPortId)
      } catch (error) {
        console.error(TAG, 'testSetAttribute002 catch err code: ', error.code, ', message: ', error.message);
        expect(error.code).assertEqual(SERIAL_PORT_NOT_OPEN);
        serial.open(openPortId)
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
    it('testSetAttribute003', 0, async () => {
      try {
        console.info(TAG, 'testSetAttribute003 start');
        let attribute: serial.SerialAttribute = {
          baudRate: serial.BaudRates.BAUDRATE_9600,
          dataBits: serial.DataBits.DATABIT_8,
          parity: serial.Parity.PARITY_NONE,
          stopBits: serial.StopBits.STOPBIT_1
        }
        serial.open(openPortId)
        let invalid: number = -1;
        serial.setAttribute(invalid, attribute);
        expect().assertNotEqual(undefined);
      } catch (error) {
        console.error(TAG, 'testSetAttribute003 catch err code: ', error.code, ', message: ', error.message);
        expect(error.code).assertEqual(SYSPARAM_INVALID_INPUT);
      }
    })

    /**
     * @tc.number   : SUB_USB_HostMgr_Serial_JS_getAttribute_Func_0100
     * @tc.name     : testGetAttribute001
     * @tc.desc     : getAttribute successfully.
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testGetAttribute001', 0, async () => {
      try {
        console.info(TAG, 'testGetAttribute001 000000 start');
        serial.open(openPortId);
        let attribute: serial.SerialAttribute = serial.getAttribute(openPortId);
        console.info('getAttribute attribute=', attribute)
        expect(attribute.dataBits).assertEqual(8);
      } catch (error) {
        console.error(TAG, 'testGetAttribute001 catch err code: ', error.code, ', message: ', error.message);
        expect(error !== null).assertFalse();
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
    it('testGetAttribute002', 0, async () => {
      try {
        console.info(TAG, 'testGetAttribute002 start');
        let attribute: serial.SerialAttribute = serial.getAttribute(openPortId);
        console.info('getAttribute attribute=', attribute)
        expect(attribute.dataBits).assertEqual(8);
        serial.open(openPortId);
      } catch (error) {
        console.error(TAG, 'testGetAttribute002 catch err code: ', error.code, ', message: ', error.message);
        expect(error.code).assertEqual(SERIAL_PORT_NOT_OPEN);
        serial.open(openPortId);
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
    it('testGetAttribute003', 0, async () => {
      try {
        console.info(TAG, 'testGetAttribute003 start');
        serial.open(openPortId);
        let invalid: number = -1;
        let attribute: serial.SerialAttribute = serial.getAttribute(invalid);
        console.info('getAttribute attribute=', attribute)
      } catch (error) {
        console.error(TAG, 'testGetAttribute003 catch err code: ', error.code, ', message: ', error.message);
        expect(error.code).assertEqual(SYSPARAM_INVALID_INPUT);
      }
    })

    /**
     * @tc.number   : SUB_USB_HostMgr_Serial_JS_close_Func_0100
     * @tc.name     : testClose001
     * @tc.desc     : close port successfully.
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testClose001', 0, async () => {
      try {
        serial.open(openPortId)
        serial.close(openPortId);
        expect().assertEqual(undefined);
        serial.open(openPortId)
      } catch (error) {
        console.error(TAG, 'testClose001 catch err code: ', error.code, ', message: ', error.message);
        expect(error !== null).assertFalse();
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
    it('testClose002', 0, async () => {
      try {
        serial.open(openPortId)
        serial.close(openPortId);
        serial.close(openPortId);
      } catch (error) {
        console.error(TAG, 'testClose002 catch err code: ', error.code, ', message: ', error.message);
        expect(error.code).assertEqual(SERIAL_PORT_OCCUPIED);
        serial.open(openPortId)
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
    it('testClose003', 0, async () => {
      try {
        let invalidPort: number = -1;
        serial.open(openPortId)
        serial.close(invalidPort);
      } catch (error) {
        console.error(TAG, 'testClose003 catch err code: ', error.code, ', message: ', error.message);
        expect(error.code).assertEqual(SYSPARAM_INVALID_INPUT);
      }
    })

    /**
     * @tc.number   : SUB_USB_HostMgr_Serial_JS_read_ErrCode_0400
     * @tc.name     : testRead004
     * @tc.desc     : read data timedout.
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testRead004', 0, async () => {
      console.info(TAG, 'testRead004 start');
      try{
        let readBuffer: Uint8Array = new Uint8Array(8192);
        serial.open(openPortId)
        serial.read(openPortId, readBuffer, 100)
          .then((length: number) => {
            console.info(TAG, 'testRead004 length = ' + length);
            expect(length < 0).assertTrue();
          })
      } catch(error) {
        console.error(TAG, 'testRead004 catch err name: ', error.name, ', message: ', error.message);
        expect(error.code).assertEqual(SERIAL_TIMED_OUT);
      }
    })

    /**
     * @tc.number   : SUB_USB_HostMgr_Serial_JS_readSync_ErrCode_0400
     * @tc.name     : testReadSync004
     * @tc.desc     : readsync data timedout.
     * @tc.size     : MediumTest
     * @tc.type     : Function
     * @tc.level    : Level 3
     */
    it('testReadSync004', 0, async () => {
      console.info(TAG, 'testReadSync004 start');
      try {
        await sleep(100);
        serial.open(openPortId)
        let readSyncBuffer: Uint8Array = new Uint8Array(8192);
        let length: number = serial.readSync(openPortId, readSyncBuffer, 100)
        console.info(TAG, 'testReadSync004 length = ' + length);
        expect(length < 0).assertFalse();
      } catch (error) {
        console.error(TAG, 'testReadSync004 catch err code: ', error.code, ', message: ', error.message);
        expect(error.code).assertEqual(SERIAL_TIMED_OUT);
      }
    })    

  });
}

async function getPermission(openPortId: number) {
  try {
    let portList: serial.SerialPort[] = serial.getPortList();
    if (portList && portList.length > 0) {
      openPortId = portList[0].portId;
      console.info(TAG, 'openPortId: ', openPortId);
      let hasRight: boolean = serial.hasSerialRight(openPortId);
      if (!hasRight) {
        console.info(TAG, 'beforeEach: requestSerialRight start');
        serial.requestSerialRight(openPortId)
          .then((hasRight: boolean) => {
            console.info(TAG, 'getPermission isAgree: ', hasRight);
          })
          .catch((error: Error) => {
            console.error(TAG, 'getPermission catch err name: ', error.name, ', message: ', error.message);
          })
        let driver: Driver = Driver.create();
        await sleep(500);
        let button: Component = await driver.findComponent(ON.text('允许'));
        await button.click();
        await sleep(500);
      }
    }
  } catch (error) {
    console.info(TAG, 'beforeAll error: ', JSON.stringify(error));
  }
}

function sleep(ms: number): Promise<void> {
  return new Promise<void>(resolve => setTimeout(resolve, ms));
}