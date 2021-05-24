# OpenHarmony_release_1.0.1版本转测试信息：

| **转测试版本号：OpenHarmony_release_1.0.1.001                |
| ------------------------------------------------------------ |
| **版本用途：**OpenHarmony二次增量开源后，质量加固测试，提升版本稳定性 |
| **转测试时间：2021-03-24**                                   |
| hispark_taurus版本：<br/> https://hm-verify.obs.cn-north-4.myhuaweicloud.com/version/Release_Version/OpenHarmony_release_1.0.1.001/2021-03-23-19-37/hispark_taurus.tar.gz |
| hispark_pegasus版本：<br/> https://hm-verify.obs.cn-north-4.myhuaweicloud.com/version/Release_Version/OpenHarmony_release_1.0.1.001/2021-03-23-19-35/hispark_pegasus.tar.gz |
| hispark_aries版本：<br/> https://hm-verify.obs.cn-north-4.myhuaweicloud.com/version/Release_Version/OpenHarmony_release_1.0.1.001/2021-03-23-19-36/hispark_aries.tar.gz |

# OpenHarmony_release_1.0.1_sp1版本转测试信息：

| 测试版本号：OpenHarmony_release_1.0.1_sp1**                  |
| ------------------------------------------------------------ |
| **版本用途：**Openharmoy社区首个LTS稳定版本，支撑OEM三方生态商用 |
| **转测试时间：2021-03-30**                                   |
| hispark_taurus版本：<br> https://hm-verify.obs.cn-north-4.myhuaweicloud.com/version/Release_Version/OpenHarmony_release_1.0.1_sp1/2021-03-30_10-36-58/hispark_taurus.tar.gz |
| hispark_pegasus版本：<br> https://hm-verify.obs.cn-north-4.myhuaweicloud.com/version/Release_Version/OpenHarmony_release_1.0.1_sp1/2021-03-30_10-34-56/hispark_pegasus.tar.gz |
| hispark_aries版本：<br> https://hm-verify.obs.cn-north-4.myhuaweicloud.com/version/Release_Version/OpenHarmony_release_1.0.1_sp1/2021-03-30_10-36-41/hispark_aries.tar.gz |

# OpenHarmony 2.2 beta1版本转测试信息：

| **转测试版本号：OpenHarmony 2.2 beta1                        |
| ------------------------------------------------------------ |
| **版本用途：**OpenHarmony码云master迭代一beta1测试，验收分布式数据管理、轻图形子系统特性 |
| **API变更：**：本次转测特性涉及轻图形API变更                 |
| **转测试时间：2021-05-20**                                   |
| hispark_taurus版本：<br> https://hm-verify.obs.cn-north-4.myhuaweicloud.com/version/Master_Version/OpenHarmony_2.2_Beta1/20210521_142211/Master_Version-OpenHarmony_2.2_Beta1-20210521_142211-hispark_taurus.tar.gz |
| hispark_pegasus版本：<br> https://hm-verify.obs.cn-north-4.myhuaweicloud.com/version/Master_Version/OpenHarmony_2.2_Beta1/20210521_142023/Master_Version-OpenHarmony_2.2_Beta1-20210521_142023-hispark_pegasus.tar.gz |
| hispark_aries版本：<br> https://hm-verify.obs.cn-north-4.myhuaweicloud.com/version/Master_Version/OpenHarmony_2.2_Beta1/20210521_142154/Master_Version-OpenHarmony_2.2_Beta1-20210521_142154-hispark_aries.tar.gz |

## OpenHarmony 2.2 beta1版本特性清单：

 状态说明：discussion(方案讨论，需求未接受)，Reject(未纳入版本)，developing(开发中)，Testing(测试中)，Accepted(已验收)

| no   | issue                                                        | feture description                                  | status  | sig                  | owner                                   |
| :--- | ------------------------------------------------------------ | :-------------------------------------------------- | :------ | :------------------- | :-------------------------------------- |
| 1    | [I3ICFO](https://gitee.com/openharmony/utils_native_lite/issues/I3ICFO) | 【分布式数据管理】提供数据库内容的删除能力          | Testing | SIG_DataManagement   | [@widecode](https://gitee.com/widecode) |
| 2    | [I3ICH0](https://gitee.com/openharmony/utils_native_lite/issues/I3ICH0) | 【分布式数据管理】提供统一的HAL文件系统操作函数实现 | Testing | SIG_DataManagement   | [@widecode](https://gitee.com/widecode) |
| 3    | [I3ICG4](https://gitee.com/openharmony/utils_native_lite/issues/I3ICG4) | 【分布式数据管理】提供相关数据存储的原子操作能力    | Testing | SIG_DataManagement   | [@widecode](https://gitee.com/widecode) |
| 4    | [I3ICGH](https://gitee.com/openharmony/utils_native_lite/issues/I3ICGH) | 【分布式数据管理】提供二进制Value的写入读取能力     | Testing | SIG_DataManagement   | [@widecode](https://gitee.com/widecode) |
| 5    | [I3NSPB](https://gitee.com/openharmony/graphic_ui/issues/I3NSPB) | 【轻量级图形】UIKit组件支持margin/padding           | Testing | SIG_GraphicsandMedia | [@niulihua](https://gitee.com/niulihua) |
| 7    | [I3NSZH](https://gitee.com/openharmony/graphic_ui/issues/I3NSZH) | 【轻量级图形】圆形/胶囊按钮支持缩放和白色蒙层动效   | Testing | SIG_GraphicsandMedia | [@niulihua](https://gitee.com/niulihua) |