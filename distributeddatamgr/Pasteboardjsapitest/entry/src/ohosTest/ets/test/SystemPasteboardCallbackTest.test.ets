import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import { BusinessError, pasteboard } from '@kit.BasicServicesKit';

let TAG = 'ttt'

export default function SystemPasteboardCallbackTest() {
  describe('SystemPasteboardCallbackTest', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.number SUB_Pasteboard_Local_SDK_SystemPasteboardCallback_0100
     * @tc.name SystemPasteboardCallback0100
     * @tc.desc Test pasteBoard callback
     * @tc.size      : MEDIUM
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('SystemPasteboardCallback0100', 0, async () => {
      let pasteData: pasteboard.PasteData = pasteboard.createPlainTextData('content');
      let systemPasteboard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
      systemPasteboard.clearDataSync();
      expect(systemPasteboard.hasDataSync()).assertEqual(false);
      try{
        systemPasteboard.setPasteData(pasteData, (err, data) => {
          if (err) {
            console.error(TAG + 'Failed to set PasteData. Cause: ' + err.message);
            expect().assertFail();
          }
          systemPasteboard.hasPasteData((err: BusinessError, data: boolean) => {
            if (err) {
              console.error(TAG + `Failed to check the PasteData. Cause: ${err.message}`);
              expect().assertFail();
            }
            systemPasteboard.getPasteData((err: BusinessError, pasteData: pasteboard.PasteData) => {
              if (err) {
                console.error(TAG + 'Failed to get PasteData. Cause: ' + err.message);
                expect().assertFail();
              }
              systemPasteboard.clear((err, data) => {
                if (err) {
                  console.error(TAG + `Failed to clear the PasteData. Cause: ${err.message}`);
                  expect().assertFail();
                }
              });
            })
          })
        })
        expect(systemPasteboard.hasDataSync()).assertEqual(false);
        console.info(TAG + 'Succeeded in clearing the PasteData.');
      } catch (err) {
        console.log(TAG + "PASTEBOARD err =" + err + ", code =" + err.code + ", message =" + err.message)
        expect().assertFail();
      }
    })
  })
}