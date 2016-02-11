# Copyright (c) 2014-2015 The Regents of the University of California.
# All Rights Reserved.
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject
# to the following conditions:
#
# The above copyright notice and this permission notice shall be included
# in all copies or substantial portions of the Software.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS
# IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
# TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
# PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER
# OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
# EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
# PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
# LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
# NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
# SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
set(proj ZLIB)

set(${proj}_DEPENDENCIES "")

ExternalProject_Include_Dependencies(${proj}
  PROJECT_VAR proj
  DEPENDS_VAR ${proj}_DEPENDENCIES
  EP_ARGS_VAR ${proj}_EXTERNAL_PROJECT_ARGS
  USE_SYSTEM_VAR ${CMAKE_PROJECT_NAME}_USE_SYSTEM_${proj}
  )

if(${PROJECT_NAME}_USE_SYSTEM_${proj})
  string(TOLOWER ${proj} _lower)
  set(${proj}_LIB_DIR "" CACHE PATH "A directory where ${_lower} may be, use this if its not in the path")
endif()

if(NOT ${CMAKE_PROJECT_NAME}_USE_SYSTEM_${proj})
	
  set(${proj}_OUTPUT_DIR ${CMAKE_BINARY_DIR}/externals/${proj})
  set(${proj}_OUTPUT_BIN_DIR ${CMAKE_BINARY_DIR}/externals/${proj})

  if(LINUX)
   set(${proj}_DEPENDENCIES "INTELRUNTIME")
   set(SuperBuild_${proj}_URL "${SV_SUPERBUILD_LIBS_DIR}/zlib-1.2.3-linux.tar.gz" CACHE
     STRING "Location of ${proj}, can be web address or local path")
 elseif(APPLE)
  MESSAGE(FATAL_ERROR "Zlib download is not currently available for mac os")
endif()

mark_as_superbuild(SuperBuild_${proj}_URL:STRING)
mark_as_advanced(SuperBuild_${proj}_URL)

ExternalProject_Add(${proj}
	URL ${SuperBuild_${proj}_URL}
	PREFIX ${${proj}_OUTPUT_DIR}-prefix
  SOURCE_DIR ${${proj}_OUTPUT_DIR}
  BINARY_DIR ${${proj}_OUTPUT_BIN_DIR}
  CONFIGURE_COMMAND ""
  BUILD_COMMAND ""
  UPDATE_COMMAND ""
  INSTALL_COMMAND ""
  CMAKE_CACHE_ARGS
  -DCMAKE_CXX_COMPILER:STRING=${CMAKE_CXX_COMPILER}
  -DCMAKE_C_COMPILER:STRING=${CMAKE_C_COMPILER}
  -DCMAKE_CXX_FLAGS:STRING=${CMAKE_CXX_FLAGS}
  -DCMAKE_C_FLAGS:STRING=${CMAKE_C_FLAGS}
  -DCMAKE_BUILD_TYPE:STRING=${CMAKE_BUILD_TYPE}
  )

set(${proj}_SOURCE_DIR ${${proj}_OUTPUT_DIR})
set(${proj}_INCLUDE_DIR ${${proj}_OUTPUT_DIR})
set(${proj}_LIB_DIR ${${proj}_OUTPUT_BIN_DIR})
else()
  ExternalProject_Add_Empty(${proj} DEPENDS ${${proj}_DEPENDENCIES})
endif()

mark_as_superbuild(${proj}_SOURCE_DIR:PATH)
mark_as_superbuild(${proj}_LIB_DIR:PATH)
mark_as_superbuild(${proj}_INCLUDE_DIR:PATH)

mark_as_superbuild(
  VARS ${proj}_DIR:PATH
  LABELS "FIND_PACKAGE"
  )

