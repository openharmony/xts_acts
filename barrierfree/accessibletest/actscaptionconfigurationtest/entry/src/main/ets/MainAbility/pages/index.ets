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
import file from '@system.file';
import commonEvent from '@ohos.commonEvent'
import accessibility from '@ohos.accessibility';
import config from '@ohos.accessibility.config'

export { };
const LOG: string = "[xtsLog]";

const CaptionConfiguration_0270 = () => {
  const caseName = "CaptionConfiguration_0270"
  const logTag = LOG + caseName;
  config.captions.get().then((res) => {
    console.info(logTag + "Config before modification. enabled=" + res);
    config.captions.set(!res).then(() => {
      console.info(logTag + "Config after modification. enabled=" + !res);
      commonEventPublishOnTargetChangeExtra(caseName);
    }).catch((err) => {
      console.info(logTag + "caption set err=" + JSON.stringify(err));
    });
  });
}

const printCaptionsManagerStyle = (logTag, captionsManager) => {
  const back = "{\"fontFamily\":\"" + captionsManager.style.fontFamily +
    "\",\"fontScale\":" + captionsManager.style.fontScale +
    ",\"fontColor\":\"" + captionsManager.style.fontColor +
    "\",\"fontEdgeType\":\"" + captionsManager.style.fontEdgeType +
    "\",\"backgroundColor\":\"" + captionsManager.style.backgroundColor +
    "\",\"windowColor\":\"" + captionsManager.style.windowColor + "\"}";
  console.info(logTag + back);
  return back;
};

const printCaptionStyle = (logTag, CaptionStyle) => {
  const back = "{\"fontFamily\":\"" + CaptionStyle.fontFamily +
    "\",\"fontScale\":" + CaptionStyle.fontScale +
    ",\"fontColor\":\"" + CaptionStyle.fontColor +
    "\",\"fontEdgeType\":\"" + CaptionStyle.fontEdgeType +
    "\",\"backgroundColor\":\"" + CaptionStyle.backgroundColor +
    "\",\"windowColor\":\"" + CaptionStyle.windowColor + "\"}";
  console.info(logTag + back);
  return back;
};

const foreachList = (currValue, array) => {
  if (!currValue || currValue.length < 1) {
    return array[0];
  }
  let result = array[0];
  array.forEach((value, index) => {
    if (currValue === value) {
      if (array.length > index + 1) {
        result = array[index + 1];
      }
    }
  });
  return result;
}

const CaptionConfiguration_0280 = () => {
  const caseName = "CaptionConfiguration_0280"
  const logTag = LOG + caseName;
  config.captionsStyle.get().then((res) => {
    if (!res) {
      console.info(logTag + "captionsStyle is undefined");
      return;
    }
    var captionsStyle = res;
    printCaptionStyle(logTag + "captionsStyle before modification. style=", JSON.stringify(res));
    captionsStyle.fontFamily = foreachList(res.fontFamily, ['default', 'monospacedSerif', 'serif',
      'monospacedSansSerif', 'sansSerif', 'casual', 'cursive', 'smallCapitals']);
    printCaptionStyle(logTag + "captionsStyle after modification. style=", JSON.stringify(captionsStyle));
    config.captionsStyle.set(captionsStyle).then(() => {
      commonEventPublishOnTargetChangeExtra(caseName);
    }).catch((err) => {
      console.info(logTag + "captionsStyle fontFamily set err=" + JSON.stringify(err));
    });
  })
};

const CaptionConfiguration_0290 = () => {
  const caseName = "CaptionConfiguration_0290"
  const logTag = LOG + caseName;
  config.captions.get().then((res) => {
    console.info(logTag + "Config before modification. enabled=" + res);
    config.captions.set(!res).then(() => {
      console.info(logTag + "Config after modification. enabled=" + !res);
      commonEventPublishOnTargetChangeExtra(caseName);
    }).catch((err) => {
      console.info(logTag + "caption set err=" + JSON.stringify(err));
    });
  });
}

const CaptionConfiguration_0300 = () => {
  const caseName = "CaptionConfiguration_0300"
  const logTag = LOG + caseName;
  config.captionsStyle.get().then((res) => {
    if (!res) {
      console.info(logTag + "captionsStyle is undefined");
      return;
    }
    var captionsStyle = res;
    printCaptionStyle(logTag + "captionsStyle before modification. style=", JSON.stringify(res));
    captionsStyle.fontFamily = foreachList(res.fontFamily, ['default', 'monospacedSerif', 'serif',
      'monospacedSansSerif', 'sansSerif', 'casual', 'cursive', 'smallCapitals']);
    printCaptionStyle(logTag + "captionsStyle after modification. style=", JSON.stringify(captionsStyle));
    config.captionsStyle.set(captionsStyle).then(() => {
      commonEventPublishOnTargetChangeExtra(caseName);
    }).catch((err) => {
      console.info(logTag + "captionsStyle fontFamily set err=" + JSON.stringify(err));
    });
  })
};

const CaptionConfiguration_0310 = () => {
  const caseName = "CaptionConfiguration_0310"
  const logTag = LOG + caseName;
  config.captionsStyle.get().then((res) => {
    if (!res) {
      console.info(logTag + "captionsStyle is undefined");
      return;
    }
    var captionsStyle = res;
    printCaptionStyle(logTag + "captionsStyle before modification. style=", JSON.stringify(res));
    captionsStyle.fontFamily = foreachList(res.fontFamily, ['default', 'monospacedSerif', 'serif',
      'monospacedSansSerif', 'sansSerif', 'casual', 'cursive', 'smallCapitals']);
    printCaptionStyle(logTag + "captionsStyle after modification. style=", JSON.stringify(captionsStyle));
    config.captionsStyle.set(captionsStyle).then(() => {
      commonEventPublishOnTargetChangeExtra(caseName);
    }).catch((err) => {
      console.info(logTag + "captionsStyle fontFamily set err=" + JSON.stringify(err));
    });
  })
};

const CaptionConfiguration_0320 = () => {
  const caseName = "CaptionConfiguration_0320"
  const logTag = LOG + caseName;
  config.captionsStyle.get().then((res) => {
    if (!res) {
      console.info(logTag + "captionsStyle is undefined");
      return;
    }
    var captionsStyle = res;
    printCaptionStyle(logTag + "captionsStyle before modification. style=", JSON.stringify(res));
    captionsStyle.fontScale = (res.fontScale ?? 0) + 1;
    printCaptionStyle(logTag + "captionsStyle after modification. style=", JSON.stringify(captionsStyle));
    config.captionsStyle.set(captionsStyle).then(() => {
      commonEventPublishOnTargetChangeExtra(caseName);
    }).catch((err) => {
      console.info(logTag + "captionsStyle fontFamily set err=" + JSON.stringify(err));
    });
  })
};

const CaptionConfiguration_0330 = () => {
  const caseName = "CaptionConfiguration_0330"
  const logTag = LOG + caseName;
  config.captionsStyle.get().then((res) => {
    if (!res) {
      console.info(logTag + "captionsStyle is undefined");
      return;
    }
    var captionsStyle = res;
    printCaptionStyle(logTag + "captionsStyle before modification. style=", JSON.stringify(res));
    captionsStyle.fontColor = foreachList(res.fontColor, ['red', 'yellow', 'blue', '#FFFFFF', '#000000', 'black', 'white']);
    printCaptionStyle(logTag + "captionsStyle after modification. style=", JSON.stringify(captionsStyle));
    config.captionsStyle.set(captionsStyle).then(() => {
      commonEventPublishOnTargetChangeExtra(caseName);
    }).catch((err) => {
      console.info(logTag + "captionsStyle fontFamily set err=" + JSON.stringify(err));
    });
  })
};

const CaptionConfiguration_0340 = () => {
  const caseName = "CaptionConfiguration_0340"
  const logTag = LOG + caseName;
  config.captionsStyle.get().then((res) => {
    if (!res) {
      console.info(logTag + "captionsStyle is undefined");
      return;
    }
    var captionsStyle = res;
    printCaptionStyle(logTag + "captionsStyle before modification. style=", JSON.stringify(res));
    captionsStyle.fontEdgeType = foreachList(res.fontEdgeType, ['none', 'raised', 'depressed', 'uniform', 'dropShadow']);
    printCaptionStyle(logTag + "captionsStyle after modification. style=", JSON.stringify(captionsStyle));
    config.captionsStyle.set(captionsStyle).then(() => {
      commonEventPublishOnTargetChangeExtra(caseName);
    }).catch((err) => {
      console.info(logTag + "captionsStyle fontFamily set err=" + JSON.stringify(err));
    });
  })
};

const CaptionConfiguration_0090 = () => {
  const caseName = "CaptionConfiguration_0090"
  const logTag = LOG + caseName;
  config.captionsStyle.get().then((res) => {
    if (!res) {
      console.info(logTag + "captionsStyle is undefined");
      return;
    }
    var captionsStyle = res;
    printCaptionStyle(logTag + "captionsStyle before modification. style=", JSON.stringify(res));
    captionsStyle.backgroundColor = foreachList(res.backgroundColor, ['red', 'yellow', 'blue', '#ff0000ff', '#ff000000', '#00000000', '#f0000000', 'black', 'white']);
    printCaptionStyle(logTag + "captionsStyle after modification. style=", JSON.stringify(captionsStyle));
    config.captionsStyle.set(captionsStyle).then(() => {
      commonEventPublishOnTargetChangeExtra(caseName);
    }).catch((err) => {
      console.info(logTag + "captionsStyle fontFamily set err=" + JSON.stringify(err));
    });
  })
};

const CaptionConfiguration_0100 = () => {
  const caseName = "CaptionConfiguration_0100"
  const logTag = LOG + caseName;
  config.captionsStyle.get().then((res) => {
    if (!res) {
      console.info(logTag + "captionsStyle is undefined");
      return;
    }
    var captionsStyle = res;
    printCaptionStyle(logTag + "captionsStyle before modification. style=", JSON.stringify(res));
    captionsStyle.windowColor = foreachList(res.windowColor, ['red', 'yellow', 'blue', '#ff0000ff', '#ff000000', '#00000000', '#f0000000', 'black', 'white']);
    printCaptionStyle(logTag + "captionsStyle after modification. style=", JSON.stringify(captionsStyle));
    config.captionsStyle.set(captionsStyle).then(() => {
      commonEventPublishOnTargetChangeExtra(caseName);
    }).catch((err) => {
      console.info(logTag + "captionsStyle fontFamily set err=" + JSON.stringify(err));
    });
  })
};

const CaptionConfiguration_0110 = () => {
  const caseName = "CaptionConfiguration_0110"
  const logTag = LOG + caseName;
  config.captionsStyle.get().then((res) => {
    if (!res) {
      console.info(logTag + "captionsStyle is undefined");
      return;
    }
    var captionsStyle = res;
    for (let index = 0; index < 3; index++) {
      printCaptionStyle(logTag + "captionsStyle before modification. style=", JSON.stringify(res));
      captionsStyle.windowColor = foreachList(res.windowColor, ['red', 'yellow', 'blue', '#ff0000ff', '#ff000000', '#00000000', '#f0000000', 'black', 'white']);
      printCaptionStyle(logTag + "captionsStyle after modification. style=", JSON.stringify(captionsStyle));
      config.captionsStyle.set(captionsStyle).then(() => {
        commonEventPublishOnTargetChangeExtra(caseName);
      }).catch((err) => {
        console.info(logTag + "captionsStyle fontFamily set err=" + JSON.stringify(err));
      });
    }
  })
};

const CaptionConfiguration_0120 = () => {
  const caseName = "CaptionConfiguration_0120"
  const logTag = LOG + caseName;
  config.captions.get().then((res) => {
    console.info(logTag + "Config before modification. enabled=" + res);
    config.captions.set(!res).then(() => {
      console.info(logTag + "Config after modification. enabled=" + !res);
      commonEventPublishOnTargetChangeExtra(caseName);
    }).catch((err) => {
      console.info(logTag + "caption set err=" + JSON.stringify(err));
    });
  });
};

const CaptionConfiguration_0130 = () => {
  const caseName = "CaptionConfiguration_0130"
  const logTag = LOG + caseName;
  config.captionsStyle.get().then((res) => {
    if (!res) {
      console.info(logTag + "captionsStyle is undefined");
      return;
    }
    var captionsStyle = res;
    printCaptionStyle(logTag + "captionsStyle before modification. style=", JSON.stringify(res));
    captionsStyle.fontEdgeType = undefined;
    printCaptionStyle(logTag + "captionsStyle after modification. style=", JSON.stringify(captionsStyle));
    config.captionsStyle.set(captionsStyle).then(() => {
      commonEventPublishOnTargetChangeExtra(caseName);
    }).catch((err) => {
      console.info(logTag + "captionsStyle fontFamily set err=" + JSON.stringify(err));
    });
  })
};

const CaptionConfiguration_0140 = () => {
  const caseName = "CaptionConfiguration_0140"
  const logTag = LOG + caseName;
  config.captions.get().then((res) => {
    console.info(logTag + "Config before modification. enabled=" + res);
    config.captions.set(!res).then(() => {
      console.info(logTag + "Config after modification. enabled=" + !res);
      commonEventPublishOnTargetChangeExtra(caseName);
    }).catch((err) => {
      console.info(logTag + "caption set err=" + JSON.stringify(err));
    });
  });
};

const CaptionConfiguration_0150 = () => {
  const caseName = "CaptionConfiguration_0150"
  const logTag = LOG + caseName;
  config.captionsStyle.get().then((res) => {
    if (!res) {
      console.info(logTag + "captionsStyle is undefined");
      return;
    }
    var captionsStyle = res;
    printCaptionStyle(logTag + "captionsStyle before modification. style=", JSON.stringify(res));
    captionsStyle.fontFamily = foreachList(res.fontFamily, ['default', 'monospacedSerif', 'serif',
      'monospacedSansSerif', 'sansSerif', 'casual', 'cursive', 'smallCapitals']);
    printCaptionStyle(logTag + "captionsStyle after modification. style=", JSON.stringify(captionsStyle));
    config.captionsStyle.set(captionsStyle).then(() => {
      commonEventPublishOnTargetChangeExtra(caseName);
    }).catch((err) => {
      console.info(logTag + "captionsStyle fontFamily set err=" + JSON.stringify(err));
    });
  })
};

const CaptionConfiguration_0160 = () => {
  const caseName = "CaptionConfiguration_0160"
  const logTag = LOG + caseName;
  config.captions.get().then((res) => {
    console.info(logTag + "Config before modification. enabled=" + res);
    config.captions.set(!res).then(() => {
      console.info(logTag + "Config after modification. enabled=" + !res);
      commonEventPublishOnTargetChangeExtra(caseName);
    }).catch((err) => {
      console.info(logTag + "caption set err=" + JSON.stringify(err));
    });
  });
};

const CaptionConfiguration_0170 = () => {
  const caseName = "CaptionConfiguration_0170"
  const logTag = LOG + caseName;
  config.captionsStyle.get().then((res) => {
    if (!res) {
      console.info(logTag + "captionsStyle is undefined");
      return;
    }
    var captionsStyle = res;
    printCaptionStyle(logTag + "captionsStyle before modification. style=", JSON.stringify(res));
    captionsStyle.fontFamily = foreachList(res.fontFamily, ['default', 'monospacedSerif', 'serif',
      'monospacedSansSerif', 'sansSerif', 'casual', 'cursive', 'smallCapitals']);
    printCaptionStyle(logTag + "captionsStyle after modification. style=", JSON.stringify(captionsStyle));
    config.captionsStyle.set(captionsStyle).then(() => {
      commonEventPublishOnTargetChangeExtra(caseName);
    }).catch((err) => {
      console.info(logTag + "captionsStyle fontFamily set err=" + JSON.stringify(err));
    });
  })
};

const CaptionConfiguration_0180 = () => {
  const caseName = "CaptionConfiguration_0180"
  const logTag = LOG + caseName;
  config.captionsStyle.get().then((res) => {
    if (!res) {
      console.info(logTag + "captionsStyle is undefined");
      return;
    }
    var captionsStyle = res;
    printCaptionStyle(logTag + "captionsStyle before modification. style=", JSON.stringify(res));
    captionsStyle.fontFamily = foreachList(res.fontFamily, ['default', 'monospacedSerif', 'serif',
      'monospacedSansSerif', 'sansSerif', 'casual', 'cursive', 'smallCapitals']);
    printCaptionStyle(logTag + "captionsStyle after modification. style=", JSON.stringify(captionsStyle));
    config.captionsStyle.set(captionsStyle).then(() => {
      commonEventPublishOnTargetChangeExtra(caseName);
    }).catch((err) => {
      console.info(logTag + "captionsStyle fontFamily set err=" + JSON.stringify(err));
    });
  })
};

const CaptionConfiguration_0190 = () => {
  const caseName = "CaptionConfiguration_0190"
  const logTag = LOG + caseName;
  config.captionsStyle.get().then((res) => {
    if (!res) {
      console.info(logTag + "captionsStyle is undefined");
      return;
    }
    var captionsStyle = res;
    printCaptionStyle(logTag + "captionsStyle before modification. style=", JSON.stringify(res));
    captionsStyle.fontScale = (res.fontScale ?? 0) + 1;
    printCaptionStyle(logTag + "captionsStyle after modification. style=", JSON.stringify(captionsStyle));
    config.captionsStyle.set(captionsStyle).then(() => {
      commonEventPublishOnTargetChangeExtra(caseName);
    }).catch((err) => {
      console.info(logTag + "captionsStyle fontFamily set err=" + JSON.stringify(err));
    });
  })
};

const CaptionConfiguration_0200 = () => {
  const caseName = "CaptionConfiguration_0200"
  const logTag = LOG + caseName;
  config.captionsStyle.get().then((res) => {
    if (!res) {
      console.info(logTag + "captionsStyle is undefined");
      return;
    }
    var captionsStyle = res;
    printCaptionStyle(logTag + "captionsStyle before modification. style=", JSON.stringify(res));
    captionsStyle.fontColor = foreachList(res.fontColor, ['red', 'yellow', 'blue', '#FFFFFF', '#000000', 'black', 'white']);
    printCaptionStyle(logTag + "captionsStyle after modification. style=", JSON.stringify(captionsStyle));
    config.captionsStyle.set(captionsStyle).then(() => {
      commonEventPublishOnTargetChangeExtra(caseName);
    }).catch((err) => {
      console.info(logTag + "captionsStyle fontFamily set err=" + JSON.stringify(err));
    });
  })
};

const CaptionConfiguration_0210 = () => {
  const caseName = "CaptionConfiguration_0210"
  const logTag = LOG + caseName;
  config.captionsStyle.get().then((res) => {
    if (!res) {
      console.info(logTag + "captionsStyle is undefined");
      return;
    }
    var captionsStyle = res;
    printCaptionStyle(logTag + "captionsStyle before modification. style=", JSON.stringify(res));
    captionsStyle.fontEdgeType = foreachList(res.fontEdgeType, ['none', 'raised', 'depressed', 'uniform', 'dropShadow']);
    printCaptionStyle(logTag + "captionsStyle after modification. style=", JSON.stringify(captionsStyle));
    config.captionsStyle.set(captionsStyle).then(() => {
      commonEventPublishOnTargetChangeExtra(caseName);
    }).catch((err) => {
      console.info(logTag + "captionsStyle fontFamily set err=" + JSON.stringify(err));
    });
  })
};

const CaptionConfiguration_0220 = () => {
  const caseName = "CaptionConfiguration_0220"
  const logTag = LOG + caseName;
  config.captionsStyle.get().then((res) => {
    if (!res) {
      console.info(logTag + "captionsStyle is undefined");
      return;
    }
    var captionsStyle = res;
    printCaptionStyle(logTag + "captionsStyle before modification. style=", JSON.stringify(res));
    captionsStyle.backgroundColor = foreachList(res.backgroundColor, ['red', 'yellow', 'blue', '#ff0000ff', '#ff000000', '#00000000', '#f0000000', 'black', 'white']);
    printCaptionStyle(logTag + "captionsStyle after modification. style=", JSON.stringify(captionsStyle));
    config.captionsStyle.set(captionsStyle).then(() => {
      commonEventPublishOnTargetChangeExtra(caseName);
    }).catch((err) => {
      console.info(logTag + "captionsStyle fontFamily set err=" + JSON.stringify(err));
    });
  })
};

const CaptionConfiguration_0230 = () => {
  const caseName = "CaptionConfiguration_0230"
  const logTag = LOG + caseName;
  config.captionsStyle.get().then((res) => {
    if (!res) {
      console.info(logTag + "captionsStyle is undefined");
      return;
    }
    var captionsStyle = res;
    printCaptionStyle(logTag + "captionsStyle before modification. style=", JSON.stringify(res));
    captionsStyle.windowColor = foreachList(res.windowColor, ['red', 'yellow', 'blue', '#ff0000ff', '#ff000000', '#00000000', '#f0000000', 'black', 'white']);
    printCaptionStyle(logTag + "captionsStyle after modification. style=", JSON.stringify(captionsStyle));
    config.captionsStyle.set(captionsStyle).then(() => {
      commonEventPublishOnTargetChangeExtra(caseName);
    }).catch((err) => {
      console.info(logTag + "captionsStyle fontFamily set err=" + JSON.stringify(err));
    });
  })
};

const CaptionConfiguration_0240 = () => {
  const caseName = "CaptionConfiguration_0240"
  const logTag = LOG + caseName;
  config.captionsStyle.get().then((res) => {
    if (!res) {
      console.info(logTag + "captionsStyle is undefined");
      return;
    }
    var captionsStyle = res;
    for (let index = 0; index < 3; index++) {
      printCaptionStyle(logTag + "captionsStyle before modification. style=", JSON.stringify(res));
      captionsStyle.windowColor = foreachList(res.windowColor, ['red', 'yellow', 'blue', '#ff0000ff', '#ff000000', '#00000000', '#f0000000', 'black', 'white']);
      printCaptionStyle(logTag + "captionsStyle after modification. style=", JSON.stringify(captionsStyle));
      config.captionsStyle.set(captionsStyle).then(() => {
        commonEventPublishOnTargetChangeExtra(caseName);
      }).catch((err) => {
        console.info(logTag + "captionsStyle fontFamily set err=" + JSON.stringify(err));
      });
    }
  })
};

const CaptionConfiguration_0260 = () => {
  const caseName = "CaptionConfiguration_0260"
  const logTag = LOG + caseName;
  config.captionsStyle.get().then((res) => {
    if (!res) {
      console.info(logTag + "captionsStyle is undefined");
      return;
    }
    var captionsStyle = res;
    printCaptionStyle(logTag + "captionsStyle before modification. style=", JSON.stringify(res));
    captionsStyle.fontEdgeType = undefined;
    printCaptionStyle(logTag + "captionsStyle after modification. style=", JSON.stringify(captionsStyle));
    config.captionsStyle.set(captionsStyle).then(() => {
      commonEventPublishOnTargetChangeExtra(caseName);
    }).catch((err) => {
      console.info(logTag + "captionsStyle fontFamily set err=" + JSON.stringify(err));
    });
  })
};

const commonEventPublishOnTargetChangeExtra = (caseName) => {
  function publishCallback(err) {
    console.info(LOG + caseName + " on_target_change_extra  publish call back result:" + JSON.stringify(err));
  }
  var commonEventPublishData = {
    data: caseName + "_on_target_change_extra_success",
  }
  commonEvent.publish("on_target_change_extra", commonEventPublishData, publishCallback);
}

const excuteAbility = (data) => {
  switch (data) {
    case "CaptionConfiguration_0270" + "_AccessibilityApp_start":
      CaptionConfiguration_0270()
      break;
    case "CaptionConfiguration_0280" + "_AccessibilityApp_start":
      CaptionConfiguration_0280()
      break;
    case "CaptionConfiguration_0290" + "_AccessibilityApp_start":
      CaptionConfiguration_0290()
      break;
    case "CaptionConfiguration_0300" + "_AccessibilityApp_start":
      CaptionConfiguration_0300()
      break;
    case "CaptionConfiguration_0310" + "_AccessibilityApp_start":
      CaptionConfiguration_0310()
      break;
    case "CaptionConfiguration_0320" + "_AccessibilityApp_start":
      CaptionConfiguration_0320()
      break;
    case "CaptionConfiguration_0330" + "_AccessibilityApp_start":
      CaptionConfiguration_0330()
      break;
    case "CaptionConfiguration_0340" + "_AccessibilityApp_start":
      CaptionConfiguration_0340()
      break;
    case "CaptionConfiguration_0090" + "_AccessibilityApp_start":
      CaptionConfiguration_0090()
      break;
    case "CaptionConfiguration_0100" + "_AccessibilityApp_start":
      CaptionConfiguration_0100()
      break;
    case "CaptionConfiguration_0110" + "_AccessibilityApp_start":
      CaptionConfiguration_0110()
      break;
    case "CaptionConfiguration_0120" + "_AccessibilityApp_start":
      CaptionConfiguration_0120()
      break;
    case "CaptionConfiguration_0130" + "_AccessibilityApp_start":
      CaptionConfiguration_0130()
      break;
    case "CaptionConfiguration_0140" + "_AccessibilityApp_start":
      CaptionConfiguration_0140()
      break;
    case "CaptionConfiguration_0150" + "_AccessibilityApp_start":
      CaptionConfiguration_0150()
      break;
    case "CaptionConfiguration_0160" + "_AccessibilityApp_start":
      CaptionConfiguration_0160()
      break;
    case "CaptionConfiguration_0170" + "_AccessibilityApp_start":
      CaptionConfiguration_0170()
      break;
    case "CaptionConfiguration_0180" + "_AccessibilityApp_start":
      CaptionConfiguration_0180()
      break;
    case "CaptionConfiguration_0190" + "_AccessibilityApp_start":
      CaptionConfiguration_0190()
      break;
    case "CaptionConfiguration_0200" + "_AccessibilityApp_start":
      CaptionConfiguration_0200()
      break;
    case "CaptionConfiguration_0210" + "_AccessibilityApp_start":
      CaptionConfiguration_0210()
      break;
    case "CaptionConfiguration_0220" + "_AccessibilityApp_start":
      CaptionConfiguration_0220()
      break;
    case "CaptionConfiguration_0230" + "_AccessibilityApp_start":
      CaptionConfiguration_0230()
      break;
    case "CaptionConfiguration_0240" + "_AccessibilityApp_start":
      CaptionConfiguration_0240()
      break;
    case "CaptionConfiguration_0260" + "_AccessibilityApp_start":
      CaptionConfiguration_0260()
      break;
    default:
      break;
  }
}

@Entry
@Component
struct Index {
  private subScriber = undefined;
  aboutToAppear() {
    var commonEventSubscribeInfo = {
      events: ["on_target_change"]
    }
    function subscriberCallback(err, data) {
      console.info(LOG + "====>Target subscriberCallback start");
      console.info(LOG + "====>Target receive event err:" + JSON.stringify(err));
      console.info(LOG + "====>Target receive event data:" + JSON.stringify(data));
      excuteAbility(data.data);
      console.info(LOG + "====>Target subscriberCallback end");
    }
    commonEvent.createSubscriber(commonEventSubscribeInfo).then((subscriber) => {
      console.info(LOG + "====> Target createSubscriber Start====")
      this.subScriber = subscriber;
      commonEvent.subscribe(subscriber, subscriberCallback);
      console.info(LOG + "====> Target createSubscriber End====")
    })
    console.info("start run testcase!!!!");
  }

  aboutToDisappear() {
    console.info('TargetApp aboutToDisappear');
    commonEvent.unsubscribe(this.subScriber);
    this.subScriber = undefined;
  }

  build() {
    Row() {
      Column() {
        Button('CaptionConfiguration')
          .fontSize(15)
          .fontWeight(FontWeight.Bold)
          .margin(5)
          .onClick((e) => {
            console.info("CaptionConfiguration onClick")
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}
