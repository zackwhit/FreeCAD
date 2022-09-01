include_directories(
    ${CMAKE_CURRENT_BINARY_DIR}
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${Boost_INCLUDE_DIRS}
    ${COIN3D_INCLUDE_DIRS}
    ${ZLIB_INCLUDE_DIR}
    ${PYTHON_INCLUDE_DIRS}
)

set(ClipboardGui_LIBS
    #Clipboard
    FreeCADGui
)

SET(ClipboardGui_SRCS
    AppClipboardGui.cpp
    Command.cpp
    PreCompiled.cpp
    PreCompiled.h
    Workbench.cpp
    Workbench.h
)

add_library(ClipboardGui SHARED ${ClipboardGui_SRCS}) 
target_link_libraries(ClipboardGui ${ClipboardGui_LIBS})


SET_BIN_DIR(ClipboardGui ClipboardGui /Mod/Clipboard)
SET_PYTHON_PREFIX_SUFFIX(ClipboardGui)


INSTALL(TARGETS ClipboardGui DESTINATION ${CMAKE_INSTALL_LIBDIR})


