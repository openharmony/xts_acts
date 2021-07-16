import {describe, it, expect} from 'deccjsunit/index'

describe('assertInstanceOf', function () {
    it('assertInstanceOfSuccessOnNumber', 0, function () {
        let a = 12;
        expect(a).assertInstanceOf('Number')
    })
    it('assertInstanceOfFailOnNumber', 0, function () {
        let a = "abc";
        expect(a).assertInstanceOf('String');
        expect(a).assertInstanceOf('Number');
    })
})
