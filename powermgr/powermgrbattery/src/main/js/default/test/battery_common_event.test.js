/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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
import commonEvent from '@ohos.commonEvent';

describe('appInfoTest', function () {
    console.log("*************Battery commonEvent Test Begin*************");

    /**
     * @tc.number BatteryCommonEventTest_001
     * @tc.name subscribe battery changed common event
     * @tc.desc battery acquisition kit
     */
    it('BatteryCommonEventTest_001', 0, function (done) {
        createBatteryChangedSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_002
     * @tc.name subscribe battery okay common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_002', 0, function (done) {
        createBatteryOkaySubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_003
     * @tc.name subscribe battery low common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_003', 0, function (done) {
        createBatteryLowSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_004
     * @tc.name subscribe power connected common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_004', 0, function (done) {
        createBatteryPowerConnectedSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_005
     * @tc.name subscribe power disconnected common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_005', 0, function (done) {
        createBatteryPowerDisconnectedSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_006
     * @tc.name subscribe battery charging common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_006', 0, function (done) {
        createBatteryChargingSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_007
     * @tc.name subscribe battery discharging common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_007', 0, function (done) {
        createBatteryDischargingSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_008
     * @tc.name subscribe boot completed common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_008', 0, function (done) {
        createBootCompletedSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_009
     * @tc.name subscribe locked boot completed common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_009', 0, function (done) {
        createLockedBootCompletedSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_010
     * @tc.name subscribe shutdown common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_010', 0, function (done) {
        createShutdownSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_011
     * @tc.name subscribe screen on common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_011', 0, function (done) {
        createScreenOnSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_012
     * @tc.name subscribe user present common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_012', 0, function (done) {
        createUserPresentSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_013
     * @tc.name subscribe time tick common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_013', 0, function (done) {
        createTimeTickSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_014
     * @tc.name subscribe screen off common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_014', 0, function (done) {
        createScreenOffSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_015
     * @tc.name subscribe time changed common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_015', 0, function (done) {
        createTimeChangedSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_016
     * @tc.name subscribe date changed common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_016', 0, function (done) {
        createDateChangedSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_017
     * @tc.name subscribe timezone changed common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_017', 0, function (done) {
        createTimezoneChangedSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_018
     * @tc.name subscribe close system dialogs common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_018', 0, function (done) {
        createCloseSystemDialogsSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_019
     * @tc.name subscribe package added common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_019', 0, function (done) {
        createPackageAddedSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_020
     * @tc.name subscribe package replaced common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_020', 0, function (done) {
        createPackageReplacedSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_021
     * @tc.name subscribe my package replaced common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_021', 0, function (done) {
        createMyPackageReplacedSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_022
     * @tc.name subscribe package removed common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_022', 0, function (done) {
        createPackageRemovedSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_023
     * @tc.name subscribe bundle removed common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_023', 0, function (done) {
        createBundleRemovedSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_024
     * @tc.name subscribe PackageFullyRemoved common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_024', 0, function (done) {
        createPackageFullyRemovedSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_025
     * @tc.name subscribe PackageChanged common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_025', 0, function (done) {
        createPackageChangedSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_026
     * @tc.name subscribe PackageRestarted common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_026', 0, function (done) {
        createPackageRestartedSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_027
     * @tc.name subscribe PackageDataCleared common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_027', 0, function (done) {
        createPackageDataClearedSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_028
     * @tc.name subscribe PackageSuspended common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_028', 0, function (done) {
        createPackageSuspendedSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_029
     * @tc.name subscribe PackagesUnsuspended common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_029', 0, function (done) {
        createPackagesUnsuspendedSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_030
     * @tc.name subscribe MyPackageSuspended common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_030', 0, function (done) {
        createMyPackageSuspendedSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_031
     * @tc.name subscribe MyPackageUnsuspended common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_031', 0, function (done) {
        createMyPackageUnsuspendedSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_032
     * @tc.name subscribe MyPackageFirstLaunch common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_032', 0, function (done) {
        createMyPackageFirstLaunchSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_033
     * @tc.name subscribe MyPackageNeedsVerification common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_033', 0, function (done) {
        createMyPackageNeedsVerificationSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_034
     * @tc.name subscribe ExternalApplicationsAvailable common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_034', 0, function (done) {
        createExternalApplicationsAvailableSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_035
     * @tc.name subscribe ExternalApplicationsUnAvailable common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_035', 0, function (done) {
        createExternalApplicationsUnAvailableSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_036
     * @tc.name subscribe ConfigurationChanged common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_036', 0, function (done) {
        createConfigurationChangedSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_037
     * @tc.name subscribe LocateChanged common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_037', 0, function (done) {
        createLocateChangedSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_038
     * @tc.name subscribe ManagePackageStorage common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_038', 0, function (done) {
        createManagePackageStorageSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_039
     * @tc.name subscribe DriveMode common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_039', 0, function (done) {
        createDriveModeSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_040
     * @tc.name subscribe HomeMode common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_040', 0, function (done) {
        createHomeModeSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_041
     * @tc.name subscribe OfficeMode common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_041', 0, function (done) {
        createOfficeModeSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_042
     * @tc.name subscribe UserStarted common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_042', 0, function (done) {
        createUserStartedSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_043
     * @tc.name subscribe UserBackground common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_043', 0, function (done) {
        createUserBackgroundSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_044
     * @tc.name subscribe UserForground common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_044', 0, function (done) {
        createUserForgroundSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_045
     * @tc.name subscribe UserSwitched common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_045', 0, function (done) {
        createUserSwitchedSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_046
     * @tc.name subscribe UserStarting common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_046', 0, function (done) {
        createUserStartingSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_047
     * @tc.name subscribe UserUnlocked common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_047', 0, function (done) {
        createUserUnlockedSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_048
     * @tc.name subscribe UserStopping common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_048', 0, function (done) {
        createUserStoppingSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_049
     * @tc.name subscribe UserStopped common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_049', 0, function (done) {
        createUserStoppedSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_050
     * @tc.name subscribe HwidLogin common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_050', 0, function (done) {
        createHwidLoginSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_051
     * @tc.name subscribe HwidLogout common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_051', 0, function (done) {
        createHwidLogoutSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_052
     * @tc.name subscribe HwidTokenInvalid common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_052', 0, function (done) {
        createHwidTokenInvalidSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_053
     * @tc.name subscribe HwidLogOff common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_053', 0, function (done) {
        createHwidLogOffSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_054
     * @tc.name subscribe WifiPowerState common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_054', 0, function (done) {
        createWifiPowerStateSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_055
     * @tc.name subscribe WifiScanFinished common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_055', 0, function (done) {
        createWifiScanFinishedSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_056
     * @tc.name subscribe WifiRssiValue common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_056', 0, function (done) {
        createWifiRssiValueSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_057
     * @tc.name subscribe WifiConnState common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_057', 0, function (done) {
        createWifiConnStateSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_058
     * @tc.name subscribe WifiHostpotState common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_058', 0, function (done) {
        createWifiHostpotStateSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_059
     * @tc.name subscribe WifiApStaJoin common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_059', 0, function (done) {
        createWifiApStaJoinSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_060
     * @tc.name subscribe WifiApStaLeave common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_060', 0, function (done) {
        createWifiApStaLeaveSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_061
     * @tc.name subscribe WifiMplinkStateChange common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_061', 0, function (done) {
        createWifiMplinkStateChangeSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_062
     * @tc.name subscribe WifiP2PConnState common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_062', 0, function (done) {
        createWifiP2PConnStateSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_063
     * @tc.name subscribe WifiP2PStateChanged common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_063', 0, function (done) {
        createWifiP2PStateChangedSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_064
     * @tc.name subscribe WifiP2PPeersStateChanged common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_064', 0, function (done) {
        createWifiP2PPeersStateChangedSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_065
     * @tc.name subscribe WifiP2PPeersDiscoveryStateChanged common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_065', 0, function (done) {
        createWifiP2PPeersDiscoveryStateChangedSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_066
     * @tc.name subscribe WifiP2PCurrentDeviceStateChanged common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_066', 0, function (done) {
        createWifiP2PCurrentDeviceStateChangedSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_067
     * @tc.name subscribe WifiP2PGroupStateChanged common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_067', 0, function (done) {
        createWifiP2PGroupStateChangedSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_068
     * @tc.name subscribe BluetoothHandsfreeAgConntectStateUpdate common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_068', 0, function (done) {
        createBluetoothHandsfreeAgConntectStateUpdateSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_069
     * @tc.name subscribe BluetoothHandsfreeAgConntectDeviceUpdate common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_069', 0, function (done) {
        createBluetoothHandsfreeAgConntectDeviceUpdateSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_070
     * @tc.name subscribe BluetoothHandsfreeAgAudioStateUpdate common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_070', 0, function (done) {
        createBluetoothHandsfreeAgAudioStateUpdateSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_071
     * @tc.name subscribe BluetoothA2DPsourceConnectStateUpdate common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_071', 0, function (done) {
        createBluetoothA2DPsourceConnectStateUpdateSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_072
     * @tc.name subscribe BluetoothA2DPsourceCurrentDeviceUpdate common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_072', 0, function (done) {
        createBluetoothA2DPsourceCurrentDeviceUpdateSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_073
     * @tc.name subscribe BluetoothA2DPsourcePlayingStateUpdate common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_073', 0, function (done) {
        createBluetoothA2DPsourcePlayingStateUpdateSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_074
     * @tc.name subscribe BluetoothA2DPsourceAvrcpConntectStateUpdate common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_074', 0, function (done) {
        createBluetoothA2DPsourceAvrcpConntectStateUpdateSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_075
     * @tc.name subscribe BluetoothA2DPsourceCodecValueUpdate common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_075', 0, function (done) {
        createBluetoothA2DPsourceCodecValueUpdateSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_076
     * @tc.name subscribe BluetoothRemotedeviceDiscovered common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_076', 0, function (done) {
        createBluetoothRemotedeviceDiscoveredSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_077
     * @tc.name subscribe BluetoothRemotedeviceClassValueUpdate common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_077', 0, function (done) {
        createBluetoothRemotedeviceClassValueUpdateSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_078
     * @tc.name subscribe BluetoothRemotedeviceAclConnected common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_078', 0, function (done) {
        createBluetoothRemotedeviceAclConnectedSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_079
     * @tc.name subscribe BluetoothRemotedeviceAclDisconnected common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_079', 0, function (done) {
        createBluetoothRemotedeviceAclDisconnectedSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_080
     * @tc.name subscribe BluetoothRemotedeviceNameUpdate common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_080', 0, function (done) {
        createBluetoothRemotedeviceNameUpdateSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_081
     * @tc.name subscribe BluetoothRemotedevicePairState common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_081', 0, function (done) {
        createBluetoothRemotedevicePairStateSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_082
     * @tc.name subscribe BluetoothRemotedeviceBateryValueUpdate common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_082', 0, function (done) {
        createBluetoothRemotedeviceBateryValueUpdateSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_083
     * @tc.name subscribe BluetoothRemotedeviceSdpResult common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_083', 0, function (done) {
        createBluetoothRemotedeviceSdpResultSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_084
     * @tc.name subscribe BluetoothRemotedeviceUuidValue common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_084', 0, function (done) {
        createBluetoothRemotedeviceUuidValueSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_085
     * @tc.name subscribe BluetoothPairingReq common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_085', 0, function (done) {
        createBluetoothPairingReqSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_086
     * @tc.name subscribe BluetoothRemotedevicePairingCancel common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_086', 0, function (done) {
        createBluetoothRemotedevicePairingCancelSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_087
     * @tc.name subscribe BluetoothRemotedeviceConntectReq common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_087', 0, function (done) {
        createBluetoothRemotedeviceConntectReqSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_088
     * @tc.name subscribe BluetoothRemotedeviceConntectReply common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_088', 0, function (done) {
        createBluetoothRemotedeviceConntectReplySubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_089
     * @tc.name subscribe BluetoothRemotedeviceConntectCancel common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_089', 0, function (done) {
        createBluetoothRemotedeviceConntectCancelSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_090
     * @tc.name subscribe BluetoothHandsfreeunitConntectStateUpdate common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_090', 0, function (done) {
        createBluetoothHandsfreeunitConntectStateUpdateSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_091
     * @tc.name subscribe BluetoothHandsfreeunitAudioStateUpdate common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_091', 0, function (done) {
        createBluetoothHandsfreeunitAudioStateUpdateSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_092
     * @tc.name subscribe BluetoothHandsfreeunitAgCommonEvent common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_092', 0, function (done) {
        createBluetoothHandsfreeunitAgCommonEventSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_093
     * @tc.name subscribe BluetoothHandsfreeunitAgCallStateUpdate common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_093', 0, function (done) {
        createBluetoothHandsfreeunitAgCallStateUpdateSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_094
     * @tc.name subscribe BluetoothHostStateUpdate common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_094', 0, function (done) {
        createBluetoothHostStateUpdateSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_095
     * @tc.name subscribe BluetoothHostReqDiscoverable common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_095', 0, function (done) {
        createBluetoothHostReqDiscoverableSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_096
     * @tc.name subscribe CommonEventHostReqEnable common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_096', 0, function (done) {
        createCommonEventHostReqEnableSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_097
     * @tc.name subscribe CommonEventHostReqDisable common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_097', 0, function (done) {
        createCommonEventHostReqDisableSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_098
     * @tc.name subscribe CommonEventHostScanModeUpdate common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_098', 0, function (done) {
        createCommonEventHostScanModeUpdateSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_099
     * @tc.name subscribe CommonEventHostDiscovetyStarted common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_099', 0, function (done) {
        createCommonEventHostDiscovetyStartedSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_100
     * @tc.name subscribe CommonEventHostDiscovetyFinished common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_100', 0, function (done) {
        createCommonEventHostDiscovetyFinishedSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_101
     * @tc.name subscribe CommonEventHostNameUpdate common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_101', 0, function (done) {
        createCommonEventHostNameUpdateSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_102
     * @tc.name subscribe CommonEventHostStateUpdate common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_102', 0, function (done) {
        createCommonEventHostStateUpdateSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_103
     * @tc.name subscribe CommonEventA2DPsinkPlayingStateUpdate common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_103', 0, function (done) {
        createCommonEventA2DPsinkPlayingStateUpdateSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_104
     * @tc.name subscribe CommonEventA2DPsinkAudioStateUpdate common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_104', 0, function (done) {
        createCommonEventA2DPsinkAudioStateUpdateSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_105
     * @tc.name subscribe CommonEventNFCActionAdapterStateChanged common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_105', 0, function (done) {
        createCommonEventNFCActionAdapterStateChangedSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_106
     * @tc.name subscribe CommonEventNFCActionRFFieldOnDetected common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_106', 0, function (done) {
        createCommonEventNFCActionRFFieldOnDetectedSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_107
     * @tc.name subscribe CommonEventNFCActionRFFieldOffDetected common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_107', 0, function (done) {
        createCommonEventNFCActionRFFieldOffDetectedSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_108
     * @tc.name subscribe CommonEventDeviceIdleModeChanged common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_108', 0, function (done) {
        createCommonEventDeviceIdleModeChangedSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_109
     * @tc.name subscribe CommonEventPowerSaveModeChanged common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_109', 0, function (done) {
        createCommonEventPowerSaveModeChangedSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_110
     * @tc.name subscribe CommonEventUserAdded common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_110', 0, function (done) {
        createCommonEventUserAddedSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_111
     * @tc.name subscribe CommonEventUserRemoved common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_111', 0, function (done) {
        createCommonEventUserRemovedSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_112
     * @tc.name subscribe CommonEventAbilityAdded common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_112', 0, function (done) {
        createCommonEventAbilityAddedSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_113
     * @tc.name subscribe CommonEventAbilityRemoved common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_113', 0, function (done) {
        createCommonEventAbilityRemovedSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_114
     * @tc.name subscribe CommonEventAbilityUpdated common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_114', 0, function (done) {
        createCommonEventAbilityUpdatedSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_115
     * @tc.name subscribe CommonEventLocationModeStateChanged common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_115', 0, function (done) {
        createCommonEventLocationModeStateChangedSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_116
     * @tc.name subscribe CommonEventIVISleep common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_116', 0, function (done) {
        createCommonEventIVISleepSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_117
     * @tc.name subscribe CommonEventIVIPause common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_117', 0, function (done) {
        createCommonEventIVIPauseSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_118
     * @tc.name subscribe CommonEventIVIStandBy common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_118', 0, function (done) {
        createCommonEventIVIStandBySubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_119
     * @tc.name subscribe CommonEventIVILastmodeSave common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_119', 0, function (done) {
        createCommonEventIVILastmodeSaveSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_120
     * @tc.name subscribe CommonEventIVIVoltageAbnormal common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_120', 0, function (done) {
        createCommonEventIVIVoltageAbnormalSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_121
     * @tc.name subscribe CommonEventIVIHightTemperature common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_121', 0, function (done) {
        createCommonEventIVIHightTemperatureSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_122
     * @tc.name subscribe CommonEventIVIExtremeTemperature common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_122', 0, function (done) {
        createCommonEventIVIExtremeTemperatureSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_123
     * @tc.name subscribe CommonEventIVITemperatureAbnormal common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_123', 0, function (done) {
        createCommonEventIVITemperatureAbnormalSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_124
     * @tc.name subscribe CommonEventIVIVoltageRecovery common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_124', 0, function (done) {
        createCommonEventIVIVoltageRecoverySubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_125
     * @tc.name subscribe CommonEventIVITempratureRecovery common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_125', 0, function (done) {
        createCommonEventIVITempratureRecoverySubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_126
     * @tc.name subscribe CommonEventIVIActive common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_126', 0, function (done) {
        createCommonEventIVIActiveSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_127
     * @tc.name subscribe CommonEventUSBDevidceAttached common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_127', 0, function (done) {
        createCommonEventUSBDevidceAttachedSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_128
     * @tc.name subscribe CommonEventUSBDevidceDetached common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_128', 0, function (done) {
        createCommonEventUSBDevidceDetachedSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_129
     * @tc.name subscribe CommonEventUSBAccessoryAttached common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_129', 0, function (done) {
        createCommonEventUSBAccessoryAttachedSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_130
     * @tc.name subscribe CommonEventUSBAccessoryDetached common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_130', 0, function (done) {
        createCommonEventUSBAccessoryDetachedSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_131
     * @tc.name subscribe CommonEventDickRemoved common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_131', 0, function (done) {
        createCommonEventDickRemovedSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_132
     * @tc.name subscribe CommonEventDickUnmounted common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_132', 0, function (done) {
        createCommonEventDickUnmountedSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_133
     * @tc.name subscribe CommonEventDickMounted common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_133', 0, function (done) {
        createCommonEventDickMountedSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_134
     * @tc.name subscribe CommonEventDickNadRemoval common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_134', 0, function (done) {
        createCommonEventDickNadRemovalSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_135
     * @tc.name subscribe CommonEventDickUnmoutable common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_135', 0, function (done) {
        createCommonEventDickUnmoutableSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_136
     * @tc.name subscribe CommonEventDickEject common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_136', 0, function (done) {
        createCommonEventDickEjectSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_137
     * @tc.name subscribe CommonEventVisibleAccountsUpdated common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_137', 0, function (done) {
        createCommonEventVisibleAccountsUpdatedSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_138
     * @tc.name subscribe CommonEventAccountDeleted common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_138', 0, function (done) {
        createCommonEventAccountDeletedSubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_139
     * @tc.name subscribe CommonEventFoundationReady common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_139', 0, function (done) {
        createCommonEventFoundationReadySubscriber();
        done();
    })

    /**
     * @tc.number BatteryCommonEventTest_140
     * @tc.name subscribe CommonEventAirplaneModeChanged common event
     * @tc.desc Battery acquisition kit
     */
    it('BatteryCommonEventTest_140', 0, function (done) {
        createCommonEventAirplaneModeChangedSubscriber();
        done();
    })

    console.log("*************Battery commonEvent Test End*************");
})

function createCommonEventAirplaneModeChangedSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_AIRPLANE_MODE_CHANGED],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createCommonEventAirplaneModeChangedSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Common_Event_Airplane_Mode_Changed begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}


function createCommonEventFoundationReadySubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_FOUNDATION_READY],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createCommonEventFoundationReadySubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Common_Event_Foundation_Ready begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createCommonEventAccountDeletedSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_ACCOUNT_DELETED],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createCommonEventAccountDeletedSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Common_Event_AccountDeleted begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createCommonEventVisibleAccountsUpdatedSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_VISIBLE_ACCOUNTS_UPDATED],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createCommonEventVisibleAccountsUpdatedSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Common_Event_Visible_Accounts_Updated begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createCommonEventDickEjectSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_DISK_EJECT],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createCommonEventDickEjectSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Common_Event_Dick_Eject begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createCommonEventDickUnmoutableSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_DISK_UNMOUNTABLE],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createCommonEventDickUnmoutableSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Common_Event_Dick_Unmountable begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createCommonEventDickNadRemovalSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_DISK_BAD_REMOVAL],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createCommonEventDickNadRemovalSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Common_Event_Dick_Nad_Removal begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createCommonEventDickMountedSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_DISK_MOUNTED],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createCommonEventDickMountedSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Common_Event_Dick_Mounted begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createCommonEventDickUnmountedSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_DISK_UNMOUNTED],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createCommonEventDickUnmountedSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Common_Event_Dick_Unmounted begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createCommonEventDickRemovedSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_DISK_REMOVED],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createCommonEventDickRemovedSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Common_Event_Dick_Removed begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createCommonEventUSBAccessoryDetachedSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_USB_ACCESSORY_DETACHED],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createCommonEventUSBAccessoryDetachedSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Common_Event_USB_Accessory_Detached begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createCommonEventUSBAccessoryAttachedSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_USB_ACCESSORY_ATTACHED],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createCommonEventUSBAccessoryAttachedSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Common_Event_USB_Accessory_Attached begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createCommonEventUSBDevidceDetachedSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_USB_DEVICE_DETACHED],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createCommonEventUSBDevidceDetachedSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Common_Event_USB_Devidce_Detached begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createCommonEventUSBDevidceAttachedSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_USB_DEVICE_ATTACHED],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createCommonEventUSBDevidceAttachedSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Common_Event_USB_Devidce_Attached begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createCommonEventIVIActiveSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_IVI_ACTIVE],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createCommonEventIVIActiveSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Common_Event_IVI_Active begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createCommonEventIVITempratureRecoverySubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_IVI_TEMPERATURE_RECOVERY],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createCommonEventIVITempratureRecoverySubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Common_Event_IVI_Temprature_Recovery begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createCommonEventIVIVoltageRecoverySubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_IVI_VOLTAGE_RECOVERY],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createCommonEventIVIVoltageRecoverySubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Common_Event_IVI_Voltage_Recovery begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createCommonEventIVITemperatureAbnormalSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_IVI_TEMPERATURE_ABNORMAL],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createCommonEventIVITemperatureAbnormalSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Common_Event_IVI_Temperature_Abnormal begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createCommonEventIVIExtremeTemperatureSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_IVI_EXTREME_TEMPERATURE],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createCommonEventIVIExtremeTemperatureSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Common_Event_IVI_Extreme_Temperature begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createCommonEventIVIHightTemperatureSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_IVI_HIGH_TEMPERATURE],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createCommonEventIVIHightTemperatureSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Common_Event_IVI_Hight_Temperature begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createCommonEventIVIVoltageAbnormalSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_IVI_VOLTAGE_ABNORMAL],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createCommonEventIVIVoltageAbnormalSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Common_Event_Voltage_Abnormal begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createCommonEventIVILastmodeSaveSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_IVI_LASTMODE_SAVE],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createCommonEventIVILastmodeSaveSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Common_Event_Last_modeSave begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createCommonEventIVIStandBySubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_IVI_STANDBY],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createCommonEventIVIStandBySubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Common_Event_IVI_StandBy begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createCommonEventIVIPauseSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_IVI_PAUSE],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createCommonEventIVIPauseSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Common_Event_IVI_Pause begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createCommonEventIVISleepSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_IVI_SLEEP],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createCommonEventIVISleepSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Common_Event_IVI_Sleep begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createCommonEventLocationModeStateChangedSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_LOCATION_MODE_STATE_CHANGED],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createCommonEventLocationModeStateChangedSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Common_Event_Location_Mode_State_Changed begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createCommonEventAbilityUpdatedSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_ABILITY_UPDATED],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createCommonEventAbilityUpdatedSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Common_Event_Ability_Updated begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createCommonEventAbilityRemovedSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_ABILITY_REMOVED],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createCommonEventAbilityRemovedSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Common_Event_Ability_Removed begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createCommonEventAbilityAddedSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_ABILITY_ADDED],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createCommonEventAbilityAddedSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Common_Event_Ability_Added begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createCommonEventUserRemovedSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_USER_REMOVED],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createCommonEventUserRemovedSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Common_Event_User_Removed begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createCommonEventUserAddedSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_USER_ADDED],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createCommonEventUserAddedSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Common_Event_User_Added begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createCommonEventPowerSaveModeChangedSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_POWER_SAVE_MODE_CHANGED],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createCommonEventPowerSaveModeChangedSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Common_Event_Power_Save_Mode_Changed begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createCommonEventDeviceIdleModeChangedSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_DEVICE_IDLE_MODE_CHANGED],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createCommonEventDeviceIdleModeChangedSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Common_Event_DeviceIdle_Mode_Changed begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createCommonEventNFCActionRFFieldOffDetectedSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_NFC_ACTION_RF_FIELD_OFF_DETECTED],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createCommonEventNFCActionRFFieldOffDetectedSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Common_Event_NFC_Action_RF_Field_Off_Detected begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createCommonEventNFCActionRFFieldOnDetectedSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_NFC_ACTION_RF_FIELD_ON_DETECTED],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createCommonEventNFCActionRFFieldOnDetectedSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Common_Event_NFC_Action_RF_Field_On_Detected begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createCommonEventNFCActionAdapterStateChangedSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_NFC_ACTION_ADAPTER_STATE_CHANGED],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createCommonEventNFCActionAdapterStateChangedSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Common_Event_NFCA_ction_Adapter_State_Changed begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createCommonEventA2DPsinkAudioStateUpdateSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_BLUETOOTH_A2DPSINK_AUDIO_STATE_UPDATE],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createCommonEventA2DPsinkAudioStateUpdateSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Common_Event_A2DPsink_Audio_State_Update begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createCommonEventA2DPsinkPlayingStateUpdateSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_BLUETOOTH_A2DPSINK_PLAYING_STATE_UPDATE],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createCommonEventA2DPsinkPlayingStateUpdateSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Common_Event_A2DPsink_Playing_State_Update begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createCommonEventHostStateUpdateSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_BLUETOOTH_A2DPSINK_CONNECT_STATE_UPDATE],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createCommonEventHostStateUpdateSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Common_Event_Host_State_Update begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createCommonEventHostNameUpdateSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_BLUETOOTH_HOST_NAME_UPDATE],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createCommonEventHostNameUpdateSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Common_Event_Host_Name_Update begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createCommonEventHostDiscovetyFinishedSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_BLUETOOTH_HOST_DISCOVERY_FINISHED],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createCommonEventHostDiscovetyFinishedSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Common_Event_HostDiscovery_Finished begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createCommonEventHostDiscovetyStartedSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_BLUETOOTH_HOST_DISCOVERY_STARTED],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createCommonEventHostDiscovetyStartedSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Common_Event_HostDiscovery_Started begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createCommonEventHostScanModeUpdateSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_BLUETOOTH_HOST_SCAN_MODE_UPDATE],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createCommonEventHostScanModeUpdateSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Common_Event_Host_Scan_Mode_Update begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createCommonEventHostReqDisableSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_BLUETOOTH_HOST_REQ_DISABLE],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createCommonEventHostReqDisableSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Common_Event_Host_Req_Disable begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createCommonEventHostReqEnableSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_BLUETOOTH_HOST_REQ_ENABLE],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createCommonEventHostReqEnableSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Common_Event_Host_Req_Enable begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createBluetoothHostReqDiscoverableSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_BLUETOOTH_HOST_REQ_DISCOVERABLE],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createBluetoothHostReqDiscoverableSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Bluetooth_Host_Req_Discoverable begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createBluetoothHostStateUpdateSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_BLUETOOTH_HOST_STATE_UPDATE],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createBluetoothHostStateUpdateSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Bluetooth_HostState_State_Update begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createBluetoothHandsfreeunitAgCallStateUpdateSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_BLUETOOTH_HANDSFREEUNIT_AG_CALL_STATE_UPDATE],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createBluetoothHandsfreeunitAgCallStateUpdateSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Bluetooth_Handsfreeunit_Ag_CallStateUpdate begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createBluetoothHandsfreeunitAgCommonEventSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_BLUETOOTH_HANDSFREEUNIT_AG_COMMON_EVENT],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createBluetoothHandsfreeunitAgCommonEventSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Bluetooth_Handsfreeunit_Ag_Common_Event begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createBluetoothHandsfreeunitAudioStateUpdateSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_BLUETOOTH_HANDSFREEUNIT_AUDIO_STATE_UPDATE],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createBluetoothHandsfreeunitAudioStateUpdateSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Bluetooth_Handsfreeunit_Audio_State_Update begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createBluetoothHandsfreeunitConntectStateUpdateSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_BLUETOOTH_HANDSFREEUNIT_CONNECT_STATE_UPDATE],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createBluetoothHandsfreeunitConntectStateUpdateSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Bluetooth_Handsfreeunit_Conntect_State_Update begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createBluetoothRemotedeviceConntectCancelSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_CONNECT_CANCEL],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createBluetoothRemotedeviceConntectCancelSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Bluetooth_Remotedevice_Conntect_Cancel begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createBluetoothRemotedeviceConntectReplySubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_CONNECT_REPLY],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createBluetoothRemotedeviceConntectReplySubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Bluetooth_Remotedevice_Conntect_Reply begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createBluetoothRemotedeviceConntectReqSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_CONNECT_REQ],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createBluetoothRemotedeviceConntectReqSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Bluetooth_Remotedevice_ConntectReq begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createBluetoothRemotedevicePairingCancelSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_PAIRING_CANCEL],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createBluetoothRemotedevicePairingCancelSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Bluetooth_Remotedevice_Pairing_Cancel begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createBluetoothPairingReqSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_PAIRING_REQ],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createBluetoothPairingReqSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Bluetooth_Pairing_Req begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createBluetoothRemotedeviceUuidValueSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_UUID_VALUE],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createBluetoothRemotedeviceUuidValueSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Bluetooth_Remotedevice_Uuid_Value begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createBluetoothRemotedeviceSdpResultSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_SDP_RESULT],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createBluetoothRemotedeviceSdpResultSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Bluetooth_Remote_device_Sdp_Result begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createBluetoothRemotedeviceBateryValueUpdateSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_BATTERY_VALUE_UPDATE],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createBluetoothRemotedeviceBateryValueUpdateSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Bluetooth_Batery_Value_Update begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createBluetoothRemotedevicePairStateSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_PAIR_STATE],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createBluetoothRemotedevicePairStateSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Bluetooth_Remotedevice_Pair_State begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createBluetoothRemotedeviceNameUpdateSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_NAME_UPDATE],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createBluetoothRemotedeviceNameUpdateSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Bluetooth_Remotedevice_Name_Update begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createBluetoothRemotedeviceAclDisconnectedSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_ACL_DISCONNECTED],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createBluetoothRemotedeviceAclDisconnectedSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Bluetooth_Remotedevice_Scl_Disconntected begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createBluetoothRemotedeviceAclConnectedSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_ACL_CONNECTED],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createBluetoothRemotedeviceAclConnectedSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Bluetooth_Remotedevice_Scl_Conntected begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createBluetoothRemotedeviceClassValueUpdateSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_CLASS_VALUE_UPDATE],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createBluetoothRemotedeviceClassValueUpdateSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Bluetooth_Remotedevice_Class_Value_Update begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createBluetoothRemotedeviceDiscoveredSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_BLUETOOTH_REMOTEDEVICE_DISCOVERED],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createBluetoothRemotedeviceDiscoveredSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Bluetooth_Remotedevice_Discovered begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createBluetoothA2DPsourceCodecValueUpdateSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_BLUETOOTH_A2DPSOURCE_CODEC_VALUE_UPDATE],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createBluetoothA2DPsourceCodecValueUpdateSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Bluetooth_A2DPsource_Codec_Value_Update begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createBluetoothA2DPsourceAvrcpConntectStateUpdateSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_BLUETOOTH_A2DPSOURCE_AVRCP_CONNECT_STATE_UPDATE],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createBluetoothA2DPsourceAvrcpConntectStateUpdateSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Bluetooth_A2DPsource_Avrcp_Connect_State_Update begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createBluetoothA2DPsourcePlayingStateUpdateSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_BLUETOOTH_A2DPSOURCE_PLAYING_STATE_UPDATE],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createBluetoothA2DPsourcePlayingStateUpdateSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Bluetooth_A2DPsource_Playing_State_Update begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createBluetoothA2DPsourceCurrentDeviceUpdateSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_BLUETOOTH_A2DPSOURCE_CURRENT_DEVICE_UPDATE],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createBluetoothA2DPsourceCurrentDeviceUpdateSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Bluetooth_A2DPsource_Connect_Device_Update begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createBluetoothA2DPsourceConnectStateUpdateSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_BLUETOOTH_A2DPSOURCE_CONNECT_STATE_UPDATE],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createBluetoothA2DPsourceConnectStateUpdateSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Bluetooth_A2DPsource_Connect_State_Update begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createBluetoothHandsfreeAgAudioStateUpdateSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_BLUETOOTH_HANDSFREE_AG_AUDIO_STATE_UPDATE],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createBluetoothHandsfreeAgAudioStateUpdateSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Bluetooth_Hands_free_Ag_Audio_State_Update begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createBluetoothHandsfreeAgConntectDeviceUpdateSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_BLUETOOTH_HANDSFREE_AG_CURRENT_DEVICE_UPDATE],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createBluetoothHandsfreeAgConntectDeviceUpdateSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Bluetooth_Hands_free_Ag_Conntect_Device_Update begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createBluetoothHandsfreeAgConntectStateUpdateSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_BLUETOOTH_HANDSFREE_AG_CONNECT_STATE_UPDATE],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createBluetoothHandsfreeAgConntectStateUpdateSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Bluetooth_Hands_free_Ag_Conntect_State_Update begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createWifiP2PGroupStateChangedSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_WIFI_P2P_GROUP_STATE_CHANGED],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createWifiP2PGroupStateChangedSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Wifi_P2P_Group_State_Change begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createWifiP2PCurrentDeviceStateChangedSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_WIFI_P2P_CURRENT_DEVICE_STATE_CHANGED],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createWifiP2PCurrentDeviceStateChangedSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Wifi_P2P_Current_Device_State_Change begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createWifiP2PPeersDiscoveryStateChangedSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_WIFI_P2P_PEERS_DISCOVERY_STATE_CHANGED],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createWifiP2PPeersDiscoveryStateChangedSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Wifi_P2P_Peers_Discovery_State_Change begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createWifiP2PPeersStateChangedSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_WIFI_P2P_PEERS_STATE_CHANGED],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createWifiP2PPeersStateChangedSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Wifi_P2P_—Peers—State_Change begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createWifiP2PStateChangedSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_WIFI_P2P_STATE_CHANGED],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createWifiP2PStateChangedSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Wifi_P2P_State_Change begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createWifiP2PConnStateSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_WIFI_P2P_CONN_STATE],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createWifiP2PConnStateSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Wifi_P2P_COnn_State begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createWifiMplinkStateChangeSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_WIFI_MPLINK_STATE_CHANGE],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createWifiMplinkStateChangeSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Wifi_Mplink_State_Change begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createWifiApStaLeaveSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_WIFI_AP_STA_LEAVE],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createWifiApStaLeaveSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Wifi_Ap_Sta_Leave begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createWifiApStaJoinSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_WIFI_AP_STA_JOIN],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createWifiApStaJoinSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Wifi_Ap_Sta_Join begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createWifiHostpotStateSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_WIFI_HOTSPOT_STATE],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createWifiHostpotStateSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Wifi_Hostpot_State begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createWifiConnStateSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_WIFI_CONN_STATE],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createWifiConnStateSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Wifi_Conn_State begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createWifiRssiValueSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_WIFI_RSSI_VALUE],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createWifiRssiValueSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Wifi_Rssi_Value begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createWifiScanFinishedSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_WIFI_SCAN_FINISHED],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createWifiScanFinishedSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Wifi_Scan_Finished begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createWifiPowerStateSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_WIFI_POWER_STATE],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createWifiPowerStateSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Wifi_Power_State begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createHwidLogOffSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_HWID_LOGOFF],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createHwidLogOffSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Hwid_Logoff begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createHwidTokenInvalidSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_HWID_TOKEN_INVALID],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createHwidTokenInvalidSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Hwid_Token_Invalid begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createHwidLogoutSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_HWID_LOGOUT],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createHwidLogoutSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Hwid_loguot begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createHwidLoginSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_HWID_LOGIN],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createHwidLoginSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Hwid_Login begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createUserStoppedSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_USER_STOPPED],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createUserStoppedSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe User_Stopped begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createUserStoppingSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_USER_STOPPING],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createUserStoppingSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe User_Stopping begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createUserUnlockedSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_USER_UNLOCKED],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createUserUnlockedSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe User_Unlocked begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createUserStartingSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_USER_STARTING],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createUserStartingSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe User_Starting begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createUserSwitchedSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_USER_SWITCHED],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createUserSwitchedSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe User_Switched begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createUserForgroundSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_USER_FOREGROUND],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createUserForgroundSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe User_Forground begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createUserBackgroundSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_USER_BACKGROUND],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createUserBackgroundSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe User_Background begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createUserStartedSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_USER_STARTED],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createUserStartedSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe User_Started begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createOfficeModeSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_OFFICE_MODE],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createOfficeModeSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Office_Mode begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createHomeModeSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_HOME_MODE],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createHomeModeSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Home_Mode begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createDriveModeSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_DRIVE_MODE],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createDriveModeSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Drive_Mode begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createManagePackageStorageSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_MANAGE_PACKAGE_STORAGE],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createManagePackageStorageSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Manage_Package_Storage begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createLocateChangedSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_LOCALE_CHANGED],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createLocateChangedSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Locate_Changed begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createConfigurationChangedSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_CONFIGURATION_CHANGED],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createConfigurationChangedSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Configuration_Changed begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createExternalApplicationsUnAvailableSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_EXTERNAL_APPLICATIONS_UNAVAILABLE],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createExternalApplicationsUnAvailableSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe External_Applications_UnAvailable begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createExternalApplicationsAvailableSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_EXTERNAL_APPLICATIONS_AVAILABLE],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createExternalApplicationsAvailableSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe External_Applications_Available begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createMyPackageNeedsVerificationSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_PACKAGE_NEEDS_VERIFICATION],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createMyPackageNeedsVerificationSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Package_Needs_Verification begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createMyPackageFirstLaunchSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_PACKAGE_FIRST_LAUNCH],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createMyPackageFirstLaunchSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Package_Firsh_Launch begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createMyPackageUnsuspendedSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_MY_PACKAGE_SUSPENDED],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createMyPackageUnsuspendedSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe My_Packages_UnSuspended begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createMyPackageSuspendedSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_MY_PACKAGE_SUSPENDED],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createMyPackageSuspendedSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe My_Packages_Suspended begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createPackagesUnsuspendedSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_PACKAGES_UNSUSPENDED],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createPackagesUnsuspendedSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Packages_Unsuspended begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createPackageSuspendedSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_PACKAGES_SUSPENDED],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createPackageSuspendedSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Package_Suspended begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createPackageDataClearedSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_PACKAGE_DATA_CLEARED],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createPackageDataClearedSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Package_Data_Cleared begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createPackageRestartedSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_PACKAGE_RESTARTED],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createPackageRestartedSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Package_Restarted begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createPackageChangedSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_PACKAGE_CHANGED],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createPackageFullyRemovedSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Package_Fully_Removed begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createPackageFullyRemovedSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_PACKAGE_FULLY_REMOVED],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createPackageFullyRemovedSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Package_Fully_Removed begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createBundleRemovedSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_BUNDLE_REMOVED],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createBundleRemovedSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe BundleRemoved begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createPackageRemovedSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_PACKAGE_REMOVED],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createPackageRemovedSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe PackageRemoved begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createMyPackageReplacedSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_MY_PACKAGE_REPLACED],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createMyPackageReplacedSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe My_Package_Replaced begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createPackageReplacedSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_PACKAGE_REPLACED],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createPackageReplacedSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Package_Replaced begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createPackageAddedSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_PACKAGE_ADDED],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createPackageAddedSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Close_System_Dialogs begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createCloseSystemDialogsSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_CLOSE_SYSTEM_DIALOGS],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createCloseSystemDialogsSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Close_System_Dialogs begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createTimezoneChangedSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_TIMEZONE_CHANGED],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createTimezoneChangedSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Timezone_Changed begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createDateChangedSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_DATE_CHANGED],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createDateChangedSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Date_Changed begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createTimeChangedSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_TIME_CHANGED],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createTimeChangedSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Time_Changed begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createTimeTickSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_TIME_TICK],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createTimeTickSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Time_Tick begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createUserPresentSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_USER_PRESENT],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createUserPresentSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe User_Present begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createScreenOnSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_SCREEN_ON],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createScreenOnSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Screen_On begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createScreenOffSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_SCREEN_OFF],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createScreenOffSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe Screen_Off begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createShutdownSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_SHUTDOWN],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createShutdownSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe shutdown begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createLockedBootCompletedSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_LOCKED_BOOT_COMPLETED],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createLockedBootCompletedSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe locked_boot_completed begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createBootCompletedSubscriber() {
    var commonEventSubscribeInfo = {
        events: [commonEvent.Support.COMMON_EVENT_BOOT_COMPLETED],
    };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createBootCompletedSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe boot_completed begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
        console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createBatteryChangedSubscriber() {
     var commonEventSubscribeInfo = {
         events: [commonEvent.Support.COMMON_EVENT_BATTERY_CHANGED],
     };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createBatteryChangedSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe battery_changed begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
            console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createBatteryOkaySubscriber() {
     var commonEventSubscribeInfo = {
         events: [commonEvent.Support.COMMON_EVENT_BATTERY_OKAY],
     };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createBatteryOkaySubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe battery_okay begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
            console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createBatteryLowSubscriber() {
     var commonEventSubscribeInfo = {
         events: [commonEvent.Support.COMMON_EVENT_BATTERY_LOW],
     };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createBatteryLowSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe battery_low begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var capacity = commonEventData.parameters['0'];
                console.info("capacity is:" + capacity);
                expect(capacity >= 0 && capacity <= 100).assertTrue();
            });
        }).catch((error) => {
            console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createBatteryPowerConnectedSubscriber() {
     var commonEventSubscribeInfo = {
         events: [commonEvent.Support.COMMON_EVENT_POWER_CONNECTED],
     };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createBatteryPowerConnectedSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe power_connected begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var pluggedType = commonEventData.parameters['4'];
                console.info("pluggedType is:" + pluggedType);
                expect(pluggedType >= 0 && pluggedType <= 4).assertTrue();
            });
        }).catch((error) => {
            console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createBatteryPowerDisconnectedSubscriber() {
     var commonEventSubscribeInfo = {
         events: [commonEvent.Support.COMMON_EVENT_POWER_DISCONNECTED],
     };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createBatteryPowerDisconnectedSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe power_disconnected begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var pluggedType = commonEventData.parameters['4'];
                console.info("pluggedType is:" + pluggedType);
                expect(pluggedType >= 0 && pluggedType <= 4).assertTrue();
            });
        }).catch((error) => {
            console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createBatteryChargingSubscriber() {
     var commonEventSubscribeInfo = {
         events: [commonEvent.Support.COMMON_EVENT_CHARGING],
     };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createBatteryChargingSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe charging begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var chargeState = commonEventData.parameters['7'];
                console.info("chargeState is:" + chargeState);
                expect(chargeState >= 0 && chargeState <= 10).assertTrue();
            });
        }).catch((error) => {
            console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}

function createBatteryDischargingSubscriber() {
     var commonEventSubscribeInfo = {
         events: [commonEvent.Support.COMMON_EVENT_DISCHARGING],
     };
    commonEvent.createSubscriber(commonEventSubscribeInfo)
        .then(subscriber => {
            console.info('createBatteryDischargingSubscriber success');
            var mySubscriber = subscriber;
            console.log(subscriber);

            if (subscriber == "" || subscriber == undefined || subscriber == null) {
                console.info("createSubscriber failed");
            }
            mySubscriber.getCode()
                .then((data) => {
                    console.info('Subscriber getCode success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getCode error because: ' + JSON.stringify(error));
            })
            mySubscriber.getData()
                .then((data) => {
                    console.info('Subscriber getData success : ' + JSON.stringify(data));
                }).catch((error) => {
                console.error('Subscriber getData error because: ' + JSON.stringify(error));
            })
            console.info('subscribe discharging begin ');

            commonEvent.subscribe(mySubscriber, (error, commonEventData) => {
                console.error('err code: ' + JSON.stringify(error));
                console.info('subscribe callback: ' + JSON.stringify(commonEventData));
                console.info("commonEventData event: " + commonEventData.event);
                console.info("commonEventData bundleName: " + commonEventData.bundleName);
                console.info("commonEventData data: " + commonEventData.data);
                console.info("commonEventData parameter: " + commonEventData.parameters[0]);
                var chargeState = commonEventData.parameters['7'];
                console.info("chargeState is:" + chargeState);
                expect(chargeState >= 0 && chargeState <= 10).assertTrue();
            });
        }).catch((error) => {
            console.error('Operation failed. Cause: ' + JSON.stringify(error));
    });
}
