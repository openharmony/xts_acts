# 基础软件服务SIG组
简体中文 | [English](./sig-basicsoftwareservice.md)

说明：本SIG的内容遵循OpenHarmony的PMC管理章程 [README](/zh/pmc.md)中描述的约定。

## SIG组工作目标和范围

### 工作目标
为OpenHarmony提供简洁、高效的基础软件服务；通过部件化设计，可组合支撑L0~L5多种不同级别设备的系统软件开发。

### 工作范围
基础软件服务主要包括以下几个子系统：
| 名称|说明|
| :----- | :----- |
|启动子系统|提供系统OS系统启动框架，包括系统引导过程，init初始进程管理以及系统参数属性机制|
|升级服务子系统|提供系统升级能力|
|DFX子系统|提供DFT、DFR、DFM等系统能力|
|事件通知子系统|提供系统事件通知服务能力|
|全局资源调度管控子系统|提供本机全局资源调度管控能力，包括CPU、IO、内存等资源管控|
|分布式任务调度子系统|提供分布式任务调度管理能力|
|账号子系统|提供系统的账号管理能力|
|无障碍软件服务子系统|提供无障碍软件服务能力|
|Misc软件服务子系统|提供杂散系统服务|

## 代码仓

| 子系统|代码仓|代码路径|维护者|
| :----- | :----- | :----- | :----- |:----|
|DFX子系统|[hiviewdfx_hievent_lite](https://gitee.com/openharmony/hiviewdfx_hievent_lite)|base/hiviewdfx/hievent_lite|[stesen](https://gitee.com/stesen)|
|DFX子系统|[hiviewdfx_hilog_lite](https://gitee.com/openharmony/hiviewdfx_hilog_lite)|base/hiviewdfx/hilog_lite|[stesen](https://gitee.com/stesen)|
|DFX子系统|[hiviewdfx_hiview_lite](https://gitee.com/openharmony/hiviewdfx_hiview_lite)|base/hiviewdfx/hiview_lite|[stesen](https://gitee.com/stesen)|
|DFX子系统|[third_party_curl](https://gitee.com/openharmony/third_party_curl)|third_party/curl|[stesen](https://gitee.com/stesen)|
|DFX子系统|[hiviewdfx_faultloggerd](https://gitee.com/openharmony/hiviewdfx_faultloggerd)|base/hiviewdfx/faultloggerd|[maplestorys](https://gitee.com/maplestorys)|
|DFX子系统|[hiviewdfx_hiappevent](https://gitee.com/openharmony/hiviewdfx_hiappevent)|base/hiviewdfx/hiappevent|[stesen](https://gitee.com/stesen)|
|DFX子系统|[hiviewdfx_hilog](https://gitee.com/openharmony/hiviewdfx_hilog)|base/hiviewdfx/hilog|[stesen](https://gitee.com/stesen)|
|DFX子系统|[hiviewdfx_hisysevent](https://gitee.com/openharmony/hiviewdfx_hisysevent)|base/hiviewdfx/hisysevent|[yaomanhai](https://gitee.com/yaomanhai)|
|DFX子系统|[hiviewdfx_hiview](https://gitee.com/openharmony/hiviewdfx_hiview)|base/hiviewdfx/hiview|[maplestorys](https://gitee.com/maplestorys)|
|DFX子系统|[third_party_libunwind](https://gitee.com/openharmony/third_party_libunwind)|third_party/libunwind|[maplestorys](https://gitee.com/maplestorys)|
|DFX子系统|[hiviewdfx_hitrace](https://gitee.com/openharmony/hiviewdfx_hitrace)|base/hiviewdfx/hitrace|[yaomanhai](https://gitee.com/yaomanhai)|
|DFX子系统|[hiviewdfx_hidumper](https://gitee.com/openharmony/hiviewdfx_hidumper)|base/hiviewdfx/hidumper|[stesen](https://gitee.com/stesen)|
|DFX子系统|[hiviewdfx_hicollie](https://gitee.com/openharmony/hiviewdfx_hicollie)|base/hiviewdfx/hicollie|[ericlee](https://gitee.com/ericlee)|
|分布式任务调度子系统|[distributedschedule_dms_fwk_lite](https://gitee.com/openharmony/distributedschedule_dms_fwk_lite)|foundation/distributedschedule/dmsfwk_lite|[lijiarun](https://gitee.com/lijiarun)|
|分布式任务调度子系统|[distributedschedule_safwk_lite](https://gitee.com/openharmony/distributedschedule_safwk_lite)|foundation/distributedschedule/safwk_lite|[lijiarun](https://gitee.com/lijiarun)|
|分布式任务调度子系统|[distributedschedule_samgr_lite](https://gitee.com/openharmony/distributedschedule_samgr_lite)|foundation/distributedschedule/samgr_lite|[lijiarun](https://gitee.com/lijiarun)|
|启动恢复子系统|[startup_appspawn_lite](https://gitee.com/openharmony/startup_appspawn_lite)|base/startup/appspawn_lite|[handyohos](https://gitee.com/handyohos)|
|启动恢复子系统|[startup_bootstrap_lite](https://gitee.com/openharmony/startup_bootstrap_lite)|base/startup/bootstrap_lite|[handyohos](https://gitee.com/handyohos)|
|启动恢复子系统|[startup_init_lite](https://gitee.com/openharmony/startup_init_lite)|base/startup/init_lite|[handyohos](https://gitee.com/handyohos)|
|启动恢复子系统|[startup_syspara_lite](https://gitee.com/openharmony/startup_syspara_lite)|base/startup/syspara_lite|[handyohos](https://gitee.com/handyohos)|
|启动恢复子系统|[startup_appspawn](https://gitee.com/openharmony/startup_appspawn)|base/startup/appspawn_standard|[handyohos](https://gitee.com/handyohos)|
|升级服务子系统|[update_ota_lite](https://gitee.com/openharmony/update_ota_lite)|base/update/ota_lite|[ailorna](https://gitee.com/ailorna)|
|升级服务子系统|[update_app](https://gitee.com/openharmony/update_app)|base/update/app|[ailorna](https://gitee.com/ailorna)|
|升级服务子系统|[update_packaging_tools](https://gitee.com/openharmony/update_packaging_tools)|base/update/packaging_tools|[ailorna](https://gitee.com/ailorna)|
|升级服务子系统|[update_updater](https://gitee.com/openharmony/update_updater)|base/update/updater|[ailorna](https://gitee.com/ailorna)|
|升级服务子系统|[update_updateservice](https://gitee.com/openharmony/update_updateservice)|base/update/updateservice|[ailorna](https://gitee.com/ailorna)|
|升级服务子系统|[third_party_bzip2](https://gitee.com/openharmony/third_party_bzip2)|third_party/bzip2|[ailorna](https://gitee.com/ailorna)|
|升级服务子系统|[third_party_lz4](https://gitee.com/openharmony/third_party_lz4)|third_party/lz4|[ailorna](https://gitee.com/ailorna)|
|Misc软件服务子系统|[miscservices_time](https://gitee.com/openharmony/miscservices_time)|base/miscservices/time|[autumn330](https://gitee.com/autumn330)|
|事件通知子系统|[notification_ces_standard](https://gitee.com/openharmony/notification_ces_standard)|base/notification/ces_standard|[autumn330](https://gitee.com/autumn330)|
|事件通知子系统|[notification_ans_standard](https://gitee.com/openharmony/notification_ans_standard)|base/notification/ans_standard|[autumn330](https://gitee.com/autumn330)|
|账号子系统|[account_os_account](https://gitee.com/openharmony/account_os_account)|base/account/os_account|[verystone](https://gitee.com/verystone)|


## SIG组成员

### Leader
- @handyohos(https://gitee.com/handyohos)
- @ericlee(https://gitee.com/ericlee)

### Committers列表

|子系统|Committer|Mail|
| :----- | :----- |:----- |
|DFX子系统|[stesen](https://gitee.com/stesen)|[mail](stesen.ma@huawei.com)|
|DFX子系统|[ericlee](https://gitee.com/ericlee)|[mail](liyu1@huawei.com)|
|DFX子系统|[maplestorys](https://gitee.com/maplestorys)|[mail](zengzhi5@huawei.com)|
|DFX子系统|[yaomanhai](https://gitee.com/yaomanhai)|[mail](yaomanhai@huawei.com)|
|DFX子系统|[shenchenkai](https://gitee.com/shenchenkai)|[mail](shenchenkai@huawei.com)|
|DFX子系统|[guochuanqi](https://gitee.com/guochuanqi)|[mail](guochuanqi@huawei.com)|
|Misc软件服务子系统|[swan_hilee](https://gitee.com/swan_hilee)|[mail](qushiwan@huawei.com)|
|分布式任务调度子系统|[lijiarun](https://gitee.com/lijiarun)|[mail](lijiarun@huawei.com)|
|启动恢复子系统|[handyohos](https://gitee.com/handyohos)|[mail](zhangxiaotian@huawei.com)|
|启动恢复子系统|[derek520](https://gitee.com/derek520)|[mail](wtweitao.wei@huawei.com)|
|启动恢复子系统|[mytide](https://gitee.com/mytide)|[mail](max.liuwei@huawei.com)|
|升级服务子系统|[ailorna](https://gitee.com/ailorna)|[mail](hehuan1@huawei.com)|
|事件通知子系统|[autumn330](https://gitee.com/autumn330)|[mail](hw.liuwei@huawei.com)|
|账号子系统|[verystone](https://gitee.com/verystone)|[mail](xudaqing@huawei.com)|


### 会议
 - 会议时间: 双周三 14:00
 - 会议链接: Welink

### 联系方式(可选)

- 邮件列表：stesen.ma@huawei.com;liyu1@huawei.com;zengzhi5@huawei.com;yaomanhai@huawei.com;shenchenkai@huawei.com;guochuanqi@huawei.com;qushiwan@huawei.com;lijiarun@huawei.com;zhangxiaotian@huawei.com;wtweitao.wei@huawei.com;max.liuwei@huawei.com;hehuan1@huawei.com;hw.liuwei@huawei.com;xudaqing@huawei.com
- Slack群组：NA
- 微信群：NA