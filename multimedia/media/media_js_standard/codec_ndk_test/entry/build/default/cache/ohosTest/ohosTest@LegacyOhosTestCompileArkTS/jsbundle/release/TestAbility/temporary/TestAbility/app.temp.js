(function() {
  "use strict";
  Object.defineProperty(exports, "__esModule", {
    value: true
  });
  function e(e, s, i) {
    if ((s = t(s)) in e) {
      Object.defineProperty(e, s, {
        value: i,
        enumerable: true,
        configurable: true,
        writable: true
      });
    } else {
      e[s] = i;
    }
    return e;
  }
  function t(e) {
    var t = s(e, "string");
    return typeof t === "symbol" ? t : String(t);
  }
  function s(e, t) {
    if (typeof e !== "object" || e === null) {
      return e;
    }
    var s = e[Symbol.toPrimitive];
    if (s !== void 0) {
      var i = s.call(e, t || "default");
      if (typeof i !== "object") {
        return i;
      }
      throw new TypeError("@@toPrimitive must return a primitive value.");
    }
    return (t === "string" ? String : Number)(e);
  }
  class i {
    constructor() {
      this.id = "sysTestKit";
      this.index = 0;
    }
    static actionStart(e) {
      console.info(JSON.stringify(e));
      var t = "\n" + "OHOS_REPORT_ACTIONSTART: " + JSON.stringify(e) + "\n";
      i.print(t);
      console.info(e + " actionStart print success");
    }
    static actionEnd(e) {
      console.info(JSON.stringify(e));
      var t = "\n" + "OHOS_REPORT_ACTIONEND: " + JSON.stringify(e) + "\n";
      i.print(t);
      console.info(e + " actionEnd print success");
    }
    static async existKeyword(e, t) {
      if (!new RegExp(/^[a-zA-Z0-9]{1,}$/).test(e)) {
        throw new Error("keyword must contain more than one string, and only letters and numbers are supported.");
      }
      t = t || 4;
      let s = false;
      let i = "hilog -x | grep -i '" + e + "' | wc -l";
      await r(i, t).then((e => {
        s = e;
      }));
      return s;
    }
    static async print(e) {
      if ("printSync" in i.delegator) {
        console.debug(`printSync called ...`);
        i.delegator.printSync(e);
      } else {
        await i.delegator.print(e);
      }
    }
    static async getRealTime() {
      let e = (new Date).getTime();
      if (i.systemTime !== null && i.systemTime !== void 0) {
        await i.systemTime.getRealTime().then((t => {
          console.info(`systemTime.getRealTime success data: ${JSON.stringify(t)}`);
          e = t;
        })).catch((e => {
          console.error(`failed to systemTime.getRealTime because ${JSON.stringify(e)}`);
        }));
      }
      return e;
    }
  }
  e(i, "delegator", null);
  e(i, "systemTime", null);
  function r(e, t) {
    return new Promise(((s, r) => {
      i.delegator.executeShellCommand(e, t, ((e, t) => {
        console.info("existKeyword CallBack: err : " + JSON.stringify(e));
        console.info("existKeyword CallBack: data : " + JSON.stringify(t));
        s(parseInt(t.stdResult) > 3 ? true : false);
      }));
    }));
  }
  class n extends Error {
    constructor(e) {
      super();
      this.name = "AssertException";
      this.message = e;
    }
  }
  function a(e, t, s) {
    return new Promise((async (i, r) => {
      let n = null;
      if (!s) {
        n = setTimeout((() => {
          r(new Error("execute timeout " + t + "ms"));
        }), t);
      }
      try {
        await e();
      } catch (e) {
        r(e);
      }
      n !== null ? clearTimeout(n) : null;
      i();
    }));
  }
  function o(e, t, s) {
    return new Promise((async (i, r) => {
      let n = null;
      if (!s) {
        n = setTimeout((() => {
          r(new Error("execute timeout " + t + "ms"));
        }), t);
      }
      try {
        await e((function() {
          n !== null ? clearTimeout(n) : null;
          i();
        }));
      } catch (e) {
        n !== null ? clearTimeout(n) : null;
        r(e);
      }
    }));
  }
  function c(e, t, s, i) {
    return new Promise((async (r, n) => {
      let a = null;
      if (!i) {
        a = setTimeout((() => {
          n(new Error("execute timeout " + t + "ms"));
        }), t);
      }
      try {
        await e((function() {
          a !== null ? clearTimeout(a) : null;
          r();
        }), s);
      } catch (e) {
        a !== null ? clearTimeout(a) : null;
        n(e);
      }
    }));
  }
  function u(e, t) {
    let s = ((t || "").toString().replace(/((\/\/.*$)|(\/\*[\s\S]*?\*\/))/gm, "").match(/^(function)?\s*[^\(]*\(\s*([^\)]*)\)/m) || [ "", "", "" ])[2].split(",").map((e => e.replace(/^\s*(_?)(.+?)\1\s*$/, (e => e.split("=")[0].trim())))).filter(String);
    let i = t.length;
    let r;
    const n = e.getDefaultService("config");
    n.setSupportAsync(true);
    const u = +(n.timeout === void 0 ? 5e3 : n.timeout);
    const l = e.getServices("dataDriver") !== void 0 || n.getStress() > 1;
    switch (i) {
     case 0:
      r = function() {
        return a(t, u, l);
      };
      break;

     case 1:
      if (s[0] === "data") {
        r = function(e) {
          t(e);
        };
      } else {
        r = function() {
          return o(t, u, l);
        };
      }
      break;

     default:
      r = function(e) {
        return c(t, u, e, l);
      };
      break;
    }
    return r;
  }
  class l {
    constructor(e) {
      this.id = e.id;
      this.rootSuite = new l.Suite({});
      this.currentRunningSuite = this.rootSuite;
      this.suitesStack = [ this.rootSuite ];
    }
    describe(e, t) {
      const s = this.coreContext.getDefaultService("config");
      if (s.filterSuite(e)) {
        console.info("filter suite :" + e);
        return;
      }
      const i = new l.Suite({
        description: e
      });
      if (typeof this.coreContext.getServices("dataDriver") !== "undefined" && s["dryRun"] !== "true") {
        let t = this.coreContext.getServices("dataDriver").dataDriver.getSuiteStress(e);
        for (let e = 1; e < t; e++) {
          this.currentRunningSuite.childSuites.push(i);
        }
      }
      this.currentRunningSuite.childSuites.push(i);
      this.currentRunningSuite = i;
      this.suitesStack.push(i);
      t.call();
      let r = this.suitesStack.pop();
      if (this.suitesStack.length === 0) {
        this.currentRunningSuite = r;
        this.suitesStack.push(r);
      }
      if (this.suitesStack.length > 1) {
        this.currentRunningSuite = this.suitesStack.pop();
      } else {
        this.currentRunningSuite = this.suitesStack.pop();
        this.suitesStack.push(this.currentRunningSuite);
      }
    }
    beforeAll(e) {
      this.currentRunningSuite.beforeAll.push(u(this.coreContext, e));
    }
    beforeEach(e) {
      this.currentRunningSuite.beforeEach.push(u(this.coreContext, e));
    }
    afterAll(e) {
      this.currentRunningSuite.afterAll.push(u(this.coreContext, e));
    }
    afterEach(e) {
      this.currentRunningSuite.afterEach.push(u(this.coreContext, e));
    }
    getCurrentRunningSuite() {
      return this.currentRunningSuite;
    }
    setCurrentRunningSuite(e) {
      this.currentRunningSuite = e;
    }
    traversalResults(e, t, s) {
      if (e.childSuites.length === 0 && e.specs.length === 0) {
        return t;
      }
      if (e.specs.length > 0) {
        for (const i of e.specs) {
          t.total++;
          if (!s || !(t.error > 0 || t.failure > 0)) {
            if (i.error) {
              t.error++;
            } else if (i.result.failExpects.length > 0) {
              t.failure++;
            } else if (i.result.pass === true) {
              t.pass++;
            }
          }
        }
      }
      t.duration += e.duration;
      if (e.childSuites.length > 0) {
        for (const i of e.childSuites) {
          this.traversalResults(i, t, s);
        }
      }
    }
    getSummary() {
      let e = this.coreContext.getDefaultService("suite").rootSuite;
      const t = this.coreContext.getDefaultService("spec");
      let s = this.coreContext.getDefaultService("config").isBreakOnError();
      let i = t.getStatus();
      let r = s && i;
      let n = {
        total: 0,
        failure: 0,
        error: 0,
        pass: 0,
        ignore: 0,
        duration: 0
      };
      for (const t of e.childSuites) {
        this.traversalResults(t, n, r);
      }
      n.ignore = n.total - n.pass - n.failure - n.error;
      return n;
    }
    init(e) {
      this.coreContext = e;
    }
    traversalSuites(e, t, s) {
      if (e.childSuites.length === 0 && e.specs.length === 0) {
        return [];
      }
      if (e.specs.length > 0) {
        let i = [];
        for (const t of e["specs"]) {
          if (!s.filterDesc(e.description, t.description, t.fi, null)) {
            i.push({
              itName: t.description
            });
          }
        }
        t[e.description] = i;
      }
      if (e.childSuites.length > 0) {
        let i = [];
        for (const t of e.childSuites) {
          let e = {};
          this.traversalSuites(t, e, s);
          if (!s.filterSuite(t.description)) {
            i.push(e);
          }
        }
        t.suites = i;
      }
    }
    async dryRun(e) {
      const t = this.coreContext.getDefaultService("config");
      let s = {};
      let r = [];
      for (const e of this.rootSuite.childSuites) {
        let s = {};
        this.traversalSuites(e, s, t);
        if (!t.filterSuite(e.description)) {
          r.push(s);
        }
      }
      s["suites"] = r;
      let n = JSON.stringify(s);
      let a = n.length;
      let o = 500;
      let c = Math.floor(a / o);
      for (let e = 0; e <= c; e++) {
        await i.print(n.substring(e * o, (e + 1) * o));
      }
      console.info("dryRun print success");
      e.finishTest("dry run finished!!!", 0, (() => {}));
    }
    execute() {
      const e = this.coreContext.getDefaultService("config");
      if (e.filterValid.length === 0) {
        if (e.isRandom() && this.rootSuite.childSuites.length > 0) {
          this.rootSuite.childSuites.sort((function() {
            return Math.random().toFixed(1) > .5 ? -1 : 1;
          }));
          this.currentRunningSuite = this.rootSuite.childSuites[0];
        }
        if (e.isSupportAsync()) {
          (async () => {
            await this.coreContext.fireEvents("task", "taskStart");
            await this.rootSuite.asyncRun(this.coreContext);
          })().then((async () => {
            await this.coreContext.fireEvents("task", "taskDone");
          }));
        } else {
          this.coreContext.fireEvents("task", "taskStart");
          this.rootSuite.run(this.coreContext);
          this.coreContext.fireEvents("task", "taskDone");
        }
      } else {
        this.coreContext.fireEvents("task", "incorrectFormat");
      }
    }
    apis() {
      const e = this;
      return {
        describe: function(t, s) {
          return e.describe(t, s);
        },
        beforeAll: function(t) {
          return e.beforeAll(t);
        },
        beforeEach: function(t) {
          return e.beforeEach(t);
        },
        afterAll: function(t) {
          return e.afterAll(t);
        },
        afterEach: function(t) {
          return e.afterEach(t);
        }
      };
    }
  }
  l.Suite = class {
    constructor(e) {
      this.description = e.description || "";
      this.childSuites = [];
      this.specs = [];
      this.beforeAll = [];
      this.afterAll = [];
      this.beforeEach = [];
      this.afterEach = [];
      this.duration = 0;
    }
    pushSpec(e) {
      this.specs.push(e);
    }
    removeSpec(e) {
      this.specs = this.specs.filter(((t, s) => t.description !== e));
    }
    getSpecsNum() {
      return this.specs.length;
    }
    isRun(e) {
      const t = e.getDefaultService("config");
      e.getDefaultService("suite");
      const s = e.getDefaultService("spec");
      let i = t.isBreakOnError();
      let r = s.getStatus();
      return i && r;
    }
    run(e) {
      const t = e.getDefaultService("suite");
      t.setCurrentRunningSuite(this);
      if (this.description !== "") {
        e.fireEvents("suite", "suiteStart", this);
      }
      this.runHookFunc("beforeAll");
      if (this.specs.length > 0) {
        if (e.getDefaultService("config").isRandom()) {
          this.specs.sort((function() {
            return Math.random().toFixed(1) > .5 ? -1 : 1;
          }));
        }
        for (let t in this.specs) {
          if (this.isRun(e)) {
            break;
          }
          this.runHookFunc("beforeEach");
          t.run(e);
          this.runHookFunc("afterEach");
        }
      }
      if (this.childSuites.length > 0) {
        for (let s in this.childSuites) {
          if (this.isRun(e)) {
            break;
          }
          s.run(e);
          t.setCurrentRunningSuite(s);
        }
      }
      this.runHookFunc("afterAll");
      if (this.description !== "") {
        e.fireEvents("suite", "suiteDone");
      }
    }
    async asyncRun(e) {
      const t = e.getDefaultService("suite");
      t.setCurrentRunningSuite(this);
      t.suitesStack.push(this);
      if (this.description !== "") {
        await e.fireEvents("suite", "suiteStart", this);
      }
      await this.runAsyncHookFunc("beforeAll");
      if (this.specs.length > 0) {
        if (e.getDefaultService("config").isRandom()) {
          this.specs.sort((function() {
            return Math.random().toFixed(1) > .5 ? -1 : 1;
          }));
        }
        for (let t = 0; t < this.specs.length; t++) {
          if (this.isRun(e)) {
            console.log("break description :" + this.description);
            break;
          }
          await this.runAsyncHookFunc("beforeEach");
          await this.specs[t].asyncRun(e);
          await this.runAsyncHookFunc("afterEach");
        }
      }
      if (this.childSuites.length > 0) {
        for (let t = 0; t < this.childSuites.length; t++) {
          if (this.isRun(e)) {
            console.log("break description :" + this.description);
            break;
          }
          await this.childSuites[t].asyncRun(e);
        }
      }
      await this.runAsyncHookFunc("afterAll");
      if (this.description !== "") {
        await e.fireEvents("suite", "suiteDone");
        let s = t.suitesStack.pop();
        if (t.suitesStack.length === 0) {
          t.suitesStack.push(s);
        }
        if (t.suitesStack.length > 1) {
          t.setCurrentRunningSuite(t.suitesStack.pop());
        } else {
          let e = t.suitesStack.pop();
          t.setCurrentRunningSuite(e);
          t.suitesStack.push(e);
        }
      }
    }
    runHookFunc(e) {
      if (this[e] && this[e].length > 0) {
        this[e].forEach((e => {
          try {
            e();
          } catch (e) {
            console.error(e);
          }
        }));
      }
    }
    runAsyncHookFunc(e) {
      if (this[e] && this[e].length > 0) {
        return new Promise((async t => {
          for (let t = 0; t < this[e].length; t++) {
            try {
              await this[e][t]();
            } catch (e) {
              console.error(e);
            }
          }
          t();
        }));
      }
    }
  };
  class f {
    constructor(e) {
      this.id = e.id;
      this.totalTest = 0;
      this.hasError = false;
    }
    init(e) {
      this.coreContext = e;
    }
    setCurrentRunningSpec(e) {
      this.currentRunningSpec = e;
    }
    setStatus(e) {
      this.hasError = e;
    }
    getStatus() {
      return this.hasError;
    }
    getTestTotal() {
      return this.totalTest;
    }
    getCurrentRunningSpec() {
      return this.currentRunningSpec;
    }
    it(e, t, s) {
      const i = this.coreContext.getDefaultService("config");
      const r = this.coreContext.getDefaultService("suite").getCurrentRunningSuite().description;
      if (i.filterDesc(r, e, t, this.coreContext)) {
        console.info("filter it :" + e);
      } else {
        let r = u(this.coreContext, s);
        const n = new f.Spec({
          description: e,
          fi: t,
          fn: r
        });
        const a = this.coreContext.getDefaultService("suite");
        if (typeof this.coreContext.getServices("dataDriver") !== "undefined" && i["dryRun"] !== "true") {
          let t = this.coreContext.getServices("dataDriver").dataDriver.getSpecStress(e);
          for (let e = 1; e < t; e++) {
            this.totalTest++;
            a.getCurrentRunningSuite().pushSpec(n);
          }
        }
        if (i["dryRun"] !== "true") {
          let e = i.getStress();
          console.info("stress length :" + e);
          for (let t = 1; t < e; t++) {
            this.totalTest++;
            a.getCurrentRunningSuite().pushSpec(n);
          }
        }
        this.totalTest++;
        a.getCurrentRunningSuite().pushSpec(n);
      }
    }
    apis() {
      const e = this;
      return {
        it: function(t, s, i) {
          return e.it(t, s, i);
        }
      };
    }
  }
  f.Spec = class {
    constructor(e) {
      this.description = e.description || "";
      this.fi = e.fi;
      this.fn = e.fn || function() {};
      this.result = {
        failExpects: [],
        passExpects: []
      };
      this.error = void 0;
      this.duration = 0;
      this.startTime = 0;
      this.isExecuted = false;
    }
    setResult(e) {
      const t = e.getDefaultService("spec");
      if (this.result.failExpects.length > 0) {
        this.result.pass = false;
        t.setStatus(true);
      } else {
        this.result.pass = true;
      }
      console.info("testcase " + this.description + " result:" + this.result.pass);
    }
    run(e) {
      const t = e.getDefaultService("spec");
      t.setCurrentRunningSpec(this);
      e.fireEvents("spec", "specStart", this);
      this.isExecuted = true;
      try {
        let t = e.getServices("dataDriver");
        if (typeof t === "undefined") {
          this.fn();
        } else {
          let e = t.dataDriver.getSuiteParams();
          let s = t.dataDriver.getSpecParams();
          console.info("[suite params] " + JSON.stringify(e));
          console.info("[spec params] " + JSON.stringify(s));
          if (this.fn.length === 0) {
            this.fn();
          } else if (s.length === 0) {
            this.fn(e);
          } else {
            s.forEach((t => this.fn(Object.assign({}, t, e))));
          }
        }
        this.setResult(e);
      } catch (e) {
        this.error = e;
        t.setStatus(true);
      }
      e.fireEvents("spec", "specDone", this);
    }
    async asyncRun(e) {
      const t = e.getDefaultService("spec");
      t.setCurrentRunningSpec(this);
      await e.fireEvents("spec", "specStart", this);
      try {
        let t = e.getServices("dataDriver");
        if (typeof t === "undefined") {
          await this.fn();
          this.setResult(e);
        } else {
          let s = t.dataDriver.getSuiteParams();
          let i = t.dataDriver.getSpecParams();
          console.info("[suite params] " + JSON.stringify(s));
          console.info("[spec params] " + JSON.stringify(i));
          if (this.fn.length === 0) {
            await this.fn();
            this.setResult(e);
          } else if (i.length === 0) {
            await this.fn(s);
            this.setResult(e);
          } else {
            for (const t of i) {
              await this.fn(Object.assign({}, t, s));
              this.setResult(e);
            }
          }
        }
      } catch (e) {
        if (e instanceof n) {
          this.fail = e;
          t.setStatus(true);
        } else {
          this.error = e;
          t.setStatus(true);
        }
      }
      this.isExecuted = true;
      await e.fireEvents("spec", "specDone", this);
    }
    filterCheck(e) {
      e.getDefaultService("spec").setCurrentRunningSpec(this);
      return true;
    }
    addExpectationResult(e) {
      if (this.result.failExpects.length === 0) {
        this.result.failExpects.push(e);
      }
      throw new n(e.message);
    }
  };
  class h {
    constructor(e) {
      this.id = e.id;
      this.matchers = {};
    }
    expect(e) {
      return this.wrapMatchers(e);
    }
    init(e) {
      this.coreContext = e;
      this.addMatchers(this.basicMatchers());
    }
    addMatchers(e) {
      for (const t in e) {
        if (Object.prototype.hasOwnProperty.call(e, t)) {
          this.matchers[t] = e[t];
        }
      }
    }
    basicMatchers() {
      return {
        assertTrue: function(e) {
          return {
            pass: e === true,
            message: "expect true, actualValue is " + e
          };
        },
        assertEqual: function(e, t) {
          return {
            pass: e === t[0],
            expectValue: t[0],
            message: "expect " + e + " equals " + t[0]
          };
        },
        assertThrow: function(e, t) {
          const s = {
            pass: false
          };
          if (typeof e !== "function") {
            s.message = "toThrow's Actual should be a Function";
          } else {
            let i = false;
            let r;
            try {
              e();
            } catch (e) {
              i = true;
              r = e;
            }
            if (!i) {
              s.message = "function did not throw an exception";
            } else if (r && r.message === t[0]) {
              s.pass = true;
            } else {
              s.message = `expect to throw ${t[0]} , actual throw ${r.message}`;
            }
          }
          return s;
        }
      };
    }
    wrapMatchers(e) {
      const t = this;
      const s = {
        isNot: false,
        not: function() {
          this.isNot = true;
          return this;
        }
      };
      const i = t.coreContext.getDefaultService("spec").getCurrentRunningSpec();
      for (const r in this.matchers) {
        if (Object.prototype.hasOwnProperty.call(this.matchers, r)) {
          if (r.search("assertPromise") == 0) {
            s[r] = async function() {
              await t.matchers[r](e, arguments).then((function(t) {
                if (s.isNot) {
                  t.pass = !t.pass;
                }
                t.actualValue = e;
                t.checkFunc = r;
                if (!t.pass) {
                  i.addExpectationResult(t);
                }
              }));
            };
          } else {
            s[r] = function() {
              const n = t.matchers[r](e, arguments);
              if (s.isNot) {
                n.pass = !n.pass;
              }
              n.actualValue = e;
              n.checkFunc = r;
              if (!n.pass) {
                i.addExpectationResult(n);
              }
            };
          }
        }
      }
      return s;
    }
    apis() {
      const e = this;
      return {
        expect: function(t) {
          return e.expect(t);
        }
      };
    }
  }
  class p {
    constructor(e) {
      this.id = e.id;
    }
    init(e) {
      this.coreContext = e;
      this.specService = this.coreContext.getDefaultService("spec");
      this.suiteService = this.coreContext.getDefaultService("suite");
      this.duration = 0;
    }
    taskStart() {
      console.info("[start] start run suites");
    }
    async suiteStart() {
      console.info("[suite start]" + this.suiteService.getCurrentRunningSuite().description);
    }
    async specStart() {
      console.info("start running case '" + this.specService.currentRunningSpec.description + "'");
      this.index = this.index + 1;
      this.specService.currentRunningSpec.startTime = await i.getRealTime();
    }
    async specDone() {
      let e = "";
      let t = this.specService.currentRunningSpec;
      let s = this.suiteService.currentRunningSuite;
      t.duration = await i.getRealTime() - t.startTime;
      s.duration += t.duration;
      if (t.error) {
        this.formatPrint("error", t.description + " ; consuming " + t.duration + "ms");
        this.formatPrint("errorDetail", t.error);
      } else if (t.result) {
        if (t.result.failExpects.length > 0) {
          this.formatPrint("fail", t.description + " ; consuming " + t.duration + "ms");
          t.result.failExpects.forEach((t => {
            e = t.message || "expect " + t.actualValue + " " + t.checkFunc + " " + t.expectValue;
            this.formatPrint("failDetail", e);
          }));
        } else {
          this.formatPrint("pass", t.description + " ; consuming " + t.duration + "ms");
        }
      }
      this.formatPrint(this.specService.currentRunningSpec.error, e);
    }
    suiteDone() {
      let e = this.suiteService.currentRunningSuite;
      console.info(`[suite end] ${e.description} consuming ${e.duration} ms`);
    }
    taskDone() {
      let e = "";
      let t = this.suiteService.getSummary();
      e = "total cases:" + t.total + ";failure " + t.failure + "," + "error " + t.error;
      e += ",pass " + t.pass + "; consuming " + t.duration + "ms";
      console.info(e);
      console.info("[end] run suites end");
    }
    incorrectFormat() {
      if (this.coreContext.getDefaultService("config").filterValid.length !== 0) {
        this.coreContext.getDefaultService("config").filterValid.forEach((function(e) {
          console.info("this param " + e + " is invalid");
        }));
      }
    }
    formatPrint(e, t) {
      switch (e) {
       case "pass":
        console.info("[pass]" + t);
        break;

       case "fail":
        console.info("[fail]" + t);
        break;

       case "failDetail":
        console.info("[failDetail]" + t);
        break;

       case "error":
        console.info("[error]" + t);
        break;

       case "errorDetail":
        console.info("[errorDetail]" + t);
        break;
      }
    }
    sleep(e) {
      var t = new Date;
      var s = t.getTime() + e;
      while (true) {
        if ((t = new Date).getTime() > s) {
          return;
        }
      }
    }
  }
  class g {
    constructor(e, t, s) {
      this.suiteName = e;
      this.itName = t;
      this.params = s;
    }
    filterSuite() {
      return !this.params.split(",").map((e => e.split("#")[0])).map((e => e == this.suiteName)).reduce(((e, t) => e || t), false);
    }
    filterIt() {
      let e = this.params.split(",") || [];
      let t = e.filter((e => !e.includes("#"))).map((e => e == this.suiteName)).reduce(((e, t) => e || t), false);
      let s = e.filter((e => e.includes("#"))).map((e => e == this.suiteName + "#" + this.itName)).reduce(((e, t) => e || t), false);
      return !(t || s);
    }
  }
  class S {
    constructor(e, t, s) {
      this.suiteName = e;
      this.itName = t;
      this.params = s;
    }
    filterSuite() {
      return this.params.split(",").map((e => e == this.suiteName)).reduce(((e, t) => e || t), false);
    }
    filterIt() {
      return this.params.split(",").some((e => e == this.suiteName + "#" + this.itName));
    }
  }
  class m {
    constructor(e, t, s) {
      this.suiteName = e;
      this.itName = t;
      this.params = s;
    }
    filterSuite() {
      return !this.params.split(",").map((e => e == this.suiteName)).reduce(((e, t) => e || t), false);
    }
    filterIt() {
      return !this.params.split(",").map((e => e == this.itName)).reduce(((e, t) => e || t), false);
    }
  }
  class d {
    constructor(e, t, s, i) {
      this.suiteName = e;
      this.itName = t;
      this.params = i;
      this.fi = s;
    }
    filterIt() {
      return !(this.params === (this.fi & this.params) || this.fi === 0);
    }
  }
  const v = /^[1-9]\d*$/;
  class y {
    constructor(e) {
      this.id = e.id;
      this.supportAsync = false;
      this.random = false;
      this.filterValid = [];
      this.filter = 0;
      this.flag = false;
      this.suite = null;
      this.itName = null;
      this.testType = null;
      this.level = null;
      this.size = null;
      this.class = null;
      this.notClass = null;
      this.timeout = null;
      this.breakOnError = false;
      this.stress = null;
    }
    init(e) {
      this.coreContext = e;
    }
    isNormalInteger(e) {
      const t = Math.floor(Number(e));
      return t !== 1 / 0 && String(t) === String(e) && t >= 0;
    }
    getStress() {
      if (this.stress === void 0 || this.stress === "" || this.stress === null) {
        return 1;
      } else {
        return !this.stress.match(v) ? 1 : Number.parseInt(this.stress);
      }
    }
    basicParamValidCheck(e) {
      let t = e.size;
      if (t !== void 0 && t !== "" && t !== null) {
        if ([ "small", "medium", "large" ].indexOf(t) === -1) {
          this.filterValid.push("size:" + t);
        }
      }
      let s = e.level;
      if (s !== void 0 && s !== "" && s !== null) {
        if ([ "0", "1", "2", "3", "4" ].indexOf(s) === -1) {
          this.filterValid.push("level:" + s);
        }
      }
      let i = e.testType;
      if (i !== void 0 && i !== "" && i !== null) {
        if ([ "function", "performance", "power", "reliability", "security", "global", "compatibility", "user", "standard", "safety", "resilience" ].indexOf(i) === -1) {
          this.filterValid.push("testType:" + i);
        }
      }
    }
    filterParamValidCheck(e) {
      let t = e.timeout;
      if (t !== void 0 && t !== "" && t !== null) {
        if (!this.isNormalInteger(t)) {
          this.filterValid.push("timeout:" + t);
        }
      }
      let s = [ "dryRun", "random", "breakOnError", "coverage" ];
      for (const t of s) {
        if (e[t] !== void 0 && e[t] !== "true" && e[t] !== "false") {
          this.filterValid.push(`${t}:${e[t]}`);
        }
      }
      if (e.stress !== void 0 && e.stress !== "" && e.stress !== null) {
        if (!e.stress.match(v)) {
          this.filterValid.push("stress:" + e.stress);
        }
      }
      let i = /^[A-Za-z]{1}[\w#,.]*$/;
      let r = [ "class", "notClass" ];
      for (const t of r) {
        if (e[t] !== void 0 && e[t] !== "" && e[t] !== null) {
          e[t].split(",").forEach((s => !s.match(i) ? this.filterValid.push(`${t}:${e[t]}`) : null));
        }
      }
    }
    setConfig(e) {
      this.basicParamValidCheck(e);
      this.filterParamValidCheck(e);
      try {
        this.class = e.class;
        this.notClass = e.notClass;
        this.flag = e.flag || {
          flag: false
        };
        this.suite = e.suite;
        this.itName = e.itName;
        this.filter = e.filter;
        this.testType = e.testType;
        this.level = e.level;
        this.size = e.size;
        this.timeout = e.timeout;
        this.dryRun = e.dryRun;
        this.breakOnError = e.breakOnError;
        this.random = e.random === "true" ? true : false;
        this.stress = e.stress;
        this.coverage = e.coverage;
        this.filterParam = {
          testType: {
            function: 1,
            performance: 1 << 1,
            power: 1 << 2,
            reliability: 1 << 3,
            security: 1 << 4,
            global: 1 << 5,
            compatibility: 1 << 6,
            user: 1 << 7,
            standard: 1 << 8,
            safety: 1 << 9,
            resilience: 1 << 10
          },
          level: {
            0: 1 << 24,
            1: 1 << 25,
            2: 1 << 26,
            3: 1 << 27,
            4: 1 << 28
          },
          size: {
            small: 1 << 16,
            medium: 1 << 17,
            large: 1 << 18
          }
        };
        this.parseParams();
      } catch (e) {
        console.info("setConfig error: " + e.message);
      }
    }
    parseParams() {
      if (this.filter != null) {
        return;
      }
      let e = 0;
      let t = 0;
      let s = 0;
      if (this.testType != null) {
        e = this.testType.split(",").map((e => this.filterParam.testType[e] || 0)).reduce(((e, t) => e | t), 0);
      }
      if (this.level != null) {
        s = this.level.split(",").map((e => this.filterParam.level[e] || 0)).reduce(((e, t) => e | t), 0);
      }
      if (this.size != null) {
        t = this.size.split(",").map((e => this.filterParam.size[e] || 0)).reduce(((e, t) => e | t), 0);
      }
      this.filter = e | t | s;
      console.info("filter params:" + this.filter);
    }
    isCurrentSuite(e) {
      if (this.suite !== void 0 && this.suite !== "" && this.suite !== null) {
        return this.suite.split(",").indexOf(e) !== -1;
      }
      return false;
    }
    filterSuite(e) {
      let t = [];
      if (this.suite !== void 0 && this.suite !== "" && this.suite !== null) {
        t.push(new m(e, "", this.suite));
      }
      if (this.class !== void 0 && this.class !== "" && this.class !== null) {
        t.push(new g(e, "", this.class));
      }
      if (this.notClass !== void 0 && this.notClass !== "" && this.notClass !== null) {
        t.push(new S(e, "", this.notClass));
      }
      return t.map((e => e.filterSuite())).reduce(((e, t) => e || t), false);
    }
    filterDesc(e, t, s, i) {
      let r = [];
      if (this.itName !== void 0 && this.itName !== "" && this.itName !== null) {
        r.push(new m(e, t, this.itName));
      }
      if (this.class !== void 0 && this.class !== "" && this.class !== null) {
        r.push(new g(e, t, this.class));
      }
      if (this.notClass !== void 0 && this.notClass !== "" && this.notClass !== null) {
        r.push(new S(e, t, this.notClass));
      }
      if (typeof this.filter !== "undefined" && this.filter !== 0 && s !== 0) {
        r.push(new d("", "", s, this.filter));
      }
      return r.map((e => e.filterIt())).reduce(((e, t) => e || t), false);
    }
    isRandom() {
      return this.random || false;
    }
    isBreakOnError() {
      return this.breakOnError !== "true" ? false : true;
    }
    setSupportAsync(e) {
      this.supportAsync = e;
    }
    isSupportAsync() {
      return this.supportAsync;
    }
    translateParams(e) {
      const t = new Set([ "-s class", "-s notClass", "-s suite", "-s itName", "-s level", "-s testType", "-s size", "-s timeout", "-s dryRun", "-s random", "-s breakOnError", "-s stress", "-s coverage", "class", "notClass", "suite", "itName", "level", "testType", "size", "timeout", "dryRun", "random", "breakOnError", "stress", "coverage" ]);
      let s = {};
      for (const i in e) {
        if (t.has(i)) {
          s[i.replace("-s ", "")] = e[i];
        }
      }
      return s;
    }
    translateParamsToString(e) {
      const t = new Set([ "-s class", "-s notClass", "-s suite", "-s itName", "-s level", "-s testType", "-s size", "-s timeout", "-s dryRun", "-s random", "-s breakOnError", "-s stress", "-s coverage", "class", "notClass", "suite", "itName", "level", "testType", "size", "timeout", "dryRun", "random", "breakOnError", "stress", "coverage" ]);
      let s = "";
      for (const i in e) {
        if (t.has(i)) {
          s += " " + i + " " + e[i];
        }
      }
      return s.trim();
    }
    execute() {}
  }
  class b {
    constructor(e) {
      this.id = e.id;
      this.coreContext = e.context;
      this.eventMonitors = [];
    }
    subscribeEvent(e) {
      this.eventMonitors.push(e);
    }
    async specStart() {
      for (const e of this.eventMonitors) {
        await e["specStart"]();
      }
    }
    async specDone() {
      for (const e of this.eventMonitors) {
        await e["specDone"]();
      }
    }
  }
  class R {
    constructor(e) {
      this.id = e.id;
      this.suiteContext = e.coreContext;
      this.eventMonitors = [];
    }
    subscribeEvent(e) {
      this.eventMonitors.push(e);
    }
    async suiteStart() {
      for (const e of this.eventMonitors) {
        await e["suiteStart"]();
      }
    }
    async suiteDone() {
      for (const e of this.eventMonitors) {
        await e["suiteDone"]();
      }
    }
  }
  class T {
    constructor(e) {
      this.id = e.id;
      this.coreContext = e.coreContext;
      this.eventMonitors = [];
    }
    subscribeEvent(e) {
      this.eventMonitors.push(e);
    }
    async taskStart() {
      for (const e of this.eventMonitors) {
        await e["taskStart"]();
      }
    }
    async taskDone() {
      for (const e of this.eventMonitors) {
        await e["taskDone"]();
      }
    }
    incorrectFormat() {
      for (const e of this.eventMonitors) {
        e["incorrectFormat"]();
      }
    }
  }
  class E {
    static getInstance() {
      if (!this.instance) {
        this.instance = new E;
      }
      return this.instance;
    }
    constructor() {
      this.instance = null;
      this.services = {
        suite: {},
        spec: {},
        config: {},
        expect: {},
        log: {},
        report: {}
      };
      this.events = {
        suite: {},
        spec: {},
        task: {}
      };
    }
    addService(e, t) {
      let s = {};
      if (!this.services[e]) {
        this.services[e] = s;
      } else {
        s = this.services[e];
      }
      s[t.id] = t;
    }
    getDefaultService(e) {
      return this.services[e].default;
    }
    getServices(e) {
      return this.services[e];
    }
    registerEvent(e, t) {
      let s = {};
      if (!this.events[e]) {
        this.events[e] = s;
      } else {
        s = this.events[e];
      }
      s[t.id] = t;
    }
    unRegisterEvent(e, t) {
      const s = this.events[e];
      if (s) {
        delete s[t];
      }
    }
    subscribeEvent(e, t) {
      const s = this.events[e];
      if (s) {
        for (const e in s) {
          s[e]["subscribeEvent"](t);
        }
      }
    }
    async fireEvents(e, t) {
      const s = this.events[e];
      if (s) {
        for (const e in s) {
          await s[e][t]();
        }
      }
    }
    addToGlobal(e) {
      if (typeof globalThis !== "undefined") {
        for (let t in e) {
          globalThis[t] = e[t];
        }
      }
      for (const t in e) {
        this[t] = e[t];
      }
    }
    init() {
      this.addService("suite", new l({
        id: "default"
      }));
      this.addService("spec", new f({
        id: "default"
      }));
      this.addService("expect", new h({
        id: "default"
      }));
      this.addService("report", new p({
        id: "default"
      }));
      this.addService("config", new y({
        id: "default"
      }));
      this.registerEvent("task", new T({
        id: "default",
        coreContext: this
      }));
      this.registerEvent("suite", new R({
        id: "default",
        coreContext: this
      }));
      this.registerEvent("spec", new b({
        id: "default",
        coreContext: this
      }));
      this.subscribeEvent("spec", this.getDefaultService("report"));
      this.subscribeEvent("suite", this.getDefaultService("report"));
      this.subscribeEvent("task", this.getDefaultService("report"));
      const e = this;
      for (const t in this.services) {
        const s = this.services[t];
        for (const t in s) {
          const i = s[t];
          i.init(e);
          if (typeof i.apis !== "function") {
            continue;
          }
          const r = i.apis();
          if (r) {
            this.addToGlobal(r);
          }
        }
      }
    }
    execute(e) {
      const t = this.getDefaultService("suite");
      if (this.getDefaultService("config")["dryRun"] !== "true") {
        setTimeout((() => {
          t.execute();
        }), 10);
      } else {
        (async function() {
          await t.dryRun(e);
        })();
      }
    }
  }
  function O(e, t, s) {
    if ((t = x(t)) in e) {
      Object.defineProperty(e, t, {
        value: s,
        enumerable: true,
        configurable: true,
        writable: true
      });
    } else {
      e[t] = s;
    }
    return e;
  }
  function x(e) {
    var t = w(e, "string");
    return typeof t === "symbol" ? t : String(t);
  }
  function w(e, t) {
    if (typeof e !== "object" || e === null) {
      return e;
    }
    var s = e[Symbol.toPrimitive];
    if (s !== void 0) {
      var i = s.call(e, t || "default");
      if (typeof i !== "object") {
        return i;
      }
      throw new TypeError("@@toPrimitive must return a primitive value.");
    }
    return (t === "string" ? String : Number)(e);
  }
  class C {}
  O(C, "FUNCTION", 1);
  O(C, "PERFORMANCE", 1 << 1);
  O(C, "POWER", 1 << 2);
  O(C, "RELIABILITY", 1 << 3);
  O(C, "SECURITY", 1 << 4);
  O(C, "GLOBAL", 1 << 5);
  O(C, "COMPATIBILITY", 1 << 6);
  O(C, "USER", 1 << 7);
  O(C, "STANDARD", 1 << 8);
  O(C, "SAFETY", 1 << 9);
  O(C, "RESILIENCE", 1 << 10);
  class P {}
  O(P, "SMALLTEST", 1 << 16);
  O(P, "MEDIUMTEST", 1 << 17);
  O(P, "LARGETEST", 1 << 18);
  class D {}
  O(D, "LEVEL0", 1 << 24);
  O(D, "LEVEL1", 1 << 25);
  O(D, "LEVEL2", 1 << 26);
  O(D, "LEVEL3", 1 << 27);
  O(D, "LEVEL4", 1 << 28);
  const A = "suites";
  const N = "items";
  const _ = "describe";
  const k = "it";
  const j = "params";
  const V = "stress";
  class I {
    static get(e, t, s) {
      let i = s;
      for (const s in e) {
        if (s === t) {
          return e[s];
        }
      }
      return i;
    }
    static has(e, t) {
      return Object.prototype.hasOwnProperty.call(e, t);
    }
  }
  class U {
    constructor(e) {
      this.id = "dataDriver";
      this.data = e.data || {};
    }
    init(e) {
      this.coreContext = e;
      this.suiteService = this.coreContext.getDefaultService("suite");
      this.specService = this.coreContext.getDefaultService("spec");
    }
    getSpecParams() {
      let e = [];
      let t = this.suiteService.getCurrentRunningSuite().description;
      let s = this.specService.getCurrentRunningSpec().description;
      let i = I.get(this.data, A, []);
      for (const r of i) {
        let i = I.get(r, _, "");
        if (I.has(r, _) && typeof i === "object" && i.constructor === Array && i.includes(t)) {
          let t = I.get(r, N, []);
          for (const i of t) {
            if (I.has(i, k) && I.get(i, k) === s) {
              return I.get(i, j, e);
            }
          }
        }
      }
      return e;
    }
    getSuiteParams() {
      let e = {};
      let t = this.suiteService.getCurrentRunningSuite().description;
      let s = I.get(this.data, A, []);
      for (const i of s) {
        let s = I.get(i, _, []);
        if (I.has(i, _) && typeof s === "object" && s.constructor === Array && s.includes(t)) {
          e = Object.assign({}, e, I.get(i, j, e));
        }
      }
      return e;
    }
    getSpecStress(e) {
      let t = 1;
      let s = this.suiteService.getCurrentRunningSuite().description;
      let i = I.get(this.data, A, []);
      for (const r of i) {
        let i = I.get(r, _, "");
        if (I.has(r, _) && typeof i === "object" && i.constructor === Array && i.includes(s)) {
          let s = I.get(r, N, []);
          for (const i of s) {
            if (I.has(i, k) && I.get(i, k) === e) {
              let e = I.get(i, V, t);
              return Number.isInteger(e) && e >= 1 ? e : t;
            }
          }
        }
      }
      return t;
    }
    getSuiteStress(e) {
      let t = 1;
      let s = I.get(this.data, A, []);
      for (const i of s) {
        let s = I.get(i, _, []);
        if (I.has(i, _) && typeof s === "object" && s.constructor === Array && s.includes(e)) {
          let e = I.get(i, V, t);
          return Number.isInteger(e) && e >= 1 ? e : t;
        }
      }
      return t;
    }
  }
  function H(e) {
    return {
      pass: e === null,
      message: "expect null, actualValue is " + e
    };
  }
  function M(e, t) {
    console.log("expected:" + t[0] + ",precision:" + t[1]);
    if (e === null && t[0] === null) {
      throw new Error("actualValue and expected can not be both null!!!");
    }
    let s;
    let i = Math.abs(t[0] - e);
    let r = Math.abs(e);
    if (r - 0 === 0) {
      if (i - 0 === 0) {
        s = true;
      } else {
        s = false;
      }
    } else if (i / r < t[1]) {
      s = true;
    } else {
      s = false;
    }
    return {
      pass: s,
      message: "|" + e + " - " + t[0] + "|/" + e + " is not less than " + t[1]
    };
  }
  function F(e, t) {
    let s = false;
    if (Object.prototype.toString.call(e).indexOf("Array")) {
      for (let i in e) {
        if (e[i] == t[0]) {
          s = true;
        }
      }
    }
    if (Object.prototype.toString.call(e) === "[object String]") {
      s = e.indexOf(t[0]) >= 0;
    }
    return {
      pass: s,
      message: "expect false, " + e + " do not have  " + t[0]
    };
  }
  function J(e, t) {
    return {
      pass: e < t[0],
      message: e + " is not less than " + t[0]
    };
  }
  function L(e, t) {
    return {
      pass: e > t[0],
      message: e + " is not larger than " + t[0]
    };
  }
  function z() {
    return {
      pass: false,
      message: "fail "
    };
  }
  function $(e) {
    return {
      pass: void 0 === e,
      message: "expect Undefined, actualValue is " + e
    };
  }
  function q(e) {
    return {
      pass: e === false,
      message: "expect false, actualValue is " + e
    };
  }
  function B(e, t) {
    if (Object.prototype.toString.call(e) == "[object " + t[0] + "]") {
      return {
        pass: true
      };
    } else {
      return {
        pass: false,
        message: e + " is " + Object.prototype.toString.call(e) + "not  " + t[0]
      };
    }
  }
  function K(e, t) {
    let s = false;
    let i;
    if (typeof e !== "function") {
      throw new Error("actualValue is not a function");
    }
    try {
      e();
      return {
        pass: s,
        message: " An error is not thrown while it is expected!"
      };
    } catch (e) {
      i = e;
    }
    if (i instanceof Error) {
      console.log(i.message);
      if (i.message == t[0]) {
        s = true;
      }
    }
    return {
      pass: s,
      message: "expected throw failed , " + i.message + " is not " + t[0]
    };
  }
  function Y(e, t) {
    return {
      pass: e >= t[0],
      message: e + " is not larger than " + t[0]
    };
  }
  function G(e, t) {
    return {
      pass: e <= t[0],
      message: e + " is not less than " + t[0]
    };
  }
  function W(e) {
    return {
      pass: e !== e,
      message: "expect NaN, actualValue  is " + e
    };
  }
  function Z(e) {
    return {
      pass: e === Number.NEGATIVE_INFINITY,
      message: "Expected actualValue not to be -Infinity.  actualValue is," + e
    };
  }
  function Q(e) {
    return {
      pass: e === Number.POSITIVE_INFINITY,
      message: "Expected actualValue is POSITIVE_INFINITY.  actualValue is," + e
    };
  }
  class X {
    static getType_(e) {
      return Object.prototype.toString.apply(e);
    }
    static isA_(e, t) {
      return this.getType_(t) === "[object " + e + "]";
    }
    static isAsymmetricEqualityTester_(e) {
      return e ? this.isA_("Function", e.asymmetricMatch) : false;
    }
    static isFunction_(e) {
      return this.isA_("Function", e);
    }
    static isUndefined(e) {
      return e === void 0;
    }
    static isDomNode(e) {
      return e !== null && typeof e === "object" && typeof e.nodeType === "number" && typeof e.nodeName === "string";
    }
    static isPromise(e) {
      return !!e && e.constructor === Promise;
    }
    static isMap(e) {
      return e !== null && typeof e !== "undefined" && e.constructor === Map;
    }
    static isSet(e) {
      return e !== null && typeof e !== "undefined" && e.constructor === Set;
    }
    static has(e, t) {
      return Object.prototype.hasOwnProperty.call(e, t);
    }
    static keys(e, t) {
      const s = [];
      const i = this.getAllKeys(e);
      if (!t) {
        return i;
      }
      if (i.length === 0) {
        return i;
      }
      for (const e of i) {
        if (typeof e === "symbol" || !/^[0-9]+$/.test(e)) {
          s.push(e);
        }
      }
      return s;
    }
    static getAllKeys(e) {
      const t = [];
      for (let s in e) {
        if (this.has(e, s)) {
          t.push(s);
        }
      }
      const s = Object.getOwnPropertySymbols(e);
      for (const i of s) {
        if (e.propertyIsEnumerable(i)) {
          t.push(i);
        }
      }
      return t;
    }
  }
  function ee(e, t) {
    console.log("actualValue:" + e + ",expected:" + t[0]);
    return {
      pass: se(e, t[0], [], []),
      message: te(e, t[0])
    };
  }
  function te(e, t) {
    const s = Object.prototype.toString.call(e);
    const i = Object.prototype.toString.call(t);
    let r;
    let n;
    if (s == "[object Function]") {
      r = "actualValue Function";
    } else if (s == "[object Promise]") {
      r = "actualValue Promise";
    } else if (s == "[object Set]" || s == "[object Map]") {
      r = JSON.stringify(Array.from(e));
    } else if (s == "[object RegExp]") {
      r = JSON.stringify(e.source.replace("\\", ""));
    } else {
      r = JSON.stringify(e);
    }
    if (i == "[object Function]") {
      n = "expected Function";
    } else if (i == "[object Promise]") {
      n = "expected Promise";
    } else if (s == "[object Set]" || i == "[object Map]") {
      n = JSON.stringify(Array.from(t));
    } else if (s == "[object RegExp]") {
      n = JSON.stringify(t.source.replace("\\", ""));
    } else {
      n = JSON.stringify(t);
    }
    return r + " is not deep equal " + n;
  }
  function se(e, t, s, i) {
    let r = true;
    console.log("a is:" + e + ",b is:" + t);
    const n = ie(e, t);
    if (!X.isUndefined(n)) {
      return n;
    }
    if (e instanceof Error && t instanceof Error) {
      r = e.message == t.message;
      return r;
    }
    if (e === t) {
      r = e !== 0 || 1 / e == 1 / t;
      return r;
    }
    if (e === null || t === null) {
      r = e === t;
      return r;
    }
    const a = Object.prototype.toString.call(e);
    const o = Object.prototype.toString.call(t);
    console.log("aClassName is:" + a);
    console.log("bClassName is:" + o);
    if (a != o) {
      return false;
    }
    if (a === "[object String]") {
      r = e == String(t);
      return r;
    }
    if (a === "[object Number]") {
      r = e != +e ? t != +t : e === 0 && t === 0 ? 1 / e == 1 / t : e == +t;
      return r;
    }
    if (a === "[object Date]" || a === "[object Boolean]") {
      r = +e == +t;
      return r;
    }
    if (a === "[object ArrayBuffer]") {
      return se(new Uint8Array(e), new Uint8Array(t), s, i);
    }
    if (a === "[object RegExp]") {
      return e.source == t.source && e.global == t.global && e.multiline == t.multiline && e.ignoreCase == t.ignoreCase;
    }
    if (typeof e != "object" || typeof t != "object") {
      return false;
    }
    const c = X.isDomNode(e);
    const u = X.isDomNode(t);
    if (c && u) {
      r = e.isEqualNode(t);
      return r;
    }
    if (c || u) {
      return false;
    }
    const l = X.isPromise(e);
    const f = X.isPromise(t);
    if (l && f) {
      return e === t;
    }
    let h = s.length;
    while (h--) {
      if (s[h] == e) {
        return i[h] == t;
      }
    }
    s.push(e);
    i.push(t);
    let p = 0;
    if (a == "[object Array]") {
      const n = e.length;
      const a = t.length;
      if (n !== a) {
        return false;
      }
      for (let o = 0; o < n || o < a; o++) {
        r = se(o < n ? e[o] : void 0, o < a ? t[o] : void 0, s, i) && r;
      }
      if (!r) {
        return false;
      }
    } else if (X.isMap(e) && X.isMap(t)) {
      if (e.size != t.size) {
        return false;
      }
      const n = [];
      const a = [];
      e.forEach((function(e, t) {
        n.push(t);
      }));
      t.forEach((function(e, t) {
        a.push(t);
      }));
      const o = [ n, a ];
      const c = [ a, n ];
      for (let n = 0; r && n < o.length; n++) {
        const a = o[n];
        const u = c[n];
        for (let n = 0; r && n < a.length; n++) {
          const o = a[n];
          const c = u[n];
          const l = e.get(o);
          let f;
          if (X.isAsymmetricEqualityTester_(o) || X.isAsymmetricEqualityTester_(c) && se(o, c)) {
            f = t.get(c);
          } else {
            f = t.get(o);
          }
          r = se(l, f, s, i);
        }
      }
      if (!r) {
        return false;
      }
    } else if (X.isSet(e) && X.isSet(t)) {
      if (e.size != t.size) {
        return false;
      }
      const n = [];
      e.forEach((function(e) {
        n.push(e);
      }));
      const a = [];
      t.forEach((function(e) {
        a.push(e);
      }));
      const o = [ [ n, a ], [ a, n ] ];
      const c = [ [ s, i ], [ i, s ] ];
      for (let e = 0; r && e < o.length; e++) {
        const t = o[e][0];
        const s = o[e][1];
        const i = c[e][0];
        const n = c[e][1];
        for (const e of t) {
          let t = false;
          for (let r = 0; !t && r < s.length; r++) {
            const a = s[r];
            const o = i.length;
            t = se(e, a, i, n);
            if (!t && o !== i.length) {
              i.splice(o);
              n.splice(o);
            }
          }
          r = r && t;
        }
      }
      if (!r) {
        return false;
      }
    } else {
      const s = e.constructor, i = t.constructor;
      if (s !== i && X.isFunction_(s) && X.isFunction_(i) && e instanceof s && t instanceof i && !(s instanceof s && i instanceof i)) {
        return false;
      }
    }
    const g = X.keys(e, a == "[object Array]");
    p = g.length;
    if (X.keys(t, o == "[object Array]").length !== p) {
      return false;
    }
    for (const n of g) {
      console.log("key is:" + n);
      if (X.has(t, n)) {
        if (!se(e[n], t[n], s, i)) {
          r = false;
        }
      } else {
        r = false;
      }
    }
    if (!r) {
      return false;
    }
    s.pop();
    i.pop();
    return r;
  }
  function ie(e, t) {
    if (X.isAsymmetricEqualityTester_(e) !== X.isAsymmetricEqualityTester_(t)) {}
  }
  function re(e) {
    return !!e && ne(e.then);
  }
  function ne(e) {
    return ae("Function", e);
  }
  function ae(e, t) {
    return oe(t) === "[object " + e + "]";
  }
  function oe(e) {
    return Object.prototype.toString.apply(e);
  }
  function ce(e) {
    if (!re(e)) {
      return Promise.reject().then((function() {}), (function() {
        return {
          pass: false,
          message: "Expected not be called on a promise."
        };
      }));
    }
    const t = {};
    return Promise.race([ e, Promise.resolve(t) ]).then((function(e) {
      return t === e ? {
        pass: true,
        message: "actualValue is isPending"
      } : {
        pass: false,
        message: "expect isPending, actualValue is resolve"
      };
    }), (function() {
      return {
        pass: false,
        message: "expect isPending, actualValue is reject"
      };
    }));
  }
  function ue(e) {
    if (!re(e)) {
      return Promise.reject().then((function() {}), (function() {
        return {
          pass: false,
          message: "Expected not be called on a promise."
        };
      }));
    }
    const t = {};
    return Promise.race([ e, Promise.resolve(t) ]).then((function(e) {
      return {
        pass: false,
        message: "expect isRejected, but actualValue is " + (t === e ? "isPending" : "resolve")
      };
    }), (function() {
      return {
        pass: true,
        message: "actualValue is isRejected"
      };
    }));
  }
  function le(e, t) {
    if (!re(e)) {
      return Promise.reject().then((function() {}), (function() {
        return {
          pass: false,
          message: "Expected not be called on a promise."
        };
      }));
    }
    function s(e) {
      return "Expected a promise " + (e ? "not " : "") + "to be rejected with " + JSON.stringify(t[0]);
    }
    const i = {};
    return Promise.race([ e, Promise.resolve(i) ]).then((function(e) {
      return {
        pass: false,
        message: s(false) + " but actualValue is " + (i === e ? "isPending" : "resolve")
      };
    }), (function(e) {
      if (JSON.stringify(e) == JSON.stringify(t[0])) {
        return {
          pass: true,
          message: "actualValue was rejected with " + JSON.stringify(e) + "."
        };
      } else {
        return {
          pass: false,
          message: s(false) + " but it was rejected with " + JSON.stringify(e) + "."
        };
      }
    }));
  }
  function fe(e, t) {
    if (!re(e)) {
      return Promise.reject().then((function() {}), (function() {
        return {
          pass: false,
          message: "Expected not be called on a promise."
        };
      }));
    }
    const s = {};
    return Promise.race([ e, Promise.resolve(s) ]).then((function(e) {
      return {
        pass: false,
        message: "Expected a promise to be rejected but actualValue is " + (s === e ? "isPending" : "resolve")
      };
    }), (function(e) {
      return he(e, t);
    }));
  }
  function he(e, t) {
    if (t.length == 1 && typeof t[0] === "function") {
      if (t[0].name === e.__proto__.name) {
        return {
          pass: true,
          message: "actual error type is " + e.name + "."
        };
      } else {
        return {
          pass: false,
          message: "except error type is " + t[0].name + ",but actual is " + e.name + "."
        };
      }
    }
    if (t.length == 1 && typeof t[0] === "string") {
      if (t[0] === e.message) {
        return {
          pass: true,
          message: "actual error message is " + e.message + "."
        };
      } else {
        return {
          pass: false,
          message: "except error message " + t[0] + ",but actual is " + e.message + "."
        };
      }
    }
    if (t.length == 1) {
      return {
        pass: false,
        message: "When only one parameter, it " + "should be error type or error message."
      };
    }
    if (t.length == 2 && typeof t[0] === "function" && t[0].name === e.name) {
      if (typeof t[1] === "string" && e.message === t[1]) {
        return {
          pass: true,
          message: "actual error message is " + e.message + "."
        };
      } else {
        return {
          pass: false,
          message: "except error message is " + t[1] + ",but actual is " + e.message + "."
        };
      }
    }
    if (t.length == 2 && typeof t[0] === "function" && t[0].name !== e.name) {
      if (typeof t[1] === "string" && e.message === t[1]) {
        return {
          pass: false,
          message: "except error type is " + t[0].name + ",but actual is " + e.name + "."
        };
      } else {
        return {
          pass: false,
          message: "except error type and message are incorrect."
        };
      }
    }
    if (t.length > 2) {
      return {
        pass: false,
        message: "Up to two parameters are supported."
      };
    } else {
      return;
    }
  }
  function pe(e) {
    if (!re(e)) {
      return Promise.reject().then((function() {}), (function() {
        return {
          pass: false,
          message: "Expected not be called on a promise."
        };
      }));
    }
    const t = {};
    return Promise.race([ e, Promise.resolve(t) ]).then((function(e) {
      return t === e ? {
        pass: false,
        message: "expect resolve, actualValue is isPending"
      } : {
        pass: true,
        message: "actualValue is isResolved"
      };
    }), (function(e) {
      return {
        pass: false,
        message: "Expected a promise to be resolved but it was " + "rejected with " + JSON.stringify(e) + "."
      };
    }));
  }
  function ge(e, t) {
    if (!re(e)) {
      return Promise.reject().then((function() {}), (function() {
        return {
          pass: false,
          message: "Expected not be called on a promise."
        };
      }));
    }
    function s(e) {
      return "Expected a promise " + (e ? "not " : "") + "to be resolved with " + JSON.stringify(t[0]);
    }
    const i = {};
    return Promise.race([ e, Promise.resolve(i) ]).then((function(e) {
      if (i === e) {
        return {
          pass: false,
          message: "expect resolve, actualValue is isPending"
        };
      }
      if (JSON.stringify(e) == JSON.stringify(t[0])) {
        return {
          pass: true,
          message: "actualValue was resolved with " + JSON.stringify(e) + "."
        };
      } else {
        return {
          pass: false,
          message: s(false) + " but it was resolved with " + JSON.stringify(e) + "."
        };
      }
    }), (function(e) {
      return {
        pass: false,
        message: s(false) + " but it was rejected with " + JSON.stringify(e) + "."
      };
    }));
  }
  class Se {
    constructor(e) {
      this.id = e.id;
      this.matchers = {};
    }
    extendsMatchers() {
      this.matchers.assertNull = H;
      this.matchers.assertClose = M;
      this.matchers.assertContain = F;
      this.matchers.assertLess = J;
      this.matchers.assertLarger = L;
      this.matchers.assertFail = z;
      this.matchers.assertUndefined = $;
      this.matchers.assertFalse = q;
      this.matchers.assertInstanceOf = B;
      this.matchers.assertThrowError = K;
      this.matchers.assertLargerOrEqual = Y;
      this.matchers.assertLessOrEqual = G;
      this.matchers.assertNaN = W;
      this.matchers.assertNegUnlimited = Z;
      this.matchers.assertPosUnlimited = Q;
      this.matchers.assertDeepEquals = ee;
      this.matchers.assertPromiseIsPending = ce;
      this.matchers.assertPromiseIsRejected = ue;
      this.matchers.assertPromiseIsRejectedWith = le;
      this.matchers.assertPromiseIsRejectedWithError = fe;
      this.matchers.assertPromiseIsResolved = pe;
      this.matchers.assertPromiseIsResolvedWith = ge;
    }
    init(e) {
      this.coreContext = e;
      this.extendsMatchers();
      this.coreContext.getDefaultService("expect").addMatchers(this.matchers);
    }
    apis() {
      return {
        expect: function(e) {
          return this.coreContext.getDefaultService("expect").expect(e);
        }
      };
    }
  }
  async function me() {
    if (globalThis.__coverage__ === void 0) {
      return;
    }
    const e = JSON.stringify(globalThis.__coverage__);
    const t = e.length;
    const s = 500;
    const r = Math.floor(t / s);
    const n = "OHOS_REPORT_COVERAGE_DATA:";
    for (let t = 0; t <= r; t++) {
      await i.print(`${n} ${e.substring(t * s, (t + 1) * s)}`);
    }
  }
  class de {
    constructor(e) {
      this.delegator = e.delegator;
      this.abilityDelegatorArguments = e.abilityDelegatorArguments;
      this.id = "report";
      this.index = 0;
      this.duration = 0;
    }
    init(e) {
      this.coreContext = e;
      this.suiteService = this.coreContext.getDefaultService("suite");
      this.specService = this.coreContext.getDefaultService("spec");
    }
    taskStart() {}
    async taskDone() {
      if (this.abilityDelegatorArguments !== null) {
        this.taskDoneTime = (new Date).getTime();
        let e = this.suiteService.getSummary();
        if (this.coreContext.getDefaultService("config")["coverage"] === "true") {
          await me();
        }
        let t = "\n" + "OHOS_REPORT_RESULT: stream=Tests run: " + e.total + ", Failure: " + e.failure;
        t += ", Error: " + e.error;
        t += ", Pass: " + e.pass;
        t += ", Ignore: " + e.ignore;
        t += "\n" + "OHOS_REPORT_CODE: " + (e.failure > 0 ? -1 : 0) + "\n";
        let s = e.failure > 0 || e.error > 0;
        if (this.coreContext.getDefaultService("config").isBreakOnError() && s) {
          t += "\n" + "OHOS_REPORT_RESULT: breakOnError model, Stopping whole test suite if one specific test case failed or error" + "\n";
        }
        t += "OHOS_REPORT_STATUS: taskconsuming=" + e.duration + "\n";
        console.info(t);
        await i.print(t);
      }
      console.info("report print success");
      this.delegator.finishTest("your test finished!!!", 0, (() => {}));
    }
    incorrectFormat() {
      if (this.coreContext.getDefaultService("config").filterValid.length !== 0) {
        var e = "this param " + this.coreContext.getDefaultService("config").filterValid.join(",") + " is invalid" + "\n";
        this.delegator.finishTest(e, 0, (() => {}));
      }
    }
    async suiteStart() {
      if (this.abilityDelegatorArguments !== null) {
        let e = "\n" + "OHOS_REPORT_SUM: " + this.suiteService.getCurrentRunningSuite().getSpecsNum();
        e += "\n" + "OHOS_REPORT_STATUS: class=" + this.suiteService.getCurrentRunningSuite().description + "\n";
        console.info(e);
        await i.print(e);
        console.info(this.suiteService.getCurrentRunningSuite().description + " suiteStart print success");
      }
    }
    async suiteDone() {
      if (this.abilityDelegatorArguments !== null) {
        let e = "\n" + "OHOS_REPORT_STATUS: class=" + this.suiteService.getCurrentRunningSuite().description;
        e += "\n" + "OHOS_REPORT_STATUS: suiteconsuming=" + this.suiteService.getCurrentRunningSuite().duration + "\n";
        console.info(e);
        await i.print(e);
        console.info(this.suiteService.getCurrentRunningSuite().description + " suiteDone print success");
      }
    }
    async specStart() {
      if (this.abilityDelegatorArguments !== null) {
        let e = "\n" + "OHOS_REPORT_STATUS: class=" + this.suiteService.getCurrentRunningSuite().description;
        e += "\n" + "OHOS_REPORT_STATUS: current=" + ++this.index;
        e += "\n" + "OHOS_REPORT_STATUS: id=JS";
        e += "\n" + "OHOS_REPORT_STATUS: numtests=" + this.specService.getTestTotal();
        e += "\n" + "OHOS_REPORT_STATUS: stream=";
        e += "\n" + "OHOS_REPORT_STATUS: test=" + this.specService.currentRunningSpec.description;
        e += "\n" + "OHOS_REPORT_STATUS_CODE: 1" + "\n";
        console.info(e);
        await i.print(e);
        console.info(this.specService.currentRunningSpec.description + " specStart start print success");
      }
    }
    async specDone() {
      if (this.abilityDelegatorArguments !== null) {
        let e = "\n" + "OHOS_REPORT_STATUS: class=" + this.suiteService.getCurrentRunningSuite().description;
        e += "\n" + "OHOS_REPORT_STATUS: current=" + this.index;
        e += "\n" + "OHOS_REPORT_STATUS: id=JS";
        e += "\n" + "OHOS_REPORT_STATUS: numtests=" + this.specService.getTestTotal();
        let t = "";
        if (this.specService.currentRunningSpec.error) {
          e += "\n" + "OHOS_REPORT_STATUS: stack=" + this.specService.currentRunningSpec.error.message;
          e += "\n" + "OHOS_REPORT_STATUS: stream=";
          e += "\n" + "Error in " + this.specService.currentRunningSpec.description;
          e += "\n" + this.specService.currentRunningSpec.error.message;
          e += "\n" + "OHOS_REPORT_STATUS: test=" + this.specService.currentRunningSpec.description;
          e += "\n" + "OHOS_REPORT_STATUS_CODE: -1" + "\n";
        } else if (this.specService.currentRunningSpec.result) {
          if (this.specService.currentRunningSpec.result.failExpects.length > 0) {
            this.specService.currentRunningSpec.result.failExpects.forEach((e => {
              t = e.message || "expect " + e.actualValue + " " + e.checkFunc + " " + e.expectValue;
            }));
            e += "\n" + "OHOS_REPORT_STATUS: stack=" + t;
            e += "\n" + "OHOS_REPORT_STATUS: stream=";
            e += "\n" + "Error in " + this.specService.currentRunningSpec.description;
            e += "\n" + t + "\n" + "OHOS_REPORT_STATUS: test=" + this.specService.currentRunningSpec.description;
            e += "\n" + "OHOS_REPORT_STATUS_CODE: -2" + "\n";
          } else {
            e += "\n" + "OHOS_REPORT_STATUS: stream=";
            e += "\n" + "OHOS_REPORT_STATUS: test=" + this.specService.currentRunningSpec.description;
            e += "\n" + "OHOS_REPORT_STATUS_CODE: 0" + "\n";
          }
        } else {
          e += "\n";
        }
        e += "OHOS_REPORT_STATUS: consuming=" + this.specService.currentRunningSpec.duration + "\n";
        console.info(e);
        await i.print(e);
        console.info(this.specService.currentRunningSpec.description + " specDone end print success");
      }
    }
  }
  const ve = E.getInstance();
  const ye = function(e, t) {
    return Reflect.has(ve, "describe") ? ve.describe(e, t) : (e, t) => {};
  };
  const be = function(e, t, s) {
    return Reflect.has(ve, "it") ? ve.it(e, t, s) : (e, t, s) => {};
  };
  const Re = function(e) {
    return Reflect.has(ve, "beforeEach") ? ve.beforeEach(e) : e => {};
  };
  const Te = function(e) {
    return Reflect.has(ve, "afterEach") ? ve.afterEach(e) : e => {};
  };
  const Ee = function(e) {
    return Reflect.has(ve, "beforeAll") ? ve.beforeAll(e) : e => {};
  };
  const Oe = function(e) {
    return Reflect.has(ve, "afterAll") ? ve.afterAll(e) : e => {};
  };
  const xe = function(e) {
    return Reflect.has(ve, "expect") ? ve.expect(e) : e => {};
  };
  class we {
    static setData(e) {
      const t = E.getInstance();
      const s = new U({
        data: e
      });
      t.addService("dataDriver", s);
    }
    static setTimeConfig(e) {
      i.systemTime = e;
    }
    static hypiumTest(e, t, s) {
      const r = E.getInstance();
      const n = new Se({
        id: "extend"
      });
      r.addService("expect", n);
      const a = new de({
        delegator: e,
        abilityDelegatorArguments: t
      });
      i.delegator = e;
      r.addService("report", a);
      r.init();
      r.subscribeEvent("spec", a);
      r.subscribeEvent("suite", a);
      r.subscribeEvent("task", a);
      const o = r.getDefaultService("config");
      let c = {};
      if (t !== null) {
        c = o.translateParams(t.parameters);
      }
      console.info("parameters:" + JSON.stringify(c));
      o.setConfig(c);
      s();
      if (Object.prototype.hasOwnProperty.call(globalThis, "setupUiTestEnvironment")) {
        globalThis.setupUiTestEnvironment().then((() => {
          console.info("UiTestKit::after run uitest setup, start run testcases");
          r.execute(e);
        })).catch((t => {
          console.error("UiTestKit:: call setupUiTestEnvironment failure:" + t);
          r.execute(e);
        }));
      } else {
        console.info("UiTestKit:: no need to setup uitest, start run testcases");
        r.execute(e);
      }
    }
  }
  var Ce = globalThis.requireNapi("hilog");
  var Pe = globalThis.requireNapi("entry", true);
  function De() {
    ye("ActsAbilityTest", (function() {
      Ee((function() {}));
      Re((function() {}));
      Te((function() {}));
      Oe((function() {}));
      be("assertContain", 0, (function() {
        Ce.info(0, "testTag", "%{public}s", "it begin");
        Ce.info(0, "testTag", "%{public}s", "it begin1");
        console.info("add-------------c:--");
        let e = Pe.createAudioCapture();
        console.info("add-------------c:--" + e);
        xe(true).assertTrue();
      }));
    }));
  }
  function Ae() {
    De();
  }
  var Ne = globalThis.requireNapi("hilog");
  var _e = globalThis.requireNapi("app.ability.abilityDelegatorRegistry");
  var ke = {
    onCreate() {
      Ne.info(0, "testTag", "%{public}s", "Application onCreate");
      var e;
      e = _e.getAbilityDelegator();
      var t;
      t = _e.getArguments();
      Ne.info(0, "testTag", "%{public}s", "start run testcase!!!");
      we.hypiumTest(e, t, Ae);
    },
    onDestroy() {
      Ne.info(0, "testTag", "%{public}s", "Application onDestroy");
    }
  };
  exports.default = ke;
})();
//# sourceMappingURL=app.js.map
