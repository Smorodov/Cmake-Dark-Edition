include(RunCMake)

function(run_build name)
  set(RunCMake_TEST_BINARY_DIR ${RunCMake_BINARY_DIR}/${name}-build)
  run_cmake(${name})
  set(RunCMake_TEST_NO_CLEAN 1)
  run_cmake_command(${name}-build ${CMAKE_COMMAND} --build . --config Debug)
endfunction()

run_cmake(unitybuild_c)
run_cmake(unitybuild_c_batch)
run_cmake(unitybuild_c_group)
run_cmake(unitybuild_cxx)
run_cmake(unitybuild_cxx_group)
run_cmake(unitybuild_c_and_cxx)
run_cmake(unitybuild_c_and_cxx_group)
run_cmake(unitybuild_batchsize)
run_cmake(unitybuild_default_batchsize)
run_cmake(unitybuild_skip)
run_cmake(unitybuild_code_before_and_after_include)
run_cmake(unitybuild_c_no_unity_build)
run_cmake(unitybuild_c_no_unity_build_group)
run_cmake(unitybuild_order)
run_cmake(unitybuild_invalid_mode)
run_build(unitybuild_anon_ns)
run_build(unitybuild_anon_ns_no_unity_build)
run_build(unitybuild_anon_ns_group_mode)

function(run_test name)
  set(RunCMake_TEST_BINARY_DIR ${RunCMake_BINARY_DIR}/${name}-build)
  run_cmake(${name})
  set(RunCMake_TEST_NO_CLEAN 1)
  run_cmake_command(${name}-build ${CMAKE_COMMAND} --build . --config Debug)
  run_cmake_command(${name}-test ${CMAKE_CTEST_COMMAND} -C Debug)
endfunction()

run_test(unitybuild_runtest)
run_test(unitybuild_object_library)
