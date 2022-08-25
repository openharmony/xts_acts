/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterAll, it, expect } from '@ohos/hypium'
import commonEvent from '@ohos.commonEvent'
import accessibility from '@ohos.accessibility';
import config from '@ohos.accessibility.config';
const LOG = "[xtsLog]"
const START_TIMEOUT = 5000;

const CaptionConfigurationOn = (logTag, captionType) => {
  let captionsManager = accessibility.getCaptionsManager();
  if (!captionsManager) {
    console.info(logTag + " captionsManager is undefined");
    return;
  }
  captionsManager.on(captionType, (res) => {
    console.info(logTag + " captionsManager on " + captionType + " res: " + JSON.stringify(res));
    onbackList.push(logTag + "_on_success")
    console.info(logTag + "_on_success");
  });
}

const CaptionConfigurationOff = (logTag, captionType) => {
  let captionsManager = accessibility.getCaptionsManager();
  if (!captionsManager) {
    console.info(logTag + " captionsManager is undefined");
    return;
  }
  captionsManager.off(captionType, (res) => {
    console.info(logTag + " captionsManager off " + captionType + " res: " + JSON.stringify(res));
  });
}

const captionOn = (logTag, caseName) => {
  config.captions.on((res) => {
    console.info(logTag + " captionOn  res =  " + JSON.stringify(res));
    console.info(logTag + "_on_success");
    onbackList.push(caseName + "_on_success")
  });
}

const captionOff = (logTag, captionType) => {
  config.captions.off((res) => {
    console.info(logTag + " caption off " + captionType + " res: " + JSON.stringify(res));
  });
}

const captionStyleOn = (logTag, caseName) => {
  config.captionsStyle.on((res) => {
    console.info(logTag + " captionsStyle On  res =  " + JSON.stringify(res));
    console.info(logTag + "_on_success");
    onbackList.push(caseName + "_on_success")
  });
}

const captionStyleOff = (logTag, captionType) => {
  config.captionsStyle.off((res) => {
    console.info(logTag + " captionsStyle off " + captionType + " res: " + JSON.stringify(res));
  });
}

const excuteCase = (caseNamePara) => {
  console.info(LOG + 'AccessibleEventTest excuteCase: ' + caseNamePara);

  function publishCallback(err) {
    console.info(LOG + caseNamePara + "on_target_change publish call back result:" + JSON.stringify(err));
  }

  var commonEventPublishData = {
    data: caseNamePara + "_AccessibilityApp_start"
  }
  commonEvent.publish("on_target_change", commonEventPublishData, publishCallback);
}
var backList = []
let subScriber = undefined;
var onbackList = []
export default function CaptionConfigurationTest() {
  describe('ActsCaptionConfigurationTest', function () {
    beforeEach(async function (done) {
      console.info(LOG + 'ActsCaptionConfigurationTest: beforeEach');
      setTimeout(() => {
        done();
      }, 3000);
    });
    beforeAll(async function (done) {
      console.info(LOG + 'ActsCaptionConfigurationTest: beforeAll');

      subScriber = await commonEvent.createSubscriber({
        events: ['on_target_change_extra']
      });
      console.info(LOG + 'ActsCaptionConfigurationTest  beforeAll subscribe send:' + JSON.stringify(subScriber));

      commonEvent.subscribe(subScriber, (err, data) => {
        console.info(LOG + ' ActsCaptionConfigurationTest beforeAll subscribe data:' + JSON.stringify(data));
        if (data.data) {
          console.info(LOG + "  ActsCaptionConfigurationTest CallBack:  " + data.data);
          backList.push(data.data)
        }
      });
      setTimeout(done(), START_TIMEOUT);
    });

    afterAll(async function (done) {
      console.info(LOG + 'ActsCaptionConfigurationTest: afterAll');
      setTimeout(function () {
        commonEvent.unsubscribe(subScriber);
        config.captions.set(false);
        let captionsStyle: accessibility.CaptionsStyle = {"fontFamily":"default","fontScale":0,"fontColor":"#000000ff","fontEdgeType":"none","backgroundColor":"#000000ff","windowColor":"#000000ff"};
        config.captionsStyle.set(captionsStyle);
        done();
      }, 10000);
    });

    /**
    * @tc.number: CaptionConfiguration_0010
    * @tc.name: Call api:getcaptionsmanager() to set the caption parameter.
    * @tc.desc: Call api:getcaptionsmanager() to set the caption parameter.
    */
    it('CaptionConfiguration_0010', 1, async function (done) {
      const caseName = "CaptionConfiguration_0010";
      const logF = LOG + caseName;
      setTimeout(() => {
        CaptionConfigurationOn(caseName, 'enableChange')
      }, 1000);
      setTimeout(() => {
        excuteCase(caseName);
      }, 3000);
      setTimeout(() => {
        var isSucceedTarget: boolean = false;
        var isSucceedOnBack: boolean = false;
        if (backList.indexOf(caseName + '_on_target_change_extra_success') !== -1) {
          isSucceedTarget = true;
        }
        if (onbackList.indexOf(caseName + '_on_success') !== -1) {
          isSucceedOnBack = true;
        }
        expect(isSucceedTarget && isSucceedOnBack).assertEqual(true);
        console.info(logF + ' isSucceed : ' + (isSucceedTarget && isSucceedOnBack));
        done();
      }, 8000);
    });

    /**
    * @tc.number: CaptionConfiguration_0020
    * @tc.name: Call api:getcaptionsmanager() to set the caption parameter.
    * @tc.desc: Call api:getcaptionsmanager() to set the caption parameter.
    */
    it('CaptionConfiguration_0020', 1, async function (done) {
      const caseName = "CaptionConfiguration_0020";
      const logF = LOG + caseName;
      CaptionConfigurationOn(caseName, 'styleChange')
      setTimeout(() => {
        excuteCase(caseName);
      }, 3000);
      setTimeout(() => {
        var isSucceedTarget: boolean = false;
        var isSucceedOnBack: boolean = false;
        if (backList.indexOf(caseName + '_on_target_change_extra_success') !== -1) {
          isSucceedTarget = true;
        }
        if (onbackList.indexOf(caseName + '_on_success') !== -1) {
          isSucceedOnBack = true;
        }
        expect(isSucceedTarget && isSucceedOnBack).assertEqual(true);
        console.info(logF + ' isSucceed : ' + (isSucceedTarget && isSucceedOnBack));
        done();
      }, 8000);
    });

    /**
    * @tc.number: CaptionConfiguration_0030
    * @tc.name: Call api:getcaptionsmanager() to set the caption parameter.
    * @tc.desc: Call api:getcaptionsmanager() to set the caption parameter.
    */
    it('CaptionConfiguration_0030', 1, async function (done) {
      const caseName = "CaptionConfiguration_0030";
      const logF = LOG + caseName;
      setTimeout(() => {
        CaptionConfigurationOn(caseName, 'enableChange');
      }, 1000);
      setTimeout(() => {
        CaptionConfigurationOff(caseName, 'enableChange')
      }, 2000);
      setTimeout(() => {
        excuteCase(caseName);
      }, 3000);
      setTimeout(() => {
        var isSucceedTarget: boolean = false;
        var isSucceedOnBack: boolean = false;
        if (backList.indexOf(caseName + '_on_target_change_extra_success') !== -1) {
          isSucceedTarget = true;
        }
        if (onbackList.indexOf(caseName + '_on_success') == -1) {
          isSucceedOnBack = true;
        }
        expect(isSucceedTarget && isSucceedOnBack).assertEqual(true);
        console.info(logF + ' isSucceed : ' + (isSucceedTarget && isSucceedOnBack));
        done();
      }, 8000);
    });

    /**
    * @tc.number: CaptionConfiguration_0040
    * @tc.name: Call api:getcaptionsmanager() to set the caption parameter.
    * @tc.desc: Call api:getcaptionsmanager() to set the caption parameter.
    */
    it('CaptionConfiguration_0040', 1, async function (done) {
      const caseName = "CaptionConfiguration_0040";
      const logF = LOG + caseName;
      setTimeout(() => {
        CaptionConfigurationOn(caseName, 'styleChange');
      }, 1000);
      setTimeout(() => {
        CaptionConfigurationOff(caseName, 'styleChange')
      }, 2000);
      setTimeout(() => {
        excuteCase(caseName);
      }, 3000);
      setTimeout(() => {
        var isSucceedTarget: boolean = false;
        var isSucceedOnBack: boolean = false;
        if (backList.indexOf(caseName + '_on_target_change_extra_success') !== -1) {
          isSucceedTarget = true;
        }
        if (onbackList.indexOf(caseName + '_on_success') == -1) {
          isSucceedOnBack = true;
        }
        expect(isSucceedTarget && isSucceedOnBack).assertEqual(true);
        console.info(logF + ' isSucceed : ' + (isSucceedTarget && isSucceedOnBack));
        done();
      }, 8000);
    });

    /**
    * @tc.number: CaptionConfiguration_0050
    * @tc.name: Call api:getcaptionsmanager() to set the caption parameter.
    * @tc.desc: Call api:getcaptionsmanager() to set the caption parameter.
    */
    it('CaptionConfiguration_0050', 1, async function (done) {
      const caseName = "CaptionConfiguration_0050";
      const logF = LOG + caseName;
      setTimeout(() => {
        excuteCase(caseName);
      }, 2000);
      setTimeout(() => {
        var isSucceedTarget: boolean = false;
        if (backList.indexOf(caseName + '_on_target_change_extra_success') !== -1) {
          isSucceedTarget = true;
        }
        expect(isSucceedTarget).assertEqual(true);
        console.info(logF + ' isSucceed : ' + (isSucceedTarget));
        done();
      }, 8000);
    });

    /**
    * @tc.number: CaptionConfiguration_0060
    * @tc.name: Call api:getcaptionsmanager() to set the caption parameter.
    * @tc.desc: Call api:getcaptionsmanager() to set the caption parameter.
    */
    it('CaptionConfiguration_0060', 1, async function (done) {
      const caseName = "CaptionConfiguration_0060";
      const logF = LOG + caseName;
      setTimeout(() => {
        excuteCase(caseName);
      }, 2000);
      setTimeout(() => {
        var isSucceedTarget: boolean = false;
        if (backList.indexOf(caseName + '_on_target_change_extra_success') !== -1) {
          isSucceedTarget = true;
        }
        expect(isSucceedTarget).assertEqual(true);
        console.info(logF + ' isSucceed : ' + (isSucceedTarget));
        done();
      }, 8000);
    });

    /**
    * @tc.number: CaptionConfiguration_0070
    * @tc.name: Call api:getcaptionsmanager() to set the caption parameter.
    * @tc.desc: Call api:getcaptionsmanager() to set the caption parameter.
    */
    it('CaptionConfiguration_0070', 1, async function (done) {
      const caseName = "CaptionConfiguration_0070";
      const logF = LOG + caseName;
      setTimeout(() => {
        excuteCase(caseName);
      }, 2000);
      setTimeout(() => {
        var isSucceedTarget: boolean = false;
        if (backList.indexOf(caseName + '_on_target_change_extra_success') !== -1) {
          isSucceedTarget = true;
        }
        expect(isSucceedTarget).assertEqual(true);
        console.info(logF + ' isSucceed : ' + (isSucceedTarget));
        done();
      }, 8000);
    });

    /**
    * @tc.number: CaptionConfiguration_0080
    * @tc.name: Call api:getcaptionsmanager() to set the caption parameter.
    * @tc.desc: Call api:getcaptionsmanager() to set the caption parameter.
    */
    it('CaptionConfiguration_0080', 1, async function (done) {
      const caseName = "CaptionConfiguration_0080";
      const logF = LOG + caseName;
      setTimeout(() => {
        excuteCase(caseName);
      }, 2000);
      setTimeout(() => {
        var isSucceedTarget: boolean = false;
        if (backList.indexOf(caseName + '_on_target_change_extra_success') !== -1) {
          isSucceedTarget = true;
        }
        expect(isSucceedTarget).assertEqual(true);
        console.info(logF + ' isSucceed : ' + (isSucceedTarget));
        done();
      }, 8000);
    });

    /**
    * @tc.number: CaptionConfiguration_0090
    * @tc.name: Call api:getcaptionsmanager() to set the caption parameter.
    * @tc.desc: Call api:getcaptionsmanager() to set the caption parameter.
    */
    it('CaptionConfiguration_0090', 1, async function (done) {
      const caseName = "CaptionConfiguration_0090";
      const logF = LOG + caseName;
      setTimeout(() => {
        excuteCase(caseName);
      }, 2000);
      setTimeout(() => {
        var isSucceedTarget: boolean = false;
        if (backList.indexOf(caseName + '_on_target_change_extra_success') !== -1) {
          isSucceedTarget = true;
        }
        expect(isSucceedTarget).assertEqual(true);
        console.info(logF + ' isSucceed : ' + (isSucceedTarget));
        done();
      }, 8000);
    });

    /**
    * @tc.number: CaptionConfiguration_0100
    * @tc.name: Call api:getcaptionsmanager() to set the caption parameter.
    * @tc.desc: Call api:getcaptionsmanager() to set the caption parameter.
    */
    it('CaptionConfiguration_0100', 1, async function (done) {
      const caseName = "CaptionConfiguration_0100";
      const logF = LOG + caseName;
      setTimeout(() => {
        excuteCase(caseName);
      }, 2000);
      setTimeout(() => {
        var isSucceedTarget: boolean = false;
        if (backList.indexOf(caseName + '_on_target_change_extra_success') !== -1) {
          isSucceedTarget = true;
        }
        expect(isSucceedTarget).assertEqual(true);
        console.info(logF + ' isSucceed : ' + (isSucceedTarget));
        done();
      }, 8000);
    });

    /**
    * @tc.number: CaptionConfiguration_0110
    * @tc.name: Call api:getcaptionsmanager() to set the caption parameter.
    * @tc.desc: Call api:getcaptionsmanager() to set the caption parameter.
    */
    it('CaptionConfiguration_0110', 1, async function (done) {
      const caseName = "CaptionConfiguration_0110";
      const logF = LOG + caseName;
      setTimeout(() => {
        excuteCase(caseName);
      }, 2000);
      setTimeout(() => {
        var isSucceedTarget: boolean = false;
        if (backList.indexOf(caseName + '_on_target_change_extra_success') !== -1) {
          isSucceedTarget = true;
        }
        expect(isSucceedTarget).assertEqual(true);
        console.info(logF + ' isSucceed : ' + (isSucceedTarget));
        done();
      }, 8000);
    });

    /**
    * @tc.number: CaptionConfiguration_0120
    * @tc.name: Call api:getcaptionsmanager() to set the caption parameter.
    * @tc.desc: Call api:getcaptionsmanager() to set the caption parameter.
    */
    it('CaptionConfiguration_0120', 1, async function (done) {
      const caseName = "CaptionConfiguration_0120";
      const logF = LOG + caseName;
      setTimeout(() => {
        CaptionConfigurationOn(caseName, undefined);
      }, 1000);
      setTimeout(() => {
        excuteCase(caseName);
      }, 2000);
      setTimeout(() => {
        var isSucceedTarget: boolean = false;
        var isSucceedOnBack: boolean = false;
        if (backList.indexOf(caseName + '_on_target_change_extra_success') == -1) {
          isSucceedTarget = true;
        }
        if (onbackList.indexOf(caseName + '_on_success') == -1) {
          isSucceedOnBack = true;
        }
        expect(isSucceedTarget && isSucceedOnBack).assertEqual(true);
        console.info(logF + ' isSucceed : ' + (isSucceedTarget && isSucceedOnBack));
        done();
      }, 8000);
    });

    /**
    * @tc.number: CaptionConfiguration_0130
    * @tc.name: Call api:getcaptionsmanager() to set the caption parameter.
    * @tc.desc: Call api:getcaptionsmanager() to set the caption parameter.
    */
    it('CaptionConfiguration_0130', 1, async function (done) {
      const caseName = "CaptionConfiguration_0130";
      const logF = LOG + caseName;
      setTimeout(() => {
        excuteCase(caseName);
      }, 2000);
      setTimeout(() => {
        var isSucceedTarget: boolean = false;
        if (backList.indexOf(caseName + '_on_target_change_extra_success') !== -1) {
          isSucceedTarget = true;
        }
        expect(isSucceedTarget).assertEqual(true);
        console.info(logF + ' isSucceed : ' + (isSucceedTarget));
        done();
      }, 8000);
    });

    /**
    * @tc.number: CaptionConfiguration_0140
    * @tc.name: Call api:config to set the captions parameter.
    * @tc.desc: Call api:config to set the captions parameter.
    */
    it('CaptionConfiguration_0140', 1, async function (done) {
      const caseName = "CaptionConfiguration_0140";
      const logF = LOG + caseName;
      setTimeout(() => {
        captionOn(logF, caseName)
      }, 1000);
      setTimeout(() => {
        excuteCase(caseName);
      }, 3000);
      setTimeout(() => {
        var isSucceedTarget: boolean = false;
        var isSucceedOnBack: boolean = false;
        if (backList.indexOf(caseName + '_on_target_change_extra_success') !== -1) {
          isSucceedTarget = true;
        }
        if (onbackList.indexOf(caseName + '_on_success') !== -1) {
          isSucceedOnBack = true;
        }
        expect(isSucceedTarget && isSucceedOnBack).assertEqual(true);
        console.info(logF + ' isSucceed : ' + (isSucceedTarget && isSucceedOnBack));
        done();
      }, 8000);
    });

    /**
    * @tc.number: CaptionConfiguration_0150
    * @tc.name: Call api:config to set the captionsStyle parameter.
    * @tc.desc: Call api:config to set the captionsStyle parameter.
    */
    it('CaptionConfiguration_0150', 1, async function (done) {
      const caseName = "CaptionConfiguration_0150";
      const logF = LOG + caseName;
      captionStyleOn(logF, caseName)
      setTimeout(() => {
        excuteCase(caseName);
      }, 3000);
      setTimeout(() => {
        var isSucceedTarget: boolean = false;
        var isSucceedOnBack: boolean = false;
        if (backList.indexOf(caseName + '_on_target_change_extra_success') !== -1) {
          isSucceedTarget = true;
        }
        if (onbackList.indexOf(caseName + '_on_success') !== -1) {
          isSucceedOnBack = true;
        }
        expect(isSucceedTarget && isSucceedOnBack).assertEqual(true);
        console.info(logF + ' isSucceed : ' + (isSucceedTarget && isSucceedOnBack));
        done();
      }, 8000);
    });

    /**
    * @tc.number: CaptionConfiguration_0160
    * @tc.name: Call api:config to set the captions parameter.
    * @tc.desc: Call api:config to set the captions parameter.
    */    
    it('CaptionConfiguration_0160', 1, async function (done) {
      const caseName = "CaptionConfiguration_0160";
      const logF = LOG + caseName;
      setTimeout(() => {
        captionOn(logF, caseName)
      }, 1000);
      setTimeout(() => {
        captionOff(logF, caseName)
      }, 2000);
      setTimeout(() => {
        excuteCase(caseName);
      }, 3000);
      setTimeout(() => {
        var isSucceedTarget: boolean = false;
        var isSucceedOnBack: boolean = false;
        if (backList.indexOf(caseName + '_on_target_change_extra_success') !== -1) {
          isSucceedTarget = true;
        }
        if (onbackList.indexOf(caseName + '_on_success') == -1) {
          isSucceedOnBack = true;
        }
        expect(isSucceedTarget && isSucceedOnBack).assertEqual(true);
        console.info(logF + ' isSucceed : ' + (isSucceedTarget && isSucceedOnBack));
        done();
      }, 8000);
    });

    /**
    * @tc.number: CaptionConfiguration_0170
    * @tc.name: Call api:config to set the captionsStyle parameter.
    * @tc.desc: Call api:config to set the captionsStyle parameter.
    */    
    it('CaptionConfiguration_0170', 1, async function (done) {
      const caseName = "CaptionConfiguration_0170";
      const logF = LOG + caseName;
      setTimeout(() => {
        captionStyleOn(logF, caseName);
      }, 1000);
      setTimeout(() => {
        captionStyleOff(logF, caseName)
      }, 2000);
      setTimeout(() => {
        excuteCase(caseName);
      }, 3000);
      setTimeout(() => {
        var isSucceedTarget: boolean = false;
        var isSucceedOnBack: boolean = false;
        if (backList.indexOf(caseName + '_on_target_change_extra_success') !== -1) {
          isSucceedTarget = true;
        }
        if (onbackList.indexOf(caseName + '_on_success') == -1) {
          isSucceedOnBack = true;
        }
        expect(isSucceedTarget && isSucceedOnBack).assertEqual(true);
        console.info(logF + ' isSucceed : ' + (isSucceedTarget && isSucceedOnBack));
        done();
      }, 8000);
    });

    /**
    * @tc.number: CaptionConfiguration_0180
    * @tc.name: Call api:config to set the captionsStyle parameter.
    * @tc.desc: Call api:config to set the captionsStyle parameter.
    */    
    it('CaptionConfiguration_0180', 1, async function (done) {
      const caseName = "CaptionConfiguration_0180";
      const logF = LOG + caseName;
      setTimeout(() => {
        excuteCase(caseName);
      }, 2000);
      setTimeout(() => {
        var isSucceedTarget: boolean = false;
        if (backList.indexOf(caseName + '_on_target_change_extra_success') !== -1) {
          isSucceedTarget = true;
        }
        expect(isSucceedTarget).assertEqual(true);
        console.info(logF + ' isSucceed : ' + (isSucceedTarget));
        done();
      }, 8000);
    });

    /**
    * @tc.number: CaptionConfiguration_0190
    * @tc.name: Call api:config to set the captionsStyle parameter.
    * @tc.desc: Call api:config to set the captionsStyle parameter.
    */    
    it('CaptionConfiguration_0190', 1, async function (done) {
      const caseName = "CaptionConfiguration_0190";
      const logF = LOG + caseName;
      setTimeout(() => {
        excuteCase(caseName);
      }, 2000);
      setTimeout(() => {
        var isSucceedTarget: boolean = false;
        if (backList.indexOf(caseName + '_on_target_change_extra_success') !== -1) {
          isSucceedTarget = true;
        }
        expect(isSucceedTarget).assertEqual(true);
        console.info(logF + ' isSucceed : ' + (isSucceedTarget));
        done();
      }, 8000);
    });

    /**
    * @tc.number: CaptionConfiguration_0200
    * @tc.name: Call api:config to set the captionsStyle parameter.
    * @tc.desc: Call api:config to set the captionsStyle parameter.
    */    
    it('CaptionConfiguration_0200', 1, async function (done) {
      const caseName = "CaptionConfiguration_0200";
      const logF = LOG + caseName;
      setTimeout(() => {
        excuteCase(caseName);
      }, 2000);
      setTimeout(() => {
        var isSucceedTarget: boolean = false;
        if (backList.indexOf(caseName + '_on_target_change_extra_success') !== -1) {
          isSucceedTarget = true;
        }
        expect(isSucceedTarget).assertEqual(true);
        console.info(logF + ' isSucceed : ' + (isSucceedTarget));
        done();
      }, 8000);
    });

    /**
    * @tc.number: CaptionConfiguration_0210
    * @tc.name: Call api:config to set the captionsStyle parameter.
    * @tc.desc: Call api:config to set the captionsStyle parameter.
    */    
    it('CaptionConfiguration_0210', 1, async function (done) {
      const caseName = "CaptionConfiguration_0210";
      const logF = LOG + caseName;
      setTimeout(() => {
        excuteCase(caseName);
      }, 2000);
      setTimeout(() => {
        var isSucceedTarget: boolean = false;
        if (backList.indexOf(caseName + '_on_target_change_extra_success') !== -1) {
          isSucceedTarget = true;
        }
        expect(isSucceedTarget).assertEqual(true);
        console.info(logF + ' isSucceed : ' + (isSucceedTarget));
        done();
      }, 8000);
    });

    /**
    * @tc.number: CaptionConfiguration_0220
    * @tc.name: Call api:config to set the captionsStyle parameter.
    * @tc.desc: Call api:config to set the captionsStyle parameter.
    */    
    it('CaptionConfiguration_0220', 1, async function (done) {
      const caseName = "CaptionConfiguration_0220";
      const logF = LOG + caseName;
      setTimeout(() => {
        excuteCase(caseName);
      }, 2000);
      setTimeout(() => {
        var isSucceedTarget: boolean = false;
        if (backList.indexOf(caseName + '_on_target_change_extra_success') !== -1) {
          isSucceedTarget = true;
        }
        expect(isSucceedTarget).assertEqual(true);
        console.info(logF + ' isSucceed : ' + (isSucceedTarget));
        done();
      }, 8000);
    });

    /**
    * @tc.number: CaptionConfiguration_0230
    * @tc.name: Call api:config to set the captionsStyle parameter.
    * @tc.desc: Call api:config to set the captionsStyle parameter.
    */    
    it('CaptionConfiguration_0230', 1, async function (done) {
      const caseName = "CaptionConfiguration_0230";
      const logF = LOG + caseName;
      setTimeout(() => {
        excuteCase(caseName);
      }, 2000);
      setTimeout(() => {
        var isSucceedTarget: boolean = false;
        if (backList.indexOf(caseName + '_on_target_change_extra_success') !== -1) {
          isSucceedTarget = true;
        }
        expect(isSucceedTarget).assertEqual(true);
        console.info(logF + ' isSucceed : ' + (isSucceedTarget));
        done();
      }, 8000);
    });

    /**
    * @tc.number: CaptionConfiguration_0240
    * @tc.name: Call api:config to set the captionsStyle parameter.
    * @tc.desc: Call api:config to set the captionsStyle parameter.
    */    
    it('CaptionConfiguration_0240', 1, async function (done) {
      const caseName = "CaptionConfiguration_0240";
      const logF = LOG + caseName;
      setTimeout(() => {
        excuteCase(caseName);
      }, 2000);
      setTimeout(() => {
        var isSucceedTarget: boolean = false;
        if (backList.indexOf(caseName + '_on_target_change_extra_success') !== -1) {
          isSucceedTarget = true;
        }
        expect(isSucceedTarget).assertEqual(true);
        console.info(logF + ' isSucceed : ' + (isSucceedTarget));
        done();
      }, 8000);
    });

    /**
    * @tc.number: CaptionConfiguration_0260
    * @tc.name: Call api:config to set the captionsStyle parameter.
    * @tc.desc: Call api:config to set the captionsStyle parameter.
    */
    it('CaptionConfiguration_0260', 1, async function (done) {
      const caseName = "CaptionConfiguration_0260";
      const logF = LOG + caseName;
      excuteCase(caseName);
      setTimeout(() => {
        var isSucceedTarget: boolean = false;
        if (backList.indexOf(caseName + '_on_target_change_extra_success') !== -1) {
          isSucceedTarget = true;
        }
        expect(isSucceedTarget).assertEqual(true);
        console.info(logF + ' isSucceed : ' + (isSucceedTarget));
        done();
      }, 8000);
    });


  })
}
