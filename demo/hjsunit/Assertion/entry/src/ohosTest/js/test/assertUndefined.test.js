import {describe, it, expect} from 'deccjsunit/index'

describe('assertUndefined', function () {
    it('assertUndefinedSuccess', 0, function () {
        let a = undefined
        expect(a).assertUndefined()
    })
    it('assertUndefinedFail', 0, function () {
        let a = 100
        expect(a).assertUndefined()
    })
})