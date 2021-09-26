include(GNUInstallDirs)
include(CMakePackageConfigHelpers)

set(config_install_dir
        ${CMAKE_INSTALL_DATADIR}/cmake/xxbits)
set(config_version_cmake
        ${CMAKE_CURRENT_BINARY_DIR}/xxbits/xxbitsConfigVersion.cmake)

install(TARGETS         xxbits
        EXPORT          xxbitsConfig)

install(DIRECTORY       include/
                        ${CMAKE_CURRENT_BINARY_DIR}/include/
        DESTINATION     ${CMAKE_INSTALL_INCLUDEDIR}
        FILES_MATCHING  PATTERN "*.hxx")

install(EXPORT          xxbitsConfig
        DESTINATION     ${config_install_dir})

install(FILES           ${config_version_cmake}
        DESTINATION     ${config_install_dir})

export( TARGETS         xxbits
        FILE            xxbitsConfig.cmake)

write_basic_package_version_file(${config_version_cmake}
        VERSION         ${CMAKE_PROJECT_VERSION}
        COMPATIBILITY   SameMajorVersion)

