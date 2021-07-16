import {describe, it, expect} from 'deccjsunit/index'

describe('assertFalse', function () {
    it('assertFalseSuccess', 0, function () {
        let d = false
        expect(d).assertFalse()
    })
    it('assertFalseFail', 0, function () {
        let d = true
        expect(d).assertFalse()
    })
})