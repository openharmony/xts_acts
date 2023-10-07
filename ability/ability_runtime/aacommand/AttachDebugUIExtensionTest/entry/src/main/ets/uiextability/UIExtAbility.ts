import UIExtensionAbility from '@ohos.app.ability.UIExtensionAbility';
import hilog from '@ohos.hilog';
import window from '@ohos.window';

const TAG: string = '[UIExtAbility]'

export default class UIExtAbility extends UIExtensionAbility {
    onCreate() {
        console.info(TAG, `UIExtAbility onCreate`)
    }

    onForeground() {
        console.info(TAG, `UIExtAbility onForeground`)
    }

    onBackground() {
        console.info(TAG, `UIExtAbility onBackground`)
    }

    onDestroy() {
        console.info(TAG, `UIExtAbility onDestroy`)
    }

    onSessionCreate(want, session) {
        console.info(TAG, `UIExtAbility onSessionCreate, want: ${JSON.stringify(want)}`)
        let storage = new LocalStorage({
            'session': session
        });
        session.loadContent('pages/Index', storage);
        globalThis.session = session;
    }

    onSessionDestroy(session) {
        console.info(TAG, `UIExtAbility onSessionDestroy`)
    }
};