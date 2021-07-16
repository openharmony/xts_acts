import {describe, it, expect} from 'deccjsunit/index'

describe('assertThrowError', function () {
    it('assertThrowErrorFail001', 0, function () {
        let a = 12;
        expect(a).assertThrowError()
    })
    it('assertThrowErrorSuccess', 0, function () {
        let a = test
        function test() {
            throw Error("exception")
        }
        expect(a).assertThrowError("exception");
    })
    it('assertThrowErrorFail002', 0, function () {
        let a = test
        function test() {
            throw Error("exception")
        }
        expect(a).assertThrowError("test");
    })
})