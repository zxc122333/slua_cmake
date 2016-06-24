SET(SOURCE_FILES
  slua.c ../lua/linit.c
)

INCLUDE_DIRECTORIES(
  ../lua
  ../luacjson
)

ADD_LIBRARY(slua SHARED ${SOURCE_FILES})
ADD_LIBRARY(slua_static STATIC ${SOURCE_FILES})

if(ANDROID)
  TARGET_LINK_LIBRARIES(slua m)
  TARGET_LINK_LIBRARIES(slua_static m)
endif()


TARGET_LINK_LIBRARIES(slua
  lua_static luacjson_static lsqlite3_static pb_static sqlite_static
)

TARGET_LINK_LIBRARIES(slua_static
  lua_static luacjson_static lsqlite3_static pb_static sqlite_static
)

SET_TARGET_PROPERTIES(slua_static PROPERTIES OUTPUT_NAME "slua")
SET_TARGET_PROPERTIES(slua PROPERTIES CLEAN_DIRECT_OUTPUT 1)
SET_TARGET_PROPERTIES(slua_static PROPERTIES CLEAN_DIRECT_OUTPUT 1)
