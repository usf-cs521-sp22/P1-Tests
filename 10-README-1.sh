source "${TEST_LIB}/funcs.bash"

test_start "README Check" \
    "Ensures the readme has been filled out."

checksum=$(md5sum "${TEST_LIB}/../README.md" | awk '{print $1}')
if [[ "${checksum}" == "c088c160ea307070fae1924a0168c40f" ]]; then
    cp -v "${TEST_DIR}/README.md.template" "${TEST_DIR}/../README.md"
fi

grep 'TODO' "${TEST_DIR}/../README.md" || test_end 0

test_end 1 # If the grep above found any TODOs, the test case fails.
