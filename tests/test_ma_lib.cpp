#include <catch2/catch_test_macros.hpp>
#include <ma_lib.h>

TEST_CASE("Addition works", "[add]") {
    REQUIRE(add(2, 3) == 5);
    REQUIRE(add(0, 0) == 0);
}
