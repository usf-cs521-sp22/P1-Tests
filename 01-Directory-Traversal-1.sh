source "${TEST_LIB}/funcs.bash"

run_timeout=10

reference_output=$(cd "${TEST_DIR}/inputs/test-fs"; find ./dev -mindepth 1 | sort)

test_start "Checks the output against the test dev directory"

# This runs the 'da' program, then it filters out everything but lines that
# contain a slash ('/') character so that we only look at the paths that are
# printed out. The output is sorted and compared with the actual contents of the
# test 'dev' directory.

program_output=$(\
    cd "${TEST_DIR}/inputs/test-fs"; \
    ${TEST_DIR}/../da ./dev \
    | tr '[:space:]' '\n' | grep '/' | sort)

compare_outputs

test_end
