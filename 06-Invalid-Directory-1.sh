source "${TEST_LIB}/funcs.bash"

run_timeout=10

test_start "Checks the output against the entire test dataset"

program_output=$("${TEST_LIB}/../da" /this/does/not/exist)
return=$?

# This ensures the program returns '1' (EXIT_FAILURE) if the directory that was
# passed in does not exist. The program also should not segfault!

if [[ "${return}" -eq 1 ]]; then
    test_end 0
else
    test_end 1
fi

