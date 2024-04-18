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
import CustomDialogMaskTest from './promptActionTest/CustomDialogMask.test'
import menu from './MenuTest/menu.test'
import menuTest from './MenuTest/menufirst.test'
import menuSecondTest from './MenuTest/menusecond.test'
import ToastShowMode from './promptActionTest/ToastShowMode.test';
import promptTest from './promptActionTest/promptTest.test';
import DialogTest from './promptActionTest/Dialog.test';
import panelJsunit from './Panel/PanelJsunit.test';
import panelClose from './panelTest/panelClose'

import ActionSheet from './actionSheetTest/ActionSheet.test'
import ActionSheetFalse from './actionSheetTest/ActionSheetFalse.test'
import ActionSheetTrue from './actionSheetTest/ActionSheetTrue.test'
import CalendarPickerDialog from './calendarPickerDialogTest/CalendarPickerDialog.test'
import CustomDialog from './customDialogTest/CustomDialog.test'
import CustomDialogFalse from './customDialogTest/CustomDialogFalse.test'
import CustomDialogTrue from './customDialogTest/CustomDialogTrue.test'
import DatePickerDialog from './datePickerDialogTest/DatePickerDialog.test'
import TextPickerDialog from './textPickerDialogTest/TextPickerDialog.test'
import TimePickerDialog from './timePickerDialogTest/TimePickerDialog.test'
import openCustomDialog from './promptActionTest/openCustomDialog.test'
import openCustomDialogFalse from './promptActionTest/openCustomDialogFalse.test'
import openCustomDialogNew from './promptActionTest/openCustomDialogNew.test'
import openCustomDialogTrue from './promptActionTest/openCustomDialogTrue.test'
import showActionMenu from './promptActionTest/showActionMenu.test'
import showActionMenuFalse from './promptActionTest/showActionMenuFalse.test'
import showActionMenuTrue from './promptActionTest/showActionMenuTrue.test'
import showDialog from './promptActionTest/showDialog.test'
import showDialogFalse from './promptActionTest/showDialogFalse.test'
import showDialogTrue from './promptActionTest/showDialogTrue.test'
import showToast from './promptActionTest/showToast.test'
import AlertDialog1 from './alertDialogTest/AlertDialog1.test'
import AlertDialogFalse from './alertDialogTest/AlertDialogFalse.test'
import AlertDialogTrue from './alertDialogTest/AlertDialogTrue.test'

export default function testsuite() {
  CustomDialogMaskTest()
  menu()
  menuTest()
  menuSecondTest();
  ToastShowMode()
  promptTest()
  DialogTest();
  panelJsunit();
  panelClose()

  ActionSheet();
  ActionSheetFalse();
  ActionSheetTrue();
  CalendarPickerDialog();
  CustomDialog();
  CustomDialogFalse();
  CustomDialogTrue();
  DatePickerDialog();
  TextPickerDialog();
  TimePickerDialog();
  openCustomDialog();
  openCustomDialogFalse();
  openCustomDialogNew();
  openCustomDialogTrue();
  showActionMenu();
  showActionMenuFalse();
  showActionMenuTrue();
  showDialog();
  showDialogFalse();
  showDialogTrue();
  showToast();
  AlertDialog1();
  AlertDialogFalse();
  AlertDialogTrue()
}