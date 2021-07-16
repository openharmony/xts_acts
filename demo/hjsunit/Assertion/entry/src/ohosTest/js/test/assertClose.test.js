import {describe, it, expect} from 'deccjsunit/index'

describe('assertClose', function () {
    it('assertCloseSuccess001', 0, function () {
        let a = 100;
        let b = 0.1
        expect(a).assertClose(99, b)
    })
    it('assertCloseFail002', 0, function () {
        let a = 100;
        let b = 0.1
        expect(a).assertClose(1, b)
    })
    it('assertCloseFail003', 0, function () {
        let a = 100;
        let b = 0.1
        expect(a).assertClose(null, b)
    })
    it('assertCloseFail004', 0, function () {
        expect(null).assertClose(null, 0)
    })
})