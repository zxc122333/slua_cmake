SET(SOURCE_FILES
  sqlite3.c
)

INCLUDE_DIRECTORIES(
  .
)

ADD_LIBRARY(sqlite_static STATIC ${SOURCE_FILES})

SET_TARGET_PROPERTIES(sqlite_static PROPERTIES OUTPUT_NAME "sqlite")
SET_TARGET_PROPERTIES(sqlite_static PROPERTIES CLEAN_DIRECT_OUTPUT 1)
