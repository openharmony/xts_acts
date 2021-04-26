# SIG Template

Note: The content of this SIG follows the convention described in OpenHarmony's PMC Management Charter [README](/zh/pmc.md).

## SIG group work objectives and scope

### Tools & Toolchains development and planning
1. Determine the best tool and toolchain options currently available
2. Optimize the chosen components for OpenHarmony - set reasonable defaults with OpenHarmony triplets, make sure OpenHarmony is a visible target in IDEs, etc.
3. Push modifications to toolchain projects to LLVM and gcc upstream - any local patches to toolchain components should be temporary. This includes helping other teams like (non-Open) Harmony upstream their changes if any/if needed.
4. Keep monitoring the Open Source world for new versions (the toolchain should track upstream releases - they usually come with better performance and compliance with newer language standards) and entirely new projects (including, but not limited to, Huawei's OpenArk compilers) that could improve OpenHarmony tools and toolchains, update OpenHarmony tools and toolchains in a timely manner
5. Provide expertise/assistance to developers running into toolchain problems (such as compiler bugs, or incompatible changes in newer releases caused by features like stricter standards compliance)
6. Make sure people trying to build OpenHarmony and/or develop OpenHarmony apps can easily install the needed toolchain components regardless of their work environment
7. Identify and adapt debugging, profiling and code quality tools and sanitizers that can be useful for the OpenHarmony ecosystem. If a new tool needs to be developed, try to develop it inside an upstream project to bring in external developers/maintainers.
8. Decide on components and architecture of the OpenHarmony SDK for hardware makers and application/game developers
9. Avoid host tool contamination - help make sure that, when building the OS, the OpenHarmony toolchain is used instead of potentially equivalent host tools that may come with a different set of bugs
10. Help OpenHarmony developers with toolchain problems
11. Make sure OpenHarmony is friendly to developers regardless of whether they choose to use an IDE or a more traditional environment (e.g. vim/emacs and command line tools)

### Tools & Toolchains related

The Tools and Toolchain SIG looks into the following questions (more will be added later as OpenHarmony progresses):

1. gcc or clang?
2. libgcc or compiler-rt?
3. libstdc++ or libc++?
4. Do we want to include (optional) support for additional programming languages, such as Java, C#, Go, Rust, Swift, Python or Lua? If so, which languages and which implementations thereof? Which runtimes (if any) go into the core OS, which are provided as optional components inside the SDK?
5. libc: Currently Linux and LiteOS-A use Musl, Zephyr uses a newlib fork, FreeRTOS is typically used with newlib. There are good reasons to use different libcs here (newlib doesn't support dynamic linking, which is very important for higher end systems, while musl doesn't support MMU-less systems), but there may be some things we can do to improve compatibility between OpenHarmony on top of different kernels, and some ways to optimize both worlds while reducing maintenance work (e.g. unify the implementations of some functions in both libcs, or even bring in more optimized versions of some routines from other libc implementations like glibc or Android's Bionic)
6. Which debugging tools, profilers, code quality tools, sanitizers etc. do we need/want on OpenHarmony?
7. What IDE or IDEs, if any, do we want to modify for improved OpenHarmony support? How can we best support IDE users and traditional tool users alike?
8. Do we assemble the toolchain (not its components; that is beyond the scope) from scratch or do we base our work on an existing project (e.g. OpenEmbedded/Yocto, Buildroot, a Linux distribution's packaging, ...)

Once decisions are made, the SIG builds and maintains the tools and toolchains used in OpenHarmony and the SDK (tools, library headers, etc. and optional IDE(s) as separate modules).

The toolchain is provided in binary form and in source form with a simple build script that includes all configurations etc. used for the official build.

### The repository 
- project name:
  - Tools & Toolchains: https://gitee.com/openharmony-sig/sig-tools-toolchains



## SIG Members

### Leader
- @[berolinux](https://gitee.com/berolinux)

### Committers
- @[berolinux](https://gitee.com/berolinux)

 ### Meetings
 - Meeting time：TBD
 - Meeting link：[Mattermost channel](https://chat.ostc-eu.org/ostc/channels/sig-toolchain)

### Contact (optional)
- Mattermost channel: [SIG/Toolchain](https://chat.ostc-eu.org/ostc/channels/sig-toolchain)
