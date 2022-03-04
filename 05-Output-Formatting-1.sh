source "${TEST_LIB}/funcs.bash"

run_timeout=10

reference_output=$(cd "${TEST_DIR}/inputs/test-fs"; \
    ${TEST_DIR}/scripts/das ./etc | sort)

test_start "Checks the program output for file names, sizes, and access times"

program_output=$(cd "${TEST_DIR}/inputs/test-fs"; ${TEST_DIR}/../da ./etc | sort)

compare_outputs

test_end
