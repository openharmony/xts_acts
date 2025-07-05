import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import { BusinessError } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import Want from '@ohos.app.ability.Want';
import Utils from './Util.test';
import UsbMgr from '@ohos.usbManager';
import bundleManager from '@ohos.bundle.bundleManager';

let isDeviceConnected: boolean;
let tmpPipe: UsbMgr.USBDevicePipe;
let iface: UsbMgr.USBInterface;
let config: UsbMgr.USBConfiguration;
let accessory: UsbMgr.USBAccessory;
let powerRole: UsbMgr.PowerRoleType;
let dataRole: UsbMgr.DataRoleType;
let param: UsbMgr.USBDeviceRequestParams;
let isDevAccessoryFunc: boolean;
let accessInfo: UsbMgr.USBAccessory;
let accessInfoTest: UsbMgr.USBAccessory = {
  manufacturer: 'manufacturer',
  product: 'product',
  description: 'description',
  version: 'version',
  serialNumber: 'serialNumber'
}

function devAccessoryFunc() {
  let accList: Array<UsbMgr.USBAccessory> = UsbMgr.getAccessoryList();
  if (accList.length > 0) {
    hilog.info(domain, tag, "This USB device is accessory function");
    return true;
  }
  hilog.info(domain, tag, "This USB device is accessory function");
  return false;
}

let domain: number = 0x0000;
let tag: string = 'testTag';

function getTransfersParam(gPipe: UsbMgr.USBDevicePipe, flagsValue: UsbMgr.UsbTransferFlags,
  endpointValue: number, typeValue: UsbMgr.UsbEndpointTransferType, timeOutValue: number) {
  let transferParams: UsbMgr.UsbDataTransferParams = {
    devPipe: gPipe,
    flags: flagsValue,
    endpoint: endpointValue,
    type: typeValue,
    timeout: timeOutValue,
    length: 1000,
    callback: () => {
    },
    userData: new Uint8Array(1000),
    buffer: new Uint8Array(1000),
    isoPacketCount: 0,
  };
  return transferParams;
}

function deviceConnected() {
  let gDeviceList: Array<Readonly<UsbMgr.USBDevice>> = UsbMgr.getDevices();
  if (gDeviceList.length > 0) {
    hilog.info(domain, tag, "Test USB device is connected");
    return true;
  }
  hilog.info(domain, tag, "Test USB device is not connected");
  return false;
}

function getPipe(testCaseName: string) {
  if (isDeviceConnected) {
    let gDeviceList: Array<Readonly<UsbMgr.USBDevice>> = UsbMgr.getDevices();
    let devices: UsbMgr.USBDevice = gDeviceList[0];
    let gPipe: UsbMgr.USBDevicePipe = UsbMgr.connectDevice(devices);
    gPipe = UsbMgr.connectDevice(devices);
    hilog.info(domain, tag, `usb ${testCaseName} connectDevice getPipe ret: ${JSON.stringify(gPipe)}`);
    expect(gPipe !== null).assertTrue();
  }
  hilog.info(domain, tag, "connectDevice error");
}

function toClosePipe(testCaseName: string) {
  let gDeviceList: Array<Readonly<UsbMgr.USBDevice>> = UsbMgr.getDevices();
  let devices: UsbMgr.USBDevice = gDeviceList[0];
  let gPipe: UsbMgr.USBDevicePipe = UsbMgr.connectDevice(devices);
  let isPipClose = UsbMgr.closePipe(gPipe);
  console.info(domain, tag, `usb ${testCaseName} closePipe getPipe ret: ${isPipClose}`);
  expect(isPipClose).assertEqual(0);
}


export default function AddUsbManagerTest() {

  describe("AddUsbManagerTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'describe start');
    beforeAll(() => {
      hilog.info(domain, tag, '%{public}s', 'beforeAll start');
      let abilityDelegator: abilityDelegatorRegistry.AbilityDelegator = abilityDelegatorRegistry.getAbilityDelegator()
      abilityDelegator.addAbilityMonitor({
        abilityName: "EntryAbility",
        moduleName: "entry",
        onAbilityCreate: (abilitys: UIAbility): void => {
        },
      }, (err: BusinessError | null): void => {
        if (err != null) {
          hilog.info(domain, tag, '%{public}s', '-----' + err.code);
        }
        hilog.info(domain, tag, '%{public}s', 'BusinessError  end');
      });
      await Utils.msSleep(2000)
      abilityDelegator.executeShellCommand("aa start -a EntryAbility -b com.acts.usb.ets.function.static")
      await Utils.msSleep(2000)
      hilog.info(domain, tag, '%{public}s', 'beforeAll end');


      let gDeviceList = UsbMgr.getDevices();
      hilog.info(domain, tag, '获取设备信息: %{public}s', JSON.stringify(gDeviceList));

      isDeviceConnected = deviceConnected();

      if (isDeviceConnected) {
        let gDeviceList: Array<Readonly<UsbMgr.USBDevice>> = UsbMgr.getDevices();
        let devices: UsbMgr.USBDevice = gDeviceList[0];
        let hasRight = UsbMgr.hasRight(devices.name);
        if (!hasRight) {
          hilog.info(domain, tag, `beforeAll: usb requestRight start`);
        }
      }

      isDevAccessoryFunc = devAccessoryFunc();
      if (isDevAccessoryFunc) {
        let accList: Array<UsbMgr.USBAccessory> = UsbMgr.getAccessoryList();
        accessInfo = accList[0];
        hilog.info(domain, tag, 'beforeAll ret : ', JSON.stringify(accList));
      }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_Func_0100
     * @tc.name     : testHasAccessoryRight001
     * @tc.desc     : verify function hasAccessoryRight
     */
    it("testHasAccessoryRight001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      hilog.info(domain, tag, '----------------------testHasAccessoryRight001---------------------------');
      if (!isDevAccessoryFunc) {
        expect(isDevAccessoryFunc).assertFalse();
        return;
      }
      try {
        let accList: Array<UsbMgr.USBAccessory> = UsbMgr.getAccessoryList();
        accessInfo = accList[0];
        let ret = UsbMgr.hasAccessoryRight(accessInfoTest);
      } catch (error) {
        const err = error as BusinessError;
        hilog.info(domain, tag, 'usb testHasAccessoryRight001 catch err code: ', err.code, ', message: ',
          err.message);
        expect(err.code).assertEqual(14400005);
        expect(err.code != 401).assertEqual(true);
      }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_Func_0300
     * @tc.name     : testUsbSubmitTransfer001
     * @tc.desc     : verify function usbSubmitTransfer
     */
    it("testUsbSubmitTransfer001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'interrupt testUsbSubmitTransfer001 enter');
        if (!isDeviceConnected) {
          hilog.info(domain, tag, 'usb testUsbSubmitTransfer001 No device is connected');
          expect(isDeviceConnected).assertFalse();
          done();
        }
        let devicesList: Array<UsbMgr.USBDevice> = UsbMgr.getDevices();
        if (devicesList.length == 0) {
          hilog.info(domain, tag, 'device list is empty');
        }

        let devices: UsbMgr.USBDevice = devicesList[0];
        UsbMgr.requestRight(devices.name);
        let gPipe: UsbMgr.USBDevicePipe = UsbMgr.connectDevice(devices);
        let tmpInterface: UsbMgr.USBInterface = devices.configs[0].interfaces[0];
        let flags: UsbMgr.UsbTransferFlags = UsbMgr.UsbTransferFlags.USB_TRANSFER_FREE_BUFFER;
        let type: UsbMgr.UsbEndpointTransferType = UsbMgr.UsbEndpointTransferType.TRANSFER_TYPE_INTERRUPT;
        let transferParams: UsbMgr.UsbDataTransferParams = getTransfersParam(gPipe, flags, 129, type, 2000);
        UsbMgr.claimInterface(gPipe, tmpInterface, true);
        try {
          transferParams.callback = (err: BusinessError | null, callBackData: UsbMgr.SubmitTransferCallback | undefined) => {
            hilog.info(domain, tag, 'callBackData = ' + JSON.stringify(callBackData));
            hilog.info(domain, tag,
              'testUsbSubmitTransfer001 transfer success, result = ' + transferParams.buffer.toString());
            hilog.info(domain, tag, 'status = ' + callBackData?.status);
            expect(callBackData?.status == UsbMgr.UsbTransferStatus.TRANSFER_COMPLETED).assertEqual(false);
            expect(callBackData?.status == UsbMgr.UsbTransferStatus.TRANSFER_ERROR).assertEqual(false);
            expect(callBackData?.status == UsbMgr.UsbTransferStatus.TRANSFER_TIMED_OUT).assertEqual(true);
            expect(callBackData?.status == UsbMgr.UsbTransferStatus.TRANSFER_CANCELED).assertEqual(false);
            expect(callBackData?.status == UsbMgr.UsbTransferStatus.TRANSFER_STALL).assertEqual(false);
            expect(callBackData?.status == UsbMgr.UsbTransferStatus.TRANSFER_NO_DEVICE).assertEqual(false);
            expect(callBackData?.status == UsbMgr.UsbTransferStatus.TRANSFER_OVERFLOW).assertEqual(false);
            const descs = callBackData?.isoPacketDescs;
            if (descs && descs.length) {
              for (let j = 0; j < descs.length; j++) {
                const i = descs[j];
                hilog.info(domain, tag, 'isoPacketDescs length = ' + i.length);
                hilog.info(domain, tag, 'isoPacketDescs actualLength = ' + i.actualLength);
                hilog.info(domain, tag, 'isoPacketDescs status = ' + i.status);
              }
            }
            UsbMgr.closePipe(gPipe);
            hilog.info(domain, tag, 'interrupt testUsbSubmitTransfer001 end');
            expect(flags!= UsbMgr.UsbTransferFlags.USB_TRANSFER_SHORT_NOT_OK).assertEqual(true);
            expect(flags!= UsbMgr.UsbTransferFlags.USB_TRANSFER_FREE_TRANSFER).assertEqual(true);
            expect(flags!= UsbMgr.UsbTransferFlags.USB_TRANSFER_ADD_ZERO_PACKET).assertEqual(true);
            done();
          }
          UsbMgr.usbSubmitTransfer(transferParams);
        } catch (error) {
          let err: BusinessError = error as BusinessError;
          hilog.info(domain, tag, 'interrupt error:', err.code);
          UsbMgr.closePipe(gPipe);
          done();
        }
      })

    /**
     * @tc.number   : SUB_USB_HostManager_Func_0400
     * @tc.name     : testUsbControlTransfer001
     * @tc.desc     : verify function usbControlTransfer
     */
    it("testUsbControlTransfer001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'usb test_usbControlTransfer001 begin');
        if (!isDeviceConnected) {
          expect(isDeviceConnected).assertFalse();
          done();
        }
        let param: UsbMgr.USBDeviceRequestParams = {
          bmRequestType: 0x80,
          bRequest: 0x06,
          wValue: (0x01 << 8) | 0x00,
          wIndex: 0x00,
          wLength: 18,
          data: new Uint8Array(18),
        };
        try {
          let devicesList: Array<UsbMgr.USBDevice> = UsbMgr.getDevices();
          if (devicesList.length == 0) {
            hilog.info(domain, tag, 'device list is empty');
          }

          UsbMgr.requestRight(devicesList[0].name);
          hilog.info(domain, tag, `usbControlTransfer001 name = ${devicesList[0].name}`);
          let devicePipe: UsbMgr.USBDevicePipe = UsbMgr.connectDevice(devicesList[0]);

          hilog.info(domain, tag, `usbControlTransfer001 device.name = ${devicesList[0].name}`);
          let ret = UsbMgr.usbControlTransfer(devicePipe, param).then((ret: number) => {
            hilog.info(domain, tag, `usbControlTransfer001 size= ${ret}`);
            expect(ret == 18).assertEqual(true);
          })
          UsbMgr.closePipe(devicePipe);
        } catch (error: BusinessError) {
          hilog.info(0, 'testTag ui', `closeAccessory error `)
          hilog.info(domain, tag, 'usbControlTransfer001 end');
          let err: BusinessError = error as BusinessError;
          hilog.info(domain, tag, `usbControlTransfer001 err.code= ${err.code}`);
        }
        done();
      })

    /**
     * @tc.number   : SUB_USB_HostManager_Func_0500
     * @tc.name     : testBulkTransfer001
     * @tc.desc     : verify function bulkTransfer
     */
    it("testBulkTransfer001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'usb test_bulkTransfer001 begin');
        if (!isDeviceConnected) {
          expect(isDeviceConnected).assertFalse();
          done();
        }

        try {
          let devicesList: Array<UsbMgr.USBDevice> = UsbMgr.getDevices();
          if (devicesList.length == 0) {
            hilog.info(domain, tag, 'device list is empty');
          }

          let device: UsbMgr.USBDevice = devicesList[0];
          UsbMgr.requestRight(device.name);

          let devicePipe: UsbMgr.USBDevicePipe = UsbMgr.connectDevice(device);
          hilog.info(domain, tag, `UsbMgr.connectDevice(device) = ${devicePipe.busNum}`);
          hilog.info(domain, tag, `UsbMgr.connectDevice(device) = ${devicePipe.devAddress}`);
          let interfaces: UsbMgr.USBInterface = device.configs[0].interfaces[0];
          let endpoint: UsbMgr.USBEndpoint =
            device.configs[0].interfaces[0].endpoints[0]; //read 0x81 光驱  ; 1 U盘 write
          hilog.info(domain, tag, `UsbMgr.USBEndpoint = ${endpoint}`);
          let ret: number = UsbMgr.claimInterface(devicePipe, interfaces, true);
          hilog.info(domain, tag, `bulkTransfer begin  = ${ret}`);
          if (ret == 0) {
            hilog.info(domain, tag, 'USB claim sucess');
            let bufferTransfer = new Uint8Array(128);

            hilog.info(domain, tag, `test_bulkTransfer001 name = ${devicesList[0].name}`);
            hilog.info(domain, tag, `test_bulkTransfer001 buffer = ${bufferTransfer}`);

            UsbMgr.bulkTransfer(devicePipe, endpoint, bufferTransfer).then((retVal: number) => {
              hilog.info(domain, tag, `test_bulkTransfer001 retVal = ${retVal}`);
              expect(retVal == 128).assertTrue();
            });
          }
          let ret0 = UsbMgr.releaseInterface(devicePipe, interfaces);
          console.log(`releaseInterface = ${ret0}`);
          hilog.info(domain, tag, `bulkTransfer001 end `);
          UsbMgr.closePipe(devicePipe);
        } catch (error: BusinessError) {
          hilog.info(domain, tag, `bulkTransfer001 error `)
          hilog.info(domain, tag, `bulkTransfer001 err.code= ${error.code}`);
        }
        done();
      })

    /**
     * @tc.number   : SUB_USB_HostManager_Func_0600
     * @tc.name     : testHasRight_008
     * @tc.desc     : verify function hasRight
     */
    it("testHasRight_008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'USB test_hasRight_008 begin');
        if (!isDeviceConnected) {
          expect(isDeviceConnected).assertFalse();
          done();
        }
        try {
          let devicesList: Array<UsbMgr.USBDevice> = UsbMgr.getDevices();
          let devices: UsbMgr.USBDevice = devicesList[0];
          let isHasRight = UsbMgr.hasRight(devices.name);
          hilog.info(domain, tag, 'usb case hasRight ret : ' + isHasRight);
          expect(isHasRight).assertTrue();
        } catch (error) {
          const err = error as BusinessError;
          hilog.info(domain, tag, 'usb test_hasRight_13 catch err code: ', err.code, ', message: ',
            err.message);
          expect(err.code).assertEqual(401);
        }
        done();
      })

    /**
     * @tc.number   : SUB_USB_HostManager_Func_0700
     * @tc.name     : testConnectDevice009
     * @tc.desc     : verify function hasRight
     */
    it("testConnectDevice009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'USB testConnectDevice009 begin');
        if (!isDeviceConnected) {
          expect(isDeviceConnected).assertFalse();
          done();
        }
        try {
          let devicesList: Array<UsbMgr.USBDevice> = UsbMgr.getDevices();
          let devices: UsbMgr.USBDevice = devicesList[0];
          let deviceName = devices.name;
          let isHasRight: boolean = await UsbMgr.requestRight(deviceName);
          if (isHasRight) {
            hilog.info(domain, tag, 'requestRight is true');
          }
          let gPipe = UsbMgr.connectDevice(devices);
          hilog.info(domain, tag, 'test_connectDevice18 success  gPipe.busNum : ' + gPipe.busNum);
          hilog.info(domain, tag, 'test_connectDevice18 success gPipe.devAddress : ' + gPipe.devAddress);
          expect(gPipe.busNum > 0).assertTrue();
          expect(gPipe.devAddress > 0).assertTrue();

          expect(gPipe.busNum < 256).assertTrue();
          expect(gPipe.devAddress < 128).assertTrue();
        } catch (error) {
          const err = error as BusinessError;
          expect(err.code).assertEqual(401);
        }
        done();
      })

    /**
     * @tc.number   : SUB_USB_HostManager_Func_0800
     * @tc.name     : testConnectDevice010
     * @tc.desc     : verify function hasRight
     */
    it("testConnectDevice010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'USB test_connectDevice010 begin');
        if (!isDeviceConnected) {
          expect(isDeviceConnected).assertFalse();
          done();
        }
        try {
          let devicesList: Array<UsbMgr.USBDevice> = UsbMgr.getDevices();
          let devices: UsbMgr.USBDevice = devicesList[0];
          let deviceName = devices.name;
          let isHasRight: boolean = await UsbMgr.requestRight(deviceName);
          if (isHasRight) {
            hilog.info(domain, tag, 'requestRight is true');
          }
          let gPipe = UsbMgr.connectDevice(devices);
          hilog.info(domain, tag, 'test_connectDevice18 success  gPipe.busNum : ' + gPipe.busNum);
          hilog.info(domain, tag, 'test_connectDevice18 success gPipe.devAddress : ' + gPipe.devAddress);
          expect(gPipe.busNum > 0).assertTrue();
          expect(gPipe.devAddress > 0).assertTrue();

          expect(gPipe.busNum < 256).assertTrue();
          expect(gPipe.devAddress < 128).assertTrue();
        } catch (error) {
          const err = error as BusinessError;
          expect(err.code).assertEqual(801);
        }
        done();
      })

    /**
     * @tc.number   : SUB_USB_HostManager_Func_1100
     * @tc.name     : testRemoveRight013
     * @tc.desc     : verify function removeRight
     */
    it("testRemoveRight013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'test_removeRight013');
        if (!isDeviceConnected) {
          expect(isDeviceConnected).assertFalse();
          done();
        }
        try {
          let devicesList: Array<UsbMgr.USBDevice> = UsbMgr.getDevices();
          let devices: UsbMgr.USBDevice = devicesList[0];
          let remRight = UsbMgr.removeRight(devices.name);
          hilog.info(domain, tag, 'usb case test_removeRight17 ret : ' + remRight);
          expect(remRight).assertTrue();
        } catch (error) {
          const err = error as BusinessError;
          expect(err.code).assertEqual(401);
        }
        done();
      })

    /**
     * @tc.number   : SUB_USB_HostManager_Func_2900
     * @tc.name     : testHasAccessoryRight031
     * @tc.desc     : verify function hasAccessoryRight
     */
    it("testHasAccessoryRight031", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      hilog.info(domain, tag, '----------------------testHasAccessoryRight031---------------------------');
      if (!isDevAccessoryFunc) {
        expect(isDevAccessoryFunc).assertFalse();
        return;
      }
      try {
        let accList: Array<UsbMgr.USBAccessory> = UsbMgr.getAccessoryList();
        accessInfo = accList[0];
        let ret = UsbMgr.hasAccessoryRight(accessInfoTest);
      } catch (error) {
        const err = error as BusinessError;
        hilog.info(domain, tag, 'usb testHasAccessoryRight031 catch err code: ', err.code, ', message: ',
          err.message);
        expect(err.code).assertEqual(801);
      }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_Func_3000
     * @tc.name     : testHasAccessoryRight032
     * @tc.desc     : verify function hasAccessoryRight
     */
    it("testHasAccessoryRight032", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      hilog.info(domain, tag, '----------------------testHasAccessoryRight032---------------------------');
      if (!isDevAccessoryFunc) {
        expect(isDevAccessoryFunc).assertFalse();
        return;
      }
      try {
        let accList: Array<UsbMgr.USBAccessory> = UsbMgr.getAccessoryList();
        accessInfo = accList[0];
        let ret = UsbMgr.hasAccessoryRight(accessInfoTest);
      } catch (error) {
        const err = error as BusinessError;
        hilog.info(domain, tag, 'usb testHasAccessoryRight032 catch err code: ', err.code, ', message: ',
          err.message);
        expect(err.code).assertEqual(14400004);
      }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_Func_3100
     * @tc.name     : testHasAccessoryRight033
     * @tc.desc     : verify function hasAccessoryRight
     */
    it("testHasAccessoryRight033", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      hilog.info(domain, tag, '----------------------testHasAccessoryRight033---------------------------');
      if (!isDevAccessoryFunc) {
        expect(isDevAccessoryFunc).assertFalse();
        return;
      }
      try {
        let accList: Array<UsbMgr.USBAccessory> = UsbMgr.getAccessoryList();
        accessInfo = accList[0];
        let ret = UsbMgr.hasAccessoryRight(accessInfoTest);
      } catch (error) {
        const err = error as BusinessError;
        hilog.info(domain, tag, 'usb testHasAccessoryRight033 catch err code: ', err.code, ', message: ',
          err.message);
        expect(err.code).assertEqual(14400001);
      }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_Func_3200
     * @tc.name     : testHasAccessoryRight034
     * @tc.desc     : verify function hasAccessoryRight
     */
    it("testRequestAccessoryRight034", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      hilog.info(domain, tag, '----------------------testRequestAccessoryRight034---------------------------');
      if (!isDevAccessoryFunc) {
        expect(isDevAccessoryFunc).assertFalse();
        return;
      }
      try {
        let accList: Array<UsbMgr.USBAccessory> = UsbMgr.getAccessoryList();
        accessInfo = accList[0];
        let ret = await UsbMgr.requestAccessoryRight(accessInfo);
      } catch (error) {
        const err = error as BusinessError;
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_Func_3300
     * @tc.name     : testRequestAccessoryRight035
     * @tc.desc     : verify function requestAccessoryRight
     */
    it("testRequestAccessoryRight035", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      hilog.info(domain, tag, '----------------------testRequestAccessoryRight035---------------------------');
      if (!isDevAccessoryFunc) {
        hilog.info(domain, tag, 'getAccessoryList is empty : ', );
        return;
      }
      try {
        let accList: Array<UsbMgr.USBAccessory> = UsbMgr.getAccessoryList();
        accessInfo = accList[0];
        let ret = await UsbMgr.requestAccessoryRight(accessInfo);
      } catch (error) {
        const err = error as BusinessError;
        hilog.info(domain, tag, 'testRequestAccessoryRight035 err : ', err);
        expect(err.code).assertEqual(801);
      }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_Func_3400
     * @tc.name     : testRequestAccessoryRight036
     * @tc.desc     : verify function requestAccessoryRight
     */
    it("testRequestAccessoryRight036", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      hilog.info(domain, tag, '----------------------testRequestAccessoryRight036---------------------------');
      if (!isDevAccessoryFunc) {
        hilog.info(domain, tag, 'getAccessoryList is empty : ', );
        return;
      }
      try {
        let accList: Array<UsbMgr.USBAccessory> = UsbMgr.getAccessoryList();
        accessInfo = accList[0];
        let ret = await UsbMgr.requestAccessoryRight(accessInfo);
      } catch (error) {
        const err = error as BusinessError;
        hilog.info(domain, tag, 'testRequestAccessoryRight036 err : ', err);
        expect(err.code).assertEqual(14400004);
      }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_Func_3500
     * @tc.name     : testRequestAccessoryRight037
     * @tc.desc     : verify function requestAccessoryRight
     */
    it("testRequestAccessoryRight037", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      hilog.info(domain, tag, '----------------------testRequestAccessoryRight037---------------------------');
      if (!isDevAccessoryFunc) {
        hilog.info(domain, tag, 'getAccessoryList is empty : ', );
        return;
      }
      try {
        let accList: Array<UsbMgr.USBAccessory> = UsbMgr.getAccessoryList();
        accessInfo = accList[0];
        let ret = await UsbMgr.requestAccessoryRight(accessInfo);
      } catch (error) {
        const err = error as BusinessError;
        hilog.info(domain, tag, 'testRequestAccessoryRight037 err : ', err);
        expect(err.code).assertEqual(14400005);
      }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_Func_3600
     * @tc.name     : testRequestAccessoryRight038
     * @tc.desc     : verify function requestAccessoryRight
     */
    it("testRequestAccessoryRight038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      hilog.info(domain, tag, '----------------------testRequestAccessoryRight038---------------------------');
      if (!isDevAccessoryFunc) {
        hilog.info(domain, tag, 'getAccessoryList is empty : ', );
        return;
      }
      try {
        let accList: Array<UsbMgr.USBAccessory> = UsbMgr.getAccessoryList();
        accessInfo = accList[0];
        let ret = await UsbMgr.requestAccessoryRight(accessInfo);
      } catch (error) {
        const err = error as BusinessError;
        hilog.info(domain, tag, 'testRequestAccessoryRight038 err : ', err);
        expect(err.code).assertEqual(14400001);
      }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_Func_3900
     * @tc.name     : testOpenAccessory039
     * @tc.desc     : verify function openAccessory
     */
    it("testOpenAccessory039", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      hilog.info(domain, tag, '----------------------testOpenAccessory039---------------------------');
      if (!isDevAccessoryFunc) {
        hilog.info(domain, tag, 'getAccessoryList is empty : ', );
        return;
      }
      try {
        let accList: Array<UsbMgr.USBAccessory> = UsbMgr.getAccessoryList();
        accessInfo = accList[0];
        await UsbMgr.requestAccessoryRight(accessInfo);
        let accHandle: UsbMgr.USBAccessoryHandle = UsbMgr.openAccessory(accessInfo);
        UsbMgr.closeAccessory(accHandle);
        UsbMgr.cancelAccessoryRight(accessInfo);
      } catch (error) {
        const err = error as BusinessError;
        hilog.info(domain, tag, 'testOpenAccessory039 err : ', err);
        expect(err.code).assertEqual(801);
      }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_Func_4000
     * @tc.name     : testOpenAccessory040
     * @tc.desc     : verify function openAccessory
     */
    it("testOpenAccessory040", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,() => {
      hilog.info(domain, tag, '----------------------testOpenAccessory040---------------------------');
      if (!isDevAccessoryFunc) {
        hilog.info(domain, tag, 'getAccessoryList is empty : ', );
        return;
      }
      try {
        let accList: Array<UsbMgr.USBAccessory> = UsbMgr.getAccessoryList();
        accessInfo = accList[0];
        await UsbMgr.requestAccessoryRight(accessInfo);
        let accHandle: UsbMgr.USBAccessoryHandle = UsbMgr.openAccessory(accessInfo);
        UsbMgr.closeAccessory(accHandle);
        UsbMgr.cancelAccessoryRight(accessInfo);
      } catch (error) {
        const err = error as BusinessError;
        hilog.info(domain, tag, 'testOpenAccessory040 err : ', err);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_Func_4100
     * @tc.name     : testOpenAccessory041
     * @tc.desc     : verify function openAccessory
     */
    it("testOpenAccessory041", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      hilog.info(domain, tag, '----------------------testOpenAccessory041---------------------------');
      if (!isDevAccessoryFunc) {
        hilog.info(domain, tag, 'getAccessoryList is empty : ', );
        return;
      }
      try {
        let accList: Array<UsbMgr.USBAccessory> = UsbMgr.getAccessoryList();
        accessInfo = accList[0];
        await UsbMgr.requestAccessoryRight(accessInfo);
        let accHandle: UsbMgr.USBAccessoryHandle = UsbMgr.openAccessory(accessInfo);
        UsbMgr.closeAccessory(accHandle);
        UsbMgr.cancelAccessoryRight(accessInfo);
      } catch (error) {
        const err = error as BusinessError;
        hilog.info(domain, tag, 'testOpenAccessory041 err : ', err);
        expect(err.code).assertEqual(14400001);
      }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_Func_4200
     * @tc.name     : testOpenAccessory042
     * @tc.desc     : verify function openAccessory
     */
    it("testOpenAccessory042", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      hilog.info(domain, tag, '----------------------testOpenAccessory042---------------------------');
      if (!isDevAccessoryFunc) {
        hilog.info(domain, tag, 'getAccessoryList is empty : ', );
        return;
      }
      try {
        let accList: Array<UsbMgr.USBAccessory> = UsbMgr.getAccessoryList();
        accessInfo = accList[0];
        await UsbMgr.requestAccessoryRight(accessInfo);
        let accHandle: UsbMgr.USBAccessoryHandle = UsbMgr.openAccessory(accessInfo);
        UsbMgr.closeAccessory(accHandle);
        UsbMgr.cancelAccessoryRight(accessInfo);
      } catch (error) {
        const err = error as BusinessError;
        hilog.info(domain, tag, 'testOpenAccessory042 err : ', err);
        expect(err.code).assertEqual(14400004);
      }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_Func_4300
     * @tc.name     : testOpenAccessory043
     * @tc.desc     : verify function openAccessory
     */
    it("testOpenAccessory043", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      hilog.info(domain, tag, '----------------------testOpenAccessory043---------------------------');
      if (!isDevAccessoryFunc) {
        hilog.info(domain, tag, 'getAccessoryList is empty : ', );
        return;
      }
      try {
        let accList: Array<UsbMgr.USBAccessory> = UsbMgr.getAccessoryList();
        accessInfo = accList[0];
        await UsbMgr.requestAccessoryRight(accessInfo);
        let accHandle: UsbMgr.USBAccessoryHandle = UsbMgr.openAccessory(accessInfo);
        UsbMgr.closeAccessory(accHandle);
        UsbMgr.cancelAccessoryRight(accessInfo);
      } catch (error) {
        const err = error as BusinessError;
        hilog.info(domain, tag, 'testOpenAccessory043 err : ', err);
        expect(err.code).assertEqual(14401001);
      }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_Func_4400
     * @tc.name     : testOpenAccessory044
     * @tc.desc     : verify function openAccessory
     */
    it("testOpenAccessory044", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      hilog.info(domain, tag, '----------------------testOpenAccessory044---------------------------');
      if (!isDevAccessoryFunc) {
        hilog.info(domain, tag, 'getAccessoryList is empty : ', );
        return;
      }
      try {
        let accList: Array<UsbMgr.USBAccessory> = UsbMgr.getAccessoryList();
        accessInfo = accList[0];
        await UsbMgr.requestAccessoryRight(accessInfo);
        let accHandle: UsbMgr.USBAccessoryHandle = UsbMgr.openAccessory(accessInfo);
        UsbMgr.closeAccessory(accHandle);
        UsbMgr.cancelAccessoryRight(accessInfo);
      } catch (error) {
        const err = error as BusinessError;
        hilog.info(domain, tag, 'testOpenAccessory044 err : ', err);
        expect(err.code).assertEqual(14401002);
      }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_Func_4500
     * @tc.name     : testOpenAccessory045
     * @tc.desc     : verify function openAccessory
     */
    it("testOpenAccessory045", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      hilog.info(domain, tag, '----------------------testOpenAccessory045---------------------------');
      if (!isDevAccessoryFunc) {
        hilog.info(domain, tag, 'getAccessoryList is empty : ', );
        return;
      }
      try {
        let accList: Array<UsbMgr.USBAccessory> = UsbMgr.getAccessoryList();
        accessInfo = accList[0];
        await UsbMgr.requestAccessoryRight(accessInfo);
        let accHandle: UsbMgr.USBAccessoryHandle = UsbMgr.openAccessory(accessInfo);
        UsbMgr.closeAccessory(accHandle);
        UsbMgr.cancelAccessoryRight(accessInfo);
      } catch (error) {
        const err = error as BusinessError;
        hilog.info(domain, tag, 'testOpenAccessory045 err : ', err);
        expect(err.code).assertEqual(14401003);
      }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_Func_4600
     * @tc.name     : testOpenAccessory048
     * @tc.desc     : verify function openAccessory
     */
    it("testOpenAccessory048", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      hilog.info(domain, tag, '----------------------testOpenAccessory048---------------------------');
      if (!isDevAccessoryFunc) {
        hilog.info(domain, tag, 'getAccessoryList is empty : ', );
        return;
      }
      try {
        let accList: Array<UsbMgr.USBAccessory> = UsbMgr.getAccessoryList();
        accessInfo = accList[0];
        await UsbMgr.requestAccessoryRight(accessInfo);
        let accHandle: UsbMgr.USBAccessoryHandle = UsbMgr.openAccessory(accessInfo);
        UsbMgr.closeAccessory(accHandle);
        UsbMgr.cancelAccessoryRight(accessInfo);
      } catch (error) {
        const err = error as BusinessError;
        hilog.info(domain, tag, 'testOpenAccessory048 err : ', err);
        expect(err.code).assertEqual(801);
      }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_Func_4700
     * @tc.name     : testOpenAccessory049
     * @tc.desc     : verify function openAccessory
     */
    it("testOpenAccessory049", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      hilog.info(domain, tag, '----------------------testOpenAccessory049---------------------------');
      if (!isDevAccessoryFunc) {
        hilog.info(domain, tag, 'getAccessoryList is empty : ', );
        return;
      }
      try {
        let accList: Array<UsbMgr.USBAccessory> = UsbMgr.getAccessoryList();
        accessInfo = accList[0];
        await UsbMgr.requestAccessoryRight(accessInfo);
        let accHandle: UsbMgr.USBAccessoryHandle = UsbMgr.openAccessory(accessInfo);
        UsbMgr.closeAccessory(accHandle);
        UsbMgr.cancelAccessoryRight(accessInfo);
      } catch (error) {
        const err = error as BusinessError;
        hilog.info(domain, tag, 'testOpenAccessory049 err : ', err);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_Func_4800
     * @tc.name     : testCloseAccessory050
     * @tc.desc     : verify function closeAccessory
     */
    it("testCloseAccessory050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      hilog.info(domain, tag, '----------------------testCloseAccessory050---------------------------');
      if (!isDevAccessoryFunc) {
        hilog.info(domain, tag, 'getAccessoryList is empty : ', );
        return;
      }
      let accHandle: UsbMgr.USBAccessoryHandle = {
        accessoryFd: 0
      };
      try {
        UsbMgr.closeAccessory(accHandle);
      } catch (error) {
        const err = error as BusinessError;
        hilog.info(domain, tag, 'testCloseAccessory050 err : ', err);
        expect(err.code).assertEqual(401);
      }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_Func_4900
     * @tc.name     : testCloseAccessory051
     * @tc.desc     : verify function closeAccessory
     */
    it("testCloseAccessory051", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      hilog.info(domain, tag, '----------------------testCloseAccessory051---------------------------');
      if (!isDevAccessoryFunc) {
        hilog.info(domain, tag, 'getAccessoryList is empty : ', );
        return;
      }
      let accHandle: UsbMgr.USBAccessoryHandle = {
        accessoryFd: 0
      };
      try {
        UsbMgr.closeAccessory(accHandle);
      } catch (error) {
        const err = error as BusinessError;
        hilog.info(domain, tag, 'testCloseAccessory051 err : ', err);
        expect(err.code).assertEqual(801);
      }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_Func_5000
     * @tc.name     : testCloseAccessory052
     * @tc.desc     : verify function closeAccessory
     */
    it("testCloseAccessory052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      hilog.info(domain, tag, '----------------------testCloseAccessory052---------------------------');
      if (!isDevAccessoryFunc) {
        hilog.info(domain, tag, 'getAccessoryList is empty : ', );
        return;
      }
      let accHandle: UsbMgr.USBAccessoryHandle = {
        accessoryFd: 0
      };
      try {
        UsbMgr.closeAccessory(accHandle);
      } catch (error) {
        const err = error as BusinessError;
        hilog.info(domain, tag, 'testCloseAccessory052 err : ', err);
        expect(err.code).assertEqual(14400004);
      }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_Func_5300
     * @tc.name     : testConnectDevice055
     * @tc.desc     : verify function connectDevice
     */
    it("testConnectDevice055", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'USB test_connectDevice055 begin');
        if (!isDeviceConnected) {
          expect(isDeviceConnected).assertFalse();
          done();
        }
        try {
          let devicesList: Array<UsbMgr.USBDevice> = UsbMgr.getDevices();
          let devices: UsbMgr.USBDevice = devicesList[0];
          let deviceName = devices.name;
          let isHasRight: boolean = await UsbMgr.requestRight(deviceName);
          if (isHasRight) {
            hilog.info(domain, tag, 'requestRight is true');
          }
          let gPipe = UsbMgr.connectDevice(devices);
          hilog.info(domain, tag, 'test_connectDevice18 success  gPipe.busNum : ' + gPipe.busNum);
          hilog.info(domain, tag, 'test_connectDevice18 success gPipe.devAddress : ' + gPipe.devAddress);
          expect(gPipe.busNum > 0).assertTrue();
          expect(gPipe.devAddress > 0).assertTrue();

          expect(gPipe.busNum < 256).assertTrue();
          expect(gPipe.devAddress < 128).assertTrue();
        } catch (error: BusinessError) {
          expect(error.code).assertEqual(14400001);
        }
        done();
      })

    /**
     * @tc.number   : SUB_USB_HostManager_Func_5400
     * @tc.name     : testHasAccessoryRight056
     * @tc.desc     : verify function hasAccessoryRight
     */
    it("testHasAccessoryRight056", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, () => {
      hilog.info(domain, tag, '----------------------testHasAccessoryRight056---------------------------');
      try {
        let accList: Array<UsbMgr.USBAccessory> = UsbMgr.getAccessoryList();
        accessInfo = accList[0];
        let ret = UsbMgr.hasAccessoryRight(accessInfoTest);
      } catch (error) {
        const err = error as BusinessError;
        hilog.info(domain, tag, 'usb testHasAccessoryRight056 catch err code: ', err.code, ', message: ',
          err.message);
        expect(err.code).assertEqual(14401001);
      }
    })

    /**
     * @tc.number   : SUB_USB_HostManager_Func_5600
     * @tc.name     : testUsbSubmitTransfer058
     * @tc.desc     : verify function usbSubmitTransfer
     */
    it("testUsbSubmitTransfer058", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'interrupt testUsbSubmitTransfer058 enter');
        if (!isDeviceConnected) {
          hilog.info(domain, tag, 'usb testUsbSubmitTransfer058 No device is connected');
          expect(isDeviceConnected).assertFalse();
          done();
        }
        let devicesList: Array<UsbMgr.USBDevice> = UsbMgr.getDevices();
        if (devicesList.length == 0) {
          hilog.info(domain, tag, 'device list is empty');
        }

        let devices: UsbMgr.USBDevice = devicesList[0];
        UsbMgr.requestRight(devices.name);
        let gPipe: UsbMgr.USBDevicePipe = UsbMgr.connectDevice(devices);
        let tmpInterface: UsbMgr.USBInterface = devices.configs[0].interfaces[0];
        let flags: UsbMgr.UsbTransferFlags = UsbMgr.UsbTransferFlags.USB_TRANSFER_FREE_BUFFER;
        let type: UsbMgr.UsbEndpointTransferType = UsbMgr.UsbEndpointTransferType.TRANSFER_TYPE_INTERRUPT;
        let transferParams: UsbMgr.UsbDataTransferParams = getTransfersParam(gPipe, flags, 129, type, 2000);
        UsbMgr.claimInterface(gPipe, tmpInterface, true);
        try {
          transferParams.callback = (err: BusinessError | null, callBackData: UsbMgr.SubmitTransferCallback | undefined) => {
            hilog.info(domain, tag, 'callBackData = ' + JSON.stringify(callBackData));
            hilog.info(domain, tag,
              'testUsbSubmitTransfer058 transfer success, result = ' + transferParams.buffer.toString());
            hilog.info(domain, tag, 'status = ' + callBackData?.status);
            expect(callBackData?.status == UsbMgr.UsbTransferStatus.TRANSFER_TIMED_OUT).assertEqual(true);
            UsbMgr.closePipe(gPipe);
            hilog.info(domain, tag, 'interrupt testUsbSubmitTransfer058 end');
            done();
          }
          UsbMgr.usbSubmitTransfer(transferParams);
        } catch (error) {
          let err: BusinessError = error as BusinessError;
          hilog.info(domain, tag, 'interrupt error:', err.code);
          UsbMgr.closePipe(gPipe);
          expect(err.code).assertEqual(14400001);
          done();
        }
      })

    /**
     * @tc.number   : SUB_USB_HostManager_Func_5700
     * @tc.name     : testUsbSubmitTransfer059
     * @tc.desc     : verify function usbSubmitTransfer
     */
    it("testUsbSubmitTransfer059", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'interrupt testUsbSubmitTransfer059 enter');
        if (!isDeviceConnected) {
          hilog.info(domain, tag, 'usb testUsbSubmitTransfer059 No device is connected');
          expect(isDeviceConnected).assertFalse();
          done();
        }
        let devicesList: Array<UsbMgr.USBDevice> = UsbMgr.getDevices();
        if (devicesList.length == 0) {
          hilog.info(domain, tag, 'device list is empty');
        }

        let devices: UsbMgr.USBDevice = devicesList[0];
        UsbMgr.requestRight(devices.name);
        let gPipe: UsbMgr.USBDevicePipe = UsbMgr.connectDevice(devices);
        let tmpInterface: UsbMgr.USBInterface = devices.configs[0].interfaces[0];
        let flags: UsbMgr.UsbTransferFlags = UsbMgr.UsbTransferFlags.USB_TRANSFER_FREE_BUFFER;
        let type: UsbMgr.UsbEndpointTransferType = UsbMgr.UsbEndpointTransferType.TRANSFER_TYPE_INTERRUPT;
        let transferParams: UsbMgr.UsbDataTransferParams = getTransfersParam(gPipe, flags, 129, type, 2000);
        UsbMgr.claimInterface(gPipe, tmpInterface, true);
        try {
          transferParams.callback = (err: BusinessError | null, callBackData: UsbMgr.SubmitTransferCallback | undefined) => {
            hilog.info(domain, tag, 'callBackData = ' + JSON.stringify(callBackData));
            hilog.info(domain, tag,
              'testUsbSubmitTransfer059 transfer success, result = ' + transferParams.buffer.toString());
            hilog.info(domain, tag, 'status = ' + callBackData?.status);
            expect(callBackData?.status == UsbMgr.UsbTransferStatus.TRANSFER_TIMED_OUT).assertEqual(true);
            UsbMgr.closePipe(gPipe);
            hilog.info(domain, tag, 'interrupt testUsbSubmitTransfer059 end');
            done();
          }
          UsbMgr.usbSubmitTransfer(transferParams);
        } catch (error) {
          let err: BusinessError = error as BusinessError;
          hilog.info(domain, tag, 'interrupt error:', err.code);
          UsbMgr.closePipe(gPipe);
          expect(err.code).assertEqual(14400007);
          done();
        }
      })

    /**
     * @tc.number   : SUB_USB_HostManager_Func_5800
     * @tc.name     : testUsbSubmitTransfer060
     * @tc.desc     : verify function usbSubmitTransfer
     */
    it("testUsbSubmitTransfer060", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'interrupt testUsbSubmitTransfer060 enter');
        if (!isDeviceConnected) {
          hilog.info(domain, tag, 'usb testUsbSubmitTransfer060 No device is connected');
          expect(isDeviceConnected).assertFalse();
          done();
        }
        let devicesList: Array<UsbMgr.USBDevice> = UsbMgr.getDevices();
        if (devicesList.length == 0) {
          hilog.info(domain, tag, 'device list is empty');
        }

        let devices: UsbMgr.USBDevice = devicesList[0];
        UsbMgr.requestRight(devices.name);
        let gPipe: UsbMgr.USBDevicePipe = UsbMgr.connectDevice(devices);
        let tmpInterface: UsbMgr.USBInterface = devices.configs[0].interfaces[0];
        let flags: UsbMgr.UsbTransferFlags = UsbMgr.UsbTransferFlags.USB_TRANSFER_FREE_BUFFER;
        let type: UsbMgr.UsbEndpointTransferType = UsbMgr.UsbEndpointTransferType.TRANSFER_TYPE_INTERRUPT;
        let transferParams: UsbMgr.UsbDataTransferParams = getTransfersParam(gPipe, flags, 129, type, 2000);
        UsbMgr.claimInterface(gPipe, tmpInterface, true);
        try {
          transferParams.callback = (err: BusinessError | null, callBackData: UsbMgr.SubmitTransferCallback | undefined)=> {
            hilog.info(domain, tag, 'callBackData = ' + JSON.stringify(callBackData));
            hilog.info(domain, tag,
              'testUsbSubmitTransfer060 transfer success, result = ' + transferParams.buffer.toString());
            hilog.info(domain, tag, 'status = ' + callBackData?.status);
            expect(callBackData?.status == UsbMgr.UsbTransferStatus.TRANSFER_TIMED_OUT).assertEqual(true);
            UsbMgr.closePipe(gPipe);
            hilog.info(domain, tag, 'interrupt testUsbSubmitTransfer060 end');
            done();
          }
          UsbMgr.usbSubmitTransfer(transferParams);
        } catch (error) {
          let err: BusinessError = error as BusinessError;
          hilog.info(domain, tag, 'interrupt error:', err.code);
          UsbMgr.closePipe(gPipe);
          expect(err.code).assertEqual(14400008);
          done();
        }
      })

    /**
     * @tc.number   : SUB_USB_HostManager_Func_5900
     * @tc.name     : testUsbSubmitTransfer061
     * @tc.desc     : verify function usbSubmitTransfer
     */
    it("testUsbSubmitTransfer061", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'interrupt testUsbSubmitTransfer061 enter');
        if (!isDeviceConnected) {
          hilog.info(domain, tag, 'usb testUsbSubmitTransfer061 No device is connected');
          expect(isDeviceConnected).assertFalse();
          done();
        }
        let devicesList: Array<UsbMgr.USBDevice> = UsbMgr.getDevices();
        if (devicesList.length == 0) {
          hilog.info(domain, tag, 'device list is empty');
        }

        let devices: UsbMgr.USBDevice = devicesList[0];
        UsbMgr.requestRight(devices.name);
        let gPipe: UsbMgr.USBDevicePipe = UsbMgr.connectDevice(devices);
        let tmpInterface: UsbMgr.USBInterface = devices.configs[0].interfaces[0];
        let flags: UsbMgr.UsbTransferFlags = UsbMgr.UsbTransferFlags.USB_TRANSFER_FREE_BUFFER;
        let type: UsbMgr.UsbEndpointTransferType = UsbMgr.UsbEndpointTransferType.TRANSFER_TYPE_INTERRUPT;
        let transferParams: UsbMgr.UsbDataTransferParams = getTransfersParam(gPipe, flags, 129, type, 2000);
        UsbMgr.claimInterface(gPipe, tmpInterface, true);
        try {
          transferParams.callback = (err: BusinessError | null, callBackData: UsbMgr.SubmitTransferCallback | undefined) => {
            hilog.info(domain, tag, 'callBackData = ' + JSON.stringify(callBackData));
            hilog.info(domain, tag,
              'testUsbSubmitTransfer061 transfer success, result = ' + transferParams.buffer.toString());
            hilog.info(domain, tag, 'status = ' + callBackData?.status);
            expect(callBackData?.status == UsbMgr.UsbTransferStatus.TRANSFER_TIMED_OUT).assertEqual(true);
            UsbMgr.closePipe(gPipe);
            hilog.info(domain, tag, 'interrupt testUsbSubmitTransfer061 end');
            done();
          }
          UsbMgr.usbSubmitTransfer(transferParams);
        } catch (error) {
          let err: BusinessError = error as BusinessError;
          hilog.info(domain, tag, 'interrupt error:', err.code);
          UsbMgr.closePipe(gPipe);
          expect(err.code).assertEqual(14400009);
          done();
        }
      })

    /**
     * @tc.number   : SUB_USB_HostManager_Func_6000
     * @tc.name     : testUsbSubmitTransfer062
     * @tc.desc     : verify function usbSubmitTransfer
     */
    it("testUsbSubmitTransfer062", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'interrupt testUsbSubmitTransfer062 enter');
        if (!isDeviceConnected) {
          hilog.info(domain, tag, 'usb testUsbSubmitTransfer062 No device is connected');
          expect(isDeviceConnected).assertFalse();
          done();
        }
        let devicesList: Array<UsbMgr.USBDevice> = UsbMgr.getDevices();
        if (devicesList.length == 0) {
          hilog.info(domain, tag, 'device list is empty');
        }

        let devices: UsbMgr.USBDevice = devicesList[0];
        UsbMgr.requestRight(devices.name);
        let gPipe: UsbMgr.USBDevicePipe = UsbMgr.connectDevice(devices);
        let tmpInterface: UsbMgr.USBInterface = devices.configs[0].interfaces[0];
        let flags: UsbMgr.UsbTransferFlags = UsbMgr.UsbTransferFlags.USB_TRANSFER_FREE_BUFFER;
        let type: UsbMgr.UsbEndpointTransferType = UsbMgr.UsbEndpointTransferType.TRANSFER_TYPE_INTERRUPT;
        let transferParams: UsbMgr.UsbDataTransferParams = getTransfersParam(gPipe, flags, 129, type, 2000);
        UsbMgr.claimInterface(gPipe, tmpInterface, true);
        try {
          transferParams.callback = (err: BusinessError | null, callBackData: UsbMgr.SubmitTransferCallback | undefined)=> {
            hilog.info(domain, tag, 'callBackData = ' + JSON.stringify(callBackData));
            hilog.info(domain, tag,
              'testUsbSubmitTransfer062 transfer success, result = ' + transferParams.buffer.toString());
            hilog.info(domain, tag, 'status = ' + callBackData?.status);
            expect(callBackData?.status == UsbMgr.UsbTransferStatus.TRANSFER_TIMED_OUT).assertEqual(true);
            UsbMgr.closePipe(gPipe);
            hilog.info(domain, tag, 'interrupt testUsbSubmitTransfer062 end');
            done();
          }
          UsbMgr.usbSubmitTransfer(transferParams);
        } catch (error) {
          let err: BusinessError = error as BusinessError;
          hilog.info(domain, tag, 'interrupt error:', err.code);
          UsbMgr.closePipe(gPipe);
          expect(err.code).assertEqual(14400012);
          done();
        }
      })

    /**
     * @tc.number   : SUB_USB_HostManager_Func_6100
     * @tc.name     : testUsbCancelTransfer063
     * @tc.desc     : verify function usbCancelTransfer
     */
    it("testUsbCancelTransfer063", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'interrupt testUsbCancelTransfer063 enter');
        if (!isDeviceConnected) {
          hilog.info(domain, tag, 'usb testUsbCancelTransfer063 No device is connected');
          expect(isDeviceConnected).assertFalse();
          done();
        }
        let devicesList: Array<UsbMgr.USBDevice> = UsbMgr.getDevices();
        if (devicesList.length == 0) {
          hilog.info(domain, tag, 'device list is empty');
        }
        let devices: UsbMgr.USBDevice = devicesList[0];
        UsbMgr.requestRight(devices.name);
        let gPipe: UsbMgr.USBDevicePipe = UsbMgr.connectDevice(devices);
        let endpoint = devices.configs[0].interfaces[0]?.endpoints.find((value) => {
          return value.direction === 0 && value.type === 2
        })
        let flags: UsbMgr.UsbTransferFlags = UsbMgr.UsbTransferFlags.USB_TRANSFER_FREE_BUFFER;
        let type: UsbMgr.UsbEndpointTransferType = UsbMgr.UsbEndpointTransferType.TRANSFER_TYPE_INTERRUPT;
        let transferParams: UsbMgr.UsbDataTransferParams = getTransfersParam(gPipe, flags, 129, type, 2000);
        try {
          UsbMgr.usbSubmitTransfer(transferParams);
          UsbMgr.usbCancelTransfer(transferParams);
          hilog.info(domain, tag, 'USB transfer request submitted.');
        } catch (error: BusinessError) {
          hilog.info(domain, tag, 'testUsbCancelTransfer063 catch err code================: ' + JSON.stringify(error));
          expect(error.code).assertEqual(14400001);
        }
        done();
      })

    /**
     * @tc.number   : SUB_USB_HostManager_Func_6200
     * @tc.name     : testUsbCancelTransfer064
     * @tc.desc     : verify function usbCancelTransfer
     */
    it("testUsbCancelTransfer064", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'interrupt testUsbCancelTransfer064 enter');
        if (!isDeviceConnected) {
          hilog.info(domain, tag, 'usb testUsbCancelTransfer004 No device is connected');
          expect(isDeviceConnected).assertFalse();
          done();
        }
        let devicesList: Array<UsbMgr.USBDevice> = UsbMgr.getDevices();
        if (devicesList.length == 0) {
          hilog.info(domain, tag, 'device list is empty');
        }
        let devices: UsbMgr.USBDevice = devicesList[0];
        UsbMgr.requestRight(devices.name);
        let gPipe: UsbMgr.USBDevicePipe = UsbMgr.connectDevice(devices);
        let endpoint = devices.configs[0].interfaces[0]?.endpoints.find((value) => {
          return value.direction === 0 && value.type === 2
        })
        let flags: UsbMgr.UsbTransferFlags = UsbMgr.UsbTransferFlags.USB_TRANSFER_FREE_BUFFER;
        let type: UsbMgr.UsbEndpointTransferType = UsbMgr.UsbEndpointTransferType.TRANSFER_TYPE_INTERRUPT;
        let transferParams: UsbMgr.UsbDataTransferParams = getTransfersParam(gPipe, flags, 129, type, 2000);
        try {
          UsbMgr.usbSubmitTransfer(transferParams);
          UsbMgr.usbCancelTransfer(transferParams);
          hilog.info(domain, tag, 'USB transfer request submitted.');
        } catch (error: BusinessError) {
          hilog.info(domain, tag, 'testUsbCancelTransfer064 catch err code================: ' + JSON.stringify(error));
          expect(error.code).assertEqual(14400008);
        }
        done();
      })

    /**
     * @tc.number   : SUB_USB_HostManager_Func_6300
     * @tc.name     : testUsbCancelTransfer065
     * @tc.desc     : verify function usbCancelTransfer
     */
    it("testUsbCancelTransfer065", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'interrupt testUsbCancelTransfer065 enter');
        if (!isDeviceConnected) {
          hilog.info(domain, tag, 'usb testUsbCancelTransfer065 No device is connected');
          expect(isDeviceConnected).assertFalse();
          done();
        }
        let devicesList: Array<UsbMgr.USBDevice> = UsbMgr.getDevices();
        if (devicesList.length == 0) {
          hilog.info(domain, tag, 'device list is empty');
        }
        let devices: UsbMgr.USBDevice = devicesList[0];
        UsbMgr.requestRight(devices.name);
        let gPipe: UsbMgr.USBDevicePipe = UsbMgr.connectDevice(devices);
        let endpoint = devices.configs[0].interfaces[0]?.endpoints.find((value) => {
          return value.direction === 0 && value.type === 2
        })
        let flags: UsbMgr.UsbTransferFlags = UsbMgr.UsbTransferFlags.USB_TRANSFER_FREE_BUFFER;
        let type: UsbMgr.UsbEndpointTransferType = UsbMgr.UsbEndpointTransferType.TRANSFER_TYPE_INTERRUPT;
        let transferParams: UsbMgr.UsbDataTransferParams = getTransfersParam(gPipe, flags, 129, type, 2000);
        try {
          UsbMgr.usbSubmitTransfer(transferParams);
          UsbMgr.usbCancelTransfer(transferParams);
          hilog.info(domain, tag, 'USB transfer request submitted.');
        } catch (error: BusinessError) {
          hilog.info(domain, tag, 'testUsbCancelTransfer065 catch err code================: ' + JSON.stringify(error));
          expect(error.code).assertEqual(14400010);
        }
        done();
      })

    /**
     * @tc.number   : SUB_USB_HostManager_Func_6400
     * @tc.name     : testUsbSubmitTransfer066
     * @tc.desc     : verify function usbSubmitTransfer
     */
    it("testUsbSubmitTransfer066", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'interrupt testUsbSubmitTransfer066 enter');
        if (!isDeviceConnected) {
          hilog.info(domain, tag, 'usb testUsbSubmitTransfer066 No device is connected');
          expect(isDeviceConnected).assertFalse();
          done();
        }
        let devicesList: Array<UsbMgr.USBDevice> = UsbMgr.getDevices();
        if (devicesList.length == 0) {
          hilog.info(domain, tag, 'device list is empty');
        }

        let devices: UsbMgr.USBDevice = devicesList[0];
        UsbMgr.requestRight(devices.name);
        let gPipe: UsbMgr.USBDevicePipe = UsbMgr.connectDevice(devices);
        let tmpInterface: UsbMgr.USBInterface = devices.configs[0].interfaces[0];
        let flags: UsbMgr.UsbTransferFlags = UsbMgr.UsbTransferFlags.USB_TRANSFER_FREE_BUFFER;
        let type: UsbMgr.UsbEndpointTransferType = UsbMgr.UsbEndpointTransferType.TRANSFER_TYPE_BULK;
        let transferParams: UsbMgr.UsbDataTransferParams = getTransfersParam(gPipe, flags, 129, type, 2000);
        UsbMgr.claimInterface(gPipe, tmpInterface, true);
        try {
          transferParams.callback = (err: BusinessError | null, callBackData: UsbMgr.SubmitTransferCallback | undefined)=> {
            hilog.info(domain, tag, 'callBackData = ' + JSON.stringify(callBackData));
            hilog.info(domain, tag,
              'testUsbSubmitTransfer066 transfer success, result = ' + transferParams.buffer.toString());
            hilog.info(domain, tag, 'status = ' + callBackData?.status);
            expect(callBackData?.status == UsbMgr.UsbTransferStatus.TRANSFER_TIMED_OUT).assertEqual(true);
            UsbMgr.closePipe(gPipe);
            hilog.info(domain, tag, 'interrupt testUsbSubmitTransfer066 end');
            done();
          }
          UsbMgr.usbSubmitTransfer(transferParams);
        } catch (error) {
          let err: BusinessError = error as BusinessError;
          hilog.info(domain, tag, 'interrupt error:', err.code);
          UsbMgr.closePipe(gPipe);
          expect(err.code).assertEqual(14400012);
          done();
        }
      })

    /**
     * @tc.number   : SUB_USB_HostManager_Func_6600
     * @tc.name     : testUsbControlTransfer68
     * @tc.desc     : verify function usbControlTransfer
     */
    it("testUsbControlTransfer68", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'usb test_usbControlTransfer68 begin');
        if (!isDeviceConnected) {
          expect(isDeviceConnected).assertFalse();
          done();
        }
        let param: UsbMgr.USBDeviceRequestParams = {
          bmRequestType: 0x80,
          bRequest: UsbMgr.USBControlRequestType.USB_REQUEST_TYPE_STANDARD,
          wValue: (0x01 << 8) | 0x00,
          wIndex: 0x00,
          wLength: 18,
          data: new Uint8Array(18),
        };
        try {
          let devicesList: Array<UsbMgr.USBDevice> = UsbMgr.getDevices();
          if (devicesList.length == 0) {
            hilog.info(domain, tag, 'device list is empty');
          }

          UsbMgr.requestRight(devicesList[0].name);
          hilog.info(domain, tag, `usbControlTransfer name = ${devicesList[0].name}`);
          let devicePipe: UsbMgr.USBDevicePipe = UsbMgr.connectDevice(devicesList[0]);
          let timeout: number | undefined = 30.0;

          hilog.info(domain, tag, `usbControlTransfer device.name = ${devicesList[0].name}`);
          let ret = UsbMgr.usbControlTransfer(devicePipe, param).then((ret: number) => {
            hilog.info(domain, tag, `usbControlTransfer size= ${ret}`);
            expect(ret == 18).assertEqual(true);
          })
          UsbMgr.closePipe(devicePipe);
        } catch (error: BusinessError) {
          hilog.info(0, 'testTag ui', `closeAccessory error `)
          hilog.info(domain, tag, 'usbControlTransfer end');
          let err: BusinessError = error as BusinessError;
          hilog.info(domain, tag, `test_usbControlTransfer68 err.code= ${err.code}`);
        }
        done();
      })

    /**
     * @tc.number   : SUB_USB_HostManager_Func_6700
     * @tc.name     : testUsbControlTransfer69
     * @tc.desc     : verify function usbControlTransfer
     */
    it("testUsbControlTransfer69", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'usb test_usbControlTransfer69 begin');
        if (!isDeviceConnected) {
          expect(isDeviceConnected).assertFalse();
          done();
        }
        let param: UsbMgr.USBDeviceRequestParams = {
          bmRequestType: 0x80,
          bRequest: UsbMgr.USBControlRequestType.USB_REQUEST_TYPE_CLASS,
          wValue: (0x01 << 8) | 0x00,
          wIndex: 0x00,
          wLength: 18,
          data: new Uint8Array(18),
        };
        try {
          let devicesList: Array<UsbMgr.USBDevice> = UsbMgr.getDevices();
          if (devicesList.length == 0) {
            hilog.info(domain, tag, 'device list is empty');
          }

          UsbMgr.requestRight(devicesList[0].name);
          hilog.info(domain, tag, `usbControlTransfer name = ${devicesList[0].name}`);
          let devicePipe: UsbMgr.USBDevicePipe = UsbMgr.connectDevice(devicesList[0]);
          let timeout: number | undefined = 30.0;

          hilog.info(domain, tag, `usbControlTransfer device.name = ${devicesList[0].name}`);
          let ret = UsbMgr.usbControlTransfer(devicePipe, param).then((ret: number) => {
            hilog.info(domain, tag, `usbControlTransfer size= ${ret}`);
            expect(ret == 18).assertEqual(true);
          })
          UsbMgr.closePipe(devicePipe);
        } catch (error: BusinessError) {
          hilog.info(0, 'testTag ui', `closeAccessory error `)
          hilog.info(domain, tag, 'usbControlTransfer end');
          let err: BusinessError = error as BusinessError;
          hilog.info(domain, tag, `test_usbControlTransfer69 err.code= ${err.code}`);
        }
        done();
      })

    /**
     * @tc.number   : SUB_USB_HostManager_Func_6800
     * @tc.name     : testUsbControlTransfer70
     * @tc.desc     : verify function usbControlTransfer
     */
    it("testUsbControlTransfer70", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        hilog.info(domain, tag, 'usb test_usbControlTransfer70 begin');
        if (!isDeviceConnected) {
          expect(isDeviceConnected).assertFalse();
          done();
        }
        let param: UsbMgr.USBDeviceRequestParams = {
          bmRequestType: 0x80,
          bRequest: UsbMgr.USBControlRequestType.USB_REQUEST_TYPE_VENDOR,
          wValue: (0x01 << 8) | 0x00,
          wIndex: 0x00,
          wLength: 18,
          data: new Uint8Array(18),
        };
        try {
          let devicesList: Array<UsbMgr.USBDevice> = UsbMgr.getDevices();
          if (devicesList.length == 0) {
            hilog.info(domain, tag, 'device list is empty');
          }

          UsbMgr.requestRight(devicesList[0].name);
          hilog.info(domain, tag, `usbControlTransfer name = ${devicesList[0].name}`);
          let devicePipe: UsbMgr.USBDevicePipe = UsbMgr.connectDevice(devicesList[0]);
          let timeout: number | undefined = 30.0;

          hilog.info(domain, tag, `usbControlTransfer device.name = ${devicesList[0].name}`);
          let ret = UsbMgr.usbControlTransfer(devicePipe, param).then((ret: number) => {
            hilog.info(domain, tag, `usbControlTransfer size= ${ret}`);
            expect(ret == 18).assertEqual(true);
          })
          UsbMgr.closePipe(devicePipe);
        } catch (error: BusinessError) {
          hilog.info(0, 'testTag ui', `closeAccessory error `)
          hilog.info(domain, tag, 'usbControlTransfer end');
          let err: BusinessError = error as BusinessError;
          hilog.info(domain, tag, `usbControlTransferlnn0 err.code= ${err.code}`);
        }
        done();
      })
  })
}