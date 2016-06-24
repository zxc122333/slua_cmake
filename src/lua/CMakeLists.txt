SET(SOURCE_FILES
  lapi.c lcode.c lctype.c ldebug.c ldo.c
  ldump.c lfunc.c lgc.c llex.c lmem.c lobject.c
  lopcodes.c lparser.c lstate.c lstring.c ltable.c
  ltm.c lundump.c lvm.c lzio.c lauxlib.c
  lbaselib.c lbitlib.c lcorolib.c ldblib.c
  liolib.c lmathlib.c loslib.c lstrlib.c
  ltablib.c loadlib.c linit.c lutf8lib.c
)

INCLUDE_DIRECTORIES(
  .
)

ADD_LIBRARY(lua_static STATIC ${SOURCE_FILES})

ADD_EXECUTABLE(luac luac.c ${SOURCE_FILES})

SET_TARGET_PROPERTIES(lua_static PROPERTIES OUTPUT_NAME "lua")
SET_TARGET_PROPERTIES(lua_static PROPERTIES CLEAN_DIRECT_OUTPUT 1)
