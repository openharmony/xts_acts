# SIG管理章程
## 背景
SIG（Special Intertest Group）是指特别兴趣小组，SIG在PMC项目管理委员会指导下，负责OpenHarmony社区特定子领域的架构设计、开源开发及项目维护等工作。
本目录用于存放OpenHamony社区所有 “特别兴趣小组”（Special Interest Group，以下简称 SIG）的运作信息。

## 申请新SIG
1. 请参考[新建SIG申请模板](sig-template/sig_template_cn.md)提交申请。
   Fork OpenHamony/community到你的Gitee下，并在sig目录下创建你的sig申请文件。
2. 开发者通过向dev@openharmony.io发送新建SIG Proposal邮件申请，经PMC项目管理委员会审核后可创建新SIG。


### SIG数据存放和管理方式
SIG信息记录统一归档在OpenHamony/community仓库的sig目录内，sig_xxx.md/sig_xxx_cn.md包括SIG组工作目标和范围、SIG管理的repository及描述、SIG组织会议、SIG成员；为了便于工具自动提取，其中SIG的maintainer/committer信息单独备份一份至OWNER文件内，每个SIG所维护的仓库名称列表/目录结构位于sigs.json文件中。
1. OpenHarmonyr/community仓的sig目录下存在一个sigs.json文件，这个文件中管理从PMC看到的所有SIG的信息。
2. sigs 由 PMC 修改和维护，新sig申请由对应的 maintainer 提交PR，经过PMC审视后合入。
3. sig 独立目录下的sig_xxx_cn.md/sig_xxx.md 为 sig 的信息展示区。其中SIG基本信息需按模板留空，新建SIG时填写完整。
4. sig 独立目录下的OWNER存放相应sig的maintainer。


###  sigs.json 文件格式
| 字段 | 说明 |
|:---|:---|
|  sig-name | SIG名称 |
|  project-name | gitee仓名 |
|  project-path | OpenHarmony下的归档路径，若不涉及回合OpenHarmony填写NONE |

### sigs.json 样例
```
 {
    "sigs-List":[
       {
          "sig-name":"sig-docs",
          "project-name":"docs",
          "project-path":"docs/"
       },
       {
          "sig-name ":"sig-updates",
          "project-name":"updates",
          "project-path":"base/updates/"
       },
    ]
 }
```
