macro(PrintFinalReport)
    # -------------------------------- The final report ----------------------------------

    message(STATUS "\n==============\n"
                   "Summary report\n"
                   "==============\n")
    if (DEFINED CMAKE_BUILD_TYPE)
        message(STATUS "Build type:          ${CMAKE_BUILD_TYPE}")
    endif()

    message(STATUS "Compiler:            ${CMAKE_CXX_COMPILER} (${CMAKE_CXX_COMPILER_VERSION})")
    message(STATUS "Flags:               ${CMAKE_CXX_FLAGS}")
    message(STATUS "Standard:            Requires C++${CMAKE_CXX_STANDARD}")

    # Qt5 needs/sets PYTHON_CONFIG_SUFFIX regarding Shiboken
    message(STATUS "Python:              ${PYTHON_VERSION_STRING} [${PYTHON_EXECUTABLE}] [${PYTHON_CONFIG_SUFFIX}]")

    if(DEFINED PCL_FOUND)
        message(STATUS "PCL:                 ${PCL_VERSION}")
    else(DEFINED PCL_FOUND)
        message(STATUS "PCL:                 not enabled")
    endif(DEFINED PCL_FOUND)

    if(DEFINED pybind11_FOUND)
        message(STATUS "pybind11:            ${pybind11_VERSION}")
    else(DEFINED pybind11_FOUND)
        message(STATUS "pybind11:            not enabled")
    endif(DEFINED pybind11_FOUND)

    message(STATUS "Boost:               ${Boost_VERSION}")

    message(STATUS "XercesC:             ${XercesC_VERSION} [${XercesC_LIBRARIES}] [${XercesC_INCLUDE_DIRS}]")

    message(STATUS "ZLIB:                ${ZLIB_VERSION_STRING}")

    message(STATUS "PyCXX:               ${PYCXX_VERSION} [${PYCXX_INCLUDE_DIR}]")

    message(STATUS "OCC:                 ${OCC_VERSION_STRING} [${OCC_LIBRARIES}] [${OCC_LIBRARY_DIR}] [${OCC_INCLUDE_DIR}]")

    if(BUILD_SMESH)
        if(FREECAD_USE_EXTERNAL_SMESH)
            message(STATUS "SMESH:               ${SMESH_VERSION_MAJOR}.${SMESH_VERSION_MINOR}.${SMESH_VERSION_PATCH}.${SMESH_VERSION_TWEAK}")
        else(FREECAD_USE_EXTERNAL_SMESH)
            message(STATUS "SMESH:               ${SMESH_VERSION_MAJOR}.${SMESH_VERSION_MINOR}.${SMESH_VERSION_PATCH}.${SMESH_VERSION_TWEAK} build internal")
            message(STATUS "MEDFile:             ${MEDFILE_VERSION} [${MEDFILE_LIBRARIES}] [${MEDFILE_INCLUDE_DIRS}]")
            message(STATUS "HDF5:                ${HDF5_VERSION}")
            message(STATUS "VTK:                 ${VTK_VERSION}")
        endif(FREECAD_USE_EXTERNAL_SMESH)
    else(BUILD_SMESH)
        message(STATUS "SMESH:               do not build")
    endif(BUILD_SMESH)

    if(DEFINED NETGEN_FOUND)
        message(STATUS "NETGEN:              ${NETGEN_VERSION_MAJOR}.${NETGEN_VERSION_MINOR}.${NETGEN_VERSION_PATCH} (${NETGEN_VERSION}) [${NETGEN_DEFINITIONS}] [${NETGEN_CXX_FLAGS}] [${NGLIB_INCLUDE_DIR}] [${NGLIB_LIBRARIES}] [${NETGEN_INCLUDE_DIRS}]")
    else(DEFINED NETGEN_FOUND)
        message(STATUS "NETGEN:              not enabled")
    endif(DEFINED NETGEN_FOUND)

    #message(STATUS "OpenCV:              ${OpenCV_VERSION}")

    if(DEFINED SWIG_FOUND)
        message(STATUS "SWIG:                ${SWIG_VERSION}")
    else(DEFINED SWIG_FOUND)
        message(STATUS "SWIG:                not found")
    endif(DEFINED SWIG_FOUND)

    if(DEFINED EIGEN3_FOUND)
        message(STATUS "Eigen3               ${EIGEN3_VERSION}")
    else(DEFINED EIGEN3_FOUND)
        message(STATUS "Eigen3:              not found")
    endif(DEFINED EIGEN3_FOUND)

    message(STATUS "QtCore:              ${QtCore_VERSION}")
    message(STATUS "QtNetwork:           ${QtNetwork_VERSION}")
    message(STATUS "QtXml:               ${QtXml_VERSION}")
    if (BUILD_GUI)
        message(STATUS "QtWidgets:           ${QtWidgets_VERSION}")
        message(STATUS "QtPrintSupport:      ${QtPrintSupport_VERSION}")
        message(STATUS "QtOpenGL:            ${QtOpenGL_VERSION}")
        message(STATUS "QtSvg:               ${QtSvg_VERSION}")
        message(STATUS "QtUiTools:           ${QtUiTools_VERSION}")
        message(STATUS "QtConcurrent:        ${QtConcurrent_VERSION}")
        if(BUILD_WEB)
            message(STATUS "QtWebEngineWidgets:  ${QtWebEngineWidgets_VERSION}")
        else()
            message(STATUS "QtWebEngineWidgets:  not needed (BUILD_WEB is OFF)")
        endif()
        if(BUILD_DESIGNER_PLUGIN)
            message(STATUS "Designer plugin:     ${DESIGNER_PLUGIN_LOCATION}/${libFreeCAD_widgets}")
        else()
            message(STATUS "Designer plugin:     not built (BUILD_DESIGNER_PLUGIN is OFF)")
        endif()

    else()
        message(STATUS "QtWidgets:           not needed")
        message(STATUS "QtPrintSupport:      not needed")
        message(STATUS "QtOpenGL:            not needed")
        message(STATUS "QtSvg:               not needed")
        message(STATUS "QtUiTools:           not needed")
        message(STATUS "QtConcurrent:        not needed")
        message(STATUS "QtWebKitWidgets:     not needed")
    endif()

    if(DEFINED MACPORTS_PREFIX)
        if(DEFINED Shiboken_FOUND)
            message(STATUS "Shiboken:            ${Shiboken_VERSION} [${SHIBOKEN_INCLUDE_DIR}]")
        else(DEFINED Shiboken_FOUND)
            message(STATUS "Shiboken:            not found (only searched if MACPORTS_PREFIX is defined)")
        endif(DEFINED Shiboken_FOUND)
        if(DEFINED PySide_FOUND)
            message(STATUS "PySide:              ${PySide_VERSION} [${PYSIDE_INCLUDE_DIR}]")
            if(NOT PYSIDE_INCLUDE_DIR)
                message(STATUS " IncludeDir:         Unable to find, python version mismatch?")
            endif(NOT PYSIDE_INCLUDE_DIR)
        else(DEFINED PySide_FOUND)
            message(STATUS "PySide:              not found (only searched if MACPORTS_PREFIX is defined)")
        endif(DEFINED PySide_FOUND)
    endif(DEFINED MACPORTS_PREFIX)

    if(DEFINED Shiboken${SHIBOKEN_MAJOR_VERSION}_FOUND)
        message(STATUS "Shiboken:            ${Shiboken_VERSION} [${Shiboken${SHIBOKEN_MAJOR_VERSION}_DIR}] [${SHIBOKEN_INCLUDE_DIR}]")
    else()
        message(STATUS "Shiboken:            not found")
    endif()
    if(DEFINED PySide${SHIBOKEN_MAJOR_VERSION}_FOUND)
        message(STATUS "PySide:              ${PySide_VERSION} [${PYSIDE_INCLUDE_DIR}]")
        if(NOT PYSIDE_INCLUDE_DIR)
            message(STATUS " IncludeDir:         Unable to find, python version mismatch?")
        endif()
    else()
        message(STATUS "PySide:              not found")
    endif()
    if(DEFINED PYSIDE_TOOLS_FOUND)
        message(STATUS "PySideTools:         [${PYSIDE_UIC_EXECUTABLE}] [${PYSIDE_RCC_EXECUTABLE}]")
    else()
        message(STATUS "PySideTools:         not found")
    endif()

    if(FREECAD_USE_FREETYPE)
        if(DEFINED FREETYPE_FOUND)
            message(STATUS "Freetype:            ${FREETYPE_VERSION_STRING}")
        else(DEFINED FREETYPE_FOUND)
            message(STATUS "Freetype:            not found")
        endif(DEFINED FREETYPE_FOUND)
    else(FREECAD_USE_FREETYPE)
        message(STATUS "Freetype:            disabled")
    endif(FREECAD_USE_FREETYPE)

    message(STATUS "OpenGL:              ${OPENGL_gl_LIBRARY}")
    message(STATUS "OpenGLU:             [${OPENGL_glu_LIBRARY}][${OPENGL_INCLUDE_DIR}]")

    message(STATUS "Coin3D:              ${COIN3D_VERSION} [${COIN3D_LIBRARIES}] [${COIN3D_INCLUDE_DIRS}]")
    message(STATUS "Pivy:                ${PIVY_VERSION}") 


    if (WIN32)
    #message(STATUS "SPNAV:               not available yet for your OS") # FREECAD_USE_3DCONNEXION instead...
    else(WIN32)
        if(DEFINED SPNAV_FOUND)
            message(STATUS "SPNAV:               [${SPNAV_LIBRARY}] [${SPNAV_INCLUDE_DIR}]")
        else(DEFINED SPNAV_FOUND)
            message(STATUS "SPNAV:               not found")
        endif(DEFINED SPNAV_FOUND)
    endif(WIN32)

    if(MATPLOTLIB_FOUND)
        message(STATUS "Matplotlib:          ${MATPLOTLIB_VERSION}")
    else(MATPLOTLIB_FOUND)
        message(STATUS "Matplotlib:          not found")
    endif(MATPLOTLIB_FOUND)

    if(BUILD_VR)
        if(DEFINED RIFT_FOUND)
            message(STATUS "Rift:                ${Rift_VERSION}")
        else(DEFINED RIFT_FOUND)
            message(STATUS "Rift:                not found")
        endif(DEFINED RIFT_FOUND)
    else(BUILD_VR)
        message(STATUS "Rift:                not enabled (BUILD_VR)")
    endif(BUILD_VR)

    if(DOXYGEN_FOUND)
        message(STATUS "Doxygen:             ${DOXYGEN_VERSION}")
        message(STATUS "Language:            ${DOXYGEN_LANGUAGE}")
        if(COIN3D_DOC_FOUND)
            message(STATUS "Coin3D_DOC:          found [${COIN3D_DOC_PATH}]")
        else(COIN3D_DOC_FOUND)
            message(STATUS "Coin3D_DOC:          not found")
        endif(COIN3D_DOC_FOUND)
    else(DOXYGEN_FOUND)
        message(STATUS "Doxygen:             not found")
    endif(DOXYGEN_FOUND)

    if(MSVC)
        # Copy libpack dependency directories to build folder for user as part of overall build process
        if(FREECAD_LIBPACK_USE AND LIBPACK_FOUND)
            if(FREECAD_COPY_DEPEND_DIRS_TO_BUILD)
                message(STATUS "=======================================\n"
                    "Copying libpack dependency directories to build directory for Windows MSVC build.\n")
                file(COPY ${FREECAD_LIBPACK_DIR}/bin/assistant.exe DESTINATION ${CMAKE_BINARY_DIR}/bin)
                file(COPY ${FREECAD_LIBPACK_DIR}/bin/QtWebEngineProcess.exe DESTINATION ${CMAKE_BINARY_DIR}/bin)
                file(COPY ${FREECAD_LIBPACK_DIR}/bin/QtWebEngineProcessd.exe DESTINATION ${CMAKE_BINARY_DIR}/bin)
                file(COPY ${FREECAD_LIBPACK_DIR}/bin/qt.conf DESTINATION ${CMAKE_BINARY_DIR}/bin)
                file(COPY ${FREECAD_LIBPACK_DIR}/plugins/platforms DESTINATION ${CMAKE_BINARY_DIR}/bin)
                file(COPY ${FREECAD_LIBPACK_DIR}/plugins/imageformats DESTINATION ${CMAKE_BINARY_DIR}/bin)
                file(COPY ${FREECAD_LIBPACK_DIR}/plugins/iconengines DESTINATION ${CMAKE_BINARY_DIR}/bin)
                file(COPY ${FREECAD_LIBPACK_DIR}/plugins/sqldrivers DESTINATION ${CMAKE_BINARY_DIR}/bin)
                file(COPY ${FREECAD_LIBPACK_DIR}/plugins/styles DESTINATION ${CMAKE_BINARY_DIR}/bin)
                file(COPY ${FREECAD_LIBPACK_DIR}/plugins/printsupport DESTINATION ${CMAKE_BINARY_DIR}/bin)
                file(COPY ${FREECAD_LIBPACK_DIR}/resources DESTINATION ${CMAKE_BINARY_DIR})
                file(COPY ${FREECAD_LIBPACK_DIR}/translations/qtwebengine_locales DESTINATION ${CMAKE_BINARY_DIR}/translations)
                message(STATUS "... end copying.\n=======================================\n")
            endif(FREECAD_COPY_DEPEND_DIRS_TO_BUILD)

            if(COPY_LIBPACK_BIN_TO_BUILD)
                if(FREECAD_COPY_LIBPACK_BIN_TO_BUILD)
                    message("=======================================\n"
                            "Copying libpack 'bin' directory to build directory.\n")
                    file(COPY ${FREECAD_LIBPACK_DIR}/bin DESTINATION ${CMAKE_BINARY_DIR})
                    message("... done copying libpack 'bin' directory.\n=======================================\n")
                endif()
                if(FREECAD_COPY_PLUGINS_BIN_TO_BUILD)
                    message(STATUS "=======================================\n"
                                   "Copying plugins to build directory.")
                    file(COPY ${FREECAD_LIBPACK_DIR}/plugins/imageformats DESTINATION ${CMAKE_BINARY_DIR}/bin)
                    file(COPY ${FREECAD_LIBPACK_DIR}/plugins/platforms DESTINATION ${CMAKE_BINARY_DIR}/bin)
                    file(COPY ${FREECAD_LIBPACK_DIR}/plugins/styles DESTINATION ${CMAKE_BINARY_DIR}/bin)
                    file(COPY ${FREECAD_LIBPACK_DIR}/bin/QtWebEngineProcess.exe DESTINATION ${CMAKE_BINARY_DIR}/bin)
                    file(COPY ${FREECAD_LIBPACK_DIR}/bin/QtWebEngineProcessd.exe DESTINATION ${CMAKE_BINARY_DIR}/bin)
                    file(COPY ${FREECAD_LIBPACK_DIR}/translations/qtwebengine_locales DESTINATION ${CMAKE_BINARY_DIR}/translations)
                    file(COPY ${FREECAD_LIBPACK_DIR}/resources DESTINATION ${CMAKE_BINARY_DIR})
                    file(WRITE ${CMAKE_BINARY_DIR}/bin/qt.conf "[Paths]\nPrefix=..\n")
                endif()
            endif()

            if(FREECAD_INSTALL_DEPEND_DIRS)
                # Test install command for installing/copying directories
                message(STATUS "=======================================")
                install(DIRECTORY ${FREECAD_LIBPACK_DIR}/plugins/platforms DESTINATION ${CMAKE_INSTALL_PREFIX}/bin)
                install(DIRECTORY ${FREECAD_LIBPACK_DIR}/plugins/imageformats DESTINATION ${CMAKE_INSTALL_PREFIX}/bin)
                install(DIRECTORY ${FREECAD_LIBPACK_DIR}/plugins/iconengines DESTINATION ${CMAKE_INSTALL_PREFIX}/bin)
                install(DIRECTORY ${FREECAD_LIBPACK_DIR}/plugins/sqldrivers DESTINATION ${CMAKE_INSTALL_PREFIX}/bin)
                install(DIRECTORY ${FREECAD_LIBPACK_DIR}/plugins/styles DESTINATION ${CMAKE_INSTALL_PREFIX}/bin)
                install(DIRECTORY ${FREECAD_LIBPACK_DIR}/plugins/printsupport DESTINATION ${CMAKE_INSTALL_PREFIX}/bin)
                install(DIRECTORY ${FREECAD_LIBPACK_DIR}/translations/qtwebengine_locales DESTINATION ${CMAKE_INSTALL_PREFIX}/translations)
                install(DIRECTORY ${FREECAD_LIBPACK_DIR}/resources DESTINATION ${CMAKE_INSTALL_PREFIX})
                install(DIRECTORY ${FREECAD_LIBPACK_DIR}/bin DESTINATION ${CMAKE_INSTALL_PREFIX})
                message(STATUS "Created install commands for INSTALL target.\n")
            endif(FREECAD_INSTALL_DEPEND_DIRS)
        endif(FREECAD_LIBPACK_USE AND LIBPACK_FOUND)
    endif()

    # Print message to start build process
    message("=================================================\n"
            "Now run 'cmake --build ${CMAKE_BINARY_DIR}' to build ${PROJECT_NAME}\n"
            "=================================================\n")
endmacro(PrintFinalReport)
