/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#include <cstdarg>
#include <ctime>
#include <gtest/gtest.h>
#include <list>
#include <ostream>
#include <pthread.h>
#include <queue>
#include <regex>
#include <securec.h>
#include <streambuf>
#include <sys/time.h>
#include <thread>

#include "file_utils.h"
#include "hilog/log_c.h"
#include "hilog/log_cpp.h"


#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0xD003200
#define LOG_TAG "HILOGTOOLTEST"
#define MAX_LINE  1024*10
using namespace OHOS;
using namespace HiviewDFX;
using namespace testing::ext;
using namespace std;
const int g_logPerThread = 1000;


class LibhilogTooltest : public testing::Test {
public:
    string input, result, expect;
    static void SetUpTestCase();
    static void TearDownTestCase();
    void SetUp();
    void TearDown();
    string gHilogtoolExecutable = "hilog ";
    string g_logContent = "123456789_1234567890_public and private log test is:\
    %{public}d, %{private}lf, %{public}.2f, %s, %{private}c";
    string g_commonContent = "03200/HILOGTOOLTEST: 123456789_1234567890_public and private log test is:";
private:

};
void LibhilogTooltest::SetUp()
{
}
void LibhilogTooltest::TearDown()
{
}
void LibhilogTooltest::SetUpTestCase()
{
    ExeCmd("hilog -p on");
    ExeCmd("hilog -Q domainoff");
    ExeCmd("hilog -Q pidoff");
    ExeCmd("hilog -b debug");
    ExeCmd("hilog -b debug -D 218116608");
    ExeCmd("hilog -b debug -T HILOGTOOLTEST");
    ExeCmd("hilog -r -t all");
    ExeCmd("hilog -G 1m -t all");
    ExeCmd("hilog -S -t all");
    ExeCmd("hilog -S -D 218116608");
}
void LibhilogTooltest::TearDownTestCase()
{
    ExeCmd("hilog -p on");
    ExeCmd("hilog -Q domainoff");
    ExeCmd("hilog -Q pidoff");
    ExeCmd("hilog -b debug");
    ExeCmd("hilog -b debug -D 218116608");
    ExeCmd("hilog -b debug -T HILOGTOOLTEST");
    ExeCmd("hilog -r -t all");
    ExeCmd("hilog -G 1m -t all");
    ExeCmd("hilog -S -t all");
    ExeCmd("hilog -S -D 218116608");
    std::cout << "TearDownTestCase" << std::endl;
}

/*
 * @tc.name buffer size test
 * @tc.number DFX_DFT_HilogCPP_1020
 * @tc.desc Querying the buffer size of default log types (Ccore and app)
*/
HWTEST_F(LibhilogTooltest, buff_size_default, Function|MediumTest|Level2)
{
    result = ExecuteCmd("hilog -g");
    expect = "core buffer size is 1M\napp buffer size is 1M\n\n";
    EXPECT_STREQ(result.c_str(), expect.c_str());
}

/*
 * @tc.name buffer size test
 * @tc.number DFX_DFT_HilogCPP_1030
 * @tc.desc Queries the buffer size of a specified type (core).
*/
HWTEST_F(LibhilogTooltest, buff_size_core, Function|MediumTest|Level3)
{
    result = ExecuteCmd("hilog -g -t core");
    expect = "core buffer size is 1M\n\n";
    EXPECT_STREQ(result.c_str(), expect.c_str());
}

/*
 * @tc.name buffer size test
 * @tc.number DFX_DFT_HilogCPP_1040
 * @tc.desc Queries the buffer size of a specified type (app).
*/
HWTEST_F(LibhilogTooltest, buff_size_app, Function|MediumTest|Level3)
{
    result = ExecuteCmd("hilog -g -t app");
    expect = "app buffer size is 1M\n\n";
    EXPECT_STREQ(result.c_str(), expect.c_str());
}

/*
 * @tc.name buffer size test
 * @tc.number DFX_DFT_HilogCPP_1050
 * @tc.desc Queries the buffer size of a specified type (init).
*/
HWTEST_F(LibhilogTooltest, buff_size_init, Function|MediumTest|Level3)
{
    result = ExecuteCmd("hilog -g -t init");
    expect = "init buffer size is 1M\n\n";
    EXPECT_STREQ(result.c_str(), expect.c_str());
}

/*
 * @tc.name buffer size test
 * @tc.number DFX_DFT_HilogCPP_1060
 * @tc.desc Queries the buffer size of multiple types
*/
HWTEST_F(LibhilogTooltest, buff_size_multiple, Function|MediumTest|Level3)
{
    result = ExecuteCmd("hilog -g -t 'core app'");
    expect = "core buffer size is 1M\napp buffer size is 1M\n\n";
    EXPECT_STREQ(result.c_str(), expect.c_str());
}

/*
 * @tc.name buffer size test
 * @tc.number DFX_DFT_HilogCPP_1070
 * @tc.desc Queries the buffer size of all types
*/
HWTEST_F(LibhilogTooltest, buff_size_all, Function|MediumTest|Level3)
{
    result = ExecuteCmd("hilog -g -t all");
    expect = "core buffer size is 1M\napp buffer size is 1M\ninit buffer size is 1M\n\n";
    EXPECT_STREQ(result.c_str(), expect.c_str());
}

/*
 * @tc.name buffer size test
 * @tc.number DFX_DFT_HilogCPP_1080
 * @tc.desc Queries the buffer size of a nonexistent type
*/
HWTEST_F(LibhilogTooltest, buff_size_illegal, Function|MediumTest|Level4)
{
    result = ExecuteCmd("hilog -g -t abc");
    expect = "Invalid parameter\n";
    EXPECT_STREQ(result.c_str(), expect.c_str());
}

/*
 * @tc.name buffer size test
 * @tc.number DFX_DFT_HilogCPP_1090
 * @tc.desc Queries the buffer size of multiple types, including nonexistent types.
*/
HWTEST_F(LibhilogTooltest, buff_size_illegal2, Function|MediumTest|Level4)
{
    result = ExecuteCmd("hilog -g -t 'core abc'");
    expect = "buffsize operation error!\n";
    EXPECT_STREQ(result.c_str(), expect.c_str());
}

/*
 * @tc.name buffer size test
 * @tc.number DFX_DFT_HilogCPP_1100
 * @tc.desc Set the buffer size without unit. (The default log type is core and app.)
*/
HWTEST_F(LibhilogTooltest, buff_resize_byte, Function|MediumTest|Level3)
{
    result = ExecuteCmd("hilog -G 200");
    expect = "core buffer size is 200B\napp buffer size is 200B\n\n";
    EXPECT_STREQ(result.c_str(), expect.c_str());
    ExeCmd("hilog -G 1m -t all");
}

/*
 * @tc.name buffer size test
 * @tc.number DFX_DFT_HilogCPP_1110
 * @tc.desc Set the buffer size to **b.
*/
HWTEST_F(LibhilogTooltest, buff_resize_byte2, Function|MediumTest|Level3)
{
    result = ExecuteCmd("hilog -G 200b");
    expect = "core buffer size is 200B\napp buffer size is 200B\n\n";
    EXPECT_STREQ(result.c_str(), expect.c_str());
    ExeCmd("hilog -G 1m -t all");
}

/*
 * @tc.name buffer size test
 * @tc.number DFX_DFT_HilogCPP_1120
 * @tc.desc Set the buffer size to **B
*/
HWTEST_F(LibhilogTooltest, buff_resize_byte3, Function|MediumTest|Level3)
{
    result = ExecuteCmd("hilog -G 200B");
    expect = "core buffer size is 200B\napp buffer size is 200B\n\n";
    EXPECT_STREQ(result.c_str(), expect.c_str());
    ExeCmd("hilog -G 1m -t all");
}

/*
 * @tc.name buffer size test
 * @tc.number DFX_DFT_HilogCPP_1130
 * @tc.desc Set the buffer size to **k
*/
HWTEST_F(LibhilogTooltest, buff_resize_kbyte, Function|MediumTest|Level3)
{
    result = ExecuteCmd("hilog -G 2k");
    expect = "core buffer size is 2K\napp buffer size is 2K\n\n";
    EXPECT_STREQ(result.c_str(), expect.c_str());
    ExeCmd("hilog -G 1m -t all");
}

/*
 * @tc.name buffer size test
 * @tc.number DFX_DFT_HilogCPP_1140
 * @tc.desc Set the buffer size to **K
*/
HWTEST_F(LibhilogTooltest, buff_resize_kbyte2, Function|MediumTest|Level3)
{
    result = ExecuteCmd("hilog -G 2K");
    expect = "core buffer size is 2K\napp buffer size is 2K\n\n";
    EXPECT_STREQ(result.c_str(), expect.c_str());
    ExeCmd("hilog -G 1m -t all");
}

/*
 * @tc.name buffer size test
 * @tc.number DFX_DFT_HilogCPP_1150
 * @tc.desc Set the buffer size to **m
*/
HWTEST_F(LibhilogTooltest, buff_resize_mbyte, Function|MediumTest|Level3)
{
    result = ExecuteCmd("hilog -G 2m");
    expect = "core buffer size is 2M\napp buffer size is 2M\n\n";
    EXPECT_STREQ(result.c_str(), expect.c_str());
    ExeCmd("hilog -G 1m -t all");
}

/*
 * @tc.name buffer size test
 * @tc.number DFX_DFT_HilogCPP_1160
 * @tc.desc Set the buffer size to **M
*/
HWTEST_F(LibhilogTooltest, buff_resize_mbyte2, Function|MediumTest|Level3)
{
    result = ExecuteCmd("hilog -G 2M");
    expect = "core buffer size is 2M\napp buffer size is 2M\n\n";
    EXPECT_STREQ(result.c_str(), expect.c_str());
    ExeCmd("hilog -G 1m -t all");
}

/*
 * @tc.name buffer size test
 * @tc.number DFX_DFT_HilogCPP_1170
 * @tc.desc Set the buffer size to **g
*/
HWTEST_F(LibhilogTooltest, buff_resize_gbyte, Function|MediumTest|Level3)
{
    result = ExecuteCmd("hilog -G 1g");
    expect = "core buffer size is 1G\napp buffer size is 1G\n\n";
    EXPECT_STREQ(result.c_str(), expect.c_str());
    ExeCmd("hilog -G 1m -t all");
}

/*
 * @tc.name buffer size test
 * @tc.number DFX_DFT_HilogCPP_1180
 * @tc.desc Set the buffer size to **G
*/
HWTEST_F(LibhilogTooltest, buff_resize_gbyte2, Function|MediumTest|Level3)
{
    result = ExecuteCmd("hilog -G 1G");
    expect = "core buffer size is 1G\napp buffer size is 1G\n\n";
    EXPECT_STREQ(result.c_str(), expect.c_str());
    ExeCmd("hilog -G 1m -t all");
}

/*
 * @tc.name buffer size test
 * @tc.number DFX_DFT_HilogCPP_1190
 * @tc.desc Set the buffer size to 0
*/
HWTEST_F(LibhilogTooltest, buff_resize_illegal, Function|MediumTest|Level4)
{
    result = ExecuteCmd("hilog -G 0");
    expect = "core buffer resize fail\napp buffer resize fail\n\n";
    EXPECT_STREQ(result.c_str(), expect.c_str());
}

/*
 * @tc.name buffer size test
 * @tc.number DFX_DFT_HilogCPP_1200
 * @tc.desc Set the buffer size to exceed the maximum length
*/
HWTEST_F(LibhilogTooltest, buff_resize_illegal2, Function|MediumTest|Level3)
{
    result = ExecuteCmd("hilog -G 2g");
    expect = "core buffer resize fail\napp buffer resize fail\n\n";
    EXPECT_STREQ(result.c_str(), expect.c_str());
}

/*
 * @tc.name buffer size test
 * @tc.number DFX_DFT_HilogCPP_1210
 * @tc.desc Set the buffer size according to a single log type (core)
*/

HWTEST_F(LibhilogTooltest, buff_resize_core, Function|MediumTest|Level3)
{
    result = ExecuteCmd("hilog -G 2m -t core");
    expect = "core buffer size is 2M\n\n";
    EXPECT_STREQ(result.c_str(), expect.c_str());
    ExeCmd("hilog -G 1m -t all");
}

/*
 * @tc.name buffer size test
 * @tc.number DFX_DFT_HilogCPP_1220
 * @tc.desc Set the buffer size according to a single log type (app)
*/
HWTEST_F(LibhilogTooltest, buff_resize_app, Function|MediumTest|Level3)
{
    result = ExecuteCmd("hilog -G 2m -t app");
    expect = "app buffer size is 2M\n\n";
    EXPECT_STREQ(result.c_str(), expect.c_str());
    ExeCmd("hilog -G 1m -t all");
}

/*
 * @tc.name buffer size test
 * @tc.number DFX_DFT_HilogCPP_1230
 * @tc.desc Set the buffer size according to a single log type (init)
*/
HWTEST_F(LibhilogTooltest, buff_resize_init, Function|MediumTest|Level3)
{
    result = ExecuteCmd("hilog -G 2m -t init");
    expect = "init buffer size is 2M\n\n";
    EXPECT_STREQ(result.c_str(), expect.c_str());
    ExeCmd("hilog -G 1m -t all");
}

/*
 * @tc.name buffer size test
 * @tc.number DFX_DFT_HilogCPP_1240
 * @tc.desc Set the buffer size according to multiple log types
*/
HWTEST_F(LibhilogTooltest, buff_resize_multyple, Function|MediumTest|Level2)
{
    result = ExecuteCmd("hilog -G 2m -t 'core app'");
    expect = "core buffer size is 2M\napp buffer size is 2M\n\n";
    EXPECT_STREQ(result.c_str(), expect.c_str());
    ExeCmd("hilog -G 1m -t all");
}

/*
 * @tc.name buffer size test
 * @tc.number DFX_DFT_HilogCPP_1250
 * @tc.desc Set the buffer size of all log types
*/
HWTEST_F(LibhilogTooltest, buff_resize_all, Function|MediumTest|Level4)
{
    result = ExecuteCmd("hilog -G 1m -t all");
    expect = "core buffer size is 1M\napp buffer size is 1M\ninit buffer size is 1M\n\n";
    EXPECT_STREQ(result.c_str(), expect.c_str());
}

/*
 * @tc.name buffer size test
 * @tc.number DFX_DFT_HilogCPP_1260
 * @tc.desc Set the non-existent log type buffer size
*/
HWTEST_F(LibhilogTooltest, buff_resize_illegal_type, Function|MediumTest|Level4)
{
    result = ExecuteCmd("hilog -G 2m -t abc");
    expect = "Invalid parameter\n";
    EXPECT_STREQ(result.c_str(), expect.c_str());
    ExeCmd("hilog -G 1m -t all");
}

/*
 * @tc.name buffer size test
 * @tc.number DFX_DFT_HilogCPP_1270
 * @tc.desc Set multiple log types, including non-existent log types
*/
HWTEST_F(LibhilogTooltest, buff_resize_illegal_type2, Function|MediumTest|Level4)
{
    result = ExecuteCmd("hilog -G 2m -t 'core abc'");
    expect = "buffsize operation error!\n";
    EXPECT_STREQ(result.c_str(), expect.c_str());
    ExeCmd("hilog -G 1m -t all");
}

/*
 * @tc.name buffer size test
 * @tc.number DFX_DFT_HilogCPP_1280
 * @tc.desc Re-query the buffer size after the setting operation
*/
HWTEST_F(LibhilogTooltest, buff_resize_check, Function|MediumTest|Level3)
{
    // re query after set
    result = ExecuteCmd("hilog -g -t all");
    expect = "core buffer size is 1M\napp buffer size is 1M\ninit buffer size is 1M\n\n";
    EXPECT_STREQ(result.c_str(), expect.c_str());
}

/*
 * @tc.name buffer size test
 * @tc.number DFX_DFT_HilogCPP_1290
 * @tc.desc The size of the core buffer is set to 200 bytes, and the size of logs exceeds 200 bytes.
*/
HWTEST_F(LibhilogTooltest, buff_resize_check_core, Function|MediumTest|Level3)
{
    int i = 1;
    ExeCmd("hilog -G 200 -t core");
    ExeCmd("hilog -r -t all");
    i = 1;
    while (i <= 10) {
        HILOG_FATAL(LOG_CORE, "123456789_1234567890_public and private log test is: \
%{public}d, %{public}lf, %{public}.2f, %{public}s, %{public}c", i, 1.00001, 2.333333, "sse", 'a');
        i++;
    }
    result = ExecuteCmd("hilog -x -t core |wc -l");
    expect = "10";
    EXPECT_LT(stoi(result), stoi(expect));
    // end recover default
    ExeCmd("hilog -r -t all");
    ExeCmd("hilog -G 1m -t all");
}

/*
 * @tc.name buffer size test
 * @tc.number DFX_DFT_HilogCPP_1300
 * @tc.desc The size of the app buffer is set to 200 bytes, and the size of logs exceeds 200 bytes.
*/
HWTEST_F(LibhilogTooltest, buff_resize_check_app, Function|MediumTest|Level4)
{
    int i = 1;
    ExeCmd("hilog -G 200 -t app");
    ExeCmd("hilog -r -t all");
    i = 1;
    while (i <= 10) {
        HILOG_FATAL(LOG_APP, "123456789_1234567890_public and private log test is: \
%{public}d, %{public}lf, %{public}.2f, %{public}s, %{public}c", i, 1.00001, 2.333333, "sse", 'a');
        i++;
    }
    result = ExecuteCmd("hilog -x -t app |wc -l");
    expect = "10";
    EXPECT_LT(stoi(result), stoi(expect));
    // end recover default
    ExeCmd("hilog -r -t all");
    ExeCmd("hilog -G 1m -t all");
}

/*
 * @tc.name buffer size test
 * @tc.number DFX_DFT_HilogCPP_1310
 * @tc.desc The size of the init buffer is set to 200 bytes, and the size of logs exceeds 200 bytes.
*/
HWTEST_F(LibhilogTooltest, buff_resize_check_init, Function|MediumTest|Level4)
{
    int i = 1;
    ExeCmd("hilog -G 200 -t init");
    ExeCmd("hilog -r -t all");
    i = 1;
    while (i <= 10) {
        HILOG_FATAL(LOG_INIT, "123456789_1234567890_public and private log test is: \
%{public}d, %{public}lf, %{public}.2f, %{public}s, %{public}c", i, 1.00001, 2.333333, "sse", 'a');
        i++;
    }
    result = ExecuteCmd("hilog -x -t init |wc -l");
    expect = "10";
    EXPECT_LT(stoi(result), stoi(expect));
    // end recover default
    ExeCmd("hilog -r -t all");
    ExeCmd("hilog -G 1m -t all");
}

/*
 * @tc.name Querying and clearing statistics by log
 * @tc.number DFX_DFT_HilogCPP_1320
 * @tc.desc Query the statistics of the core log
*/
HWTEST_F(LibhilogTooltest, statistic_info_query_core, Function|MediumTest|Level2)
{
    int i = 1;
    ExeCmd("hilog -r -t all");
    ExeCmd("hilog -S -t core");

    // write and read
    i = 1;
    while (i <= 1000) {
        HILOG_FATAL(LOG_CORE, "123456789_1234567890_public and private log test is: \
%{public}d, %{public}lf, %{public}.2f, %{public}s, %{public}c", i, 1.00001, 2.333333, "sse", 'a');
        i++;
    }
    ExeCmd("hilog -x -t core >/dev/null 2>&1");
    result = ExecuteCmd("hilog -s -t core");
    expect = "core print log length is 78K\ncore cache log length is 78K\ncore dropped log lines is 0B\n";
    EXPECT_STREQ(result.c_str(), expect.c_str());
}

/*
 * @tc.name Querying and clearing statistics by log
 * @tc.number DFX_DFT_HilogCPP_1330
 * @tc.desc Query the statistics of the app log
*/
HWTEST_F(LibhilogTooltest, statistic_info_query_app, Function|MediumTest|Level3)
{
    int i = 1;
    ExeCmd("hilog -r -t all");
    ExeCmd("hilog -S -t app");

    // write and read
    i = 1;
    while (i <= 1000) {
        HILOG_FATAL(LOG_APP, "123456789_1234567890_public and private log test is: \
%{public}d, %{public}lf, %{public}.2f, %{public}s, %{public}c", i, 1.00001, 2.333333, "sse", 'a');
        i++;
    }
    ExeCmd("hilog -x -t app >/dev/null 2>&1");
    result = ExecuteCmd("hilog -s -t app");
    expect = "app print log length is 78K\napp cache log length is 78K\napp dropped log lines is 0B\n";
    EXPECT_STREQ(result.c_str(), expect.c_str());
}

/*
 * @tc.name Querying and clearing statistics by log
 * @tc.number DFX_DFT_HilogCPP_1340
 * @tc.desc Query the statistics of the init log
*/
HWTEST_F(LibhilogTooltest, statistic_info_query_init, Function|MediumTest|Level3)
{
    int i = 1;
    ExeCmd("hilog -r -t all");
    ExeCmd("hilog -S -t init");
    // write and read
    i = 1;
    while (i <= 1000) {
        HILOG_FATAL(LOG_INIT, "123456789_1234567890_public and private log test is: \
%{public}d, %{public}lf, %{public}.2f, %{public}s, %{public}c", i, 1.00001, 2.333333, "sse", 'a');
        i++;
    }
    ExeCmd("hilog -x -t init >/dev/null 2>&1");
    result = ExecuteCmd("hilog -s -t init");
    expect = "init print log length is 78K\ninit cache log length is 78K\ninit dropped log lines is 0B\n";
    EXPECT_STREQ(result.c_str(), expect.c_str());
}

/*
 * @tc.name Querying and clearing statistics by log
 * @tc.number DFX_DFT_HilogCPP_1350
 * @tc.desc Clear the statistics of the core log
*/
HWTEST_F(LibhilogTooltest, statistic_info_clear_core, Function|MediumTest|Level3)
{
    result = ExecuteCmd("hilog -S -t core");
    expect = "core statistic info clear success \n";
    EXPECT_STREQ(result.c_str(), expect.c_str());
}

/*
 * @tc.name Querying and clearing statistics by log
 * @tc.number DFX_DFT_HilogCPP_1360
 * @tc.desc Clear the statistics of the app log
*/
HWTEST_F(LibhilogTooltest, statistic_info_clear_app, Function|MediumTest|Level4)
{
    result = ExecuteCmd("hilog -S -t app");
    expect = "app statistic info clear success \n";
    EXPECT_STREQ(result.c_str(), expect.c_str());
}

/*
 * @tc.name Querying and clearing statistics by log
 * @tc.number DFX_DFT_HilogCPP_1370
 * @tc.desc Clear the statistics of the init log
*/
HWTEST_F(LibhilogTooltest, statistic_info_clear_init, Function|MediumTest|Level4)
{
    result = ExecuteCmd("hilog -S -t init");
    expect = "init statistic info clear success \n";
    EXPECT_STREQ(result.c_str(), expect.c_str());
}

/*
 * @tc.name Querying and clearing statistics by log
 * @tc.number DFX_DFT_HilogCPP_1380
 * @tc.desc Query statistics of non-existent log
*/
HWTEST_F(LibhilogTooltest, statistic_info_query_illegal, Function|MediumTest|Level3)
{
    result = ExecuteCmd("hilog -s -t abc");
    expect = "Invalid parameter\n";
    EXPECT_STREQ(result.c_str(), expect.c_str());
}

/*
 * @tc.name Querying and clearing statistics by log
 * @tc.number DFX_DFT_HilogCPP_1390
 * @tc.desc Clear statistics of non-existent log
*/
HWTEST_F(LibhilogTooltest, statistic_info_clear_illegal, Function|MediumTest|Level4)
{
    result = ExecuteCmd("hilog -S -t abc");
    expect = "Invalid parameter\n";
    EXPECT_STREQ(result.c_str(), expect.c_str());
}

/*
 * @tc.name Querying and clearing statistics by log
 * @tc.number DFX_DFT_HilogCPP_1400
 * @tc.desc Re-query after clearing
*/
HWTEST_F(LibhilogTooltest, statistic_info_check, Function|MediumTest|Level3)
{
    // re query after clear
    ExeCmd("hilog -S -t core");
    result = ExecuteCmd("hilog -s -t core");
    expect = "core print log length is 0B\ncore cache log length is 0B\ncore dropped log lines is 0B\n";
    EXPECT_STREQ(result.c_str(), expect.c_str());
}

/*
 * @tc.name Querying and clearing statistics by domain
 * @tc.number DFX_DFT_HilogCPP_1410
 * @tc.desc Query the statistics of the specified domain
*/
HWTEST_F(LibhilogTooltest, statistic_info_query_domain, Function|MediumTest|Level2)
{
    int i = 1;
    ExeCmd("hilog -r -t all");
    ExeCmd("hilog -S -D 218116608");
    // write and read
    i = 1;
    while (i <= 1000) {
        HILOG_FATAL(LOG_CORE, "123456789_1234567890_public and private log test is: \
%{public}d, %{public}lf, %{public}.2f, %{public}s, %{public}c", i, 1.00001, 2.333333, "sse", 'a');
        i++;
    }
    ExeCmd("hilog -x -t core >/dev/null 2>&1");
    result = ExecuteCmd("hilog -s -D 218116608");
    expect = "218116608 print log length is 78K\n218116608 cache log length is 78K\n\
218116608 dropped log lines is 0B\n";
    EXPECT_STREQ(result.c_str(), expect.c_str());
}

/*
 * @tc.name Querying and clearing statistics by domain
 * @tc.number DFX_DFT_HilogCPP_1420
 * @tc.desc Clear the statistics of the specified domain
*/
HWTEST_F(LibhilogTooltest, statistic_info_clear_domain, Function|MediumTest|Level3)
{
    result = ExecuteCmd("hilog -S -D 218116608");
    expect = "218116608 statistic info clear success \n";
    EXPECT_STREQ(result.c_str(), expect.c_str());
}

/*
 * @tc.name Querying and clearing statistics by domain
 * @tc.number DFX_DFT_HilogCPP_1430
 * @tc.desc Query the statistics of nonexistent domain
*/
HWTEST_F(LibhilogTooltest, statistic_info_query_domain2, Function|MediumTest|Level3)
{
    int i = 1;
    ExeCmd("hilog -r -t all");
    ExeCmd("hilog -S -D 218116608");
    // write and read
    i = 1;
    while (i <= 1000) {
        HILOG_FATAL(LOG_CORE, "123456789_1234567890_public and private log test is: \
%{public}d, %{public}lf, %{public}.2f, %{public}s, %{public}c", i, 1.00001, 2.333333, "sse", 'a');
        i++;
    }
    ExeCmd("hilog -x -t core >/dev/null 2>&1");
    result = ExecuteCmd("hilog -s -D 1");
    expect = "1 print log length is 0B\n1 cache log length is 0B\n1 dropped log lines is 0B\n";
    EXPECT_STREQ(result.c_str(), expect.c_str());
}

/*
 * @tc.name Querying and clearing statistics by domain
 * @tc.number DFX_DFT_HilogCPP_1440
 * @tc.desc Clear the statistics of nonexistent domain
*/
HWTEST_F(LibhilogTooltest, statistic_info_clear_domain2, Function|MediumTest|Level4)
{
    result = ExecuteCmd("hilog -S -D 1");
    expect = "1 statistic info clear success \n";
    EXPECT_STREQ(result.c_str(), expect.c_str());
}


/*
 * @tc.name Clearing the logs of the corresponding buffer by log type
 * @tc.number DFX_DFT_HilogCPP_1630
 * @tc.desc Clear the default logs (core、app)
*/
HWTEST_F(LibhilogTooltest, log_clear_default, Function|MediumTest|Level2)
{
    result = ExecuteCmd("hilog -r");
    expect = "core log clear success \napp log clear success \n\n";
    EXPECT_STREQ(result.c_str(), expect.c_str());
}

/*
 * @tc.name Clearing the logs of the corresponding buffer by log type
 * @tc.number DFX_DFT_HilogCPP_1640
 * @tc.desc Clear the core log
*/
HWTEST_F(LibhilogTooltest, log_clear_core, Function|MediumTest|Level3)
{
    result = ExecuteCmd("hilog -r -t core");
    expect = "core log clear success \n\n";
    EXPECT_STREQ(result.c_str(), expect.c_str());
}

/*
 * @tc.name Clearing the logs of the corresponding buffer by log type
 * @tc.number DFX_DFT_HilogCPP_1650
 * @tc.desc Clear the app log
*/
HWTEST_F(LibhilogTooltest, log_clear_app, Function|MediumTest|Level4)
{
    result = ExecuteCmd("hilog -r -t app");
    expect = "app log clear success \n\n";
    EXPECT_STREQ(result.c_str(), expect.c_str());
}

/*
 * @tc.name Clearing the logs of the corresponding buffer by log type
 * @tc.number DFX_DFT_HilogCPP_1660
 * @tc.desc Clear the init log
*/
HWTEST_F(LibhilogTooltest, log_clear_inti, Function|MediumTest|Level4)
{
    result = ExecuteCmd("hilog -r -t init");
    expect = "init log clear success \n\n";
    EXPECT_STREQ(result.c_str(), expect.c_str());
}

/*
 * @tc.name Clearing the logs of the corresponding buffer by log type
 * @tc.number DFX_DFT_HilogCPP_1670
 * @tc.desc Clear multiple types of logs
*/
HWTEST_F(LibhilogTooltest, log_clear_multiple, Function|MediumTest|Level3)
{
    result = ExecuteCmd("hilog -r -t 'core app'");
    expect = "core log clear success \napp log clear success \n\n";
    EXPECT_STREQ(result.c_str(), expect.c_str());
}

/*
 * @tc.name Clearing the logs of the corresponding buffer by log type
 * @tc.number DFX_DFT_HilogCPP_1680
 * @tc.desc Clear all types of logs.
*/
HWTEST_F(LibhilogTooltest, log_clear_all, Function|MediumTest|Level4)
{
    result = ExecuteCmd("hilog -r -t all");
    expect = "core log clear success \napp log clear success \ninit log clear success \n\n";
    EXPECT_STREQ(result.c_str(), expect.c_str());
}

/*
 * @tc.name Clearing the logs of the corresponding buffer by log type
 * @tc.number DFX_DFT_HilogCPP_1690
 * @tc.desc Clear nonexistent types of logs
*/
HWTEST_F(LibhilogTooltest, log_clear_illegal, Function|MediumTest|Level4)
{
    result = ExecuteCmd("hilog -r -t abc");
    expect = "Invalid parameter\n";
    EXPECT_STREQ(result.c_str(), expect.c_str());
}

/*
 * @tc.name Clearing the logs of the corresponding buffer by log type
 * @tc.number DFX_DFT_HilogCPP_1700
 * @tc.desc Clear multiple types of logs including nonexistent types
*/
HWTEST_F(LibhilogTooltest, log_clear_illegal2, Function|MediumTest|Level4)
{
    result = ExecuteCmd("hilog -r -t 'abc core'");
    expect = "clear log operation error!\n";
    EXPECT_STREQ(result.c_str(), expect.c_str());
}


/*
 * @tc.name Setting the log printing level (isLoggable)
 * @tc.number DFX_DFT_HilogCPP_1450
 * @tc.desc Set the global log printing level to fatal and print the fatal log.
*/
HWTEST_F(LibhilogTooltest, log_leval_global_set, Function|MediumTest|Level2)
{
    bool ret;
    int i = 1;
    ExeCmd("hilog -b fatal");
    ExeCmd("hilog -r -t all");
    HILOG_FATAL(LOG_CORE, "123456789_1234567890_public and private log test is: \
%{public}d, %{public}lf, %{public}.2f, %{public}s, %{public}c", i, 1.00001, 2.333333, "sse", 'a');
    result = ExecuteCmd("hilog -a 1 -x -t core");
    expect = "03200/HILOGTOOLTEST: 123456789_1234567890_public and private log test is: \
1, 1.000010, 2.33, sse, a";
    if (result.find(expect) != std::string::npos) {
        ret = true;
    } else {
        ret = false;
    }
    EXPECT_EQ(ret, true);
    // test end recover log level
    ExeCmd("hilog -b debug");
    ExeCmd("hilog -b debug -D 218116608");
    ExeCmd("hilog -b debug -T HILOGTOOLTEST");
}


/*
 * @tc.name Setting the log printing level (isLoggable)
 * @tc.number DFX_DFT_HilogCPP_1460
 * @tc.desc Set the global log printing level to fatal and print logs lower than level fatal
*/
HWTEST_F(LibhilogTooltest, log_level_global_set2, Function|MediumTest|Level3)
{
    bool ret;
    int i = 1;
#ifndef LOCALTEST
    ExeCmd("hilog -b fatal");
    ExeCmd("hilog -r -t all");
    HILOG_ERROR(LOG_CORE, "123456789_1234567890_public and private log test is: \
%{public}d, %{public}lf, %{public}.2f, %{public}s, %{public}c", i, 1.00001, 2.333333, "sse", 'a');
    result = ExecuteCmd("hilog -a 1 -x -t core");
    expect = "03200/HILOGTOOLTEST: 123456789_1234567890_public and private log test is: \
1, 1.000010, 2.33, sse, a";
    if (result.find(expect) == std::string::npos) {
        ret = true;
    } else {
        ret = false;
    }
    EXPECT_EQ(ret, true);
#endif
    // test end recover log level
    ExeCmd("hilog -b debug");
    ExeCmd("hilog -b debug -D 218116608");
    ExeCmd("hilog -b debug -T HILOGTOOLTEST");
}

/*
 * @tc.name Setting the log printing level (isLoggable)
 * @tc.number DFX_DFT_HilogCPP_1470
 * @tc.desc Set the global log printing level to debug and print logs lower than level debug
*/
HWTEST_F(LibhilogTooltest, log_leveal_global_set3, Function|MediumTest|Level2)
{
    bool ret;
    int i = 1;
    ExeCmd("hilog -b debug");
    ExeCmd("hilog -r -t all");
    HILOG_ERROR(LOG_CORE, "123456789_1234567890_public and private log test is: \
%{public}d, %{public}lf, %{public}.2f, %{public}s, %{public}c", i, 1.00001, 2.333333, "sse", 'a');
    result = ExecuteCmd("hilog -a 1 -x -t core");
    expect = "03200/HILOGTOOLTEST: 123456789_1234567890_public and private log test is: \
1, 1.000010, 2.33, sse, a";
    if (result.find(expect) != std::string::npos) {
        ret = true;
    } else {
        ret = false;
    }
    EXPECT_EQ(ret, true);
    // test end recover log level
    ExeCmd("hilog -b debug");
    ExeCmd("hilog -b debug -D 218116608");
    ExeCmd("hilog -b debug -T HILOGTOOLTEST");
}

/*
 * @tc.name Setting the log printing level (isLoggable)
 * @tc.number DFX_DFT_HilogCPP_1480
 * @tc.desc Set tag=HILOGTOOLTEST corresponding to the log level as fatal, and print the fatal log
*/
HWTEST_F(LibhilogTooltest, log_leval_tag_set, Function|MediumTest|Level3)
{
    bool ret;
    int i = 1;
    ExeCmd("hilog -b fatal -T HILOGTOOLTEST");
    ExeCmd("hilog -r -t all");
    HILOG_FATAL(LOG_CORE, "123456789_1234567890_public and private log test is: \
%{public}d, %{public}lf, %{public}.2f, %{public}s, %{public}c", i, 1.00001, 2.333333, "sse", 'a');
    result = ExecuteCmd("hilog -a 1 -x -t core");
    expect = "03200/HILOGTOOLTEST: 123456789_1234567890_public and private log test is: \
1, 1.000010, 2.33, sse, a";
    if (result.find(expect) != std::string::npos) {
        ret = true;
    } else {
        ret = false;
    }
    EXPECT_EQ(ret, true);
    // test end recover log level
    ExeCmd("hilog -b debug");
    ExeCmd("hilog -b debug -D 218116608");
    ExeCmd("hilog -b debug -T HILOGTOOLTEST");
}

/*
 * @tc.name Setting the log printing level (isLoggable)
 * @tc.number DFX_DFT_HilogCPP_1490
 * @tc.desc Set tag=HILOGTOOLTEST corresponding to the log level as fatal, 
 * and print logs lower than the fatal log
*/
HWTEST_F(LibhilogTooltest, log_leval_tag_set2, Function|MediumTest|Level3)
{
    bool ret;
    int i = 1;
#ifndef LOCALTEST
    ExeCmd("hilog -b fatal -T HILOGTOOLTEST");
    ExeCmd("hilog -r -t all");
    HILOG_ERROR(LOG_CORE, "123456789_1234567890_public and private log test is: \
%{public}d, %{public}lf, %{public}.2f, %{public}s, %{public}c", i, 1.00001, 2.333333, "sse", 'a');
    result = ExecuteCmd("hilog -a 1 -x -t core");
    expect = "03200/HILOGTOOLTEST: 123456789_1234567890_public and private log test is: \
1, 1.000010, 2.33, sse, a";
    if (result.find(expect) == std::string::npos) {
        ret = true;
    } else {
        ret = false;
    }
    EXPECT_EQ(ret, true);
#endif
    // test end recover log level
    ExeCmd("hilog -b debug");
    ExeCmd("hilog -b debug -D 218116608");
    ExeCmd("hilog -b debug -T HILOGTOOLTEST");
}

/*
 * @tc.name Setting the log printing level (isLoggable)
 * @tc.number DFX_DFT_HilogCPP_1500
 * @tc.desc Set tag=HILOGTOOLTEST corresponding to the log level as debug，
 * and the print level is greater than or equal to the debug log
*/
HWTEST_F(LibhilogTooltest, log_level_tag_set3, Function|MediumTest|Level3)
{
    bool ret;
    int i = 1;
    ExeCmd("hilog -b debug -T HILOGTOOLTEST");
    ExeCmd("hilog -r -t all");
    HILOG_ERROR(LOG_CORE, "123456789_1234567890_public and private log test is: \
%{public}d, %{public}lf, %{public}.2f, %{public}s, %{public}c", i, 1.00001, 2.333333, "sse", 'a');
    result = ExecuteCmd("hilog -a 1 -x -t core");
    expect = "03200/HILOGTOOLTEST: 123456789_1234567890_public and private log test is: \
1, 1.000010, 2.33, sse, a";
    if (result.find(expect) != std::string::npos) {
        ret = true;
    } else {
        ret = false;
    }
    EXPECT_EQ(ret, true);
    // test end recover log level
    ExeCmd("hilog -b debug");
    ExeCmd("hilog -b debug -D 218116608");
    ExeCmd("hilog -b debug -T HILOGTOOLTEST");
}

/*
 * @tc.name Setting the log printing level (isLoggable)
 * @tc.number DFX_DFT_HilogCPP_1510
 * @tc.desc Set domain=218116608 corresponding to the log level as fatal, and print the fatal log
*/
HWTEST_F(LibhilogTooltest, log_level_domain_set, Function|MediumTest|Level3)
{
    bool ret;
    int i = 1;
    ExeCmd("hilog -b fatal -D 218116608");
    ExeCmd("hilog -r -t all");
    HILOG_FATAL(LOG_CORE, "123456789_1234567890_public and private log test is: \
%{public}d, %{public}lf, %{public}.2f, %{public}s, %{public}c", i, 1.00001, 2.333333, "sse", 'a');
    result = ExecuteCmd("hilog -a 1 -x -t core");
    expect = "03200/HILOGTOOLTEST: 123456789_1234567890_public and private log test is: \
1, 1.000010, 2.33, sse, a";
    if (result.find(expect) != std::string::npos) {
        ret = true;
    } else {
        ret = false;
    }
    EXPECT_EQ(ret, true);
    // test end recover log level
    ExeCmd("hilog -b debug");
    ExeCmd("hilog -b debug -D 218116608");
    ExeCmd("hilog -b debug -T HILOGTOOLTEST");
}

/*
 * @tc.name Setting the log printing level (isLoggable)
 * @tc.number DFX_DFT_HilogCPP_1520
 * @tc.desc Set domain=218116608 corresponding to the log level as fatal, 
 * and print logs lower than the fatal log
*/
HWTEST_F(LibhilogTooltest, log_level_domain_set2, Function|MediumTest|Level4)
{
    bool ret;
    int i = 1;
#ifndef LOCALTEST
    ExeCmd("hilog -b fatal -D 218116608");
    ExeCmd("hilog -r -t all");
    HILOG_ERROR(LOG_CORE, "123456789_1234567890_public and private log test is: \
%{public}d, %{public}lf, %{public}.2f, %{public}s, %{public}c", i, 1.00001, 2.333333, "sse", 'a');
    result = ExecuteCmd("hilog -a 1 -x -t core");
    expect = "03200/HILOGTOOLTEST: 123456789_1234567890_public and private log test is: \
1, 1.000010, 2.33, sse, a";
    if (result.find(expect) == std::string::npos) {
        ret = true;
    } else {
        ret = false;
    }
    EXPECT_EQ(ret, true);
#endif
    // test end recover log level
    ExeCmd("hilog -b debug");
    ExeCmd("hilog -b debug -D 218116608");
    ExeCmd("hilog -b debug -T HILOGTOOLTEST");
}

/*
 * @tc.name Setting the log printing level (isLoggable)
 * @tc.number DFX_DFT_HilogCPP_1530
 * @tc.desc Set domain=218116608 corresponding to the log level as debug, 
 * and the print level is greater than or equal to the debug log
*/
HWTEST_F(LibhilogTooltest, log_level_domain_set3, Function|MediumTest|Level3)
{
    bool ret;
    int i = 1;
    ExeCmd("hilog -b debug -D 218116608");
    ExeCmd("hilog -r -t all");
    HILOG_ERROR(LOG_CORE, "123456789_1234567890_public and private log test is: \
%{public}d, %{public}lf, %{public}.2f, %{public}s, %{public}c", i, 1.00001, 2.333333, "sse", 'a');
    result = ExecuteCmd("hilog -a 1 -x -t core");
    expect = "03200/HILOGTOOLTEST: 123456789_1234567890_public and private log test is: \
1, 1.000010, 2.33, sse, a";
    if (result.find(expect) != std::string::npos) {
        ret = true;
    } else {
        ret = false;
    }
    EXPECT_EQ(ret, true);
    // test end recover log level
    ExeCmd("hilog -b debug");
    ExeCmd("hilog -b debug -D 218116608");
    ExeCmd("hilog -b debug -T HILOGTOOLTEST");
}

/*
 * @tc.name Setting the log printing level (isLoggable)
 * @tc.number DFX_DFT_HilogCPP_1540
 * @tc.desc Set different log levels for global, tag, and domain, 
 * and print logs that are less than the highest level among the three levels
*/
HWTEST_F(LibhilogTooltest, log_level_all_set, Function|MediumTest|Level3)
{
    bool ret;
    int i = 1;
    ExeCmd("hilog -b info");
    ExeCmd("hilog -b warn -D 218116608");
    ExeCmd("hilog -b error -T HILOGTOOLTEST");
    ExeCmd("hilog -r -t all");
    HILOG_FATAL(LOG_CORE, "123456789_1234567890_public and private log test is: \
%{public}d, %{public}lf, %{public}.2f, %{public}s, %{public}c", i, 1.00001, 2.333333, "sse", 'a');
    result = ExecuteCmd("hilog -a 1 -x -t core");
    expect = "03200/HILOGTOOLTEST: 123456789_1234567890_public and private log test is: \
1, 1.000010, 2.33, sse, a";
    if (result.find(expect) != std::string::npos) {
        ret = true;
    } else {
        ret = false;
    }
    EXPECT_EQ(ret, true);
    // test end recover log level
    ExeCmd("hilog -b debug");
    ExeCmd("hilog -b debug -D 218116608");
    ExeCmd("hilog -b debug -T HILOGTOOLTEST");
}

/*
 * @tc.name Setting the log printing level (isLoggable)
 * @tc.number DFX_DFT_HilogCPP_1550
 * @tc.desc Set different log levels for global, tag, and domain, 
 * and print logs that are greater than or equal to the highest level among the three levels
*/
HWTEST_F(LibhilogTooltest, log_level_all_set2, Function|MediumTest|Level3)
{
    bool ret;
    int i = 1;
#ifndef LOCALTEST
    ExeCmd("hilog -b info");
    ExeCmd("hilog -b warn -D 218116608");
    ExeCmd("hilog -b error -T HILOGTOOLTEST");
    ExeCmd("hilog -r -t all");
    HILOG_DEBUG(LOG_CORE, "123456789_1234567890_public and private log test is: \
%{public}d, %{public}lf, %{public}.2f, %{public}s, %{public}c", i, 1.00001, 2.333333, "sse", 'a');
    result = ExecuteCmd("hilog -a 1 -x -t core");
    expect = "03200/HILOGTOOLTEST: 123456789_1234567890_public and private log test is: \
1, 1.000010, 2.33, sse, a";
    if (result.find(expect) == std::string::npos) {
        ret = true;
    } else {
        ret = false;
    }
    EXPECT_EQ(ret, true);
#endif
    // test end recover log level
    ExeCmd("hilog -b debug");
    ExeCmd("hilog -b debug -D 218116608");
    ExeCmd("hilog -b debug -T HILOGTOOLTEST");
}

/*
 * @tc.name Setting the log printing level (isLoggable)
 * @tc.number DFX_DFT_HilogCPP_1560
 * @tc.desc Set a log level that does not exist
*/
HWTEST_F(LibhilogTooltest, log_level_set_illegal, Function|MediumTest|Level4)
{
    result = ExecuteCmd("hilog -b abc");
    expect = "set log level operation error!\n";
    EXPECT_EQ(result, expect);
    // test end recover log level
    ExeCmd("hilog -b debug");
    ExeCmd("hilog -b debug -D 218116608");
    ExeCmd("hilog -b debug -T HILOGTOOLTEST");
}

HWTEST_F(LibhilogTooltest, private_open, Function|MediumTest|Level4)
{ 
    bool ret;
    int i = 1;
#ifndef LOCALTEST
    ExeCmd("hilog -p on");
    ExeCmd("hilog -r -t all");     
    HILOG_DEBUG(LOG_CORE, "123456789_1234567890_public and private log test is: \
%{public}d, %{private}lf, %{public}.2f, %{public}s, %{private}c", i, 1.00001, 2.333333, "sse", 'a');
    result = ExecuteCmd("hilog -a 1 -x -t core");
    expect = "03200/HILOGTOOLTEST: 123456789_1234567890_public and private log test is: \
1, <private>, 2.33, sse, <private>\n";
    if (result.find(expect) != std::string::npos) {
        ret = true;
    } else {
        ret = false;
    }
    EXPECT_EQ(ret, true);
#endif
    // end open switch
    ExeCmd("hilog -p on");
}


HWTEST_F(LibhilogTooltest, private_close, Function|MediumTest|Level4)
{   
    bool ret;
    int i = 1;
    ExeCmd("hilog -p off");
    ExeCmd("hilog -r -t all");     
    HILOG_DEBUG(LOG_CORE, "123456789_1234567890_public and private log test is: \
%{public}d, %{private}lf, %{public}.2f, %{public}s, %{private}c", i, 1.00001, 2.333333, "sse", 'a');
    result = ExecuteCmd("hilog -a 1 -x -t core");
    expect = "03200/HILOGTOOLTEST: 123456789_1234567890_public and private log test is: \
1, 1.000010, 2.33, sse, a\n";
    if (result.find(expect) != std::string::npos) {
        ret = true;
    } else {
        ret = false;
    }
    EXPECT_EQ(ret, true);
    // end open switch
    ExeCmd("hilog -p on");
}


HWTEST_F(LibhilogTooltest, private_switch_illegal, Function|MediumTest|Level4)
{
    result = ExecuteCmd("hilog -p abc");
    expect = "set private switch operation error!\n";
    EXPECT_EQ(result, expect);
}


