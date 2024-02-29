# Vulkan测试套件说明

- [介绍](#section_Vulkan_001)
- [使用说明](#section_Vulkan_002)

## 介绍<a name="section_Vulkan_001"></a>

Vulkan测试套件使用VK-GL-CTS三方库内原有的vulkancts，通过acts测试套件框架在运行时调用运行，具体目录结构如下：

```bash
.
├── BUILD.gn
├── comm.gni
├── cpVulkan.sh
├── genlocal.py
├── src
│   ├── ActsVulkanTest.cpp
│   └── ActsVulkanTest.h
│   ├── apitest
│   ├── bindingmodeltest
│   ├── clippingtest
│   ├── computetest
│   ├── conditionalrenderingtest
│   ├── descriptorindexingtest
│   ├── devicegrouptest
│   ├── drawtest
│   ├── drmformatmodifierstest
│   ├── dynamicrenderingtest
│   ├── dynamicstatetest
│   ├── fastlinkedlibrary
│   ├── fractionmandatorytests
│   ├── fragmentoperationstest
│   ├── fragmentshaderinterlocktest
│   ├── fragmentshadingratetest
│   ├── geometrytest
│   ├── glsltest
│   ├── graphicsfuzztest
│   ├── imagelessframebuffertest
│   ├── imagetest
│   ├── infotest
│   ├── mastertest
│   ├── memorymodeltest
│   ├── memorytest
│   ├── meshshadertest
│   ├── monolithic
│   ├── multiviewtest
│   ├── pipelinelibrary
│   ├── protectedmemorytest
│   ├── querypooltest
│   ├── rasterizationtest
│   ├── rayquerytest
│   ├── raytracingpipelinetest
│   ├── reconvergencetest
│   ├── renderpass2test
│   ├── renderpasstest
│   ├── robustnesstest
│   ├── sparseresourcestest
│   ├── spirvassemblytest
│   ├── ssbotest
│   ├── subgroupstest
│   ├── synchronization2test
│   ├── synchronizationtest
│   ├── tessellationtest
│   ├── testissuestest
│   ├── texturetest
│   ├── transformfeedbacktest
│   ├── ubotest
│   ├── wsitest
│   └── ycbcrtest
└── Test.json
```

* BUILD.gn：编译脚本，编译acts测试套件，编译Vulkan三方库测试代码，执行actions事件在acts测试套件对应的testcases目录下建立Vulkandata目录，然后将运行测试需要的Vulkan测试进程，解析运行日志所需的Python脚本拷贝到Vulkandata目录。
* comm.gni：通用编译配置。
* cpVulkan.sh：编译后actions事件执行的脚本。
* genlocal.py：Vulkan的test程序运行后结果会保存在task_log.log文件内，分析运行日志后会存储结果在summary_report.xml文件内，然后根据xdevice流程生成summary_report。
* src：测试套件的实现，内部直接调用Vulkan的unittest进程。
* Test.json：运行测试需要json脚本，包括拷贝内容到开发板。


## 使用说明<a name="section_Vulkan_002"></a>

* 编译运行

  ```bash
  ./build.sh --product-name rk3568 --gn-args build_xts=true --build-target "acts" --gn-args is_standard_system=true
  ```



* 测试运行：进入suites/acts目录，执行python -m xdevice，然后在命令框里输入一下命令

  ```bash
  run -l ActsVulkanApiTest,
  run -l ActsVulkanBindingmodelTest,
  run -l ActsVulkanClippingTest,
  run -l ActsVulkanComputeTest,
  run -l ActsVulkanConditionalrenderingTest,
  run -l ActsVulkanDescriptorindexingTest,
  run -l ActsVulkanDevicegroupTest,
  run -l ActsVulkanDrawTest,
  run -l ActsVulkanDrmformatmodifiersTest,
  run -l ActsVulkanDynamicrenderingTest,
  run -l ActsVulkanDynamicstateTest,
  run -l ActsVulkanFastlinkedLibraryTest,
  run -l ActsVulkanFractionmandatorytestsTest,
  run -l ActsVulkanFragmentoperationsTest,
  run -l ActsVulkanFragmentshaderinterlockTest,
  run -l ActsVulkanFragmentshadingrateTest,
  run -l ActsVulkanGeometryTest,
  run -l ActsVulkanGlslTest,
  run -l ActsVulkanGraphicsfuzzTest,
  run -l ActsVulkanImagelessframebufferTest,
  run -l ActsVulkanImageTest,
  run -l ActsVulkanInfoTest,
  run -l ActsVulkanMasterTest,
  run -l ActsVulkanMemorymodelTest,
  run -l ActsVulkanMemoryTest,
  run -l ActsVulkanMeshshaderTest,
  run -l ActsVulkanMonolithicTest,
  run -l ActsVulkanMultiviewTest,
  run -l ActsVulkanPipelineLibraryTest,
  run -l ActsVulkanProtectedmemoryTest,
  run -l ActsVulkanQuerypoolTest,
  run -l ActsVulkanRasterizationTest,
  run -l ActsVulkanRayqueryTest,
  run -l ActsVulkanRaytracingpipelineTest,
  run -l ActsVulkanReconvergenceTest,
  run -l ActsVulkanRenderpass2Test,
  run -l ActsVulkanRenderpassTest,
  run -l ActsVulkanRobustnessTest,
  run -l ActsVulkanSparseresourcesTest,
  run -l ActsVulkanSpirvassemblyTest,
  run -l ActsVulkanSsboTest,
  run -l ActsVulkanSubgroupsTest,
  run -l ActsVulkanSynchronization2Test,
  run -l ActsVulkanSynchronizationTest,
  run -l ActsVulkanTessellationTest,
  run -l ActsVulkanTestissuesTest,
  run -l ActsVulkanTextureTest,
  run -l ActsVulkanTransformfeedbackTest,
  run -l ActsVulkanUboTest,
  run -l ActsVulkanWsiTest,
  run -l ActsVulkanYcbcrTest
  ```


