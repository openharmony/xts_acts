/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import FormExtensionAbility from '@ohos.app.form.FormExtensionAbility';
import formBindingData from '@ohos.app.form.formBindingData';
import formInfo from '@ohos.app.form.formInfo';
import common from '@ohos.app.ability.common';

export default class FormModuleAbility extends FormExtensionAbility {
  onAddForm(want) {
    // Called to return a FormBindingData object.
    console.info("FormAbility onAddForm");
    let formExtensionAbilities: common.FormExtensionContext = this.context;
    let extensionAbilities: common.ExtensionContext = this.context;
    let formData = {};
    return formBindingData.createFormBindingData(formData);
  }

  onCastToNormalForm(formId) {
    // Called when the form provider is notified that a temporary form is successfully
    // converted to a normal form.
  }

  onUpdateForm(formId) {
    // Called to notify the form provider to update a specified form.
  }

  onChangeFormVisibility(newStatus) {
    // Called when the form provider receives form events from the system.
  }

  onFormEvent(formId, message) {
    // Called when a specified message event defined by the form provider is triggered.
  }

  onRemoveForm(formId) {
    // Called to notify the form provider that a specified form has been destroyed.
  }

  onConfigurationUpdate(configuration) {
    console.log('FormAbility onConfigurationUpdate:' + JSON.stringify(configuration));
  }

  onAcquireFormState(want) {
    // Called to return a {@link FormState} object.
    return formInfo.FormState.READY;
  }

  onShareForm(formId) {
    console.log('FormAbility onShareForm:' + JSON.stringify(formId));
    return {};
  }
}