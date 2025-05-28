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
    │   │   ├── ActsOpenGL_egl_323xTest.cpp
    │   │   ├── ActsOpenGL_egl_323xTest.h
    │   │   ├── BUILD.gn
    │   │   └── Test.json
    │   ├── egltest_324x
    │   │   ├── ActsOpenGL_egl_324xTest.cpp
    │   │   ├── ActsOpenGL_egl_324xTest.h
    │   │   ├── BUILD.gn
    │   │   └── Test.json
    │   ├── egltest_325x
    │   │   ├── ActsOpenGL_egl_325xTest.cpp
    │   │   ├── ActsOpenGL_egl_325xTest.h
    │   │   ├── BUILD.gn
    │   │   └── Test.json
    │   ├── egltest_326x
    │   │   ├── ActsOpenGL_egl_326xTest.cpp
    │   │   ├── ActsOpenGL_egl_326xTest.h
    │   │   ├── BUILD.gn
    │   │   └── Test.json
    │   ├── egltest_main
    │   │   ├── ActsOpenGL_egl_mainTest.cpp
    │   │   ├── ActsOpenGL_egl_mainTest.h
    │   │   ├── BUILD.gn
    │   │   └── Test.json
    │   └── egltest_master
    │       ├── ActsOpenGL_egl_masterTest.cpp
    │       ├── ActsOpenGL_egl_masterTest.h
    │       ├── BUILD.gn
    │       └── Test.json
    └── gltest
        ├── gltest_am
        │   ├── gltest_461x
        │   │   ├── gl45es31master
        │   │   │   ├── ActsOpenGL_461x_gl45_es31_masterTest.cpp
        │   │   │   ├── ActsOpenGL_461x_gl45_es31_masterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl45es3master
        │   │   │   ├── ActsOpenGL_461x_gl45_es3_masterTest.cpp
        │   │   │   ├── ActsOpenGL_461x_gl45_es3_masterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   └── gl45master
        │   │       ├── ActsOpenGL_461x_gl45_masterTest.cpp
        │   │       ├── ActsOpenGL_461x_gl45_masterTest.h
        │   │       ├── BUILD.gn
        │   │       └── Test.json
        │   └── gltest_main
        │       ├── gl45es31master
        │       │   ├── ActsOpenGL_main_gl45_es31_masterTest.cpp
        │       │   ├── ActsOpenGL_main_gl45_es31_masterTest.h
        │       │   ├── BUILD.gn
        │       │   └── Test.json
        │       ├── gl45es3master
        │       │   ├── ActsOpenGL_main_gl45_es3_masterTest.cpp
        │       │   ├── ActsOpenGL_main_gl45_es3_masterTest.h
        │       │   ├── BUILD.gn
        │       │   └── Test.json
        │       └── gl45master
        │           ├── ActsOpenGL_main_gl45_masterTest.cpp
        │           ├── ActsOpenGL_main_gl45_masterTest.h
        │           ├── BUILD.gn
        │           └── Test.json
        ├── gltest_km
        │   ├── gltest_460x
        │   │   ├── gl30gtfmaster
        │   │   │   ├── ActsOpenGL_460x_gl30_gtf_masterTest.cpp
        │   │   │   ├── ActsOpenGL_460x_gl30_gtf_masterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl30master
        │   │   │   ├── ActsOpenGL_460x_gl30_masterTest.cpp
        │   │   │   ├── ActsOpenGL_460x_gl30_masterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl31gtfmaster
        │   │   │   ├── ActsOpenGL_460x_gl31_gtf_masterTest.cpp
        │   │   │   ├── ActsOpenGL_460x_gl31_gtf_masterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl31master
        │   │   │   ├── ActsOpenGL_460x_gl31_masterTest.cpp
        │   │   │   ├── ActsOpenGL_460x_gl31_masterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl32gtfmaster
        │   │   │   ├── ActsOpenGL_460x_gl32_gtf_masterTest.cpp
        │   │   │   ├── ActsOpenGL_460x_gl32_gtf_masterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl32master
        │   │   │   ├── ActsOpenGL_460x_gl32_masterTest.cpp
        │   │   │   ├── ActsOpenGL_460x_gl32_masterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl33gtfmaster
        │   │   │   ├── ActsOpenGL_460x_gl33_gtf_masterTest.cpp
        │   │   │   ├── ActsOpenGL_460x_gl33_gtf_masterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl33master
        │   │   │   ├── ActsOpenGL_460x_gl33_masterTest.cpp
        │   │   │   ├── ActsOpenGL_460x_gl33_masterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl40gtfmaster
        │   │   │   ├── ActsOpenGL_460x_gl40_gtf_masterTest.cpp
        │   │   │   ├── ActsOpenGL_460x_gl40_gtf_masterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl40master
        │   │   │   ├── ActsOpenGL_460x_gl40_masterTest.cpp
        │   │   │   ├── ActsOpenGL_460x_gl40_masterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl41gtfmaster
        │   │   │   ├── ActsOpenGL_460x_gl41_gtf_masterTest.cpp
        │   │   │   ├── ActsOpenGL_460x_gl41_gtf_masterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl41master
        │   │   │   ├── ActsOpenGL_460x_gl41_masterTest.cpp
        │   │   │   ├── ActsOpenGL_460x_gl41_masterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl42compatmaster
        │   │   │   ├── ActsOpenGL_460x_gl42_compat_masterTest.cpp
        │   │   │   ├── ActsOpenGL_460x_gl42_compat_masterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl42gtfmaster
        │   │   │   ├── ActsOpenGL_460x_gl42_gtf_masterTest.cpp
        │   │   │   ├── ActsOpenGL_460x_gl42_gtf_masterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl42master
        │   │   │   ├── ActsOpenGL_460x_gl42_masterTest.cpp
        │   │   │   ├── ActsOpenGL_460x_gl42_masterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl43gtfmaster
        │   │   │   ├── ActsOpenGL_460x_gl43_gtf_masterTest.cpp
        │   │   │   ├── ActsOpenGL_460x_gl43_gtf_masterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl43master
        │   │   │   ├── ActsOpenGL_460x_gl43_masterTest.cpp
        │   │   │   ├── ActsOpenGL_460x_gl43_masterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl44gtfmaster
        │   │   │   ├── ActsOpenGL_460x_gl44_gtf_masterTest.cpp
        │   │   │   ├── ActsOpenGL_460x_gl44_gtf_masterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl44master
        │   │   │   ├── ActsOpenGL_460x_gl44_masterTest.cpp
        │   │   │   ├── ActsOpenGL_460x_gl44_masterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl45gtfmaster
        │   │   │   ├── ActsOpenGL_460x_gl45_gtf_masterTest.cpp
        │   │   │   ├── ActsOpenGL_460x_gl45_gtf_masterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl45master
        │   │   │   ├── ActsOpenGL_460x_gl45_masterTest.cpp
        │   │   │   ├── ActsOpenGL_460x_gl45_masterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl46gtfmaster
        │   │   │   ├── ActsOpenGL_460x_gl46_gtf_masterTest.cpp
        │   │   │   ├── ActsOpenGL_460x_gl46_gtf_masterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   └── gl46master
        │   │       ├── ActsOpenGL_460x_gl46_masterTest.cpp
        │   │       ├── ActsOpenGL_460x_gl46_masterTest.h
        │   │       ├── BUILD.gn
        │   │       └── Test.json
        │   ├── gltest_461x
        │   │   ├── gl30gtfmaster
        │   │   │   ├── ActsOpenGL_461x_gl30_gtf_masterTest.cpp
        │   │   │   ├── ActsOpenGL_461x_gl30_gtf_masterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl30master
        │   │   │   ├── ActsOpenGL_461x_gl30_masterTest.cpp
        │   │   │   ├── ActsOpenGL_461x_gl30_masterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl31gtfmaster
        │   │   │   ├── ActsOpenGL_461x_gl31_gtf_masterTest.cpp
        │   │   │   ├── ActsOpenGL_461x_gl31_gtf_masterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl31master
        │   │   │   ├── ActsOpenGL_461x_gl31_masterTest.cpp
        │   │   │   ├── ActsOpenGL_461x_gl31_masterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl32gtfmaster
        │   │   │   ├── ActsOpenGL_461x_gl32_gtf_masterTest.cpp
        │   │   │   ├── ActsOpenGL_461x_gl32_gtf_masterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl32master
        │   │   │   ├── ActsOpenGL_461x_gl32_masterTest.cpp
        │   │   │   ├── ActsOpenGL_461x_gl32_masterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl33gtfmaster
        │   │   │   ├── ActsOpenGL_461x_gl33_gtf_masterTest.cpp
        │   │   │   ├── ActsOpenGL_461x_gl33_gtf_masterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl33master
        │   │   │   ├── ActsOpenGL_461x_gl33_masterTest.cpp
        │   │   │   ├── ActsOpenGL_461x_gl33_masterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl40gtfmaster
        │   │   │   ├── ActsOpenGL_461x_gl40_gtf_masterTest.cpp
        │   │   │   ├── ActsOpenGL_461x_gl40_gtf_masterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl40master
        │   │   │   ├── ActsOpenGL_461x_gl40_masterTest.cpp
        │   │   │   ├── ActsOpenGL_461x_gl40_masterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl41gtfmaster
        │   │   │   ├── ActsOpenGL_461x_gl41_gtf_masterTest.cpp
        │   │   │   ├── ActsOpenGL_461x_gl41_gtf_masterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl41master
        │   │   │   ├── ActsOpenGL_461x_gl41_masterTest.cpp
        │   │   │   ├── ActsOpenGL_461x_gl41_masterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl42compatmaster
        │   │   │   ├── ActsOpenGL_461x_gl42_compat_masterTest.cpp
        │   │   │   ├── ActsOpenGL_461x_gl42_compat_masterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl42gtfmaster
        │   │   │   ├── ActsOpenGL_461x_gl42_gtf_masterTest.cpp
        │   │   │   ├── ActsOpenGL_461x_gl42_gtf_masterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl42master
        │   │   │   ├── ActsOpenGL_461x_gl42_masterTest.cpp
        │   │   │   ├── ActsOpenGL_461x_gl42_masterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl43gtfmaster
        │   │   │   ├── ActsOpenGL_461x_gl43_gtf_masterTest.cpp
        │   │   │   ├── ActsOpenGL_461x_gl43_gtf_masterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl43master
        │   │   │   ├── ActsOpenGL_461x_gl43_masterTest.cpp
        │   │   │   ├── ActsOpenGL_461x_gl43_masterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl44gtfmaster
        │   │   │   ├── ActsOpenGL_461x_gl44_gtf_masterTest.cpp
        │   │   │   ├── ActsOpenGL_461x_gl44_gtf_masterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl44master
        │   │   │   ├── ActsOpenGL_461x_gl44_masterTest.cpp
        │   │   │   ├── ActsOpenGL_461x_gl44_masterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl45gtfmaster
        │   │   │   ├── ActsOpenGL_461x_gl45_gtf_masterTest.cpp
        │   │   │   ├── ActsOpenGL_461x_gl45_gtf_masterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl45master
        │   │   │   ├── ActsOpenGL_461x_gl45_masterTest.cpp
        │   │   │   ├── ActsOpenGL_461x_gl45_masterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl46gtfmaster
        │   │   │   ├── ActsOpenGL_461x_gl46_gtf_masterTest.cpp
        │   │   │   ├── ActsOpenGL_461x_gl46_gtf_masterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   └── gl46master
        │   │       ├── ActsOpenGL_461x_gl46_masterTest.cpp
        │   │       ├── ActsOpenGL_461x_gl46_masterTest.h
        │   │       ├── BUILD.gn
        │   │       └── Test.json
        │   └── gltest_main
        │       ├── gl30gtfmaster
        │       │   ├── ActsOpenGL_main_gl30_gtf_masterTest.cpp
        │       │   ├── ActsOpenGL_main_gl30_gtf_masterTest.h
        │       │   ├── BUILD.gn
        │       │   └── Test.json
        │       ├── gl30master
        │       │   ├── ActsOpenGL_main_gl30_masterTest.cpp
        │       │   ├── ActsOpenGL_main_gl30_masterTest.h
        │       │   ├── BUILD.gn
        │       │   └── Test.json
        │       ├── gl31gtfmaster
        │       │   ├── ActsOpenGL_main_gl31_gtf_masterTest.cpp
        │       │   ├── ActsOpenGL_main_gl31_gtf_masterTest.h
        │       │   ├── BUILD.gn
        │       │   └── Test.json
        │       ├── gl31master
        │       │   ├── ActsOpenGL_main_gl31_masterTest.cpp
        │       │   ├── ActsOpenGL_main_gl31_masterTest.h
        │       │   ├── BUILD.gn
        │       │   └── Test.json
        │       ├── gl32gtfmaster
        │       │   ├── ActsOpenGL_main_gl32_gtf_masterTest.cpp
        │       │   ├── ActsOpenGL_main_gl32_gtf_masterTest.h
        │       │   ├── BUILD.gn
        │       │   └── Test.json
        │       ├── gl32master
        │       │   ├── ActsOpenGL_main_gl32_masterTest.cpp
        │       │   ├── ActsOpenGL_main_gl32_masterTest.h
        │       │   ├── BUILD.gn
        │       │   └── Test.json
        │       ├── gl33gtfmaster
        │       │   ├── ActsOpenGL_main_gl33_gtf_masterTest.cpp
        │       │   ├── ActsOpenGL_main_gl33_gtf_masterTest.h
        │       │   ├── BUILD.gn
        │       │   └── Test.json
        │       ├── gl33master
        │       │   ├── ActsOpenGL_main_gl33_masterTest.cpp
        │       │   ├── ActsOpenGL_main_gl33_masterTest.h
        │       │   ├── BUILD.gn
        │       │   └── Test.json
        │       ├── gl40gtfmaster
        │       │   ├── ActsOpenGL_main_gl40_gtf_masterTest.cpp
        │       │   ├── ActsOpenGL_main_gl40_gtf_masterTest.h
        │       │   ├── BUILD.gn
        │       │   └── Test.json
        │       ├── gl40master
        │       │   ├── ActsOpenGL_main_gl40_masterTest.cpp
        │       │   ├── ActsOpenGL_main_gl40_masterTest.h
        │       │   ├── BUILD.gn
        │       │   └── Test.json
        │       ├── gl41gtfmaster
        │       │   ├── ActsOpenGL_main_gl41_gtf_masterTest.cpp
        │       │   ├── ActsOpenGL_main_gl41_gtf_masterTest.h
        │       │   ├── BUILD.gn
        │       │   └── Test.json
        │       ├── gl41master
        │       │   ├── ActsOpenGL_main_gl41_masterTest.cpp
        │       │   ├── ActsOpenGL_main_gl41_masterTest.h
        │       │   ├── BUILD.gn
        │       │   └── Test.json
        │       ├── gl42compatmaster
        │       │   ├── ActsOpenGL_main_gl42_compat_masterTest.cpp
        │       │   ├── ActsOpenGL_main_gl42_compat_masterTest.h
        │       │   ├── BUILD.gn
        │       │   └── Test.json
        │       ├── gl42gtfmaster
        │       │   ├── ActsOpenGL_main_gl42_gtf_masterTest.cpp
        │       │   ├── ActsOpenGL_main_gl42_gtf_masterTest.h
        │       │   ├── BUILD.gn
        │       │   └── Test.json
        │       ├── gl42master
        │       │   ├── ActsOpenGL_main_gl42_masterTest.cpp
        │       │   ├── ActsOpenGL_main_gl42_masterTest.h
        │       │   ├── BUILD.gn
        │       │   └── Test.json
        │       ├── gl43gtfmaster
        │       │   ├── ActsOpenGL_main_gl43_gtf_masterTest.cpp
        │       │   ├── ActsOpenGL_main_gl43_gtf_masterTest.h
        │       │   ├── BUILD.gn
        │       │   └── Test.json
        │       ├── gl43master
        │       │   ├── ActsOpenGL_main_gl43_masterTest.cpp
        │       │   ├── ActsOpenGL_main_gl43_masterTest.h
        │       │   ├── BUILD.gn
        │       │   └── Test.json
        │       ├── gl44gtfmaster
        │       │   ├── ActsOpenGL_main_gl44_gtf_masterTest.cpp
        │       │   ├── ActsOpenGL_main_gl44_gtf_masterTest.h
        │       │   ├── BUILD.gn
        │       │   └── Test.json
        │       ├── gl44master
        │       │   ├── ActsOpenGL_main_gl44_masterTest.cpp
        │       │   ├── ActsOpenGL_main_gl44_masterTest.h
        │       │   ├── BUILD.gn
        │       │   └── Test.json
        │       ├── gl45gtfmaster
        │       │   ├── ActsOpenGL_main_gl45_gtf_masterTest.cpp
        │       │   ├── ActsOpenGL_main_gl45_gtf_masterTest.h
        │       │   ├── BUILD.gn
        │       │   └── Test.json
        │       ├── gl45master
        │       │   ├── ActsOpenGL_main_gl45_masterTest.cpp
        │       │   ├── ActsOpenGL_main_gl45_masterTest.h
        │       │   ├── BUILD.gn
        │       │   └── Test.json
        │       ├── gl46gtfmaster
        │       │   ├── ActsOpenGL_main_gl46_gtf_masterTest.cpp
        │       │   ├── ActsOpenGL_main_gl46_gtf_masterTest.h
        │       │   ├── BUILD.gn
        │       │   └── Test.json
        │       └── gl46master
        │           ├── ActsOpenGL_main_gl46_masterTest.cpp
        │           ├── ActsOpenGL_main_gl46_masterTest.h
        │           ├── BUILD.gn
        │           └── Test.json
        ├── gltest_kmn
        │   ├── gltest_455x
        │   │   ├── ActsOpenGL_455x_gl40_khr_masterTest.cpp
        │   │   ├── ActsOpenGL_455x_gl40_khr_masterTest.h
        │   │   ├── BUILD.gn
        │   │   └── Test.json
        │   ├── gltest_460x
        │   │   ├── gl30khrmaster
        │   │   │   ├── ActsOpenGL_460x_gl30_khr_masterTest.cpp
        │   │   │   ├── ActsOpenGL_460x_gl30_khr_masterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl40khrmaster
        │   │   │   ├── ActsOpenGL_460x_gl40_khr_masterTest.cpp
        │   │   │   ├── ActsOpenGL_460x_gl40_khr_masterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl43khrmaster
        │   │   │   ├── ActsOpenGL_460x_gl43_khr_masterTest.cpp
        │   │   │   ├── ActsOpenGL_460x_gl43_khr_masterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   └── gl45khrmaster
        │   │       ├── ActsOpenGL_460x_gl45_khr_masterTest.cpp
        │   │       ├── ActsOpenGL_460x_gl45_khr_masterTest.h
        │   │       ├── BUILD.gn
        │   │       └── Test.json
        │   ├── gltest_461x
        │   │   ├── gl30khrmaster
        │   │   │   ├── ActsOpenGL_461x_gl30_khr_masterTest.cpp
        │   │   │   ├── ActsOpenGL_461x_gl30_khr_masterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl40khrmaster
        │   │   │   ├── ActsOpenGL_461x_gl40_khr_masterTest.cpp
        │   │   │   ├── ActsOpenGL_461x_gl40_khr_masterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   ├── gl43khrmaster
        │   │   │   ├── ActsOpenGL_461x_gl43_khr_masterTest.cpp
        │   │   │   ├── ActsOpenGL_461x_gl43_khr_masterTest.h
        │   │   │   ├── BUILD.gn
        │   │   │   └── Test.json
        │   │   └── gl45khrmaster
        │   │       ├── ActsOpenGL_461x_gl45_khr_masterTest.cpp
        │   │       ├── ActsOpenGL_461x_gl45_khr_masterTest.h
        │   │       ├── BUILD.gn
        │   │       └── Test.json
        │   └── gltest_main
        │       ├── gl30khrmaster
        │       │   ├── ActsOpenGL_main_gl30_khr_masterTest.cpp
        │       │   ├── ActsOpenGL_main_gl30_khr_masterTest.h
        │       │   ├── BUILD.gn
        │       │   └── Test.json
        │       ├── gl40khrmaster
        │       │   ├── ActsOpenGL_main_gl40_khr_masterTest.cpp
        │       │   ├── ActsOpenGL_main_gl40_khr_masterTest.h
        │       │   ├── BUILD.gn
        │       │   └── Test.json
        │       ├── gl43khrmaster
        │       │   ├── ActsOpenGL_main_gl43_khr_masterTest.cpp
        │       │   ├── ActsOpenGL_main_gl43_khr_masterTest.h
        │       │   ├── BUILD.gn
        │       │   └── Test.json
        │       └── gl45khrmaster
        │           ├── ActsOpenGL_main_gl45_khr_masterTest.cpp
        │           ├── ActsOpenGL_main_gl45_khr_masterTest.h
        │           ├── BUILD.gn
        │           └── Test.json
        └── gltest_kms
            ├── gltest_461x
            │   ├── gl43khrsingle
            │   │   ├── ActsOpenGL_461x_gl43_khr_singleTest.cpp
            │   │   ├── ActsOpenGL_461x_gl43_khr_singleTest.h
            │   │   ├── BUILD.gn
            │   │   └── Test.json
            │   ├── gl44khrsingle
            │   │   ├── ActsOpenGL_461x_gl44_khr_singleTest.cpp
            │   │   ├── ActsOpenGL_461x_gl44_khr_singleTest.h
            │   │   ├── BUILD.gn
            │   │   └── Test.json
            │   ├── gl45khrsingle
            │   │   ├── ActsOpenGL_461x_gl45_khr_singleTest.cpp
            │   │   ├── ActsOpenGL_461x_gl45_khr_singleTest.h
            │   │   ├── BUILD.gn
            │   │   └── Test.json
            │   └── gl46khrsingle
            │       ├── ActsOpenGL_461x_gl46_khr_singleTest.cpp
            │       ├── ActsOpenGL_461x_gl46_khr_singleTest.h
            │       ├── BUILD.gn
            │       └── Test.json
            └── gltest_main
                ├── gl43khrsingle
                │   ├── ActsOpenGL_main_gl43_khr_singleTest.cpp
                │   ├── ActsOpenGL_main_gl43_khr_singleTest.h
                │   ├── BUILD.gn
                │   └── Test.json
                ├── gl44khrsingle
                │   ├── ActsOpenGL_main_gl44_khr_singleTest.cpp
                │   ├── ActsOpenGL_main_gl44_khr_singleTest.h
                │   ├── BUILD.gn
                │   └── Test.json
                ├── gl45khrsingle
                │   ├── ActsOpenGL_main_gl45_khr_singleTest.cpp
                │   ├── ActsOpenGL_main_gl45_khr_singleTest.h
                │   ├── BUILD.gn
                │   └── Test.json
                └── gl46khrsingle
                    ├── ActsOpenGL_main_gl46_khr_singleTest.cpp
                    ├── ActsOpenGL_main_gl46_khr_singleTest.h
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
  run -l ActsOpenGLegl323xTest,
  run -l ActsOpenGLmaingl32masterTest,
  run -l ActsOpenGLmaingl42masterTest
  ...

* gltest测试套件运行结束会生成qpa文件方便开发人员调试，qpa文件可以通过vk-gl-cts/scripts/log内的脚本进行解析，具体命令如下：

  ```bash
  python2 log_to_xml.py TestResults.qpa TestResults.xml
  ```
