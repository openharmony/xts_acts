# acts_validator

- ## 简介

  acts_validator 是lite应用工程，提供了运动表上组件及api接口测试用例

- ## 使用说明

  1. 修改`hvigor/hvigor-config.json5`文件

     ~~~
       "hvigorVersion": "4.0.5",
       "dependencies": {
         "@ohos/hvigor-ohos-plugin": "4.0.5"
       },
     ~~~

     改成

     ~~~
       "modelVersion": "5.0.0",
       "dependencies": {
       },
     ~~~

  2. 使用DevEco Studio打开工程。

  3. 配置自动签名，选择菜单项 File -> Project Structure... ，在弹出的 Project Structure 窗口中 Signing Configs 项，启用 Automatically generate signature 选项以实现签名自动生成，完成设置后，依次点击 Apply 和 OK 按钮。

  4. 构建bin包，执行 Build -> Build Hap(s)/APP(s) -> Build Hap(s) ，生成bin包。

  

- ## 约束

  DevEco版本需 5.0.3.500 ，OpenHarmony SDK 版本 API 12

​		