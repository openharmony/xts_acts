import camera from '@ohos.multimedia.camera';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from 'deccjsunit/index';

const TAG = "CameraEnumTest: ";

export default function cameraEnumTest(surfaceId: any) {

    function isEmpty(data) {
        if (data == null || data == undefined) {
            return true;
        }
        return false;
    }

    describe('CameraInputTest', function () {
        console.info(TAG + '----------CameraInputTest--------------');

        beforeAll(async function () {
            console.info('beforeAll case');
        })

        beforeEach(function () {
            console.info('beforeEach case');
        })

        afterEach(async function () {
            console.info('afterEach case');
        })

        afterAll(function () {
            console.info('afterAll case');
        })


        /**
          * @tc.number    : SUB_MULTIMEDIA_CAMERA_ENUM_CAMERAPOSITION__0100
          * @tc.name      : Camera CameraPosition Eunm
          * @tc.desc      : Camera CameraPosition Eunm
          * @tc.size      : MEDIUM
          * @tc.type      : Function
          * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_CAMERA_ENUM_CAMERAPOSITION__0100', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_ENUM_CAMERAPOSITION__0100--------------");
            expect(isEmpty(camera.CameraPosition.CAMERA_POSITION_UNSPECIFIED)).assertFail();
            expect(isEmpty(camera.CameraPosition.CAMERA_POSITION_BACK)).assertFail();
            expect(isEmpty(camera.CameraPosition.CAMERA_POSITION_FRONT)).assertFail();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ENUM_CAMERAPOSITION__0100 ends here");
            done();
        })


        /**
         * @tc.number    : SUB_MULTIMEDIA_CAMERA_ENUM_CAMERATYPE__0100
         * @tc.name      : Camera CameraType Eunm
         * @tc.desc      : Camera CameraType Eunm
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 2
        */
        it('SUB_MULTIMEDIA_CAMERA_ENUM_CAMERATYPE__0100', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_ENUM_CAMERATYPE__0100--------------");
            expect(isEmpty(camera.CameraType.CAMERA_TYPE_UNSPECIFIED)).assertFail();
            expect(isEmpty(camera.CameraType.CAMERA_TYPE_WIDE_ANGLE)).assertFail();
            expect(isEmpty(camera.CameraType.CAMERA_TYPE_ULTRA_WIDE)).assertFail();
            expect(isEmpty(camera.CameraType.CAMERA_TYPE_TELEPHOTO)).assertFail();
            expect(isEmpty(camera.CameraType.CAMERA_TYPE_TRUE_DEPTH)).assertFail();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ENUM_CAMERATYPE__0100 ends here");
            done();
        })



        /**
          * @tc.number    : SUB_MULTIMEDIA_CAMERA_ENUM_CONNECTIONTYPE__0100
          * @tc.name      : Camera ConnectionType Eunm
          * @tc.desc      : Camera ConnectionType Eunm
          * @tc.size      : MEDIUM
          * @tc.type      : Function
          * @tc.level     : Level 2
        */
         it('SUB_MULTIMEDIA_CAMERA_ENUM_CONNECTIONTYPE__0100', 2, async function (done) {
            console.info("--------------SUB_MULTIMEDIA_CAMERA_ENUM_CONNECTIONTYPE__0100--------------");
            expect(isEmpty(camera.ConnectionType.CAMERA_CONNECTION_BUILT_IN)).assertFail();
            expect(isEmpty(camera.ConnectionType.CAMERA_CONNECTION_USB_PLUGIN)).assertFail();
            expect(isEmpty(camera.ConnectionType.CAMERA_CONNECTION_REMOTE)).assertFail();
            console.info(TAG + "Entering SUB_MULTIMEDIA_CAMERA_ENUM_CONNECTIONTYPE__0100 ends here");
            done();
        })  



    })
}