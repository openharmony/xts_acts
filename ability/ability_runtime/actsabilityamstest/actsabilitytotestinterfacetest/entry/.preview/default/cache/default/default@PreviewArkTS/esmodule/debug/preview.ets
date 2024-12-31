struct preview{build(){Button('TestCase6')
        .id('TestCase6')
        .onClick(() => {
          let want: Want = {
            deviceId: '', //本设备
            bundleName: 'com.example.appb', //包名
            moduleName: 'assist', //模块名
            abilityName: 'AssistAbility1', //abiliyt名
            parameters: {
              processKey: 'sub'
            }
          }
          let want1: Want = {
            deviceId: '', //本设备
            bundleName: 'com.example.appb', //包名
            moduleName: 'assist', //模块名
            abilityName: 'AssistAbility2', //abiliyt名
            parameters: {
              processKey: 'sub1'
            }
          }
          let want2: Want = {
            deviceId: '', //本设备
            bundleName: 'com.example.appb', //包名
            moduleName: 'assist', //模块名
            abilityName: 'AssistAbility3', //abiliyt名
            parameters: {
              processKey: 'sub2'
            }
          }

          //唤起另一个ability基于context starAbility调起UIAbility
          //返回一个promis对象

          this.context.startAbility(want)
            .then(() => {
              hilog.info(0x0000, 'startAbility', '%{public}s', 'success startAbility1');
            })
            .catch((error: BusinessError) => {
              hilog.info(0x0000, 'startAbility', '%{public}s', 'startAbility1 error');
            })
          this.context.startAbility(want1)
            .then(() => {
              hilog.info(0x0000, 'startAbility', '%{public}s', 'success startAbility2');
            })
            .catch((error: BusinessError) => {
              hilog.info(0x0000, 'startAbility', '%{public}s', 'startAbility2 error');
            })
          this.context.startAbility(want2)
            .then(() => {
              hilog.info(0x0000, 'startAbility', '%{public}s', 'success startAbility3');
            })
            .catch((error: BusinessError) => {
              hilog.info(0x0000, 'startAbility', '%{public}s', 'startAbility3 error');
            })
        })}}