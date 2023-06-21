"use strict";
(globalThis["webpackChunk_c68cb8cf9c98b4c0a62e46a1345884178ef4f7b1a57562f1384b7f1e069293c6"] = globalThis["webpackChunk_c68cb8cf9c98b4c0a62e46a1345884178ef4f7b1a57562f1384b7f1e069293c6"] || []).push([["vendors"],{

/***/ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/index.js":
/*!*****************************************************************************************************************************************************!*\
  !*** ../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/index.js ***!
  \*****************************************************************************************************************************************************/
/***/ ((__unused_webpack_module, exports, __webpack_require__) => {



var _interopRequireDefault = __webpack_require__(/*! @babel/runtime/helpers/interopRequireDefault */ "./node_modules/@babel/runtime/helpers/interopRequireDefault.js");
Object.defineProperty(exports, "__esModule", ({
  value: true
}));
Object.defineProperty(exports, "ArgumentMatchers", ({
  enumerable: true,
  get: function () {
    return _ArgumentMatchers.default;
  }
}));
Object.defineProperty(exports, "Core", ({
  enumerable: true,
  get: function () {
    return _core.default;
  }
}));
Object.defineProperty(exports, "DEFAULT", ({
  enumerable: true,
  get: function () {
    return _Constant.DEFAULT;
  }
}));
Object.defineProperty(exports, "DataDriver", ({
  enumerable: true,
  get: function () {
    return _DataDriver.default;
  }
}));
Object.defineProperty(exports, "ExpectExtend", ({
  enumerable: true,
  get: function () {
    return _ExpectExtend.default;
  }
}));
exports.Hypium = void 0;
Object.defineProperty(exports, "Level", ({
  enumerable: true,
  get: function () {
    return _Constant.Level;
  }
}));
Object.defineProperty(exports, "MockKit", ({
  enumerable: true,
  get: function () {
    return _MockKit.MockKit;
  }
}));
Object.defineProperty(exports, "OhReport", ({
  enumerable: true,
  get: function () {
    return _OhReport.default;
  }
}));
Object.defineProperty(exports, "Size", ({
  enumerable: true,
  get: function () {
    return _Constant.Size;
  }
}));
Object.defineProperty(exports, "SysTestKit", ({
  enumerable: true,
  get: function () {
    return _SysTestKit.default;
  }
}));
Object.defineProperty(exports, "TestType", ({
  enumerable: true,
  get: function () {
    return _Constant.TestType;
  }
}));
Object.defineProperty(exports, "afterAll", ({
  enumerable: true,
  get: function () {
    return _interface.afterAll;
  }
}));
Object.defineProperty(exports, "afterEach", ({
  enumerable: true,
  get: function () {
    return _interface.afterEach;
  }
}));
Object.defineProperty(exports, "beforeAll", ({
  enumerable: true,
  get: function () {
    return _interface.beforeAll;
  }
}));
Object.defineProperty(exports, "beforeEach", ({
  enumerable: true,
  get: function () {
    return _interface.beforeEach;
  }
}));
Object.defineProperty(exports, "describe", ({
  enumerable: true,
  get: function () {
    return _interface.describe;
  }
}));
Object.defineProperty(exports, "expect", ({
  enumerable: true,
  get: function () {
    return _interface.expect;
  }
}));
Object.defineProperty(exports, "it", ({
  enumerable: true,
  get: function () {
    return _interface.it;
  }
}));
Object.defineProperty(exports, "when", ({
  enumerable: true,
  get: function () {
    return _MockKit.when;
  }
}));
var _core = _interopRequireDefault(__webpack_require__(/*! ./src/main/core */ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/core.js"));
var _Constant = __webpack_require__(/*! ./src/main/Constant */ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/Constant.js");
var _DataDriver = _interopRequireDefault(__webpack_require__(/*! ./src/main/module/config/DataDriver */ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/config/DataDriver.js"));
var _ExpectExtend = _interopRequireDefault(__webpack_require__(/*! ./src/main/module/assert/ExpectExtend */ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/assert/ExpectExtend.js"));
var _OhReport = _interopRequireDefault(__webpack_require__(/*! ./src/main/module/report/OhReport */ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/report/OhReport.js"));
var _SysTestKit = _interopRequireDefault(__webpack_require__(/*! ./src/main/module/kit/SysTestKit */ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/kit/SysTestKit.js"));
var _interface = __webpack_require__(/*! ./src/main/interface */ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/interface.js");
var _MockKit = __webpack_require__(/*! ./src/main/module/mock/MockKit */ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/mock/MockKit.js");
var _ArgumentMatchers = _interopRequireDefault(__webpack_require__(/*! ./src/main/module/mock/ArgumentMatchers */ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/mock/ArgumentMatchers.js"));
class Hypium {
  static setData(data) {
    const core = _core.default.getInstance();
    const dataDriver = new _DataDriver.default({
      data
    });
    core.addService('dataDriver', dataDriver);
  }
  static setTimeConfig(systemTime) {
    _SysTestKit.default.systemTime = systemTime;
  }
  static hypiumTest(abilityDelegator, abilityDelegatorArguments, testsuite) {
    const core = _core.default.getInstance();
    const expectExtend = new _ExpectExtend.default({
      'id': 'extend'
    });
    core.addService('expect', expectExtend);
    const ohReport = new _OhReport.default({
      'delegator': abilityDelegator,
      'abilityDelegatorArguments': abilityDelegatorArguments
    });
    _SysTestKit.default.delegator = abilityDelegator;
    core.addService('report', ohReport);
    core.init();
    core.subscribeEvent('spec', ohReport);
    core.subscribeEvent('suite', ohReport);
    core.subscribeEvent('task', ohReport);
    const configService = core.getDefaultService('config');
    let testParameters = {};
    if (abilityDelegatorArguments !== null) {
      testParameters = configService.translateParams(abilityDelegatorArguments.parameters);
    }
    console.info('parameters:' + JSON.stringify(testParameters));
    configService.setConfig(testParameters);
    testsuite();
    if (Object.prototype.hasOwnProperty.call(globalThis, 'setupUiTestEnvironment')) {
      globalThis.setupUiTestEnvironment().then(() => {
        console.info('UiTestKit::after run uitest setup, start run testcases');
        core.execute(abilityDelegator);
      }).catch(error => {
        console.error('UiTestKit:: call setupUiTestEnvironment failure:' + error);
        core.execute(abilityDelegator);
      });
    } else {
      console.info('UiTestKit:: no need to setup uitest, start run testcases');
      core.execute(abilityDelegator);
    }
  }
}
exports.Hypium = Hypium;

function requireModule(moduleName) {
  const systemList = ['system.router', 'system.app', 'system.prompt', 'system.configuration',
  'system.image', 'system.device', 'system.mediaquery', 'ohos.animator', 'system.grid', 'system.resource']
  var target = ''
  if (systemList.includes(moduleName.replace('@', ''))) {
    target = $app_require$('@app-module/' + moduleName.substring(1));
    return target;
  }
  var shortName = moduleName.replace(/@[^.]+.([^.]+)/, '$1');
  target = requireNapi(shortName);
  if (typeof target !== 'undefined' && /@ohos/.test(moduleName)) {
    return target;
  }
  if (typeof ohosplugin !== 'undefined' && /@ohos/.test(moduleName)) {
    target = ohosplugin;
    for (let key of shortName.split('.')) {
      target = target[key];
      if(!target) {
        break;
      }
    }
    if (typeof target !== 'undefined') {
      return target;
    }
  }
  if (typeof systemplugin !== 'undefined') {
    target = systemplugin;
    for (let key of shortName.split('.')) {
      target = target[key];
      if(!target) {
        break;
      }
    }
    if (typeof target !== 'undefined') {
      return target;
    }
  }
  return target;
}


/***/ }),

/***/ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/Constant.js":
/*!*****************************************************************************************************************************************************************!*\
  !*** ../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/Constant.js ***!
  \*****************************************************************************************************************************************************************/
/***/ ((__unused_webpack_module, exports, __webpack_require__) => {



var _interopRequireDefault = __webpack_require__(/*! @babel/runtime/helpers/interopRequireDefault */ "./node_modules/@babel/runtime/helpers/interopRequireDefault.js");
Object.defineProperty(exports, "__esModule", ({
  value: true
}));
exports.TestType = exports.Size = exports.Level = exports.DEFAULT = void 0;
var _defineProperty2 = _interopRequireDefault(__webpack_require__(/*! @babel/runtime/helpers/defineProperty */ "./node_modules/@babel/runtime/helpers/defineProperty.js"));
const DEFAULT = 0B0000;
exports.DEFAULT = DEFAULT;
class TestType {}
exports.TestType = TestType;
(0, _defineProperty2.default)(TestType, "FUNCTION", 0B1);
(0, _defineProperty2.default)(TestType, "PERFORMANCE", 0B1 << 1);
(0, _defineProperty2.default)(TestType, "POWER", 0B1 << 2);
(0, _defineProperty2.default)(TestType, "RELIABILITY", 0B1 << 3);
(0, _defineProperty2.default)(TestType, "SECURITY", 0B1 << 4);
(0, _defineProperty2.default)(TestType, "GLOBAL", 0B1 << 5);
(0, _defineProperty2.default)(TestType, "COMPATIBILITY", 0B1 << 6);
(0, _defineProperty2.default)(TestType, "USER", 0B1 << 7);
(0, _defineProperty2.default)(TestType, "STANDARD", 0B1 << 8);
(0, _defineProperty2.default)(TestType, "SAFETY", 0B1 << 9);
(0, _defineProperty2.default)(TestType, "RESILIENCE", 0B1 << 10);
class Size {}
exports.Size = Size;
(0, _defineProperty2.default)(Size, "SMALLTEST", 0B1 << 16);
(0, _defineProperty2.default)(Size, "MEDIUMTEST", 0B1 << 17);
(0, _defineProperty2.default)(Size, "LARGETEST", 0B1 << 18);
class Level {}
exports.Level = Level;
(0, _defineProperty2.default)(Level, "LEVEL0", 0B1 << 24);
(0, _defineProperty2.default)(Level, "LEVEL1", 0B1 << 25);
(0, _defineProperty2.default)(Level, "LEVEL2", 0B1 << 26);
(0, _defineProperty2.default)(Level, "LEVEL3", 0B1 << 27);
(0, _defineProperty2.default)(Level, "LEVEL4", 0B1 << 28);

function requireModule(moduleName) {
  const systemList = ['system.router', 'system.app', 'system.prompt', 'system.configuration',
  'system.image', 'system.device', 'system.mediaquery', 'ohos.animator', 'system.grid', 'system.resource']
  var target = ''
  if (systemList.includes(moduleName.replace('@', ''))) {
    target = $app_require$('@app-module/' + moduleName.substring(1));
    return target;
  }
  var shortName = moduleName.replace(/@[^.]+.([^.]+)/, '$1');
  target = requireNapi(shortName);
  if (typeof target !== 'undefined' && /@ohos/.test(moduleName)) {
    return target;
  }
  if (typeof ohosplugin !== 'undefined' && /@ohos/.test(moduleName)) {
    target = ohosplugin;
    for (let key of shortName.split('.')) {
      target = target[key];
      if(!target) {
        break;
      }
    }
    if (typeof target !== 'undefined') {
      return target;
    }
  }
  if (typeof systemplugin !== 'undefined') {
    target = systemplugin;
    for (let key of shortName.split('.')) {
      target = target[key];
      if(!target) {
        break;
      }
    }
    if (typeof target !== 'undefined') {
      return target;
    }
  }
  return target;
}


/***/ }),

/***/ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/core.js":
/*!*************************************************************************************************************************************************************!*\
  !*** ../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/core.js ***!
  \*************************************************************************************************************************************************************/
/***/ ((__unused_webpack_module, exports, __webpack_require__) => {



Object.defineProperty(exports, "__esModule", ({
  value: true
}));
exports["default"] = void 0;
var _service = __webpack_require__(/*! ./service */ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/service.js");
var _configService = __webpack_require__(/*! ./module/config/configService */ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/config/configService.js");
var _event = __webpack_require__(/*! ./event */ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/event.js");
class Core {
  static getInstance() {
    if (!this.instance) {
      this.instance = new Core();
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
  addService(name, service) {
    let serviceObj = {};
    if (!this.services[name]) {
      this.services[name] = serviceObj;
    } else {
      serviceObj = this.services[name];
    }
    serviceObj[service.id] = service;
  }
  getDefaultService(name) {
    return this.services[name].default;
  }
  getServices(name) {
    return this.services[name];
  }
  registerEvent(serviceName, event) {
    let eventObj = {};
    if (!this.events[serviceName]) {
      this.events[serviceName] = eventObj;
    } else {
      eventObj = this.events[serviceName];
    }
    eventObj[event.id] = event;
  }
  unRegisterEvent(serviceName, eventID) {
    const eventObj = this.events[serviceName];
    if (eventObj) {
      delete eventObj[eventID];
    }
  }
  subscribeEvent(serviceName, serviceObj) {
    const eventObj = this.events[serviceName];
    if (eventObj) {
      for (const attr in eventObj) {
        eventObj[attr]['subscribeEvent'](serviceObj);
      }
    }
  }
  async fireEvents(serviceName, eventName) {
    const eventObj = this.events[serviceName];
    if (!eventObj) {
      return;
    }
    for (const attr in eventObj) {
      await eventObj[attr][eventName]();
    }
  }
  addToGlobal(apis) {
    if (typeof globalThis !== 'undefined') {
      for (let api in apis) {
        globalThis[api] = apis[api];
      }
    }
    for (const api in apis) {
      this[api] = apis[api];
    }
  }
  init() {
    this.addService('suite', new _service.SuiteService({
      id: 'default'
    }));
    this.addService('spec', new _service.SpecService({
      id: 'default'
    }));
    this.addService('expect', new _service.ExpectService({
      id: 'default'
    }));
    this.addService('report', new _service.ReportService({
      id: 'default'
    }));
    this.addService('config', new _configService.ConfigService({
      id: 'default'
    }));
    this.registerEvent('task', new _event.TaskEvent({
      id: 'default',
      coreContext: this
    }));
    this.registerEvent('suite', new _event.SuiteEvent({
      id: 'default',
      coreContext: this
    }));
    this.registerEvent('spec', new _event.SpecEvent({
      id: 'default',
      coreContext: this
    }));
    this.subscribeEvent('spec', this.getDefaultService('report'));
    this.subscribeEvent('suite', this.getDefaultService('report'));
    this.subscribeEvent('task', this.getDefaultService('report'));
    const context = this;
    for (const key in this.services) {
      const serviceObj = this.services[key];
      for (const serviceID in serviceObj) {
        const service = serviceObj[serviceID];
        service.init(context);
        if (typeof service.apis !== 'function') {
          continue;
        }
        const apis = service.apis();
        if (apis) {
          this.addToGlobal(apis);
        }
      }
    }
  }
  execute(abilityDelegator) {
    const suiteService = this.getDefaultService('suite');
    const configService = this.getDefaultService('config');
    if (configService['dryRun'] === 'true') {
      (async function () {
        await suiteService.dryRun(abilityDelegator);
      })();
      return;
    }
    setTimeout(() => {
      suiteService.execute();
    }, 10);
  }
}
var _default = Core;
exports["default"] = _default;

function requireModule(moduleName) {
  const systemList = ['system.router', 'system.app', 'system.prompt', 'system.configuration',
  'system.image', 'system.device', 'system.mediaquery', 'ohos.animator', 'system.grid', 'system.resource']
  var target = ''
  if (systemList.includes(moduleName.replace('@', ''))) {
    target = $app_require$('@app-module/' + moduleName.substring(1));
    return target;
  }
  var shortName = moduleName.replace(/@[^.]+.([^.]+)/, '$1');
  target = requireNapi(shortName);
  if (typeof target !== 'undefined' && /@ohos/.test(moduleName)) {
    return target;
  }
  if (typeof ohosplugin !== 'undefined' && /@ohos/.test(moduleName)) {
    target = ohosplugin;
    for (let key of shortName.split('.')) {
      target = target[key];
      if(!target) {
        break;
      }
    }
    if (typeof target !== 'undefined') {
      return target;
    }
  }
  if (typeof systemplugin !== 'undefined') {
    target = systemplugin;
    for (let key of shortName.split('.')) {
      target = target[key];
      if(!target) {
        break;
      }
    }
    if (typeof target !== 'undefined') {
      return target;
    }
  }
  return target;
}


/***/ }),

/***/ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/event.js":
/*!**************************************************************************************************************************************************************!*\
  !*** ../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/event.js ***!
  \**************************************************************************************************************************************************************/
/***/ ((__unused_webpack_module, exports) => {



Object.defineProperty(exports, "__esModule", ({
  value: true
}));
exports.TaskEvent = exports.SuiteEvent = exports.SpecEvent = void 0;
class SpecEvent {
  constructor(attr) {
    this.id = attr.id;
    this.coreContext = attr.context;
    this.eventMonitors = [];
  }
  subscribeEvent(service) {
    this.eventMonitors.push(service);
  }
  async specStart() {
    for (const monitor of this.eventMonitors) {
      await monitor['specStart']();
    }
  }
  async specDone() {
    for (const monitor of this.eventMonitors) {
      await monitor['specDone']();
    }
  }
}
exports.SpecEvent = SpecEvent;
class SuiteEvent {
  constructor(attr) {
    this.id = attr.id;
    this.suiteContext = attr.coreContext;
    this.eventMonitors = [];
  }
  subscribeEvent(service) {
    this.eventMonitors.push(service);
  }
  async suiteStart() {
    for (const monitor of this.eventMonitors) {
      await monitor['suiteStart']();
    }
  }
  async suiteDone() {
    for (const monitor of this.eventMonitors) {
      await monitor['suiteDone']();
    }
  }
}
exports.SuiteEvent = SuiteEvent;
class TaskEvent {
  constructor(attr) {
    this.id = attr.id;
    this.coreContext = attr.coreContext;
    this.eventMonitors = [];
  }
  subscribeEvent(service) {
    this.eventMonitors.push(service);
  }
  async taskStart() {
    for (const monitor of this.eventMonitors) {
      await monitor['taskStart']();
    }
  }
  async taskDone() {
    for (const monitor of this.eventMonitors) {
      await monitor['taskDone']();
    }
  }
  incorrectFormat() {
    for (const monitor of this.eventMonitors) {
      monitor['incorrectFormat']();
    }
  }
}
exports.TaskEvent = TaskEvent;

function requireModule(moduleName) {
  const systemList = ['system.router', 'system.app', 'system.prompt', 'system.configuration',
  'system.image', 'system.device', 'system.mediaquery', 'ohos.animator', 'system.grid', 'system.resource']
  var target = ''
  if (systemList.includes(moduleName.replace('@', ''))) {
    target = $app_require$('@app-module/' + moduleName.substring(1));
    return target;
  }
  var shortName = moduleName.replace(/@[^.]+.([^.]+)/, '$1');
  target = requireNapi(shortName);
  if (typeof target !== 'undefined' && /@ohos/.test(moduleName)) {
    return target;
  }
  if (typeof ohosplugin !== 'undefined' && /@ohos/.test(moduleName)) {
    target = ohosplugin;
    for (let key of shortName.split('.')) {
      target = target[key];
      if(!target) {
        break;
      }
    }
    if (typeof target !== 'undefined') {
      return target;
    }
  }
  if (typeof systemplugin !== 'undefined') {
    target = systemplugin;
    for (let key of shortName.split('.')) {
      target = target[key];
      if(!target) {
        break;
      }
    }
    if (typeof target !== 'undefined') {
      return target;
    }
  }
  return target;
}


/***/ }),

/***/ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/interface.js":
/*!******************************************************************************************************************************************************************!*\
  !*** ../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/interface.js ***!
  \******************************************************************************************************************************************************************/
/***/ ((__unused_webpack_module, exports, __webpack_require__) => {



var _interopRequireDefault = __webpack_require__(/*! @babel/runtime/helpers/interopRequireDefault */ "./node_modules/@babel/runtime/helpers/interopRequireDefault.js");
Object.defineProperty(exports, "__esModule", ({
  value: true
}));
exports.it = exports.expect = exports.describe = exports.beforeEach = exports.beforeAll = exports.afterEach = exports.afterAll = void 0;
var _core = _interopRequireDefault(__webpack_require__(/*! ./core */ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/core.js"));
const core = _core.default.getInstance();
const describe = function (desc, func) {
  return Reflect.has(core, 'describe') ? core.describe(desc, func) : (desc, func) => {};
};
exports.describe = describe;
const it = function (desc, filter, func) {
  return Reflect.has(core, 'it') ? core.it(desc, filter, func) : (desc, filter, func) => {};
};
exports.it = it;
const beforeEach = function (func) {
  return Reflect.has(core, 'beforeEach') ? core.beforeEach(func) : func => {};
};
exports.beforeEach = beforeEach;
const afterEach = function (func) {
  return Reflect.has(core, 'afterEach') ? core.afterEach(func) : func => {};
};
exports.afterEach = afterEach;
const beforeAll = function (func) {
  return Reflect.has(core, 'beforeAll') ? core.beforeAll(func) : func => {};
};
exports.beforeAll = beforeAll;
const afterAll = function (func) {
  return Reflect.has(core, 'afterAll') ? core.afterAll(func) : func => {};
};
exports.afterAll = afterAll;
const expect = function (actualValue) {
  return Reflect.has(core, 'expect') ? core.expect(actualValue) : actualValue => {};
};
exports.expect = expect;

function requireModule(moduleName) {
  const systemList = ['system.router', 'system.app', 'system.prompt', 'system.configuration',
  'system.image', 'system.device', 'system.mediaquery', 'ohos.animator', 'system.grid', 'system.resource']
  var target = ''
  if (systemList.includes(moduleName.replace('@', ''))) {
    target = $app_require$('@app-module/' + moduleName.substring(1));
    return target;
  }
  var shortName = moduleName.replace(/@[^.]+.([^.]+)/, '$1');
  target = requireNapi(shortName);
  if (typeof target !== 'undefined' && /@ohos/.test(moduleName)) {
    return target;
  }
  if (typeof ohosplugin !== 'undefined' && /@ohos/.test(moduleName)) {
    target = ohosplugin;
    for (let key of shortName.split('.')) {
      target = target[key];
      if(!target) {
        break;
      }
    }
    if (typeof target !== 'undefined') {
      return target;
    }
  }
  if (typeof systemplugin !== 'undefined') {
    target = systemplugin;
    for (let key of shortName.split('.')) {
      target = target[key];
      if(!target) {
        break;
      }
    }
    if (typeof target !== 'undefined') {
      return target;
    }
  }
  return target;
}


/***/ }),

/***/ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/assert/ExpectExtend.js":
/*!***********************************************************************************************************************************************************************************!*\
  !*** ../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/assert/ExpectExtend.js ***!
  \***********************************************************************************************************************************************************************************/
/***/ ((__unused_webpack_module, exports, __webpack_require__) => {



var _interopRequireDefault = __webpack_require__(/*! @babel/runtime/helpers/interopRequireDefault */ "./node_modules/@babel/runtime/helpers/interopRequireDefault.js");
Object.defineProperty(exports, "__esModule", ({
  value: true
}));
exports["default"] = void 0;
var _assertNull = _interopRequireDefault(__webpack_require__(/*! ./assertNull */ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/assert/assertNull.js"));
var _assertClose = _interopRequireDefault(__webpack_require__(/*! ./assertClose */ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/assert/assertClose.js"));
var _assertContain = _interopRequireDefault(__webpack_require__(/*! ./assertContain */ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/assert/assertContain.js"));
var _assertLess = _interopRequireDefault(__webpack_require__(/*! ./assertLess */ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/assert/assertLess.js"));
var _assertLarger = _interopRequireDefault(__webpack_require__(/*! ./assertLarger */ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/assert/assertLarger.js"));
var _assertFail = _interopRequireDefault(__webpack_require__(/*! ./assertFail */ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/assert/assertFail.js"));
var _assertUndefined = _interopRequireDefault(__webpack_require__(/*! ./assertUndefined */ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/assert/assertUndefined.js"));
var _assertFalse = _interopRequireDefault(__webpack_require__(/*! ./assertFalse */ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/assert/assertFalse.js"));
var _assertInstanceOf = _interopRequireDefault(__webpack_require__(/*! ./assertInstanceOf */ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/assert/assertInstanceOf.js"));
var _assertThrowError = _interopRequireDefault(__webpack_require__(/*! ./assertThrowError */ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/assert/assertThrowError.js"));
var _assertLargerOrEqual = _interopRequireDefault(__webpack_require__(/*! ./assertLargerOrEqual */ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/assert/assertLargerOrEqual.js"));
var _assertLessOrEqual = _interopRequireDefault(__webpack_require__(/*! ./assertLessOrEqual */ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/assert/assertLessOrEqual.js"));
var _assertNaN = _interopRequireDefault(__webpack_require__(/*! ./assertNaN */ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/assert/assertNaN.js"));
var _assertNegUnlimited = _interopRequireDefault(__webpack_require__(/*! ./assertNegUnlimited */ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/assert/assertNegUnlimited.js"));
var _assertPosUnlimited = _interopRequireDefault(__webpack_require__(/*! ./assertPosUnlimited */ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/assert/assertPosUnlimited.js"));
var _assertDeepEquals = _interopRequireDefault(__webpack_require__(/*! ./deepEquals/assertDeepEquals */ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/assert/deepEquals/assertDeepEquals.js"));
var _assertPromiseIsPending = _interopRequireDefault(__webpack_require__(/*! ./assertPromiseIsPending */ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/assert/assertPromiseIsPending.js"));
var _assertPromiseIsRejected = _interopRequireDefault(__webpack_require__(/*! ./assertPromiseIsRejected */ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/assert/assertPromiseIsRejected.js"));
var _assertPromiseIsRejectedWith = _interopRequireDefault(__webpack_require__(/*! ./assertPromiseIsRejectedWith */ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/assert/assertPromiseIsRejectedWith.js"));
var _assertPromiseIsRejectedWithError = _interopRequireDefault(__webpack_require__(/*! ./assertPromiseIsRejectedWithError */ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/assert/assertPromiseIsRejectedWithError.js"));
var _assertPromiseIsResolved = _interopRequireDefault(__webpack_require__(/*! ./assertPromiseIsResolved */ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/assert/assertPromiseIsResolved.js"));
var _assertPromiseIsResolvedWith = _interopRequireDefault(__webpack_require__(/*! ./assertPromiseIsResolvedWith */ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/assert/assertPromiseIsResolvedWith.js"));
class ExpectExtend {
  constructor(attr) {
    this.id = attr.id;
    this.matchers = {};
  }
  extendsMatchers() {
    this.matchers.assertNull = _assertNull.default;
    this.matchers.assertClose = _assertClose.default;
    this.matchers.assertContain = _assertContain.default;
    this.matchers.assertLess = _assertLess.default;
    this.matchers.assertLarger = _assertLarger.default;
    this.matchers.assertFail = _assertFail.default;
    this.matchers.assertUndefined = _assertUndefined.default;
    this.matchers.assertFalse = _assertFalse.default;
    this.matchers.assertInstanceOf = _assertInstanceOf.default;
    this.matchers.assertThrowError = _assertThrowError.default;
    this.matchers.assertLargerOrEqual = _assertLargerOrEqual.default;
    this.matchers.assertLessOrEqual = _assertLessOrEqual.default;
    this.matchers.assertNaN = _assertNaN.default;
    this.matchers.assertNegUnlimited = _assertNegUnlimited.default;
    this.matchers.assertPosUnlimited = _assertPosUnlimited.default;
    this.matchers.assertDeepEquals = _assertDeepEquals.default;
    this.matchers.assertPromiseIsPending = _assertPromiseIsPending.default;
    this.matchers.assertPromiseIsRejected = _assertPromiseIsRejected.default;
    this.matchers.assertPromiseIsRejectedWith = _assertPromiseIsRejectedWith.default;
    this.matchers.assertPromiseIsRejectedWithError = _assertPromiseIsRejectedWithError.default;
    this.matchers.assertPromiseIsResolved = _assertPromiseIsResolved.default;
    this.matchers.assertPromiseIsResolvedWith = _assertPromiseIsResolvedWith.default;
  }
  init(coreContext) {
    this.coreContext = coreContext;
    this.extendsMatchers();
    const expectService = this.coreContext.getDefaultService('expect');
    expectService.addMatchers(this.matchers);
  }
  apis() {
    return {
      'expect': function (actualValue) {
        return this.coreContext.getDefaultService('expect').expect(actualValue);
      }
    };
  }
}
var _default = ExpectExtend;
exports["default"] = _default;

function requireModule(moduleName) {
  const systemList = ['system.router', 'system.app', 'system.prompt', 'system.configuration',
  'system.image', 'system.device', 'system.mediaquery', 'ohos.animator', 'system.grid', 'system.resource']
  var target = ''
  if (systemList.includes(moduleName.replace('@', ''))) {
    target = $app_require$('@app-module/' + moduleName.substring(1));
    return target;
  }
  var shortName = moduleName.replace(/@[^.]+.([^.]+)/, '$1');
  target = requireNapi(shortName);
  if (typeof target !== 'undefined' && /@ohos/.test(moduleName)) {
    return target;
  }
  if (typeof ohosplugin !== 'undefined' && /@ohos/.test(moduleName)) {
    target = ohosplugin;
    for (let key of shortName.split('.')) {
      target = target[key];
      if(!target) {
        break;
      }
    }
    if (typeof target !== 'undefined') {
      return target;
    }
  }
  if (typeof systemplugin !== 'undefined') {
    target = systemplugin;
    for (let key of shortName.split('.')) {
      target = target[key];
      if(!target) {
        break;
      }
    }
    if (typeof target !== 'undefined') {
      return target;
    }
  }
  return target;
}


/***/ }),

/***/ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/assert/assertClose.js":
/*!**********************************************************************************************************************************************************************************!*\
  !*** ../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/assert/assertClose.js ***!
  \**********************************************************************************************************************************************************************************/
/***/ ((__unused_webpack_module, exports) => {



Object.defineProperty(exports, "__esModule", ({
  value: true
}));
exports["default"] = void 0;
function assertClose(actualValue, expected) {
  console.log('expected:' + expected[0] + ',precision:' + expected[1]);
  if (actualValue === null && expected[0] === null) {
    throw new Error('actualValue and expected can not be both null!!!');
  }
  let result;
  let diff = Math.abs(expected[0] - actualValue);
  let actualAbs = Math.abs(actualValue);
  if (actualAbs - 0 === 0) {
    if (diff - 0 === 0) {
      result = true;
    } else {
      result = false;
    }
  } else if (diff / actualAbs < expected[1]) {
    result = true;
  } else {
    result = false;
  }
  return {
    pass: result,
    message: '|' + actualValue + ' - ' + expected[0] + '|/' + actualValue + ' is not less than ' + expected[1]
  };
}
var _default = assertClose;
exports["default"] = _default;

function requireModule(moduleName) {
  const systemList = ['system.router', 'system.app', 'system.prompt', 'system.configuration',
  'system.image', 'system.device', 'system.mediaquery', 'ohos.animator', 'system.grid', 'system.resource']
  var target = ''
  if (systemList.includes(moduleName.replace('@', ''))) {
    target = $app_require$('@app-module/' + moduleName.substring(1));
    return target;
  }
  var shortName = moduleName.replace(/@[^.]+.([^.]+)/, '$1');
  target = requireNapi(shortName);
  if (typeof target !== 'undefined' && /@ohos/.test(moduleName)) {
    return target;
  }
  if (typeof ohosplugin !== 'undefined' && /@ohos/.test(moduleName)) {
    target = ohosplugin;
    for (let key of shortName.split('.')) {
      target = target[key];
      if(!target) {
        break;
      }
    }
    if (typeof target !== 'undefined') {
      return target;
    }
  }
  if (typeof systemplugin !== 'undefined') {
    target = systemplugin;
    for (let key of shortName.split('.')) {
      target = target[key];
      if(!target) {
        break;
      }
    }
    if (typeof target !== 'undefined') {
      return target;
    }
  }
  return target;
}


/***/ }),

/***/ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/assert/assertContain.js":
/*!************************************************************************************************************************************************************************************!*\
  !*** ../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/assert/assertContain.js ***!
  \************************************************************************************************************************************************************************************/
/***/ ((__unused_webpack_module, exports) => {



Object.defineProperty(exports, "__esModule", ({
  value: true
}));
exports["default"] = void 0;
function assertContain(actualValue, expect) {
  let result = false;
  if (Object.prototype.toString.call(actualValue).indexOf('Array')) {
    for (let i in actualValue) {
      if (actualValue[i] == expect[0]) {
        result = true;
      }
    }
  }
  let type = Object.prototype.toString.call(actualValue);
  if (type === '[object String]') {
    result = actualValue.indexOf(expect[0]) >= 0;
  }
  return {
    pass: result,
    message: 'expect false, ' + actualValue + ' do not have  ' + expect[0]
  };
}
var _default = assertContain;
exports["default"] = _default;

function requireModule(moduleName) {
  const systemList = ['system.router', 'system.app', 'system.prompt', 'system.configuration',
  'system.image', 'system.device', 'system.mediaquery', 'ohos.animator', 'system.grid', 'system.resource']
  var target = ''
  if (systemList.includes(moduleName.replace('@', ''))) {
    target = $app_require$('@app-module/' + moduleName.substring(1));
    return target;
  }
  var shortName = moduleName.replace(/@[^.]+.([^.]+)/, '$1');
  target = requireNapi(shortName);
  if (typeof target !== 'undefined' && /@ohos/.test(moduleName)) {
    return target;
  }
  if (typeof ohosplugin !== 'undefined' && /@ohos/.test(moduleName)) {
    target = ohosplugin;
    for (let key of shortName.split('.')) {
      target = target[key];
      if(!target) {
        break;
      }
    }
    if (typeof target !== 'undefined') {
      return target;
    }
  }
  if (typeof systemplugin !== 'undefined') {
    target = systemplugin;
    for (let key of shortName.split('.')) {
      target = target[key];
      if(!target) {
        break;
      }
    }
    if (typeof target !== 'undefined') {
      return target;
    }
  }
  return target;
}


/***/ }),

/***/ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/assert/assertFail.js":
/*!*********************************************************************************************************************************************************************************!*\
  !*** ../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/assert/assertFail.js ***!
  \*********************************************************************************************************************************************************************************/
/***/ ((__unused_webpack_module, exports) => {



Object.defineProperty(exports, "__esModule", ({
  value: true
}));
exports["default"] = void 0;
function assertFail() {
  return {
    pass: false,
    message: 'fail '
  };
}
var _default = assertFail;
exports["default"] = _default;

function requireModule(moduleName) {
  const systemList = ['system.router', 'system.app', 'system.prompt', 'system.configuration',
  'system.image', 'system.device', 'system.mediaquery', 'ohos.animator', 'system.grid', 'system.resource']
  var target = ''
  if (systemList.includes(moduleName.replace('@', ''))) {
    target = $app_require$('@app-module/' + moduleName.substring(1));
    return target;
  }
  var shortName = moduleName.replace(/@[^.]+.([^.]+)/, '$1');
  target = requireNapi(shortName);
  if (typeof target !== 'undefined' && /@ohos/.test(moduleName)) {
    return target;
  }
  if (typeof ohosplugin !== 'undefined' && /@ohos/.test(moduleName)) {
    target = ohosplugin;
    for (let key of shortName.split('.')) {
      target = target[key];
      if(!target) {
        break;
      }
    }
    if (typeof target !== 'undefined') {
      return target;
    }
  }
  if (typeof systemplugin !== 'undefined') {
    target = systemplugin;
    for (let key of shortName.split('.')) {
      target = target[key];
      if(!target) {
        break;
      }
    }
    if (typeof target !== 'undefined') {
      return target;
    }
  }
  return target;
}


/***/ }),

/***/ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/assert/assertFalse.js":
/*!**********************************************************************************************************************************************************************************!*\
  !*** ../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/assert/assertFalse.js ***!
  \**********************************************************************************************************************************************************************************/
/***/ ((__unused_webpack_module, exports) => {



Object.defineProperty(exports, "__esModule", ({
  value: true
}));
exports["default"] = void 0;
function assertFalse(actualValue) {
  return {
    pass: actualValue === false,
    message: 'expect false, actualValue is ' + actualValue
  };
}
var _default = assertFalse;
exports["default"] = _default;

function requireModule(moduleName) {
  const systemList = ['system.router', 'system.app', 'system.prompt', 'system.configuration',
  'system.image', 'system.device', 'system.mediaquery', 'ohos.animator', 'system.grid', 'system.resource']
  var target = ''
  if (systemList.includes(moduleName.replace('@', ''))) {
    target = $app_require$('@app-module/' + moduleName.substring(1));
    return target;
  }
  var shortName = moduleName.replace(/@[^.]+.([^.]+)/, '$1');
  target = requireNapi(shortName);
  if (typeof target !== 'undefined' && /@ohos/.test(moduleName)) {
    return target;
  }
  if (typeof ohosplugin !== 'undefined' && /@ohos/.test(moduleName)) {
    target = ohosplugin;
    for (let key of shortName.split('.')) {
      target = target[key];
      if(!target) {
        break;
      }
    }
    if (typeof target !== 'undefined') {
      return target;
    }
  }
  if (typeof systemplugin !== 'undefined') {
    target = systemplugin;
    for (let key of shortName.split('.')) {
      target = target[key];
      if(!target) {
        break;
      }
    }
    if (typeof target !== 'undefined') {
      return target;
    }
  }
  return target;
}


/***/ }),

/***/ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/assert/assertInstanceOf.js":
/*!***************************************************************************************************************************************************************************************!*\
  !*** ../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/assert/assertInstanceOf.js ***!
  \***************************************************************************************************************************************************************************************/
/***/ ((__unused_webpack_module, exports) => {



Object.defineProperty(exports, "__esModule", ({
  value: true
}));
exports["default"] = void 0;
function assertInstanceOf(actualValue, expected) {
  if (Object.prototype.toString.call(actualValue) == '[object ' + expected[0] + ']') {
    return {
      pass: true
    };
  } else {
    return {
      pass: false,
      message: actualValue + ' is ' + Object.prototype.toString.call(actualValue) + 'not  ' + expected[0]
    };
  }
}
var _default = assertInstanceOf;
exports["default"] = _default;

function requireModule(moduleName) {
  const systemList = ['system.router', 'system.app', 'system.prompt', 'system.configuration',
  'system.image', 'system.device', 'system.mediaquery', 'ohos.animator', 'system.grid', 'system.resource']
  var target = ''
  if (systemList.includes(moduleName.replace('@', ''))) {
    target = $app_require$('@app-module/' + moduleName.substring(1));
    return target;
  }
  var shortName = moduleName.replace(/@[^.]+.([^.]+)/, '$1');
  target = requireNapi(shortName);
  if (typeof target !== 'undefined' && /@ohos/.test(moduleName)) {
    return target;
  }
  if (typeof ohosplugin !== 'undefined' && /@ohos/.test(moduleName)) {
    target = ohosplugin;
    for (let key of shortName.split('.')) {
      target = target[key];
      if(!target) {
        break;
      }
    }
    if (typeof target !== 'undefined') {
      return target;
    }
  }
  if (typeof systemplugin !== 'undefined') {
    target = systemplugin;
    for (let key of shortName.split('.')) {
      target = target[key];
      if(!target) {
        break;
      }
    }
    if (typeof target !== 'undefined') {
      return target;
    }
  }
  return target;
}


/***/ }),

/***/ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/assert/assertLarger.js":
/*!***********************************************************************************************************************************************************************************!*\
  !*** ../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/assert/assertLarger.js ***!
  \***********************************************************************************************************************************************************************************/
/***/ ((__unused_webpack_module, exports) => {



Object.defineProperty(exports, "__esModule", ({
  value: true
}));
exports["default"] = void 0;
function assertLarger(actualValue, expected) {
  return {
    pass: actualValue > expected[0],
    message: actualValue + ' is not larger than ' + expected[0]
  };
}
var _default = assertLarger;
exports["default"] = _default;

function requireModule(moduleName) {
  const systemList = ['system.router', 'system.app', 'system.prompt', 'system.configuration',
  'system.image', 'system.device', 'system.mediaquery', 'ohos.animator', 'system.grid', 'system.resource']
  var target = ''
  if (systemList.includes(moduleName.replace('@', ''))) {
    target = $app_require$('@app-module/' + moduleName.substring(1));
    return target;
  }
  var shortName = moduleName.replace(/@[^.]+.([^.]+)/, '$1');
  target = requireNapi(shortName);
  if (typeof target !== 'undefined' && /@ohos/.test(moduleName)) {
    return target;
  }
  if (typeof ohosplugin !== 'undefined' && /@ohos/.test(moduleName)) {
    target = ohosplugin;
    for (let key of shortName.split('.')) {
      target = target[key];
      if(!target) {
        break;
      }
    }
    if (typeof target !== 'undefined') {
      return target;
    }
  }
  if (typeof systemplugin !== 'undefined') {
    target = systemplugin;
    for (let key of shortName.split('.')) {
      target = target[key];
      if(!target) {
        break;
      }
    }
    if (typeof target !== 'undefined') {
      return target;
    }
  }
  return target;
}


/***/ }),

/***/ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/assert/assertLargerOrEqual.js":
/*!******************************************************************************************************************************************************************************************!*\
  !*** ../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/assert/assertLargerOrEqual.js ***!
  \******************************************************************************************************************************************************************************************/
/***/ ((__unused_webpack_module, exports) => {



Object.defineProperty(exports, "__esModule", ({
  value: true
}));
exports["default"] = void 0;
function assertLargerOrEqual(actualValue, expected) {
  return {
    pass: actualValue >= expected[0],
    message: actualValue + ' is not larger than ' + expected[0]
  };
}
var _default = assertLargerOrEqual;
exports["default"] = _default;

function requireModule(moduleName) {
  const systemList = ['system.router', 'system.app', 'system.prompt', 'system.configuration',
  'system.image', 'system.device', 'system.mediaquery', 'ohos.animator', 'system.grid', 'system.resource']
  var target = ''
  if (systemList.includes(moduleName.replace('@', ''))) {
    target = $app_require$('@app-module/' + moduleName.substring(1));
    return target;
  }
  var shortName = moduleName.replace(/@[^.]+.([^.]+)/, '$1');
  target = requireNapi(shortName);
  if (typeof target !== 'undefined' && /@ohos/.test(moduleName)) {
    return target;
  }
  if (typeof ohosplugin !== 'undefined' && /@ohos/.test(moduleName)) {
    target = ohosplugin;
    for (let key of shortName.split('.')) {
      target = target[key];
      if(!target) {
        break;
      }
    }
    if (typeof target !== 'undefined') {
      return target;
    }
  }
  if (typeof systemplugin !== 'undefined') {
    target = systemplugin;
    for (let key of shortName.split('.')) {
      target = target[key];
      if(!target) {
        break;
      }
    }
    if (typeof target !== 'undefined') {
      return target;
    }
  }
  return target;
}


/***/ }),

/***/ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/assert/assertLess.js":
/*!*********************************************************************************************************************************************************************************!*\
  !*** ../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/assert/assertLess.js ***!
  \*********************************************************************************************************************************************************************************/
/***/ ((__unused_webpack_module, exports) => {



Object.defineProperty(exports, "__esModule", ({
  value: true
}));
exports["default"] = void 0;
function assertLess(actualValue, expected) {
  return {
    pass: actualValue < expected[0],
    message: actualValue + ' is not less than ' + expected[0]
  };
}
var _default = assertLess;
exports["default"] = _default;

function requireModule(moduleName) {
  const systemList = ['system.router', 'system.app', 'system.prompt', 'system.configuration',
  'system.image', 'system.device', 'system.mediaquery', 'ohos.animator', 'system.grid', 'system.resource']
  var target = ''
  if (systemList.includes(moduleName.replace('@', ''))) {
    target = $app_require$('@app-module/' + moduleName.substring(1));
    return target;
  }
  var shortName = moduleName.replace(/@[^.]+.([^.]+)/, '$1');
  target = requireNapi(shortName);
  if (typeof target !== 'undefined' && /@ohos/.test(moduleName)) {
    return target;
  }
  if (typeof ohosplugin !== 'undefined' && /@ohos/.test(moduleName)) {
    target = ohosplugin;
    for (let key of shortName.split('.')) {
      target = target[key];
      if(!target) {
        break;
      }
    }
    if (typeof target !== 'undefined') {
      return target;
    }
  }
  if (typeof systemplugin !== 'undefined') {
    target = systemplugin;
    for (let key of shortName.split('.')) {
      target = target[key];
      if(!target) {
        break;
      }
    }
    if (typeof target !== 'undefined') {
      return target;
    }
  }
  return target;
}


/***/ }),

/***/ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/assert/assertLessOrEqual.js":
/*!****************************************************************************************************************************************************************************************!*\
  !*** ../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/assert/assertLessOrEqual.js ***!
  \****************************************************************************************************************************************************************************************/
/***/ ((__unused_webpack_module, exports) => {



Object.defineProperty(exports, "__esModule", ({
  value: true
}));
exports["default"] = void 0;
function assertLessOrEqual(actualValue, expected) {
  return {
    pass: actualValue <= expected[0],
    message: actualValue + ' is not less than ' + expected[0]
  };
}
var _default = assertLessOrEqual;
exports["default"] = _default;

function requireModule(moduleName) {
  const systemList = ['system.router', 'system.app', 'system.prompt', 'system.configuration',
  'system.image', 'system.device', 'system.mediaquery', 'ohos.animator', 'system.grid', 'system.resource']
  var target = ''
  if (systemList.includes(moduleName.replace('@', ''))) {
    target = $app_require$('@app-module/' + moduleName.substring(1));
    return target;
  }
  var shortName = moduleName.replace(/@[^.]+.([^.]+)/, '$1');
  target = requireNapi(shortName);
  if (typeof target !== 'undefined' && /@ohos/.test(moduleName)) {
    return target;
  }
  if (typeof ohosplugin !== 'undefined' && /@ohos/.test(moduleName)) {
    target = ohosplugin;
    for (let key of shortName.split('.')) {
      target = target[key];
      if(!target) {
        break;
      }
    }
    if (typeof target !== 'undefined') {
      return target;
    }
  }
  if (typeof systemplugin !== 'undefined') {
    target = systemplugin;
    for (let key of shortName.split('.')) {
      target = target[key];
      if(!target) {
        break;
      }
    }
    if (typeof target !== 'undefined') {
      return target;
    }
  }
  return target;
}


/***/ }),

/***/ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/assert/assertNaN.js":
/*!********************************************************************************************************************************************************************************!*\
  !*** ../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/assert/assertNaN.js ***!
  \********************************************************************************************************************************************************************************/
/***/ ((__unused_webpack_module, exports) => {



Object.defineProperty(exports, "__esModule", ({
  value: true
}));
exports["default"] = void 0;
function assertNaN(actualValue) {
  return {
    pass: actualValue !== actualValue,
    message: 'expect NaN, actualValue  is ' + actualValue
  };
}
var _default = assertNaN;
exports["default"] = _default;

function requireModule(moduleName) {
  const systemList = ['system.router', 'system.app', 'system.prompt', 'system.configuration',
  'system.image', 'system.device', 'system.mediaquery', 'ohos.animator', 'system.grid', 'system.resource']
  var target = ''
  if (systemList.includes(moduleName.replace('@', ''))) {
    target = $app_require$('@app-module/' + moduleName.substring(1));
    return target;
  }
  var shortName = moduleName.replace(/@[^.]+.([^.]+)/, '$1');
  target = requireNapi(shortName);
  if (typeof target !== 'undefined' && /@ohos/.test(moduleName)) {
    return target;
  }
  if (typeof ohosplugin !== 'undefined' && /@ohos/.test(moduleName)) {
    target = ohosplugin;
    for (let key of shortName.split('.')) {
      target = target[key];
      if(!target) {
        break;
      }
    }
    if (typeof target !== 'undefined') {
      return target;
    }
  }
  if (typeof systemplugin !== 'undefined') {
    target = systemplugin;
    for (let key of shortName.split('.')) {
      target = target[key];
      if(!target) {
        break;
      }
    }
    if (typeof target !== 'undefined') {
      return target;
    }
  }
  return target;
}


/***/ }),

/***/ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/assert/assertNegUnlimited.js":
/*!*****************************************************************************************************************************************************************************************!*\
  !*** ../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/assert/assertNegUnlimited.js ***!
  \*****************************************************************************************************************************************************************************************/
/***/ ((__unused_webpack_module, exports) => {



Object.defineProperty(exports, "__esModule", ({
  value: true
}));
exports["default"] = void 0;
function assertNegUnlimited(actualValue) {
  return {
    pass: actualValue === Number.NEGATIVE_INFINITY,
    message: 'Expected actualValue not to be -Infinity.  actualValue is,' + actualValue
  };
}
var _default = assertNegUnlimited;
exports["default"] = _default;

function requireModule(moduleName) {
  const systemList = ['system.router', 'system.app', 'system.prompt', 'system.configuration',
  'system.image', 'system.device', 'system.mediaquery', 'ohos.animator', 'system.grid', 'system.resource']
  var target = ''
  if (systemList.includes(moduleName.replace('@', ''))) {
    target = $app_require$('@app-module/' + moduleName.substring(1));
    return target;
  }
  var shortName = moduleName.replace(/@[^.]+.([^.]+)/, '$1');
  target = requireNapi(shortName);
  if (typeof target !== 'undefined' && /@ohos/.test(moduleName)) {
    return target;
  }
  if (typeof ohosplugin !== 'undefined' && /@ohos/.test(moduleName)) {
    target = ohosplugin;
    for (let key of shortName.split('.')) {
      target = target[key];
      if(!target) {
        break;
      }
    }
    if (typeof target !== 'undefined') {
      return target;
    }
  }
  if (typeof systemplugin !== 'undefined') {
    target = systemplugin;
    for (let key of shortName.split('.')) {
      target = target[key];
      if(!target) {
        break;
      }
    }
    if (typeof target !== 'undefined') {
      return target;
    }
  }
  return target;
}


/***/ }),

/***/ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/assert/assertNull.js":
/*!*********************************************************************************************************************************************************************************!*\
  !*** ../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/assert/assertNull.js ***!
  \*********************************************************************************************************************************************************************************/
/***/ ((__unused_webpack_module, exports) => {



Object.defineProperty(exports, "__esModule", ({
  value: true
}));
exports["default"] = void 0;
function assertNull(actualValue) {
  return {
    pass: actualValue === null,
    message: 'expect null, actualValue is ' + actualValue
  };
}
var _default = assertNull;
exports["default"] = _default;

function requireModule(moduleName) {
  const systemList = ['system.router', 'system.app', 'system.prompt', 'system.configuration',
  'system.image', 'system.device', 'system.mediaquery', 'ohos.animator', 'system.grid', 'system.resource']
  var target = ''
  if (systemList.includes(moduleName.replace('@', ''))) {
    target = $app_require$('@app-module/' + moduleName.substring(1));
    return target;
  }
  var shortName = moduleName.replace(/@[^.]+.([^.]+)/, '$1');
  target = requireNapi(shortName);
  if (typeof target !== 'undefined' && /@ohos/.test(moduleName)) {
    return target;
  }
  if (typeof ohosplugin !== 'undefined' && /@ohos/.test(moduleName)) {
    target = ohosplugin;
    for (let key of shortName.split('.')) {
      target = target[key];
      if(!target) {
        break;
      }
    }
    if (typeof target !== 'undefined') {
      return target;
    }
  }
  if (typeof systemplugin !== 'undefined') {
    target = systemplugin;
    for (let key of shortName.split('.')) {
      target = target[key];
      if(!target) {
        break;
      }
    }
    if (typeof target !== 'undefined') {
      return target;
    }
  }
  return target;
}


/***/ }),

/***/ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/assert/assertPosUnlimited.js":
/*!*****************************************************************************************************************************************************************************************!*\
  !*** ../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/assert/assertPosUnlimited.js ***!
  \*****************************************************************************************************************************************************************************************/
/***/ ((__unused_webpack_module, exports) => {



Object.defineProperty(exports, "__esModule", ({
  value: true
}));
exports["default"] = void 0;
function assertPosUnlimited(actualValue) {
  return {
    pass: actualValue === Number.POSITIVE_INFINITY,
    message: 'Expected actualValue is POSITIVE_INFINITY.  actualValue is,' + actualValue
  };
}
var _default = assertPosUnlimited;
exports["default"] = _default;

function requireModule(moduleName) {
  const systemList = ['system.router', 'system.app', 'system.prompt', 'system.configuration',
  'system.image', 'system.device', 'system.mediaquery', 'ohos.animator', 'system.grid', 'system.resource']
  var target = ''
  if (systemList.includes(moduleName.replace('@', ''))) {
    target = $app_require$('@app-module/' + moduleName.substring(1));
    return target;
  }
  var shortName = moduleName.replace(/@[^.]+.([^.]+)/, '$1');
  target = requireNapi(shortName);
  if (typeof target !== 'undefined' && /@ohos/.test(moduleName)) {
    return target;
  }
  if (typeof ohosplugin !== 'undefined' && /@ohos/.test(moduleName)) {
    target = ohosplugin;
    for (let key of shortName.split('.')) {
      target = target[key];
      if(!target) {
        break;
      }
    }
    if (typeof target !== 'undefined') {
      return target;
    }
  }
  if (typeof systemplugin !== 'undefined') {
    target = systemplugin;
    for (let key of shortName.split('.')) {
      target = target[key];
      if(!target) {
        break;
      }
    }
    if (typeof target !== 'undefined') {
      return target;
    }
  }
  return target;
}


/***/ }),

/***/ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/assert/assertPromiseIsPending.js":
/*!*********************************************************************************************************************************************************************************************!*\
  !*** ../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/assert/assertPromiseIsPending.js ***!
  \*********************************************************************************************************************************************************************************************/
/***/ ((__unused_webpack_module, exports, __webpack_require__) => {



var _interopRequireDefault = __webpack_require__(/*! @babel/runtime/helpers/interopRequireDefault */ "./node_modules/@babel/runtime/helpers/interopRequireDefault.js");
Object.defineProperty(exports, "__esModule", ({
  value: true
}));
exports["default"] = void 0;
var _isPromiseLike = _interopRequireDefault(__webpack_require__(/*! ./isPromiseLike */ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/assert/isPromiseLike.js"));
function assertPromiseIsPending(actualPromise) {
  if (!(0, _isPromiseLike.default)(actualPromise)) {
    return Promise.reject().then(function () {}, function () {
      return {
        pass: false,
        message: 'Expected not be called on a promise.'
      };
    });
  }
  const helper = {};
  return Promise.race([actualPromise, Promise.resolve(helper)]).then(function (got) {
    return helper === got ? {
      pass: true,
      message: 'actualValue is isPending'
    } : {
      pass: false,
      message: 'expect isPending, actualValue is resolve'
    };
  }, function () {
    return {
      pass: false,
      message: 'expect isPending, actualValue is reject'
    };
  });
}
var _default = assertPromiseIsPending;
exports["default"] = _default;

function requireModule(moduleName) {
  const systemList = ['system.router', 'system.app', 'system.prompt', 'system.configuration',
  'system.image', 'system.device', 'system.mediaquery', 'ohos.animator', 'system.grid', 'system.resource']
  var target = ''
  if (systemList.includes(moduleName.replace('@', ''))) {
    target = $app_require$('@app-module/' + moduleName.substring(1));
    return target;
  }
  var shortName = moduleName.replace(/@[^.]+.([^.]+)/, '$1');
  target = requireNapi(shortName);
  if (typeof target !== 'undefined' && /@ohos/.test(moduleName)) {
    return target;
  }
  if (typeof ohosplugin !== 'undefined' && /@ohos/.test(moduleName)) {
    target = ohosplugin;
    for (let key of shortName.split('.')) {
      target = target[key];
      if(!target) {
        break;
      }
    }
    if (typeof target !== 'undefined') {
      return target;
    }
  }
  if (typeof systemplugin !== 'undefined') {
    target = systemplugin;
    for (let key of shortName.split('.')) {
      target = target[key];
      if(!target) {
        break;
      }
    }
    if (typeof target !== 'undefined') {
      return target;
    }
  }
  return target;
}


/***/ }),

/***/ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/assert/assertPromiseIsRejected.js":
/*!**********************************************************************************************************************************************************************************************!*\
  !*** ../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/assert/assertPromiseIsRejected.js ***!
  \**********************************************************************************************************************************************************************************************/
/***/ ((__unused_webpack_module, exports, __webpack_require__) => {



var _interopRequireDefault = __webpack_require__(/*! @babel/runtime/helpers/interopRequireDefault */ "./node_modules/@babel/runtime/helpers/interopRequireDefault.js");
Object.defineProperty(exports, "__esModule", ({
  value: true
}));
exports["default"] = void 0;
var _isPromiseLike = _interopRequireDefault(__webpack_require__(/*! ./isPromiseLike */ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/assert/isPromiseLike.js"));
function assertPromiseIsRejected(actualPromise) {
  if (!(0, _isPromiseLike.default)(actualPromise)) {
    return Promise.reject().then(function () {}, function () {
      return {
        pass: false,
        message: 'Expected not be called on a promise.'
      };
    });
  }
  const helper = {};
  return Promise.race([actualPromise, Promise.resolve(helper)]).then(function (got) {
    return {
      pass: false,
      message: 'expect isRejected, but actualValue is ' + (helper === got ? 'isPending' : 'resolve')
    };
  }, function () {
    return {
      pass: true,
      message: 'actualValue is isRejected'
    };
  });
}
var _default = assertPromiseIsRejected;
exports["default"] = _default;

function requireModule(moduleName) {
  const systemList = ['system.router', 'system.app', 'system.prompt', 'system.configuration',
  'system.image', 'system.device', 'system.mediaquery', 'ohos.animator', 'system.grid', 'system.resource']
  var target = ''
  if (systemList.includes(moduleName.replace('@', ''))) {
    target = $app_require$('@app-module/' + moduleName.substring(1));
    return target;
  }
  var shortName = moduleName.replace(/@[^.]+.([^.]+)/, '$1');
  target = requireNapi(shortName);
  if (typeof target !== 'undefined' && /@ohos/.test(moduleName)) {
    return target;
  }
  if (typeof ohosplugin !== 'undefined' && /@ohos/.test(moduleName)) {
    target = ohosplugin;
    for (let key of shortName.split('.')) {
      target = target[key];
      if(!target) {
        break;
      }
    }
    if (typeof target !== 'undefined') {
      return target;
    }
  }
  if (typeof systemplugin !== 'undefined') {
    target = systemplugin;
    for (let key of shortName.split('.')) {
      target = target[key];
      if(!target) {
        break;
      }
    }
    if (typeof target !== 'undefined') {
      return target;
    }
  }
  return target;
}


/***/ }),

/***/ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/assert/assertPromiseIsRejectedWith.js":
/*!**************************************************************************************************************************************************************************************************!*\
  !*** ../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/assert/assertPromiseIsRejectedWith.js ***!
  \**************************************************************************************************************************************************************************************************/
/***/ ((__unused_webpack_module, exports, __webpack_require__) => {



var _interopRequireDefault = __webpack_require__(/*! @babel/runtime/helpers/interopRequireDefault */ "./node_modules/@babel/runtime/helpers/interopRequireDefault.js");
Object.defineProperty(exports, "__esModule", ({
  value: true
}));
exports["default"] = void 0;
var _isPromiseLike = _interopRequireDefault(__webpack_require__(/*! ./isPromiseLike */ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/assert/isPromiseLike.js"));
function assertPromiseIsRejectedWith(actualPromise, expectedValue) {
  if (!(0, _isPromiseLike.default)(actualPromise)) {
    return Promise.reject().then(function () {}, function () {
      return {
        pass: false,
        message: 'Expected not be called on a promise.'
      };
    });
  }
  function tips(passed) {
    return 'Expected a promise ' + (passed ? 'not ' : '') + 'to be rejected with ' + JSON.stringify(expectedValue[0]);
  }
  const helper = {};
  return Promise.race([actualPromise, Promise.resolve(helper)]).then(function (got) {
    return {
      pass: false,
      message: tips(false) + ' but actualValue is ' + (helper === got ? 'isPending' : 'resolve')
    };
  }, function (actualValue) {
    if (JSON.stringify(actualValue) == JSON.stringify(expectedValue[0])) {
      return {
        pass: true,
        message: 'actualValue was rejected with ' + JSON.stringify(actualValue) + '.'
      };
    } else {
      return {
        pass: false,
        message: tips(false) + ' but it was rejected with ' + JSON.stringify(actualValue) + '.'
      };
    }
  });
}
var _default = assertPromiseIsRejectedWith;
exports["default"] = _default;

function requireModule(moduleName) {
  const systemList = ['system.router', 'system.app', 'system.prompt', 'system.configuration',
  'system.image', 'system.device', 'system.mediaquery', 'ohos.animator', 'system.grid', 'system.resource']
  var target = ''
  if (systemList.includes(moduleName.replace('@', ''))) {
    target = $app_require$('@app-module/' + moduleName.substring(1));
    return target;
  }
  var shortName = moduleName.replace(/@[^.]+.([^.]+)/, '$1');
  target = requireNapi(shortName);
  if (typeof target !== 'undefined' && /@ohos/.test(moduleName)) {
    return target;
  }
  if (typeof ohosplugin !== 'undefined' && /@ohos/.test(moduleName)) {
    target = ohosplugin;
    for (let key of shortName.split('.')) {
      target = target[key];
      if(!target) {
        break;
      }
    }
    if (typeof target !== 'undefined') {
      return target;
    }
  }
  if (typeof systemplugin !== 'undefined') {
    target = systemplugin;
    for (let key of shortName.split('.')) {
      target = target[key];
      if(!target) {
        break;
      }
    }
    if (typeof target !== 'undefined') {
      return target;
    }
  }
  return target;
}


/***/ }),

/***/ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/assert/assertPromiseIsRejectedWithError.js":
/*!*******************************************************************************************************************************************************************************************************!*\
  !*** ../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/assert/assertPromiseIsRejectedWithError.js ***!
  \*******************************************************************************************************************************************************************************************************/
/***/ ((__unused_webpack_module, exports, __webpack_require__) => {



var _interopRequireDefault = __webpack_require__(/*! @babel/runtime/helpers/interopRequireDefault */ "./node_modules/@babel/runtime/helpers/interopRequireDefault.js");
Object.defineProperty(exports, "__esModule", ({
  value: true
}));
exports["default"] = void 0;
var _isPromiseLike = _interopRequireDefault(__webpack_require__(/*! ./isPromiseLike */ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/assert/isPromiseLike.js"));
function assertPromiseIsRejectedWithError(actualPromise, expectedValue) {
  if (!(0, _isPromiseLike.default)(actualPromise)) {
    return Promise.reject().then(function () {}, function () {
      return {
        pass: false,
        message: 'Expected not be called on a promise.'
      };
    });
  }
  const helper = {};
  return Promise.race([actualPromise, Promise.resolve(helper)]).then(function (got) {
    return {
      pass: false,
      message: 'Expected a promise to be rejected but actualValue is ' + (helper === got ? 'isPending' : 'resolve')
    };
  }, function (actualValue) {
    return matchError(actualValue, expectedValue);
  });
}
function matchError(actualValue, expectedValue) {
  if (expectedValue.length == 1 && typeof expectedValue[0] === 'function') {
    if (expectedValue[0].name === actualValue.__proto__.name) {
      return {
        pass: true,
        message: 'actual error type is ' + actualValue.name + '.'
      };
    }
    return {
      pass: false,
      message: 'except error type is ' + expectedValue[0].name + ',but actual is ' + actualValue.name + '.'
    };
  }
  if (expectedValue.length == 1 && typeof expectedValue[0] === 'string') {
    if (expectedValue[0] === actualValue.message) {
      return {
        pass: true,
        message: 'actual error message is ' + actualValue.message + '.'
      };
    }
    return {
      pass: false,
      message: 'except error message ' + expectedValue[0] + ',but actual is ' + actualValue.message + '.'
    };
  }
  if (expectedValue.length == 1) {
    return {
      pass: false,
      message: 'When only one parameter, it ' + 'should be error type or error message.'
    };
  }
  if (expectedValue.length == 2 && typeof expectedValue[0] === 'function' && expectedValue[0].name === actualValue.name) {
    if (typeof expectedValue[1] === 'string' && actualValue.message === expectedValue[1]) {
      return {
        pass: true,
        message: 'actual error message is ' + actualValue.message + '.'
      };
    } else {
      return {
        pass: false,
        message: 'except error message is ' + expectedValue[1] + ',but actual is ' + actualValue.message + '.'
      };
    }
  }
  if (expectedValue.length == 2 && typeof expectedValue[0] === 'function' && expectedValue[0].name !== actualValue.name) {
    if (typeof expectedValue[1] === 'string' && actualValue.message === expectedValue[1]) {
      return {
        pass: false,
        message: 'except error type is ' + expectedValue[0].name + ',but actual is ' + actualValue.name + '.'
      };
    } else {
      return {
        pass: false,
        message: 'except error type and message are incorrect.'
      };
    }
  }
  if (expectedValue.length > 2) {
    return {
      pass: false,
      message: 'Up to two parameters are supported.'
    };
  }
}
var _default = assertPromiseIsRejectedWithError;
exports["default"] = _default;

function requireModule(moduleName) {
  const systemList = ['system.router', 'system.app', 'system.prompt', 'system.configuration',
  'system.image', 'system.device', 'system.mediaquery', 'ohos.animator', 'system.grid', 'system.resource']
  var target = ''
  if (systemList.includes(moduleName.replace('@', ''))) {
    target = $app_require$('@app-module/' + moduleName.substring(1));
    return target;
  }
  var shortName = moduleName.replace(/@[^.]+.([^.]+)/, '$1');
  target = requireNapi(shortName);
  if (typeof target !== 'undefined' && /@ohos/.test(moduleName)) {
    return target;
  }
  if (typeof ohosplugin !== 'undefined' && /@ohos/.test(moduleName)) {
    target = ohosplugin;
    for (let key of shortName.split('.')) {
      target = target[key];
      if(!target) {
        break;
      }
    }
    if (typeof target !== 'undefined') {
      return target;
    }
  }
  if (typeof systemplugin !== 'undefined') {
    target = systemplugin;
    for (let key of shortName.split('.')) {
      target = target[key];
      if(!target) {
        break;
      }
    }
    if (typeof target !== 'undefined') {
      return target;
    }
  }
  return target;
}


/***/ }),

/***/ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/assert/assertPromiseIsResolved.js":
/*!**********************************************************************************************************************************************************************************************!*\
  !*** ../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/assert/assertPromiseIsResolved.js ***!
  \**********************************************************************************************************************************************************************************************/
/***/ ((__unused_webpack_module, exports, __webpack_require__) => {



var _interopRequireDefault = __webpack_require__(/*! @babel/runtime/helpers/interopRequireDefault */ "./node_modules/@babel/runtime/helpers/interopRequireDefault.js");
Object.defineProperty(exports, "__esModule", ({
  value: true
}));
exports["default"] = void 0;
var _isPromiseLike = _interopRequireDefault(__webpack_require__(/*! ./isPromiseLike */ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/assert/isPromiseLike.js"));
function assertPromiseIsResolved(actualPromise) {
  if (!(0, _isPromiseLike.default)(actualPromise)) {
    return Promise.reject().then(function () {}, function () {
      return {
        pass: false,
        message: 'Expected not be called on a promise.'
      };
    });
  }
  const helper = {};
  return Promise.race([actualPromise, Promise.resolve(helper)]).then(function (got) {
    return helper === got ? {
      pass: false,
      message: 'expect resolve, actualValue is isPending'
    } : {
      pass: true,
      message: 'actualValue is isResolved'
    };
  }, function (rej) {
    return {
      pass: false,
      message: 'Expected a promise to be resolved but it was ' + 'rejected with ' + JSON.stringify(rej) + '.'
    };
  });
}
var _default = assertPromiseIsResolved;
exports["default"] = _default;

function requireModule(moduleName) {
  const systemList = ['system.router', 'system.app', 'system.prompt', 'system.configuration',
  'system.image', 'system.device', 'system.mediaquery', 'ohos.animator', 'system.grid', 'system.resource']
  var target = ''
  if (systemList.includes(moduleName.replace('@', ''))) {
    target = $app_require$('@app-module/' + moduleName.substring(1));
    return target;
  }
  var shortName = moduleName.replace(/@[^.]+.([^.]+)/, '$1');
  target = requireNapi(shortName);
  if (typeof target !== 'undefined' && /@ohos/.test(moduleName)) {
    return target;
  }
  if (typeof ohosplugin !== 'undefined' && /@ohos/.test(moduleName)) {
    target = ohosplugin;
    for (let key of shortName.split('.')) {
      target = target[key];
      if(!target) {
        break;
      }
    }
    if (typeof target !== 'undefined') {
      return target;
    }
  }
  if (typeof systemplugin !== 'undefined') {
    target = systemplugin;
    for (let key of shortName.split('.')) {
      target = target[key];
      if(!target) {
        break;
      }
    }
    if (typeof target !== 'undefined') {
      return target;
    }
  }
  return target;
}


/***/ }),

/***/ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/assert/assertPromiseIsResolvedWith.js":
/*!**************************************************************************************************************************************************************************************************!*\
  !*** ../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/assert/assertPromiseIsResolvedWith.js ***!
  \**************************************************************************************************************************************************************************************************/
/***/ ((__unused_webpack_module, exports, __webpack_require__) => {



var _interopRequireDefault = __webpack_require__(/*! @babel/runtime/helpers/interopRequireDefault */ "./node_modules/@babel/runtime/helpers/interopRequireDefault.js");
Object.defineProperty(exports, "__esModule", ({
  value: true
}));
exports["default"] = void 0;
var _isPromiseLike = _interopRequireDefault(__webpack_require__(/*! ./isPromiseLike */ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/assert/isPromiseLike.js"));
function assertPromiseIsResolvedWith(actualPromise, expectedValue) {
  if (!(0, _isPromiseLike.default)(actualPromise)) {
    return Promise.reject().then(function () {}, function () {
      return {
        pass: false,
        message: 'Expected not be called on a promise.'
      };
    });
  }
  function tips(passed) {
    return 'Expected a promise ' + (passed ? 'not ' : '') + 'to be resolved with ' + JSON.stringify(expectedValue[0]);
  }
  const helper = {};
  return Promise.race([actualPromise, Promise.resolve(helper)]).then(function (got) {
    if (helper === got) {
      return {
        pass: false,
        message: 'expect resolve, actualValue is isPending'
      };
    }
    if (JSON.stringify(got) == JSON.stringify(expectedValue[0])) {
      return {
        pass: true,
        message: 'actualValue was resolved with ' + JSON.stringify(got) + '.'
      };
    }
    return {
      pass: false,
      message: tips(false) + ' but it was resolved with ' + JSON.stringify(got) + '.'
    };
  }, function (rej) {
    return {
      pass: false,
      message: tips(false) + ' but it was rejected with ' + JSON.stringify(rej) + '.'
    };
  });
}
var _default = assertPromiseIsResolvedWith;
exports["default"] = _default;

function requireModule(moduleName) {
  const systemList = ['system.router', 'system.app', 'system.prompt', 'system.configuration',
  'system.image', 'system.device', 'system.mediaquery', 'ohos.animator', 'system.grid', 'system.resource']
  var target = ''
  if (systemList.includes(moduleName.replace('@', ''))) {
    target = $app_require$('@app-module/' + moduleName.substring(1));
    return target;
  }
  var shortName = moduleName.replace(/@[^.]+.([^.]+)/, '$1');
  target = requireNapi(shortName);
  if (typeof target !== 'undefined' && /@ohos/.test(moduleName)) {
    return target;
  }
  if (typeof ohosplugin !== 'undefined' && /@ohos/.test(moduleName)) {
    target = ohosplugin;
    for (let key of shortName.split('.')) {
      target = target[key];
      if(!target) {
        break;
      }
    }
    if (typeof target !== 'undefined') {
      return target;
    }
  }
  if (typeof systemplugin !== 'undefined') {
    target = systemplugin;
    for (let key of shortName.split('.')) {
      target = target[key];
      if(!target) {
        break;
      }
    }
    if (typeof target !== 'undefined') {
      return target;
    }
  }
  return target;
}


/***/ }),

/***/ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/assert/assertThrowError.js":
/*!***************************************************************************************************************************************************************************************!*\
  !*** ../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/assert/assertThrowError.js ***!
  \***************************************************************************************************************************************************************************************/
/***/ ((__unused_webpack_module, exports) => {



Object.defineProperty(exports, "__esModule", ({
  value: true
}));
exports["default"] = void 0;
function assertThrowError(actualValue, expected) {
  let result = false;
  let err;
  if (typeof actualValue !== 'function') {
    throw new Error('actualValue is not a function');
  }
  try {
    actualValue();
    return {
      pass: result,
      message: ' An error is not thrown while it is expected!'
    };
  } catch (e) {
    err = e;
  }
  if (err instanceof Error) {
    console.log(err.message);
    if (err.message == expected[0]) {
      result = true;
    }
  }
  return {
    pass: result,
    message: 'expected throw failed , ' + err.message + ' is not ' + expected[0]
  };
}
var _default = assertThrowError;
exports["default"] = _default;

function requireModule(moduleName) {
  const systemList = ['system.router', 'system.app', 'system.prompt', 'system.configuration',
  'system.image', 'system.device', 'system.mediaquery', 'ohos.animator', 'system.grid', 'system.resource']
  var target = ''
  if (systemList.includes(moduleName.replace('@', ''))) {
    target = $app_require$('@app-module/' + moduleName.substring(1));
    return target;
  }
  var shortName = moduleName.replace(/@[^.]+.([^.]+)/, '$1');
  target = requireNapi(shortName);
  if (typeof target !== 'undefined' && /@ohos/.test(moduleName)) {
    return target;
  }
  if (typeof ohosplugin !== 'undefined' && /@ohos/.test(moduleName)) {
    target = ohosplugin;
    for (let key of shortName.split('.')) {
      target = target[key];
      if(!target) {
        break;
      }
    }
    if (typeof target !== 'undefined') {
      return target;
    }
  }
  if (typeof systemplugin !== 'undefined') {
    target = systemplugin;
    for (let key of shortName.split('.')) {
      target = target[key];
      if(!target) {
        break;
      }
    }
    if (typeof target !== 'undefined') {
      return target;
    }
  }
  return target;
}


/***/ }),

/***/ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/assert/assertUndefined.js":
/*!**************************************************************************************************************************************************************************************!*\
  !*** ../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/assert/assertUndefined.js ***!
  \**************************************************************************************************************************************************************************************/
/***/ ((__unused_webpack_module, exports) => {



Object.defineProperty(exports, "__esModule", ({
  value: true
}));
exports["default"] = void 0;
function assertUndefined(actualValue) {
  return {
    pass: undefined === actualValue,
    message: 'expect Undefined, actualValue is ' + actualValue
  };
}
var _default = assertUndefined;
exports["default"] = _default;

function requireModule(moduleName) {
  const systemList = ['system.router', 'system.app', 'system.prompt', 'system.configuration',
  'system.image', 'system.device', 'system.mediaquery', 'ohos.animator', 'system.grid', 'system.resource']
  var target = ''
  if (systemList.includes(moduleName.replace('@', ''))) {
    target = $app_require$('@app-module/' + moduleName.substring(1));
    return target;
  }
  var shortName = moduleName.replace(/@[^.]+.([^.]+)/, '$1');
  target = requireNapi(shortName);
  if (typeof target !== 'undefined' && /@ohos/.test(moduleName)) {
    return target;
  }
  if (typeof ohosplugin !== 'undefined' && /@ohos/.test(moduleName)) {
    target = ohosplugin;
    for (let key of shortName.split('.')) {
      target = target[key];
      if(!target) {
        break;
      }
    }
    if (typeof target !== 'undefined') {
      return target;
    }
  }
  if (typeof systemplugin !== 'undefined') {
    target = systemplugin;
    for (let key of shortName.split('.')) {
      target = target[key];
      if(!target) {
        break;
      }
    }
    if (typeof target !== 'undefined') {
      return target;
    }
  }
  return target;
}


/***/ }),

/***/ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/assert/deepEquals/DeepTypeUtils.js":
/*!***********************************************************************************************************************************************************************************************!*\
  !*** ../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/assert/deepEquals/DeepTypeUtils.js ***!
  \***********************************************************************************************************************************************************************************************/
/***/ ((__unused_webpack_module, exports) => {



Object.defineProperty(exports, "__esModule", ({
  value: true
}));
exports["default"] = void 0;
class DeepTypeUtils {
  static getType_(value) {
    return Object.prototype.toString.apply(value);
  }
  static isA_(typeName, value) {
    return this.getType_(value) === '[object ' + typeName + ']';
  }
  static isAsymmetricEqualityTester_(obj) {
    return obj ? this.isA_('Function', obj.asymmetricMatch) : false;
  }
  static isFunction_(value) {
    return this.isA_('Function', value);
  }
  static isUndefined(obj) {
    return obj === void 0;
  }
  static isDomNode(obj) {
    return obj !== null && typeof obj === 'object' && typeof obj.nodeType === 'number' && typeof obj.nodeName === 'string';
  }
  static isPromise(obj) {
    return !!obj && obj.constructor === Promise;
  }
  static isMap(obj) {
    return obj !== null && typeof obj !== 'undefined' && obj.constructor === Map;
  }
  static isSet(obj) {
    return obj !== null && typeof obj !== 'undefined' && obj.constructor === Set;
  }
  static has(obj, key) {
    return Object.prototype.hasOwnProperty.call(obj, key);
  }
  static keys(obj, isArray) {
    const extraKeys = [];
    const allKeys = this.getAllKeys(obj);
    if (!isArray) {
      return allKeys;
    }
    if (allKeys.length === 0) {
      return allKeys;
    }
    for (const k of allKeys) {
      if (typeof k === 'symbol' || !/^[0-9]+$/.test(k)) {
        extraKeys.push(k);
      }
    }
    return extraKeys;
  }
  static getAllKeys(obj) {
    const keys = [];
    for (let key in obj) {
      if (this.has(obj, key)) {
        keys.push(key);
      }
    }
    const symbols = Object.getOwnPropertySymbols(obj);
    for (const sym of symbols) {
      if (obj.propertyIsEnumerable(sym)) {
        keys.push(sym);
      }
    }
    return keys;
  }
}
var _default = DeepTypeUtils;
exports["default"] = _default;

function requireModule(moduleName) {
  const systemList = ['system.router', 'system.app', 'system.prompt', 'system.configuration',
  'system.image', 'system.device', 'system.mediaquery', 'ohos.animator', 'system.grid', 'system.resource']
  var target = ''
  if (systemList.includes(moduleName.replace('@', ''))) {
    target = $app_require$('@app-module/' + moduleName.substring(1));
    return target;
  }
  var shortName = moduleName.replace(/@[^.]+.([^.]+)/, '$1');
  target = requireNapi(shortName);
  if (typeof target !== 'undefined' && /@ohos/.test(moduleName)) {
    return target;
  }
  if (typeof ohosplugin !== 'undefined' && /@ohos/.test(moduleName)) {
    target = ohosplugin;
    for (let key of shortName.split('.')) {
      target = target[key];
      if(!target) {
        break;
      }
    }
    if (typeof target !== 'undefined') {
      return target;
    }
  }
  if (typeof systemplugin !== 'undefined') {
    target = systemplugin;
    for (let key of shortName.split('.')) {
      target = target[key];
      if(!target) {
        break;
      }
    }
    if (typeof target !== 'undefined') {
      return target;
    }
  }
  return target;
}


/***/ }),

/***/ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/assert/deepEquals/assertDeepEquals.js":
/*!**************************************************************************************************************************************************************************************************!*\
  !*** ../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/assert/deepEquals/assertDeepEquals.js ***!
  \**************************************************************************************************************************************************************************************************/
/***/ ((__unused_webpack_module, exports, __webpack_require__) => {



var _interopRequireDefault = __webpack_require__(/*! @babel/runtime/helpers/interopRequireDefault */ "./node_modules/@babel/runtime/helpers/interopRequireDefault.js");
Object.defineProperty(exports, "__esModule", ({
  value: true
}));
exports["default"] = void 0;
var _DeepTypeUtils = _interopRequireDefault(__webpack_require__(/*! ./DeepTypeUtils */ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/assert/deepEquals/DeepTypeUtils.js"));
function assertDeepEquals(actualValue, expected) {
  console.log('actualValue:' + actualValue + ',expected:' + expected[0]);
  let result = eq(actualValue, expected[0], [], []);
  let msg = logMsg(actualValue, expected[0]);
  return {
    pass: result,
    message: msg
  };
}
function logMsg(actualValue, expected) {
  const aClassName = Object.prototype.toString.call(actualValue);
  const bClassName = Object.prototype.toString.call(expected);
  let actualMsg;
  let expectMsg;
  if (aClassName == "[object Function]") {
    actualMsg = "actualValue Function";
  } else if (aClassName == "[object Promise]") {
    actualMsg = "actualValue Promise";
  } else if (aClassName == "[object Set]" || aClassName == "[object Map]") {
    actualMsg = JSON.stringify(Array.from(actualValue));
    ;
  } else if (aClassName == "[object RegExp]") {
    actualMsg = JSON.stringify(actualValue.source.replace("\\", ""));
    ;
  } else {
    actualMsg = JSON.stringify(actualValue);
  }
  if (bClassName == "[object Function]") {
    expectMsg = "expected Function";
  } else if (bClassName == "[object Promise]") {
    expectMsg = "expected Promise";
  } else if (aClassName == "[object Set]" || bClassName == "[object Map]") {
    expectMsg = JSON.stringify(Array.from(expected));
  } else if (aClassName == "[object RegExp]") {
    expectMsg = JSON.stringify(expected.source.replace("\\", ""));
    ;
  } else {
    expectMsg = JSON.stringify(expected);
  }
  return actualMsg + " is not deep equal " + expectMsg;
}
function eq(a, b, aStack, bStack) {
  let result = true;
  console.log('a is:' + a + ',b is:' + b);
  const asymmetricResult = asymmetricMatch_(a, b);
  if (!_DeepTypeUtils.default.isUndefined(asymmetricResult)) {
    return asymmetricResult;
  }
  if (a instanceof Error && b instanceof Error) {
    result = a.message == b.message;
    return result;
  }
  if (a === b) {
    result = a !== 0 || 1 / a == 1 / b;
    return result;
  }
  if (a === null || b === null) {
    result = a === b;
    return result;
  }
  const aClassName = Object.prototype.toString.call(a);
  const bClassName = Object.prototype.toString.call(b);
  console.log('aClassName is:' + aClassName);
  console.log('bClassName is:' + bClassName);
  if (aClassName != bClassName) {
    return false;
  }
  if (aClassName === '[object String]') {
    result = a == String(b);
    return result;
  }
  if (aClassName === '[object Number]') {
    result = a != +a ? b != +b : a === 0 && b === 0 ? 1 / a == 1 / b : a == +b;
    return result;
  }
  if (aClassName === '[object Date]' || aClassName === '[object Boolean]') {
    result = +a == +b;
    return result;
  }
  if (aClassName === '[object ArrayBuffer]') {
    return eq(new Uint8Array(a), new Uint8Array(b), aStack, bStack);
  }
  if (aClassName === '[object RegExp]') {
    return a.source == b.source && a.global == b.global && a.multiline == b.multiline && a.ignoreCase == b.ignoreCase;
  }
  if (typeof a != 'object' || typeof b != 'object') {
    return false;
  }
  const aIsDomNode = _DeepTypeUtils.default.isDomNode(a);
  const bIsDomNode = _DeepTypeUtils.default.isDomNode(b);
  if (aIsDomNode && bIsDomNode) {
    result = a.isEqualNode(b);
    return result;
  }
  if (aIsDomNode || bIsDomNode) {
    return false;
  }
  const aIsPromise = _DeepTypeUtils.default.isPromise(a);
  const bIsPromise = _DeepTypeUtils.default.isPromise(b);
  if (aIsPromise && bIsPromise) {
    return a === b;
  }
  let length = aStack.length;
  while (length--) {
    if (aStack[length] == a) {
      return bStack[length] == b;
    }
  }
  aStack.push(a);
  bStack.push(b);
  let size = 0;
  if (aClassName == '[object Array]') {
    const aLength = a.length;
    const bLength = b.length;
    if (aLength !== bLength) {
      return false;
    }
    for (let i = 0; i < aLength || i < bLength; i++) {
      result = eq(i < aLength ? a[i] : void 0, i < bLength ? b[i] : void 0, aStack, bStack) && result;
    }
    if (!result) {
      return false;
    }
  } else if (_DeepTypeUtils.default.isMap(a) && _DeepTypeUtils.default.isMap(b)) {
    if (a.size != b.size) {
      return false;
    }
    const keysA = [];
    const keysB = [];
    a.forEach(function (valueA, keyA) {
      keysA.push(keyA);
    });
    b.forEach(function (valueB, keyB) {
      keysB.push(keyB);
    });
    const mapKeys = [keysA, keysB];
    const cmpKeys = [keysB, keysA];
    for (let i = 0; result && i < mapKeys.length; i++) {
      const mapIter = mapKeys[i];
      const cmpIter = cmpKeys[i];
      for (let j = 0; result && j < mapIter.length; j++) {
        const mapKey = mapIter[j];
        const cmpKey = cmpIter[j];
        const mapValueA = a.get(mapKey);
        let mapValueB;
        if (_DeepTypeUtils.default.isAsymmetricEqualityTester_(mapKey) || _DeepTypeUtils.default.isAsymmetricEqualityTester_(cmpKey) && eq(mapKey, cmpKey)) {
          mapValueB = b.get(cmpKey);
        } else {
          mapValueB = b.get(mapKey);
        }
        result = eq(mapValueA, mapValueB, aStack, bStack);
      }
    }
    if (!result) {
      return false;
    }
  } else if (_DeepTypeUtils.default.isSet(a) && _DeepTypeUtils.default.isSet(b)) {
    if (a.size != b.size) {
      return false;
    }
    const valuesA = [];
    a.forEach(function (valueA) {
      valuesA.push(valueA);
    });
    const valuesB = [];
    b.forEach(function (valueB) {
      valuesB.push(valueB);
    });
    const setPairs = [[valuesA, valuesB], [valuesB, valuesA]];
    const stackPairs = [[aStack, bStack], [bStack, aStack]];
    for (let i = 0; result && i < setPairs.length; i++) {
      const baseValues = setPairs[i][0];
      const otherValues = setPairs[i][1];
      const baseStack = stackPairs[i][0];
      const otherStack = stackPairs[i][1];
      for (const baseValue of baseValues) {
        let found = false;
        for (let j = 0; !found && j < otherValues.length; j++) {
          const otherValue = otherValues[j];
          const prevStackSize = baseStack.length;
          found = eq(baseValue, otherValue, baseStack, otherStack);
          if (!found && prevStackSize !== baseStack.length) {
            baseStack.splice(prevStackSize);
            otherStack.splice(prevStackSize);
          }
        }
        result = result && found;
      }
    }
    if (!result) {
      return false;
    }
  } else {
    const aCtor = a.constructor,
      bCtor = b.constructor;
    if (aCtor !== bCtor && _DeepTypeUtils.default.isFunction_(aCtor) && _DeepTypeUtils.default.isFunction_(bCtor) && a instanceof aCtor && b instanceof bCtor && !(aCtor instanceof aCtor && bCtor instanceof bCtor)) {
      return false;
    }
  }
  const aKeys = _DeepTypeUtils.default.keys(a, aClassName == '[object Array]');
  size = aKeys.length;
  if (_DeepTypeUtils.default.keys(b, bClassName == '[object Array]').length !== size) {
    return false;
  }
  for (const key of aKeys) {
    console.log('key is:' + key);
    if (!_DeepTypeUtils.default.has(b, key)) {
      result = false;
      continue;
    }
    if (!eq(a[key], b[key], aStack, bStack)) {
      result = false;
    }
  }
  if (!result) {
    return false;
  }
  aStack.pop();
  bStack.pop();
  return result;
}
function asymmetricMatch_(a, b) {
  const asymmetricA = _DeepTypeUtils.default.isAsymmetricEqualityTester_(a);
  const asymmetricB = _DeepTypeUtils.default.isAsymmetricEqualityTester_(b);
  if (asymmetricA === asymmetricB) {
    return undefined;
  }
}
function keys(obj, isArray) {
  const keys = [];
}
var _default = assertDeepEquals;
exports["default"] = _default;

function requireModule(moduleName) {
  const systemList = ['system.router', 'system.app', 'system.prompt', 'system.configuration',
  'system.image', 'system.device', 'system.mediaquery', 'ohos.animator', 'system.grid', 'system.resource']
  var target = ''
  if (systemList.includes(moduleName.replace('@', ''))) {
    target = $app_require$('@app-module/' + moduleName.substring(1));
    return target;
  }
  var shortName = moduleName.replace(/@[^.]+.([^.]+)/, '$1');
  target = requireNapi(shortName);
  if (typeof target !== 'undefined' && /@ohos/.test(moduleName)) {
    return target;
  }
  if (typeof ohosplugin !== 'undefined' && /@ohos/.test(moduleName)) {
    target = ohosplugin;
    for (let key of shortName.split('.')) {
      target = target[key];
      if(!target) {
        break;
      }
    }
    if (typeof target !== 'undefined') {
      return target;
    }
  }
  if (typeof systemplugin !== 'undefined') {
    target = systemplugin;
    for (let key of shortName.split('.')) {
      target = target[key];
      if(!target) {
        break;
      }
    }
    if (typeof target !== 'undefined') {
      return target;
    }
  }
  return target;
}


/***/ }),

/***/ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/assert/isPromiseLike.js":
/*!************************************************************************************************************************************************************************************!*\
  !*** ../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/assert/isPromiseLike.js ***!
  \************************************************************************************************************************************************************************************/
/***/ ((__unused_webpack_module, exports) => {



Object.defineProperty(exports, "__esModule", ({
  value: true
}));
exports["default"] = void 0;
function isPromiseLike(obj) {
  return !!obj && isFunction_(obj.then);
}
function isFunction_(value) {
  return isA_('Function', value);
}
function isA_(typeName, value) {
  return getType_(value) === '[object ' + typeName + ']';
}
function getType_(value) {
  return Object.prototype.toString.apply(value);
}
var _default = isPromiseLike;
exports["default"] = _default;

function requireModule(moduleName) {
  const systemList = ['system.router', 'system.app', 'system.prompt', 'system.configuration',
  'system.image', 'system.device', 'system.mediaquery', 'ohos.animator', 'system.grid', 'system.resource']
  var target = ''
  if (systemList.includes(moduleName.replace('@', ''))) {
    target = $app_require$('@app-module/' + moduleName.substring(1));
    return target;
  }
  var shortName = moduleName.replace(/@[^.]+.([^.]+)/, '$1');
  target = requireNapi(shortName);
  if (typeof target !== 'undefined' && /@ohos/.test(moduleName)) {
    return target;
  }
  if (typeof ohosplugin !== 'undefined' && /@ohos/.test(moduleName)) {
    target = ohosplugin;
    for (let key of shortName.split('.')) {
      target = target[key];
      if(!target) {
        break;
      }
    }
    if (typeof target !== 'undefined') {
      return target;
    }
  }
  if (typeof systemplugin !== 'undefined') {
    target = systemplugin;
    for (let key of shortName.split('.')) {
      target = target[key];
      if(!target) {
        break;
      }
    }
    if (typeof target !== 'undefined') {
      return target;
    }
  }
  return target;
}


/***/ }),

/***/ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/config/DataDriver.js":
/*!*********************************************************************************************************************************************************************************!*\
  !*** ../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/config/DataDriver.js ***!
  \*********************************************************************************************************************************************************************************/
/***/ ((__unused_webpack_module, exports) => {



Object.defineProperty(exports, "__esModule", ({
  value: true
}));
exports["default"] = void 0;
const SUITES_KEY = 'suites';
const SPECS_KEY = 'items';
const DESCRIBE_KEY = 'describe';
const IT_KEY = 'it';
const PARAMS_KEY = 'params';
const STRESS_KEY = 'stress';
class ObjectUtils {
  static get(object, name, defaultValue) {
    let result = defaultValue;
    for (const key in object) {
      if (key === name) {
        return object[key];
      }
    }
    return result;
  }
  static has(object, key) {
    return Object.prototype.hasOwnProperty.call(object, key);
  }
}
class DataDriver {
  constructor(attr) {
    this.id = 'dataDriver';
    this.data = attr.data || {};
  }
  init(coreContext) {
    this.coreContext = coreContext;
    this.suiteService = this.coreContext.getDefaultService('suite');
    this.specService = this.coreContext.getDefaultService('spec');
  }
  getSpecParams() {
    let specParams = [];
    let suiteDesc = this.suiteService.getCurrentRunningSuite().description;
    let specDesc = this.specService.getCurrentRunningSpec().description;
    let suites = ObjectUtils.get(this.data, SUITES_KEY, []);
    for (const suiteItem of suites) {
      let describeValue = ObjectUtils.get(suiteItem, DESCRIBE_KEY, '');
      if (ObjectUtils.has(suiteItem, DESCRIBE_KEY) && typeof describeValue === 'object' && describeValue.constructor === Array && describeValue.includes(suiteDesc)) {
        let specs = ObjectUtils.get(suiteItem, SPECS_KEY, []);
        for (const specItem of specs) {
          if (ObjectUtils.has(specItem, IT_KEY) && ObjectUtils.get(specItem, IT_KEY) === specDesc) {
            return ObjectUtils.get(specItem, PARAMS_KEY, specParams);
          }
        }
      }
    }
    return specParams;
  }
  getSuiteParams() {
    let suiteParams = {};
    let suiteDesc = this.suiteService.getCurrentRunningSuite().description;
    let suites = ObjectUtils.get(this.data, SUITES_KEY, []);
    for (const suiteItem of suites) {
      let describeValue = ObjectUtils.get(suiteItem, DESCRIBE_KEY, []);
      if (ObjectUtils.has(suiteItem, DESCRIBE_KEY) && typeof describeValue === 'object' && describeValue.constructor === Array && describeValue.includes(suiteDesc)) {
        suiteParams = Object.assign({}, suiteParams, ObjectUtils.get(suiteItem, PARAMS_KEY, suiteParams));
      }
    }
    return suiteParams;
  }
  getSpecStress(specDesc) {
    let stress = 1;
    let suiteDesc = this.suiteService.getCurrentRunningSuite().description;
    let suites = ObjectUtils.get(this.data, SUITES_KEY, []);
    for (const suiteItem of suites) {
      let describeValue = ObjectUtils.get(suiteItem, DESCRIBE_KEY, '');
      if (ObjectUtils.has(suiteItem, DESCRIBE_KEY) && typeof describeValue === 'object' && describeValue.constructor === Array && describeValue.includes(suiteDesc)) {
        let specs = ObjectUtils.get(suiteItem, SPECS_KEY, []);
        for (const specItem of specs) {
          if (ObjectUtils.has(specItem, IT_KEY) && ObjectUtils.get(specItem, IT_KEY) === specDesc) {
            let tempStress = ObjectUtils.get(specItem, STRESS_KEY, stress);
            return Number.isInteger(tempStress) && tempStress >= 1 ? tempStress : stress;
          }
        }
      }
    }
    return stress;
  }
  getSuiteStress(suiteDesc) {
    let stress = 1;
    let suites = ObjectUtils.get(this.data, SUITES_KEY, []);
    for (const suiteItem of suites) {
      let describeValue = ObjectUtils.get(suiteItem, DESCRIBE_KEY, []);
      if (ObjectUtils.has(suiteItem, DESCRIBE_KEY) && typeof describeValue === 'object' && describeValue.constructor === Array && describeValue.includes(suiteDesc)) {
        let tempStress = ObjectUtils.get(suiteItem, STRESS_KEY, stress);
        return Number.isInteger(tempStress) && tempStress >= 1 ? tempStress : stress;
      }
    }
    return stress;
  }
}
var _default = DataDriver;
exports["default"] = _default;

function requireModule(moduleName) {
  const systemList = ['system.router', 'system.app', 'system.prompt', 'system.configuration',
  'system.image', 'system.device', 'system.mediaquery', 'ohos.animator', 'system.grid', 'system.resource']
  var target = ''
  if (systemList.includes(moduleName.replace('@', ''))) {
    target = $app_require$('@app-module/' + moduleName.substring(1));
    return target;
  }
  var shortName = moduleName.replace(/@[^.]+.([^.]+)/, '$1');
  target = requireNapi(shortName);
  if (typeof target !== 'undefined' && /@ohos/.test(moduleName)) {
    return target;
  }
  if (typeof ohosplugin !== 'undefined' && /@ohos/.test(moduleName)) {
    target = ohosplugin;
    for (let key of shortName.split('.')) {
      target = target[key];
      if(!target) {
        break;
      }
    }
    if (typeof target !== 'undefined') {
      return target;
    }
  }
  if (typeof systemplugin !== 'undefined') {
    target = systemplugin;
    for (let key of shortName.split('.')) {
      target = target[key];
      if(!target) {
        break;
      }
    }
    if (typeof target !== 'undefined') {
      return target;
    }
  }
  return target;
}


/***/ }),

/***/ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/config/Filter.js":
/*!*****************************************************************************************************************************************************************************!*\
  !*** ../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/config/Filter.js ***!
  \*****************************************************************************************************************************************************************************/
/***/ ((__unused_webpack_module, exports) => {



Object.defineProperty(exports, "__esModule", ({
  value: true
}));
exports.TestTypesFilter = exports.SuiteAndItNameFilter = exports.NotClassFilter = exports.ClassFilter = void 0;
class ClassFilter {
  constructor(suiteName, itName, params) {
    this.suiteName = suiteName;
    this.itName = itName;
    this.params = params;
  }
  filterSuite() {
    return !this.params.split(',').map(item => item.split('#')[0]).map(item => item == this.suiteName).reduce((pre, cur) => pre || cur, false);
  }
  filterIt() {
    let classArray = this.params.split(',') || [];
    let suiteFilterResult = classArray.filter(item => !item.includes('#')).map(item => item == this.suiteName).reduce((pre, cur) => pre || cur, false);
    let itFilterResult = classArray.filter(item => item.includes('#')).map(item => item == this.suiteName + '#' + this.itName).reduce((pre, cur) => pre || cur, false);
    return !(suiteFilterResult || itFilterResult);
  }
}
exports.ClassFilter = ClassFilter;
class NotClassFilter {
  constructor(suiteName, itName, params) {
    this.suiteName = suiteName;
    this.itName = itName;
    this.params = params;
  }
  filterSuite() {
    return this.params.split(',').map(item => item == this.suiteName).reduce((pre, cur) => pre || cur, false);
  }
  filterIt() {
    return this.params.split(',').some(item => item == this.suiteName + '#' + this.itName);
  }
}
exports.NotClassFilter = NotClassFilter;
class SuiteAndItNameFilter {
  constructor(suiteName, itName, params) {
    this.suiteName = suiteName;
    this.itName = itName;
    this.params = params;
  }
  filterSuite() {
    return !this.params.split(',').map(item => item == this.suiteName).reduce((pre, cur) => pre || cur, false);
  }
  filterIt() {
    return !this.params.split(',').map(item => item == this.itName).reduce((pre, cur) => pre || cur, false);
  }
}
exports.SuiteAndItNameFilter = SuiteAndItNameFilter;
class TestTypesFilter {
  constructor(suiteName, itName, fi, params) {
    this.suiteName = suiteName;
    this.itName = itName;
    this.params = params;
    this.fi = fi;
  }
  filterIt() {
    return !(this.params === (this.fi & this.params) || this.fi === 0);
  }
}
exports.TestTypesFilter = TestTypesFilter;

function requireModule(moduleName) {
  const systemList = ['system.router', 'system.app', 'system.prompt', 'system.configuration',
  'system.image', 'system.device', 'system.mediaquery', 'ohos.animator', 'system.grid', 'system.resource']
  var target = ''
  if (systemList.includes(moduleName.replace('@', ''))) {
    target = $app_require$('@app-module/' + moduleName.substring(1));
    return target;
  }
  var shortName = moduleName.replace(/@[^.]+.([^.]+)/, '$1');
  target = requireNapi(shortName);
  if (typeof target !== 'undefined' && /@ohos/.test(moduleName)) {
    return target;
  }
  if (typeof ohosplugin !== 'undefined' && /@ohos/.test(moduleName)) {
    target = ohosplugin;
    for (let key of shortName.split('.')) {
      target = target[key];
      if(!target) {
        break;
      }
    }
    if (typeof target !== 'undefined') {
      return target;
    }
  }
  if (typeof systemplugin !== 'undefined') {
    target = systemplugin;
    for (let key of shortName.split('.')) {
      target = target[key];
      if(!target) {
        break;
      }
    }
    if (typeof target !== 'undefined') {
      return target;
    }
  }
  return target;
}


/***/ }),

/***/ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/config/configService.js":
/*!************************************************************************************************************************************************************************************!*\
  !*** ../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/config/configService.js ***!
  \************************************************************************************************************************************************************************************/
/***/ ((__unused_webpack_module, exports, __webpack_require__) => {



Object.defineProperty(exports, "__esModule", ({
  value: true
}));
exports.ConfigService = void 0;
var _Filter = __webpack_require__(/*! ./Filter */ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/config/Filter.js");
const STRESS_RULE = /^[1-9]\d*$/;
class ConfigService {
  constructor(attr) {
    this.id = attr.id;
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
  init(coreContext) {
    this.coreContext = coreContext;
  }
  isNormalInteger(str) {
    const n = Math.floor(Number(str));
    return n !== Infinity && String(n) === String(str) && n >= 0;
  }
  getStress() {
    if (this.stress === undefined || this.stress === '' || this.stress === null) {
      return 1;
    }
    return !this.stress.match(STRESS_RULE) ? 1 : Number.parseInt(this.stress);
  }
  basicParamValidCheck(params) {
    let size = params.size;
    if (size !== undefined && size !== '' && size !== null) {
      let sizeArray = ['small', 'medium', 'large'];
      if (sizeArray.indexOf(size) === -1) {
        this.filterValid.push('size:' + size);
      }
    }
    let level = params.level;
    if (level !== undefined && level !== '' && level !== null) {
      let levelArray = ['0', '1', '2', '3', '4'];
      if (levelArray.indexOf(level) === -1) {
        this.filterValid.push('level:' + level);
      }
    }
    let testType = params.testType;
    if (testType !== undefined && testType !== '' && testType !== null) {
      let testTypeArray = ['function', 'performance', 'power', 'reliability', 'security', 'global', 'compatibility', 'user', 'standard', 'safety', 'resilience'];
      if (testTypeArray.indexOf(testType) === -1) {
        this.filterValid.push('testType:' + testType);
      }
    }
  }
  filterParamValidCheck(params) {
    let timeout = params.timeout;
    if (timeout !== undefined && timeout !== '' && timeout !== null) {
      if (!this.isNormalInteger(timeout)) {
        this.filterValid.push('timeout:' + timeout);
      }
    }
    let paramKeys = ['dryRun', 'random', 'breakOnError', 'coverage'];
    for (const key of paramKeys) {
      if (params[key] !== undefined && params[key] !== 'true' && params[key] !== 'false') {
        this.filterValid.push(`${key}:${params[key]}`);
      }
    }
    if (params.stress !== undefined && params.stress !== '' && params.stress !== null) {
      if (!params.stress.match(STRESS_RULE)) {
        this.filterValid.push('stress:' + params.stress);
      }
    }
    let nameRule = /^[A-Za-z]{1}[\w#,.]*$/;
    let paramClassKeys = ['class', 'notClass'];
    for (const key of paramClassKeys) {
      if (params[key] !== undefined && params[key] !== '' && params[key] !== null) {
        let classArray = params[key].split(',');
        classArray.forEach(item => !item.match(nameRule) ? this.filterValid.push(`${key}:${params[key]}`) : null);
      }
    }
  }
  setConfig(params) {
    this.basicParamValidCheck(params);
    this.filterParamValidCheck(params);
    try {
      this.class = params.class;
      this.notClass = params.notClass;
      this.flag = params.flag || {
        flag: false
      };
      this.suite = params.suite;
      this.itName = params.itName;
      this.filter = params.filter;
      this.testType = params.testType;
      this.level = params.level;
      this.size = params.size;
      this.timeout = params.timeout;
      this.dryRun = params.dryRun;
      this.breakOnError = params.breakOnError;
      this.random = params.random === 'true' ? true : false;
      this.stress = params.stress;
      this.coverage = params.coverage;
      this.filterParam = {
        testType: {
          'function': 1,
          'performance': 1 << 1,
          'power': 1 << 2,
          'reliability': 1 << 3,
          'security': 1 << 4,
          'global': 1 << 5,
          'compatibility': 1 << 6,
          'user': 1 << 7,
          'standard': 1 << 8,
          'safety': 1 << 9,
          'resilience': 1 << 10
        },
        level: {
          '0': 1 << 24,
          '1': 1 << 25,
          '2': 1 << 26,
          '3': 1 << 27,
          '4': 1 << 28
        },
        size: {
          'small': 1 << 16,
          'medium': 1 << 17,
          'large': 1 << 18
        }
      };
      this.parseParams();
    } catch (err) {
      console.info('setConfig error: ' + err.message);
    }
  }
  parseParams() {
    if (this.filter != null) {
      return;
    }
    let testTypeFilter = 0;
    let sizeFilter = 0;
    let levelFilter = 0;
    if (this.testType != null) {
      testTypeFilter = this.testType.split(',').map(item => this.filterParam.testType[item] || 0).reduce((pre, cur) => pre | cur, 0);
    }
    if (this.level != null) {
      levelFilter = this.level.split(',').map(item => this.filterParam.level[item] || 0).reduce((pre, cur) => pre | cur, 0);
    }
    if (this.size != null) {
      sizeFilter = this.size.split(',').map(item => this.filterParam.size[item] || 0).reduce((pre, cur) => pre | cur, 0);
    }
    this.filter = testTypeFilter | sizeFilter | levelFilter;
    console.info('filter params:' + this.filter);
  }
  isCurrentSuite(description) {
    if (this.suite !== undefined && this.suite !== '' && this.suite !== null) {
      let suiteArray = this.suite.split(',');
      return suiteArray.indexOf(description) !== -1;
    }
    return false;
  }
  filterSuite(currentSuiteName) {
    let filterArray = [];
    if (this.suite !== undefined && this.suite !== '' && this.suite !== null) {
      filterArray.push(new _Filter.SuiteAndItNameFilter(currentSuiteName, '', this.suite));
    }
    if (this.class !== undefined && this.class !== '' && this.class !== null) {
      filterArray.push(new _Filter.ClassFilter(currentSuiteName, '', this.class));
    }
    if (this.notClass !== undefined && this.notClass !== '' && this.notClass !== null) {
      filterArray.push(new _Filter.NotClassFilter(currentSuiteName, '', this.notClass));
    }
    let result = filterArray.map(item => item.filterSuite()).reduce((pre, cur) => pre || cur, false);
    return result;
  }
  filterDesc(currentSuiteName, desc, fi, coreContext) {
    let filterArray = [];
    if (this.itName !== undefined && this.itName !== '' && this.itName !== null) {
      filterArray.push(new _Filter.SuiteAndItNameFilter(currentSuiteName, desc, this.itName));
    }
    if (this.class !== undefined && this.class !== '' && this.class !== null) {
      filterArray.push(new _Filter.ClassFilter(currentSuiteName, desc, this.class));
    }
    if (this.notClass !== undefined && this.notClass !== '' && this.notClass !== null) {
      filterArray.push(new _Filter.NotClassFilter(currentSuiteName, desc, this.notClass));
    }
    if (typeof this.filter !== 'undefined' && this.filter !== 0 && fi !== 0) {
      filterArray.push(new _Filter.TestTypesFilter('', '', fi, this.filter));
    }
    let result = filterArray.map(item => item.filterIt()).reduce((pre, cur) => pre || cur, false);
    return result;
  }
  isRandom() {
    return this.random || false;
  }
  isBreakOnError() {
    return this.breakOnError !== 'true' ? false : true;
  }
  setSupportAsync(value) {
    this.supportAsync = value;
  }
  isSupportAsync() {
    return this.supportAsync;
  }
  translateParams(parameters) {
    const keySet = new Set(['-s class', '-s notClass', '-s suite', '-s itName', '-s level', '-s testType', '-s size', '-s timeout', '-s dryRun', '-s random', '-s breakOnError', '-s stress', '-s coverage', 'class', 'notClass', 'suite', 'itName', 'level', 'testType', 'size', 'timeout', 'dryRun', 'random', 'breakOnError', 'stress', 'coverage']);
    let targetParams = {};
    for (const key in parameters) {
      if (keySet.has(key)) {
        var newKey = key.replace("-s ", "");
        targetParams[newKey] = parameters[key];
      }
    }
    return targetParams;
  }
  translateParamsToString(parameters) {
    const keySet = new Set(['-s class', '-s notClass', '-s suite', '-s itName', '-s level', '-s testType', '-s size', '-s timeout', '-s dryRun', '-s random', '-s breakOnError', '-s stress', '-s coverage', 'class', 'notClass', 'suite', 'itName', 'level', 'testType', 'size', 'timeout', 'dryRun', 'random', 'breakOnError', 'stress', 'coverage']);
    let targetParams = '';
    for (const key in parameters) {
      if (keySet.has(key)) {
        targetParams += ' ' + key + ' ' + parameters[key];
      }
    }
    return targetParams.trim();
  }
  execute() {}
}
exports.ConfigService = ConfigService;

function requireModule(moduleName) {
  const systemList = ['system.router', 'system.app', 'system.prompt', 'system.configuration',
  'system.image', 'system.device', 'system.mediaquery', 'ohos.animator', 'system.grid', 'system.resource']
  var target = ''
  if (systemList.includes(moduleName.replace('@', ''))) {
    target = $app_require$('@app-module/' + moduleName.substring(1));
    return target;
  }
  var shortName = moduleName.replace(/@[^.]+.([^.]+)/, '$1');
  target = requireNapi(shortName);
  if (typeof target !== 'undefined' && /@ohos/.test(moduleName)) {
    return target;
  }
  if (typeof ohosplugin !== 'undefined' && /@ohos/.test(moduleName)) {
    target = ohosplugin;
    for (let key of shortName.split('.')) {
      target = target[key];
      if(!target) {
        break;
      }
    }
    if (typeof target !== 'undefined') {
      return target;
    }
  }
  if (typeof systemplugin !== 'undefined') {
    target = systemplugin;
    for (let key of shortName.split('.')) {
      target = target[key];
      if(!target) {
        break;
      }
    }
    if (typeof target !== 'undefined') {
      return target;
    }
  }
  return target;
}


/***/ }),

/***/ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/coverage/coverageCollect.js":
/*!****************************************************************************************************************************************************************************************!*\
  !*** ../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/coverage/coverageCollect.js ***!
  \****************************************************************************************************************************************************************************************/
/***/ ((__unused_webpack_module, exports, __webpack_require__) => {



var _interopRequireDefault = __webpack_require__(/*! @babel/runtime/helpers/interopRequireDefault */ "./node_modules/@babel/runtime/helpers/interopRequireDefault.js");
Object.defineProperty(exports, "__esModule", ({
  value: true
}));
exports.collectCoverageData = collectCoverageData;
var _SysTestKit = _interopRequireDefault(__webpack_require__(/*! ../kit/SysTestKit */ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/kit/SysTestKit.js"));
async function collectCoverageData() {
  if (globalThis.__coverage__ === undefined) {
    return;
  }
  const strJson = JSON.stringify(globalThis.__coverage__);
  const strLen = strJson.length;
  const maxLen = 500;
  const maxCount = Math.floor(strLen / maxLen);
  const OHOS_REPORT_COVERAGE_DATA = 'OHOS_REPORT_COVERAGE_DATA:';
  for (let count = 0; count <= maxCount; count++) {
    await _SysTestKit.default.print(`${OHOS_REPORT_COVERAGE_DATA} ${strJson.substring(count * maxLen, (count + 1) * maxLen)}`);
  }
}

function requireModule(moduleName) {
  const systemList = ['system.router', 'system.app', 'system.prompt', 'system.configuration',
  'system.image', 'system.device', 'system.mediaquery', 'ohos.animator', 'system.grid', 'system.resource']
  var target = ''
  if (systemList.includes(moduleName.replace('@', ''))) {
    target = $app_require$('@app-module/' + moduleName.substring(1));
    return target;
  }
  var shortName = moduleName.replace(/@[^.]+.([^.]+)/, '$1');
  target = requireNapi(shortName);
  if (typeof target !== 'undefined' && /@ohos/.test(moduleName)) {
    return target;
  }
  if (typeof ohosplugin !== 'undefined' && /@ohos/.test(moduleName)) {
    target = ohosplugin;
    for (let key of shortName.split('.')) {
      target = target[key];
      if(!target) {
        break;
      }
    }
    if (typeof target !== 'undefined') {
      return target;
    }
  }
  if (typeof systemplugin !== 'undefined') {
    target = systemplugin;
    for (let key of shortName.split('.')) {
      target = target[key];
      if(!target) {
        break;
      }
    }
    if (typeof target !== 'undefined') {
      return target;
    }
  }
  return target;
}


/***/ }),

/***/ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/kit/SysTestKit.js":
/*!******************************************************************************************************************************************************************************!*\
  !*** ../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/kit/SysTestKit.js ***!
  \******************************************************************************************************************************************************************************/
/***/ ((__unused_webpack_module, exports, __webpack_require__) => {



var _interopRequireDefault = __webpack_require__(/*! @babel/runtime/helpers/interopRequireDefault */ "./node_modules/@babel/runtime/helpers/interopRequireDefault.js");
Object.defineProperty(exports, "__esModule", ({
  value: true
}));
exports["default"] = void 0;
var _defineProperty2 = _interopRequireDefault(__webpack_require__(/*! @babel/runtime/helpers/defineProperty */ "./node_modules/@babel/runtime/helpers/defineProperty.js"));
class SysTestKit {
  constructor() {
    this.id = 'sysTestKit';
    this.index = 0;
  }
  static actionStart(tag) {
    console.info(JSON.stringify(tag));
    var message = '\n' + 'OHOS_REPORT_ACTIONSTART: ' + JSON.stringify(tag) + '\n';
    SysTestKit.print(message);
    console.info(tag + ' actionStart print success');
  }
  static actionEnd(tag) {
    console.info(JSON.stringify(tag));
    var message = '\n' + 'OHOS_REPORT_ACTIONEND: ' + JSON.stringify(tag) + '\n';
    SysTestKit.print(message);
    console.info(tag + ' actionEnd print success');
  }
  static async existKeyword(keyword, timeout) {
    let reg = new RegExp(/^[a-zA-Z0-9]{1,}$/);
    if (!reg.test(keyword)) {
      throw new Error('keyword must contain more than one string, and only letters and numbers are supported.');
    }
    timeout = timeout || 4;
    let searchResult = false;
    let cmd = 'hilog -x | grep -i \'' + keyword + '\' | wc -l';
    await executePromise(cmd, timeout).then(data => {
      searchResult = data;
    });
    return searchResult;
  }
  static async print(message) {
    if ('printSync' in SysTestKit.delegator) {
      console.debug(`printSync called ...`);
      SysTestKit.delegator.printSync(message);
    } else {
      await SysTestKit.delegator.print(message);
    }
  }
  static async getRealTime() {
    let currentTime = new Date().getTime();
    if (SysTestKit.systemTime !== null && SysTestKit.systemTime !== undefined) {
      await SysTestKit.systemTime.getRealTime().then(time => {
        console.info(`systemTime.getRealTime success data: ${JSON.stringify(time)}`);
        currentTime = time;
      }).catch(error => {
        console.error(`failed to systemTime.getRealTime because ${JSON.stringify(error)}`);
      });
    }
    return currentTime;
  }
}
(0, _defineProperty2.default)(SysTestKit, "delegator", null);
(0, _defineProperty2.default)(SysTestKit, "systemTime", null);
function executePromise(cmd, timeout) {
  return new Promise((resolve, reject) => {
    SysTestKit.delegator.executeShellCommand(cmd, timeout, (error, data) => {
      console.info('existKeyword CallBack: err : ' + JSON.stringify(error));
      console.info('existKeyword CallBack: data : ' + JSON.stringify(data));
      resolve(parseInt(data.stdResult) > 3 ? true : false);
    });
  });
}
var _default = SysTestKit;
exports["default"] = _default;

function requireModule(moduleName) {
  const systemList = ['system.router', 'system.app', 'system.prompt', 'system.configuration',
  'system.image', 'system.device', 'system.mediaquery', 'ohos.animator', 'system.grid', 'system.resource']
  var target = ''
  if (systemList.includes(moduleName.replace('@', ''))) {
    target = $app_require$('@app-module/' + moduleName.substring(1));
    return target;
  }
  var shortName = moduleName.replace(/@[^.]+.([^.]+)/, '$1');
  target = requireNapi(shortName);
  if (typeof target !== 'undefined' && /@ohos/.test(moduleName)) {
    return target;
  }
  if (typeof ohosplugin !== 'undefined' && /@ohos/.test(moduleName)) {
    target = ohosplugin;
    for (let key of shortName.split('.')) {
      target = target[key];
      if(!target) {
        break;
      }
    }
    if (typeof target !== 'undefined') {
      return target;
    }
  }
  if (typeof systemplugin !== 'undefined') {
    target = systemplugin;
    for (let key of shortName.split('.')) {
      target = target[key];
      if(!target) {
        break;
      }
    }
    if (typeof target !== 'undefined') {
      return target;
    }
  }
  return target;
}


/***/ }),

/***/ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/mock/ArgumentMatchers.js":
/*!*************************************************************************************************************************************************************************************!*\
  !*** ../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/mock/ArgumentMatchers.js ***!
  \*************************************************************************************************************************************************************************************/
/***/ ((__unused_webpack_module, exports, __webpack_require__) => {



var _interopRequireDefault = __webpack_require__(/*! @babel/runtime/helpers/interopRequireDefault */ "./node_modules/@babel/runtime/helpers/interopRequireDefault.js");
Object.defineProperty(exports, "__esModule", ({
  value: true
}));
exports["default"] = void 0;
var _defineProperty2 = _interopRequireDefault(__webpack_require__(/*! @babel/runtime/helpers/defineProperty */ "./node_modules/@babel/runtime/helpers/defineProperty.js"));
class ArgumentMatchers {
  constructor() {
    (0, _defineProperty2.default)(this, "ANY", "<any>");
    (0, _defineProperty2.default)(this, "ANY_STRING", "<any String>");
    (0, _defineProperty2.default)(this, "ANY_BOOLEAN", "<any Boolean>");
    (0, _defineProperty2.default)(this, "ANY_NUMBER", "<any Number>");
    (0, _defineProperty2.default)(this, "ANY_OBJECT", "<any Object>");
    (0, _defineProperty2.default)(this, "ANY_FUNCTION", "<any Function>");
    (0, _defineProperty2.default)(this, "MATCH_REGEXS", "<match regexs>");
  }
  static any() {}
  static anyString() {}
  static anyBoolean() {}
  static anyNumber() {}
  static anyObj() {}
  static anyFunction() {}
  static matchRegexs() {
    let regex = arguments[0];
    if (ArgumentMatchers.isRegExp(regex)) {
      return regex;
    }
    throw Error("not a regex");
  }
  static isRegExp(value) {
    return Object.prototype.toString.call(value) === "[object RegExp]";
  }
  matcheReturnKey() {
    let arg = arguments[0];
    let regex = arguments[1];
    let stubSetKey = arguments[2];
    if (stubSetKey && stubSetKey == this.ANY) {
      return this.ANY;
    }
    if (typeof arg === "string" && !regex) {
      return this.ANY_STRING;
    }
    if (typeof arg === "boolean" && !regex) {
      return this.ANY_BOOLEAN;
    }
    if (typeof arg === "number" && !regex) {
      return this.ANY_NUMBER;
    }
    if (typeof arg === "object" && !regex) {
      return this.ANY_OBJECT;
    }
    if (typeof arg === "function" && !regex) {
      return this.ANY_FUNCTION;
    }
    if (typeof arg === "string" && regex) {
      return regex.test(arg);
    }
    return null;
  }
  matcheStubKey() {
    let key = arguments[0];
    if (key === ArgumentMatchers.any) {
      return this.ANY;
    }
    if (key === ArgumentMatchers.anyString) {
      return this.ANY_STRING;
    }
    if (key === ArgumentMatchers.anyBoolean) {
      return this.ANY_BOOLEAN;
    }
    if (key === ArgumentMatchers.anyNumber) {
      return this.ANY_NUMBER;
    }
    if (key === ArgumentMatchers.anyObj) {
      return this.ANY_OBJECT;
    }
    if (key === ArgumentMatchers.anyFunction) {
      return this.ANY_FUNCTION;
    }
    if (ArgumentMatchers.isRegExp(key)) {
      return key;
    }
    return null;
  }
}
var _default = ArgumentMatchers;
exports["default"] = _default;

function requireModule(moduleName) {
  const systemList = ['system.router', 'system.app', 'system.prompt', 'system.configuration',
  'system.image', 'system.device', 'system.mediaquery', 'ohos.animator', 'system.grid', 'system.resource']
  var target = ''
  if (systemList.includes(moduleName.replace('@', ''))) {
    target = $app_require$('@app-module/' + moduleName.substring(1));
    return target;
  }
  var shortName = moduleName.replace(/@[^.]+.([^.]+)/, '$1');
  target = requireNapi(shortName);
  if (typeof target !== 'undefined' && /@ohos/.test(moduleName)) {
    return target;
  }
  if (typeof ohosplugin !== 'undefined' && /@ohos/.test(moduleName)) {
    target = ohosplugin;
    for (let key of shortName.split('.')) {
      target = target[key];
      if(!target) {
        break;
      }
    }
    if (typeof target !== 'undefined') {
      return target;
    }
  }
  if (typeof systemplugin !== 'undefined') {
    target = systemplugin;
    for (let key of shortName.split('.')) {
      target = target[key];
      if(!target) {
        break;
      }
    }
    if (typeof target !== 'undefined') {
      return target;
    }
  }
  return target;
}


/***/ }),

/***/ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/mock/ExtendInterface.js":
/*!************************************************************************************************************************************************************************************!*\
  !*** ../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/mock/ExtendInterface.js ***!
  \************************************************************************************************************************************************************************************/
/***/ ((__unused_webpack_module, exports) => {



Object.defineProperty(exports, "__esModule", ({
  value: true
}));
exports["default"] = void 0;
class ExtendInterface {
  constructor(mocker) {
    this.mocker = mocker;
  }
  stub() {
    this.params = arguments;
    return this;
  }
  stubMockedCall(returnInfo) {
    this.mocker.stubApply(this, this.params, returnInfo);
  }
  afterReturn(value) {
    this.stubMockedCall(function () {
      return value;
    });
  }
  afterReturnNothing() {
    this.stubMockedCall(function () {
      return undefined;
    });
  }
  afterAction(action) {
    this.stubMockedCall(action);
  }
  afterThrow(msg) {
    this.stubMockedCall(function () {
      throw msg;
    });
  }
  clear() {
    this.mocker.clear();
  }
}
var _default = ExtendInterface;
exports["default"] = _default;

function requireModule(moduleName) {
  const systemList = ['system.router', 'system.app', 'system.prompt', 'system.configuration',
  'system.image', 'system.device', 'system.mediaquery', 'ohos.animator', 'system.grid', 'system.resource']
  var target = ''
  if (systemList.includes(moduleName.replace('@', ''))) {
    target = $app_require$('@app-module/' + moduleName.substring(1));
    return target;
  }
  var shortName = moduleName.replace(/@[^.]+.([^.]+)/, '$1');
  target = requireNapi(shortName);
  if (typeof target !== 'undefined' && /@ohos/.test(moduleName)) {
    return target;
  }
  if (typeof ohosplugin !== 'undefined' && /@ohos/.test(moduleName)) {
    target = ohosplugin;
    for (let key of shortName.split('.')) {
      target = target[key];
      if(!target) {
        break;
      }
    }
    if (typeof target !== 'undefined') {
      return target;
    }
  }
  if (typeof systemplugin !== 'undefined') {
    target = systemplugin;
    for (let key of shortName.split('.')) {
      target = target[key];
      if(!target) {
        break;
      }
    }
    if (typeof target !== 'undefined') {
      return target;
    }
  }
  return target;
}


/***/ }),

/***/ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/mock/MockKit.js":
/*!****************************************************************************************************************************************************************************!*\
  !*** ../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/mock/MockKit.js ***!
  \****************************************************************************************************************************************************************************/
/***/ ((__unused_webpack_module, exports, __webpack_require__) => {



var _interopRequireDefault = __webpack_require__(/*! @babel/runtime/helpers/interopRequireDefault */ "./node_modules/@babel/runtime/helpers/interopRequireDefault.js");
Object.defineProperty(exports, "__esModule", ({
  value: true
}));
exports.MockKit = void 0;
exports.when = when;
var _ExtendInterface = _interopRequireDefault(__webpack_require__(/*! ./ExtendInterface */ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/mock/ExtendInterface.js"));
var _VerificationMode = _interopRequireDefault(__webpack_require__(/*! ./VerificationMode */ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/mock/VerificationMode.js"));
var _ArgumentMatchers = _interopRequireDefault(__webpack_require__(/*! ./ArgumentMatchers */ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/mock/ArgumentMatchers.js"));
class MockKit {
  constructor() {
    this.mFunctions = [];
    this.stubs = new Map();
    this.recordCalls = new Map();
    this.currentSetKey = null;
    this.mockObj = null;
    this.recordMockedMethod = new Map();
  }
  init() {
    this.reset();
  }
  reset() {
    this.mFunctions = [];
    this.stubs = {};
    this.recordCalls = {};
    this.currentSetKey = null;
    this.mockObj = null;
    this.recordMockedMethod = new Map();
  }
  clearAll() {
    this.reset();
    var props = Object.keys(this);
    for (var i = 0; i < props.length; i++) {
      delete this[props[i]];
    }
    var props = Object.getOwnPropertyNames(this);
    for (var i = 0; i < props.length; i++) {
      delete this[props[i]];
    }
    for (var key in this) {
      delete this[key];
    }
  }
  clear(obj) {
    if (!obj) throw Error("Please enter an object to be cleaned");
    if (typeof obj != 'object') throw new Error('Not a object');
    this.recordMockedMethod.forEach(function (value, key, map) {
      if (key) {
        obj[key] = value;
      }
    });
  }
  ignoreMock(obj, method) {
    if (typeof obj != 'object') throw new Error('Not a object');
    if (typeof method != 'function') throw new Error('Not a function');
    let og = this.recordMockedMethod.get(method.propName);
    if (og) {
      obj[method.propName] = og;
      this.recordMockedMethod.set(method.propName, undefined);
    }
  }
  extend(dest, source) {
    dest["stub"] = source["stub"];
    dest["afterReturn"] = source["afterReturn"];
    dest["afterReturnNothing"] = source["afterReturnNothing"];
    dest["afterAction"] = source["afterAction"];
    dest["afterThrow"] = source["afterThrow"];
    dest["stubMockedCall"] = source["stubMockedCall"];
    dest["clear"] = source["clear"];
    return dest;
  }
  stubApply(f, params, returnInfo) {
    let values = this.stubs.get(f);
    if (!values) {
      values = new Map();
    }
    let key = params[0];
    if (typeof key == "undefined") {
      key = "anonymous-mock-" + f.propName;
    }
    let matcher = new _ArgumentMatchers.default();
    if (matcher.matcheStubKey(key)) {
      key = matcher.matcheStubKey(key);
      if (key) {
        this.currentSetKey = key;
      }
    }
    values.set(key, returnInfo);
    this.stubs.set(f, values);
  }
  getReturnInfo(f, params) {
    let values = this.stubs.get(f);
    if (!values) {
      return undefined;
    }
    let retrunKet = params[0];
    if (typeof retrunKet == "undefined") {
      retrunKet = "anonymous-mock-" + f.propName;
    }
    let stubSetKey = this.currentSetKey;
    if (this.currentSetKey && typeof retrunKet != "undefined") {
      retrunKet = stubSetKey;
    }
    let matcher = new _ArgumentMatchers.default();
    if (matcher.matcheReturnKey(params[0], undefined, stubSetKey) && matcher.matcheReturnKey(params[0], undefined, stubSetKey) != stubSetKey) {
      retrunKet = params[0];
    }
    values.forEach(function (value, key, map) {
      if (_ArgumentMatchers.default.isRegExp(key) && matcher.matcheReturnKey(params[0], key)) {
        retrunKet = key;
      }
    });
    return values.get(retrunKet);
  }
  findName(obj, value) {
    let properties = this.findProperties(obj);
    let name = null;
    properties.forEach(function (va1, idx, array) {
      if (obj[va1] === value) {
        name = va1;
      }
    });
    return name;
  }
  isFunctionFromPrototype(f, container, propName) {
    if (container.constructor != Object && container.constructor.prototype !== container) {
      return container.constructor.prototype[propName] === f;
    }
    return false;
  }
  findProperties(obj, ...arg) {
    function getProperty(new_obj) {
      if (new_obj.__proto__ === null) {
        return [];
      }
      let properties = Object.getOwnPropertyNames(new_obj);
      return [...properties, ...getProperty(new_obj.__proto__)];
    }
    return getProperty(obj);
  }
  recordMethodCall(originalMethod, args) {
    Function.prototype.getName = function () {
      return this.name || this.toString().match(/function\s*([^(]*)\(/)[1];
    };
    let name = originalMethod.getName();
    let arglistString = name + '(' + Array.from(args).toString() + ')';
    let records = this.recordCalls.get(arglistString);
    if (!records) {
      records = 0;
    }
    records++;
    this.recordCalls.set(arglistString, records);
  }
  mockFunc(originalObject, originalMethod) {
    let tmp = this;
    this.originalMethod = originalMethod;
    let f = function () {
      let args = arguments;
      let action = tmp.getReturnInfo(f, args);
      if (originalMethod) {
        tmp.recordMethodCall(originalMethod, args);
      }
      if (action) {
        return action.apply(this, args);
      }
    };
    f.container =  false || originalObject;
    f.original = originalMethod || null;
    if (originalObject && originalMethod) {
      if (typeof originalMethod != 'function') throw new Error('Not a function');
      var name = this.findName(originalObject, originalMethod);
      originalObject[name] = f;
      this.recordMockedMethod.set(name, originalMethod);
      f.propName = name;
      f.originalFromPrototype = this.isFunctionFromPrototype(f.original, originalObject, f.propName);
    }
    f.mocker = this;
    this.mFunctions.push(f);
    this.extend(f, new _ExtendInterface.default(this));
    return f;
  }
  verify(methodName, argsArray) {
    if (!methodName) {
      throw Error("not a function name");
    }
    let a = this.recordCalls.get(methodName + '(' + argsArray.toString() + ')');
    return new _VerificationMode.default(a ? a : 0);
  }
  mockObject(object) {
    if (!object || typeof object === "string") {
      throw Error(`this ${object} cannot be mocked`);
    }
    const _this = this;
    let mockedObject = {};
    let keys = Reflect.ownKeys(object);
    keys.filter(key => typeof Reflect.get(object, key) === 'function').forEach(key => {
      mockedObject[key] = object[key];
      mockedObject[key] = _this.mockFunc(mockedObject, mockedObject[key]);
    });
    return mockedObject;
  }
}
exports.MockKit = MockKit;
function ifMockedFunction(f) {
  if (Object.prototype.toString.call(f) != "[object Function]" && Object.prototype.toString.call(f) != "[object AsyncFunction]") {
    throw Error("not a function");
  }
  if (!f.stub) {
    throw Error("not a mock function");
  }
  return true;
}
function when(f) {
  if (ifMockedFunction(f)) {
    return f.stub.bind(f);
  }
}

function requireModule(moduleName) {
  const systemList = ['system.router', 'system.app', 'system.prompt', 'system.configuration',
  'system.image', 'system.device', 'system.mediaquery', 'ohos.animator', 'system.grid', 'system.resource']
  var target = ''
  if (systemList.includes(moduleName.replace('@', ''))) {
    target = $app_require$('@app-module/' + moduleName.substring(1));
    return target;
  }
  var shortName = moduleName.replace(/@[^.]+.([^.]+)/, '$1');
  target = requireNapi(shortName);
  if (typeof target !== 'undefined' && /@ohos/.test(moduleName)) {
    return target;
  }
  if (typeof ohosplugin !== 'undefined' && /@ohos/.test(moduleName)) {
    target = ohosplugin;
    for (let key of shortName.split('.')) {
      target = target[key];
      if(!target) {
        break;
      }
    }
    if (typeof target !== 'undefined') {
      return target;
    }
  }
  if (typeof systemplugin !== 'undefined') {
    target = systemplugin;
    for (let key of shortName.split('.')) {
      target = target[key];
      if(!target) {
        break;
      }
    }
    if (typeof target !== 'undefined') {
      return target;
    }
  }
  return target;
}


/***/ }),

/***/ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/mock/VerificationMode.js":
/*!*************************************************************************************************************************************************************************************!*\
  !*** ../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/mock/VerificationMode.js ***!
  \*************************************************************************************************************************************************************************************/
/***/ ((__unused_webpack_module, exports, __webpack_require__) => {



Object.defineProperty(exports, "__esModule", ({
  value: true
}));
exports["default"] = void 0;
var _interface = __webpack_require__(/*! ../../interface */ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/interface.js");
class VerificationMode {
  constructor(times) {
    this.doTimes = times;
  }
  times(count) {
    (0, _interface.expect)(count).assertEqual(this.doTimes);
  }
  never() {
    console.log(this.doTimes);
    (0, _interface.expect)(0).assertEqual(this.doTimes);
  }
  once() {
    (0, _interface.expect)(1).assertEqual(this.doTimes);
  }
  atLeast(count) {
    if (count > this.doTimes) {
      throw Error('failed ' + count + ' greater than the actual execution times of method');
    }
  }
  atMost(count) {
    if (count < this.doTimes) {
      throw Error('failed ' + count + ' less than the actual execution times of method');
    }
  }
}
var _default = VerificationMode;
exports["default"] = _default;

function requireModule(moduleName) {
  const systemList = ['system.router', 'system.app', 'system.prompt', 'system.configuration',
  'system.image', 'system.device', 'system.mediaquery', 'ohos.animator', 'system.grid', 'system.resource']
  var target = ''
  if (systemList.includes(moduleName.replace('@', ''))) {
    target = $app_require$('@app-module/' + moduleName.substring(1));
    return target;
  }
  var shortName = moduleName.replace(/@[^.]+.([^.]+)/, '$1');
  target = requireNapi(shortName);
  if (typeof target !== 'undefined' && /@ohos/.test(moduleName)) {
    return target;
  }
  if (typeof ohosplugin !== 'undefined' && /@ohos/.test(moduleName)) {
    target = ohosplugin;
    for (let key of shortName.split('.')) {
      target = target[key];
      if(!target) {
        break;
      }
    }
    if (typeof target !== 'undefined') {
      return target;
    }
  }
  if (typeof systemplugin !== 'undefined') {
    target = systemplugin;
    for (let key of shortName.split('.')) {
      target = target[key];
      if(!target) {
        break;
      }
    }
    if (typeof target !== 'undefined') {
      return target;
    }
  }
  return target;
}


/***/ }),

/***/ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/report/OhReport.js":
/*!*******************************************************************************************************************************************************************************!*\
  !*** ../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/report/OhReport.js ***!
  \*******************************************************************************************************************************************************************************/
/***/ ((__unused_webpack_module, exports, __webpack_require__) => {



var _interopRequireDefault = __webpack_require__(/*! @babel/runtime/helpers/interopRequireDefault */ "./node_modules/@babel/runtime/helpers/interopRequireDefault.js");
Object.defineProperty(exports, "__esModule", ({
  value: true
}));
exports["default"] = void 0;
var _SysTestKit = _interopRequireDefault(__webpack_require__(/*! ../kit/SysTestKit */ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/kit/SysTestKit.js"));
var _coverageCollect = __webpack_require__(/*! ../coverage/coverageCollect */ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/coverage/coverageCollect.js");
class OhReport {
  constructor(attr) {
    this.delegator = attr.delegator;
    this.abilityDelegatorArguments = attr.abilityDelegatorArguments;
    this.id = 'report';
    this.index = 0;
    this.duration = 0;
  }
  init(coreContext) {
    this.coreContext = coreContext;
    this.suiteService = this.coreContext.getDefaultService('suite');
    this.specService = this.coreContext.getDefaultService('spec');
  }
  taskStart() {}
  async taskDone() {
    if (this.abilityDelegatorArguments !== null) {
      this.taskDoneTime = new Date().getTime();
      let summary = this.suiteService.getSummary();
      const configService = this.coreContext.getDefaultService('config');
      if (configService['coverage'] === 'true') {
        await (0, _coverageCollect.collectCoverageData)();
      }
      let message = '\n' + 'OHOS_REPORT_RESULT: stream=Tests run: ' + summary.total + ', Failure: ' + summary.failure;
      message += ', Error: ' + summary.error;
      message += ', Pass: ' + summary.pass;
      message += ', Ignore: ' + summary.ignore;
      message += '\n' + 'OHOS_REPORT_CODE: ' + (summary.failure > 0 ? -1 : 0) + '\n';
      let isHasError = summary.failure > 0 || summary.error > 0;
      let config = this.coreContext.getDefaultService('config');
      if (config.isBreakOnError() && isHasError) {
        message += '\n' + 'OHOS_REPORT_RESULT: breakOnError model, Stopping whole test suite if one specific test case failed or error' + '\n';
      }
      message += 'OHOS_REPORT_STATUS: taskconsuming=' + summary.duration + '\n';
      console.info(message);
      await _SysTestKit.default.print(message);
    }
    console.info('report print success');
    this.delegator.finishTest('your test finished!!!', 0, () => {});
  }
  incorrectFormat() {
    if (this.coreContext.getDefaultService('config').filterValid.length !== 0) {
      var value = this.coreContext.getDefaultService('config').filterValid;
      var message = 'this param ' + value.join(',') + ' is invalid' + '\n';
      this.delegator.finishTest(message, 0, () => {});
    }
  }
  async suiteStart() {
    if (this.abilityDelegatorArguments !== null) {
      let message = '\n' + 'OHOS_REPORT_SUM: ' + this.suiteService.getCurrentRunningSuite().getSpecsNum();
      message += '\n' + 'OHOS_REPORT_STATUS: class=' + this.suiteService.getCurrentRunningSuite().description + '\n';
      console.info(message);
      await _SysTestKit.default.print(message);
      console.info(this.suiteService.getCurrentRunningSuite().description + ' suiteStart print success');
    }
  }
  async suiteDone() {
    if (this.abilityDelegatorArguments !== null) {
      let message = '\n' + 'OHOS_REPORT_STATUS: class=' + this.suiteService.getCurrentRunningSuite().description;
      message += '\n' + 'OHOS_REPORT_STATUS: suiteconsuming=' + this.suiteService.getCurrentRunningSuite().duration + '\n';
      console.info(message);
      await _SysTestKit.default.print(message);
      console.info(this.suiteService.getCurrentRunningSuite().description + ' suiteDone print success');
    }
  }
  async specStart() {
    if (this.abilityDelegatorArguments !== null) {
      let message = '\n' + 'OHOS_REPORT_STATUS: class=' + this.suiteService.getCurrentRunningSuite().description;
      message += '\n' + 'OHOS_REPORT_STATUS: current=' + ++this.index;
      message += '\n' + 'OHOS_REPORT_STATUS: id=JS';
      message += '\n' + 'OHOS_REPORT_STATUS: numtests=' + this.specService.getTestTotal();
      message += '\n' + 'OHOS_REPORT_STATUS: stream=';
      message += '\n' + 'OHOS_REPORT_STATUS: test=' + this.specService.currentRunningSpec.description;
      message += '\n' + 'OHOS_REPORT_STATUS_CODE: 1' + '\n';
      console.info(message);
      await _SysTestKit.default.print(message);
      console.info(this.specService.currentRunningSpec.description + ' specStart start print success');
    }
  }
  async specDone() {
    if (this.abilityDelegatorArguments !== null) {
      let message = '\n' + 'OHOS_REPORT_STATUS: class=' + this.suiteService.getCurrentRunningSuite().description;
      message += '\n' + 'OHOS_REPORT_STATUS: current=' + this.index;
      message += '\n' + 'OHOS_REPORT_STATUS: id=JS';
      message += '\n' + 'OHOS_REPORT_STATUS: numtests=' + this.specService.getTestTotal();
      let errorMsg = '';
      if (this.specService.currentRunningSpec.error) {
        message += '\n' + 'OHOS_REPORT_STATUS: stack=' + this.specService.currentRunningSpec.error.message;
        message += '\n' + 'OHOS_REPORT_STATUS: stream=';
        message += '\n' + 'Error in ' + this.specService.currentRunningSpec.description;
        message += '\n' + this.specService.currentRunningSpec.error.message;
        message += '\n' + 'OHOS_REPORT_STATUS: test=' + this.specService.currentRunningSpec.description;
        message += '\n' + 'OHOS_REPORT_STATUS_CODE: -1' + '\n';
      } else if (this.specService.currentRunningSpec.result) {
        if (this.specService.currentRunningSpec.result.failExpects.length > 0) {
          this.specService.currentRunningSpec.result.failExpects.forEach(failExpect => {
            errorMsg = failExpect.message || 'expect ' + failExpect.actualValue + ' ' + failExpect.checkFunc + ' ' + failExpect.expectValue;
          });
          message += '\n' + 'OHOS_REPORT_STATUS: stack=' + errorMsg;
          message += '\n' + 'OHOS_REPORT_STATUS: stream=';
          message += '\n' + 'Error in ' + this.specService.currentRunningSpec.description;
          message += '\n' + errorMsg + '\n' + 'OHOS_REPORT_STATUS: test=' + this.specService.currentRunningSpec.description;
          message += '\n' + 'OHOS_REPORT_STATUS_CODE: -2' + '\n';
        } else {
          message += '\n' + 'OHOS_REPORT_STATUS: stream=';
          message += '\n' + 'OHOS_REPORT_STATUS: test=' + this.specService.currentRunningSpec.description;
          message += '\n' + 'OHOS_REPORT_STATUS_CODE: 0' + '\n';
        }
      } else {
        message += '\n';
      }
      message += 'OHOS_REPORT_STATUS: consuming=' + this.specService.currentRunningSpec.duration + '\n';
      console.info(message);
      await _SysTestKit.default.print(message);
      console.info(this.specService.currentRunningSpec.description + ' specDone end print success');
    }
  }
}
var _default = OhReport;
exports["default"] = _default;

function requireModule(moduleName) {
  const systemList = ['system.router', 'system.app', 'system.prompt', 'system.configuration',
  'system.image', 'system.device', 'system.mediaquery', 'ohos.animator', 'system.grid', 'system.resource']
  var target = ''
  if (systemList.includes(moduleName.replace('@', ''))) {
    target = $app_require$('@app-module/' + moduleName.substring(1));
    return target;
  }
  var shortName = moduleName.replace(/@[^.]+.([^.]+)/, '$1');
  target = requireNapi(shortName);
  if (typeof target !== 'undefined' && /@ohos/.test(moduleName)) {
    return target;
  }
  if (typeof ohosplugin !== 'undefined' && /@ohos/.test(moduleName)) {
    target = ohosplugin;
    for (let key of shortName.split('.')) {
      target = target[key];
      if(!target) {
        break;
      }
    }
    if (typeof target !== 'undefined') {
      return target;
    }
  }
  if (typeof systemplugin !== 'undefined') {
    target = systemplugin;
    for (let key of shortName.split('.')) {
      target = target[key];
      if(!target) {
        break;
      }
    }
    if (typeof target !== 'undefined') {
      return target;
    }
  }
  return target;
}


/***/ }),

/***/ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/service.js":
/*!****************************************************************************************************************************************************************!*\
  !*** ../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/service.js ***!
  \****************************************************************************************************************************************************************/
/***/ ((__unused_webpack_module, exports, __webpack_require__) => {



var _interopRequireDefault = __webpack_require__(/*! @babel/runtime/helpers/interopRequireDefault */ "./node_modules/@babel/runtime/helpers/interopRequireDefault.js");
Object.defineProperty(exports, "__esModule", ({
  value: true
}));
exports.SuiteService = exports.SpecService = exports.ReportService = exports.ExpectService = void 0;
var _SysTestKit = _interopRequireDefault(__webpack_require__(/*! ./module/kit/SysTestKit */ "../../../../../../../../../3_new_plat/storage/storagesecuritylabeljstest/oh_modules/.ohpm/@ohos+hypium@1.0.6/oh_modules/@ohos/hypium/src/main/module/kit/SysTestKit.js"));
class AssertException extends Error {
  constructor(message) {
    super();
    this.name = "AssertException";
    this.message = message;
  }
}
function getFuncWithArgsZero(func, timeout, isStressTest) {
  return new Promise(async (resolve, reject) => {
    let timer = null;
    if (!isStressTest) {
      timer = setTimeout(() => {
        reject(new Error('execute timeout ' + timeout + 'ms'));
      }, timeout);
    }
    try {
      await func();
    } catch (err) {
      reject(err);
    }
    timer !== null ? clearTimeout(timer) : null;
    resolve();
  });
}
function getFuncWithArgsOne(func, timeout, isStressTest) {
  return new Promise(async (resolve, reject) => {
    let timer = null;
    if (!isStressTest) {
      timer = setTimeout(() => {
        reject(new Error('execute timeout ' + timeout + 'ms'));
      }, timeout);
      ;
    }
    function done() {
      timer !== null ? clearTimeout(timer) : null;
      resolve();
    }
    try {
      await func(done);
    } catch (err) {
      timer !== null ? clearTimeout(timer) : null;
      reject(err);
    }
  });
}
function getFuncWithArgsTwo(func, timeout, paramItem, isStressTest) {
  return new Promise(async (resolve, reject) => {
    let timer = null;
    if (!isStressTest) {
      timer = setTimeout(() => {
        reject(new Error('execute timeout ' + timeout + 'ms'));
      }, timeout);
    }
    function done() {
      timer !== null ? clearTimeout(timer) : null;
      resolve();
    }
    try {
      await func(done, paramItem);
    } catch (err) {
      timer !== null ? clearTimeout(timer) : null;
      reject(err);
    }
  });
}
function processFunc(coreContext, func) {
  let argNames = ((func || '').toString().replace(/((\/\/.*$)|(\/\*[\s\S]*?\*\/))/mg, '').match(/^(function)?\s*[^\(]*\(\s*([^\)]*)\)/m) || ['', '', ''])[2].split(',').map(item => item.replace(/^\s*(_?)(.+?)\1\s*$/, name => name.split('=')[0].trim())).filter(String);
  let funcLen = func.length;
  let processedFunc;
  const config = coreContext.getDefaultService('config');
  config.setSupportAsync(true);
  const timeout = +(config.timeout === undefined ? 5000 : config.timeout);
  const isStressTest = coreContext.getServices('dataDriver') !== undefined || config.getStress() > 1;
  switch (funcLen) {
    case 0:
      {
        processedFunc = function () {
          return getFuncWithArgsZero(func, timeout, isStressTest);
        };
        break;
      }
    case 1:
      {
        if (argNames[0] === 'data') {
          processedFunc = function (paramItem) {
            func(paramItem);
          };
        } else {
          processedFunc = function () {
            return getFuncWithArgsOne(func, timeout, isStressTest);
          };
        }
        break;
      }
    default:
      {
        processedFunc = function (paramItem) {
          return getFuncWithArgsTwo(func, timeout, paramItem, isStressTest);
        };
        break;
      }
  }
  return processedFunc;
}
function secureRandomNumber() {
  return crypto.randomBytes(8).readUInt32LE() / 0xffffffff;
}
class SuiteService {
  constructor(attr) {
    this.id = attr.id;
    this.rootSuite = new SuiteService.Suite({});
    this.currentRunningSuite = this.rootSuite;
    this.suitesStack = [this.rootSuite];
  }
  describe(desc, func) {
    const configService = this.coreContext.getDefaultService('config');
    if (configService.filterSuite(desc)) {
      console.info('filter suite :' + desc);
      return;
    }
    const suite = new SuiteService.Suite({
      description: desc
    });
    if (typeof this.coreContext.getServices('dataDriver') !== 'undefined' && configService['dryRun'] !== 'true') {
      let suiteStress = this.coreContext.getServices('dataDriver').dataDriver.getSuiteStress(desc);
      for (let i = 1; i < suiteStress; i++) {
        this.currentRunningSuite.childSuites.push(suite);
      }
    }
    this.currentRunningSuite.childSuites.push(suite);
    this.currentRunningSuite = suite;
    this.suitesStack.push(suite);
    func.call();
    let childSuite = this.suitesStack.pop();
    if (this.suitesStack.length === 0) {
      this.currentRunningSuite = childSuite;
      this.suitesStack.push(childSuite);
    }
    if (this.suitesStack.length > 1) {
      this.currentRunningSuite = this.suitesStack.pop();
    } else {
      this.currentRunningSuite = this.suitesStack.pop();
      this.suitesStack.push(this.currentRunningSuite);
    }
  }
  beforeAll(func) {
    this.currentRunningSuite.beforeAll.push(processFunc(this.coreContext, func));
  }
  beforeEach(func) {
    this.currentRunningSuite.beforeEach.push(processFunc(this.coreContext, func));
  }
  afterAll(func) {
    this.currentRunningSuite.afterAll.push(processFunc(this.coreContext, func));
  }
  afterEach(func) {
    this.currentRunningSuite.afterEach.push(processFunc(this.coreContext, func));
  }
  getCurrentRunningSuite() {
    return this.currentRunningSuite;
  }
  setCurrentRunningSuite(suite) {
    this.currentRunningSuite = suite;
  }
  traversalResults(suite, obj, breakOnError) {
    if (suite.childSuites.length === 0 && suite.specs.length === 0) {
      return obj;
    }
    if (suite.specs.length > 0) {
      for (const itItem of suite.specs) {
        obj.total++;
        if (breakOnError && (obj.error > 0 || obj.failure > 0)) {
          continue;
        }
        if (itItem.error) {
          obj.error++;
        } else if (itItem.result.failExpects.length > 0) {
          obj.failure++;
        } else if (itItem.result.pass === true) {
          obj.pass++;
        }
      }
    }
    obj.duration += suite.duration;
    if (suite.childSuites.length > 0) {
      for (const suiteItem of suite.childSuites) {
        this.traversalResults(suiteItem, obj, breakOnError);
      }
    }
  }
  getSummary() {
    let suiteService = this.coreContext.getDefaultService('suite');
    let rootSuite = suiteService.rootSuite;
    const specService = this.coreContext.getDefaultService('spec');
    const configService = this.coreContext.getDefaultService('config');
    let breakOnError = configService.isBreakOnError();
    let isError = specService.getStatus();
    let isBreaKOnError = breakOnError && isError;
    let obj = {
      total: 0,
      failure: 0,
      error: 0,
      pass: 0,
      ignore: 0,
      duration: 0
    };
    for (const suiteItem of rootSuite.childSuites) {
      this.traversalResults(suiteItem, obj, isBreaKOnError);
    }
    obj.ignore = obj.total - obj.pass - obj.failure - obj.error;
    return obj;
  }
  init(coreContext) {
    this.coreContext = coreContext;
  }
  traversalSuites(suite, obj, configService) {
    if (suite.childSuites.length === 0 && suite.specs.length === 0) {
      return [];
    }
    if (suite.specs.length > 0) {
      let itArray = [];
      for (const itItem of suite['specs']) {
        if (!configService.filterDesc(suite.description, itItem.description, itItem.fi, null)) {
          itArray.push({
            'itName': itItem.description
          });
        }
      }
      obj[suite.description] = itArray;
    }
    if (suite.childSuites.length > 0) {
      let suiteArray = [];
      for (const suiteItem of suite.childSuites) {
        let suiteObj = {};
        this.traversalSuites(suiteItem, suiteObj, configService);
        if (!configService.filterSuite(suiteItem.description)) {
          suiteArray.push(suiteObj);
        }
      }
      obj.suites = suiteArray;
    }
  }
  async dryRun(abilityDelegator) {
    const configService = this.coreContext.getDefaultService('config');
    let testSuitesObj = {};
    let suitesArray = [];
    for (const suiteItem of this.rootSuite.childSuites) {
      let obj = {};
      this.traversalSuites(suiteItem, obj, configService);
      if (!configService.filterSuite(suiteItem.description)) {
        suitesArray.push(obj);
      }
    }
    testSuitesObj['suites'] = suitesArray;
    let strJson = JSON.stringify(testSuitesObj);
    let strLen = strJson.length;
    let maxLen = 500;
    let maxCount = Math.floor(strLen / maxLen);
    for (let count = 0; count <= maxCount; count++) {
      await _SysTestKit.default.print(strJson.substring(count * maxLen, (count + 1) * maxLen));
    }
    console.info('dryRun print success');
    abilityDelegator.finishTest('dry run finished!!!', 0, () => {});
  }
  execute() {
    const configService = this.coreContext.getDefaultService('config');
    if (configService.filterValid.length !== 0) {
      this.coreContext.fireEvents('task', 'incorrectFormat');
      return;
    }
    if (configService.isRandom() && this.rootSuite.childSuites.length > 0) {
      this.rootSuite.childSuites.sort(function () {
        return Math.random().toFixed(1) > 0.5 ? -1 : 1;
      });
      this.currentRunningSuite = this.rootSuite.childSuites[0];
    }
    if (configService.isSupportAsync()) {
      let asyncExecute = async () => {
        await this.coreContext.fireEvents('task', 'taskStart');
        await this.rootSuite.asyncRun(this.coreContext);
      };
      asyncExecute().then(async () => {
        await this.coreContext.fireEvents('task', 'taskDone');
      });
    } else {
      this.coreContext.fireEvents('task', 'taskStart');
      this.rootSuite.run(this.coreContext);
      this.coreContext.fireEvents('task', 'taskDone');
    }
  }
  apis() {
    const _this = this;
    return {
      describe: function (desc, func) {
        return _this.describe(desc, func);
      },
      beforeAll: function (func) {
        return _this.beforeAll(func);
      },
      beforeEach: function (func) {
        return _this.beforeEach(func);
      },
      afterAll: function (func) {
        return _this.afterAll(func);
      },
      afterEach: function (func) {
        return _this.afterEach(func);
      }
    };
  }
}
exports.SuiteService = SuiteService;
SuiteService.Suite = class {
  constructor(attrs) {
    this.description = attrs.description || '';
    this.childSuites = [];
    this.specs = [];
    this.beforeAll = [];
    this.afterAll = [];
    this.beforeEach = [];
    this.afterEach = [];
    this.duration = 0;
  }
  pushSpec(spec) {
    this.specs.push(spec);
  }
  removeSpec(desc) {
    this.specs = this.specs.filter((item, index) => {
      return item.description !== desc;
    });
  }
  getSpecsNum() {
    return this.specs.length;
  }
  isRun(coreContext) {
    const configService = coreContext.getDefaultService('config');
    const suiteService = coreContext.getDefaultService('suite');
    const specService = coreContext.getDefaultService('spec');
    let breakOnError = configService.isBreakOnError();
    let isError = specService.getStatus();
    return breakOnError && isError;
  }
  run(coreContext) {
    const suiteService = coreContext.getDefaultService('suite');
    suiteService.setCurrentRunningSuite(this);
    if (this.description !== '') {
      coreContext.fireEvents('suite', 'suiteStart', this);
    }
    this.runHookFunc('beforeAll');
    if (this.specs.length > 0) {
      const configService = coreContext.getDefaultService('config');
      if (configService.isRandom()) {
        this.specs.sort(function () {
          return Math.random().toFixed(1) > 0.5 ? -1 : 1;
        });
      }
      for (let spec in this.specs) {
        let isBreakOnError = this.isRun(coreContext);
        if (isBreakOnError) {
          break;
        }
        this.runHookFunc('beforeEach');
        spec.run(coreContext);
        this.runHookFunc('afterEach');
      }
    }
    if (this.childSuites.length > 0) {
      for (let suite in this.childSuites) {
        let isBreakOnError = this.isRun(coreContext);
        if (isBreakOnError) {
          break;
        }
        suite.run(coreContext);
        suiteService.setCurrentRunningSuite(suite);
      }
    }
    this.runHookFunc('afterAll');
    if (this.description !== '') {
      coreContext.fireEvents('suite', 'suiteDone');
    }
  }
  async asyncRun(coreContext) {
    const suiteService = coreContext.getDefaultService('suite');
    suiteService.setCurrentRunningSuite(this);
    suiteService.suitesStack.push(this);
    if (this.description !== '') {
      await coreContext.fireEvents('suite', 'suiteStart', this);
    }
    await this.runAsyncHookFunc('beforeAll');
    if (this.specs.length > 0) {
      const configService = coreContext.getDefaultService('config');
      if (configService.isRandom()) {
        this.specs.sort(function () {
          return Math.random().toFixed(1) > 0.5 ? -1 : 1;
        });
      }
      for (let i = 0; i < this.specs.length; i++) {
        let isBreakOnError = this.isRun(coreContext);
        if (isBreakOnError) {
          console.log("break description :" + this.description);
          break;
        }
        await this.runAsyncHookFunc('beforeEach');
        await this.specs[i].asyncRun(coreContext);
        await this.runAsyncHookFunc('afterEach');
      }
    }
    if (this.childSuites.length > 0) {
      for (let i = 0; i < this.childSuites.length; i++) {
        let isBreakOnError = this.isRun(coreContext);
        if (isBreakOnError) {
          console.log("break description :" + this.description);
          break;
        }
        await this.childSuites[i].asyncRun(coreContext);
      }
    }
    await this.runAsyncHookFunc('afterAll');
    if (this.description !== '') {
      await coreContext.fireEvents('suite', 'suiteDone');
      let childSuite = suiteService.suitesStack.pop();
      if (suiteService.suitesStack.length === 0) {
        suiteService.suitesStack.push(childSuite);
      }
      if (suiteService.suitesStack.length > 1) {
        suiteService.setCurrentRunningSuite(suiteService.suitesStack.pop());
      } else {
        let currentRunningSuite = suiteService.suitesStack.pop();
        suiteService.setCurrentRunningSuite(currentRunningSuite);
        suiteService.suitesStack.push(currentRunningSuite);
      }
    }
  }
  runHookFunc(hookName) {
    if (this[hookName] && this[hookName].length > 0) {
      this[hookName].forEach(func => {
        try {
          func();
        } catch (e) {
          console.error(e);
        }
      });
    }
  }
  runAsyncHookFunc(hookName) {
    if (this[hookName] && this[hookName].length > 0) {
      return new Promise(async resolve => {
        for (let i = 0; i < this[hookName].length; i++) {
          try {
            await this[hookName][i]();
          } catch (e) {
            console.error(e);
          }
        }
        resolve();
      });
    }
  }
};
class SpecService {
  constructor(attr) {
    this.id = attr.id;
    this.totalTest = 0;
    this.hasError = false;
  }
  init(coreContext) {
    this.coreContext = coreContext;
  }
  setCurrentRunningSpec(spec) {
    this.currentRunningSpec = spec;
  }
  setStatus(obj) {
    this.hasError = obj;
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
  it(desc, filter, func) {
    const configService = this.coreContext.getDefaultService('config');
    const currentSuiteName = this.coreContext.getDefaultService('suite').getCurrentRunningSuite().description;
    if (configService.filterDesc(currentSuiteName, desc, filter, this.coreContext)) {
      console.info('filter it :' + desc);
    } else {
      let processedFunc = processFunc(this.coreContext, func);
      const spec = new SpecService.Spec({
        description: desc,
        fi: filter,
        fn: processedFunc
      });
      const suiteService = this.coreContext.getDefaultService('suite');
      if (typeof this.coreContext.getServices('dataDriver') !== 'undefined' && configService['dryRun'] !== 'true') {
        let specStress = this.coreContext.getServices('dataDriver').dataDriver.getSpecStress(desc);
        for (let i = 1; i < specStress; i++) {
          this.totalTest++;
          suiteService.getCurrentRunningSuite().pushSpec(spec);
        }
      }
      if (configService['dryRun'] !== 'true') {
        let stress = configService.getStress();
        console.info('stress length :' + stress);
        for (let i = 1; i < stress; i++) {
          this.totalTest++;
          suiteService.getCurrentRunningSuite().pushSpec(spec);
        }
      }
      this.totalTest++;
      suiteService.getCurrentRunningSuite().pushSpec(spec);
    }
  }
  apis() {
    const _this = this;
    return {
      it: function (desc, filter, func) {
        return _this.it(desc, filter, func);
      }
    };
  }
}
exports.SpecService = SpecService;
SpecService.Spec = class {
  constructor(attrs) {
    this.description = attrs.description || '';
    this.fi = attrs.fi;
    this.fn = attrs.fn || function () {};
    this.result = {
      failExpects: [],
      passExpects: []
    };
    this.error = undefined;
    this.duration = 0;
    this.startTime = 0;
    this.isExecuted = false;
  }
  setResult(coreContext) {
    const specService = coreContext.getDefaultService('spec');
    if (this.result.failExpects.length > 0) {
      this.result.pass = false;
      specService.setStatus(true);
    } else {
      this.result.pass = true;
    }
    console.info('testcase ' + this.description + ' result:' + this.result.pass);
  }
  run(coreContext) {
    const specService = coreContext.getDefaultService('spec');
    specService.setCurrentRunningSpec(this);
    coreContext.fireEvents('spec', 'specStart', this);
    this.isExecuted = true;
    try {
      let dataDriver = coreContext.getServices('dataDriver');
      if (typeof dataDriver === 'undefined') {
        this.fn();
      } else {
        let suiteParams = dataDriver.dataDriver.getSuiteParams();
        let specParams = dataDriver.dataDriver.getSpecParams();
        console.info('[suite params] ' + JSON.stringify(suiteParams));
        console.info('[spec params] ' + JSON.stringify(specParams));
        if (this.fn.length === 0) {
          this.fn();
        } else if (specParams.length === 0) {
          this.fn(suiteParams);
        } else {
          specParams.forEach(paramItem => this.fn(Object.assign({}, paramItem, suiteParams)));
        }
      }
      this.setResult(coreContext);
    } catch (e) {
      this.error = e;
      specService.setStatus(true);
    }
    coreContext.fireEvents('spec', 'specDone', this);
  }
  async asyncRun(coreContext) {
    const specService = coreContext.getDefaultService('spec');
    specService.setCurrentRunningSpec(this);
    await coreContext.fireEvents('spec', 'specStart', this);
    try {
      let dataDriver = coreContext.getServices('dataDriver');
      if (typeof dataDriver === 'undefined') {
        await this.fn();
        this.setResult(coreContext);
      } else {
        let suiteParams = dataDriver.dataDriver.getSuiteParams();
        let specParams = dataDriver.dataDriver.getSpecParams();
        console.info('[suite params] ' + JSON.stringify(suiteParams));
        console.info('[spec params] ' + JSON.stringify(specParams));
        if (this.fn.length === 0) {
          await this.fn();
          this.setResult(coreContext);
        } else if (specParams.length === 0) {
          await this.fn(suiteParams);
          this.setResult(coreContext);
        } else {
          for (const paramItem of specParams) {
            await this.fn(Object.assign({}, paramItem, suiteParams));
            this.setResult(coreContext);
          }
        }
      }
    } catch (e) {
      if (e instanceof AssertException) {
        this.fail = e;
        specService.setStatus(true);
      } else {
        this.error = e;
        specService.setStatus(true);
      }
    }
    this.isExecuted = true;
    await coreContext.fireEvents('spec', 'specDone', this);
  }
  filterCheck(coreContext) {
    const specService = coreContext.getDefaultService('spec');
    specService.setCurrentRunningSpec(this);
    return true;
  }
  addExpectationResult(expectResult) {
    if (this.result.failExpects.length === 0) {
      this.result.failExpects.push(expectResult);
    }
    throw new AssertException(expectResult.message);
  }
};
class ExpectService {
  constructor(attr) {
    this.id = attr.id;
    this.matchers = {};
  }
  expect(actualValue) {
    return this.wrapMatchers(actualValue);
  }
  init(coreContext) {
    this.coreContext = coreContext;
    this.addMatchers(this.basicMatchers());
  }
  addMatchers(matchers) {
    for (const matcherName in matchers) {
      if (Object.prototype.hasOwnProperty.call(matchers, matcherName)) {
        this.matchers[matcherName] = matchers[matcherName];
      }
    }
  }
  basicMatchers() {
    return {
      assertTrue: function (actualValue) {
        return {
          pass: actualValue === true,
          message: 'expect true, actualValue is ' + actualValue
        };
      },
      assertEqual: function (actualValue, args) {
        return {
          pass: actualValue === args[0],
          expectValue: args[0],
          message: 'expect ' + actualValue + ' equals ' + args[0]
        };
      },
      assertThrow: function (actual, args) {
        const result = {
          pass: false
        };
        if (typeof actual !== 'function') {
          result.message = 'toThrow\'s Actual should be a Function';
        } else {
          let hasThrow = false;
          let throwError;
          try {
            actual();
          } catch (e) {
            hasThrow = true;
            throwError = e;
          }
          if (!hasThrow) {
            result.message = 'function did not throw an exception';
          } else if (throwError && throwError.message === args[0]) {
            result.pass = true;
          } else {
            result.message = `expect to throw ${args[0]} , actual throw ${throwError.message}`;
          }
        }
        return result;
      }
    };
  }
  wrapMatchers(actualValue) {
    const _this = this;
    const wrappedMatchers = {
      isNot: false,
      not: function () {
        this.isNot = true;
        return this;
      }
    };
    const specService = _this.coreContext.getDefaultService('spec');
    const currentRunningSpec = specService.getCurrentRunningSpec();
    for (const matcherName in this.matchers) {
      let result = Object.prototype.hasOwnProperty.call(this.matchers, matcherName);
      if (!result) {
        continue;
      }
      if (matcherName.search('assertPromise') == 0) {
        wrappedMatchers[matcherName] = async function () {
          await _this.matchers[matcherName](actualValue, arguments).then(function (result) {
            if (wrappedMatchers.isNot) {
              result.pass = !result.pass;
            }
            result.actualValue = actualValue;
            result.checkFunc = matcherName;
            if (!result.pass) {
              currentRunningSpec.addExpectationResult(result);
            }
          });
        };
      } else {
        wrappedMatchers[matcherName] = function () {
          const result = _this.matchers[matcherName](actualValue, arguments);
          if (wrappedMatchers.isNot) {
            result.pass = !result.pass;
          }
          result.actualValue = actualValue;
          result.checkFunc = matcherName;
          if (!result.pass) {
            currentRunningSpec.addExpectationResult(result);
          }
        };
      }
    }
    return wrappedMatchers;
  }
  apis() {
    const _this = this;
    return {
      expect: function (actualValue) {
        return _this.expect(actualValue);
      }
    };
  }
}
exports.ExpectService = ExpectService;
class ReportService {
  constructor(attr) {
    this.id = attr.id;
  }
  init(coreContext) {
    this.coreContext = coreContext;
    this.specService = this.coreContext.getDefaultService('spec');
    this.suiteService = this.coreContext.getDefaultService('suite');
    this.duration = 0;
  }
  taskStart() {
    console.info('[start] start run suites');
  }
  async suiteStart() {
    console.info('[suite start]' + this.suiteService.getCurrentRunningSuite().description);
  }
  async specStart() {
    console.info('start running case \'' + this.specService.currentRunningSpec.description + '\'');
    this.index = this.index + 1;
    let spec = this.specService.currentRunningSpec;
    spec.startTime = await _SysTestKit.default.getRealTime();
  }
  async specDone() {
    let msg = '';
    let spec = this.specService.currentRunningSpec;
    let suite = this.suiteService.currentRunningSuite;
    spec.duration = (await _SysTestKit.default.getRealTime()) - spec.startTime;
    suite.duration += spec.duration;
    if (spec.error) {
      this.formatPrint('error', spec.description + ' ; consuming ' + spec.duration + 'ms');
      this.formatPrint('errorDetail', spec.error);
    } else if (spec.result) {
      if (spec.result.failExpects.length > 0) {
        this.formatPrint('fail', spec.description + ' ; consuming ' + spec.duration + 'ms');
        spec.result.failExpects.forEach(failExpect => {
          msg = failExpect.message || 'expect ' + failExpect.actualValue + ' ' + failExpect.checkFunc + ' ' + failExpect.expectValue;
          this.formatPrint('failDetail', msg);
        });
      } else {
        this.formatPrint('pass', spec.description + ' ; consuming ' + spec.duration + 'ms');
      }
    }
    this.formatPrint(this.specService.currentRunningSpec.error, msg);
  }
  suiteDone() {
    let suite = this.suiteService.currentRunningSuite;
    console.info(`[suite end] ${suite.description} consuming ${suite.duration} ms`);
  }
  taskDone() {
    let msg = '';
    let summary = this.suiteService.getSummary();
    msg = 'total cases:' + summary.total + ';failure ' + summary.failure + ',' + 'error ' + summary.error;
    msg += ',pass ' + summary.pass + '; consuming ' + summary.duration + 'ms';
    console.info(msg);
    console.info('[end] run suites end');
  }
  incorrectFormat() {
    if (this.coreContext.getDefaultService('config').filterValid.length !== 0) {
      this.coreContext.getDefaultService('config').filterValid.forEach(function (item) {
        console.info('this param ' + item + ' is invalid');
      });
    }
  }
  formatPrint(type, msg) {
    switch (type) {
      case 'pass':
        console.info('[pass]' + msg);
        break;
      case 'fail':
        console.info('[fail]' + msg);
        break;
      case 'failDetail':
        console.info('[failDetail]' + msg);
        break;
      case 'error':
        console.info('[error]' + msg);
        break;
      case 'errorDetail':
        console.info('[errorDetail]' + msg);
        break;
    }
  }
  sleep(numberMillis) {
    var now = new Date();
    var exitTime = now.getTime() + numberMillis;
    while (true) {
      now = new Date();
      if (now.getTime() > exitTime) {
        return;
      }
    }
  }
}
exports.ReportService = ReportService;

function requireModule(moduleName) {
  const systemList = ['system.router', 'system.app', 'system.prompt', 'system.configuration',
  'system.image', 'system.device', 'system.mediaquery', 'ohos.animator', 'system.grid', 'system.resource']
  var target = ''
  if (systemList.includes(moduleName.replace('@', ''))) {
    target = $app_require$('@app-module/' + moduleName.substring(1));
    return target;
  }
  var shortName = moduleName.replace(/@[^.]+.([^.]+)/, '$1');
  target = requireNapi(shortName);
  if (typeof target !== 'undefined' && /@ohos/.test(moduleName)) {
    return target;
  }
  if (typeof ohosplugin !== 'undefined' && /@ohos/.test(moduleName)) {
    target = ohosplugin;
    for (let key of shortName.split('.')) {
      target = target[key];
      if(!target) {
        break;
      }
    }
    if (typeof target !== 'undefined') {
      return target;
    }
  }
  if (typeof systemplugin !== 'undefined') {
    target = systemplugin;
    for (let key of shortName.split('.')) {
      target = target[key];
      if(!target) {
        break;
      }
    }
    if (typeof target !== 'undefined') {
      return target;
    }
  }
  return target;
}


/***/ }),

/***/ "./node_modules/@babel/runtime/helpers/defineProperty.js":
/*!***************************************************************!*\
  !*** ./node_modules/@babel/runtime/helpers/defineProperty.js ***!
  \***************************************************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {



var toPropertyKey = __webpack_require__(/*! ./toPropertyKey.js */ "./node_modules/@babel/runtime/helpers/toPropertyKey.js");
function _defineProperty(obj, key, value) {
  key = toPropertyKey(key);
  if (key in obj) {
    Object.defineProperty(obj, key, {
      value: value,
      enumerable: true,
      configurable: true,
      writable: true
    });
  } else {
    obj[key] = value;
  }
  return obj;
}
module.exports = _defineProperty, module.exports.__esModule = true, module.exports["default"] = module.exports;

function requireModule(moduleName) {
  const systemList = ['system.router', 'system.app', 'system.prompt', 'system.configuration',
  'system.image', 'system.device', 'system.mediaquery', 'ohos.animator', 'system.grid', 'system.resource']
  var target = ''
  if (systemList.includes(moduleName.replace('@', ''))) {
    target = $app_require$('@app-module/' + moduleName.substring(1));
    return target;
  }
  var shortName = moduleName.replace(/@[^.]+.([^.]+)/, '$1');
  target = requireNapi(shortName);
  if (typeof target !== 'undefined' && /@ohos/.test(moduleName)) {
    return target;
  }
  if (typeof ohosplugin !== 'undefined' && /@ohos/.test(moduleName)) {
    target = ohosplugin;
    for (let key of shortName.split('.')) {
      target = target[key];
      if(!target) {
        break;
      }
    }
    if (typeof target !== 'undefined') {
      return target;
    }
  }
  if (typeof systemplugin !== 'undefined') {
    target = systemplugin;
    for (let key of shortName.split('.')) {
      target = target[key];
      if(!target) {
        break;
      }
    }
    if (typeof target !== 'undefined') {
      return target;
    }
  }
  return target;
}


/***/ }),

/***/ "./node_modules/@babel/runtime/helpers/interopRequireDefault.js":
/*!**********************************************************************!*\
  !*** ./node_modules/@babel/runtime/helpers/interopRequireDefault.js ***!
  \**********************************************************************/
/***/ ((module) => {



function _interopRequireDefault(obj) {
  return obj && obj.__esModule ? obj : {
    "default": obj
  };
}
module.exports = _interopRequireDefault, module.exports.__esModule = true, module.exports["default"] = module.exports;

function requireModule(moduleName) {
  const systemList = ['system.router', 'system.app', 'system.prompt', 'system.configuration',
  'system.image', 'system.device', 'system.mediaquery', 'ohos.animator', 'system.grid', 'system.resource']
  var target = ''
  if (systemList.includes(moduleName.replace('@', ''))) {
    target = $app_require$('@app-module/' + moduleName.substring(1));
    return target;
  }
  var shortName = moduleName.replace(/@[^.]+.([^.]+)/, '$1');
  target = requireNapi(shortName);
  if (typeof target !== 'undefined' && /@ohos/.test(moduleName)) {
    return target;
  }
  if (typeof ohosplugin !== 'undefined' && /@ohos/.test(moduleName)) {
    target = ohosplugin;
    for (let key of shortName.split('.')) {
      target = target[key];
      if(!target) {
        break;
      }
    }
    if (typeof target !== 'undefined') {
      return target;
    }
  }
  if (typeof systemplugin !== 'undefined') {
    target = systemplugin;
    for (let key of shortName.split('.')) {
      target = target[key];
      if(!target) {
        break;
      }
    }
    if (typeof target !== 'undefined') {
      return target;
    }
  }
  return target;
}


/***/ }),

/***/ "./node_modules/@babel/runtime/helpers/toPrimitive.js":
/*!************************************************************!*\
  !*** ./node_modules/@babel/runtime/helpers/toPrimitive.js ***!
  \************************************************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {



var _typeof = (__webpack_require__(/*! ./typeof.js */ "./node_modules/@babel/runtime/helpers/typeof.js")["default"]);
function _toPrimitive(input, hint) {
  if (_typeof(input) !== "object" || input === null) return input;
  var prim = input[Symbol.toPrimitive];
  if (prim !== undefined) {
    var res = prim.call(input, hint || "default");
    if (_typeof(res) !== "object") return res;
    throw new TypeError("@@toPrimitive must return a primitive value.");
  }
  return (hint === "string" ? String : Number)(input);
}
module.exports = _toPrimitive, module.exports.__esModule = true, module.exports["default"] = module.exports;

function requireModule(moduleName) {
  const systemList = ['system.router', 'system.app', 'system.prompt', 'system.configuration',
  'system.image', 'system.device', 'system.mediaquery', 'ohos.animator', 'system.grid', 'system.resource']
  var target = ''
  if (systemList.includes(moduleName.replace('@', ''))) {
    target = $app_require$('@app-module/' + moduleName.substring(1));
    return target;
  }
  var shortName = moduleName.replace(/@[^.]+.([^.]+)/, '$1');
  target = requireNapi(shortName);
  if (typeof target !== 'undefined' && /@ohos/.test(moduleName)) {
    return target;
  }
  if (typeof ohosplugin !== 'undefined' && /@ohos/.test(moduleName)) {
    target = ohosplugin;
    for (let key of shortName.split('.')) {
      target = target[key];
      if(!target) {
        break;
      }
    }
    if (typeof target !== 'undefined') {
      return target;
    }
  }
  if (typeof systemplugin !== 'undefined') {
    target = systemplugin;
    for (let key of shortName.split('.')) {
      target = target[key];
      if(!target) {
        break;
      }
    }
    if (typeof target !== 'undefined') {
      return target;
    }
  }
  return target;
}


/***/ }),

/***/ "./node_modules/@babel/runtime/helpers/toPropertyKey.js":
/*!**************************************************************!*\
  !*** ./node_modules/@babel/runtime/helpers/toPropertyKey.js ***!
  \**************************************************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {



var _typeof = (__webpack_require__(/*! ./typeof.js */ "./node_modules/@babel/runtime/helpers/typeof.js")["default"]);
var toPrimitive = __webpack_require__(/*! ./toPrimitive.js */ "./node_modules/@babel/runtime/helpers/toPrimitive.js");
function _toPropertyKey(arg) {
  var key = toPrimitive(arg, "string");
  return _typeof(key) === "symbol" ? key : String(key);
}
module.exports = _toPropertyKey, module.exports.__esModule = true, module.exports["default"] = module.exports;

function requireModule(moduleName) {
  const systemList = ['system.router', 'system.app', 'system.prompt', 'system.configuration',
  'system.image', 'system.device', 'system.mediaquery', 'ohos.animator', 'system.grid', 'system.resource']
  var target = ''
  if (systemList.includes(moduleName.replace('@', ''))) {
    target = $app_require$('@app-module/' + moduleName.substring(1));
    return target;
  }
  var shortName = moduleName.replace(/@[^.]+.([^.]+)/, '$1');
  target = requireNapi(shortName);
  if (typeof target !== 'undefined' && /@ohos/.test(moduleName)) {
    return target;
  }
  if (typeof ohosplugin !== 'undefined' && /@ohos/.test(moduleName)) {
    target = ohosplugin;
    for (let key of shortName.split('.')) {
      target = target[key];
      if(!target) {
        break;
      }
    }
    if (typeof target !== 'undefined') {
      return target;
    }
  }
  if (typeof systemplugin !== 'undefined') {
    target = systemplugin;
    for (let key of shortName.split('.')) {
      target = target[key];
      if(!target) {
        break;
      }
    }
    if (typeof target !== 'undefined') {
      return target;
    }
  }
  return target;
}


/***/ }),

/***/ "./node_modules/@babel/runtime/helpers/typeof.js":
/*!*******************************************************!*\
  !*** ./node_modules/@babel/runtime/helpers/typeof.js ***!
  \*******************************************************/
/***/ ((module) => {



function _typeof(obj) {
  "@babel/helpers - typeof";

  return (module.exports = _typeof = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function (obj) {
    return typeof obj;
  } : function (obj) {
    return obj && "function" == typeof Symbol && obj.constructor === Symbol && obj !== Symbol.prototype ? "symbol" : typeof obj;
  }, module.exports.__esModule = true, module.exports["default"] = module.exports), _typeof(obj);
}
module.exports = _typeof, module.exports.__esModule = true, module.exports["default"] = module.exports;

function requireModule(moduleName) {
  const systemList = ['system.router', 'system.app', 'system.prompt', 'system.configuration',
  'system.image', 'system.device', 'system.mediaquery', 'ohos.animator', 'system.grid', 'system.resource']
  var target = ''
  if (systemList.includes(moduleName.replace('@', ''))) {
    target = $app_require$('@app-module/' + moduleName.substring(1));
    return target;
  }
  var shortName = moduleName.replace(/@[^.]+.([^.]+)/, '$1');
  target = requireNapi(shortName);
  if (typeof target !== 'undefined' && /@ohos/.test(moduleName)) {
    return target;
  }
  if (typeof ohosplugin !== 'undefined' && /@ohos/.test(moduleName)) {
    target = ohosplugin;
    for (let key of shortName.split('.')) {
      target = target[key];
      if(!target) {
        break;
      }
    }
    if (typeof target !== 'undefined') {
      return target;
    }
  }
  if (typeof systemplugin !== 'undefined') {
    target = systemplugin;
    for (let key of shortName.split('.')) {
      target = target[key];
      if(!target) {
        break;
      }
    }
    if (typeof target !== 'undefined') {
      return target;
    }
  }
  return target;
}


/***/ })

}]);
      globalThis["__common_module_cache___c68cb8cf9c98b4c0a62e46a1345884178ef4f7b1a57562f1384b7f1e069293c6"] = globalThis["__common_module_cache___c68cb8cf9c98b4c0a62e46a1345884178ef4f7b1a57562f1384b7f1e069293c6"] || {};
//# sourceMappingURL=vendors.js.map