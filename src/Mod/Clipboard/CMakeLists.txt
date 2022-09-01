if(BUILD_GUI)
    add_subdirectory(Gui)
endif(BUILD_GUI)

SET(Clipboard_SRCS
    Init.py
    InitGui.py
)

SOURCE_GROUP("" FILES ${Clipboard_SRCS})

ADD_CUSTOM_TARGET(Clipboard ALL
    SOURCES ${Clipboard_SRCS}
)

fc_copy_sources(Clipboard "${CMAKE_BINARY_DIR}/Mod/Clipboard" ${Clipboard_SRCS})

INSTALL(
    FILES
        ${Clipboard_SRCS}
    DESTINATION
        Mod/Clipboard
)
