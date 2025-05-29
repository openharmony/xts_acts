# GLTest测试套件说明

- [介绍](#section_gltest_001)
- [使用说明](#section_gltest_002)

## 介绍<a name="section_gltest_001"></a>

gltest测试套件使用VK-GL-CTS三方库内原有的openglcts，通过acts测试套件框架在运行时调用运行，具体目录结构如下：

```bash
.
├── BUILD.gn
├── README_zh.md
├── Test.json
├── comm.gni
├── cpOpenGL.sh
├── genlocal.py
└── src
    ├── common.h
    ├── egltest
    │   ├── egltest_323x
    │   │   ├── ActsOpenGlEgl323xTest.cpp
    │   │   ├── ActsOpenGlEgl323xTest.h
    │   │   ├── BUILD.gn
    │   │   └── Test.json
    │   ├── egltest_324x
    │   │   ├── ActsOpenGlEgl324xTest.cpp
    │   │   ├── ActsOpenGlEgl324xTest.h
    │   │   ├── BUILD.gn
    │   │   └── Test.json
    │   ├── egltest_325x
    │   │   ├── ActsOpenGlEgl325xTest.cpp
    │   │   ├── ActsOpenGlEgl325xTest.h
    │   │   ├── BUILD.gn
    │   │   └── Test.json
    │   ├── egltest_326x
    │   │   ├── ActsOpenGlEgl326xTest.cpp
    │   │   ├── ActsOpenGlEgl326xTest.h
    │   │   ├── BUILD.gn
    │   │   └── Test.json
    │   ├── egltest_main
    │   │   ├── ActsOpenGlEglMainTest.cpp
    │   │   ├── ActsOpenGlEglMainTest.h
    │   │   ├── BUILD.gn
    │   │   └── Test.json
    │   └── egltest_master
    │       ├── ActsOpenGlEglMasterTest.cpp
    │       ├── ActsOpenGlEglMasterTest.h
    │       ├── BUILD.gn
    │       └── Test.json
    └── gltest
        ├── gltest_am
        │   ├── gltest_461x
        │   │   ├── gl45es31Master
        │   │   │   ├── ActsOpenGl461xGl45Es31MasterTest.cpp
        │   │   │   ├── ActsOpenGl461xGl45Es31MasterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl45es3Master
        │   │   │   ├── ActsOpenGl461xGl45Es3MasterTest.cpp
        │   │   │   ├── ActsOpenGl461xGl45Es3MasterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   └── gl45Master
        │   │       ├── ActsOpenGLAm461xGl45MasterTest.cpp
        │   │       ├── ActsOpenGLAm461xGl45MasterTest.h
        │   │       ├── BUILD.gn
        │   │       └── Test.json
        │   └── gltest_main
        │       ├── gl45es31Master
        │       │   ├── ActsOpenGlMainGl45Es31MasterTest.cpp
        │       │   ├── ActsOpenGlMainGl45Es31MasterTest.h
        │       │   ├── BUILD.gn
        │       │   └── Test.json
        │       ├── gl45es3Master
        │       │   ├── ActsOpenGlMainGl45Es3MasterTest.cpp
        │       │   ├── ActsOpenGlMainGl45Es3MasterTest.h
        │       │   ├── BUILD.gn
        │       │   └── Test.json
        │       └── gl45Master
        │           ├── ActsOpenGlAmMainGl45MasterTest.cpp
        │           ├── ActsOpenGlAmMainGl45MasterTest.h
        │           ├── BUILD.gn
        │           └── Test.json
        ├── gltest_km
        │   ├── gltest_460x
        │   │   ├── gl30gtfMaster
        │   │   │   ├── ActsOpenGl460xGl30GtfMasterTest.cpp
        │   │   │   ├── ActsOpenGl460xGl30GtfMasterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl30Master
        │   │   │   ├── ActsOpenGl460xGl30MasterTest.cpp
        │   │   │   ├── ActsOpenGl460xGl30MasterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl31gtfMaster
        │   │   │   ├── ActsOpenGl460xGl31GtfMasterTest.cpp
        │   │   │   ├── ActsOpenGl460xGl31GtfMasterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl31Master
        │   │   │   ├── ActsOpenGl460xGl31MasterTest.cpp
        │   │   │   ├── ActsOpenGl460xGl31MasterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl32gtfMaster
        │   │   │   ├── ActsOpenGl460xGl32GtfMasterTest.cpp
        │   │   │   ├── ActsOpenGl460xGl32GtfMasterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl32Master
        │   │   │   ├── ActsOpenGl460xGl32MasterTest.cpp
        │   │   │   ├── ActsOpenGl460xGl32MasterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl33gtfMaster
        │   │   │   ├── ActsOpenGl460xGl33GtfMasterTest.cpp
        │   │   │   ├── ActsOpenGl460xGl33GtfMasterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl33Master
        │   │   │   ├── ActsOpenGl460xGl33MasterTest.cpp
        │   │   │   ├── ActsOpenGl460xGl33MasterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl40gtfMaster
        │   │   │   ├── ActsOpenGl460xGl40GtfMasterTest.cpp
        │   │   │   ├── ActsOpenGl460xGl40GtfMasterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl40Master
        │   │   │   ├── ActsOpenGl460xGl40MasterTest.cpp
        │   │   │   ├── ActsOpenGl460xGl40MasterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl41gtfMaster
        │   │   │   ├── ActsOpenGl460xGl41GtfMasterTest.cpp
        │   │   │   ├── ActsOpenGl460xGl41GtfMasterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl41Master
        │   │   │   ├── ActsOpenGl460xGl41MasterTest.cpp
        │   │   │   ├── ActsOpenGl460xGl41MasterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl42compatMaster
        │   │   │   ├── ActsOpenGl460xGl42CompatMasterTest.cpp
        │   │   │   ├── ActsOpenGl460xGl42CompatMasterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl42gtfMaster
        │   │   │   ├── ActsOpenGl460xGl42GtfMasterTest.cpp
        │   │   │   ├── ActsOpenGl460xGl42GtfMasterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl42Master
        │   │   │   ├── ActsOpenGl460xGl42MasterTest.cpp
        │   │   │   ├── ActsOpenGl460xGl42MasterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl43gtfMaster
        │   │   │   ├── ActsOpenGl460xGl43GtfMasterTest.cpp
        │   │   │   ├── ActsOpenGl460xGl43GtfMasterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl43Master
        │   │   │   ├── ActsOpenGl460xGl43MasterTest.cpp
        │   │   │   ├── ActsOpenGl460xGl43MasterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl44gtfMaster
        │   │   │   ├── ActsOpenGl460xGl44GtfMasterTest.cpp
        │   │   │   ├── ActsOpenGl460xGl44GtfMasterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl44Master
        │   │   │   ├── ActsOpenGl460xGl44MasterTest.cpp
        │   │   │   ├── ActsOpenGl460xGl44MasterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl45gtfMaster
        │   │   │   ├── ActsOpenGl460xGl45GtfMasterTest.cpp
        │   │   │   ├── ActsOpenGl460xGl45GtfMasterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl45Master
        │   │   │   ├── ActsOpenGl460xGl45MasterTest.cpp
        │   │   │   ├── ActsOpenGl460xGl45MasterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl46gtfMaster
        │   │   │   ├── ActsOpenGl460xGl46GtfMasterTest.cpp
        │   │   │   ├── ActsOpenGl460xGl46GtfMasterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   └── gl46Master
        │   │       ├── ActsOpenGl460xGl46MasterTest.cpp
        │   │       ├── ActsOpenGl460xGl46MasterTest.h
        │   │       ├── BUILD.gn
        │   │       └── Test.json
        │   ├── gltest_461x
        │   │   ├── gl30gtfMaster
        │   │   │   ├── ActsOpenGl461xGl30GtfMasterTest.cpp
        │   │   │   ├── ActsOpenGl461xGl30GtfMasterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl30Master
        │   │   │   ├── ActsOpenGl461xGl30MasterTest.cpp
        │   │   │   ├── ActsOpenGl461xGl30MasterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl31gtfMaster
        │   │   │   ├── ActsOpenGl461xGl31GtfMasterTest.cpp
        │   │   │   ├── ActsOpenGl461xGl31GtfMasterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl31Master
        │   │   │   ├── ActsOpenGl461xGl31MasterTest.cpp
        │   │   │   ├── ActsOpenGl461xGl31MasterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl32gtfMaster
        │   │   │   ├── ActsOpenGl461xGl32GtfMasterTest.cpp
        │   │   │   ├── ActsOpenGl461xGl32GtfMasterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl32Master
        │   │   │   ├── ActsOpenGl461xGl32MasterTest.cpp
        │   │   │   ├── ActsOpenGl461xGl32MasterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl33gtfMaster
        │   │   │   ├── ActsOpenGl461xGl33GtfMasterTest.cpp
        │   │   │   ├── ActsOpenGl461xGl33GtfMasterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl33Master
        │   │   │   ├── ActsOpenGl461xGl33MasterTest.cpp
        │   │   │   ├── ActsOpenGl461xGl33MasterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl40gtfMaster
        │   │   │   ├── ActsOpenGl461xGl40GtfMasterTest.cpp
        │   │   │   ├── ActsOpenGl461xGl40GtfMasterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl40Master
        │   │   │   ├── ActsOpenGl461xGl40MasterTest.cpp
        │   │   │   ├── ActsOpenGl461xGl40MasterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl41gtfMaster
        │   │   │   ├── ActsOpenGl461xGl41GtfMasterTest.cpp
        │   │   │   ├── ActsOpenGl461xGl41GtfMasterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl41mMaster
        │   │   │   ├── ActsOpenGl461xGl41MasterTest.cpp
        │   │   │   ├── ActsOpenGl461xGl41MasterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl42compatMaster
        │   │   │   ├── ActsOpenGl461xGl42CompatMasterTest.cpp
        │   │   │   ├── ActsOpenGl461xGl42CompatMasterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl42gtfMaster
        │   │   │   ├── ActsOpenGl461xGl42GtfMasterTest.cpp
        │   │   │   ├── ActsOpenGl461xGl42GtfMasterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl42Master
        │   │   │   ├── ActsOpenGl461xGl42MasterTest.cpp
        │   │   │   ├── ActsOpenGl461xGl42MasterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl43gtfMaster
        │   │   │   ├── ActsOpenGl461xGl43GtfMasterTest.cpp
        │   │   │   ├── ActsOpenGl461xGl43GtfMasterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl43Master
        │   │   │   ├── ActsOpenGl461xGl43MasterTest.cpp
        │   │   │   ├── ActsOpenGl461xGl43MasterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl44gtfMaster
        │   │   │   ├── ActsOpenGl461xGl44GtfMasterTest.cpp
        │   │   │   ├── ActsOpenGl461xGl44GtfMasterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl44Master
        │   │   │   ├── ActsOpenGl461xGl44MasterTest.cpp
        │   │   │   ├── ActsOpenGl461xGl44MasterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl45gtfMaster
        │   │   │   ├── ActsOpenGl461xGl45GtfMasterTest.cpp
        │   │   │   ├── ActsOpenGl461xGl45GtfMasterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl45Master
        │   │   │   ├── ActsOpenGl461xGl45MasterTest.cpp
        │   │   │   ├── ActsOpenGl461xGl45MasterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl46gtfMaster
        │   │   │   ├── ActsOpenGl461xGl46GtfMasterTest.cpp
        │   │   │   ├── ActsOpenGl461xGl46GtfMasterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   └── gl46Master
        │   │       ├── ActsOpenGl461xGl46MasterTest.cpp
        │   │       ├── ActsOpenGl461xGl46MasterTest.h
        │   │       ├── BUILD.gn
        │   │       └── Test.json
        │   └── gltest_main
        │       ├── gl30gtfMaster
        │       │   ├── ActsOpenGlMainGl30GtfMasterTest.cpp
        │       │   ├── ActsOpenGlMainGl30GtfMasterTest.h
        │       │   ├── BUILD.gn
        │       │   └── Test.json
        │       ├── gl30mMster
        │       │   ├── ActsOpenGlMainGl30MasterTest.cpp
        │       │   ├── ActsOpenGlMainGl30MasterTest.h
        │       │   ├── BUILD.gn
        │       │   └── Test.json
        │       ├── gl31gtfMaster
        │       │   ├── ActsOpenGlMainGl31GtfMasterTest.cpp
        │       │   ├── ActsOpenGlMainGl31GtfMasterTest.h
        │       │   ├── BUILD.gn
        │       │   └── Test.json
        │       ├── gl31Master
        │       │   ├── ActsOpenGlMainGl31MasterTest.cpp
        │       │   ├── ActsOpenGlMainGl31MasterTest.h
        │       │   ├── BUILD.gn
        │       │   └── Test.json
        │       ├── gl32gtfMaster
        │       │   ├── ActsOpenGlMainGl32GtfMasterTest.cpp
        │       │   ├── ActsOpenGlMainGl32GtfMasterTest.h
        │       │   ├── BUILD.gn
        │       │   └── Test.json
        │       ├── gl32Master
        │       │   ├── ActsOpenGlMainGl32MasterTest.cpp
        │       │   ├── ActsOpenGlMainGl32MasterTest.h
        │       │   ├── BUILD.gn
        │       │   └── Test.json
        │       ├── gl33gtfMaster
        │       │   ├── ActsOpenGlMainGl33GtfMasterTest.cpp
        │       │   ├── ActsOpenGlMainGl33GtfMasterTest.h
        │       │   ├── BUILD.gn
        │       │   └── Test.json
        │       ├── gl33Master
        │       │   ├── ActsOpenGlMainGl33MasterTest.cpp
        │       │   ├── ActsOpenGlMainGl33MasterTest.h
        │       │   ├── BUILD.gn
        │       │   └── Test.json
        │       ├── gl40gtfMaster
        │       │   ├── ActsOpenGlMainGl40GtfMasterTest.cpp
        │       │   ├── ActsOpenGlMainGl40GtfMasterTest.h
        │       │   ├── BUILD.gn
        │       │   └── Test.json
        │       ├── gl40Master
        │       │   ├── ActsOpenGlMainGl40MasterTest.cpp
        │       │   ├── ActsOpenGlMainGl40MasterTest.h
        │       │   ├── BUILD.gn
        │       │   └── Test.json
        │       ├── gl41gtfMaster
        │       │   ├── ActsOpenGlMainGl41GtfMasterTest.cpp
        │       │   ├── ActsOpenGlMainGl41GtfMasterTest.h
        │       │   ├── BUILD.gn
        │       │   └── Test.json
        │       ├── gl41Master
        │       │   ├── ActsOpenGlMainGl41MasterTest.cpp
        │       │   ├── ActsOpenGlMainGl41MasterTest.h
        │       │   ├── BUILD.gn
        │       │   └── Test.json
        │       ├── gl42compatMaster
        │       │   ├── ActsOpenGlMainGl42CompatMasterTest.cpp
        │       │   ├── ActsOpenGlMainGl42CompatMasterTest.h
        │       │   ├── BUILD.gn
        │       │   └── Test.json
        │       ├── gl42gtfMaster
        │       │   ├── ActsOpenGlMainGl42GtfMasterTest.cpp
        │       │   ├── ActsOpenGlMainGl42GtfMasterTest.h
        │       │   ├── BUILD.gn
        │       │   └── Test.json
        │       ├── gl42Master
        │       │   ├── ActsOpenGlMainGl42MasterTest.cpp
        │       │   ├── ActsOpenGlMainGl42MasterTest.h
        │       │   ├── BUILD.gn
        │       │   └── Test.json
        │       ├── gl43gtfMaster
        │       │   ├── ActsOpenGlMainGl43GtfMasterTest.cpp
        │       │   ├── ActsOpenGlMainGl43GtfMasterTest.h
        │       │   ├── BUILD.gn
        │       │   └── Test.json
        │       ├── gl43Master
        │       │   ├── ActsOpenGlMainGl43MasterTest.cpp
        │       │   ├── ActsOpenGlMainGl43MasterTest.h
        │       │   ├── BUILD.gn
        │       │   └── Test.json
        │       ├── gl44gtfMaster
        │       │   ├── ActsOpenGlMainGl44GtfMasterTest.cpp
        │       │   ├── ActsOpenGlMainGl44GtfMasterTest.h
        │       │   ├── BUILD.gn
        │       │   └── Test.json
        │       ├── gl44Master
        │       │   ├── ActsOpenGlMainGl44MasterTest.cpp
        │       │   ├── ActsOpenGlMainGl44MasterTest.h
        │       │   ├── BUILD.gn
        │       │   └── Test.json
        │       ├── gl45gtfMaster
        │       │   ├── ActsOpenGlMainGl45GtfMasterTest.cpp
        │       │   ├── ActsOpenGlMainGl45GtfMasterTest.h
        │       │   ├── BUILD.gn
        │       │   └── Test.json
        │       ├── gl45Master
        │       │   ├── ActsOpenGlMainGl45MasterTest.cpp
        │       │   ├── ActsOpenGlMainGl45MasterTest.h
        │       │   ├── BUILD.gn
        │       │   └── Test.json
        │       ├── gl46gtfMaster
        │       │   ├── ActsOpenGlMainGl46GtfMasterTest.cpp
        │       │   ├── ActsOpenGlMainGl46GtfMasterTest.h
        │       │   ├── BUILD.gn
        │       │   └── Test.json
        │       └── gl46Master
        │           ├── ActsOpenGlMainGl46MasterTest.cpp
        │           ├── ActsOpenGlMainGl46MasterTest.h
        │           ├── BUILD.gn
        │           └── Test.json
        ├── gltest_kmn
        │   ├── gltest_455x
        │   │   ├── ActsOpenGl455xGl40KhrMasterTest.cpp
        │   │   ├── ActsOpenGl455xGl40KhrMasterTest.h
        │   │   ├── BUILD.gn
        │   │   └── Test.json
        │   ├── gltest_460x
        │   │   ├── gl30khrMaster
        │   │   │   ├── ActsOpenGl460xGl30KhrMasterTest.cpp
        │   │   │   ├── ActsOpenGl460xGl30KhrMasterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl40khrMaster
        │   │   │   ├── ActsOpenGl460xGl40KhrMasterTest.cpp
        │   │   │   ├── ActsOpenGl460xGl40KhrMasterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl43khrMaster
        │   │   │   ├── ActsOpenGl460xGl43KhrMasterTest.cpp
        │   │   │   ├── ActsOpenGl460xGl43KhrMasterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   └── gl45khrMaster
        │   │       ├── ActsOpenGl460xGl45KhrMasterTest.cpp
        │   │       ├── ActsOpenGl460xGl45KhrMasterTest.h
        │   │       ├── BUILD.gn
        │   │       └── Test.json
        │   ├── gltest_461x
        │   │   ├── gl30khrMaster
        │   │   │   ├── ActsOpenGl461xGl30KhrMasterTest.cpp
        │   │   │   ├── ActsOpenGl461xGl30KhrMasterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl40khrMaster
        │   │   │   ├── ActsOpenGl461xGl40KhrMasterTest.cpp
        │   │   │   ├── ActsOpenGl461xGl40KhrMasterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl43khrMaster
        │   │   │   ├── ActsOpenGl461xGl43KhrMasterTest.cpp
        │   │   │   ├── ActsOpenGl461xGl43KhrMasterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   └── gl45khrMaster
        │   │       ├── ActsOpenGl461xGl45KhrMasterTest.cpp
        │   │       ├── ActsOpenGl461xGl45KhrMasterTest.h
        │   │       ├── BUILD.gn
        │   │       └── Test.json
        │   └── gltest_main
        │       ├── gl30khrMaster
        │       │   ├── ActsOpenGlMainGl30KhrMasterTest.cpp
        │       │   ├── ActsOpenGlMainGl30KhrMasterTest.h
        │       │   ├── BUILD.gn
        │       │   └── Test.json
        │       ├── gl40khrMaster
        │       │   ├── ActsOpenGlMainGl40KhrMasterTest.cpp
        │       │   ├── ActsOpenGlMainGl40KhrMasterTest.h
        │       │   ├── BUILD.gn
        │       │   └── Test.json
        │       ├── gl43khrmMaster
        │       │   ├── ActsOpenGlMainGl43KhrMasterTest.cpp
        │       │   ├── ActsOpenGlMainGl43KhrMasterTest.h
        │       │   ├── BUILD.gn
        │       │   └── Test.json
        │       └── gl45khrMaster
        │           ├── ActsOpenGlMainGl45KhrMasterTest.cpp
        │           ├── ActsOpenGlMainGl45KhrMasterTest.h
        │           ├── BUILD.gn
        │           └── Test.json
        └── gltest_kms
            ├── gltest_461x
            │   ├── gl43khrsingle
            │   │   ├── ActsOpenGl461xGl43KhrSingleTest.cpp
            │   │   ├── ActsOpenGl461xGl43KhrSingleTest.h
            │   │   ├── BUILD.gn
            │   │   └── Test.json
            │   ├── gl44khrsingle
            │   │   ├── ActsOpenGl461xGl44KhrSingleTest.cpp
            │   │   ├── ActsOpenGl461xGl44KhrSingleTest.h
            │   │   ├── BUILD.gn
            │   │   └── Test.json
            │   ├── gl45khrsingle
            │   │   ├── ActsOpenGl461xGl45KhrSingleTest.cpp
            │   │   ├── ActsOpenGl461xGl45KhrSingleTest.h
            │   │   ├── BUILD.gn
            │   │   └── Test.json
            │   └── gl46khrsingle
            │       ├── ActsOpenGl461xGl46KhrSingleTest.cpp
            │       ├── ActsOpenGl461xGl46KhrSingleTest.h
            │       ├── BUILD.gn
            │       └── Test.json
            └── gltest_main
                ├── gl43khrsingle
                │   ├── ActsOpenGlMainGl43KhrSingleTest.cpp
                │   ├── ActsOpenGlMainGl43KhrSingleTest.h
                │   ├── BUILD.gn
                │   └── Test.json
                ├── gl44khrsingle
                │   ├── ActsOpenGlMainGl44KhrSingleTest.cpp
                │   ├── ActsOpenGlMainGl44KhrSingleTest.h
                │   ├── BUILD.gn
                │   └── Test.json
                ├── gl45khrsingle
                │   ├── ActsOpenGlMainGl45KhrSingleTest.cpp
                │   ├── ActsOpenGlMainGl45KhrSingleTest.h
                │   ├── BUILD.gn
                │   └── Test.json
                └── gl46khrsingle
                    ├── ActsOpenGlMainGl46KhrSingleTest.cpp
                    ├── ActsOpenGlMainGl46KhrSingleTest.h
                    ├── BUILD.gn
                    └── Test.json
```

* BUILD.gn：编译脚本，编译acts测试套件，编译gltest三方库测试代码，执行actions事件在acts测试套件对应的testcases目录下建立opengldata目录，然后将运行测试需要的gltest测试进程，解析运行日志所需的Python脚本拷贝到opengldata目录。
* comm.gni：通用编译配置。
* cpOpenGL.sh：编译后actions事件执行的脚本。
* genlocal.py：gltest的test程序运行后结果会保存在task_log.log文件内，分析运行日志后会存储结果在summary_report.xml文件内，然后根据xdevice流程生成summary_report。
* src：测试套件的实现，内部直接调用gltest的unittest进程。
* Test.json：运行测试需要json脚本，包括拷贝内容到开发板。


## 使用说明<a name="section_gltest_002"></a>

* 编译运行

  ```bash
  ./build.sh --product-name rk3568 --gn-args build_xts=true --build-target "acts" --gn-args is_standard_system=true
  ```

* 测试运行：进入suites/acts目录，执行python -m xdevice，然后在命令框里输入一下命令

  ```bash
  run -l ActsOpenGlEgl323xTest,
  run -l ActsOpenGlMainGl32MasterTest,
  run -l ActsOpenGlMainGl42MasterTest
  ...

* gltest测试套件运行结束会生成qpa文件方便开发人员调试，qpa文件可以通过vk-gl-cts/scripts/log内的脚本进行解析，具体命令如下：

  ```bash
  python2 log_to_xml.py TestResults.qpa TestResults.xml
  ```
