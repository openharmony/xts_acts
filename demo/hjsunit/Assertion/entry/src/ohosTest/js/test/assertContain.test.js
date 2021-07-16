import {describe, it, expect} from 'deccjsunit/index'

describe('assertContain', function () {
    it('assertContainSuccessOnString', 0, function () {
        let a = 'abc';
        let b = 'b'
        expect(a).assertContain(b)
    })
    it('assertContainSuccessOnArray', 0, function () {
        let a = ['a', 'b', 'c'];
        let b = 'b'
        expect(a).assertContain(b)
    })
    it('assertContainFailOnString', 0, function () {
        let a = 'abc';
        let b = 'd'
        expect(a).assertContain(b)
    })
    it('assertContainFailOnArray', 0, function () {
        let a = ['a', 'b', 'c'];
        let b = 'd'
        expect(a).assertContain(b)
    })
})