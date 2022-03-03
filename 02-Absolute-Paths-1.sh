source "${TEST_LIB}/funcs.bash"

run_timeout=10

reference_output=$(find "${TEST_DIR}/inputs/test-fs/tiny" -mindepth 1 | sort)

test_start "Ensures the program works with absolute paths (start with '/')"

program_output=$(\
    ${TEST_DIR}/../da "${TEST_DIR}/inputs/test-fs/tiny" \
    | tr '[:space:]' '\n' | grep '/' | sort)

# First, let's print the expected program output:
echo "${reference_output}"

# Then the program output:
echo "${program_output}"

# And finally, compare them:
compare_outputs

test_end
