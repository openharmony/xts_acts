// @ts-nocheck
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from "deccjsunit/index.ets"
import router from '@system.router';

export default function swiperJsunit() {

  function sleep(time) {
    return new Promise((resolve, reject) => {
      setTimeout(() => {
        resolve()
      }, time * 1000)
    }).then(() => {
      console.info(`sleep ${time} over...`)
    })
  }
  //返回首页
  async function backToIndex() {
    let backToIndexPromise = new Promise((resolve, reject) => {
      console.info('afterEach backToIndexPromise ...');
      setTimeout(() => {
        router.back({
          uri: 'pages/index'
        });
        resolve();
      }, 500);
    });

    let clearPromise = new Promise((resolve, reject) => {
      console.info('afterEach clearPromise ...');
      setTimeout(() => {
        router.clear();
        resolve();
      }, 500);
    });
    await backToIndexPromise.then(() => {
      return clearPromise;
    });
  }

  describe('swiperTest', function () {

    /**
     * @tc.number    SUB_ACE_BASIC_ETS_API_0500
     * @tc.name      swiperTest001
     * @tc.desc      aceEtsTest
     */
    it('swiperTest001', 0, async function (done) {
      console.info('++++++++++++++++ Swiper TestCase 1 START ++++++++++++++++');
      let options = {
        uri: 'pages/Swiper',
      }
      try {
        let result = await router.push(options)
        console.info( JSON.stringify(result));
      } catch (err) {
        console.error(JSON.stringify(result));
      }
      await sleep(1)
      let strJson = getInspectorByKey('swiper');
      let obj = JSON.parse(strJson);
      console.info("get inspector value is: " + JSON.stringify(obj));
      console.log(JSON.stringify(obj.$type))
      expect(obj.$type).assertEqual('Swiper')
      console.log('Swiper‘s index is '+JSON.stringify(obj.$attrs.index))
      console.log('Swiper‘s autoPlay is '+JSON.stringify(obj.$attrs.autoPlay))
      console.log('Swiper‘s interval is '+JSON.stringify(obj.$attrs.interval))
      console.log('Swiper‘s indicator is '+JSON.stringify(obj.$attrs.indicator))
      console.log('Swiper‘s loop is '+JSON.stringify(obj.$attrs.loop))
      console.log('Swiper‘s duration is '+JSON.stringify(obj.$attrs.duration))
      console.log('Swiper‘s vertical is '+JSON.stringify(obj.$attrs.vertical))
      console.log('Swiper‘s itemSpace is '+JSON.stringify(obj.$attrs.itemSpace))
      expect(obj.$attrs.index).assertEqual('1')
      expect(obj.$attrs.autoPlay).assertEqual('true')
      expect(obj.$attrs.interval).assertEqual('4000')
      expect(obj.$attrs.indicator).assertEqual('true')
      expect(obj.$attrs.loop).assertEqual('false')
      expect(obj.$attrs.vertical).assertEqual('false')
      expect(obj.$attrs.duration).assertEqual(1000.000000.toFixed(6))
      console.info('++++++++++++++++ Swiper TestCase 1 End +++++++++++++++++');
      done();
    });
  })
}
