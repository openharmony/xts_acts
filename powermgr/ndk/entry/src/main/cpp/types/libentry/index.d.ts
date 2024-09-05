/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
export const getCapacity: () => number;

export const getPluggedType: () => string;

export const commonEventKeyCapacity: () => string;

export const commonEventKeyChargeState: () => string;

export const commonEventKeyPluggedType: () => string;

export enum BatteryInfo_BatteryPluggedType {
  /**
   * Unknown type
   *
   * @syscap SystemCapability.PowerManager.BatteryManager.Core
   * @since 6
   */
  NONE,
  /**
   * AC charger
   *
   * @syscap SystemCapability.PowerManager.BatteryManager.Core
   * @since 6
   */
  AC,
  /**
   * USB charger
   *
   * @syscap SystemCapability.PowerManager.BatteryManager.Core
   * @since 6
   */
  USB,
  /**
   * Wireless charger
   *
   * @syscap SystemCapability.PowerManager.BatteryManager.Core
   * @since 6
   */
  WIRELESS
}