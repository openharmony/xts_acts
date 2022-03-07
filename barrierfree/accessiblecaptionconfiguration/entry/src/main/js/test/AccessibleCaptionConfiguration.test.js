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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'
import accessibility from '@ohos.accessibility'
//import accessibility from '@ohos.application.AccessibilityExtension'


describe('AccessibleCaptionConfiguration', function () {

  beforeEach(async function (done) {
    console.info(`AccessibleCaptionConfiguration: beforeEach starts`);
    let captionManager = accessibility.getCaptionsManager();
    captionManager.off("enableChange");
    captionManager.off("styleChange");
    done();
  })

  afterEach(async function (done) {
    console.info(`AccessibleCaptionConfiguration: afterEach starts`);
    let captionManager = accessibility.getCaptionsManager();
    captionManager.off("enableChange");
    captionManager.off("styleChange");
    setTimeout(done, 1000);
  })

  var CaptionsStyle = {
    fontFamily: "default",
    fontScale: 75,
    fontColor: "blue",
    fontEdgeType: "none",
    backgroundColor: "green",
    windowColor: "pink"
  }

  var StyleTest = {
    fontFamily: "monospacedSerif",
    fontScale: 99,
    fontColor: "red",
    fontEdgeType: "uniform",
    backgroundColor: "pink",
    windowColor: "green"
  }

  /*
   * @tc.number  CaptionConfiguration_0010
   * @tc.name    CaptionConfiguration_0010
   * @tc.desc    The parameter input is 'enableChange', test the captionManager.on() function,
   *             and return 'enable'
   * @tc.size    SmallTest
   * @tc.type    User
   */
  it('CaptionConfiguration_0010', 0, async function (done) {
    console.info('CaptionConfiguration_0010');
    let captionManager = accessibility.getCaptionsManager();
    captionManager.style = CaptionsStyle;
    captionManager.enabled = true;
    let stateEventType = 'enableChange';
    captionManager.on(stateEventType, (data) => {
      expect(data).assertEqual(false);
      done();
    });
    captionManager.enabled = false;
  })


  /*
   * @tc.number  CaptionConfiguration_0011
   * @tc.name    CaptionConfiguration_0011
   * @tc.desc    The parameter input is 'enableChange', test the captionManager.on() function,
   *             and return 'enable'
   * @tc.size    SmallTest
   * @tc.type    User
   */
  it('CaptionConfiguration_0011', 0, async function (done) {
    console.info('CaptionConfiguration_0011');
    let captionManager = accessibility.getCaptionsManager();
    let stateEventType = 'enableChange';
    captionManager.off(stateEventType);
    captionManager.style = CaptionsStyle;
    captionManager.enabled = false;
    captionManager.on(stateEventType, (data) => {
      expect(data).assertEqual(true);
      done();
    });
    captionManager.enabled = true;
  })

  /*
   * @tc.number  CaptionConfiguration_0020
   * @tc.name    CaptionConfiguration_0020
   * @tc.desc    The parameter input is 'styleChange', test the captionManager.on() function,
   *             and return 'style'
   * @tc.size    SmallTest
   * @tc.type    User
   */
  it('CaptionConfiguration_0020', 0, async function (done) {
    console.info('CaptionConfiguration_0020');
    let captionManager = accessibility.getCaptionsManager();
    captionManager.style = CaptionsStyle;
    let stateEventType = 'styleChange';
    captionManager.on(stateEventType, (data) => {
      expect(true).assertEqual(true);
      done();
    });
    captionManager.style = StyleTest;
  })

  /*
   * @tc.number  CaptionConfiguration_0021
   * @tc.name    CaptionConfiguration_0021
   * @tc.desc    The parameter input is 'styleChange', test the captionManager.on() function,
   *             and return 'style'
   * @tc.size    SmallTest
   * @tc.type    User
   */
  it('CaptionConfiguration_0021', 0, async function (done) {
    console.info('CaptionConfiguration_0021');
    let captionManager = accessibility.getCaptionsManager();
    captionManager.style = CaptionsStyle;
    let stateEventType = 'styleChange';
    captionManager.on(stateEventType, (data) => {
      expect(true).assertEqual(true);
      done();
    });
    captionManager.style.fontFamily = "smallCapitals";
  })

  /*
   * @tc.number  CaptionConfiguration_0022
   * @tc.name    CaptionConfiguration_0022
   * @tc.desc    The parameter input is 'styleChange', test the captionManager.on() function,
   *             and return 'style'
   * @tc.size    SmallTest
   * @tc.type    User
   */
  it('CaptionConfiguration_0022', 0, async function (done) {
    console.info('CaptionConfiguration_0022');
    let captionManager = accessibility.getCaptionsManager();
    captionManager.style = CaptionsStyle;
    let stateEventType = 'styleChange';
    captionManager.on(stateEventType, (data) => {
      expect(true).assertEqual(true);
      done();
    });
    captionManager.style.fontScale = 99;
  })

  /*
   * @tc.number  CaptionConfiguration_0023
   * @tc.name    CaptionConfiguration_0023
   * @tc.desc    The parameter input is 'styleChange', test the captionManager.on() function,
   *             and return 'style'
   * @tc.size    SmallTest
   * @tc.type    User
   */
  it('CaptionConfiguration_0023', 0, async function (done) {
    console.info('CaptionConfiguration_0023');
    let captionManager = accessibility.getCaptionsManager();
    captionManager.style = CaptionsStyle;
    let stateEventType = 'styleChange';
    captionManager.on(stateEventType, (data) => {
      expect(true).assertEqual(true);
      done();
    });
    captionManager.style.fontColor = "TmepfontColor";
  })

  /*
   * @tc.number  CaptionConfiguration_0024
   * @tc.name    CaptionConfiguration_0024
   * @tc.desc    The parameter input is 'styleChange', test the captionManager.on() function,
   *             and return 'style'
   * @tc.size    SmallTest
   * @tc.type    User
   */
  it('CaptionConfiguration_0024', 0, async function (done) {
    console.info('CaptionConfiguration_0024');
    let captionManager = accessibility.getCaptionsManager();
    captionManager.style = CaptionsStyle;
    let stateEventType = 'styleChange';
    captionManager.on(stateEventType, (data) => {
      expect(true).assertEqual(true);
      done();
    });
    captionManager.style.fontEdgeType = "dropShadow";
  })

  /*
   * @tc.number  CaptionConfiguration_0025
   * @tc.name    CaptionConfiguration_0025
   * @tc.desc    The parameter input is 'styleChange', test the captionManager.on() function,
   *             and return 'style'
   * @tc.size    SmallTest
   * @tc.type    User
   */
  it('CaptionConfiguration_0025', 0, async function (done) {
    console.info('CaptionConfiguration_0025');
    let captionManager = accessibility.getCaptionsManager();
    captionManager.style = CaptionsStyle;
    let stateEventType = 'styleChange';
    captionManager.on(stateEventType, (data) => {
      expect(true).assertEqual(true);
      done();
    });
    captionManager.style.backgroundColor = "TmepbackgroundColor";
  })

  /*
   * @tc.number  CaptionConfiguration_0026
   * @tc.name    CaptionConfiguration_0026
   * @tc.desc    The parameter input is 'styleChange', test the captionManager.on() function,
   *             and return 'style'
   * @tc.size    SmallTest
   * @tc.type    User
   */
  it('CaptionConfiguration_0026', 0, async function (done) {
    console.info('CaptionConfiguration_0026');
    let captionManager = accessibility.getCaptionsManager();
    captionManager.style = CaptionsStyle;
    let stateEventType = 'styleChange';
    captionManager.on(stateEventType, (data) => {
      expect(true).assertEqual(true);
      done();
    });
    captionManager.style.windowColor = "TmepwindowColor";
  })


  /*
   * @tc.number  CaptionConfiguration_0030
   * @tc.name    CaptionConfiguration_0030
   * @tc.desc    The parameter input is 'enableChange', test the captionManager.off() function,
   *             and return true
   * @tc.size    SmallTest
   * @tc.type    User
   */
  it('CaptionConfiguration_0030', 0, async function (done) {
    console.info('CaptionConfiguration_0030');
    let stateEventType = 'enableChange';
    let captionManager = accessibility.getCaptionsManager();
    captionManager.off(stateEventType);
    captionManager.enabled = false;
    captionManager.on(stateEventType, (data) => {
      let ret = false;
      expect(ret).assertEqual(true);
    });
    let ret = captionManager.off(stateEventType);
    captionManager.enabled = true;
    expect(true).assertEqual(true);
    done();
  })

  /*
   * @tc.number  CaptionConfiguration_0031
   * @tc.name    CaptionConfiguration_0031
   * @tc.desc    The parameter input is 'enableChange', test the captionManager.off() function,
   *             and return true
   * @tc.size    SmallTest
   * @tc.type    User
   */
  it('CaptionConfiguration_0031', 0, async function (done) {
    console.info('CaptionConfiguration_0031');
    let stateEventType = 'enableChange';
    let captionManager = accessibility.getCaptionsManager();
    captionManager.off(stateEventType);
    captionManager.enabled = true;
    captionManager.on(stateEventType, (data) => {
      let ret = false;
      expect(ret).assertEqual(true);
    });
    captionManager.off(stateEventType, (data) => {
      expect(data).assertEqual(true);
    });
    captionManager.enabled = false;

    expect(true).assertEqual(true);
    done();
  })

  /*
   * @tc.number  CaptionConfiguration_0032
   * @tc.name    CaptionConfiguration_0032
   * @tc.desc    The parameter input is 'enableChange', test the captionManager.off() function,
   *             and return true
   * @tc.size    SmallTest
   * @tc.type    User
   */
  it('CaptionConfiguration_0032', 0, async function (done) {
    console.info('CaptionConfiguration_0032');
    let stateEventType = 'enableChange';
    let captionManager = accessibility.getCaptionsManager();
    captionManager.off(stateEventType);
    captionManager.enabled = true;
    captionManager.on(stateEventType, (data) => {
      expect(true).assertEqual(true);
      done();
    });
    captionManager.off("ERROR", (data) => {
      expect(data).assertEqual(false);
      done();
    });
  })

  /*
   * @tc.number  CaptionConfiguration_0040
   * @tc.name    CaptionConfiguration_0040
   * @tc.desc    The parameter input is 'styleChange', test the captionManager.off() function,
   *             and return true
   * @tc.size    SmallTest
   * @tc.type    User
   */
  it('CaptionConfiguration_0040', 0, async function (done) {
    console.info('CaptionConfiguration_0040');
    let stateEventType = 'styleChange';
    let captionManager = accessibility.getCaptionsManager();
    captionManager.off(stateEventType);
    captionManager.on(stateEventType, (data) => {
      let ret = false;
      expect(ret).assertEqual(true);
    });
    captionManager.off(stateEventType);
    captionManager.style = StyleTest;
    done();
  })

  /*
   * @tc.number  CaptionConfiguration_0041
   * @tc.name    CaptionConfiguration_0041
   * @tc.desc    The parameter input is 'styleChange', test the captionManager.off() function,
   *             and return true
   * @tc.size    SmallTest
   * @tc.type    User
   */
  it('CaptionConfiguration_0041', 0, async function (done) {
    console.info('CaptionConfiguration_0041');
    let stateEventType = 'styleChange';
    let captionManager = accessibility.getCaptionsManager();
    captionManager.off(stateEventType);
    captionManager.on(stateEventType, (data) => {
      let ret = false;
      expect(ret).assertEqual(true);
    });
    captionManager.off(stateEventType, (data) => {
    expect(data.fontFamily).assertEqual(StyleTest.fontFamily);
    expect(data.fontScale).assertEqual(StyleTest.fontScale);
    expect(data.fontColor).assertEqual(StyleTest.fontColor);
    expect(data.fontEdgeType).assertEqual(StyleTest.fontEdgeType);
    expect(data.backgroundColor).assertEqual(StyleTest.backgroundColor);
    expect(data.windowColor).assertEqual(StyleTest.windowColor);
    });
    captionManager.style = CaptionsStyle;
    done();
  })

  /*
   * @tc.number  CaptionConfiguration_0042
   * @tc.name    CaptionConfiguration_0042
   * @tc.desc    The parameter input is 'styleChange', test the captionManager.off() function,
   *             and return true
   * @tc.size    SmallTest
   * @tc.type    User
   */
  it('CaptionConfiguration_0042', 0, async function (done) {
    console.info('CaptionConfiguration_0042');
    let stateEventType = 'styleChange';
    let captionManager = accessibility.getCaptionsManager();
    captionManager.off(stateEventType);
    captionManager.on(stateEventType, (data) => {
    });
    captionManager.off("ERROR", (data) => {
      expect(data).assertEqual(false);
      done();
    });
  })

  /*
   * @tc.number  CaptionConfiguration_0050
   * @tc.name    CaptionConfiguration_0050
   * @tc.desc    Test getCaptionsManager() function by modifying fontFamily.
   *             Return CaptionsManager.
   * @tc.size    SmallTest
   * @tc.type    User
   */
  it('CaptionConfiguration_0050', 0, async function (done) {
    console.info('CaptionConfiguration_0050');
    let captionManager = accessibility.getCaptionsManager();
    let fontFamily = "default";
    captionManager.style.fontFamily = fontFamily;
    let value = captionManager.style.fontFamily;
    expect(value).assertEqual(fontFamily);
    done();
  })

  /*
   * @tc.number  CaptionConfiguration_0051
   * @tc.name    CaptionConfiguration_0051
   * @tc.desc    Test getCaptionsManager() function by modifying fontFamily.
   *             Return CaptionsManager.
   * @tc.size    SmallTest
   * @tc.type    User
   */
  it('CaptionConfiguration_0051', 0, async function (done) {
    console.info('CaptionConfiguration_0051');
    let captionManager = accessibility.getCaptionsManager();
    let fontFamily = "monospacedSerif";
    captionManager.style.fontFamily = fontFamily;
    let value = captionManager.style.fontFamily;
    expect(value).assertEqual(fontFamily);
    done();
  })

  /*
   * @tc.number  CaptionConfiguration_0052
   * @tc.name    CaptionConfiguration_0052
   * @tc.desc    Test getCaptionsManager() function by modifying fontFamily.
   *             Return CaptionsManager.
   * @tc.size    SmallTest
   * @tc.type    User
   */
  it('CaptionConfiguration_0052', 0, async function (done) {
    console.info('CaptionConfiguration_0052');
    let captionManager = accessibility.getCaptionsManager();
    let fontFamily = "serif";
    captionManager.style.fontFamily = fontFamily;
    let value = captionManager.style.fontFamily;
    expect(value).assertEqual(fontFamily);
    done();
  })

  /*
   * @tc.number  CaptionConfiguration_0053
   * @tc.name    CaptionConfiguration_0053
   * @tc.desc    Test getCaptionsManager() function by modifying fontFamily.
   *             Return CaptionsManager.
   * @tc.size    SmallTest
   * @tc.type    User
   */
  it('CaptionConfiguration_0053', 0, async function (done) {
    console.info('CaptionConfiguration_0053');
    let captionManager = accessibility.getCaptionsManager();
    let fontFamily = "monospacedSansSerif";
    captionManager.style.fontFamily = fontFamily;
    let value = captionManager.style.fontFamily;
    expect(value).assertEqual(fontFamily);
    done();
  })

  /*
   * @tc.number  CaptionConfiguration_0054
   * @tc.name    CaptionConfiguration_0054
   * @tc.desc    Test getCaptionsManager() function by modifying fontFamily.
   *             Return CaptionsManager.
   * @tc.size    SmallTest
   * @tc.type    User
   */
  it('CaptionConfiguration_0054', 0, async function (done) {
    console.info('CaptionConfiguration_0054');
    let captionManager = accessibility.getCaptionsManager();
    let fontFamily = "sansSerif";
    captionManager.style.fontFamily = fontFamily;
    let value = captionManager.style.fontFamily;
    expect(value).assertEqual(fontFamily);
    done();
  })

  /*
   * @tc.number  CaptionConfiguration_0055
   * @tc.name    CaptionConfiguration_0055
   * @tc.desc    Test getCaptionsManager() function by modifying fontFamily.
   *             Return CaptionsManager.
   * @tc.size    SmallTest
   * @tc.type    User
   */
  it('CaptionConfiguration_0055', 0, async function (done) {
    console.info('CaptionConfiguration_0055');
    let captionManager = accessibility.getCaptionsManager();
    let fontFamily = "casual";
    captionManager.style.fontFamily = fontFamily;
    let value = captionManager.style.fontFamily;
    expect(value).assertEqual(fontFamily);
    done();
  })

  /*
   * @tc.number  CaptionConfiguration_0056
   * @tc.name    CaptionConfiguration_0056
   * @tc.desc    Test getCaptionsManager() function by modifying fontFamily.
   *             Return CaptionsManager.
   * @tc.size    SmallTest
   * @tc.type    User
   */
  it('CaptionConfiguration_0056', 0, async function (done) {
    console.info('CaptionConfiguration_0056');
    let captionManager = accessibility.getCaptionsManager();
    let fontFamily = "cursive";
    captionManager.style.fontFamily = fontFamily;
    let value = captionManager.style.fontFamily;
    expect(value).assertEqual(fontFamily);
    done();
  })

  /*
   * @tc.number  CaptionConfiguration_0057
   * @tc.name    CaptionConfiguration_0057
   * @tc.desc    Test getCaptionsManager() function by modifying fontFamily.
   *             Return CaptionsManager.
   * @tc.size    SmallTest
   * @tc.type    User
   */
  it('CaptionConfiguration_0057', 0, async function (done) {
    console.info('CaptionConfiguration_0057');
    let captionManager = accessibility.getCaptionsManager();
    let fontFamily = "smallCapitals";
    captionManager.style.fontFamily = fontFamily;
    let value = captionManager.style.fontFamily;
    expect(value).assertEqual(fontFamily);
    done();
  })

  /*
   * @tc.number  CaptionConfiguration_0058
   * @tc.name    CaptionConfiguration_0058
   * @tc.desc    Test getCaptionsManager() function by modifying fontFamily.
   *             Return CaptionsManager.
   * @tc.size    SmallTest
   * @tc.type    User
   */
  it('CaptionConfiguration_0058', 0, async function (done) {
    console.info('CaptionConfiguration_0058');
    let captionManager = accessibility.getCaptionsManager();
    let fontFamily = "none";
    captionManager.style.fontFamily = fontFamily;
    let value = captionManager.style.fontFamily;
    expect(value).assertEqual(fontFamily);
    done();
  })

  /*
   * @tc.number  CaptionConfiguration_0059
   * @tc.name    CaptionConfiguration_0059
   * @tc.desc    Test getCaptionsManager() function by modifying fontFamily.
   *             Return CaptionsManager.
   * @tc.size    SmallTest
   * @tc.type    User
   */
  it('CaptionConfiguration_0059', 0, async function (done) {
    console.info('CaptionConfiguration_0059');
    let captionManager = accessibility.getCaptionsManager();
    let fontFamily = "";
    captionManager.style.fontFamily = fontFamily;
    let value = captionManager.style.fontFamily;
    expect(value).assertEqual(fontFamily);
    done();
  })

  /*
   * @tc.number  CaptionConfiguration_0060
   * @tc.name    CaptionConfiguration_0060
   * @tc.desc    Test getCaptionsManager() function by modifying fontScale.
   *             Return CaptionsManager.
   * @tc.size    SmallTest
   * @tc.type    User
   */
  it('CaptionConfiguration_0060', 0, async function (done) {
    console.info('CaptionConfiguration_0060');
    let captionManager = accessibility.getCaptionsManager();
    let fontScale =9007199254740992;
    captionManager.style.fontScale = fontScale;
    let value = captionManager.style.fontScale;
    expect(value).assertEqual(0);
    done();
  })

  /*
   * @tc.number  CaptionConfiguration_0061
   * @tc.name    CaptionConfiguration_0061
   * @tc.desc    Test getCaptionsManager() function by modifying fontScale.
   *             Return CaptionsManager.
   * @tc.size    SmallTest
   * @tc.type    User
   */
  it('CaptionConfiguration_0061', 0, async function (done) {
    console.info('CaptionConfiguration_0061');
    let captionManager = accessibility.getCaptionsManager();
    let fontScale =0;
    captionManager.style.fontScale = fontScale;
    let value = captionManager.style.fontScale;
    expect(value).assertEqual(fontScale);
    done();
  })

  /*
   * @tc.number  CaptionConfiguration_0062
   * @tc.name    CaptionConfiguration_0062
   * @tc.desc    Test getCaptionsManager() function by modifying fontScale.
   *             Return CaptionsManager.
   * @tc.size    SmallTest
   * @tc.type    User
   */
  it('CaptionConfiguration_0062', 0, async function (done) {
    console.info('CaptionConfiguration_0062');
    let captionManager = accessibility.getCaptionsManager();
    let fontScale =-1;
    captionManager.style.fontScale = fontScale;
    let value = captionManager.style.fontScale;
    expect(value).assertEqual(-1);
    done();
  })

  /*
   * @tc.number  CaptionConfiguration_0070
   * @tc.name    CaptionConfiguration_0070
   * @tc.desc    Test getCaptionsManager() function by modifying fontColor.
   *             Return CaptionsManager.
   * @tc.size    SmallTest
   * @tc.type    User
   */
  it('CaptionConfiguration_0070', 0, async function (done) {
    console.info('CaptionConfiguration_0070');
    let captionManager = accessibility.getCaptionsManager();
    let fontColor ="TmepfontColor";
    captionManager.style.fontColor = fontColor;
    let value = captionManager.style.fontColor;
    expect(value).assertEqual(fontColor);
    done();
  })

  /*
   * @tc.number  CaptionConfiguration_0071
   * @tc.name    CaptionConfiguration_0071
   * @tc.desc    Test getCaptionsManager() function by modifying fontColor.
   *             Return CaptionsManager.
   * @tc.size    SmallTest
   * @tc.type    User
   */
  it('CaptionConfiguration_0071', 0, async function (done) {
    console.info('CaptionConfiguration_0071');
    let captionManager = accessibility.getCaptionsManager();
    let fontColor ="none";
    captionManager.style.fontColor = fontColor;
    let value = captionManager.style.fontColor;
    expect(value).assertEqual(fontColor);
    done();
  })

  /*
   * @tc.number  CaptionConfiguration_0072
   * @tc.name    CaptionConfiguration_0072
   * @tc.desc    Test getCaptionsManager() function by modifying fontColor.
   *             Return CaptionsManager.
   * @tc.size    SmallTest
   * @tc.type    User
   */
  it('CaptionConfiguration_0072', 0, async function (done) {
    console.info('CaptionConfiguration_0072');
    let captionManager = accessibility.getCaptionsManager();
    let fontColor ="";
    captionManager.style.fontColor = fontColor;
    let value = captionManager.style.fontColor;
    expect(value).assertEqual(fontColor);
    done();
  })

  /*
   * @tc.number  CaptionConfiguration_0080
   * @tc.name    CaptionConfiguration_0080
   * @tc.desc    Test getCaptionsManager() function by modifying fontEdgeType.
   *             Return CaptionsManager.
   * @tc.size    SmallTest
   * @tc.type    User
   */
  it('CaptionConfiguration_0080', 0, async function (done) {
    console.info('CaptionConfiguration_0080');
    let captionManager = accessibility.getCaptionsManager();
    let fontEdgeType ="none";
    captionManager.style.fontEdgeType = fontEdgeType;
    let value = captionManager.style.fontEdgeType;
    expect(value).assertEqual(fontEdgeType);
    done();
  })

  /*
   * @tc.number  CaptionConfiguration_0081
   * @tc.name    CaptionConfiguration_0081
   * @tc.desc    Test getCaptionsManager() function by modifying fontEdgeType.
   *             Return CaptionsManager.
   * @tc.size    SmallTest
   * @tc.type    User
   */
  it('CaptionConfiguration_0081', 0, async function (done) {
    console.info('CaptionConfiguration_0081');
    let captionManager = accessibility.getCaptionsManager();
    let fontEdgeType ="raised";
    captionManager.style.fontEdgeType = fontEdgeType;
    let value = captionManager.style.fontEdgeType;
    expect(value).assertEqual(fontEdgeType);
    done();
  })

  /*
   * @tc.number  CaptionConfiguration_0082
   * @tc.name    CaptionConfiguration_0082
   * @tc.desc    Test getCaptionsManager() function by modifying fontEdgeType.
   *             Return CaptionsManager.
   * @tc.size    SmallTest
   * @tc.type    User
   */
  it('CaptionConfiguration_0082', 0, async function (done) {
    console.info('CaptionConfiguration_0082');
    let captionManager = accessibility.getCaptionsManager();
    let fontEdgeType ="depressed";
    captionManager.style.fontEdgeType = fontEdgeType;
    let value = captionManager.style.fontEdgeType;
    expect(value).assertEqual(fontEdgeType);
    done();
  })

  /*
   * @tc.number  CaptionConfiguration_0083
   * @tc.name    CaptionConfiguration_0083
   * @tc.desc    Test getCaptionsManager() function by modifying fontEdgeType.
   *             Return CaptionsManager.
   * @tc.size    SmallTest
   * @tc.type    User
   */
  it('CaptionConfiguration_0083', 0, async function (done) {
    console.info('CaptionConfiguration_0083');
    let captionManager = accessibility.getCaptionsManager();
    let fontEdgeType ="uniform";
    captionManager.style.fontEdgeType = fontEdgeType;
    let value = captionManager.style.fontEdgeType;
    expect(value).assertEqual(fontEdgeType);
    done();
  })

  /*
   * @tc.number  CaptionConfiguration_0084
   * @tc.name    CaptionConfiguration_0084
   * @tc.desc    Test getCaptionsManager() function by modifying fontEdgeType.
   *             Return CaptionsManager.
   * @tc.size    SmallTest
   * @tc.type    User
   */
  it('CaptionConfiguration_0084', 0, async function (done) {
    console.info('CaptionConfiguration_0084');
    let captionManager = accessibility.getCaptionsManager();
    let fontEdgeType ="dropShadow";
    captionManager.style.fontEdgeType = fontEdgeType;
    let value = captionManager.style.fontEdgeType;
    expect(value).assertEqual(fontEdgeType);
    done();
  })

  /*
   * @tc.number  CaptionConfiguration_0085
   * @tc.name    CaptionConfiguration_0085
   * @tc.desc    Test getCaptionsManager() function by modifying fontEdgeType.
   *             Return CaptionsManager.
   * @tc.size    SmallTest
   * @tc.type    User
   */
  it('CaptionConfiguration_0085', 0, async function (done) {
    console.info('CaptionConfiguration_0085');
    let captionManager = accessibility.getCaptionsManager();
    let fontEdgeType ="";
    captionManager.style.fontEdgeType = fontEdgeType;
    let value = captionManager.style.fontEdgeType;
    expect(value).assertEqual(fontEdgeType);
    done();
  })

  /*
   * @tc.number  CaptionConfiguration_0090
   * @tc.name    CaptionConfiguration_0090
   * @tc.desc    Test getCaptionsManager() function by modifying backgroundColor.
   *             Return CaptionsManager.
   * @tc.size    SmallTest
   * @tc.type    User
   */
  it('CaptionConfiguration_0090', 0, async function (done) {
    console.info('CaptionConfiguration_0090');
    let captionManager = accessibility.getCaptionsManager();
    let backgroundColor ="TmepbackgroundColor";
    captionManager.style.backgroundColor = backgroundColor;
    let value = captionManager.style.backgroundColor;
    expect(value).assertEqual(backgroundColor);
    done();
  })

  /*
   * @tc.number  CaptionConfiguration_0091
   * @tc.name    CaptionConfiguration_0091
   * @tc.desc    Test getCaptionsManager() function by modifying backgroundColor.
   *             Return CaptionsManager.
   * @tc.size    SmallTest
   * @tc.type    User
   */
  it('CaptionConfiguration_0091', 0, async function (done) {
    console.info('CaptionConfiguration_0091');
    let captionManager = accessibility.getCaptionsManager();
    let backgroundColor ="none";
    captionManager.style.backgroundColor = backgroundColor;
    let value = captionManager.style.backgroundColor;
    expect(value).assertEqual(backgroundColor);
    done();
  })

  /*
   * @tc.number  CaptionConfiguration_0092
   * @tc.name    CaptionConfiguration_0092
   * @tc.desc    Test getCaptionsManager() function by modifying backgroundColor.
   *             Return CaptionsManager.
   * @tc.size    SmallTest
   * @tc.type    User
   */
  it('CaptionConfiguration_0092', 0, async function (done) {
    console.info('CaptionConfiguration_0092');
    let captionManager = accessibility.getCaptionsManager();
    let backgroundColor ="";
    captionManager.style.backgroundColor = backgroundColor;
    let value = captionManager.style.backgroundColor;
    expect(value).assertEqual(backgroundColor);
    done();
  })

  /*
   * @tc.number  CaptionConfiguration_0100
   * @tc.name    CaptionConfiguration_0100
   * @tc.desc    Test getCaptionsManager() function by modifying windowColor.
   *             Return CaptionsManager.
   * @tc.size    SmallTest
   * @tc.type    User
   */
  it('CaptionConfiguration_0100', 0, async function (done) {
    console.info('CaptionConfiguration_0100');
    let captionManager = accessibility.getCaptionsManager();
    let windowColor ="TmepwindowColor";
    captionManager.style.windowColor = windowColor;
    let value = captionManager.style.windowColor;
    expect(value).assertEqual(windowColor);
    done();
  })

  /*
   * @tc.number  CaptionConfiguration_0101
   * @tc.name    CaptionConfiguration_0101
   * @tc.desc    Test getCaptionsManager() function by modifying windowColor.
   *             Return CaptionsManager.
   * @tc.size    SmallTest
   * @tc.type    User
   */
  it('CaptionConfiguration_0101', 0, async function (done) {
    console.info('CaptionConfiguration_0101');
    let captionManager = accessibility.getCaptionsManager();
    let windowColor ="none";
    captionManager.style.windowColor = windowColor;
    let value = captionManager.style.windowColor;
    expect(value).assertEqual(windowColor);
    done();
  })

  /*
   * @tc.number  CaptionConfiguration_0102
   * @tc.name    CaptionConfiguration_0102
   * @tc.desc    Test getCaptionsManager() function by modifying windowColor.
   *             Return CaptionsManager.
   * @tc.size    SmallTest
   * @tc.type    User
   */
  it('CaptionConfiguration_0102', 0, async function (done) {
    console.info('CaptionConfiguration_0102');
    let captionManager = accessibility.getCaptionsManager();
    let windowColor ="";
    captionManager.style.windowColor = windowColor;
    let value = captionManager.style.windowColor;
    expect(value).assertEqual(windowColor);
    done();
  })

  /*
   * @tc.number  CaptionConfiguration_0110
   * @tc.name    CaptionConfiguration_0110
   * @tc.desc    Test getCaptionsManager() function by modifying style.
   *             Return CaptionsManager.
   * @tc.size    SmallTest
   * @tc.type    User
   */
  it('CaptionConfiguration_0110', 0, async function (done) {
    console.info('CaptionConfiguration_0110');
    let captionManager = accessibility.getCaptionsManager();
    let StyleTest = {
      fontFamily: "monospacedSerif",
      fontScale: 99,
      fontColor: "red",
      fontEdgeType: "uniform",
      backgroundColor: "pink",
      windowColor: "green"
    };
    captionManager.style = StyleTest;
    let value = captionManager.style;
    expect(value.fontFamily).assertEqual(StyleTest.fontFamily);
    expect(value.fontScale).assertEqual(StyleTest.fontScale);
    expect(value.fontColor).assertEqual(StyleTest.fontColor);
    expect(value.fontEdgeType).assertEqual(StyleTest.fontEdgeType);
    expect(value.backgroundColor).assertEqual(StyleTest.backgroundColor);
    expect(value.windowColor).assertEqual(StyleTest.windowColor);
    done();
  })

  /*
   * @tc.number  CaptionConfiguration_0111
   * @tc.name    CaptionConfiguration_0111
   * @tc.desc    Test getCaptionsManager() function by modifying style.
   *             Return CaptionsManager.
   * @tc.size    SmallTest
   * @tc.type    User
   */
  it('CaptionConfiguration_0111', 0, async function (done) {
    console.info('CaptionConfiguration_0111');
    let captionManager = accessibility.getCaptionsManager();
    let StyleTest = {
      fontFamily: "default",
      fontScale: 75,
      fontColor: "blue",
      fontEdgeType: "none",
      backgroundColor: "green",
      windowColor: "pink"
    };
    captionManager.style = StyleTest;
    let value = captionManager.style;
    expect(value.fontFamily).assertEqual(StyleTest.fontFamily);
    expect(value.fontScale).assertEqual(StyleTest.fontScale);
    expect(value.fontColor).assertEqual(StyleTest.fontColor);
    expect(value.fontEdgeType).assertEqual(StyleTest.fontEdgeType);
    expect(value.backgroundColor).assertEqual(StyleTest.backgroundColor);
    expect(value.windowColor).assertEqual(StyleTest.windowColor);
    done();
  })

})
