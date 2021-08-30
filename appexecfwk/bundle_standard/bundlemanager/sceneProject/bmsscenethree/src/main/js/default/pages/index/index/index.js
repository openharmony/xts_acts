//
//import {Core} from 'deccjsunit/lite'
//const core=Core.getInstance()
//core.init()
//require('../../../test/List.test.js')
//core.execute()

import demo from '@ohos.bundle'

export default {
    data: {
        title: ""
    },
    onInit() {
        this.title = this.$t('strings.world');
        console.log("BmsApplication test for ams");


        demo.getBundleInstaller().then((data) => {
            data.install(['/data/test1.hap'], {
                param: {
                    userId: 0,
                    isKeepData: false
                }
            }, OnReceiveinstallEvent);

            function OnReceiveinstallEvent(err,data) {
                console.info("==============================install async install1==============================");
                console.info("neu========================name: for begin");
                console.info("neu========================install result code:" + err.code);
                console.info("neu========================install result code:" + data.status);
                console.info("neu========================install result msg:" + data.statusMessage);
            }


        });


        demo.getBundleInstaller().then((data) => {
    data.install(['/data/test.hap'], {
                param: {
                    userId: 0,
                    isKeepData: false
                }
            }, OnReceiveinstallEvent);

            function OnReceiveinstallEvent(err,data) {
                console.info("==============================install async install2==============================");
                console.info("neu========================name: for begin");
                console.info("neu========================install result code:" + err.code);
                console.info("neu========================install result code:" + data.status);
                console.info("neu========================install result msg:" + data.statusMessage);
            }


});



demo.getBundleInstaller().then((data) => {
    data.uninstall('com.example.myapplicationInstall3', {
                param: {
                    userId: 0,
                    isKeepData: false
                }
            }, OnReceiveinstallEvent);

            function OnReceiveinstallEvent(err,data) {
                console.info("==============================uninstall async uninstall==============================");
                console.info("neu========================name: for begin");
                console.info("neu========================uninstall result code:" + err.code);
                console.info("neu========================uninstall result code:" + data.status);
                console.info("neu========================uninstall result msg:" + data.statusMessage);
            }
});




        demo.getBundleInfos(8, OnReceiveEvent1);
         function OnReceiveEvent1(err,data) {
            console.info("neuXXXXXXXgetBundleInfosXXXXXXXX.name: for begin");
            console.info("neu========================err.code:" + err.code);
            console.info("neu========================data.length:" + data.length);
            for (var i = 0; i < data.length; i++) {

                console.info("neu========================data[i].name.length:" + data[i].name.length);


                console.info("neu========================data[i].appInfo.name.length" + data[i].appInfo.name.length);


                console.info("neu========================data[i].hapModuleInfos.length" + data[i].hapModuleInfos.length);

                for (var j = 0; j < data[i].hapModuleInfos.length; j++) {


                    console.info("neu========================data[i].hapModuleInfos[j].length" + data[i].hapModuleInfos[j].length);
                }

                console.info("neu========================data[i].abilityInfos.length" + data[i].abilityInfos.length);
                for (var j = 0; j < data[i].abilityInfos.length; j++) {

                    console.info("neu========================data[i].abilityInfos[j].name.length" + data[i].abilityInfos[j].name.length);
                }
            }
        }




        demo.getBundleInfo('com.example.myapplication',1,OnReceiveEvent2);
        function OnReceiveEvent2(err,data) {


            console.info("neuXXXXgetBundleInfoXXXX.name: for begin");
            console.info("neu========================err.code:" + err.code);
            console.info("neu========================err.code:" + err.code);
            console.info("neu========================data.name:::" + data.name);

        }





        demo.getApplicationInfos(8, 0, OnReceiveEvent3);
        function OnReceiveEvent3(err,datainfo) {
            console.info("neuXXXXXXXgetApplicationInfosXXXXXXXX.name: for begin");

            console.info("neu========================err.code:" + err.code);
            console.info("neu========================datainfo.length:::" + datainfo.length);

            for (var i = 0; i < datainfo.length; i++) {

                  console.info("neu========================datainfo[i].name" + datainfo[i].name);

            }
        }



        demo.getApplicationInfo('com.example.myapplication', 8, 1, OnReceiveEvent4);
        function OnReceiveEvent4(err,datainfo) {

            console.info("neu========================err.code:" + err.code);

            console.info("neuXXXXXXgetApplicationInfoXXXXXXX.name: for begin");

            console.info("neu========================ddatainfo.name:::" + datainfo.name);
        }




           demo.queryAbilityByWant({
                want: {
                    action: "action.system.home",
                    entities: ["entity.system.home"],
                    elementName: {
                        deviceId: "0",
                        bundleName: "com.example.myapplication",
                        abilityName: "com.example.myapplication.MainAbility",
                    },
                }
            }, {
                params: {
                    flags: 8,
                    userId: "0",
                }
            },OnReceiveEvent5);
            function OnReceiveEvent5(err,datainfo) {

            console.info("neuXXXXXXqueryAbilityByWantXXXXXXX.name: for begin");

            console.info("neu========================err.code:" + err.code);
                console.info("neu========================datainfo.name:" + datainfo.name);


        }



        demo.getPermissionDef("com.permission.CAMERA",OnReceiveEvent6);
        function OnReceiveEvent6(err,data) {
            console.info('**************************getPermissionDef********************************');
            console.info("neu========================err.code:" + err.code);
            console.info("neu========================permissionName:" + data.permissionName);


        }


                demo.getBundleArchiveInfo('/data/test.hap',OnReceiveEvent7);
        function OnReceiveEvent7(err,data) {
            console.info('**************************getBundleArchiveInfo********************************');
            console.info("neu========================err.code:" + err.code);
            console.info("neu========================name:" + data.name);



        }



    }
}
