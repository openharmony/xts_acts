/******/ (() => { // webpackBootstrap
    var __webpack_exports__ = {};
    /*!********************************************************************************************!*\
  !*** d:\workspace\my_works\MyApplication\entry\src\main\ets\default\workers\WorkerDemo.js ***!
  \********************************************************************************************/
    function foo(x) {return x}

    var worker = globalThis.requireNapi('worker');

    const parentPort = worker.parentPort;

    console.info("worker:: new version")

    parentPort.onclose = function() {
        console.info("worker::worker.js onclose");
    }

    parentPort.onmessage = function(e) {
        var data = e.data;
        console.info("worker:: worker thread worker data is " + data.data);
        switch(data.type) {
            case "normal":
                console.info("worker:: worker thread receive data " + data.data);
                parentPort.postMessage(data);
                console.info("worker:: worker thread post back");
                break;
            case "error":
                throw new Error("123");
                break;
            case "buffer":
                console.info("worker:: worker.js receive buffer length is  " + data.data.byteLength);
                parentPort.postMessage(data, [data.data]);
                console.info("worker:: worker.js post buffer length is  " + data.data.byteLength);
                break;
            default:
                console.info("worker:: worker.js receive unknow type");
                break
        }
    }

    // 反序列错误
    parentPort.onmessageerror = function() {
        console.info("worker:: worker.js onmessageerror");
    }

    // js执行异常
    parentPort.onerror = function(data) {
        console.info("worker:: worker.js onerror " + data.lineno + ", msg = " + data.message + ", filename = " + data.filename + ", colno = " + data.colno);
    }
    /******/ })()
;