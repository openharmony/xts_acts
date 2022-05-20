/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
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

import formManager from '@ohos.ability.formmanager';
import bundleManager from '@ohos.bundle';
import abilityManager from '@ohos.app.abilityManager';

export default class FormViewModel {
  private static sFormViewModel: FormViewModel = null;

  public static getInstance(): FormViewModel {
    if (FormViewModel.sFormViewModel == null) {
      FormViewModel.sFormViewModel = new FormViewModel();
    }
    return FormViewModel.sFormViewModel;
  }

  public async castTempFormToNormal(formId: string) {
    formManager.castTempForm(formId)
      .then((data) => {
        console.info('[FormComponent] castTempForm result:' + data);
      });
  }

  public async requestForm(formId: string) {
    formManager.requestForm(formId)
      .then((data) => {
        console.info('[FormComponent] requestForm result:' + data);
      });
  }

  public async deleteCard(formId: string) {
    formManager.deleteForm(formId)
      .then((data) => {
        console.info('[FormComponent] deleteForm result:' + data);
      });
  }

  public async releaseCard(formId: string) {
    formManager.releaseForm(formId)
      .then((data) => {
        console.info('[FormComponent] releaseForm result:' + data);
      });
  }

  public async enableCard(formId: string) {
    formManager.enableFormsUpdate([formId])
      .then((data) => {
        console.info('[FormComponent] enableFormsUpdate result:' + data);
      });
  }

  public async disableCard(formId: string) {
    formManager.disableFormsUpdate([formId])
      .then((data) => {
        console.info('[FormComponent] disableCard result:' + data);
      });
  }

  public async changeCardVisible(formId: string, isVisible: boolean) {
    if (isVisible) {
      formManager.notifyVisibleForms([formId])
        .then((data) => {
          console.info('[FormComponent] changeCardVisible result:' + data + ', isVisible:' + isVisible);
        });
    } else {
      formManager.notifyInvisibleForms([formId])
        .then((data) => {
          console.info('[FormComponent] changeCardVisible result:' + data + ', isVisible:' + isVisible);
        });
    }
  }

  public async isFmsReady() {
    formManager.isSystemReady()
      .then((data) => {
        console.info('[FormComponent] isFmsReady result:' + data);
      });
  }

  public async getAllFormsInfo() {
    formManager.getAllFormsInfo()
      .then((data) => {
        console.info('[FormComponent] getAllFormsInfo result:' + JSON.stringify(data));
      });
  }

  public async getFormsInfoByApp(bundle: string) {
    formManager.getFormsInfo(bundle)
      .then((data) => {
        console.info('[FormComponent] getFormsInfoByApp result:' + JSON.stringify(data));
      });
  }

  public async getFormsInfoByModule(bundle: string, moduleName: string) {
    formManager.getFormsInfo(bundle, moduleName)
      .then((data) => {
        console.info('[FormComponent] getFormsInfoByModule result:' + JSON.stringify(data));
      });
  }

  public async clearFormUserCache() {
    abilityManager.clearUpApplicationData('com.ohos.myapplicationform')
      .then((data) => {
        console.info('[FormComponent] cleanBundleCacheFiles result:' + JSON.stringify(data));
      });
  }

  public async clearFormProviderCache(bundle: string) {
    abilityManager.clearUpApplicationData(bundle)
      .then((data) => {
        console.info('[FormComponent] cleanBundleCacheFiles result:' + JSON.stringify(data));
      });
  }
}