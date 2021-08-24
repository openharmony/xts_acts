/******/ (() => { // webpackBootstrap
    var __webpack_exports__ = {};
    /*!********************************************************************************************!*\
  !*** d:\workspace\my_works\MyApplication\entry\src\main\ets\default\workers\WorkerDemo.js ***!
  \********************************************************************************************/
    console.log("worker:: run script");
    var worker = globalThis.requireNapi('worker');

    const parentPort = worker.parentPort;

    parentPort.onmessage = function(e) {
        console.log("worker:: worker receive data " + e.data);
        var data = e.data + " worker";
        parentPort.postMessage(data)
    }
    /******/ })()
;