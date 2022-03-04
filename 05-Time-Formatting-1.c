#if 0
    source "${TEST_LIB}/crunner" -lda
#endif

#include <limits.h>
#include <pwd.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <unistd.h>

#include "util.h"

test_start("Tests simple_time_format function.");

subtest("Comparing output against known values",
{
    char buf[128];
    simple_time_format(buf, 128, 0);
    test_assert_str(buf, "==", "Jan 01 1970", 128);
    test_printf("%s\n", buf);

    simple_time_format(buf, 128, 1646455768);
    test_assert_str(buf, "==", "Mar 05 2022", 128);
    test_printf("%s\n", buf);

    simple_time_format(buf, 128, 533472040);
    test_assert_str(buf, "==", "Nov 27 1986", 128);
    test_printf("%s\n", buf);

    simple_time_format(buf, 128, 9533472040);
    test_assert_str(buf, "==", "Feb 08 2272", 128);
    test_printf("%s\n", buf);

    simple_time_format(buf, 128, 936893349);
    test_assert_str(buf, "==", "Sep 09 1999", 128);
    test_printf("%s\n", buf);

    simple_time_format(buf, 128, 1122829270);
    test_assert_str(buf, "==", "Jul 31 2005", 128);
    test_printf("%s\n", buf);

});

test_end
