(function() {
  "use strict";
  Object.defineProperty(exports, "__esModule", {
    value: true
  });
  var e = globalThis.requireNapi("hilog");
  var t = globalThis.requireNapi("app.ability.abilityDelegatorRegistry");
  var a = void 0;
  var i = void 0;
  async function n() {
    e.info(0, "testTag", "%{public}s", "onAbilityCreateCallback");
  }
  async function l(t) {
    var a;
    e.info(0, "testTag", "addAbilityMonitorCallback : %{public}s", (a = JSON.stringify(t)) !== null && a !== void 0 ? a : "");
  }
  exports.default = class {
    constructor() {}
    onPrepare() {
      e.info(0, "testTag", "%{public}s", "OpenHarmonyTestRunner OnPrepare");
    }
    onRun() {
      e.info(0, "testTag", "%{public}s", "OpenHarmonyTestRunner onRun run");
      i = t.getArguments();
      a = t.getAbilityDelegator();
      var r = i.parameters["-p"] + ".TestAbility";
      let o = {
        abilityName: r,
        onAbilityCreate: n
      };
      a.addAbilityMonitor(o, l);
      var s = "aa start -d 0 -a " + r + " -b " + i.bundleName;
      if (i.parameters["-D"] == "true") {
        s += " -D";
      }
      e.info(0, "testTag", "cmd : %{public}s", s);
      a.executeShellCommand(s, ((t, a) => {
        var i, n, l;
        e.info(0, "testTag", "executeShellCommand : err : %{public}s", (i = JSON.stringify(t)) !== null && i !== void 0 ? i : "");
        e.info(0, "testTag", "executeShellCommand : data : %{public}s", (n = a.stdResult) !== null && n !== void 0 ? n : "");
        e.info(0, "testTag", "executeShellCommand : data : %{public}s", (l = a.exitCode) !== null && l !== void 0 ? l : "");
      }));
      e.info(0, "testTag", "%{public}s", "OpenHarmonyTestRunner onRun end");
    }
  };
})();
//# sourceMappingURL=OpenHarmonyTestRunner.js.map
