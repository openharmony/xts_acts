import abilityAccessCtrl from '@ohos.abilityAccessCtrl';
import { Permissions } from '@ohos.abilityAccessCtrl';

const TAG = "PermissionUtil"

export class PermissionUtil {
    private static OAID_TRACKING_CONSENT_PERMISSION = ['ohos.permission.APP_TRACKING_CONSENT'];
    private static permissions: Array<Permissions> = ['ohos.permission.READ_CALENDAR'];

    public static async requestOAIDTrackingConsentPermissions(context: any): Promise<void> {
        let atManager = abilityAccessCtrl.createAtManager();
        return new Promise<void>(async (resolve, reject) => {
            console.log(TAG, `requestPermission begin`);
            let data = await atManager.requestPermissionsFromUser(context, ['ohos.permission.APP_TRACKING_CONSENT']);
            console.log(TAG, 'requestPermissionsFromUser data=' + JSON.stringify(data));
            if (data && data.authResults) {
                let result = 0;
                for (let i = 0; i < data.authResults.length; i++) {
                    result += data.authResults[i];
                }
                if (result == 0) {
                    resolve();
                } else {
                    console.log(TAG, 'requestPermission user rejected');
                    reject();
                }
            } else {
                console.log(TAG, 'requestPermission failed');
                reject();
            }
            console.log(TAG, 'requestPermission end');
        });
    }
}