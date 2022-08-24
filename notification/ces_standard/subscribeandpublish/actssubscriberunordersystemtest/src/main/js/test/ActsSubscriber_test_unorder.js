/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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
import commonEvent from '@ohos.commonEvent'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'

export default function ActsSubscriberTestUnorderSystem() {
  describe('ActsSubscriberTestUnorderSystem', async function (done) {
    let TAG = 'Subscriber_Unorder_System ===>'
    it('Subscriber_Unorder_System_001', 0, async function (done) {
      console.info(TAG + 'Subscriber_Unorder_System_001 START')
      const CommonEventSubscriberInfo = {
        events: [
          commonEvent.Support.COMMON_EVENT_SHUTDOWN,
          commonEvent.Support.COMMON_EVENT_BATTERY_CHANGED,
          commonEvent.Support.COMMON_EVENT_BATTERY_LOW,
          commonEvent.Support.COMMON_EVENT_BATTERY_OKAY,
          commonEvent.Support.COMMON_EVENT_POWER_CONNECTED,
          commonEvent.Support.COMMON_EVENT_POWER_DISCONNECTED,
          commonEvent.Support.COMMON_EVENT_SCREEN_OFF,
          commonEvent.Support.COMMON_EVENT_SCREEN_ON,
          commonEvent.Support.COMMON_EVENT_USER_PRESENT,
          commonEvent.Support.COMMON_EVENT_TIME_TICK,
          commonEvent.Support.COMMON_EVENT_TIME_CHANGED,
          commonEvent.Support.COMMON_EVENT_DATE_CHANGED,
          commonEvent.Support.COMMON_EVENT_TIMEZONE_CHANGED,
          commonEvent.Support.COMMON_EVENT_CLOSE_SYSTEM_DIALOGS,
          commonEvent.Support.COMMON_EVENT_PACKAGE_ADDED,
          commonEvent.Support.COMMON_EVENT_PACKAGE_REPLACED,
          commonEvent.Support.COMMON_EVENT_MY_PACKAGE_REPLACED,
          commonEvent.Support.COMMON_EVENT_PACKAGE_REMOVED,
          commonEvent.Support.COMMON_EVENT_BUNDLE_REMOVED,
          commonEvent.Support.COMMON_EVENT_PACKAGE_FULLY_REMOVED,
          commonEvent.Support.COMMON_EVENT_PACKAGE_CHANGED,
          commonEvent.Support.COMMON_EVENT_PACKAGE_RESTARTED,
          commonEvent.Support.COMMON_EVENT_PACKAGE_DATA_CLEARED,
          commonEvent.Support.COMMON_EVENT_PACKAGES_SUSPENDED,
          commonEvent.Support.COMMON_EVENT_PACKAGES_UNSUSPENDED,
          commonEvent.Support.COMMON_EVENT_MY_PACKAGE_SUSPENDED,
          commonEvent.Support.COMMON_EVENT_MY_PACKAGE_UNSUSPENDED,
          commonEvent.Support.COMMON_EVENT_UID_REMOVED,
          commonEvent.Support.COMMON_EVENT_PACKAGE_FIRST_LAUNCH,
          commonEvent.Support.COMMON_EVENT_PACKAGE_NEEDS_VERIFICATION,
          commonEvent.Support.COMMON_EVENT_PACKAGE_VERIFIED,
          commonEvent.Support.COMMON_EVENT_EXTERNAL_APPLICATIONS_AVAILABLE,
          commonEvent.Support.COMMON_EVENT_EXTERNAL_APPLICATIONS_UNAVAILABLE,
          commonEvent.Support.COMMON_EVENT_CONFIGURATION_CHANGED,
          commonEvent.Support.COMMON_EVENT_LOCALE_CHANGED,
          commonEvent.Support.COMMON_EVENT_MANAGE_PACKAGE_STORAGE,
          commonEvent.Support.COMMON_EVENT_DRIVE_MODE,
          commonEvent.Support.COMMON_EVENT_HOME_MODE,
          commonEvent.Support.COMMON_EVENT_OFFICE_MODE,
          commonEvent.Support.COMMON_EVENT_USER_STARTED,
          commonEvent.Support.COMMON_EVENT_USER_BACKGROUND,
          commonEvent.Support.COMMON_EVENT_USER_FOREGROUND,
          commonEvent.Support.COMMON_EVENT_USER_UNLOCKED,
          commonEvent.Support.COMMON_EVENT_USER_STOPPED,
          commonEvent.Support.COMMON_EVENT_HWID_LOGIN,
          commonEvent.Support.COMMON_EVENT_HWID_LOGOUT,
          commonEvent.Support.COMMON_EVENT_HWID_TOKEN_INVALID,
          commonEvent.Support.COMMON_EVENT_HWID_LOGOFF,
          commonEvent.Support.COMMON_EVENT_WIFI_POWER_STATE,
          commonEvent.Support.COMMON_EVENT_WIFI_CONN_STATE,
          commonEvent.Support.COMMON_EVENT_WIFI_HOTSPOT_STATE,
          commonEvent.Support.COMMON_EVENT_BLUETOOTH_A2DPSOURCE_AVRCP_CONNECT_STATE_UPDATE,
          commonEvent.Support.COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_SDP_RESULT,
          commonEvent.Support.COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_PAIRING_CANCEL,
          commonEvent.Support.COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_CONNECT_REQ,
          commonEvent.Support.COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_CONNECT_REPLY,
          commonEvent.Support.COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_CONNECT_CANCEL,
          commonEvent.Support.COMMON_EVENT_BLUETOOTH_HANDSFREEUNIT_CONNECT_STATE_UPDATE,
          commonEvent.Support.COMMON_EVENT_BLUETOOTH_HANDSFREEUNIT_AUDIO_STATE_UPDATE,
          commonEvent.Support.COMMON_EVENT_BLUETOOTH_HANDSFREEUNIT_AG_COMMON_EVENT,
          commonEvent.Support.COMMON_EVENT_BLUETOOTH_HANDSFREEUNIT_AG_CALL_STATE_UPDATE,
          commonEvent.Support.COMMON_EVENT_BLUETOOTH_HOST_REQ_DISCOVERABLE,
          commonEvent.Support.COMMON_EVENT_NFC_ACTION_ADAPTER_STATE_CHANGED,
          commonEvent.Support.COMMON_EVENT_DISCHARGING,
          commonEvent.Support.COMMON_EVENT_CHARGING,
          commonEvent.Support.COMMON_EVENT_DEVICE_IDLE_MODE_CHANGED,
          commonEvent.Support.COMMON_EVENT_POWER_SAVE_MODE_CHANGED,
          commonEvent.Support.COMMON_EVENT_LOCATION_MODE_STATE_CHANGED,
          commonEvent.Support.COMMON_EVENT_IVI_SLEEP,
          commonEvent.Support.COMMON_EVENT_IVI_PAUSE,
          commonEvent.Support.COMMON_EVENT_IVI_STANDBY,
          commonEvent.Support.COMMON_EVENT_IVI_LASTMODE_SAVE,
          commonEvent.Support.COMMON_EVENT_IVI_VOLTAGE_ABNORMAL,
          commonEvent.Support.COMMON_EVENT_IVI_HIGH_TEMPERATURE,
          commonEvent.Support.COMMON_EVENT_IVI_EXTREME_TEMPERATURE,
          commonEvent.Support.COMMON_EVENT_IVI_TEMPERATURE_ABNORMAL,
          commonEvent.Support.COMMON_EVENT_IVI_VOLTAGE_RECOVERY,
          commonEvent.Support.COMMON_EVENT_IVI_TEMPERATURE_RECOVERY,
          commonEvent.Support.COMMON_EVENT_IVI_ACTIVE,
          commonEvent.Support.COMMON_EVENT_USB_DEVICE_ATTACHED,
          commonEvent.Support.COMMON_EVENT_USB_DEVICE_DETACHED,
          commonEvent.Support.COMMON_EVENT_USB_ACCESSORY_ATTACHED,
          commonEvent.Support.COMMON_EVENT_USB_ACCESSORY_DETACHED,
          commonEvent.Support.COMMON_EVENT_AIRPLANE_MODE_CHANGED,
          commonEvent.Support.COMMON_EVENT_BOOT_COMPLETED,
          commonEvent.Support.COMMON_EVENT_SPLIT_SCREEN,
          commonEvent.Support.COMMON_EVENT_WIFI_P2P_CONN_STATE,
          commonEvent.Support.COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_DISCOVERED,
          commonEvent.Support.COMMON_EVENT_DISK_REMOVED,
          commonEvent.Support.COMMON_EVENT_DISK_UNMOUNTED,
          commonEvent.Support.COMMON_EVENT_DISK_MOUNTED,
          commonEvent.Support.COMMON_EVENT_DISK_BAD_REMOVAL,
          commonEvent.Support.COMMON_EVENT_DISK_UNMOUNTABLE,
          commonEvent.Support.COMMON_EVENT_DISK_EJECT,
          commonEvent.Support.COMMON_EVENT_LOCKED_BOOT_COMPLETED,
          commonEvent.Support.COMMON_EVENT_USER_SWITCHED,
          commonEvent.Support.COMMON_EVENT_USER_STARTING,
          commonEvent.Support.COMMON_EVENT_USER_STOPPING,
          commonEvent.Support.COMMON_EVENT_WIFI_SCAN_FINISHED,
          commonEvent.Support.COMMON_EVENT_WIFI_RSSI_VALUE,
          commonEvent.Support.COMMON_EVENT_WIFI_AP_STA_JOIN,
          commonEvent.Support.COMMON_EVENT_WIFI_AP_STA_LEAVE,
          commonEvent.Support.COMMON_EVENT_WIFI_MPLINK_STATE_CHANGE,
          commonEvent.Support.COMMON_EVENT_WIFI_P2P_STATE_CHANGED,
          commonEvent.Support.COMMON_EVENT_WIFI_P2P_PEERS_STATE_CHANGED,
          commonEvent.Support.COMMON_EVENT_WIFI_P2P_PEERS_DISCOVERY_STATE_CHANGED,
          commonEvent.Support.COMMON_EVENT_WIFI_P2P_CURRENT_DEVICE_STATE_CHANGED,
          commonEvent.Support.COMMON_EVENT_WIFI_P2P_GROUP_STATE_CHANGED,
          commonEvent.Support.COMMON_EVENT_BLUETOOTH_HANDSFREE_AG_CONNECT_STATE_UPDATE,
          commonEvent.Support.COMMON_EVENT_BLUETOOTH_HANDSFREE_AG_CURRENT_DEVICE_UPDATE,
          commonEvent.Support.COMMON_EVENT_BLUETOOTH_HANDSFREE_AG_AUDIO_STATE_UPDATE,
          commonEvent.Support.COMMON_EVENT_BLUETOOTH_A2DPSOURCE_CONNECT_STATE_UPDATE,
          commonEvent.Support.COMMON_EVENT_BLUETOOTH_A2DPSOURCE_CURRENT_DEVICE_UPDATE,
          commonEvent.Support.COMMON_EVENT_BLUETOOTH_A2DPSOURCE_PLAYING_STATE_UPDATE,
          commonEvent.Support.COMMON_EVENT_BLUETOOTH_A2DPSOURCE_CODEC_VALUE_UPDATE,
          commonEvent.Support.COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_CLASS_VALUE_UPDATE,
          commonEvent.Support.COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_ACL_CONNECTED,
          commonEvent.Support.COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_ACL_DISCONNECTED,
          commonEvent.Support.COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_NAME_UPDATE,
          commonEvent.Support.COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_PAIR_STATE,
          commonEvent.Support.COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_BATTERY_VALUE_UPDATE,
          commonEvent.Support.COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_UUID_VALUE,
          commonEvent.Support.COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_PAIRING_REQ,
          commonEvent.Support.COMMON_EVENT_BLUETOOTH_HOST_STATE_UPDATE,
          commonEvent.Support.COMMON_EVENT_BLUETOOTH_HOST_REQ_ENABLE,
          commonEvent.Support.COMMON_EVENT_BLUETOOTH_HOST_REQ_DISABLE,
          commonEvent.Support.COMMON_EVENT_BLUETOOTH_HOST_SCAN_MODE_UPDATE,
          commonEvent.Support.COMMON_EVENT_BLUETOOTH_HOST_DISCOVERY_STARTED,
          commonEvent.Support.COMMON_EVENT_BLUETOOTH_HOST_DISCOVERY_FINISHED,
          commonEvent.Support.COMMON_EVENT_BLUETOOTH_HOST_NAME_UPDATE,
          commonEvent.Support.COMMON_EVENT_BLUETOOTH_A2DPSINK_CONNECT_STATE_UPDATE,
          commonEvent.Support.COMMON_EVENT_BLUETOOTH_A2DPSINK_PLAYING_STATE_UPDATE,
          commonEvent.Support.COMMON_EVENT_BLUETOOTH_A2DPSINK_AUDIO_STATE_UPDATE,
          commonEvent.Support.COMMON_EVENT_NFC_ACTION_RF_FIELD_ON_DETECTED,
          commonEvent.Support.COMMON_EVENT_NFC_ACTION_RF_FIELD_OFF_DETECTED,
          commonEvent.Support.COMMON_EVENT_USER_ADDED,
          commonEvent.Support.COMMON_EVENT_USER_REMOVED,
          commonEvent.Support.COMMON_EVENT_ABILITY_ADDED,
          commonEvent.Support.COMMON_EVENT_ABILITY_REMOVED,
          commonEvent.Support.COMMON_EVENT_ABILITY_UPDATED,
          commonEvent.Support.COMMON_EVENT_VISIBLE_ACCOUNTS_UPDATED,
          commonEvent.Support.COMMON_EVENT_ACCOUNT_DELETED,
          commonEvent.Support.COMMON_EVENT_FOUNDATION_READY,
          commonEvent.Support.COMMON_EVENT_THERMAL_LEVEL_CHANGED,
          commonEvent.Support.COMMON_EVENT_PACKAGE_CACHE_CLEARED,
          commonEvent.Support.COMMON_EVENT_USB_STATE,
          commonEvent.Support.COMMON_EVENT_USB_PORT_CHANGED,
          commonEvent.Support.COMMON_EVENT_VOLUME_REMOVED,
          commonEvent.Support.COMMON_EVENT_VOLUME_UNMOUNTED,
          commonEvent.Support.COMMON_EVENT_VOLUME_MOUNTED,
          commonEvent.Support.COMMON_EVENT_VOLUME_BAD_REMOVAL,
          commonEvent.Support.COMMON_EVENT_VOLUME_EJECT,
          commonEvent.Support.COMMON_EVENT_SLOT_CHANGE,
          commonEvent.Support.COMMON_EVENT_SPN_INFO_CHANGED
        ]
      }

      let CommonEventSubscriber = await commonEvent.createSubscriber(CommonEventSubscriberInfo)
      if (CommonEventSubscriber == undefined) {
        console.info(TAG + ': createSubscriber failed! Err.Info ===> ' + JSON.stringify(CommonEventSubscriber))
        expect(false).assertTrue()
        done()
      } else {
        console.info(TAG + ': createSubscriber successed! Subscriber.Info ===> ' + JSON.stringify(CommonEventSubscriber))
        expect(true).assertTrue()
      }

      await commonEvent.subscribe(CommonEventSubscriber, (err, CommonEventData) => {
        if (err.code) {
          console.info(TAG + ': subscribe failed! Err.Info ===> ' + JSON.stringify(err.code))
          expect(false).assertTrue()
          done()
        } else {
          console.info(TAG + ': subscribe successed! CommonEventData.Info ===> ' + JSON.stringify(CommonEventData))
          expect(true).assertTrue()
        }
      })

      for (let i = 0; i < CommonEventSubscriberInfo.events.length; i++) {
        await commonEvent.publish(CommonEventSubscriberInfo.events[i], (err) => {
          if (err.code) {
            console.info(TAG + ': publish failed! event.Info ===> ' + JSON.stringify(CommonEventSubscriberInfo.events[i]))
            expect(false).assertTrue()
            done()
          } else {
            console.info(TAG + ': publish successed! event.Info ===> ' + JSON.stringify(CommonEventSubscriberInfo.events[i]))
            expect(true).assertTrue()
            done()
          }
        })
      }
    })
  })
}
