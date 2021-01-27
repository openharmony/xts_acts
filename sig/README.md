# SIG相关信息存档

## 背景

本目录用于存放 OpenHamony 社区所有 “特别兴趣小组” （Special Interest Group，以下简称 SIG）的运作信息。

-SIG信息记录统一归档在 OpenHamony/community 仓库的sig目录内，sig_xxx.md/sig_xxx_cn.md包括SIG组工作目标和范围、SIG管理的repository及描述、SIG组织会议、SIG成员；为了便于工具自动提取，其中 SIG 的 maintainer/committer 信息单独备份一份至 OWNER 文件内，每个SIG所维护的仓库名称列表/目录结构位于sigs.json文件中。

## 数据存放和管理方式

1. OpenHarmonyr/community 仓的 sig 目录下存在一个 sigs.json 文件，这个文件中管理从PMC看到的所有 SIG 的信息。
2. sigs 由 PMC 修改和维护，新sig 申请由对应的 maintainer 提交PR，经过PMC审视后合入。
3. sig 独立目录下的 sig_xxx_cn.md/sig_xxx.md 为 sig 的信息展示区。其中 SIG 基本信息需按模板留空，新建SIG时填写完整。
4. sig 独立目录下的 OWNER 存放相应sig的maintainer。


##  sigs.json 文件格式
| 字段 | 说明 |
|:---|:---|
|  sig-name | SIG名称 |
|  project-name | gitee仓名 |
|  project-path | OpenHarmony下的归档路径，弱不涉及回合OpenHarmony填写NONE |

## sigs.json 样例
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
