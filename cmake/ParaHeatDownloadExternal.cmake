################################################################################
include(DownloadProject)

# With CMake 3.8 and above, we can hide warnings about git being in a
# detached head by passing an extra GIT_CONFIG option
if(NOT (${CMAKE_VERSION} VERSION_LESS "3.8.0"))
	set(LIBIGL_EXTRA_OPTIONS "GIT_CONFIG advice.detachedHead=false")
else()
	set(LIBIGL_EXTRA_OPTIONS "")
endif()

# Shortcut function
function(paraheat_download_project name)
	download_project(
		PROJ         ${name}
		SOURCE_DIR   ${PROJECT_SOURCE_DIR}/external/${name}
		DOWNLOAD_DIR ${PROJECT_SOURCE_DIR}/external/.cache/${name}
		QUIET
		${ARGN}
	)
endfunction()

################################################################################

## LibIGL
function(paraheat_download_libigl)
	paraheat_download_project(libigl
		GIT_REPOSITORY https://github.com/libigl/libigl.git
		GIT_TAG        e33f534ffd2c04b5c82e9f8de432ddb61e2e2d65
	)
endfunction()

## Eigen
function(paraheat_download_eigen)
	paraheat_download_project(eigen
		URL           http://bitbucket.org/eigen/eigen/get/3.2.10.tar.gz
		URL_MD5       8ad10ac703a78143a4062c9bda9d8fd3
	)
endfunction()

## glad
function(paraheat_download_glad)
	paraheat_download_project(glad
		GIT_REPOSITORY https://github.com/libigl/libigl-glad.git
		GIT_TAG        71e35fe685a0cc160068a2f2f971c40b82d14af0
	)
endfunction()

## GLFW
function(paraheat_download_glfw)
	paraheat_download_project(glfw
		GIT_REPOSITORY https://github.com/glfw/glfw.git
		GIT_TAG        d834f01ca43c0f5ddd31b00a7fc2f48abbafa3da
	)
endfunction()
