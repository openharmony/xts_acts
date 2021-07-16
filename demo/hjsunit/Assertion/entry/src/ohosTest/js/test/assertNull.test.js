import {describe, it, expect} from 'deccjsunit/index'

describe('assertNull', function () {
    it('assertNullSuccess', 0, function () {
        let d
        expect(d).assertNull()
    })
    it('assertNullFail', 0, function () {
        let d = 100
        expect(d).assertNull()
    })
})