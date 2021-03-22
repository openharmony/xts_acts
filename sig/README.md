# SIG管理章程
## 背景
SIG（Special Intertest Group）是指特别兴趣小组，SIG在PMC项目管理委员会指导下，负责OpenHarmony社区特定子领域及创新项目的架构设计、开源开发及项目维护等工作。
本目录用于存放OpenHamony社区所有 “特别兴趣小组”（Special Interest Group，以下简称 SIG）的运作信息。

## 申请新建SIG
1. 开发者在社区中寻找2-3个有共同兴趣及目标的人，确定SIG Leader。参考[新建SIG申请](sig-template/oep_cn.md)模板，创建SIG提案。此模板参考自[KEP模板](https://github.com/kubernetes/enhancements/blob/master/keps/NNNN-kep-template/README.md)。
2. SIG Leader以[New-SIG-Proposal-XXX]为邮件标题，通过向dev@openharmony.io发送邮件，提交新建SIG申请。
3. PMC项目管理委员会批准通过后，可创建新的SIG。

## 加入已有SIG
1. 开发者可通过SIG列表查看感兴趣的SIG，通过订阅邮件列表、参与SIG会议等形式，参与对应SIG项目的技术讨论、社区维护及开源开发。

## 运营维护SIG
1. SIG Leader Fork OpenHamony/community分支，在SIG文件夹下，以新SIG名称新建文件夹，并参考[SIG模板](sig-template/)，创建对应的SIG配置文件，并提交PR合入申请。
2. SIG孵化子项目，统一存放在[OpenHarmony SIG组织](https://gitee.com/openharmony-sig)，待孵化成熟后，可合入OpenHarmony组织代码主库。
3. SIG Leader及Committer负责对应SIG的运营及维护。
4. SIG Leader定期在PMC项目管理委员会汇报SIG孵化项目及SIG运营进展，PMC基于SIG运作情况给出指导建议。

## SIG孵化项目毕业
1. SIG孵化项目成熟并满足项目毕业要求后，可申请合入OpenHarmony组织代码主库。
2. SIG Leader通过向dev@openharmony.io发送邮件，提交孵化项目毕业申请。
3. PMC项目管理委员会通过项目毕业申请后，社区接纳孵化项目合入OpenHarmony主干。

### SIG数据存放和管理方式
SIG信息记录统一归档在OpenHamony/community仓库的sig目录内，sig_xxx.md/sig_xxx_cn.md包括SIG组工作目标和范围、SIG管理的repository及描述、SIG组织会议、SIG成员；为了便于工具自动提取，其中SIG的maintainer/committer信息单独备份一份至OWNER文件内，每个SIG所维护的仓库名称列表/目录结构位于sigs.json文件中。
1. OpenHarmony/community仓的sig目录下存在一个sigs.json文件，这个文件中管理从PMC看到的所有SIG的信息。
2. sigs 由 PMC 修改和维护，新sig申请由对应的 maintainer 提交PR，经过PMC审视后合入。
3. sig 独立目录下的sig_xxx_cn.md/sig_xxx.md 为 sig 的信息展示区。其中SIG基本信息需按模板留空，新建SIG时填写完整。
4. sig 独立目录下的OWNER存放相应sig的maintainer。


###  sigs.json 文件格式
| 字段 | 说明 |
|:---|:---|
|  sig-name | SIG名称 |
|  projects| gitee仓名 |
|  project-path | OpenHarmony下的归档路径，若不涉及回合OpenHarmony填写NONE |

### sigs.json 样例
```
"sigs-List":[
      {
         "sig-name":"sig-docs",
         "projects":"https://gitee.com/openharmony-sig/docs",
         "project-path":"docs/"
      },
      {
         "sig-name ":"sig-updates",
         "projects":["https://gitee.com/openharmony/startup_appspawn_lite", "https://gitee.com/openharmony/startup_bootstrap_lite"]
         "project-path":["base/startup/appspawn_lite", "base/startup/bootstrap_lite"]
      },
   ]
}
```
