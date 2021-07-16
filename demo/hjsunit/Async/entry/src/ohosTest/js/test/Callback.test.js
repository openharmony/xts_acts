import {describe, it} from 'deccjsunit/index'

describe('callback', function () {
    it('callbackDemo', 0, async function (done) {
        await a()
    })
})

function a(done){
    setTimeout(function(){
        console.log("run a after 1000ms")
    },1000)
    done()
}