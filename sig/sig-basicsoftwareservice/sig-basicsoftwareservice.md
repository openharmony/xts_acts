# SIG_BasicSoftwareService 
English | [简体中文](./sig-basicsoftwareservice_cn.md)

Note: The content of this SIG follows the convention described in OpenHarmony's PMC Management Charter [README](/zh/pmc.md).

## SIG group work objectives and scope

### Work Goals
Provide simple and effective Basic Software Services for Open Harmony Operating System; By modular design, Basic Software Services can support various kinds of devices, scaling from Level 0 to Level 5.

### Work Scope
Basic Software Services includes the following sub-systems:
| Name|Explanation|
| :----- | :----- |
|Startup System|Booting OpenHarmony, and provide init process manager and system parameters for the whole system|
|Upgrade System|Provide Operating System upgrade capability|
|DFX System|Design-for-Test, Design-for-Reliability and Design-for-Manufacturing|
|Event Notification System|Manage system and application notifications|
|Resource Management System|Manage system resources, including CPU, IO and memory|
|Distributed Scheduling System|Scheduing Abilities in Open Harmony distributed network|
|Account Management System|Manage user accounts for Open Harmony|
|Barrier Free System|Provide barrier free common capabilities for Open Harmony|
|Miscellaneous Software System|Provide some miscellaneous services for Open Harmony|

## The repositories

|Subsystem|Repository|Code Path|Owner|
| :----- | :----- | :----- | :----- |:----|
|HiviewDFX|[hiviewdfx_hievent_lite](https://gitee.com/openharmony/hiviewdfx_hievent_lite)|base/hiviewdfx/hievent_lite|[stesen](https://gitee.com/stesen)|
|HiviewDFX|[hiviewdfx_hilog_lite](https://gitee.com/openharmony/hiviewdfx_hilog_lite)|base/hiviewdfx/hilog_lite|[stesen](https://gitee.com/stesen)|
|HiviewDFX|[hiviewdfx_hiview_lite](https://gitee.com/openharmony/hiviewdfx_hiview_lite)|base/hiviewdfx/hiview_lite|[stesen](https://gitee.com/stesen)|
|HiviewDFX|[third_party_curl](https://gitee.com/openharmony/third_party_curl)|third_party/curl|[stesen](https://gitee.com/stesen)|
|HiviewDFX|[hiviewdfx_faultloggerd](https://gitee.com/openharmony/hiviewdfx_faultloggerd)|base/hiviewdfx/faultloggerd|[maplestorys](https://gitee.com/maplestorys)|
|HiviewDFX|[hiviewdfx_hiappevent](https://gitee.com/openharmony/hiviewdfx_hiappevent)|base/hiviewdfx/hiappevent|[stesen](https://gitee.com/stesen)|
|HiviewDFX|[hiviewdfx_hilog](https://gitee.com/openharmony/hiviewdfx_hilog)|base/hiviewdfx/hilog|[stesen](https://gitee.com/stesen)|
|HiviewDFX|[hiviewdfx_hisysevent](https://gitee.com/openharmony/hiviewdfx_hisysevent)|base/hiviewdfx/hisysevent|[yaomanhai](https://gitee.com/yaomanhai)|
|HiviewDFX|[hiviewdfx_hiview](https://gitee.com/openharmony/hiviewdfx_hiview)|base/hiviewdfx/hiview|[maplestorys](https://gitee.com/maplestorys)|
|HiviewDFX|[third_party_libunwind](https://gitee.com/openharmony/third_party_libunwind)|third_party/libunwind|[maplestorys](https://gitee.com/maplestorys)|
|HiviewDFX|[hiviewdfx_hitrace](https://gitee.com/openharmony/hiviewdfx_hitrace)|base/hiviewdfx/hitrace|[yaomanhai](https://gitee.com/yaomanhai)|
|HiviewDFX|[hiviewdfx_hidumper](https://gitee.com/openharmony/hiviewdfx_hidumper)|base/hiviewdfx/hidumper|[stesen](https://gitee.com/stesen)|
|HiviewDFX|[hiviewdfx_hicollie](https://gitee.com/openharmony/hiviewdfx_hicollie)|base/hiviewdfx/hicollie|[ericlee](https://gitee.com/ericlee)|
|DistributedSchedule|[distributedschedule_dms_fwk_lite](https://gitee.com/openharmony/distributedschedule_dms_fwk_lite)|foundation/distributedschedule/dmsfwk_lite|[lijiarun](https://gitee.com/lijiarun)|
|DistributedSchedule|[distributedschedule_safwk_lite](https://gitee.com/openharmony/distributedschedule_safwk_lite)|foundation/distributedschedule/safwk_lite|[lijiarun](https://gitee.com/lijiarun)|
|DistributedSchedule|[distributedschedule_samgr_lite](https://gitee.com/openharmony/distributedschedule_samgr_lite)|foundation/distributedschedule/samgr_lite|[lijiarun](https://gitee.com/lijiarun)|
|StartUp|[startup_appspawn_lite](https://gitee.com/openharmony/startup_appspawn_lite)|base/startup/appspawn_lite|[handyohos](https://gitee.com/handyohos)|
|StartUp|[startup_bootstrap_lite](https://gitee.com/openharmony/startup_bootstrap_lite)|base/startup/bootstrap_lite|[handyohos](https://gitee.com/handyohos)|
|StartUp|[startup_init_lite](https://gitee.com/openharmony/startup_init_lite)|base/startup/init_lite|[handyohos](https://gitee.com/handyohos)|
|StartUp|[startup_syspara_lite](https://gitee.com/openharmony/startup_syspara_lite)|base/startup/syspara_lite|[handyohos](https://gitee.com/handyohos)|
|StartUp|[startup_appspawn](https://gitee.com/openharmony/startup_appspawn)|base/startup/appspawn_standard|[handyohos](https://gitee.com/handyohos)|
|Update|[update_ota_lite](https://gitee.com/openharmony/update_ota_lite)|base/update/ota_lite|[ailorna](https://gitee.com/ailorna)|
|Update|[update_app](https://gitee.com/openharmony/update_app)|base/update/app|[ailorna](https://gitee.com/ailorna)|
|Update|[update_packaging_tools](https://gitee.com/openharmony/update_packaging_tools)|base/update/packaging_tools|[ailorna](https://gitee.com/ailorna)|
|Update|[update_updater](https://gitee.com/openharmony/update_updater)|base/update/updater|[ailorna](https://gitee.com/ailorna)|
|Update|[update_updateservice](https://gitee.com/openharmony/update_updateservice)|base/update/updateservice|[ailorna](https://gitee.com/ailorna)|
|Update|[third_party_bzip2](https://gitee.com/openharmony/third_party_bzip2)|third_party/bzip2|[ailorna](https://gitee.com/ailorna)|
|Update|[third_party_lz4](https://gitee.com/openharmony/third_party_lz4)|third_party/lz4|[ailorna](https://gitee.com/ailorna)|
|MiscServices|[miscservices_time](https://gitee.com/openharmony/miscservices_time)|base/miscservices/time|[autumn330](https://gitee.com/autumn330)|
|Notification|[notification_ces_standard](https://gitee.com/openharmony/notification_ces_standard)|base/notification/ces_standard|[autumn330](https://gitee.com/autumn330)|
|Notification|[notification_ans_standard](https://gitee.com/openharmony/notification_ans_standard)|base/notification/ans_standard|[autumn330](https://gitee.com/autumn330)|
|Account|[account_os_account](https://gitee.com/openharmony/account_os_account)|base/account/os_account|[verystone](https://gitee.com/verystone)|


## SIG Members

### Leader
- @handyohos(https://gitee.com/handyohos)
- @ericlee(https://gitee.com/ericlee)

### Committers
|SubSystem|Committer|Mail|
| :----- | :----- |:----- |
|HiviewDFX|[stesen](https://gitee.com/stesen)|[mail](stesen.ma@huawei.com)|
|HiviewDFX|[ericlee](https://gitee.com/ericlee)|[mail](liyu1@huawei.com)|
|HiviewDFX|[maplestorys](https://gitee.com/maplestorys)|[mail](zengzhi5@huawei.com)|
|HiviewDFX|[yaomanhai](https://gitee.com/yaomanhai)|[mail](yaomanhai@huawei.com)|
|HiviewDFX|[shenchenkai](https://gitee.com/shenchenkai)|[mail](shenchenkai@huawei.com)|
|HiviewDFX|[guochuanqi](https://gitee.com/guochuanqi)|[mail](guochuanqi@huawei.com)|
|MiscServices|[swan_hilee](https://gitee.com/swan_hilee)|[mail](qushiwan@huawei.com)|
|DistributedSchedule|[lijiarun](https://gitee.com/lijiarun)|[mail](lijiarun@huawei.com)|
|StartUp|[handyohos](https://gitee.com/handyohos)|[mail](zhangxiaotian@huawei.com)|
|StartUp|[derek520](https://gitee.com/derek520)|[mail](wtweitao.wei@huawei.com)|
|StartUp|[mytide](https://gitee.com/mytide)|[mail](max.liuwei@huawei.com)|
|Update|[ailorna](https://gitee.com/ailorna)|[mail](hehuan1@huawei.com)|
|Notification|[autumn330](https://gitee.com/autumn330)|[mail](hw.liuwei@huawei.com)|
|Account|[verystone](https://gitee.com/verystone)|[mail](xudaqing@huawei.com)|


### Meetings
 - Meeting time: Wednesday at 14:00 o'clock, biweekly
 - Meeting link: Welink

### Contact (optional)

- Mailing list：stesen.ma@huawei.com;liyu1@huawei.com;zengzhi5@huawei.com;yaomanhai@huawei.com;shenchenkai@huawei.com;guochuanqi@huawei.com;qushiwan@huawei.com;lijiarun@huawei.com;zhangxiaotian@huawei.com;wtweitao.wei@huawei.com;max.liuwei@huawei.com;hehuan1@huawei.com;hw.liuwei@huawei.com;xudaqing@huawei.com
- Slack group：NA
- Wechat group：NA
