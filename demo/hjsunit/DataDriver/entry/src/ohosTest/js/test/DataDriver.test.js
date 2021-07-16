import {describe, it, expect} from 'deccjsunit/index'

describe('testSuite01', function () {
    it('testSpec01', function (data) {
        console.info('testSpec01......' + JSON.stringify(data))
    })
    it('testSpec02', function (data) {
        console.info('testSpec02......' + JSON.stringify(data))
    })
})