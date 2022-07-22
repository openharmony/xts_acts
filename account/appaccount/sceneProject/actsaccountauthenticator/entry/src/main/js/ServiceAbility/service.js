import account_appAccount from '@ohos.account.appAccount';
import {MyAuthenticator} from '../Common/utils'

var TAG = "[AccountTest]"
var authenticator = null
export default {
    async onStart(want) {
        console.info('ServiceAbility onStart');
        var accountMgr = account_appAccount.createAppAccountManager();
        try {
            await accountMgr.addAccount("zhangsan", "");
            await accountMgr.enableAppAccess("zhangsan", "com.example.accounttest");
            await accountMgr.addAccount("lisi", "");
            await accountMgr.enableAppAccess("lisi", "com.example.accounttest");
            await accountMgr.addAccount("wangwu", "");
            await accountMgr.enableAppAccess("wangwu", "com.example.accounttest");
        } catch(err) {
            console.error(TAG + "addAccount or enableAppAccess failed, error: " + JSON.stringify(err))
        }
        console.info('ServiceAbility onStart end');
    },
    async onStop() {
        console.info('ServiceAbility onStop');
    },
    onConnect(want) {
        console.info('ServiceAbility onConnect');
        authenticator = new MyAuthenticator();
        return authenticator.getRemoteObject();
    },
    onReconnect(want) {
        console.info('ServiceAbility onReconnect');
    },
    onDisconnect() {
        console.info('ServiceAbility onDisconnect');
    },
    onCommand(want, restart, startId) {
        console.info('ServiceAbility onCommand');
    }
};