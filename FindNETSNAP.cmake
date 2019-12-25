# Try to find Part4 library
# Once done this will define
# NETSNAP_FOUND - if system found Part4 library
# NETSNAP_INCLUDE_DIRS - the Part4 include directories
# NETSNAP_LIBRARIES - the libraries needed to use Part4
# NETSNAP_DEFINITIONS - compiler switches required for using Part4

set (NETSNAP_ROOT_DIR $ENV{GIT_REPO}/netsnap)
# Uncomment the following line to print which directory CMake is looking in.
# MESSAGE(STATUS "NETSNAP_ROOT_DIR: " ${NETSNAP_ROOT_DIR})

# glib
find_library(LIB_GLIB
    NAMES glib
    PATHS ${NETSNAP_ROOT_DIR}/lib
    DOC "The glib library"
)

# snap
find_library(LIB_SNAP
    NAMES snap
    PATHS ${NETSNAP_ROOT_DIR}/lib
    DOC "The snap library"
)

# handle the QUIETLY and REQUIRED arguments and set
# NETSNAP_FOUND to TRUE if all listed variables are TRUE
include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(NETSNAP DEFAULT_MSG
  LIB_SNAP LIB_GLIB)

if (NETSNAP_FOUND)
    set(NETSNAP_LIBRARIES ${LIB_SNAP} ${LIB_GLIB})
    set(NETSNAP_INCLUDE_DIRS ${NETSNAP_ROOT_DIR})
    set(NETSNAP_DEFINITIONS)
endif()

# Tell cmake GUIs to ignore the "local" variables.
mark_as_advanced(NETSNAP_ROOT_DIR LIB_SNAP LIB_GLIB)
