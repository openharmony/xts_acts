import events_emitter from '@ohos.events.emitter';
import { expect } from "../../../hypium/index";
import JSON from '@ohos.util.json';
import { Driver, ON } from '@ohos.UiTest';

export default class Utils {
  static async sleep(count: int): Promise<int> {
    return new Promise<int>((resolve, reject) => {
      setTimeout(() => {
        resolve(0)
      }, count)
    })
  }

  static async clickComponent(id: string) {
    let driver = Driver.create();
    let component = await driver.findComponent(ON.id(id));
    component?.click();
  }

  static async longClickComponent(id: string) {
    let driver = Driver.create();
    let component = await driver.findComponent(ON.id(id));
    component?.longClick();
  }

  static async emitEvent(actualValue: boolean | string | number | object, eventId: number) {
    try {
      // let tempData: Record<string, Object> = {};
      // tempData["ACTION"] = actualValue;
      let backData: events_emitter.EventData = {
        data: {
          "ACTION": actualValue
        } as Record<string, Object>
        // data: tempData
      }

      let backEvent: events_emitter.InnerEvent = {
        eventId: eventId,
        priority: events_emitter.EventPriority.LOW
      }
      console.info("[Boruto]:webFlag start to emit action state");
      events_emitter.emit(backEvent, backData);
      // console.info("Utils sleep start");
      // await Utils.sleep(2000)
      // console.info("Utils sleep over");
    } catch (err) {
      console.info("webFlag emit action state err: " + JSON.stringify(err));
    }
  }

  static registerBaseEvent(testCaseName: string, expected: Object, eventId: number,
    done: () => void, expectFunction: (backData: events_emitter.EventData, expected: Object) => void) {
    console.info(`[${testCaseName}] START`);
    try {
      let callBack = (backData: events_emitter.EventData) => {
        try {
          console.info(`lichenwei: ${testCaseName} get result is:` + JSON.stringify(backData));
          expectFunction(backData, expected);
          console.info(`lichenwei: [${testCaseName}] END`);
        } catch (err) {
          console.info(`lichenwei: [${testCaseName}] err:` + JSON.stringify(err));
        }
        console.info(`lichenwei: done0000`);
        done()
        console.info(`lichenwei: done1111`);
      }
      let innerEvent: events_emitter.InnerEvent = {
        eventId: eventId,
        priority: events_emitter.EventPriority.LOW
      }
      events_emitter.on(innerEvent, callBack)
    } catch (err) {
      console.info(`[${testCaseName}] err:` + JSON.stringify(err));
    }
  }

  static registerEvent(testCaseName: string, expectedValue: Object, eventId: number, done: () => void) {
    Utils.registerBaseEvent(testCaseName, expectedValue, eventId, done,
      (backData: events_emitter.EventData, expected: Object) => {
        expect(backData?.data?.["ACTION"]).assertEqual(expected);
      });
  }
}