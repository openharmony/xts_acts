/******/ (() => { // webpackBootstrap
    var __webpack_exports__ = {};
    /*!********************************************************************************************!*\
  !*** d:\workspace\my_works\MyApplication\entry\src\main\ets\default\workers\WorkerDemo.js ***!
  \********************************************************************************************/
    var worker = globalThis.requireNapi('worker');

    const parentPort = worker.parentPort;

    parentPort.onmessage = function(e) {
        throw new Error(123)
    }
    /******/ })()
;