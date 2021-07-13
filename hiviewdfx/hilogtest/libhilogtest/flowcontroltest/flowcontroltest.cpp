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
#include <algorithm>
#include <regex>
#include <ctime>
#include <gtest/gtest.h>
#include "hilog/log_c.h"
#include "file_utils.h"
using namespace std;
using namespace testing::ext;
#undef LOG_DOMAIN
#undef LOG_TAG
#define LOG_DOMAIN 0xD003200
#define LOG_TAG "HILOGTOOLTEST"
namespace {
    const int RESULT_MAX_LEN = 1000;
}
static const long long NSEC_PER_SEC = 1000000000ULL;

class TestTool : public testing::Test {
public:
    static void SetUpTestCase();
    static void TearDownTestCase();
    void SetUp();
    void TearDown();

    char buff[RESULT_MAX_LEN];
    std::string input, result, expect;
};

void TestTool::SetUp()
{
}
void TestTool::TearDown()
{
}
void TestTool::SetUpTestCase()
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
void TestTool::TearDownTestCase()
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

static long long HiLogTimespecSub(struct timespec a, struct timespec b)
{
    long long ret = NSEC_PER_SEC * b.tv_sec + b.tv_nsec;

    ret -= NSEC_PER_SEC * a.tv_sec + a.tv_nsec;
    return ret;
}

#if 0
/*
 * @tc.name The trustlist mechanism is supported.
 *          Flow control values can be independently set for trustlisted processes.
 * @tc.number DFX_DFT_HilogCPP_70
 */
HWTEST_F(TestTool, process_flowctrl_trustlist, TestSize.Level3)
{
#ifndef LOCALTEST
    int i = 0;
    const uint32_t flowQuota = 39150;
    uint32_t sumLen = 0;
    struct timespec startTime = {0, 0};
    struct timespec realTime = {0, 0};
    clock_gettime(CLOCK_MONOTONIC, &realTime);
    startTime = realTime;
    // start a process in trustlist
    sleep(2);
    ExeCmd("hilog -Q pidon");
    ExeCmd("hilog -Q domainoff");
    ExeCmd("hilog -r -t all");
    ExeCmd("hilog -G 2m -t all");
    while (1) {
        HILOG_DEBUG(LOG_CORE, "123456789_1234567890_public and private log test is: \
%{public}d, %{public}lf, %{public}.2f, %{public}s, %{public}c", 1, 1.00001, 2.333333, "sse",'a');
        i++;
        sumLen += 109;
        clock_gettime(CLOCK_MONOTONIC, &realTime);
        long long ns = HiLogTimespecSub(startTime, realTime);
        if ((ns <= NSEC_PER_SEC && sumLen > flowQuota) || (ns > NSEC_PER_SEC)) {
            int tmp = 0;
            while (tmp < 1000) {
                HILOG_DEBUG(LOG_CORE, "123456789_1234567890_public and private log test is: \
%{public}d, %{public}lf, %{public}.2f, %{public}s, %{public}c", 1, 1.00001, 2.333333, "sse",'a');
                i++;
                tmp++;
            }
            break;
        }
    }
    result = ExecuteCmd("hilog -x -t core| wc -l");
    expect = to_string(i);
    EXPECT_LE(stoi(result), stoi(expect));
#endif
    ExeCmd("hilog -Q domainoff");
    ExeCmd("hilog -Q pidoff");
    ExeCmd("hilog -r -t all");
    ExeCmd("hilog -G 1m -t all");
}

/*
 * @tc.name The trustlist mechanism is supported.
 *          Flow control values can be independently set for trustlisted processes.
 * @tc.number DFX_DFT_HilogCPP_71
 */
HWTEST_F(TestTool, process_flowctrl_trustlist2, TestSize.Level3)
{
#ifndef LOCALTEST
    int i = 0;
    struct timespec startTime = {0, 0};
    struct timespec realTime = {0, 0};
    const uint32_t flowQuota = 39150;
    uint32_t sumLen = 0;
    // start a process in trustlist
    sleep(2);
    ExeCmd("hilog -Q pidon");
    ExeCmd("hilog -Q domainoff");
    ExeCmd("hilog -r -t all");
    ExeCmd("hilog -G 2m -t all");
    clock_gettime(CLOCK_MONOTONIC, &realTime);
    startTime = realTime;
    while (1) {
        HILOG_DEBUG(LOG_CORE, "123456789_1234567890_public and private log test is: \
%{public}d, %{public}lf, %{public}.2f, %{public}s, %{public}c", 1, 1.00001, 2.333333, "sse", 'a');
        i++;
        sumLen += 109;
        clock_gettime(CLOCK_MONOTONIC, &realTime);
        long long ns = HiLogTimespecSub(startTime, realTime);
        if ((ns <= NSEC_PER_SEC && sumLen > flowQuota) || (ns > NSEC_PER_SEC)) {
            break;
        }
    }
    result = ExecuteCmd("hilog -x -t core| wc -l");
    std::cout << result << std::endl;
    expect = to_string(i);
    EXPECT_GE(stoi(result), stoi(expect)); // result include drop log ,may more than expect
#endif
    ExeCmd("hilog -Q domainoff");
    ExeCmd("hilog -Q pidoff");
    ExeCmd("hilog -r -t all");
    ExeCmd("hilog -G 1m -t all");
}


#else

HWTEST_F(TestTool, process_flowctrl_open, Function|MediumTest|Level4)
{
#ifndef LOCALTEST
    int i = 0;
    struct timespec startTime = {0, 0};
    struct timespec realTime = {0, 0};
    uint32_t flowQuota = 13050;
    uint32_t sumLen = 0;
    sleep(2);
    ExeCmd("hilog -G 2m -t all");
    ExeCmd("hilog -Q pidon");
    ExeCmd("hilog -Q domainoff");
    ExeCmd("hilog -r -t all");   
    clock_gettime(CLOCK_MONOTONIC, &realTime);
    startTime = realTime;
    while (1) {
        HILOG_DEBUG(LOG_CORE, "123456789_1234567890_public and private log test is: \
%{public}d, %{public}lf, %{public}.2f, %{public}s, %{public}c", 1, 1.00001, 2.333333, "sse", 'a');
        i++;
        sumLen += 109;
        clock_gettime(CLOCK_MONOTONIC, &realTime);
        long long ns = HiLogTimespecSub(startTime, realTime);
        if ((ns < NSEC_PER_SEC && sumLen > flowQuota) || (ns >= NSEC_PER_SEC)) {
            int tmp = 0;
            while (tmp < 1000) {
                HILOG_DEBUG(LOG_CORE, "123456789_1234567890_public and private log test is: \
%{public}d, %{public}lf, %{public}.2f, %{public}s, %{public}c", 1, 1.00001, 2.333333, "sse", 'a');
                i++;
                tmp ++;
            }
            break;
        }
    }   
    result = ExecuteCmd("hilog -x -t core | wc -l");
    expect = to_string(i);
    EXPECT_LT(stoi(result), stoi(expect));
#endif
    // close flowctrl
    ExeCmd("hilog -Q domainoff");
    ExeCmd("hilog -Q pidoff");
    ExeCmd("hilog -r -t all");
    ExeCmd("hilog -G 1m -t all");
}


HWTEST_F(TestTool, process_flowctrl_close, Function|MediumTest|Level4)
{
#ifndef LOCALTEST
    int i = 0;
    ExeCmd("hilog -G 2m -t all");
    ExeCmd("hilog -Q pidoff");
    ExeCmd("hilog -Q domainoff");
    ExeCmd("hilog -r -t all");
    while (i < 1000) {
        HILOG_DEBUG(LOG_CORE, "123456789_1234567890_public and private log test is: \
%{public}d, %{public}lf, %{public}.2f, %{public}s, %{public}c", i, 1.00001, 2.333333, "sse", 'a');
        i++;
    }   
    result = ExecuteCmd("hilog -x -t core | wc -l");
    expect = "1000";
    EXPECT_EQ(stoi(result), stoi(expect));
#endif
    // close flowctrl
    ExeCmd("hilog -Q domainoff");
    ExeCmd("hilog -Q pidoff");
    ExeCmd("hilog -r -t all");
    ExeCmd("hilog -G 1m -t all");
}



HWTEST_F(TestTool, domain_flowctrl_open, Function|MediumTest|Level4)
{
#ifndef LOCALTEST
    int i = 0;
    struct timespec startTime = {0, 0};
    struct timespec realTime = {0, 0};
    uint32_t flowQuota = 13050;
    uint32_t sumLen = 0;
    sleep(2);
    ExeCmd("hilog -Q domainon");
    ExeCmd("hilog -Q pidoff");
    ExeCmd("hilog -r -t all"); 
    ExeCmd("hilog -G 1m -t all");
    clock_gettime(CLOCK_MONOTONIC, &realTime);
    startTime = realTime;
    while (1) {
        HILOG_DEBUG(LOG_CORE, "123456789_1234567890_public and private log test is: \
%{public}d, %{public}lf, %{public}.2f, %{public}s, %{public}c", 1, 1.00001, 2.333333, "sse", 'a');
        i++;
        sumLen += 109;
        clock_gettime(CLOCK_MONOTONIC, &realTime);
        long long ns = HiLogTimespecSub(startTime, realTime);
        if ((ns < NSEC_PER_SEC && sumLen > flowQuota) || (ns >= NSEC_PER_SEC)) {
            int tmp = 0;
            while (tmp < 1000) {
                HILOG_DEBUG(LOG_CORE, "123456789_1234567890_public and private log test is: \
%{public}d, %{public}lf, %{public}.2f, %{public}s, %{public}c", 1, 1.00001, 2.333333, "sse", 'a');
                i++;
                tmp++;
            }
            break;
        }
    }   
    result = ExecuteCmd("hilog -x -t core| wc -l");
    expect = to_string(i);
    EXPECT_LT(stoi(result), stoi(expect));
#endif
    // close flowctrl
    ExeCmd("hilog -Q domainoff");
    ExeCmd("hilog -Q pidoff");
    ExeCmd("hilog -r -t all");
    ExeCmd("hilog -G 1m -t all");
}



HWTEST_F(TestTool, domain_flowctrl_close, Function|MediumTest|Level4)
{
#ifndef LOCALTEST
    int i = 0; 
    ExeCmd("hilog -G 2m -t all");
    ExeCmd("hilog -Q domainoff");
    ExeCmd("hilog -Q pidoff");
    ExeCmd("hilog -r -t all"); 
    while (i < 1000) {
        HILOG_DEBUG(LOG_CORE, "123456789_1234567890_public and private log test is: \
%{public}d, %{public}lf, %{public}.2f, %{public}s, %{public}c", i, 1.00001, 2.333333, "sse", 'a');
        i++;
    }   
    result = ExecuteCmd("hilog -x -t core| wc -l");
    expect = "1000";
    EXPECT_EQ(stoi(result), stoi(expect));
#endif
    // close flowctrl
    ExeCmd("hilog -Q domainoff");
    ExeCmd("hilog -Q pidoff");
    ExeCmd("hilog -r -t all");
    ExeCmd("hilog -G 1m -t all");
}



HWTEST_F(TestTool, flowctrl_switch_illegal, Function|MediumTest|Level4)
{
#ifndef LOCALTEST
    result = ExecuteCmd("hilog -Q abc");
    expect = "flowctrl switch operation error!\n";
    EXPECT_EQ(result, expect);
    // close flowctrl
    ExeCmd("hilog -Q domainoff");
    ExeCmd("hilog -Q pidoff");
    ExeCmd("hilog -r -t all");
    ExeCmd("hilog -G 1m -t all");
#endif
}




HWTEST_F(TestTool, process_flowctrl, Function|MediumTest|Level4)
{
#ifndef LOCALTEST   
    int i = 0;
    struct timespec startTime = {0, 0};
    struct timespec realTime = {0, 0};
    uint32_t flowQuota = 13050;
    uint32_t sumLen = 0;
    // less than quota
    sleep(2);
    ExeCmd("hilog -G 2m -t all");
    ExeCmd("hilog -Q pidon");
    ExeCmd("hilog -Q domainoff");
    ExeCmd("hilog -r -t all");  
    clock_gettime(CLOCK_MONOTONIC, &realTime);
    startTime = realTime;
    while (1) {  
        HILOG_DEBUG(LOG_CORE, "123456789_1234567890_public and private log test is: \
%{public}d, %{public}lf, %{public}.2f, %{public}s, %{public}c", 1, 1.00001, 2.333333, "sse", 'a');
        i++;
        sumLen += 109;
        clock_gettime(CLOCK_MONOTONIC, &realTime);
        long long ns = HiLogTimespecSub(startTime, realTime);
        if ((ns < NSEC_PER_SEC && sumLen > flowQuota) || (ns >= NSEC_PER_SEC)) {
            break;
        }
    }   
    result = ExecuteCmd("hilog -x -t core | wc -l");
    expect = to_string(i);
    EXPECT_GE(stoi(result), stoi(expect)); // result include drop log ,may more than expect

#endif    
    // test end close switch
    ExeCmd("hilog -Q domainoff");
    ExeCmd("hilog -Q pidoff");
    ExeCmd("hilog -r -t all");
    ExeCmd("hilog -G 1m -t all");

}


HWTEST_F(TestTool, process_flowctrl2, Function|MediumTest|Level4)
{
#ifndef LOCALTEST   
    int i = 0;
    struct timespec startTime = {0, 0};
    struct timespec realTime = {0, 0};
    uint32_t flowQuota = 13050;
    uint32_t sumLen = 0;
    // more than quota
    sleep(2);
    ExeCmd("hilog -G 2m -t all");
    ExeCmd("hilog -Q pidon");
    ExeCmd("hilog -Q domainoff");
    ExeCmd("hilog -r -t all");
    clock_gettime(CLOCK_MONOTONIC, &realTime);
    startTime = realTime;
    while (1) {   
        HILOG_DEBUG(LOG_CORE, "123456789_1234567890_public and private log test is: \
%{public}d, %{public}lf, %{public}.2f, %{public}s, %{public}c", 1, 1.00001, 2.333333, "sse", 'a');
        i++;
        sumLen += 109;
        clock_gettime(CLOCK_MONOTONIC, &realTime); 
        long long ns = HiLogTimespecSub(startTime, realTime);
        if ((ns < NSEC_PER_SEC && sumLen > flowQuota) || (ns >= NSEC_PER_SEC)) {
            int tmp = 0;
            while (tmp < 1000) {
                HILOG_DEBUG(LOG_CORE, "123456789_1234567890_public and private log test is: \
%{public}d, %{public}lf, %{public}.2f, %{public}s, %{public}c", 1, 1.00001, 2.333333, "sse", 'a');
                i++;
                tmp ++;
            }
            break;
        }
    }
    result = ExecuteCmd("hilog -x -t core | wc -l");
    expect = to_string(i);
    EXPECT_LT(stoi(result), stoi(expect));
#endif
    // test end close switch
    ExeCmd("hilog -Q domainoff");
    ExeCmd("hilog -Q pidoff");
    ExeCmd("hilog -r -t all");
    ExeCmd("hilog -G 1m -t all");
}


HWTEST_F(TestTool, domain_flowctrl, Function|MediumTest|Level4)
{
#ifndef LOCALTEST    
    int i = 0;
    struct timespec startTime = {0, 0};
    struct timespec realTime = {0, 0};
    uint32_t flowQuota = 13050;
    uint32_t sumLen = 0;
    // less than quota
    sleep(2);
    ExeCmd("hilog -G 2m -t all");
    ExeCmd("hilog -Q domainon");
    ExeCmd("hilog -Q pidoff");
    ExeCmd("hilog -r -t all");
    clock_gettime(CLOCK_MONOTONIC, &realTime);
    startTime = realTime;
    while (1) {   
        HILOG_DEBUG(LOG_CORE, "123456789_1234567890_public and private log test is: \
%{public}d, %{public}lf, %{public}.2f, %{public}s, %{public}c", 1, 1.00001, 2.333333, "sse", 'a');
        i++;
        sumLen += 109;
        clock_gettime(CLOCK_MONOTONIC, &realTime);
        long long ns = HiLogTimespecSub(startTime, realTime);
        if ((ns < NSEC_PER_SEC && sumLen > flowQuota) || (ns >= NSEC_PER_SEC)) {
            break;
        }
    } 
    result = ExecuteCmd("hilog -x -t core | wc -l");
    expect = to_string(i);
    EXPECT_GE(stoi(result), stoi(expect)); // result include drop log ,may more than expect
#endif
    // test end close switch
    ExeCmd("hilog -Q domainoff");
    ExeCmd("hilog -Q pidoff");
    ExeCmd("hilog -r -t all");
    ExeCmd("hilog -G 1m -t all");
}



HWTEST_F(TestTool, domain_flowctrl2, Function|MediumTest|Level4)
{
#ifndef LOCALTEST    
    int i = 0;
    struct timespec startTime = {0, 0};
    struct timespec realTime = {0, 0};
    uint32_t flowQuota = 13050;
    uint32_t sumLen = 0;
    // more than quota
    sleep(2);
    ExeCmd("hilog -G 2m -t all");
    ExeCmd("hilog -Q domainon");
    ExeCmd("hilog -Q pidoff");
    ExeCmd("hilog -r -t all"); 
    clock_gettime(CLOCK_MONOTONIC, &realTime);
    startTime = realTime;
    while (1) {  
        HILOG_DEBUG(LOG_CORE, "123456789_1234567890_public and private log test is: \
%{public}d, %{public}lf, %{public}.2f, %{public}s, %{public}c", 1, 1.00001, 2.333333, "sse", 'a');
        i++;
        sumLen += 109;
        clock_gettime(CLOCK_MONOTONIC, &realTime);
        long long ns = HiLogTimespecSub(startTime, realTime);
        if ((ns < NSEC_PER_SEC && sumLen > flowQuota) || (ns >= NSEC_PER_SEC)) {
            int tmp = 0;
            while (tmp < 1000) {
                HILOG_DEBUG(LOG_CORE, "123456789_1234567890_public and private log test is: \
%{public}d, %{public}lf, %{public}.2f, %{public}s, %{public}c", 1, 1.00001, 2.333333, "sse", 'a');
                i++;
                tmp++;
            }
            break;
        }
    }  
    result = ExecuteCmd("hilog -x -t core | wc -l");
    expect = to_string(i);
    EXPECT_LT(stoi(result), stoi(expect));
#endif
    // test end close switch
    ExeCmd("hilog -Q domainoff");
    ExeCmd("hilog -Q pidoff");
    ExeCmd("hilog -r -t all");
    ExeCmd("hilog -G 1m -t all");
}



HWTEST_F(TestTool, domain_flowctrl_quit_info, Function|MediumTest|Level4)
{
#ifndef LOCALTEST    
    bool ret;
    int i = 0;
    struct timespec startTime = {0, 0};
    struct timespec realTime = {0, 0};
    uint32_t flowQuota = 13050;
    uint32_t sumLen = 0;
    // log quit info
    ExeCmd("hilog -G 2m -t all");
    ExeCmd("hilog -Q domainon");
    ExeCmd("hilog -Q pidoff");
    ExeCmd("hilog -r -t all"); 
    ExeCmd("hilog -S -t core"); 
    clock_gettime(CLOCK_MONOTONIC, &realTime);
    startTime = realTime;
    while (1) {        
        HILOG_DEBUG(LOG_CORE, "123456789_1234567890_public and private log test is: \
%{public}d, %{public}lf, %{public}.2f, %{public}s, %{public}c", 1, 1.00001, 2.333333, "sse", 'a');
        i++;
        sumLen += 109;
        clock_gettime(CLOCK_MONOTONIC, &realTime);
        long long ns = HiLogTimespecSub(startTime, realTime);
        if ((ns < NSEC_PER_SEC && sumLen > flowQuota) || (ns >= NSEC_PER_SEC)) {
            int tmp = 0;
            while (tmp < 1000) {
                HILOG_DEBUG(LOG_CORE, "123456789_1234567890_public and private log test is: \
%{public}d, %{public}lf, %{public}.2f, %{public}s, %{public}c", 1, 1.00001, 2.333333, "sse", 'a');
                i++;
                tmp++;
            }
            break;
        }
    }   
    result = ExecuteCmd("hilog -s -t core");
    std::regex reg("core print log length is \\w+\ncore cache log length is \\w+\ncore dropped log lines is \
[1-9]\\w+\n");
    ret = std::regex_match(result, reg);
    EXPECT_EQ(ret, true);
#endif
    // test end close switch
    ExeCmd("hilog -Q domainoff");
    ExeCmd("hilog -Q pidoff");
    ExeCmd("hilog -r -t all");
    ExeCmd("hilog -G 1m -t all");

}


HWTEST_F(TestTool, flowctrl_logtype, Function|MediumTest|Level4)
{
#ifndef LOCALTEST   
    int i = 0;
    struct timespec startTime = {0, 0};
    struct timespec realTime = {0, 0};
    uint32_t flowQuota = 13050;
    uint32_t sumLen = 0;
    // logtype app not control
    ExeCmd("hilog -G 2m -t all");
    ExeCmd("hilog -Q pidon");
    ExeCmd("hilog -Q domainoff");
    ExeCmd("hilog -r -t all");    
    clock_gettime(CLOCK_MONOTONIC, &realTime);
    startTime = realTime;
    while (1) {           
        HILOG_DEBUG(LOG_APP, "123456789_1234567890_public and private log test is: \
%{public}d, %{public}lf, %{public}.2f, %{public}s, %{public}c", 1, 1.00001, 2.333333, "sse", 'a');
        i++;
        sumLen += 109;
        clock_gettime(CLOCK_MONOTONIC, &realTime);  
        long long ns = HiLogTimespecSub(startTime, realTime);
        if ((ns < NSEC_PER_SEC && sumLen > flowQuota) || (ns >= NSEC_PER_SEC)) {
            int tmp = 0;
            while (tmp < 1000) {
                HILOG_DEBUG(LOG_APP, "123456789_1234567890_public and private log test is: \
%{public}d, %{public}lf, %{public}.2f, %{public}s, %{public}c", 1, 1.00001, 2.333333, "sse", 'a');
                i++;
                tmp ++;
            }
            break;
        }
    }   
    result = ExecuteCmd("hilog -x -t app| wc -l");
    expect = to_string(i);
    EXPECT_EQ(stoi(result), stoi(expect));
#endif
    // test end close switch
    ExeCmd("hilog -Q domainoff");
    ExeCmd("hilog -Q pidoff");
    ExeCmd("hilog -r -t all");
    ExeCmd("hilog -G 1m -t all");
}



HWTEST_F(TestTool, flowctrl_logtype2, Function|MediumTest|Level4)
{
#ifndef LOCALTEST    
    int i = 0;
    struct timespec startTime = {0, 0};
    struct timespec realTime = {0, 0};
    uint32_t flowQuota = 13050;
    uint32_t sumLen = 0;
    // logtype app not control
    ExeCmd("hilog -G 2m -t all");
    ExeCmd("hilog -Q domainon");
    ExeCmd("hilog -Q pidoff");
    ExeCmd("hilog -r -t all"); 
    clock_gettime(CLOCK_MONOTONIC, &realTime);
    startTime = realTime;
    while (1) {
        HILOG_DEBUG(LOG_APP, "123456789_1234567890_public and private log test is: \
%{public}d, %{public}lf, %{public}.2f, %{public}s, %{public}c", 1, 1.00001, 2.333333, "sse", 'a');
        i++;
        sumLen += 109;
        clock_gettime(CLOCK_MONOTONIC, &realTime);
        long long ns = HiLogTimespecSub(startTime, realTime);    
        if ((ns < NSEC_PER_SEC && sumLen > flowQuota) || (ns >= NSEC_PER_SEC)) {
            int tmp = 0;
            while (tmp < 1000) {
                HILOG_DEBUG(LOG_APP, "123456789_1234567890_public and private log test is: \
%{public}d, %{public}lf, %{public}.2f, %{public}s, %{public}c", 1, 1.00001, 2.333333, "sse", 'a');
                i++;
                tmp++;
            }
            break;
        }
    }   
    result = ExecuteCmd("hilog -x -t app| wc -l");
    expect = to_string(i);
    EXPECT_EQ(stoi(result), stoi(expect));
#endif
    // test end close switch
    ExeCmd("hilog -Q domainoff");
    ExeCmd("hilog -Q pidoff");
    ExeCmd("hilog -r -t all");
    ExeCmd("hilog -G 1m -t all");
}
#endif
