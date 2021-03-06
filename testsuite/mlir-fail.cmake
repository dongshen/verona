include(${CMAKE_CURRENT_LIST_DIR}/common.cmake)

PrepareTest(VERONAM_FLAGS EXPECTED_DUMP ACTUAL_DUMP)

CheckStatus(
  COMMAND ${MLIRGEN} ${TEST_FILE} -o -
  EXPECTED_STATUS 1
  ERROR_FILE ${CMAKE_CURRENT_BINARY_DIR}/${TEST_NAME}.out)

FileCheck(${TEST_FILE} ${CMAKE_CURRENT_BINARY_DIR}/${TEST_NAME}.out)

if(EXPECTED_DUMP)
  CheckDump(${EXPECTED_DUMP} ${ACTUAL_DUMP})
endif()
