PROJECT(slua)

CMAKE_MINIMUM_REQUIRED(VERSION 3.5)

LINK_DIRECTORIES(
  ${PROJECT_BINARY_DIR}/lib
)

SET(EXECUTABLE_OUTPUT_PATH ${PROJECT_BINARY_DIR}/bin)
SET(LIBRARY_OUTPUT_PATH ${PROJECT_BINARY_DIR}/lib)

IF(MSVC)
  #静态链接 MSVC Runtime
  foreach(flag_var
        CMAKE_CXX_FLAGS CMAKE_CXX_FLAGS_DEBUG CMAKE_CXX_FLAGS_RELEASE CMAKE_CXX_FLAGS_MINSIZEREL CMAKE_CXX_FLAGS_RELWITHDEBINFO
        CMAKE_C_FLAGS   CMAKE_C_FLAGS_DEBUG   CMAKE_C_FLAGS_RELEASE   CMAKE_C_FLAGS_MINSIZEREL   CMAKE_C_FLAGS_RELWITHDEBINFO
      )
   if(${flag_var} MATCHES "/MD")
      string(REGEX REPLACE "/MD" "/MT" ${flag_var} "${${flag_var}}")
   endif(${flag_var} MATCHES "/MD")
 endforeach(flag_var)
endif()

if(WIN32)
  add_definitions(-D_CRT_SECURE_NO_WARNINGS )
  add_definitions(-DDISABLE_INVALID_NUMBERS)
  add_definitions(-D "strncasecmp=strnicmp")
  add_definitions(-D "strcasecmp=stricmp")
  add_definitions(-DLUA_BUILD_AS_DLL)
endif()
if(ANDROID)
  add_definitions( -D "l_getlocaledecpoint()=('.')" )
endif()

add_definitions(-DLUA_COMPAT_MODULE )

ADD_SUBDIRECTORY(lua)
ADD_SUBDIRECTORY(luacjson)
ADD_SUBDIRECTORY(pb)
ADD_SUBDIRECTORY(sqlite)
ADD_SUBDIRECTORY(lsqlite3)
ADD_SUBDIRECTORY(slua)
