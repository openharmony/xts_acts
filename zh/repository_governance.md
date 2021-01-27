# SIG  管理指南

 目录

- [申请新SIG流程](#id1)
- [SIG变更批准流程](#id2)
  - [增删新项目或repository申请流程](#id2-1)
  - [变更团队成员申请流程](#id2-3)



<h2 id="id1">申请新SIG流程</h2>

说明：

所有OpenHarmony社区的SIG都必须有一个章程（Charter）来明确SIG的范围和治理规则。

+ 范围必须明确定义SIG负责指导和维护的领域
+ 治理规则必须说明SIG中的职责，以及拥有这些职责的角色和工作开展方式



具体的申请流程如下：

**1、使用SIG模板创建自己的新SIG**

将 gitee.com/openharmony/community Fork到你的Gitee下。并在sig目录下创建你的sig文件夹，以及把SIG申请模板拷贝到该文件夹下。

```
git clone https://gitee.com/YOURGITEE/community

cd ./community/sig

cp -r sig-template sig-YOURSIGNAME

cd sig-YOURSIGNAME

```

**2、完成新SIG章程的填写**

为便于更好的理解和填写[SIG申请模板](./../../../sig/sig-template/sig_template_cn.md)里的内容，建议先阅读[建议书和要求](./repository-governance.md)，完成新SIG的申请填写。

```
mv sig-template_cn.md sig_YOURSIGNAME_cn.md

mv sig-template.md sig_YOURSIGNAME.md

vi sig_YOURSIGNAME_cn.md

vi sig_YOURSIGNAME.md

```

**3、完成新SIG成员的配置**

请在OWNERS文件中完成对SIG成员的配置

```
vi OWNERS

```

**4、完成新SIG的Repository的配置**

- 如果您的项目在OpenHarmony社区新增子模块，请提交PR至[manifest仓](https://gitee.com/openharmony/manifest)，在其中按照格式把你的项目添加进来，其中PR提交中必须包含如下说明信息：
     1. 新增仓路径：xxx
     2. 新增仓库名：https://gitee.com/openharmony/xxx
     3. 新增仓库描述：为什么需要在OpenHarmony里创建一个这样的新仓，业务功能描述
     4. committer：
		      name1<email1 address> [[@gitee_id1](https://gitee.com/gitee_id1)]
		      name1<email1 address> [[@gitee_id1](https://gitee.com/gitee_id1)]
     5. docs: 如果涉及资料刷新，需要提供对应的描述链接
```
 git clone https://gitee.com/openharmony/manifest
 cd ./community
 vi ./default.xml
```

- 如果不是以上的情况，请单击[sigs.json](/sig/sigs.json)，并按照内部的格式在文件的最后把您的SIG添加进来

```
vi ../../sig/sigs.json
```

**5、在sig文件夹的sig.json内添加新SIG的相关信息**

根据以上的信息，打开sig文件夹下[sigs.json](/sig/sigs.json)文件，在末尾添加新sig的相关信息并提交PR。

```
vi ../sigs.json

```

**6、提交PR**

将以上修改提交到Gitee上，并在Gitee上创建一个Pull Request。

**7、向PMC发送邮件申请**

给技术委员会发邮件（邮箱<PMC@openharmony.io>），并在正文中包含主题“[*新SIG提案]*”和PR的链接

**8、PMC评审并反馈意见**

项目管理委员会通常会在发送申请后的一周内反馈。如果遇到假期或重要会议等因素，可能会需要更长时间。在此期间，您可以进行任何有需要的更改

**11.PMC评审通过并合入**

PMC将通过合并Pull Request的方式来批准您的申请





<h2 id="id1">SIG变更申请流程</h2>

如果您要修改SIG章程（repository_governance.md）、团队成员(OWNERS)、增删Repository(Repository)等，您需要提交SIG变更批准流程。

<h3 id="id2-1">增删新项目或repository申请流程</h3>

**1、完成新项目的Repository的配置或删除相关配置**

- 如果您的项目在OpenHarmony社区删除子模块，请至[manifest仓](https://gitee.com/openharmony/manifest)，找到待删除的repository进行删除并提交PR，提交PR需要提供如下信息。
      1. 删除仓路径：xxx
      2. 删除仓库名：https://gitee.com/openharmony/xxx
      3. 删除仓库描述：为什么需要在OpenHarmony里删除这个仓，删除后的影响是什么
 ```
  git clone https://gitee.com/openharmony/manifest
  cd ./community
  vi ./default.xml
 ```

**2、在sig文件夹的sig.yaml内添加新项目的repository信息或删除相关信息**

 根据以上的信息，打开sig文件夹下[sigs.json](/sig/sigs.json)文件，在末尾添加新sig的相关信息并提交PR。

 ```
 vi ../sigs.json

 ```

**4、提交PR**

将以上修改提交到Gitee上，并在Gitee上创建一个Pull Request。

**5、向PMC发送邮件申请**

给技术委员会发邮件（邮箱<pmc@openharmony.io>），并在正文中包含主题“[*增删repository提案]*”和PR的链接

**6、PMC评审并反馈意见**

项目管理委员会通常会在发送申请后的一周内反馈。如果遇到假期或重要会议等因素，可能会需要更长时间。在此期间，您可以进行任何有需要的更改

**7.PMC评审通过并合入**

项目管理委员会将通过合并Pull Request的方式来批准您的申请




#### 内部变更申请流程

**只影响本SIG范围内的变更**，只需要SIG内的Maintainer达成一致，请走以下流程

**1、修改SIG章程**

请在`/community/sig`文件夹下找到您的sig文件夹，完成sig文件夹内SIG章程的修改

```
vi sig-YOURSIGNAME_cn.md

vi sig-YOURSIGNAME.md

```

**2、刷新README**

请视需要，根据修改的章程同步刷新README内的“项目清单”下内容，便于大家了解

```
vi README.md
```

**3、提交PR**

将以上修改提交到Gitee上，并在Gitee上创建一个Pull Request。

**4、在SIG内部发送邮件申请**

给您所对应的sig团队的邮箱列表发邮件申请，可以在正文中包含主题“[*修改SIG章程提案]*”和PR的链接。如果之前在SIG团队内对此变更已经有讨论，可以省略该步骤

**5、SIG内部评审并给出意见**

如果您的SIG内部已经有评审意见，可以省略该步骤。

**6.PMC评审通过并合入**

SIG的Maintainer合并Pull Request来批准申请。



<h3 id="id2-2">变更团队成员申请流程</h3>

团队成员的刷新由SIG内部自己维护

**1.完成新SIG成员的配置**

请在`/community/sig`文件夹下找到您的sig文件夹，完成sig文件夹内SIG章程的修改，在OWNERS文件中完成对SIG成员的配置

```
vi OWNERS

```

**2. 提交PR**

将以上修改提交到Gitee上，并在Gitee上创建一个Pull Request。

**3. 在SIG内部发送邮件申请**

给您所对应的sig团队的邮箱列表发邮件申请，可以在正文中包含主题“[*修改SIG章程提案]*”和PR的链接。如果之前在SIG团队内对此变更已经有讨论，可以省略该步骤

**4. SIG内部评审并给出意见**

如果您的SIG内部已经有评审意见，可以省略该步骤。

**5. PMC评审通过并合入**

SIG的Maintainer合并Pull Request来批准申请。
