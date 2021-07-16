import {describe, it, expect} from 'deccjsunit/index'

describe('assertLarger', function () {
    it('assertLargerSuccess', 0, function () {
        let a = 12;
        let b = 10;
        expect(a).assertLarger(b)
    })
    it('assertLargerFail', 0, function () {
        let a = 12;
        let b = 13;
        expect(a).assertLarger(b);
    })
})