import {describe, it, expect} from 'deccjsunit/index'

describe('assertFail', function () {
    it('assertFail', 0, function () {
        let a = null
        expect(a).assertFail()
    })
})