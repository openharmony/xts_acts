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

class hilogtest : public testing::Test {
public:
    string input = "";
    string result = "";
    string expect = "";
    static void SetUpTestCase();
    static void TearDownTestCase();
    void SetUp();
    void TearDown();
    string gHilogtoolExecutable = "hilog ";
    string g_logContent = "123456789_1234567890_public and private log test is:\
    %{public}d, %{private}lf, %{public}.2f, %s, %{private}c\n";
    string g_commonContent = "03200/HILOGTOOLTEST: 123456789_1234567890_public and private log test is:";
private:
};
void hilogtest::SetUp()
{
}
void hilogtest::TearDown()
{
}
void hilogtest::SetUpTestCase()
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
void hilogtest::TearDownTestCase()
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
 * @tc.name one-time read
 * @tc.number DFX_DFT_HilogCPP_0840
 * @tc.desc one-time read
*/
HWTEST_F(hilogtest, Hilogtool_exit, Function|MediumTest|Level3)
{
    CleanCmd();
    std::string saveFile= "test_data_31.txt";
    std::string cmd1 = gHilogtoolExecutable + " -r";
    std::string cmdResult;
    CmdRun(cmd1, cmdResult);
    LogType type = LOG_APP;
    int i = 0;
    while (i++ <= 5) {
        usleep(1000);
        HILOG_DEBUG(type, g_logContent.c_str(), i, 1.00001, 2.333333, "sse", 'a');
    }
    std::string cmd2 = gHilogtoolExecutable + "-T HILOGTOOLTEST -x";
    SaveCmdOutput(cmd2, saveFile);
    string hilogInfo = ReadFile(saveFile);
    bool result = false;
    std::vector<std::string> para = {g_commonContent};
    if (hilogInfo != "") {
        result = CheckInfo(para, hilogInfo);
    } else {
        std::cout << "Hilogtool_exit error" << std::endl;
    }
    ASSERT_TRUE(true == result);
}

/*
 * @tc.name The log tool can read app log types at a time.
 * @tc.number DFX_DFT_HilogCPP_0860
 * @tc.desc The log tool can read app log types at a time.
*/
HWTEST_F(hilogtest, Hilogtool_type_app, Function|MediumTest|Level3)
{
    CleanCmd();
    std::string saveFile= "test_data_33_1.txt";
    LogType type = LOG_APP;
    int i = 0;
    while (i++ <= 5) {
        usleep(1000);
        HILOG_DEBUG(type, g_logContent.c_str(), i, 1.00001, 2.333333, "sse", 'a');
    }
    std::string cmd = gHilogtoolExecutable + " -t app -x ";
    SaveCmdOutput(cmd, saveFile);
    string hilogInfo = ReadFile(saveFile);
    bool result = false;
    std::vector<std::string> para = {g_commonContent};
    if (hilogInfo != " ") {
        result = CheckInfo(para, hilogInfo);
    } else {
        std::cout << "Hilogtool_type_app error";
    }
    ASSERT_TRUE(true == result);
}


/*
 * @tc.name The log tool can read core log types at a time.
 * @tc.number DFX_DFT_HilogCPP_0870
 * @tc.desc The log tool can read core log types at a time
*/
HWTEST_F(hilogtest, Hilogtool_type_core, Function|MediumTest|Level3)
{
    CleanCmd();
    std::string saveFile= "test_data_33_2.txt";
    LogType type = LOG_CORE;
    int i = 0;
    while (i++ <= 5) {
        usleep(1000);
        HILOG_DEBUG(type, g_logContent.c_str(), i, 1.00001, 2.333333, "sse", 'a');
    }
    std::string cmd = gHilogtoolExecutable + " -t core -x ";
    SaveCmdOutput(cmd, saveFile);
    string hilogInfo = ReadFile(saveFile);
    bool result = false;
    std::vector<std::string> para = {g_commonContent};
    if (hilogInfo != "") {
        result = CheckInfo(para, hilogInfo);
    } else {
        std::cout << "Hilogtool_type_app error"<<std::endl;
    }
    ASSERT_TRUE(true == result);
}

/*
 * @tc.name The log tool can read init log types at a time.
 * @tc.number DFX_DFT_HilogCPP_0880
 * @tc.desc The log tool can read init log types at a time.
*/
HWTEST_F(hilogtest, Hilogtool_type_init, Function|MediumTest|Level3)
{
    CleanCmd();
    std::string saveFile= "test_data_33_3.txt";
    LogType type = LOG_INIT;
    int i = 0;
    while (i++ <= 5) {
        usleep(1000);
        HILOG_DEBUG(type, g_logContent.c_str(), i, 1.00001, 2.333333, "sse", 'a');
    }
    std::string cmd = gHilogtoolExecutable + " -t init -x ";
    SaveCmdOutput(cmd, saveFile);
    string hilogInfo = ReadFile(saveFile);
    bool result = false;
    std::vector<std::string> para = {g_commonContent};
    if (hilogInfo != "") {
        result = CheckInfo(para, hilogInfo);
    } else {
        std::cout << "Hilogtool_type_init error";
    }
    ASSERT_TRUE(true == result);
}

/*
 * @tc.name The log tool can read Hilogtool_type_multiple log types at a time.
 * @tc.number DFX_DFT_HilogCPP_0890
 * @tc.desc The log tool can read Hilogtool_type_multiple log types at a time.
*/
HWTEST_F(hilogtest, Hilogtool_type_multiple, Function|MediumTest|Level2)
{
    CleanCmd();
    std::string saveFile= "test_data_33_4.txt";
    LogType type = LOG_INIT;
    int i = 0;
    while (i++ <= 3) {
        usleep(1000);
        HILOG_DEBUG(type, g_logContent.c_str(), i, 1.00001, 2.333333, "sse", 'a');
        type = LOG_INIT;
        HILOG_DEBUG(type, g_logContent.c_str(), i, 1.00001, 2.333333, "sse", 'a');
        type = LOG_APP;
        HILOG_DEBUG(type, g_logContent.c_str(), i, 1.00001, 2.333333, "sse", 'a');
    }
    std::string cmd = gHilogtoolExecutable + "-D 0xd003200 -t app core init -x ";
    SaveCmdOutput(cmd, saveFile);
    string hilogInfo = ReadFile(saveFile);
    bool result = false;
    std::vector<std::string> para = {g_commonContent};
    if (hilogInfo != "") {
        result = CheckInfo(para, hilogInfo);
    } else {
        std::cout << "Hilogtool_type_multiple error";
    }
    ASSERT_TRUE(true == result);
}

/*
 * @tc.name show local time
 * @tc.number DFX_DFT_HilogCPP_0950
 * @tc.desc show local time
*/
HWTEST_F(hilogtest, Hilogtool_time, Function|MediumTest|Level3)
{
    std::string cmd = gHilogtoolExecutable + " -a 1 -v time ";
    std::string saveFile= "test_data_35_1.txt";
    SaveCmdOutput(cmd, saveFile);
    string hilogInfo = ReadFile(saveFile);
    bool result = false;
    std::regex pattern(
    "(0\\d{1}|1[0-2])-(0\\d{1}|[12]\\d{1}|3[01])\\s(0\\d{1}|1\\d{1}|2[0-3]):[0-5]\\d{1}:([0-5]\\d{1})(\\.(\\d){0,3})?$");
    std::cout << hilogInfo.substr(0, 18);
    string timeBuffer = hilogInfo.substr(0, 18);
    std::smatch match;
    bool ismatch = regex_match(timeBuffer, match, pattern);
    if (ismatch) {
        std::cout<<"match successed"<<std::endl;
        result = true;
    } else {
        std::cout<<"match failed"<<std::endl;
    }
    ASSERT_TRUE(true == result);
}

/*
 * @tc.name show the time from 1970
 * @tc.number DFX_DFT_HilogCPP_0960
 * @tc.desc show the time from 1970
*/
HWTEST_F(hilogtest, Hilogtool_epoch, Function|MediumTest|Level4)
{
    std::string cmd = gHilogtoolExecutable + " -a 1 -v epoch ";
    std::string saveFile= "test_data_35_2.txt";
    SaveCmdOutput(cmd, saveFile);
    string hilogInfo = ReadFile(saveFile);
    bool result = false;
    std::regex pattern("[^0-9]");
    std::cout << hilogInfo.substr(0, 19);
    string timeBuffer = hilogInfo.substr(0, 19);
    std::smatch match;
    bool ismatch = regex_search(timeBuffer, match, pattern);
    if (ismatch) {
        std::cout << "match successed" << std::endl;
        result = true;
    } else {
        std::cout <<"match failed"<< std::endl;
    }
    ASSERT_TRUE(true == result);
}

/*
 * @tc.name show the time from last restart
 * @tc.number DFX_DFT_HilogCPP_0970
 * @tc.desc show the time from last restart
*/
HWTEST_F(hilogtest, Hilogtool_monotonic, Function|MediumTest|Level3)
{
    std::string cmd = gHilogtoolExecutable + " -a 1 -v monotonic";
    std::string saveFile= "test_data_35_3.txt";
    SaveCmdOutput(cmd, saveFile);
    string hilogInfo = ReadFile(saveFile);
    bool result = false;
    std::regex pattern("[^0-9]");
    std::cout << hilogInfo.substr(0, 14);
    string timeBuffer = hilogInfo.substr(0, 14);
    std::smatch match;
    bool ismatch = regex_search(timeBuffer, match, pattern);
    if (ismatch) {
        std::cout << "match successed"  << std::endl;
        result = true;
    } else {
        std::cout << "match failed" << std::endl;
    }
    ASSERT_TRUE(true == result);
}

/*
 * @tc.name Displays time in microsecond accuracy
 * @tc.number DFX_DFT_HilogCPP_0980
 * @tc.desc Displays time in microsecond accuracy
*/
HWTEST_F(hilogtest, Hilogtool_usec, Function|MediumTest|Level4)
{
    std::string cmd = gHilogtoolExecutable + " -a 1 -v usec";
    std::string saveFile= "test_data_35_4.txt";
    SaveCmdOutput(cmd, saveFile);
    string hilogInfo = ReadFile(saveFile);
    bool result = false;
    std::regex pattern(
    "(0\\d{1}|1[0-2])-(0\\d{1}|[12]\\d{1}|3[01])\\s(0\\d{1}|1\\d{1}|2[0-3]):[0-5]\\d{1}:([0-5]\\d{1})(\\.(\\d){0,6})?$");
    std::cout << hilogInfo.substr(0, 21);
    string timeBuffer = hilogInfo.substr(0, 21);
    std::smatch match;
    bool ismatch = regex_match(timeBuffer, match, pattern);
    if (ismatch) {
        std::cout << "match successed"  << std::endl;
        result = true;
    } else {
        std::cout << "match failed" << std::endl;
    }
    ASSERT_TRUE(true == result);
}

/*
 * @tc.name Displays time in nanosecond precision.
 * @tc.number DFX_DFT_HilogCPP_0990
 * @tc.desc Displays time in nanosecond precision.
*/
HWTEST_F(hilogtest, Hilogtool_nsec, Function|MediumTest|Level4)
{
    std::string cmd = gHilogtoolExecutable + " -a 1 -v nsec";
    std::string saveFile= "test_data_35_5.txt";
    SaveCmdOutput(cmd, saveFile);
    string hilogInfo = ReadFile(saveFile);
    bool result = false;
    std::regex pattern(
    "(0\\d{1}|1[0-2])-(0\\d{1}|[12]\\d{1}|3[01])\\s(0\\d{1}|1\\d{1}|2[0-3]):[0-5]\\d{1}:([0-5]\\d{1})(\\.(\\d){0,9})?$");

    std::cout << hilogInfo.substr(0, 24);
    string timeBuffer = hilogInfo.substr(0, 24);
    std::smatch match;
    bool ismatch = regex_match(timeBuffer, match, pattern);
    if (ismatch) {
        std::cout << "match successed"<< std::endl;
        result = true;
    } else {
        std::cout << "match failed"<< std::endl;
    }
    ASSERT_TRUE(true == result);
}

/*
 * @tc.name added year to the displayed time.
 * @tc.number DFX_DFT_HilogCPP_1000
 * @tc.desc added year to the displayed time.
*/
HWTEST_F(hilogtest, Hilogtool_year, Function|MediumTest|Level4)
{
    std::string cmd = gHilogtoolExecutable + " -a 1 -v year";
    char saveFile356[] = "test_data_35_6.txt";
    SaveCmdOutput(cmd, saveFile356);
    string hilogInfo = ReadFile(saveFile356);
    bool result = false;
    std::regex pattern(
    "(\\d{4})-(0\\d{1}|1[0-2])-(0\\d{1}|[12]\\d{1}|3[01])\\s(0\\d{1}|1\\d{1}|2[0-3]):[0-5]\\d{1}:([0-5]\\d{1})(\\.(\\d){0,3})?$");
    std::cout << hilogInfo.substr(0, 23);
    string timeBuffer = hilogInfo.substr(0, 23);
    std::smatch match;
    bool ismatch = regex_match(timeBuffer, match, pattern);
    if (ismatch) {
        std::cout << "match successed"<< std::endl;
        result = true;
    } else {
        std::cout << "match failed"<< std::endl;
    }
    ASSERT_TRUE(true == result);
}

/*
 * @tc.name show the local time zone
 * @tc.number DFX_DFT_HilogCPP_1010
 * @tc.desc show the local time zone
*/
HWTEST_F(hilogtest, Hilogtool_zone, Function|MediumTest|Level4)
{
    std::string cmd = gHilogtoolExecutable + " -a 1 -v zone";
    std::string saveFile= "test_data_35_6.txt";
    SaveCmdOutput(cmd, saveFile);
    string hilogInfo = ReadFile(saveFile);
    bool result = false;
    std::regex pattern(
    "(.*)(0\\d{1}|1[0-2])-(0\\d{1}|[12]\\d{1}|3[01])\\s(0\\d{1}|1\\d{1}|2[0-3]):[0-5]\\d{1}:([0-5]\\d{1})");
    std::cout << hilogInfo.substr(0, 20);
    string timeBuffer = hilogInfo.substr(0, 20);
    std::smatch match;
    bool ismatch = regex_match(timeBuffer, match, pattern);
    if (ismatch) {
        std::cout << "match successed"<< std::endl;
        result = true;
    } else {
        std::cout << "match failed"<< std::endl;
    }
    ASSERT_TRUE(true == result);
}

/*
 * @tc.name Filtering by regular expression, The expression is empty.
 * @tc.number DFX_DFT_HilogCPP_1870
 * @tc.desc Filtering by regular expression, The expression is empty.
*/
HWTEST_F(hilogtest, Hilogtool_regex_null, Function|MediumTest|Level3)
{
    CleanCmd();
    std::string cmd = gHilogtoolExecutable + " -x -e \"\"";
    // " -type app core init -x "
    std::string saveFile= "test_data_46_1.txt";
    SaveCmdOutput(cmd, saveFile);
    string hilogInfo = ReadFile(saveFile);
    bool result = false;
    std::vector<std::string> para = {g_commonContent};
    if (hilogInfo != " ") {
        result = CheckInfo(para, hilogInfo);
    } else {
        std::cout << "Hilogtool_regex_null error";
    }
    ASSERT_TRUE(true == result);
}

/*
 * @tc.name Filtering by regular expression
 * @tc.number DFX_DFT_HilogCPP_1880
 * @tc.desc Filtering by regular expression
*/
HWTEST_F(hilogtest, Hilogtool_regex, Function|MediumTest|Level3)
{
    CleanCmd();
    std::string cmd1 = gHilogtoolExecutable + " -x -e \"^(123)\"";

    char saveFile462[] = "test_data_46_2.txt";
    SaveCmdOutput(cmd1, saveFile462);
    string hilogInfo = ReadFile(saveFile462);
    bool result = false;
    std::vector<std::string> para = {"03200/HILOGTOOLTEST"};
    if (hilogInfo != "") {
        result = CheckInfo(para, hilogInfo);
    } else {
        std::cout << "Hilogtool_regex error";
    }
    ASSERT_TRUE(true == result);
    CleanCmd();
    std::string cmd2 = gHilogtoolExecutable + " -x -e \"^(www)\"";
    char saveFile463[] = "test_data_46_3.txt";
    SaveCmdOutput(cmd2, saveFile463);
    hilogInfo = ReadFile(saveFile463);
    if (hilogInfo != " ") {
        result = CheckInfo(para, hilogInfo);
    } else {
        std::cout << "Hilogtool_regex error";
    }
    ASSERT_TRUE(false == result);
}

/*
 * @tc.name show the first 1 row
 * @tc.number DFX_DFT_HilogCPP_1890
 * @tc.desc show the first 1 row
*/

HWTEST_F(hilogtest, Hilogtool_head_1, Function|MediumTest|Level3)
{
    CleanCmd();
    LogType type = LOG_INIT;
    int cnt =20;
    int i = 0;
    while (i++ <= cnt) {
        usleep(1);
        HILOG_DEBUG(type, g_logContent.c_str(), i, 1.00001, 2.333333, "sse", 'a');
    }
    std::string cmd = gHilogtoolExecutable + " -a 1 -x ";
    std::string saveFile = "test_data_47_1.txt";
    SaveCmdOutput(cmd, saveFile);
    string hilogInfo = ReadFile(saveFile);
    bool result = false;
    std::vector<std::string> para = {g_commonContent};
    if (hilogInfo != " ") {
        result = CheckInfo(para, hilogInfo);
    } else {
        std::cout << "Hilogtool_n error";
    }
    ASSERT_TRUE(true == result);
}

/*
 * @tc.name show first 20 rows
 * @tc.number DFX_DFT_HilogCPP_1900
 * @tc.desc show first 20 rows
*/
HWTEST_F(hilogtest, Hilogtool_head_20, Function|MediumTest|Level4)
{
    CleanCmd();
    LogType type = LOG_INIT;
    int cnt =20;
    int i = 0;
    while (i++ <= cnt) {
        usleep(1);
        HILOG_DEBUG(type, g_logContent.c_str(), i, 1.00001, 2.333333, "sse", 'a');
    }
    std::string saveFile= "test_data_47_2.txt";
    std::string cmd = gHilogtoolExecutable + " -a 20 -x ";
    SaveCmdOutput(cmd, saveFile);
    int n = GetTxtLine(saveFile);
    ASSERT_TRUE(n == 20);
}

/*
 * @tc.name show the last 1 row
 * @tc.number DFX_DFT_HilogCPP_1910
 * @tc.desc show the last 1 row
*/
HWTEST_F(hilogtest, Hilogtool_tail_1, Function|MediumTest|Level4)
{
    CleanCmd();
    LogType type = LOG_INIT;
    int cnt =20;
    int i = 0;
    while (i++ <= cnt) {
        usleep(1);
        HILOG_DEBUG(type, g_logContent.c_str(), i, 1.00001, 2.333333, "sse", 'a');
    }
    std::string saveFile= "test_data_47_3.txt";
    std::string cmd = gHilogtoolExecutable + "-t init -z 1";
    SaveCmdOutput(cmd, saveFile);
    sleep(2);
    string hilogInfo = ReadFile(saveFile);
    bool result = false;
    std::vector<std::string> para = {g_commonContent};
    if (hilogInfo != " ") {
        result = CheckInfo(para, hilogInfo);
    } else {
        std::cout << "Hilogtool_n error";
    }
    ASSERT_TRUE(true == result);
}

/*
 * @tc.name show last 20 rows
 * @tc.number DFX_DFT_HilogCPP_1920
 * @tc.desc show last 20 rows
*/
HWTEST_F(hilogtest, Hilogtool_tail_20, Function|MediumTest|Level4)
{
    CleanCmd();
    LogType type = LOG_INIT;
    int cnt =20;
    int i = 0;
    while (i++ <= cnt) {
        usleep(1);
        HILOG_DEBUG(type, g_logContent.c_str(), i, 1.00001, 2.333333, "sse", 'a');
    }
    std::string saveFile= "test_data_47_4.txt";
    std::string cmd = gHilogtoolExecutable + "-t init -z 20";
    SaveCmdOutput(cmd, saveFile);
    int n = GetTxtLine(saveFile);
    ASSERT_TRUE(n == 20);
}

/*
 * @tc.name The filtering parameter is empty.
 * @tc.number DFX_DFT_HilogCPP_1930
 * @tc.desc The filtering parameter is empty.
*/
HWTEST_F(hilogtest, Hilogtool_filter_null, Function|MediumTest|Level4)
{
    CleanCmd();
    LogType type = LOG_INIT;

    int cnt =20;
    int i = 0;
    while (i++ <= cnt) {
        usleep(1000);
        HILOG_DEBUG(type, g_logContent.c_str(), i, 1.00001, 2.333333, "sse", 'a');
    }
    std::string saveFile= "test_data_48_1.txt";
    std::string cmd = gHilogtoolExecutable + " -t init  -x";
    SaveCmdOutput(cmd, saveFile);
    string hilogInfo = ReadFile(saveFile);
    bool result = false;
    std::vector<std::string> para = {g_commonContent};
    if (hilogInfo != "") {
        result = CheckInfo(para, hilogInfo);
    } else {
        std::cout << "Hilogtool_filter error";
    }
    ASSERT_TRUE(true == result);
}

/*
 * @tc.name Filter level only.
 * @tc.number DFX_DFT_HilogCPP_1960
 * @tc.desc Filter level only.
*/

HWTEST_F(hilogtest, Hilogtool_filter_level, Function|MediumTest|Level4)
{
    CleanCmd();
    LogType type = LOG_INIT;
    int cnt =20;
    int i = 0;
    while (i++ <= cnt) {
        usleep(1);
        HILOG_DEBUG(type, g_logContent.c_str(), i, 1.00001, 2.333333, "sse", 'a');
    }
    std::string saveFile= "test_data_48_4.txt";
    std::string cmd = gHilogtoolExecutable + " -t init -L D -x";
    SaveCmdOutput(cmd, saveFile);
    string hilogInfo = ReadFile(saveFile);
    bool result = false;
    std::vector<std::string> para = {g_commonContent};
    if (hilogInfo != "") {
        result = CheckInfo(para, hilogInfo);
    } else {
        std::cout << "Hilogtool_filter error";
    }
    ASSERT_TRUE(true == result);
}

/*
 * @tc.name Filter domain only.
 * @tc.number DFX_DFT_HilogCPP_1970
 * @tc.desc Filter domain only.
*/

HWTEST_F(hilogtest, Hilogtool_filter_domain, Function|MediumTest|Level3)
{
    CleanCmd();
    LogType type = LOG_INIT;

    int cnt =20;
    int i = 0;
    while (i++ <= cnt) {
        usleep(1);
        HILOG_DEBUG(type, g_logContent.c_str(), i, 1.00001, 2.333333, "sse", 'a');
    }
    std::string saveFile= "test_data_48_3.txt";
    std::string cmd = gHilogtoolExecutable + " -t init -D 0xd003200 -x";
    SaveCmdOutput(cmd, saveFile);
    string hilogInfo = ReadFile(saveFile);
    bool result = false;
    std::vector<std::string> para = {g_commonContent};
    if (hilogInfo != "") {
        result = CheckInfo(para, hilogInfo);
    } else {
        std::cout << "Hilogtool_filter error";
    }
    ASSERT_TRUE(true == result);
}

/*
 * @tc.name Filter tag only.
 * @tc.number DFX_DFT_HilogCPP_1980
 * @tc.desc Filter tag only.
*/
HWTEST_F(hilogtest, Hilogtool_filter_tag, Function|MediumTest|Level4)
{
    CleanCmd();
    LogType type = LOG_INIT;
    int cnt = 20;
    int i = 0;
    while (i++ <= cnt) {
        usleep(1);
        HILOG_DEBUG(type, g_logContent.c_str(), i, 1.00001, 2.333333, "sse", 'a');
    }
    std::string saveFile= "test_data_48_5.txt";
    std::string cmd = gHilogtoolExecutable + " -T HILOGTOOLTEST -x";
    SaveCmdOutput(cmd, saveFile);
    string hilogInfo = ReadFile(saveFile);
    bool result = false;
    std::vector<std::string> para = {g_commonContent};
    if (hilogInfo != " ") {
        result = CheckInfo(para, hilogInfo);
    } else {
        std::cout << "Hilogtool_filter error";
    }
    ASSERT_TRUE(true == result);
}

/*
 * @tc.name Filter Multi-parameter
 * @tc.number DFX_DFT_HilogCPP_1990
 * @tc.desc Filter Multi-parameter
*/

HWTEST_F(hilogtest, Hilogtool_filter_multiple, Function|MediumTest|Level2)
{
    CleanCmd();
    LogType type = LOG_INIT;
    int i = 0;
    int cnt = 20;
    while (i++ <= cnt) {
        usleep(1);
        HILOG_DEBUG(type, g_logContent.c_str(), i, 1.00001, 2.333333, "sse", 'a');
    }
    std::string saveFile= "test_data_48_6.txt";
    std::string cmd = gHilogtoolExecutable + \
    " -T HILOGTOOLTEST -L D -x";
    SaveCmdOutput(cmd, saveFile);
    string hilogInfo = ReadFile(saveFile);
    bool result = false;
    std::vector<std::string> para = {g_commonContent};
    if (hilogInfo != " ") {
        result = CheckInfo(para, hilogInfo);
    } else {
        std::cout << "Hilogtool_filter error";
    }
    ASSERT_TRUE(true == result);
}
