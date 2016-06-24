# sluaCmake

## NOTE:
- *编译windows时需要手动修改批处理文件，将VS140COMNTOOLS改为对应的版本 如 VS130COMNTOOLS等*
- 使用lua版本为lua5.3.0，没有使用luajit。如果有需要可以参考 src/lua/CMakeLists.txt 和 luajit的makefile 写一个,应该挺简单的。欢迎PR
- 如果ANDROID_NDK没有在环境变量中，请修改buildAndroid.bat

## HOW TO:
- 增加类库：
  - 方法1：为类库添加CMakeLists.txt
    1. 为类库创建目录，复制类库代码
    -  如果类库没有提供CMakeLists.txt,需要在类库目录中编写 CMakeLists.txt 可参考已有类库 *注意检查类库原始Makefile中的宏定义*
    -  修改src/CMakeLists.txt ,添加 `ADD_SUBDIRECTORY(类库名字)`
  - 方法2：将类库提前编译好，直接链接静态链接库
- 更新/降低 slua版本： 直接覆盖 src/slua/slua.c 即可
- 修改宏定义：
  - 在批处理中，参考buildAndroid.bat
  - CMakeLists.txt 中，参考 src/CMakeLists.txt

## TODO
- iOS
- luajit
- 整理输出目录结构
