import {describe, it} from 'deccjsunit/index'

describe('promise', function () {
    it('promiseDemo', 0, async function (done) {
        await new Promise(
            function (resolve, reject) {
                // 一段耗时的异步操作
                resolve('成功')   // 数据处理完成
                // reject('失败') // 数据处理出错
            }).then(
            (res) => {console.log(res)},  // 成功
            (err) => {console.log(err)}   // 失败
        )
        done()
    })
})