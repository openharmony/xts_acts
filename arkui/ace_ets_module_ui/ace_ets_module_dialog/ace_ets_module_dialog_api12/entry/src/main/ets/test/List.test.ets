/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import TextPickerDialog from './TextPickerDialogTest/TextPickerDialog.test.ets'
import DatePickerDialog from './DatePickerDialogTest/DatePickerDialog.test.ets'
import TimePickerDialog from './TimePickerDialogTest/TimePickerDialog.test.ets'
import CalendarPickerDialog from './CalendarPickerDialogTest/CalendarPickerDialog.test.ets'
import ActionSheet1 from './ActionSheetTest/ActionSheet1.test.ets'
import ActionSheet2 from './ActionSheetTest/ActionSheet2.test.ets'
import ActionSheet3 from './ActionSheetTest/ActionSheet3.test.ets'
import AlertDialog1 from './AlertDialogTest/AlertDialog1.test.ets'
import AlertDialog2 from './AlertDialogTest/AlertDialog2.test.ets'
import AlertDialog3 from './AlertDialogTest/AlertDialog3.test.ets'
import CustomDialog1 from './CustomDialogTest/CustomDialog1.test.ets'
import CustomDialog2 from './CustomDialogTest/CustomDialog2.test.ets'
import CustomDialog3 from './CustomDialogTest/CustomDialog3.test.ets'
import openCustomDialog1 from './openCustomDialogTest/openCustomDialog1.test.ets'
import openCustomDialog2 from './openCustomDialogTest/openCustomDialog2.test.ets'
import openCustomDialog3 from './openCustomDialogTest/openCustomDialog3.test.ets'
import CalendarDialogCallback from './CalendarPickerDialogTest/CalendarDialogCallback.test.ets'
import DatePickerDialogCallback from './DatePickerDialogTest/DatePickerDialogCallback.test.ets'
import TextPickerDialogCallback from './TextPickerDialogTest/TextPickerDialogCallback.test.ets'
import TimePickerDialogCallback from './TimePickerDialogTest/TimePickerDialogCallback.test.ets'
import closeCustomDialog from './promptActionTest/closeCustomDialog.test'
import openCustomDialog from './promptActionTest/openCustomDialog.test'
import updateCustomDialog from './promptActionTest/updateCustomDialog.test'
import onHeightDidChange from './onHeightDidChange.test'

import TimePickerDialog_Accept_Test from './TimePickerDialogTest/ButtonStyleTest/TimePickerDialog_Accept_Test.test.ets'
import TimePickerDialog_Cancel_Test from './TimePickerDialogTest/ButtonStyleTest/TimePickerDialog_Cancel_Test.test.ets'
import TextPickerDialog_Accept_Test from './TextPickerDialogTest/ButtonStyleTest/TextPickerDialog_Accept_Test.test.ets'
import TextPickerDialog_Cancel_Test from './TextPickerDialogTest/ButtonStyleTest/TextPickerDialog_Cancel_Test.test.ets'
import CloseCustomDialogTest from './CustomDialogTest/UIContextTest/CloseCustomDialog.test.ets'
import openCustomDialogTest from './CustomDialogTest/UIContextTest/OpenCustomDialog.test.ets'
import UpdateCustomDialogTest from './CustomDialogTest/UIContextTest/UpdateCustomDialog.test.ets'
import ButtonStyle from './CalendarPickerDialogTest/ButtonStyle.test'
import DateButtonStyle from './DatePickerDialogTest/DateButtonStyle.test'
import dialogApi from './Dialog/dialogApi.test'
import CustomDialogRouter from './CustomDialogTest/CustomDialogRouter.test.ets'
import MenuApi1 from './Menu/MenuApi1.test'
import IconApiTest from './MenuTest/MenuApiTest/IconApiTest.test'
import PopupOptionsTest from './PopupTest/PopupApiTest/PopupApiTest.test'
import menuItemGroupDivider from './Menu/menuItemGroupDivider.test.ets';

import SubMenuExpandingModeTest_SIDE from './MenuTest/MenuApiTest/SubMenuExpandingModeTest_SIDE.test'
import SubMenuExpandingModeTest_EMBEDDED from './MenuTest/MenuApiTest/SubMenuExpandingModeTest_EMBEDDED.test'

export default function testsuite() {
  dialogApi()
  TextPickerDialog()
  DatePickerDialog()
  TimePickerDialog()
  CalendarPickerDialog()
  ActionSheet1();
  ActionSheet2();
  ActionSheet3();
  AlertDialog1();
  AlertDialog2();
  AlertDialog3();
  CustomDialog1();
  CustomDialog2();
  CustomDialog3();
  openCustomDialog1();
  openCustomDialog2();
  openCustomDialog3();
  CalendarDialogCallback();
  DatePickerDialogCallback();
  TextPickerDialogCallback();
  TimePickerDialogCallback();
  onHeightDidChange();
  closeCustomDialog()
  openCustomDialog()
  updateCustomDialog()
  TimePickerDialog_Accept_Test();
  TimePickerDialog_Cancel_Test();
  TextPickerDialog_Accept_Test();
  TextPickerDialog_Cancel_Test();
  CloseCustomDialogTest();
  openCustomDialogTest();
  UpdateCustomDialogTest();
  ButtonStyle()
  DateButtonStyle()
  CustomDialogRouter()
  MenuApi1()
  IconApiTest();
  PopupOptionsTest();
  menuItemGroupDivider();
  SubMenuExpandingModeTest_SIDE();
  SubMenuExpandingModeTest_EMBEDDED();
}