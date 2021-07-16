import {describe, it, expect} from 'deccjsunit/index'

describe('assertLess', function () {
    it('assertLessSuccess', 0, function () {
        let a = 12;
        let b = 15;
        expect(a).assertLess(b)
    })
    it('assertLessFail', 0, function () {
        let a = 12;
        let b = 10;
        expect(a).assertLess(b);
    })
})