/*
 * Copyright (c) 2020-2021 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#include "ActsDacTest.h"
#include <cstddef>
#include <fcntl.h>
#include <unistd.h>
#include <dirent.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <sys/wait.h>
#include "gtest/gtest.h"
#include "ActsCapabilityTest.h"

using namespace std;
using namespace testing::ext;

class DacTestSuite : public::testing::Test {
protected:
    char *mCurPath;
    void SetUp();
    void TearDown();
};

int main()
{
    if (CheckFsMount(TOP_DIR, TOP_DIR_MOUNT_INFO) != 0) {
        return 1;
    } else {
        return RUN_ALL_TESTS();
    }
}

// Preset action of the test suite, which is executed before the first test case
void DacTestSuite::SetUp()
{
    // Permission mask preset when creating a file
    umask(ZERO);
    // Init capabilities
    CapInit();
    // Initialize the process and set the uid and gid of the process to zero
    SetUidGid(UID0, GID0);
    // Delete the the directory if exists
    RemoveDir(TOP_DIR "/" DACDIR0);
    RemoveDir(TOP_DIR "/" DACDIR1);
    RemoveDir("/storage/" DACDIR0);
    // Obtain the current working directory of the test code
    mCurPath = GetCurrentPath();
    // Modify the current working directory of the test code
    int ret = chdir(TOP_DIR);
    if (ret != 0) {
        LOG("ErrInfo: Failed to chdir to %s, ret=%d, errno=%d", TOP_DIR, ret, errno);
    }
}

// Test suite cleanup action, which is executed after the last test case
void DacTestSuite::TearDown()
{
    // Delete the the directory if exists
    RemoveDir(TOP_DIR "/" DACDIR0);
    RemoveDir(TOP_DIR "/" DACDIR1);
    RemoveDir("/storage/" DACDIR0);
    // Initialize the process and set the uid and gid of the process to zero
    SetUidGid(UID0, GID0);
    // Restore the working directory of the test code
    int ret = chdir(mCurPath);
    if (ret != 0) {
        LOG("ErrInfo: Failed to chdir to %s, ret=%d, errno=%d", mCurPath, ret, errno);
    }
}

#if defined(LITE_FS_JFFS2) || defined(LITE_FS_VFAT)
static int TestSetUid()
{
    // Test the 'setuid' interface
    int ret = 0;
    uid_t ruid = 0;
    uid_t euid = 0;
    uid_t suid = 0;
    // Step 1: Verify that UID is set to 0
    ret = setuid(UID0);
    if (ret != 0) {
        EXPECT_EQ(ret, 0);
        LOG("ErrInfo: Failed to set uid=0, now process uid=%d", getuid());
        return FALSE;
    }
    // To test the function of invoking the setuid interface to set the UID=0
    getresuid(&ruid, &euid, &suid);
    EXPECT_EQ(ruid, UID0) << "Failed to set ruid=0: ruid=" << ruid;
    EXPECT_EQ(euid, UID0) << "Failed to set euid=0: euid=" << euid;
    EXPECT_EQ(suid, UID0) << "Failed to set suid=0: suid=" << suid;
    // Step 2: Verify that UID is set to 1000
    ret = setuid(UID1000);
    if (ret != 0) {
        EXPECT_EQ(ret, 0);
        LOG("ErrInfo: Failed to set uid=1000, now process uid=%d", getuid());
        return FALSE;
    }
    // To test the function of invoking the setuid interface to set the UID=1000
    getresuid(&ruid, &euid, &suid);
    EXPECT_EQ(ruid, UID1000) << "Failed to set ruid=1000: ruid=" << ruid;
    EXPECT_EQ(euid, UID1000) << "Failed to set euid=1000: euid=" << euid;
    EXPECT_EQ(suid, UID1000) << "Failed to set suid=1000: suid=" << suid;
    // Step 3: Verify that UID is set to 10000
    ret = setuid(UID10000);
    if (ret != 0) {
        EXPECT_EQ(ret, 0);
        LOG("ErrInfo: Failed to set uid=10000, now process uid=%d", getuid());
        return FALSE;
    }
    // To test the function of invoking the setuid interface to set the UID=10000
    getresuid(&ruid, &euid, &suid);
    EXPECT_EQ(ruid, UID10000) << "Failed to set ruid=10000: ruid=" << ruid;
    EXPECT_EQ(euid, UID10000) << "Failed to set euid=10000: euid=" << euid;
    EXPECT_EQ(suid, UID10000) << "Failed to set suid=10000: suid=" << suid;
    // Step 4: Verify that UID is set to 2147483647
    ret = setuid(MAX_INT);
    if (ret != 0) {
        EXPECT_EQ(ret, 0);
        LOG("ErrInfo: Failed to set uid=2147483647, now process uid=%d", getuid());
        return FALSE;
    }
    // To test the function of invoking the setuid interface to set the UID=2147483647
    getresuid(&ruid, &euid, &suid);
    EXPECT_EQ(ruid, MAX_INT) << "Failed to set ruid=2147483647: ruid=" << ruid;
    EXPECT_EQ(euid, MAX_INT) << "Failed to set euid=2147483647: euid=" << euid;
    EXPECT_EQ(suid, MAX_INT) << "Failed to set suid=2147483647: suid=" << suid;
    return 0;
}

static int TestSetREUid()
{
    // Test the 'setreuid' interface
    int ret = 0;
    uid_t ruid = 0;
    uid_t euid = 0;
    uid_t suid = 0;
    // Step 1: Verify that UID is set to 0
    ret = setreuid(UID0, UID0);
    if (ret != 0) {
        EXPECT_EQ(ret, 0);
        LOG("ErrInfo: Failed to set uid=0, now process uid=%d", getuid());
        return FALSE;
    }
    // To test the function of invoking the setuid interface to set the UID=0
    getresuid(&ruid, &euid, &suid);
    EXPECT_EQ(ruid, UID0) << "Failed to set ruid=0: ruid=" << ruid;
    EXPECT_EQ(euid, UID0) << "Failed to set euid=0: euid=" << euid;
    EXPECT_EQ(suid, UID0) << "Failed to set suid=0: suid=" << suid;
    // Step 2: Verify that UID is set to 1000
    ret = setreuid(UID1000, UID1000);
    if (ret != 0) {
        EXPECT_EQ(ret, 0);
        LOG("ErrInfo: Failed to set uid=1000, now process uid=%d", getuid());
        return FALSE;
    }
    // To test the function of invoking the setuid interface to set the UID=1000
    getresuid(&ruid, &euid, &suid);
    EXPECT_EQ(ruid, UID1000) << "Failed to set ruid=1000: ruid=" << ruid;
    EXPECT_EQ(euid, UID1000) << "Failed to set euid=1000: euid=" << euid;
    EXPECT_EQ(suid, UID1000) << "Failed to set suid=1000: suid=" << suid;
    // Step 3: Verify that UID is set to 10000
    ret = setreuid(UID10000, UID10000);
    if (ret != 0) {
        EXPECT_EQ(ret, 0);
        LOG("ErrInfo: Failed to set uid=10000, now process uid=%d", getuid());
        return FALSE;
    }
    // To test the function of invoking the setuid interface to set the UID=10000
    getresuid(&ruid, &euid, &suid);
    EXPECT_EQ(ruid, UID10000) << "Failed to set ruid=10000: ruid=" << ruid;
    EXPECT_EQ(euid, UID10000) << "Failed to set euid=10000: euid=" << euid;
    EXPECT_EQ(suid, UID10000) << "Failed to set suid=10000: suid=" << suid;
    // Step 4: Verify that UID is set to 2147483647
    ret = setreuid(MAX_INT, MAX_INT);
    if (ret != 0) {
        EXPECT_EQ(ret, 0);
        LOG("ErrInfo: Failed to set uid=2147483647, now process uid=%d", getuid());
        return FALSE;
    }
    // To test the function of invoking the setuid interface to set the UID=2147483647
    getresuid(&ruid, &euid, &suid);
    EXPECT_EQ(ruid, MAX_INT) << "Failed to set ruid=2147483647: ruid=" << ruid;
    EXPECT_EQ(euid, MAX_INT) << "Failed to set euid=2147483647: euid=" << euid;
    EXPECT_EQ(suid, MAX_INT) << "Failed to set suid=2147483647: suid=" << suid;
    return 0;
}

static int TestSetRESUid()
{
    // Test the 'setresuid' interface
    int ret = 0;
    uid_t ruid = 0;
    uid_t euid = 0;
    uid_t suid = 0;
    // Step 1: Verify that UID is set to 0
    ret = setresuid(UID0, UID0, UID0);
    if (ret != 0) {
        EXPECT_EQ(ret, 0);
        LOG("ErrInfo: Failed to set uid=0, now process uid=%d", getuid());
        return FALSE;
    }
    // To test the function of invoking the setuid interface to set the UID=0
    getresuid(&ruid, &euid, &suid);
    EXPECT_EQ(ruid, UID0) << "Failed to set ruid=0: ruid=" << ruid;
    EXPECT_EQ(euid, UID0) << "Failed to set euid=0: euid=" << euid;
    EXPECT_EQ(suid, UID0) << "Failed to set suid=0: suid=" << suid;
    // Step 2: Verify that UID is set to 1000
    ret = setresuid(UID1000, UID1000, UID1000);
    if (ret != 0) {
        EXPECT_EQ(ret, 0);
        LOG("ErrInfo: Failed to set uid=1000, now process uid=%d", getuid());
        return FALSE;
    }
    // To test the function of invoking the setuid interface to set the UID=1000
    getresuid(&ruid, &euid, &suid);
    EXPECT_EQ(ruid, UID1000) << "Failed to set ruid=1000: ruid=" << ruid;
    EXPECT_EQ(euid, UID1000) << "Failed to set euid=1000: euid=" << euid;
    EXPECT_EQ(suid, UID1000) << "Failed to set suid=1000: suid=" << suid;
    // Step 3: Verify that UID is set to 10000
    ret = setresuid(UID10000, UID10000, UID10000);
    if (ret != 0) {
        EXPECT_EQ(ret, 0);
        LOG("ErrInfo: Failed to set uid=10000, now process uid=%d", getuid());
        return FALSE;
    }
    // To test the function of invoking the setuid interface to set the UID=10000
    getresuid(&ruid, &euid, &suid);
    EXPECT_EQ(ruid, UID10000) << "Failed to set ruid=10000: ruid=" << ruid;
    EXPECT_EQ(euid, UID10000) << "Failed to set euid=10000: euid=" << euid;
    EXPECT_EQ(suid, UID10000) << "Failed to set suid=10000: suid=" << suid;
    // Step 4: Verify that UID is set to 2147483647
    ret = setresuid(MAX_INT, MAX_INT, MAX_INT);
    if (ret != 0) {
        EXPECT_EQ(ret, 0);
        LOG("ErrInfo: Failed to set uid=2147483647, now process uid=%d", getuid());
        return FALSE;
    }
    // To test the function of invoking the setuid interface to set the UID=2147483647
    getresuid(&ruid, &euid, &suid);
    EXPECT_EQ(ruid, MAX_INT) << "Failed to set ruid=2147483647: ruid=" << ruid;
    EXPECT_EQ(euid, MAX_INT) << "Failed to set euid=2147483647: euid=" << euid;
    EXPECT_EQ(suid, MAX_INT) << "Failed to set suid=2147483647: suid=" << suid;
    return 0;
}

static int TestSetUidAbnormal()
{
    // Enter the exception parameter when invoke the 'setuid','setreuid','setresuid' interface
    int ret = 0;
    uid_t newruid = 0;
    uid_t neweuid = 0;
    uid_t newsuid = 0;
    uid_t ruid = 0;
    uid_t euid = 0;
    uid_t suid = 0;
    // Obtain the ruid, euid, suid of the current process
    getresuid(&ruid, &euid, &suid);
    // Step 1: Verify that UID is set to -100 with the 'setuid' interface
    ret = setuid(ABNORMALINT);
    if (ret != FALSE) {
        EXPECT_EQ(ret, FALSE);
        LOG("ErrInfo: Set uid=-100, now process uid=%d", getuid());
        return FALSE;
    }
    // To test the function of invoking the 'setuid' interface to set the UID=-100
    getresuid(&newruid, &neweuid, &newsuid);
    EXPECT_EQ(newruid, ruid) << "The value of ruid changes after an invalid parameter is entered: ruid=" << ruid;
    EXPECT_EQ(neweuid, euid) << "The value of euid changes after an invalid parameter is entered: euid=" << euid;
    EXPECT_EQ(newsuid, suid) << "The value of suid changes after an invalid parameter is entered: suid=" << suid;
    // Step 2: Verify that UID is set to -100 with the 'setreuid' interface
    ret = setreuid(ABNORMALINT, ABNORMALINT);
    if (ret != FALSE) {
        EXPECT_EQ(ret, FALSE);
        LOG("ErrInfo: Set uid=-100, now process uid=%d", getuid());
        return FALSE;
    }
    // To test the function of invoking the 'setuid' interface to set the UID=-100
    getresuid(&newruid, &neweuid, &newsuid);
    EXPECT_EQ(newruid, ruid) << "The value of ruid changes after an invalid parameter is entered: ruid=" << ruid;
    EXPECT_EQ(neweuid, euid) << "The value of euid changes after an invalid parameter is entered: euid=" << euid;
    EXPECT_EQ(newsuid, suid) << "The value of suid changes after an invalid parameter is entered: suid=" << suid;
    // Step 3: Verify that UID is set to -100 with the 'setreuid' interface
    ret = setresuid(ABNORMALINT, ABNORMALINT, ABNORMALINT);
    if (ret != FALSE) {
        EXPECT_EQ(ret, FALSE);
        LOG("ErrInfo: Set uid=-100, now process uid=%d", getuid());
        return FALSE;
    }
    // To test the function of invoking the 'setuid' interface to set the UID=-100
    getresuid(&newruid, &neweuid, &newsuid);
    EXPECT_EQ(newruid, ruid) << "The value of ruid changes after an invalid parameter is entered: ruid=" << ruid;
    EXPECT_EQ(neweuid, euid) << "The value of euid changes after an invalid parameter is entered: euid=" << euid;
    EXPECT_EQ(newsuid, suid) << "The value of suid changes after an invalid parameter is entered: suid=" << suid;
    return 0;
}

static int TestSetGid()
{
    // Test the 'setgid' interface
    int ret = 0;
    gid_t rgid = 0;
    gid_t egid = 0;
    gid_t sgid = 0;
    // Step 1: Verify that GID is set to 0
    ret = setgid(GID0);
    if (ret != 0) {
        EXPECT_EQ(ret, 0);
        LOG("ErrInfo: Failed to set gid=0, now process gid=%d", getgid());
        return FALSE;
    }
    // To test the function of invoking the setgid interface to set the GID=0
    getresgid(&rgid, &egid, &sgid);
    EXPECT_EQ(rgid, GID0) << "Failed to set rgid=0: rgid=" << rgid;
    EXPECT_EQ(egid, GID0) << "Failed to set egid=0: egid=" << egid;
    EXPECT_EQ(sgid, GID0) << "Failed to set sgid=0: sgid=" << sgid;
    // Step 2: Verify that GID is set to 1000
    ret = setgid(GID1000);
    if (ret != 0) {
        EXPECT_EQ(ret, 0);
        LOG("ErrInfo: Failed to set gid=1000, now process gid=%d", getgid());
        return FALSE;
    }
    // To test the function of invoking the setgid interface to set the GID=1000
    getresgid(&rgid, &egid, &sgid);
    EXPECT_EQ(rgid, GID1000) << "Failed to set rgid=1000: rgid=" << rgid;
    EXPECT_EQ(egid, GID1000) << "Failed to set egid=1000: egid=" << egid;
    EXPECT_EQ(sgid, GID1000) << "Failed to set sgid=1000: sgid=" << sgid;
    // Step 3: Verify that GID is set to 10000
    ret = setgid(GID10000);
    if (ret != 0) {
        EXPECT_EQ(ret, 0);
        LOG("ErrInfo: Failed to set gid=10000, now process gid=%d", getgid());
        return FALSE;
    }
    // To test the function of invoking the setgid interface to set the GID=10000
    getresgid(&rgid, &egid, &sgid);
    EXPECT_EQ(rgid, GID10000) << "Failed to set rgid=10000: rgid=" << rgid;
    EXPECT_EQ(egid, GID10000) << "Failed to set egid=10000: egid=" << egid;
    EXPECT_EQ(sgid, GID10000) << "Failed to set sgid=10000: sgid=" << sgid;
    // Step 4: Verify that GID is set to 2147483647
    ret = setgid(MAX_INT);
    if (ret != 0) {
        EXPECT_EQ(ret, 0);
        LOG("ErrInfo: Failed to set gid=2147483647, now process gid=%d", getgid());
        return FALSE;
    }
    // To test the function of invoking the setgid interface to set the GID=2147483647
    getresgid(&rgid, &egid, &sgid);
    EXPECT_EQ(rgid, MAX_INT) << "Failed to set rgid=2147483647: rgid=" << rgid;
    EXPECT_EQ(egid, MAX_INT) << "Failed to set egid=2147483647: egid=" << egid;
    EXPECT_EQ(sgid, MAX_INT) << "Failed to set sgid=2147483647: sgid=" << sgid;
    return 0;
}

static int TestSetREGid()
{
    // Test the 'setregid' interface
    int ret = 0;
    gid_t rgid = 0;
    gid_t egid = 0;
    gid_t sgid = 0;
    // Step 1: Verify that GID is set to 0
    ret = setregid(GID0, GID0);
    if (ret != 0) {
        EXPECT_EQ(ret, 0);
        LOG("ErrInfo: Failed to set gid=0, now process gid=%d", getgid());
        return FALSE;
    }
    // To test the function of invoking the setgid interface to set the GID=0
    getresgid(&rgid, &egid, &sgid);
    EXPECT_EQ(rgid, GID0) << "Failed to set rgid=0: rgid=" << rgid;
    EXPECT_EQ(egid, GID0) << "Failed to set egid=0: egid=" << egid;
    EXPECT_EQ(sgid, GID0) << "Failed to set sgid=0: sgid=" << sgid;
    // Step 2: Verify that GID is set to 1000
    ret = setregid(GID1000, GID1000);
    if (ret != 0) {
        EXPECT_EQ(ret, 0);
        LOG("ErrInfo: Failed to set gid=1000, now process gid=%d", getgid());
        return FALSE;
    }
    // To test the function of invoking the setgid interface to set the GID=1000
    getresgid(&rgid, &egid, &sgid);
    EXPECT_EQ(rgid, GID1000) << "Failed to set rgid=1000: rgid=" << rgid;
    EXPECT_EQ(egid, GID1000) << "Failed to set egid=1000: egid=" << egid;
    EXPECT_EQ(sgid, GID1000) << "Failed to set sgid=1000: sgid=" << sgid;
    // Step 3: Verify that GID is set to 10000
    ret = setregid(GID10000, GID10000);
    if (ret != 0) {
        EXPECT_EQ(ret, 0);
        LOG("ErrInfo: Failed to set gid=10000, now process gid=%d", getgid());
        return FALSE;
    }
    // To test the function of invoking the setgid interface to set the GID=10000
    getresgid(&rgid, &egid, &sgid);
    EXPECT_EQ(rgid, GID10000) << "Failed to set rgid=10000: rgid=" << rgid;
    EXPECT_EQ(egid, GID10000) << "Failed to set egid=10000: egid=" << egid;
    EXPECT_EQ(sgid, GID10000) << "Failed to set sgid=10000: sgid=" << sgid;
    // Step 4: Verify that GID is set to 2147483647
    ret = setregid(MAX_INT, MAX_INT);
    if (ret != 0) {
        EXPECT_EQ(ret, 0);
        LOG("ErrInfo: Failed to set gid=2147483647, now process gid=%d", getgid());
        return FALSE;
    }
    // To test the function of invoking the setgid interface to set the GID=2147483647
    getresgid(&rgid, &egid, &sgid);
    EXPECT_EQ(rgid, MAX_INT) << "Failed to set rgid=2147483647: rgid=" << rgid;
    EXPECT_EQ(egid, MAX_INT) << "Failed to set egid=2147483647: egid=" << egid;
    EXPECT_EQ(sgid, MAX_INT) << "Failed to set sgid=2147483647: sgid=" << sgid;
    return 0;
}

static int TestSetRESGid()
{
    // Test the 'setresgid' interface
    int ret = 0;
    gid_t rgid = 0;
    gid_t egid = 0;
    gid_t sgid = 0;
    // Step 1: Verify that GID is set to 0
    ret = setresgid(GID0, GID0, GID0);
    if (ret != 0) {
        EXPECT_EQ(ret, 0);
        LOG("ErrInfo: Failed to set gid=0, now process gid=%d", getgid());
        return FALSE;
    }
    // To test the function of invoking the setgid interface to set the GID=0
    getresgid(&rgid, &egid, &sgid);
    EXPECT_EQ(rgid, GID0) << "Failed to set rgid=0: rgid=" << rgid;
    EXPECT_EQ(egid, GID0) << "Failed to set egid=0: egid=" << egid;
    EXPECT_EQ(sgid, GID0) << "Failed to set sgid=0: sgid=" << sgid;
    // Step 2: Verify that GID is set to 1000
    ret = setresgid(GID1000, GID1000, GID1000);
    if (ret != 0) {
        EXPECT_EQ(ret, 0);
        LOG("ErrInfo: Failed to set gid=1000, now process gid=%d", getgid());
        return FALSE;
    }
    // To test the function of invoking the setgid interface to set the GID=1000
    getresgid(&rgid, &egid, &sgid);
    EXPECT_EQ(rgid, GID1000) << "Failed to set rgid=1000: rgid=" << rgid;
    EXPECT_EQ(egid, GID1000) << "Failed to set egid=1000: egid=" << egid;
    EXPECT_EQ(sgid, GID1000) << "Failed to set sgid=1000: sgid=" << sgid;
    // Step 3: Verify that GID is set to 10000
    ret = setresgid(GID10000, GID10000, GID10000);
    if (ret != 0) {
        EXPECT_EQ(ret, 0);
        LOG("ErrInfo: Failed to set gid=10000, now process gid=%d", getgid());
        return FALSE;
    }
    // To test the function of invoking the setgid interface to set the GID=10000
    getresgid(&rgid, &egid, &sgid);
    EXPECT_EQ(rgid, GID10000) << "Failed to set rgid=10000: rgid=" << rgid;
    EXPECT_EQ(egid, GID10000) << "Failed to set egid=10000: egid=" << egid;
    EXPECT_EQ(sgid, GID10000) << "Failed to set sgid=10000: sgid=" << sgid;
    // Step 4: Verify that GID is set to 2147483647
    ret = setresgid(MAX_INT, MAX_INT, MAX_INT);
    if (ret != 0) {
        EXPECT_EQ(ret, 0);
        LOG("ErrInfo: Failed to set gid=2147483647, now process gid=%d", getgid());
        return FALSE;
    }
    // To test the function of invoking the setgid interface to set the GID=2147483647
    getresgid(&rgid, &egid, &sgid);
    EXPECT_EQ(rgid, MAX_INT) << "Failed to set rgid=2147483647: rgid=" << rgid;
    EXPECT_EQ(egid, MAX_INT) << "Failed to set egid=2147483647: egid=" << egid;
    EXPECT_EQ(sgid, MAX_INT) << "Failed to set sgid=2147483647: sgid=" << sgid;
    return 0;
}

static int TestSetGidAbnormal()
{
    // Enter the exception parameter when invoke the 'setgid','setregid','setresgid' interface
    int ret = 0;
    gid_t newrgid = 0;
    gid_t newegid = 0;
    gid_t newsgid = 0;
    gid_t rgid = 0;
    gid_t egid = 0;
    gid_t sgid = 0;
    // Obtain the rgid, egid, sgid of the current process
    getresgid(&rgid, &egid, &sgid);
    // Step 1: Verify that GID is set to -100 with the 'setgid' interface
    ret = setgid(ABNORMALINT);
    if (ret != FALSE) {
        EXPECT_EQ(ret, FALSE);
        LOG("ErrInfo: Set gid=-100, now process gid=%d", getgid());
        return FALSE;
    }
    // To test the function of invoking the 'setgid' interface to set the GID=-100
    getresgid(&newrgid, &newegid, &newsgid);
    EXPECT_EQ(newrgid, rgid) << "The value of rgid changes after an invalid parameter is entered: rgid=" << rgid;
    EXPECT_EQ(newegid, egid) << "The value of egid changes after an invalid parameter is entered: egid=" << egid;
    EXPECT_EQ(newsgid, sgid) << "The value of sgid changes after an invalid parameter is entered: sgid=" << sgid;
    // Step 2: Verify that GID is set to -100 with the 'setregid' interface
    ret = setregid(ABNORMALINT, ABNORMALINT);
    if (ret != FALSE) {
        EXPECT_EQ(ret, FALSE);
        LOG("ErrInfo: Set gid=-100, now process gid=%d", getgid());
        return FALSE;
    }
    // To test the function of invoking the 'setgid' interface to set the GID=-100
    getresgid(&newrgid, &newegid, &newsgid);
    EXPECT_EQ(newrgid, rgid) << "The value of rgid changes after an invalid parameter is entered: rgid=" << rgid;
    EXPECT_EQ(newegid, egid) << "The value of egid changes after an invalid parameter is entered: egid=" << egid;
    EXPECT_EQ(newsgid, sgid) << "The value of sgid changes after an invalid parameter is entered: sgid=" << sgid;
    // Step 3: Verify that GID is set to -100 with the 'setregid' interface
    ret = setresgid(ABNORMALINT, ABNORMALINT, ABNORMALINT);
    if (ret != FALSE) {
        EXPECT_EQ(ret, FALSE);
        LOG("ErrInfo: Set gid=-100, now process gid=%d", getgid());
        return FALSE;
    }
    // To test the function of invoking the 'setgid' interface to set the GID=-100
    getresgid(&newrgid, &newegid, &newsgid);
    EXPECT_EQ(newrgid, rgid) << "The value of rgid changes after an invalid parameter is entered: rgid=" << rgid;
    EXPECT_EQ(newegid, egid) << "The value of egid changes after an invalid parameter is entered: egid=" << egid;
    EXPECT_EQ(newsgid, sgid) << "The value of sgid changes after an invalid parameter is entered: sgid=" << sgid;
    return 0;
}

static int TestSetGroups()
{
    // Test the 'setgroups' interface
    int ret;
    gid_t list[SIZE255];
    for (size_t num = 0; num < SIZE253; num++) {
        list[num] = num;
    }
    list[SIZE254] = MAX_INT;
    ret = setgroups(SIZE255, list);
    if (ret != 0) {
        EXPECT_EQ(ret, 0);
        LOG("ErrInfo: Failed to set groups");
        return FALSE;
    }
    return 0;
}

static void TsetFork(uid_t uid, gid_t gid, size_t size, const gid_t list[])
{
    // The sub process inherits the UID, GID, and groups of the parent process
    int ret;
    int status = 0;
    gid_t reallist[SIZE255];
    // Preset action: Adjust the UID, GID, and groups of the parent process
    ret = setuid(uid);
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to set uid, now process uid=" << getuid();
    ret = setgid(gid);
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to set gid, now process gid=" << getgid();
    setgroups(0, nullptr);
    ret = setgroups(size, list);
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to set groups";
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Inheritance test of sub process UID
        uid_t retuid = getuid();
        if (retuid != uid) {
            LOG("ErrInfo: The sub process UID changes when fork process, now process uid=%d", getuid());
            exitCode = 1;
        }
        // Step 2: Inheritance test of sub process GID
        gid_t retgid = getgid();
        if (retgid != gid) {
            LOG("ErrInfo: The sub process GID changes when fork process, now process gid=%d", getgid());
            exitCode = 1;
        }
        // Step 3: Inheritance test of sub process groups
        int retgroups = getgroups(0, reallist);
        if (retgroups == FALSE) {
            LOG("ErrInfo: Failed to get groups");
            exitCode = 1;
        }
        // Step 4: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}

static int ChangeSensitiveInformation()
{
    int fd = 0;
    int ret = 0;
    int exitCode = 0;
    char dac[] = "DACPreTest!\n";
    // Failed to read sensitive information
    fd = open("/proc/process", O_WRONLY);
    if (fd >= 0) {
        ret = write(fd, dac, sizeof(dac));
        if (ret != FALSE) {
            LOG("ErrInfo: Change sensitive information, ret = %d", ret);
            exitCode = 1;
        }
        close(fd);
    }
    return exitCode;
}
#endif

#if defined(LITE_FS_JFFS2)
static void CreateTxt()
{
    int ret;
    int fd = 0;
    char dac[] = "DacTestSuite!\n";
    // Initialize the process and set the uid and gid of the process to zero
    SetUidGid(UID0, GID0);
    // Create a directory 'DACDIR0' in the directory 'TOP_DIR'
    ret = mkdir(TOP_DIR "/" DACDIR0, CHMOD700);
    ASSERT_EQ(ret, 0) << "ErrInfo: Failed to create the directory 'TOP_DIR/DACDIR0'";
    // Create a directory 'DACDIR0_DACDIR0' in the directory 'TOP_DIR/DACDIR0'
    ret = mkdir(TOP_DIR "/" DACDIR0 "/" DACDIR0_DACDIR0, RWX);
    ASSERT_EQ(ret, 0) << "ErrInfo: Failed to create the directory 'TOP_DIR/DACDIR0/DACDIR0_DACDIR0'";
    //  Create a file 'DACDIR0_DACFILE0' in the directory 'DacTest'
    fd = open(TOP_DIR "/" DACDIR0 "/" DACDIR0_DACFILE0, O_WRONLY | O_CREAT | O_TRUNC, CHMOD700);
    if (fd >= 0) {
        // File created successfully
        write(fd, dac, sizeof(dac));
        close(fd);
    } else {
        // Failed to create the file
        ASSERT_GE(fd, 0) << "ErrInfo: Failed to create the file 'TOP_DIR/DACDIR0/DACDIR0_DACFILE0'";
    }
}

static void CreateDevDir()
{
    int ret;
    // Initialize the process and set the uid and gid of the process to zero
    SetUidGid(UID0, GID0);
    // Create a directory 'DACDIR0' in the directory '/storage'
    ret = mkdir("/storage/" DACDIR0, CHMOD777);
    ASSERT_EQ(ret, 0) << "ErrInfo: Failed to create the directory '/storage/DACDIR0'";
    // Create a directory 'DACDIR0_DACDIR0' in the directory '/storage/DACDIR0'
    ret = mkdir("/storage/" DACDIR0 "/" DACDIR0_DACDIR0, CHMOD777);
    ASSERT_EQ(ret, 0) << "ErrInfo: Failed to create the directory '/storage/DACDIR0/DACDIR0_DACDIR0'";
}

static void CreateDevTxt()
{
    int ret;
    int fd = 0;
    // Initialize the process and set the uid and gid of the process to zero
    SetUidGid(UID0, GID0);
    // Create a directory 'DACDIR0' in the directory '/storage'
    ret = mkdir("/storage/" DACDIR0, CHMOD777);
    ASSERT_EQ(ret, 0) << "ErrInfo: Failed to create the directory '/storage/DACDIR0'";
}

static void CreateDir()
{
    int ret;
    // Initialize the process and set the uid and gid of the process to zero
    SetUidGid(UID0, GID0);
    // Create a directory 'DACDIR0' in the directory 'TOP_DIR'
    ret = mkdir(TOP_DIR "/" DACDIR0, CHMOD777);
    ASSERT_EQ(ret, 0) << "ErrInfo: Failed to create the directory 'TOP_DIR/DACDIR0'";
    // Create a directory 'DACDIR0_DACDIR0' in the directory 'TOP_DIR/DACDIR0'
    ret = mkdir(TOP_DIR "/" DACDIR0 "/" DACDIR0_DACDIR0, CHMOD777);
    ASSERT_EQ(ret, 0) << "ErrInfo: Failed to create the directory 'TOP_DIR/DACDIR0/DACDIR0_DACDIR0'";
}

static void CreateTxt1()
{
    int ret;
    int fd = 0;
    char dac[] = "DacTestSuite!\n";
    // Initialize the process and set the uid and gid of the process to zero
    SetUidGid(UID0, GID0);
    // Create a directory 'DACDIR1' in the directory 'TOP_DIR'
    ret = mkdir(TOP_DIR "/" DACDIR1, CHMOD700);
    ASSERT_EQ(ret, 0) << "ErrInfo: Failed to create the directory 'TOP_DIR/DACDIR1'";
    // Create a directory 'DACDIR1_DACDIR0' in the directory 'TOP_DIR/DACDIR1'
    ret = mkdir(TOP_DIR "/" DACDIR1 "/" DACDIR1_DACDIR0, RWX);
    ASSERT_EQ(ret, 0) << "ErrInfo: Failed to create the directory 'TOP_DIR/DACDIR1/DACDIR1_DACDIR0'";
    //  Create a file 'DACDIR1_DACFILE0' in the directory 'DACDIR1'
    fd = open(TOP_DIR "/" DACDIR1 "/" DACDIR1_DACFILE0, O_WRONLY | O_CREAT | O_TRUNC, CHMOD700);
    if (fd >= 0) {
        // File created successfully
        write(fd, dac, sizeof(dac));
        close(fd);
    } else {
        // Failed to create the file
        ASSERT_GE(fd, 0) << "ErrInfo: Failed to create the file 'TOP_DIR/DACDIR1/DACDIR1_DACFILE0'";
    }
    // Change the file 'DACDIR1_DACFILE0' owner with interface 'chown'
    ret = chown(TOP_DIR "/" DACDIR1 "/" DACDIR1_DACFILE0, UID1, GID1);
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to change the file 'DACDIR1_DACFILE0' owner with interface 'chown'";
    // Change the directory 'TOP_DIR/DACDIR1' owner with interface 'chown'
    ret = chown(TOP_DIR "/" DACDIR1, UID1, GID1);
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to change the directory 'TOP_DIR/DACDIR1' owner with interface 'chown'";
}

static int ThreeProcessReadOneTxt()
{
    int fd = 0;
    int status = 0;
    // Preset action: Create a txt
    CreateTxt();
    // Preset action: Fork three sub processes
    pid_t pid;
    for (int num = 0; num < NUM3; num++) {
        pid = fork();
        if (pid < 0) {
            LOG("======== Fork Error! =========");
            return -1;
        }
        usleep(SLEEP_NUM);
        if (pid == 0) {
            break;
        }
    }
    // get one parent & three children
    if (pid == 0) {
        int exitCode = 0;
        // Initialize the process and set the uid and gid of the process to zero
        SetUidGid(UID0, GID0);
        // Drop the capabilities of CAP_DAC_OVERRIDE and CAP_DAC_READ_SEARCH
        DropCAPDACOVERRIDEAndREADSEARCH();
        // Three sub processes read a file at the same time
        for (int number = 0; number < NUM1000; number++) {
            fd = open(TOP_DIR "/" DACDIR0 "/" DACDIR0_DACFILE0, O_WRONLY);
            if (fd >= 0) {
                close(fd);
            } else {
                LOG("ErrInfo: failed to open the file during the %d time", number);
                exitCode = 1;
                break;
            }
        }
        // Three sub processes exit with the exitCode
        exit(exitCode);
    } else {
        // The parent process wait for three sub processes to exit and obtain the exitCode
        for (int num2 = 0; num2 < NUM3; num2++) {
            wait(&status);
            EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
            EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: Pid = "<< pid
            << ", its exitCode is wrong and test case failed, please query logs";
        }
        // Delete the directory 'TOP_DIR/DACDIR0'
        RemoveDir(TOP_DIR "/" DACDIR0);
    }
    return 0;
}

static int TwoProcessReadTwoTxt()
{
    int status = 0;
    // Preset action: Create a file whose owner is uid0, gid0
    CreateTxt();
    // Preset action: Create a file whose owner is uid1, gid1
    CreateTxt1();
    // Preset action: Fork two sub processes
    pid_t pid[NUM2];
    for (int num = 0; num < NUM2; num++) {
        pid[num] = fork();
        EXPECT_TRUE(pid[num] >= 0) << "======== Fork Error! =========";
        usleep(SLEEP_NUM);
        if (pid[num] == 0) {
            // Set UID and GID of process pid[0] to 0 and set UID and GID of process pid[1] to 1
            SetUidGid(num, num);
            // Drop both process capabilities of CAP_DAC_OVERRIDE and CAP_DAC_READ_SEARCH
            DropCAPDACOVERRIDEAndREADSEARCH();
            break;
        }
    }
    // get one parent & two children
    if (pid[0] == 0 || pid[1] == 0) {
        int exitCode = 0;
        for (int number = 0; number < NUM1000; number++) {
            // Two processes with different UIDs and GIDs read two files with different owners at the same time
            if (pid[0] == 0) {
                // The process pid[0] can open the file Dac.txt whose owners are uid0 and gid0
                int fd0dac = open(TOP_DIR "/" DACDIR0 "/" DACDIR0_DACFILE0, O_WRONLY);
                if (fd0dac >= 0) {
                    close(fd0dac);
                } else {
                    LOG("ErrInfo: PID[0] failed to open the file during the %d time", number);
                    exitCode = 1;
                    break;
                }
                // The process pid[0] can not open the file Dac.txt whose owners are uid1 and gid1
                int fd0dac1 = open(TOP_DIR "/" DACDIR1 "/" DACDIR1_DACFILE0, O_WRONLY);
                if (fd0dac1 >= 0) {
                    LOG("ErrInfo: PID[0] open the file with wrong uid&gid during the %d time", number);
                    close(fd0dac1);
                    exitCode = 1;
                    break;
                }
            } else {
                // The process pid[1] can not open the file Dac.txt whose owners are uid0 and gid0
                int fd1dac = open(TOP_DIR "/" DACDIR0 "/" DACDIR0_DACFILE0, O_WRONLY);
                if (fd1dac >= 0) {
                    LOG("ErrInfo: PID[1] open the file with wrong uid&gid during the %d time", number);
                    close(fd1dac);
                    exitCode = 1;
                    break;
                }
                // The process pid[1] can open the file Dac.txt whose owners are uid1 and gid1
                int fd1dac1 = open(TOP_DIR "/" DACDIR1 "/" DACDIR1_DACFILE0, O_WRONLY);
                if (fd1dac1 >= 0) {
                    close(fd1dac1);
                } else {
                    LOG("ErrInfo: PID[1] failed to open the file during the %d time", number);
                    exitCode = 1;
                    break;
                }
            }
        }
        // Two sub processes exit with the exitCode
        exit(exitCode);
    } else {
        // The parent process wait for the sub process pid[0] to exit and obtain the exitCode
        waitpid(pid[0], &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid[0];
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = "
        << pid[0];
        // The parent process wait for the sub process pid[1] to exit and obtain the exitCode
        waitpid(pid[1], &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid[1];
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = "
        << pid[1];
    }
    return 0;
}
#endif

#if defined(LITE_FS_JFFS2) || defined(LITE_FS_VFAT)
/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_0010
 * @tc.name       : Invoke the interface to set the process UID
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest0010, Function | MediumTest | Level1)
{
    int ret = 0;
    uid_t ruid = 0;
    uid_t euid = 0;
    uid_t suid = 0;
    uid_t newruid = 0;
    uid_t neweuid = 0;
    uid_t newsuid = 0;
    // Preset action: Obtain the ruid, euid, suid of the current process
    getresuid(&ruid, &euid, &suid);
    // Step 1: Test the 'setuid' interface
    ret = TestSetUid();
    EXPECT_EQ(ret, 0) << "ErrInfo: TestSetUid() exit error";
    // Step 2: Test the 'setreuid' interface
    ret = TestSetREUid();
    EXPECT_EQ(ret, 0) << "ErrInfo: TestSetREUid() exit error";
    // Step 3: Test the 'setreuid' interface
    ret = TestSetRESUid();
    EXPECT_EQ(ret, 0) << "ErrInfo: TestSetRESUid() exit error";
    // Step 4: Enter the exception parameter when invoke the 'setuid','setreuid','setresuid' interface
    ret = TestSetUidAbnormal();
    EXPECT_EQ(ret, 0) << "ErrInfo: TestSetUidAbnormal() exit error";
    // Cleanup action: Restore the initial UID of the process
    ret = setresuid(ruid, euid, suid);
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to restore the initial UID of the process";
    getresuid(&newruid, &neweuid, &newsuid);
    EXPECT_EQ(newruid, ruid) << "The value of ruid changes after testcase: ruid=" << ruid;
    EXPECT_EQ(neweuid, euid) << "The value of euid changes after testcase: euid=" << euid;
    EXPECT_EQ(newsuid, suid) << "The value of suid changes after testcase: suid=" << suid;
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_0020
 * @tc.name       : Invoke the interface to set the process GID
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest0020, Function | MediumTest | Level1)
{
    int ret = 0;
    gid_t rgid = 0;
    gid_t egid = 0;
    gid_t sgid = 0;
    gid_t newrgid = 0;
    gid_t newegid = 0;
    gid_t newsgid = 0;
    // Preset action: Obtain the rgid, egid, sgid of the current process
    getresgid(&rgid, &egid, &sgid);
    // Step 1: Test the 'setgid' interface
    ret = TestSetGid();
    EXPECT_EQ(ret, 0) << "ErrInfo: TestSetGid() exit error";
    // Step 2: Test the 'setregid' interface
    ret = TestSetREGid();
    EXPECT_EQ(ret, 0) << "ErrInfo: TestSetREGid() exit error";
    // Step 3: Test the 'setregid' interface
    ret = TestSetRESGid();
    EXPECT_EQ(ret, 0) << "ErrInfo: TestSetRESGid() exit error";
    // Step 4: Enter the exception parameter when invoke the 'setgid','setregid','setresgid' interface
    ret = TestSetGidAbnormal();
    EXPECT_EQ(ret, 0) << "ErrInfo: TestSetGidAbnormal() exit error";
    // Cleanup action: Restore the initial GID of the process
    ret = setresgid(rgid, egid, sgid);
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to restore the initial GID of the process";
    getresgid(&newrgid, &newegid, &newsgid);
    EXPECT_EQ(newrgid, rgid) << "The value of rgid changes after testcase: rgid=" << rgid;
    EXPECT_EQ(newegid, egid) << "The value of egid changes after testcase: egid=" << egid;
    EXPECT_EQ(newsgid, sgid) << "The value of sgid changes after testcase: sgid=" << sgid;
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_0030
 * @tc.name       : Invoke the setgroups interface to set the process groups that contain a single GID or an empty value
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest0030, Function | MediumTest | Level1)
{
    int ret;
    gid_t grouplist[SIZE255];
    // Preset action: Obtain the groups of the current process
    unsigned int groupsize = getgroups(0, grouplist);
    if (groupsize >= 0) {
        getgroups(groupsize, grouplist);
        // Preset action: Obtain the group lists required for the testcase
        gid_t list1[SIZE1] = {1};
        gid_t list2[SIZE1] = {MAX_INT};
        gid_t list3[SIZE1] = {};
        // Step 1: Set the group list to {1}
        ret = setgroups(SIZE1, list1);
        EXPECT_EQ(ret, 0) << "ErrInfo: Failed to set the group list to {1}";
        // Step 2: Set the group list to {2147483647}
        ret = setgroups(SIZE1, list2);
        EXPECT_EQ(ret, 0) << "ErrInfo: Failed to set the group list to {2147483647}";
        // Step 3: Set the group list to {}
        ret = setgroups(SIZE1, list3);
        EXPECT_EQ(ret, 0) << "ErrInfo: Failed to set the group list to {}";
        // Cleanup action: Restore the initial groups of the process
        setgroups(0, nullptr);
        ret = setgroups(groupsize, grouplist);
        EXPECT_EQ(ret, 0) << "ErrInfo: Failed to restore the initial groups of the process";
    } else {
        EXPECT_GE(groupsize, 0) << "ErrInfo: Failed to get groups";
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_0040
 * @tc.name       : Invoke the setgroups interface to set the process groups that contain the same GID
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest0040, Function | MediumTest | Level2)
{
    int ret;
    gid_t grouplist[SIZE255];
    // Preset action: Obtain the groups of the current process
    unsigned int groupsize = getgroups(0, grouplist);
    if (groupsize >= 0) {
        getgroups(groupsize, grouplist);
        // Preset action: Obtain the group lists required for the testcase
        gid_t list1[SIZE2]={GID0, GID0};
        gid_t list2[SIZE2]={GID1, GID1};
        gid_t list3[SIZE2]={MAX_INT, MAX_INT};
        // Step 1: Set the group list to {0, 0}
        ret = setgroups(SIZE2, list1);
        EXPECT_EQ(ret, 0) << "ErrInfo: Failed to set the group list to {0, 0}";
        // Step 2: Set the group list to {1, 1}
        ret = setgroups(SIZE2, list2);
        EXPECT_EQ(ret, 0) << "ErrInfo: Failed to set the group list to {1, 1}";
        // Step 3: Set the group list to {2147483647, 2147483647}
        ret = setgroups(SIZE2, list3);
        EXPECT_EQ(ret, 0) << "ErrInfo: Failed to set the group list to {2147483647, 2147483647}";
        // Cleanup action: Restore the initial groups of the process
        setgroups(0, nullptr);
        ret = setgroups(groupsize, grouplist);
        EXPECT_EQ(ret, 0) << "ErrInfo: Failed to restore the initial groups of the process";
    } else {
        EXPECT_GE(groupsize, 0) << "ErrInfo: Failed to get groups";
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_0050
 * @tc.name       : Invoke the setgroups interface to set the process groups that contain the duplicate GIDs
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest0050, Function | MediumTest | Level3)
{
    int ret;
    gid_t grouplist[SIZE255];
    // Preset action: Obtain the groups of the current process
    unsigned int groupsize = getgroups(0, grouplist);
    if (groupsize >= 0) {
        getgroups(groupsize, grouplist);
        // Preset action: Obtain the group lists required for the testcase
        gid_t list1[SIZE3]={GID0, GID0, MAX_INT};
        gid_t list2[SIZE3]={GID10000, GID10000, MAX_INT};
        gid_t list3[SIZE3]={GID0, MAX_INT, MAX_INT};
        // Step 1: Set the group list to {0, 0, 2147483647}
        ret = setgroups(SIZE3, list1);
        EXPECT_EQ(ret, 0) << "ErrInfo: Failed to set the group list to {0, 0, 2147483647}";
        // Step 2: Set the group list to {10000, 10000, 2147483647}
        ret = setgroups(SIZE3, list2);
        EXPECT_EQ(ret, 0) << "ErrInfo: Failed to set the group list to {10000, 10000, 2147483647}";
        // Step 3: Set the group list to {0, 2147483647, 2147483647}
        ret = setgroups(SIZE3, list3);
        EXPECT_EQ(ret, 0) << "ErrInfo: Failed to set the group list to {0, 2147483647, 2147483647}";
        // Cleanup action: Restore the initial groups of the process
        setgroups(0, nullptr);
        ret = setgroups(groupsize, grouplist);
        EXPECT_EQ(ret, 0) << "ErrInfo: Failed to restore the initial groups of the process";
    } else {
        EXPECT_GE(groupsize, 0) << "ErrInfo: Failed to get groups";
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_0060
 * @tc.name       : Invoke the setgroups interface to set the process groups that contain all different GIDs
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest0060, Function | MediumTest | Level3)
{
    int ret;
    gid_t grouplist[SIZE255];
    // Preset action: Obtain the groups of the current process
    size_t groupsize = getgroups(0, grouplist);
    if (groupsize >= 0) {
        getgroups(groupsize, grouplist);
        // Preset action: Obtain the group lists required for the testcase
        gid_t list0[SIZE255];
        for (size_t num0 = 0; num0 < SIZE254; num0++) {
            list0[num0] = num0;
        }
        list0[SIZE254] = MAX_INT;
        gid_t list1[INVAILD_SIZE];
        for (size_t num1 = 0; num1 < MAX_SIZE; num1++) {
            list1[num1] = num1;
        }
        list1[MAX_SIZE] = MAX_INT;
        // Step 1: Set 255 different group lists
        ret = setgroups(SIZE255, list0);
        EXPECT_EQ(ret, 0) << "ErrInfo: Failed to set the group list to {0, 1, 2, ..., 255}";
        // Step 2: Set the number of groups that exceed the upper limit
        ret = setgroups(INVAILD_SIZE, list1);
        EXPECT_EQ(ret, FALSE) << "ErrInfo: Set groups size over max, size=65537";
        // Cleanup action: Restore the initial groups of the process
        setgroups(0, nullptr);
        ret = setgroups(groupsize, grouplist);
        EXPECT_EQ(ret, 0) << "ErrInfo: Failed to restore the initial groups of the process";
    } else {
        EXPECT_GE(groupsize, 0) << "ErrInfo: Failed to get groups";
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_0070
 * @tc.name       : Invoke the setuid, gid, and groups interfaces to set the uid, gid,
                    and groups of processes concurrently
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest0070, Security | MediumTest | Level2)
{
    int ret;
    int status = 0;
    // Preset action: Fork three sub processes
    pid_t pid;
    for (int num = 0; num < NUM3; num++) {
        pid = fork();
        ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
        usleep(SLEEP_NUM);
        if (pid == 0) {
            break;
        }
    }
    // get one parent & three children
    if (pid == 0) {
        int exitCode = 0;
        for (int number = 0; number < NUM3000; number++) {
            // Preset action: Initialize the subprocess UID, GID and groups
            setuid(0);
            setgid(0);
            setgroups(0, nullptr);
            // Step 1: Test the 'setuid' interface concurrently
            ret = TestSetUid();
            if (ret != 0) {
                LOG("ErrInfo: TestSetUid error during the %d time", number);
                exitCode = 1;
                break;
            }
            // Step 2: Test the 'setgid' interface concurrently
            ret = TestSetGid();
            if (ret != 0) {
                LOG("ErrInfo: TestSetGid error during the %d time", number);
                exitCode = 1;
                break;
            }
            // Step 2: Test the 'setgroups' interface concurrently
            ret = TestSetGroups();
            if (ret != 0) {
                LOG("ErrInfo: TestSetGroups error during the %d time", number);
                exitCode = 1;
                break;
            }
        }
        // Step 3: Three sub processes exit with the exitCode
        exit(exitCode);
    } else {
        // Step 4: The parent process wait for three sub processes to exit and obtain the exitCode
        for (int num2 = 0; num2 < NUM3; num2++) {
            wait(&status);
            EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
            EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: Pid = "<< pid
            << ", its exitCode is wrong and test case failed, please query logs";
        }
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_0080
 * @tc.name       : Inheritance of process UID, GID and groups
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest0080, Function | MediumTest | Level2)
{
    int ret;
    uid_t ruid = 0; uid_t euid = 0; uid_t suid = 0;
    uid_t newruid = 0; uid_t neweuid = 0; uid_t newsuid = 0;
    gid_t rgid = 0; gid_t egid = 0; gid_t sgid = 0;
    gid_t newrgid = 0; gid_t newegid = 0; gid_t newsgid = 0;
    gid_t grouplist[SIZE255];
    // Preset action: Obtain the ruid, euid, suid of the current process
    getresuid(&ruid, &euid, &suid);
    // Preset action: Obtain the rgid, egid, sgid of the current process
    getresgid(&rgid, &egid, &sgid);
    // Preset action: Obtain the groups of the current process
    int groupsize = getgroups(0, grouplist);
    if (groupsize >= 0) {
        getgroups(groupsize, grouplist);
        // Preset action: Obtain the group lists required for the testcase
        gid_t list1[SIZE1] = {GID10000};
        gid_t list2[SIZE1] = {};
        gid_t list3[SIZE255];
        for (size_t num = 0; num < SIZE254; num++) {
            list3[num] = num;
        }
        list3[SIZE254] = MAX_INT;
        // Step 1: Factor combination test of UID, GID, and groups
        TsetFork(UID0, GID10000, SIZE1, list1);
        TsetFork(UID10000, GID10000, SIZE1, list1);
        TsetFork(MAX_INT, GID10000, SIZE1, list1);
        TsetFork(UID10000, GID0, SIZE1, list1);
        TsetFork(UID10000, MAX_INT, SIZE1, list1);
        TsetFork(UID10000, GID10000, SIZE1, list2);
        TsetFork(UID10000, GID10000, SIZE255, list3);
        // Cleanup action: Restore the initial UID of the process
        ret = setresuid(ruid, euid, suid);
        EXPECT_EQ(ret, 0) << "ErrInfo: Failed to restore the initial UID of the process";
        getresuid(&newruid, &neweuid, &newsuid);
        EXPECT_EQ(newruid, ruid) << "The value of ruid changes after testcase: ruid=" << ruid;
        EXPECT_EQ(neweuid, euid) << "The value of euid changes after testcase: euid=" << euid;
        EXPECT_EQ(newsuid, suid) << "The value of suid changes after testcase: suid=" << suid;
        // Cleanup action: Restore the initial GID of the process
        ret = setresgid(rgid, egid, sgid);
        EXPECT_EQ(ret, 0) << "ErrInfo: Failed to restore the initial GID of the process";
        getresgid(&newrgid, &newegid, &newsgid);
        EXPECT_EQ(newrgid, rgid) << "The value of rgid changes after testcase: rgid=" << rgid;
        EXPECT_EQ(newegid, egid) << "The value of egid changes after testcase: egid=" << egid;
        EXPECT_EQ(newsgid, sgid) << "The value of sgid changes after testcase: sgid=" << sgid;
        // Cleanup action: Restore the initial groups of the process
        setgroups(0, nullptr);
        ret = setgroups(groupsize, grouplist);
        EXPECT_EQ(ret, 0) << "ErrInfo: Failed to restore the initial groups of the process";
    } else {
        EXPECT_GE(groupsize, 0) << "ErrInfo: Failed to get groups";
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_0120
 * @tc.name       : Failed to use the third-party app UID to change sensitive information
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest0120, Security | MediumTest | Level2)
{
    int ret;
    int status = 0;
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Set the process uid and gid to the third-party application uid and gid
        ret = SetUidGid(UID20000, GID20000);
        if (ret != 0) {
            LOG("ErrInfo: Failed to set the process uid and gid");
            exitCode = 1;
        }
        // Step 2: Drop all the sub process capabilities
        ret = DropAllCAP();
        if (ret != 0) {
            LOG("ErrInfo: Failed to drop all the sub process capabilities");
            exitCode = 1;
        }
        // Step 3: Failed to change sensitive information
        ret = ChangeSensitiveInformation();
        if (ret != 0) {
            LOG("ErrInfo: change sensitive information");
            exitCode = 1;
        }
        // Step 4: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_0130
 * @tc.name       : Performance test of the setuid, setgid and setgroups interface
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest0130, Performance | MediumTest | Level2)
{
    struct timespec tp = { 0 };
    struct timespec starttime = { 0 };
    struct timespec endtime = { 0 };
    tp.tv_sec = 0;
    tp.tv_nsec = 0;
    // Preset action: Obtain the group lists required for the testcase
    gid_t list[SIZE255];
    for (size_t num = 0; num < SIZE253; num++) {
        list[num] = num;
    }
    // Preset action: Obtains the system time -> starttime
    clock_gettime(CLOCK_REALTIME, &starttime);
    for (int number = 0; number < NUM10000; number++) {
        list[SIZE254] = number;
        // Step 1.1: Setuid for 10000 times
        setuid(number);
        // Step 1.2: Setgid for 10000 times
        setgid(number);
        // Step 1.3: Setgroups for 10000 times
        setgroups(SIZE255, list);
    }
    // Step 2: Obtains the system time again -> endtime
    clock_gettime(CLOCK_REALTIME, &endtime);
    // Step 3: Compare the starttime and the endtime -> tp
    tp = CompareTime(starttime, endtime);
    EXPECT_LE(tp.tv_sec, NUM20) << "ErrInfo: Chown for 10000 times used " << tp.tv_sec << "." << tp.tv_nsec << "s";
    // Cleanup action: Restore the uid, gid and groups of the process to zero
    SetUidGid(UID0, GID0);
    setgroups(0, nullptr);
}
#endif

#if defined(LITE_FS_JFFS2)
/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_0140
 * @tc.name       : Invoke the chmod interface to set the file permission
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest0140, Function | MediumTest | Level2)
{
    int ret;
    int status = 0;
    // Preset action: Create a txt
    CreateTxt();
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Preset action: Drop the capabilities of CAP_FOWNER
        DropCAPFOWNER();
        // Step 1: Set the uid and gid of the process to 0
        SetUidGid(UID0, GID0);
        // Step 2.1: Change the file permission 700 with interface 'chmod'
        ret = chmod(TOP_DIR "/" DACDIR0 "/" DACDIR0_DACFILE0, CHMOD700);
        if (ret != 0) {
            LOG("ErrInfo: Failed in chmod 700");
            exitCode = 1;
        }
        // Step 2.2: Change the file permission 111 with interface 'chmod'
        ret = chmod(TOP_DIR "/" DACDIR0 "/" DACDIR0_DACFILE0, CHMOD111);
        if (ret != 0) {
            LOG("ErrInfo: Failed in chmod 111");
            exitCode = 1;
        }
        // Step 2.3: Change the file permission -1 with interface 'chmod'
        ret = chmod(TOP_DIR "/" DACDIR0 "/" DACDIR0_DACFILE0, FALSE);
        if (ret != 0) {
            LOG("ErrInfo: Failed in chmod FALSE");
            exitCode = 1;
        }
        // Step 2.4: Change the file permission -777 with interface 'chmod'
        ret = chmod(TOP_DIR "/" DACDIR0 "/" DACDIR0_DACFILE0, -777);
        if (ret != 0) {
            LOG("ErrInfo: Failed in chmod -777");
            exitCode = 1;
        }
        // Step 3: Set the uid and gid of the process to 10000
        SetUidGid(UID10000, GID10000);
        // Step 4: Failed to change the file permission for the process that is not the file owner
        ret = chmod(TOP_DIR "/" DACDIR0 "/" DACDIR0_DACFILE0, CHMOD777);
        EXPECT_EQ(ret, FALSE) << "ErrInfo: Chmod 777 with wrong uid";
        // Step 5: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_0150
 * @tc.name       : Invoke chown interface to set the file owner
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest0150, Function | MediumTest | Level2)
{
    int ret;
    int status = 0;
    // Preset action: Create a txt
    CreateTxt();
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Set the uid and gid of the process to 0
        SetUidGid(UID0, GID0);
        // Step 2.1: Set the directory 'TOP_DIR/DACDIR0' owner UID10000 and GID10000
        ret = chown(TOP_DIR "/" DACDIR0, UID10000, GID10000);
        if (ret != 0) {
            LOG("ErrInfo: Failed to set the directory 'TOP_DIR/DACDIR0' owner UID10000 and GID10000");
            exitCode = 1;
        }
        // Step 2.2: Set the file 'TOP_DIR/DACDIR0/DACDIR0_DACFILE0' owner UID10000 and GID10000
        ret = chown(TOP_DIR "/" DACDIR0 "/" DACDIR0_DACFILE0, UID10000, GID10000);
        if (ret != 0) {
            LOG("ErrInfo: Failed to set the file 'TOP_DIR/DACDIR0/DACDIR0_DACFILE0' owner UID10000 and GID10000");
            exitCode = 1;
        }
        // Step 2.3: Set the directory 'TOP_DIR/DACDIR0' owner UID2147483647 and GID2147483647
        ret = chown(TOP_DIR "/" DACDIR0, MAX_INT, MAX_INT);
        if (ret != 0) {
            LOG("ErrInfo: Failed to set the directory 'TOP_DIR/DACDIR0' owner UID2147483647 and GID2147483647");
            exitCode = 1;
        }
        // Step 2.4: Set the file 'TOP_DIR/DACDIR0/DACDIR0_DACFILE0' owner UID2147483647 and GID2147483647
        ret = chown(TOP_DIR "/" DACDIR0 "/" DACDIR0_DACFILE0, MAX_INT, MAX_INT);
        if (ret != 0) {
            LOG("ErrInfo: Failed to set the file owner UID2147483647 and GID2147483647");
            exitCode = 1;
        }
        // Step 2.5: Set the directory 'TOP_DIR/DACDIR0' owner UID0 and GID0
        ret = chown(TOP_DIR "/" DACDIR0, UID0, GID0);
        if (ret != 0) {
            LOG("ErrInfo: Failed to set the directory 'TOP_DIR/DACDIR0' owner UID0 and GID0");
            exitCode = 1;
        }
        // Step 2.4: Set the file 'TOP_DIR/DACDIR0/DACDIR0_DACFILE0' owner UID0 and GID0
        ret = chown(TOP_DIR "/" DACDIR0 "/" DACDIR0_DACFILE0, UID0, GID0);
        if (ret != 0) {
            LOG("ErrInfo: Failed to set the file 'TOP_DIR/DACDIR0/DACDIR0_DACFILE0' owner UID0 and GID0");
            exitCode = 1;
        }
        // Step 3: Drop the capabilities of CAP_CHOWN
        DropCAPCHOWN();
        // Step 4.1: Failed to set the directory 'TOP_DIR/DACDIR0' owner without CAP_CHOWN");
        ret = chown(TOP_DIR "/" DACDIR0, UID10000, GID10000);
        if (ret != FALSE) {
            LOG("ErrInfo: Set the directory 'TOP_DIR/DACDIR0' owner without CAP_CHOWN");
            exitCode = 1;
        }
        // Step 4.2: Failed to set the file 'TOP_DIR/DACDIR0/DACDIR0_DACFILE0' owner without CAP_CHOWN");
        ret = chown(TOP_DIR "/" DACDIR0 "/" DACDIR0_DACFILE0, UID10000, GID10000);
        if (ret != FALSE) {
            LOG("ErrInfo: Set the file 'TOP_DIR/DACDIR0/DACDIR0_DACFILE0' owner without CAP_CHOWN");
            exitCode = 1;
        }
        // Step 4.3: Set the uid and gid of the process to 555
        SetUidGid(UID555, GID555);
        // Step 4.4: Failed to set the directory 'TOP_DIR/DACDIR0' owner without CAP_CHOWN");
        ret = chown(TOP_DIR "/" DACDIR0, UID10000, GID10000);
        if (ret != FALSE) {
            LOG("ErrInfo: Set the directory 'TOP_DIR/DACDIR0' owner without CAP_CHOWN");
            exitCode = 1;
        }
        // Step 4.5: Failed to set the file 'TOP_DIR/DACDIR0/DACDIR0_DACFILE0' owner without CAP_CHOWN");
        ret = chown(TOP_DIR "/" DACDIR0 "/" DACDIR0_DACFILE0, UID10000, GID10000);
        if (ret != FALSE) {
            LOG("ErrInfo: Set the file 'TOP_DIR/DACDIR0/DACDIR0_DACFILE0' owner without CAP_CHOWN");
            exitCode = 1;
        }
        // Step 5: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        // Step 6: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_0160
 * @tc.name       : Concurrent file reading by multiple processes
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest0160, Function | MediumTest | Level2)
{
    int ret;
    // Step 1: Multiple processes read the same file
    ret = ThreeProcessReadOneTxt();
    EXPECT_EQ(ret, 0) << "ErrInfo: ThreeProcessReadOneTxt() exit error";
    // Step 2: Multiple processes read the different files with different owners
    ret = TwoProcessReadTwoTxt();
    EXPECT_EQ(ret, 0) << "ErrInfo: TwoProcessReadTwoTxt() exit error";
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_0170
 * @tc.name       : The owner or permission of a file fail to be modified when the file is operated by another process
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest0170, Function | MediumTest | Level2)
{
    int fd = 0;
    int status = 0;
    int exitCode0 = 0;
    int exitCode1 = 0;
    // Preset action: Create a file whose owner is uid0, gid0
    CreateTxt();
    // Preset action: Fork two sub processes
    pid_t pid[NUM2];
    for (int num = 0; num < NUM2; num++) {
        pid[num] = fork();
        ASSERT_TRUE(pid[num] >= 0) << "======== Fork Error! =========";
        usleep(SLEEP_NUM);
        if (pid[num] == 0) {
            // Drop both process capabilities of CAP_DAC_OVERRIDE and CAP_DAC_READ_SEARCH
            DropCAPDACOVERRIDEAndREADSEARCH();
            break;
        }
    }
    // Step 1: Open a file by Process pid[0]
    if (pid[0] == 0) {
        fd = open(TOP_DIR "/" DACDIR0 "/" DACDIR0_DACFILE0, O_WRONLY);
    }
    if (pid[1] == 0) {
        // Step 2: Change the file owner with interface 'chown' by Process pid[1]
        int retchown = chown(TOP_DIR "/" DACDIR0 "/" DACDIR0_DACFILE0, UID10000, GID10000);
        if (retchown != 0) {
            LOG("ErrInfo: Failed to change the file owner when the file is operated by another process");
            exitCode1 = 1;
        }
        // Step 3: Change the file permission 000 with interface 'chmod' by Process pid[1]
        int retchmod = chmod(TOP_DIR "/" DACDIR0 "/" DACDIR0_DACFILE0, CHMOD000);
        if (retchmod != 0) {
            LOG("ErrInfo: Failed to change the file permission when the file is operated by another process");
            exitCode1 = 1;
        }
        // Step 4: The sub process pid[1] exit with the exitCode1
        exit(exitCode1);
    }
    // Step 5: Close the file by Process pid[0]
    if (pid[0] == 0) {
        if (fd >= 0) {
            close(fd);
        } else {
            LOG("ErrInfo: PID[0] failed to open the file");
            exitCode0 = 1;
        }
        // Step 6: The sub process pid[0] exit with the exitCode0
        exit(exitCode0);
    }
    if ((pid[0] != 0) && (pid[1] != 0)) {
        // Step 7: The parent process wait for the sub process pid[0] and pid[1] to exit and obtain the exitCode
        for (int num2 = 0; num2 < NUM2; num2++) {
            waitpid(pid[num2], &status, 0);
            EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid[num2];
            EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = "
            << pid[num2];
        }
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_0180
 * @tc.name       : Change the file permission for 10000 times
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest0180, Reliability | MediumTest | Level2)
{
    int ret;
    // Preset action: Create a txt
    CreateTxt();
    // Step 1: Change the file permission for 10000 times
    for (int number = 0; number < NUM10000; number++) {
        // Step 1: Change the file permission
        if (number & 1) {
            ret = chmod(TOP_DIR "/" DACDIR0 "/" DACDIR0_DACFILE0, CHMOD700);
            if (ret != 0) {
                EXPECT_EQ(ret, 0) << "ErrInfo: Failed to change the file permission during the " << number << " time";
                break;
            }
        } else {
            ret = chmod(TOP_DIR "/" DACDIR0 "/" DACDIR0_DACFILE0, CHMOD777);
            if (ret != 0) {
                EXPECT_EQ(ret, 0) << "ErrInfo: Failed to change the file permission during the " << number << " time";
                break;
            }
        }
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_0190
 * @tc.name       : Change the file owner for 10000 times
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest0190, Reliability | MediumTest | Level2)
{
    int ret;
    // Preset action: Create a txt
    CreateTxt();
    // Step 1: Change the file owner for 10000 times
    for (int number = 0; number < NUM10000; number++) {
        ret = chown(TOP_DIR "/" DACDIR0 "/" DACDIR0_DACFILE0, number, number);
        if (ret != 0) {
            EXPECT_EQ(ret, 0) << "ErrInfo: Failed to Change the file owner during the " << number << " time";
            break;
        }
    }
    // Cleanup action: Restore the initial status of the file
    ret = chown(TOP_DIR "/" DACDIR0 "/" DACDIR0_DACFILE0, UID0, GID0);
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to Change the file owner";
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_0200
 * @tc.name       : Five processes concurrently invoke chmod and chown interface for 5000 times
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest0200, Reliability | MediumTest | Level2)
{
    int ret;
    int status = 0;
    // Preset action: Create a txt
    CreateTxt();
    // Preset action: Fork five sub processes
    pid_t pid;
    for (int num = 0; num < NUM5; num++) {
        pid = fork();
        ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
        usleep(SLEEP_NUM);
        if (pid == 0) {
            break;
        }
    }
    // get one parent & five children
    if (pid == 0) {
        int exitCode = 0;
        for (int number = 0; number < NUM5000; number++) {
            // Step 1: Change the file owner for 5000 times
            ret = chown(TOP_DIR "/" DACDIR0 "/" DACDIR0_DACFILE0, number, number);
            if (ret != 0) {
                LOG("ErrInfo: Failed to Change the file owner during the %d time", number);
                break;
            }
            // Step 2: Change the file permission for 5000 times
            if (number & 1) {
                ret = chmod(TOP_DIR "/" DACDIR0 "/" DACDIR0_DACFILE0, CHMOD700);
                if (ret != 0) {
                    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to change the file permission 700 during the " << number
                    << " time";
                    break;
                }
            } else {
                ret = chmod(TOP_DIR "/" DACDIR0 "/" DACDIR0_DACFILE0, CHMOD777);
                if (ret != 0) {
                    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to change the file permission 777 during the " << number
                    << " time";
                    break;
                }
            }
        }
        // Step 3: Two sub processes exit with the exitCode
        exit(exitCode);
    } else {
        // Step 4: The parent process wait for two sub processes to exit and obtain the exitCode
        for (int num2 = 0; num2 < NUM5; num2++) {
            wait(&status);
            EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
            EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: Pid = "<< pid
            << ", its exitCode is wrong and test case failed, please query logs";
        }
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_0210
 * @tc.name       : Performance test of the chomd and chown interface
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest0210, Performance | MediumTest | Level2)
{
    struct timespec tp = { 0 };
    struct timespec starttime = { 0 };
    struct timespec endtime = { 0 };
    tp.tv_sec = 0;
    tp.tv_nsec = 0;
    // Preset action: Create a txt
    CreateTxt();
    // Preset action: Obtains the system time -> starttime
    clock_gettime(CLOCK_REALTIME, &starttime);
    for (int number = 0; number < NUM5000; number++) {
        // Step 1: Change the file owner for 5000 times
        chown(TOP_DIR "/" DACDIR0 "/" DACDIR0_DACFILE0, number, number);
        // Step 2: Change the file permission for 5000 times
        if (number & 1) {
            chmod(TOP_DIR "/" DACDIR0 "/" DACDIR0_DACFILE0, CHMOD700);
        } else {
            chmod(TOP_DIR "/" DACDIR0 "/" DACDIR0_DACFILE0, CHMOD777);
        }
    }
    // Step 3: Obtains the system time again -> endtime
    clock_gettime(CLOCK_REALTIME, &endtime);
    // Step 4: Compare the starttime and the endtime -> tp
    tp = CompareTime(starttime, endtime);
    EXPECT_LE(tp.tv_sec, NUM20) << "ErrInfo: Chown for 10000 times used " << tp.tv_sec << "." << tp.tv_nsec << "s";
    // Cleanup action: Restore the initial status of the file
    chown(TOP_DIR "/" DACDIR0 "/" DACDIR0_DACFILE0, UID0, GID0);
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_0290
 * @tc.name       : DAC control mechanism-File system storage-System call rmdir-UID0-GID1-Capability
                    CAPDACREADSEARCH_CAPDACOVERRIDE-Permission 333
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest0290, Function | MediumTest | Level2)
{
    int ret;
    // Preset action: Create a directory
    CreateDevDir();
    // Preset action: Change the file permission according to the test procedure
    ret = chmod("/storage/" DACDIR0, CHMOD333);
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to chmod 333";
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Change the sub process capabilities according to the test procedure
        CapInit();
        // Step 2: Change the sub process uid, gid and groups according to the test procedure
        SetUidGid(UID0, GID555);
        // Step 3: Invoke the interface to operate the file system
        ret = rmdir("/storage/" DACDIR0 "/" DACDIR0_DACDIR0);
        if (ret != 0) {
            LOG("ErrInfo: VFS error with DAC or Capability");
            exitCode = 1;
        }
        // Step 4: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        int status = 0;
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_0300
 * @tc.name       : DAC control mechanism-File system storage-System call rmdir-UID1-GID0-Capability
                    CAPDACOVERRIDE-Permission 611
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest0300, Function | MediumTest | Level2)
{
    int ret;
    // Preset action: Create a directory
    CreateDevDir();
    // Preset action: Change the file permission according to the test procedure
    ret = chmod("/storage/" DACDIR0, CHMOD611);
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to chmod 611";
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Change the sub process capabilities according to the test procedure
        DropCAPDACREADSEARCH();
        // Step 2: Change the sub process uid, gid and groups according to the test procedure
        SetUidGid(UID555, GID0);
        // Step 3: Invoke the interface to operate the file system
        ret = rmdir("/storage/" DACDIR0 "/" DACDIR0_DACDIR0);
        if (ret != 0) {
            LOG("ErrInfo: VFS error with DAC or Capability");
            exitCode = 1;
        }
        // Step 4: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        int status = 0;
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_0310
 * @tc.name       : DAC control mechanism-File system storage-System call rmdir-UID1-GID1-Capability
                    CAPDACOVERRIDE-Permission 105
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest0310, Function | MediumTest | Level2)
{
    int ret;
    // Preset action: Create a directory
    CreateDevDir();
    // Preset action: Change the file permission according to the test procedure
    ret = chmod("/storage/" DACDIR0, CHMOD105);
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to chmod 105";
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Change the sub process capabilities according to the test procedure
        DropCAPDACREADSEARCH();
        // Step 2: Change the sub process uid, gid and groups according to the test procedure
        SetUidGid(UID555, GID555);
        // Step 3: Invoke the interface to operate the file system
        ret = rmdir("/storage/" DACDIR0 "/" DACDIR0_DACDIR0);
        if (ret != 0) {
            LOG("ErrInfo: VFS error with DAC or Capability");
            exitCode = 1;
        }
        // Step 4: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        int status = 0;
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_0320
 * @tc.name       : DAC control mechanism-File system storage-System call rmdir-UID1-GID1-Capability
                    CAPDACOVERRIDE-Permission 555
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest0320, Function | MediumTest | Level2)
{
    int ret;
    // Preset action: Create a directory
    CreateDevDir();
    // Preset action: Change the file permission according to the test procedure
    ret = chmod("/storage/" DACDIR0, CHMOD555);
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to chmod 555";
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Change the sub process capabilities according to the test procedure
        DropCAPDACREADSEARCH();
        // Step 2: Change the sub process uid, gid and groups according to the test procedure
        SetUidGid(UID555, GID555);
        // Step 3: Invoke the interface to operate the file system
        ret = rmdir("/storage/" DACDIR0 "/" DACDIR0_DACDIR0);
        if (ret != 0) {
            LOG("ErrInfo: VFS error with DAC or Capability");
            exitCode = 1;
        }
        // Step 4: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        int status = 0;
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_0330
 * @tc.name       : DAC control mechanism-File system storage-System call rmdir-UID1-GID1-Groups contain-Capability
                    CAPDACREADSEARCH-Permission 666
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest0330, Function | MediumTest | Level2)
{
    int ret;
    gid_t list[SINGLESIZE] = {0};
    // Preset action: Create a directory
    CreateDevDir();
    // Preset action: Change the file permission according to the test procedure
    ret = chmod("/storage/" DACDIR0, CHMOD666);
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to chmod 666";
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Change the sub process capabilities according to the test procedure
        DropCAPDACOVERRIDEAndREADSEARCH();
        // Step 2: Change the sub process uid, gid and groups according to the test procedure
        SetUidGid(UID555, GID555);
        setgroups(SINGLESIZE, list);
        // Step 3: Invoke the interface to operate the file system
        ret = rmdir("/storage/" DACDIR0 "/" DACDIR0_DACDIR0);
        if (ret != FALSE) {
            LOG("ErrInfo: VFS error with DAC or Capability");
            exitCode = 1;
        }
        // Step 4: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        int status = 0;
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_0340
 * @tc.name       : DAC control mechanism-File system storage-System call stat-UID0-GID1-Capability NULL-Permission 777
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest0340, Function | MediumTest | Level2)
{
    int ret;
    // Preset action: Create a directory
    CreateDevDir();
    // Preset action: Change the file permission according to the test procedure
    ret = chmod("/storage/" DACDIR0, CHMOD777);
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to chmod 777";
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Change the sub process capabilities according to the test procedure
        DropCAPDACOVERRIDEAndREADSEARCH();
        // Step 2: Change the sub process uid, gid and groups according to the test procedure
        SetUidGid(UID0, GID555);
        // Step 3: Invoke the interface to operate the file system
        ret = rmdir("/storage/" DACDIR0 "/" DACDIR0_DACDIR0);
        if (ret != 0) {
            LOG("ErrInfo: VFS error with DAC or Capability");
            exitCode = 1;
        }
        // Step 4: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        int status = 0;
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_0350
 * @tc.name       : DAC control mechanism-File system storage-System call stat-UID1-GID0-Capability
                    CAPDACOVERRIDE-Permission 166
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest0350, Function | MediumTest | Level2)
{
    int ret;
    struct stat buf = { 0 };
    // Preset action: Create a directory
    CreateDevDir();
    // Preset action: Change the file permission according to the test procedure
    ret = chmod("/storage/" DACDIR0, CHMOD166);
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to chmod 166";
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Change the sub process capabilities according to the test procedure
        DropCAPDACREADSEARCH();
        // Step 2: Change the sub process uid, gid and groups according to the test procedure
        SetUidGid(UID555, GID0);
        // Step 3: Invoke the interface to operate the file system
        ret = stat("/storage/" DACDIR0 "/" DACDIR0_DACDIR0, &buf);
        if (ret != 0) {
            LOG("ErrInfo: VFS error with DAC or Capability");
            exitCode = 1;
        }
        // Step 4: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        int status = 0;
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_0360
 * @tc.name       : DAC control mechanism-File system storage-System call stat-UID0-GID0-Capability
                    CAPDACREADSEARCH_CAPDACOVERRIDE-Permission 111
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest0360, Function | MediumTest | Level2)
{
    int ret;
    struct stat buf = { 0 };
    // Preset action: Create a directory
    CreateDevDir();
    // Preset action: Change the file permission according to the test procedure
    ret = chmod("/storage/" DACDIR0, CHMOD111);
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to chmod 111";
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Change the sub process capabilities according to the test procedure
        CapInit();
        // Step 2: Change the sub process uid, gid and groups according to the test procedure
        SetUidGid(UID0, GID0);
        // Step 3: Invoke the interface to operate the file system
        ret = stat("/storage/" DACDIR0 "/" DACDIR0_DACDIR0, &buf);
        if (ret != 0) {
            LOG("ErrInfo: VFS error with DAC or Capability");
            exitCode = 1;
        }
        // Step 4: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        int status = 0;
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_0370
 * @tc.name       : DAC control mechanism-File system storage-System call stat-UID0-GID0-Capability
                    CAPDACREADSEARCH_CAPDACOVERRIDE-Permission 210
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest0370, Function | MediumTest | Level2)
{
    int ret;
    struct stat buf = { 0 };
    // Preset action: Create a directory
    CreateDevDir();
    // Preset action: Change the file permission according to the test procedure
    ret = chmod("/storage/" DACDIR0, CHMOD210);
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to chmod 210";
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Change the sub process capabilities according to the test procedure
        CapInit();
        // Step 2: Change the sub process uid, gid and groups according to the test procedure
        SetUidGid(UID0, GID0);
        // Step 3: Invoke the interface to operate the file system
        ret = stat("/storage/" DACDIR0 "/" DACDIR0_DACDIR0, &buf);
        if (ret != 0) {
            LOG("ErrInfo: VFS error with DAC or Capability");
            exitCode = 1;
        }
        // Step 4: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        int status = 0;
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_0380
 * @tc.name       : DAC control mechanism-File system storage-System call stat-UID1-GID1-Groups contain-Capability
                    CAPDACOVERRIDE-Permission 655
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest0380, Function | MediumTest | Level2)
{
    int ret;
    struct stat buf = { 0 };
    gid_t list[SINGLESIZE] = {0};
    // Preset action: Create a directory
    CreateDevDir();
    // Preset action: Change the file permission according to the test procedure
    ret = chmod("/storage/" DACDIR0, CHMOD655);
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to chmod 655";
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Change the sub process capabilities according to the test procedure
        DropCAPDACREADSEARCH();
        // Step 2: Change the sub process uid, gid and groups according to the test procedure
        SetUidGid(UID555, GID555);
        setgroups(SINGLESIZE, list);
        // Step 3: Invoke the interface to operate the file system
        ret = stat("/storage/" DACDIR0 "/" DACDIR0_DACDIR0, &buf);
        if (ret != 0) {
            LOG("ErrInfo: VFS error with DAC or Capability");
            exitCode = 1;
        }
        // Step 4: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        int status = 0;
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_0390
 * @tc.name       : DAC control mechanism-File system storage-System call rename-UID1-GID0-Capability
                    CAPDACREADSEARCH-Permission 570
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest0390, Function | MediumTest | Level2)
{
    int ret;
    // Preset action: Create a directory
    CreateDevDir();
    // Preset action: Change the file permission according to the test procedure
    ret = chmod("/storage/" DACDIR0, CHMOD570);
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to chmod 570";
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Change the sub process capabilities according to the test procedure
        DropCAPDACOVERRIDE();
        // Step 2: Change the sub process uid, gid and groups according to the test procedure
        SetUidGid(UID555, GID0);
        // Step 3: Invoke the interface to operate the file system
        ret = rename("/storage/" DACDIR0 "/" DACDIR0_DACDIR0, "/storage/" DACDIR0 "/" DACDIR0_DACDIR1);
        if (ret != 0) {
            LOG("ErrInfo: VFS error with DAC or Capability");
            exitCode = 1;
        }
        // Step 4: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        int status = 0;
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_0400
 * @tc.name       : DAC control mechanism-File system storage-System call rename-UID1-GID0-Capability
                    CAPDACREADSEARCH_CAPDACOVERRIDE-Permission 306
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest0400, Function | MediumTest | Level2)
{
    int ret;
    // Preset action: Create a directory
    CreateDevDir();
    // Preset action: Change the file permission according to the test procedure
    ret = chmod("/storage/" DACDIR0, CHMOD306);
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to chmod 306";
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Change the sub process capabilities according to the test procedure
        CapInit();
        // Step 2: Change the sub process uid, gid and groups according to the test procedure
        SetUidGid(UID555, GID0);
        // Step 3: Invoke the interface to operate the file system
        ret = rename("/storage/" DACDIR0 "/" DACDIR0_DACDIR0, "/storage/" DACDIR0 "/" DACDIR0_DACDIR1);
        if (ret != 0) {
            LOG("ErrInfo: VFS error with DAC or Capability");
            exitCode = 1;
        }
        // Step 4: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        int status = 0;
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_0410
 * @tc.name       : DAC control mechanism-File system storage-System call rename-UID1-GID1-Capability
                    CAPDACREADSEARCH_CAPDACOVERRIDE-Permission 027
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest0410, Function | MediumTest | Level2)
{
    int ret;
    // Preset action: Create a directory
    CreateDevDir();
    // Preset action: Change the file permission according to the test procedure
    ret = chmod("/storage/" DACDIR0, CHMOD027);
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to chmod 027";
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Change the sub process capabilities according to the test procedure
        CapInit();
        // Step 2: Change the sub process uid, gid and groups according to the test procedure
        SetUidGid(UID555, GID555);
        // Step 3: Invoke the interface to operate the file system
        ret = rename("/storage/" DACDIR0 "/" DACDIR0_DACDIR0, "/storage/" DACDIR0 "/" DACDIR0_DACDIR1);
        if (ret != 0) {
            LOG("ErrInfo: VFS error with DAC or Capability");
            exitCode = 1;
        }
        // Step 4: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        int status = 0;
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_0420
 * @tc.name       : DAC control mechanism-File system storage-System call chdir-UID0-GID1-Capability
                    CAPDACREADSEARCH-Permission 401
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest0420, Function | MediumTest | Level2)
{
    int ret;
    // Preset action: Create a directory
    CreateDevDir();
    // Preset action: Change the file permission according to the test procedure
    ret = chmod("/storage/" DACDIR0, CHMOD401);
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to chmod 401";
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Change the sub process capabilities according to the test procedure
        DropCAPDACOVERRIDE();
        // Step 2: Change the sub process uid, gid and groups according to the test procedure
        SetUidGid(UID0, GID555);
        // Step 3: Invoke the interface to operate the file system
        ret = chdir("/storage/" DACDIR0 "/" DACDIR0_DACDIR0);
        if (ret != 0) {
            LOG("ErrInfo: VFS error with DAC or Capability");
            exitCode = 1;
        }
        // Step 4: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        int status = 0;
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_0430
 * @tc.name       : DAC control mechanism-File system storage-System call chdir-UID0-GID1-Capability
                    CAPDACREADSEARCH_CAPDACOVERRIDE-Permission 507
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest0430, Function | MediumTest | Level2)
{
    int ret;
    // Preset action: Create a directory
    CreateDevDir();
    // Preset action: Change the file permission according to the test procedure
    ret = chmod("/storage/" DACDIR0, CHMOD507);
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to chmod 507";
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Change the sub process capabilities according to the test procedure
        CapInit();
        // Step 2: Change the sub process uid, gid and groups according to the test procedure
        SetUidGid(UID0, GID555);
        // Step 3: Invoke the interface to operate the file system
        ret = chdir("/storage/" DACDIR0 "/" DACDIR0_DACDIR0);
        if (ret != 0) {
            LOG("ErrInfo: VFS error with DAC or Capability");
            exitCode = 1;
        }
        // Step 4: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        int status = 0;
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_0440
 * @tc.name       : DAC control mechanism-File system storage-System call chdir-UID0-GID0-Capability
                    CAPDACOVERRIDE-Permission 347
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest0440, Function | MediumTest | Level2)
{
    int ret;
    // Preset action: Create a directory
    CreateDevDir();
    // Preset action: Change the file permission according to the test procedure
    ret = chmod("/storage/" DACDIR0, CHMOD347);
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to chmod 347";
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Change the sub process capabilities according to the test procedure
        DropCAPDACREADSEARCH();
        // Step 2: Change the sub process uid, gid and groups according to the test procedure
        SetUidGid(UID0, GID0);
        // Step 3: Invoke the interface to operate the file system
        ret = chdir("/storage/" DACDIR0 "/" DACDIR0_DACDIR0);
        if (ret != 0) {
            LOG("ErrInfo: VFS error with DAC or Capability");
            exitCode = 1;
        }
        // Step 4: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        int status = 0;
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_0450
 * @tc.name       : DAC control mechanism-File system storage-System call chdir-UID1-GID1-Capability
                    CAPDACOVERRIDE-Permission 063
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest0450, Function | MediumTest | Level2)
{
    int ret;
    // Preset action: Create a directory
    CreateDevDir();
    // Preset action: Change the file permission according to the test procedure
    ret = chmod("/storage/" DACDIR0, CHMOD063);
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to chmod 063";
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Change the sub process capabilities according to the test procedure
        DropCAPDACREADSEARCH();
        // Step 2: Change the sub process uid, gid and groups according to the test procedure
        SetUidGid(UID555, GID555);
        // Step 3: Invoke the interface to operate the file system
        ret = chdir("/storage/" DACDIR0 "/" DACDIR0_DACDIR0);
        if (ret != 0) {
            LOG("ErrInfo: VFS error with DAC or Capability");
            exitCode = 1;
        }
        // Step 4: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        int status = 0;
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_0460
 * @tc.name       : DAC control mechanism-File system storage-System call chdir-UID1-GID1-Capability
                    CAPDACREADSEARCH_CAPDACOVERRIDE-Permission 230
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest0460, Function | MediumTest | Level2)
{
    int ret;
    // Preset action: Create a directory
    CreateDevDir();
    // Preset action: Change the file permission according to the test procedure
    ret = chmod("/storage/" DACDIR0, CHMOD230);
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to chmod 230";
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Change the sub process capabilities according to the test procedure
        CapInit();
        // Step 2: Change the sub process uid, gid and groups according to the test procedure
        SetUidGid(UID555, GID555);
        // Step 3: Invoke the interface to operate the file system
        ret = chdir("/storage/" DACDIR0 "/" DACDIR0_DACDIR0);
        if (ret != 0) {
            LOG("ErrInfo: VFS error with DAC or Capability");
            exitCode = 1;
        }
        // Step 4: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        int status = 0;
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_0470
 * @tc.name       : DAC control mechanism-File system storage-System call chdir-UID1-GID1-Groups contain-Capability
                    CAPDACOVERRIDE-Permission 724
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest0470, Function | MediumTest | Level2)
{
    int ret;
    gid_t list[SINGLESIZE] = {0};
    // Preset action: Create a directory
    CreateDevDir();
    // Preset action: Change the file permission according to the test procedure
    ret = chmod("/storage/" DACDIR0, CHMOD724);
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to chmod 724";
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Change the sub process capabilities according to the test procedure
        DropCAPDACREADSEARCH();
        // Step 2: Change the sub process uid, gid and groups according to the test procedure
        SetUidGid(UID555, GID555);
        setgroups(SINGLESIZE, list);
        // Step 3: Invoke the interface to operate the file system
        ret = chdir("/storage/" DACDIR0 "/" DACDIR0_DACDIR0);
        if (ret != 0) {
            LOG("ErrInfo: VFS error with DAC or Capability");
            exitCode = 1;
        }
        // Step 4: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        int status = 0;
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_0480
 * @tc.name       : DAC control mechanism-File system storage-System call execute-UID1-GID0-Capability
                    CAPDACREADSEARCH_CAPDACOVERRIDE-Permission 702
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest0480, Function | MediumTest | Level2)
{
    int ret;
    char *argv[] = {nullptr, nullptr};
    char *envp[] = {nullptr};
    // Preset action: Create a file
    CreateDevTxt();
    // Preset action: Change the file permission according to the test procedure
    ret = chmod("/storage/" DACDIR0, CHMOD702);
    // storage/shm can not change chmod
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to chmod ";
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Change the sub process capabilities according to the test procedure
        CapInit();
        // Step 2: Change the sub process uid, gid and groups according to the test procedure
        SetUidGid(UID555, GID0);
        // Step 3: Invoke the interface to operate the file system
        ret = execve("/storage/" DACDIR0 "/" DACDIR0_DACFILE0, argv, envp);
        // the file is not elf , can not exec
        if (ret != FALSE) {
            LOG("ErrInfo: VFS error with DAC or Capability");
            exitCode = 1;
        }
        // Step 4: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        int status = 0;
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_0490
 * @tc.name       : DAC control mechanism-File system storage-System call execute-UID0-GID0-Capability
                    CAPDACOVERRIDE-Permission 473
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest0490, Function | MediumTest | Level2)
{
    int ret;
    char *argv[] = {nullptr, nullptr};
    char *envp[] = {nullptr};
    // Preset action: Create a file
    CreateDevTxt();
    // Preset action: Change the file permission according to the test procedure
    ret = chmod("/storage/" DACDIR0, CHMOD473);
    // storage/shm can not change chmod
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to chmod ";
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Change the sub process capabilities according to the test procedure
        DropCAPDACREADSEARCH();
        // Step 2: Change the sub process uid, gid and groups according to the test procedure
        SetUidGid(UID0, GID0);
        // Step 3: Invoke the interface to operate the file system
        ret = execve("/storage/" DACDIR0 "/" DACDIR0_DACFILE0, argv, envp);
        // the file is not elf , can not exec
        if (ret != FALSE) {
            LOG("ErrInfo: VFS error with DAC or Capability");
            exitCode = 1;
        }
        // Step 4: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        int status = 0;
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_0500
 * @tc.name       : DAC control mechanism-File system storage-System call execute-UID1-GID1-Capability
                    CAPDACOVERRIDE-Permission 261
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest0500, Function | MediumTest | Level2)
{
    int ret;
    char *argv[] = {nullptr, nullptr};
    char *envp[] = {nullptr};
    // Preset action: Create a file
    CreateDevTxt();
    // Preset action: Change the file permission according to the test procedure
    ret = chmod("/storage/" DACDIR0, CHMOD261);
    // storage/shm can not change chmod
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to chmod ";
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Change the sub process capabilities according to the test procedure
        DropCAPDACREADSEARCH();
        // Step 2: Change the sub process uid, gid and groups according to the test procedure
        SetUidGid(UID555, GID555);
        // Step 3: Invoke the interface to operate the file system
        ret = execve("/storage/" DACDIR0 "/" DACDIR0_DACFILE0, argv, envp);
        // the file is not elf , can not exec
        if (ret != FALSE) {
            LOG("ErrInfo: VFS error with DAC or Capability");
            exitCode = 1;
        }
        // Step 4: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        int status = 0;
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_0510
 * @tc.name       : DAC control mechanism-File system storage-System call access-UID0-GID1-Capability
                    CAPDACREADSEARCH_CAPDACOVERRIDE-Permission 460
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest0510, Function | MediumTest | Level2)
{
    int ret;
    // Preset action: Create a file
    CreateDevTxt();
    // Preset action: Change the file permission according to the test procedure
    ret = chmod("/storage/" DACDIR0, CHMOD460);
    // storage/shm can not change chmod
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to chmod ";
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Change the sub process capabilities according to the test procedure
        CapInit();
        // Step 2: Change the sub process uid, gid and groups according to the test procedure
        SetUidGid(UID0, GID555);
        // Step 3: Invoke the interface to operate the file system
        ret = access("/storage/" DACDIR0 "/" DACDIR0_DACFILE0, F_OK);
        if (ret != FALSE) {
            LOG("ErrInfo: VFS error with DAC or Capability");
            exitCode = 1;
        }
        // Step 4: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        int status = 0;
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_0520
 * @tc.name       : DAC control mechanism-File system storage-System call access-UID1-GID0-Capability
                    CAPDACOVERRIDE-Permission 562
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest0520, Function | MediumTest | Level2)
{
    int ret;
    // Preset action: Create a file
    CreateDevTxt();
    // Preset action: Change the file permission according to the test procedure
    ret = chmod("/storage/" DACDIR0, CHMOD562);
    // storage/shm can not change chmod
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to chmod ";
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Change the sub process capabilities according to the test procedure
        DropCAPDACREADSEARCH();
        // Step 2: Change the sub process uid, gid and groups according to the test procedure
        SetUidGid(UID0, GID555);
        // Step 3: Invoke the interface to operate the file system
        ret = access("/storage/" DACDIR0 "/" DACDIR0_DACFILE0, F_OK);
        if (ret != FALSE) {
            LOG("ErrInfo: VFS error with DAC or Capability");
            exitCode = 1;
        }
        // Step 4: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        int status = 0;
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}


/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_0530
 * @tc.name       : DAC control mechanism-File system storage-System call access-UID0-GID0-Capability
                    CAPDACOVERRIDE-Permission 076
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest0530, Function | MediumTest | Level2)
{
    int ret;
    // Preset action: Create a file
    CreateDevTxt();
    // Preset action: Change the file permission according to the test procedure
    ret = chmod("/storage/" DACDIR0, CHMOD076);
    // storage/shm can not change chmod
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to chmod ";
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Change the sub process capabilities according to the test procedure
        DropCAPDACREADSEARCH();
        // Step 2: Change the sub process uid, gid and groups according to the test procedure
        SetUidGid(UID0, GID0);
        // Step 3: Invoke the interface to operate the file system
        ret = access("/storage/" DACDIR0 "/" DACDIR0_DACFILE0, F_OK);
        if (ret != FALSE) {
            LOG("ErrInfo: VFS error with DAC or Capability");
            exitCode = 1;
        }
        // Step 4: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        int status = 0;
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_0540
 * @tc.name       : DAC control mechanism-File system storage-System call access-UID1-GID1-Capability
                    CAPDACREADSEARCH_CAPDACOVERRIDE-Permission 305
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest0540, Function | MediumTest | Level2)
{
    int ret;
    gid_t list[SINGLESIZE] = {0};
    // Preset action: Create a file
    CreateDevTxt();
    // Preset action: Change the file permission according to the test procedure
    ret = chmod("/storage/" DACDIR0, CHMOD076);
    // storage/shm can not change chmod
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to chmod ";
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Change the sub process capabilities according to the test procedure
        CapInit();
        // Step 2: Change the sub process uid, gid and groups according to the test procedure
        SetUidGid(UID555, GID555);
        setgroups(SINGLESIZE, list);
        // Step 3: Invoke the interface to operate the file system
        ret = access("/storage/" DACDIR0 "/" DACDIR0_DACFILE0, F_OK);
        if (ret != FALSE) {
            LOG("ErrInfo: VFS error with DAC or Capability");
            exitCode = 1;
        }
        // Step 4: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        int status = 0;
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_0550
 * @tc.name       : DAC control mechanism-File system storage-System call access-UID1-GID1-Groups contain-Capability
                    CAPDACOVERRIDE-Permission 132
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest0550, Function | MediumTest | Level2)
{
    int ret;
    gid_t list[SINGLESIZE] = {0};
    // Preset action: Create a file
    CreateDevTxt();
    // Preset action: Change the file permission according to the test procedure
    ret = chmod("/storage/" DACDIR0, CHMOD132);
    // storage/shm can not change chmod
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to chmod ";
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Change the sub process capabilities according to the test procedure
        DropCAPDACREADSEARCH();
        // Step 2: Change the sub process uid, gid and groups according to the test procedure
        SetUidGid(UID555, GID555);
        setgroups(SINGLESIZE, list);
        // Step 3: Invoke the interface to operate the file system
        ret = access("/storage/" DACDIR0 "/" DACDIR0_DACFILE0, F_OK);
        if (ret != FALSE) {
            LOG("ErrInfo: VFS error with DAC or Capability");
            exitCode = 1;
        }
        // Step 4: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        int status = 0;
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_0560
 * @tc.name       : DAC control mechanism-File system storage-System call access-UID1-GID1-Groups contain-Capability
                    CAPDACREADSEARCH_CAPDACOVERRIDE-Permission 241
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest0560, Function | MediumTest | Level2)
{
    int ret;
    gid_t list[SINGLESIZE] = {0};
    // Preset action: Create a file
    CreateDevTxt();
    // Preset action: Change the file permission according to the test procedure
    ret = chmod("/storage/" DACDIR0, CHMOD241);
    // storage/shm can not change chmod
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to chmod ";
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Change the sub process capabilities according to the test procedure
        CapInit();
        // Step 2: Change the sub process uid, gid and groups according to the test procedure
        SetUidGid(UID555, GID555);
        setgroups(SINGLESIZE, list);
        // Step 3: Invoke the interface to operate the file system
        ret = access("/storage/" DACDIR0 "/" DACDIR0_DACFILE0, F_OK);
        if (ret != FALSE) {
            LOG("ErrInfo: VFS error with DAC or Capability");
            exitCode = 1;
        }
        // Step 4: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        int status = 0;
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_0570
 * @tc.name       : DAC control mechanism-File system storage-System call mkdir-UID0-GID1-Capability
                    CAPDACOVERRIDE-Permission 456
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest0570, Function | MediumTest | Level2)
{
    int ret;
    // Preset action: Create a directory
    CreateDevDir();
    // Preset action: Change the file permission according to the test procedure
    ret = chmod("/storage/" DACDIR0 "/" DACDIR0_DACDIR0, CHMOD456);
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to chmod 456";
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Change the sub process capabilities according to the test procedure
        DropCAPDACREADSEARCH();
        // Step 2: Change the sub process uid, gid and groups according to the test procedure
        SetUidGid(UID0, GID555);
        // Step 3: Invoke the interface to operate the file system
        ret = mkdir("/storage/" DACDIR0 "/" DACDIR0_DACDIR0 "/" DACDIR0_DACDIR0_DACDIR0, NORWX);
        if (ret != 0) {
            LOG("ErrInfo: VFS error with DAC or Capability");
            exitCode = 1;
        }
        // Step 4: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        int status = 0;
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_0580
 * @tc.name       : DAC control mechanism-File system storage-System call mkdir-UID1-GID0-Capability
                    CAPDACOVERRIDE-Permission 167
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest0580, Function | MediumTest | Level2)
{
    int ret;
    // Preset action: Create a directory
    CreateDevDir();
    // Preset action: Change the file permission according to the test procedure
    ret = chmod("/storage/" DACDIR0 "/" DACDIR0_DACDIR0, CHMOD167);
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to chmod 167";
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Change the sub process capabilities according to the test procedure
        DropCAPDACREADSEARCH();
        // Step 2: Change the sub process uid, gid and groups according to the test procedure
        SetUidGid(UID555, GID0);
        // Step 3: Invoke the interface to operate the file system
        ret = mkdir("/storage/" DACDIR0 "/" DACDIR0_DACDIR0 "/" DACDIR0_DACDIR0_DACDIR0, NORWX);
        if (ret != 0) {
            LOG("ErrInfo: VFS error with DAC or Capability");
            exitCode = 1;
        }
        // Step 4: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        int status = 0;
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_0590
 * @tc.name       : DAC control mechanism-File system storage-System call mkdir-UID1-GID1-Capability
                    CAPDACREADSEARCH_CAPDACOVERRIDE-Permission 511
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest0590, Function | MediumTest | Level2)
{
    int ret;
    // Preset action: Create a directory
    CreateDevDir();
    // Preset action: Change the file permission according to the test procedure
    ret = chmod("/storage/" DACDIR0 "/" DACDIR0_DACDIR0, CHMOD511);
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to chmod 511";
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Change the sub process capabilities according to the test procedure
        CapInit();
        // Step 2: Change the sub process uid, gid and groups according to the test procedure
        SetUidGid(UID555, GID555);
        // Step 3: Invoke the interface to operate the file system
        ret = mkdir("/storage/" DACDIR0 "/" DACDIR0_DACDIR0 "/" DACDIR0_DACDIR0_DACDIR0, NORWX);
        if (ret != 0) {
            LOG("ErrInfo: VFS error with DAC or Capability");
            exitCode = 1;
        }
        // Step 4: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        int status = 0;
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_0600
 * @tc.name       : DAC control mechanism-File system storage-System call mkdir-UID1-GID1-Capability
                    CAPDACREADSEARCH_CAPDACOVERRIDE-Permission 640
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest0600, Function | MediumTest | Level2)
{
    int ret;
    // Preset action: Create a directory
    CreateDevDir();
    // Preset action: Change the file permission according to the test procedure
    ret = chmod("/storage/" DACDIR0 "/" DACDIR0_DACDIR0, CHMOD640);
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to chmod 640";
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Change the sub process capabilities according to the test procedure
        CapInit();
        // Step 2: Change the sub process uid, gid and groups according to the test procedure
        SetUidGid(UID555, GID555);
        // Step 3: Invoke the interface to operate the file system
        ret = mkdir("/storage/" DACDIR0 "/" DACDIR0_DACDIR0 "/" DACDIR0_DACDIR0_DACDIR0, NORWX);
        if (ret != 0) {
            LOG("ErrInfo: VFS error with DAC or Capability");
            exitCode = 1;
        }
        // Step 4: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        int status = 0;
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_0610
 * @tc.name       : DAC control mechanism-File system storage-System call unlink-UID0-GID1-Capability
                    CAPDACOVERRIDE-Permission 362
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest0610, Function | MediumTest | Level2)
{
    int ret;
    // Preset action: Create a file
    CreateDevTxt();
    // Preset action: Change the file permission according to the test procedure
    ret = chmod("/storage/" DACDIR0, CHMOD362);
    // storage/shm can not change chmod
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to chmod ";
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Change the sub process capabilities according to the test procedure
        DropCAPDACREADSEARCH();
        // Step 2: Change the sub process uid, gid and groups according to the test procedure
        SetUidGid(UID0, GID555);
        // Step 3: Invoke the interface to operate the file system
        ret = unlink("/storage/" DACDIR0 "/" DACDIR0_DACFILE0);
        if (ret != FALSE) {
            LOG("ErrInfo: VFS error with DAC or Capability");
            exitCode = 1;
        }
        // Step 4: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        int status = 0;
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_0620
 * @tc.name       : DAC control mechanism-File system storage-System call unlink-UID0-GID1-Capability
                    CAPDACOVERRIDE-Permission 526
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest0620, Function | MediumTest | Level2)
{
    int ret;
    // Preset action: Create a file
    CreateDevTxt();
    // Preset action: Change the file permission according to the test procedure
    ret = chmod("/storage/" DACDIR0, CHMOD526);
    // storage/shm can not change chmod
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to chmod ";
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Change the sub process capabilities according to the test procedure
        DropCAPDACREADSEARCH();
        // Step 2: Change the sub process uid, gid and groups according to the test procedure
        SetUidGid(UID0, GID555);
        // Step 3: Invoke the interface to operate the file system
        ret = unlink("/storage/" DACDIR0 "/" DACDIR0_DACFILE0);
        if (ret != FALSE) {
            LOG("ErrInfo: VFS error with DAC or Capability");
            exitCode = 1;
        }
        // Step 4: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        int status = 0;
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_0630
 * @tc.name       : DAC control mechanism-File system storage-System call unlink-UID0-GID0-Capability
                    CAPDACREADSEARCH_CAPDACOVERRIDE-Permission 604
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest0630, Function | MediumTest | Level2)
{
    int ret;
    // Preset action: Create a file
    CreateDevTxt();
    // Preset action: Change the file permission according to the test procedure
    ret = chmod("/storage/" DACDIR0, CHMOD604);
    // storage/shm can not change chmod
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to chmod ";
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Change the sub process capabilities according to the test procedure
        CapInit();
        // Step 2: Change the sub process uid, gid and groups according to the test procedure
        SetUidGid(UID0, GID0);
        // Step 3: Invoke the interface to operate the file system
        ret = unlink("/storage/" DACDIR0 "/" DACDIR0_DACFILE0);
        if (ret != FALSE) {
            LOG("ErrInfo: VFS error with DAC or Capability");
            exitCode = 1;
        }
        // Step 4: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        int status = 0;
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_0640
 * @tc.name       : DAC control mechanism-File system storage-System call unlink-UID0-GID0-Capability
                    CAPDACREADSEARCH_CAPDACOVERRIDE-Permission 671
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest0640, Function | MediumTest | Level2)
{
    int ret;
    // Preset action: Create a file
    CreateDevTxt();
    // Preset action: Change the file permission according to the test procedure
    ret = chmod("/storage/" DACDIR0, CHMOD671);
    // storage/shm can not change chmod
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to chmod ";
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Change the sub process capabilities according to the test procedure
        CapInit();
        // Step 2: Change the sub process uid, gid and groups according to the test procedure
        SetUidGid(UID0, GID0);
        // Step 3: Invoke the interface to operate the file system
        ret = unlink("/storage/" DACDIR0 "/" DACDIR0_DACFILE0);
        if (ret != FALSE) {
            LOG("ErrInfo: VFS error with DAC or Capability");
            exitCode = 1;
        }
        // Step 4: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        int status = 0;
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_0650
 * @tc.name       : DAC control mechanism-File system storage-System call unlink-UID0-GID0-Capability
                    CAPDACREADSEARCH_CAPDACOVERRIDE-Permission 743
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest0650, Function | MediumTest | Level2)
{
    int ret;
    // Preset action: Create a file
    CreateDevTxt();
    // Preset action: Change the file permission according to the test procedure
    ret = chmod("/storage/" DACDIR0, CHMOD743);
    // storage/shm can not change chmod
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to chmod ";
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Change the sub process capabilities according to the test procedure
        CapInit();
        // Step 2: Change the sub process uid, gid and groups according to the test procedure
        SetUidGid(UID0, GID0);
        // Step 3: Invoke the interface to operate the file system
        ret = unlink("/storage/" DACDIR0 "/" DACDIR0_DACFILE0);
        if (ret != FALSE) {
            LOG("ErrInfo: VFS error with DAC or Capability");
            exitCode = 1;
        }
        // Step 4: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        int status = 0;
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_0660
 * @tc.name       : DAC control mechanism-File system storage-System call unlink-UID1-GID1-Groups contain-Capability
                    CAPDACREADSEARCH_CAPDACOVERRIDE-Permission 235
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest0660, Function | MediumTest | Level2)
{
    int ret;
    gid_t list[SINGLESIZE] = {0};
    // Preset action: Create a file
    CreateDevTxt();
    // Preset action: Change the file permission according to the test procedure
    ret = chmod("/storage/" DACDIR0, CHMOD235);
    // storage/shm can not change chmod
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to chmod ";
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Change the sub process capabilities according to the test procedure
        CapInit();
        // Step 2: Change the sub process uid, gid and groups according to the test procedure
        SetUidGid(UID555, GID555);
        setgroups(SINGLESIZE, list);
        // Step 3: Invoke the interface to operate the file system
        ret = unlink("/storage/" DACDIR0 "/" DACDIR0_DACFILE0);
        if (ret != FALSE) {
            LOG("ErrInfo: VFS error with DAC or Capability");
            exitCode = 1;
        }
        // Step 4: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        int status = 0;
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_0670
 * @tc.name       : DAC control mechanism-File system storage-System call open-UID1-GID0-Capability
                    CAPDACREADSEARCH_CAPDACOVERRIDE-Permission 371
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest0670, Function | MediumTest | Level2)
{
    int ret;
    int fd = 0;
    // Preset action: Create a file
    CreateDevTxt();
    // Preset action: Change the file permission according to the test procedure
    ret = chmod("/storage/" DACDIR0, CHMOD371);
    // storage/shm can not change chmod
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to chmod ";
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Change the sub process capabilities according to the test procedure
        CapInit();
        // Step 2: Change the sub process uid, gid and groups according to the test procedure
        SetUidGid(UID555, GID0);
        // Step 3: Invoke the interface to operate the file system
        fd = open("/storage/" DACDIR0 "/" DACDIR0_DACFILE0, O_WRONLY);
        if (fd >= 0) {
            LOG("ErrInfo: VFS error with DAC or Capability");
            close(fd);
            exitCode = 1;
        }
        // Step 4: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        int status = 0;
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_0680
 * @tc.name       : DAC control mechanism-File system storage-System call open-UID1-GID0-Capability
                    CAPDACREADSEARCH_CAPDACOVERRIDE-Permission 702
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest0680, Function | MediumTest | Level2)
{
    int ret;
    int fd = 0;
    // Preset action: Create a file
    CreateDevTxt();
    // Preset action: Change the file permission according to the test procedure
    ret = chmod("/storage/" DACDIR0, CHMOD702);
    // storage/shm can not change chmod
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to chmod ";
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Change the sub process capabilities according to the test procedure
        CapInit();
        // Step 2: Change the sub process uid, gid and groups according to the test procedure
        SetUidGid(UID555, GID0);
        // Step 3: Invoke the interface to operate the file system
        fd = open("/storage/" DACDIR0 "/" DACDIR0_DACFILE0, O_WRONLY);
        if (fd >= 0) {
            LOG("ErrInfo: VFS error with DAC or Capability");
            close(fd);
            exitCode = 1;
        }
        // Step 4: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        int status = 0;
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_0690
 * @tc.name       : DAC control mechanism-File system storage-System call open-UID1-GID1-Capability
                    CAPDACOVERRIDE-Permission 406
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest0690, Function | MediumTest | Level2)
{
    int ret;
    int fd = 0;
    // Preset action: Create a file
    CreateDevTxt();
    // Preset action: Change the file permission according to the test procedure
    ret = chmod("/storage/" DACDIR0, CHMOD406);
    // storage/shm can not change chmod
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to chmod ";
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Change the sub process capabilities according to the test procedure
        DropCAPDACREADSEARCH();
        // Step 2: Change the sub process uid, gid and groups according to the test procedure
        SetUidGid(UID555, GID555);
        // Step 3: Invoke the interface to operate the file system
        fd = open("/storage/" DACDIR0 "/" DACDIR0_DACFILE0, O_WRONLY);
        if (fd >= 0) {
            LOG("ErrInfo: VFS error with DAC or Capability");
            close(fd);
            exitCode = 1;
        }
        // Step 4: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        int status = 0;
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_0700
 * @tc.name       : DAC control mechanism-File system storage-System call open-UID1-GID1-Groups contain-Capability
                    CAPDACOVERRIDE-Permission 257
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest0700, Function | MediumTest | Level2)
{
    int ret;
    int fd = 0;
    gid_t list[SINGLESIZE] = {0};
    // Preset action: Create a file
    CreateDevTxt();
    // Preset action: Change the file permission according to the test procedure
    ret = chmod("/storage/" DACDIR0, CHMOD257);
    // storage/shm can not change chmod
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to chmod ";
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Change the sub process capabilities according to the test procedure
        DropCAPDACREADSEARCH();
        // Step 2: Change the sub process uid, gid and groups according to the test procedure
        SetUidGid(UID555, GID555);
        setgroups(SINGLESIZE, list);
        // Step 3: Invoke the interface to operate the file system
        fd = open("/storage/" DACDIR0 "/" DACDIR0_DACFILE0, O_WRONLY);
        if (fd >= 0) {
            LOG("ErrInfo: VFS error with DAC or Capability");
            close(fd);
            exitCode = 1;
        }
        // Step 4: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        int status = 0;
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_0710
 * @tc.name       : DAC control mechanism-File system storage-System call opendir-UID0-GID1-Capability
                    CAPDACREADSEARCH_CAPDACOVERRIDE-Permission 750
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest0710, Function | MediumTest | Level2)
{
    int ret;
    DIR* dir = nullptr;
    // Preset action: Create a directory
    CreateDevDir();
    // Preset action: Change the file permission according to the test procedure
    ret = chmod("/storage/" DACDIR0 "/" DACDIR0_DACDIR0, CHMOD750);
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to chmod 750";
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Change the sub process capabilities according to the test procedure
        CapInit();
        // Step 2: Change the sub process uid, gid and groups according to the test procedure
        SetUidGid(UID0, GID555);
        // Step 3: Invoke the interface to operate the file system
        dir = opendir("/storage/" DACDIR0 "/" DACDIR0_DACDIR0);
        if (dir == nullptr) {
            LOG("ErrInfo: VFS error with DAC or Capability");
            exitCode = 1;
        } else {
            closedir(dir);
        }
        // Step 4: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        int status = 0;
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_0720
 * @tc.name       : DAC control mechanism-File system storage-System call opendir-UID0-GID0-Capability
                    CAPDACOVERRIDE-Permission 143
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest0720, Function | MediumTest | Level2)
{
    int ret;
    DIR* dir = nullptr;
    // Preset action: Create a directory
    CreateDevDir();
    // Preset action: Change the file permission according to the test procedure
    ret = chmod("/storage/" DACDIR0 "/" DACDIR0_DACDIR0, CHMOD143);
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to chmod 143";
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Change the sub process capabilities according to the test procedure
        DropCAPDACREADSEARCH();
        // Step 2: Change the sub process uid, gid and groups according to the test procedure
        SetUidGid(UID0, GID0);
        // Step 3: Invoke the interface to operate the file system
        dir = opendir("/storage/" DACDIR0 "/" DACDIR0_DACDIR0);
        if (dir == nullptr) {
            LOG("ErrInfo: VFS error with DAC or Capability");
            exitCode = 1;
        } else {
            closedir(dir);
        }
        // Step 4: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        int status = 0;
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_0730
 * @tc.name       : DAC control mechanism-File system storage-System call opendir-UID1-GID1-Capability
                    CAPDACOVERRIDE-Permission 521
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest0730, Function | MediumTest | Level2)
{
    int ret;
    DIR* dir = nullptr;
    // Preset action: Create a directory
    CreateDevDir();
    // Preset action: Change the file permission according to the test procedure
    ret = chmod("/storage/" DACDIR0 "/" DACDIR0_DACDIR0, CHMOD521);
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to chmod 521";
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Change the sub process capabilities according to the test procedure
        DropCAPDACREADSEARCH();
        // Step 2: Change the sub process uid, gid and groups according to the test procedure
        SetUidGid(UID555, GID555);
        // Step 3: Invoke the interface to operate the file system
        dir = opendir("/storage/" DACDIR0 "/" DACDIR0_DACDIR0);
        if (dir == nullptr) {
            LOG("ErrInfo: VFS error with DAC or Capability");
            exitCode = 1;
        } else {
            closedir(dir);
        }
        // Step 4: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        int status = 0;
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_0740
 * @tc.name       : DAC control mechanism-File system storage-System call opendir-UID1-GID1-Groups contain-Capability
                    CAPDACOVERRIDE-Permission 016
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest0740, Function | MediumTest | Level2)
{
    int ret;
    DIR* dir = nullptr;
    gid_t list[SINGLESIZE] = {0};
    // Preset action: Create a directory
    CreateDevDir();
    // Preset action: Change the file permission according to the test procedure
    ret = chmod("/storage/" DACDIR0 "/" DACDIR0_DACDIR0, CHMOD016);
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to chmod 016";
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Change the sub process capabilities according to the test procedure
        DropCAPDACREADSEARCH();
        // Step 2: Change the sub process uid, gid and groups according to the test procedure
        SetUidGid(UID555, GID555);
        setgroups(SINGLESIZE, list);
        // Step 3: Invoke the interface to operate the file system
        dir = opendir("/storage/" DACDIR0 "/" DACDIR0_DACDIR0);
        if (dir == nullptr) {
            LOG("ErrInfo: VFS error with DAC or Capability");
            exitCode = 1;
        } else {
            closedir(dir);
        }
        // Step 4: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        int status = 0;
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_0750
 * @tc.name       : DAC control mechanism-File system storage-System call opendir-UID1-GID1-Groups contain-Capability
                    CAPDACOVERRIDE-Permission 407
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest0750, Function | MediumTest | Level2)
{
    int ret;
    DIR* dir = nullptr;
    gid_t list[SINGLESIZE] = {0};
    // Preset action: Create a directory
    CreateDevDir();
    // Preset action: Change the file permission according to the test procedure
    ret = chmod("/storage/" DACDIR0 "/" DACDIR0_DACDIR0, CHMOD407);
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to chmod 407";
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Change the sub process capabilities according to the test procedure
        DropCAPDACREADSEARCH();
        // Step 2: Change the sub process uid, gid and groups according to the test procedure
        SetUidGid(UID555, GID555);
        setgroups(SINGLESIZE, list);
        // Step 3: Invoke the interface to operate the file system
        dir = opendir("/storage/" DACDIR0 "/" DACDIR0_DACDIR0);
        if (dir == nullptr) {
            LOG("ErrInfo: VFS error with DAC or Capability");
            exitCode = 1;
        } else {
            closedir(dir);
        }
        // Step 4: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        int status = 0;
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}


/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_0760
 * @tc.name       : DAC control mechanism-File system jffs2-System call rmdir-UID0-GID1-Capability NULL-Permission 000
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest0760, Function | MediumTest | Level2)
{
    int ret;
    // Preset action: Create a directory
    CreateDir();
    // Preset action: Change the file permission according to the test procedure
    ret = chmod(TOP_DIR "/" DACDIR0, CHMOD000);
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to chmod 000";
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Change the sub process capabilities according to the test procedure
        DropCAPDACOVERRIDEAndREADSEARCH();
        // Step 2: Change the sub process uid, gid and groups according to the test procedure
        SetUidGid(UID0, GID555);
        // Step 3: Invoke the interface to operate the file system
        ret = rmdir(TOP_DIR "/" DACDIR0 "/" DACDIR0_DACDIR0);
        if (ret != FALSE) {
            LOG("ErrInfo: VFS error with DAC or Capability");
            exitCode = 1;
        }
        // Step 4: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        int status = 0;
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_0770
 * @tc.name       : DAC control mechanism-File system jffs2-System call rmdir-UID0-GID1-Capability NULL-Permission 052
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest0770, Function | MediumTest | Level2)
{
    int ret;
    // Preset action: Create a directory
    CreateDir();
    // Preset action: Change the file permission according to the test procedure
    ret = chmod(TOP_DIR "/" DACDIR0, CHMOD052);
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to chmod 052";
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Change the sub process capabilities according to the test procedure
        DropCAPDACOVERRIDEAndREADSEARCH();
        // Step 2: Change the sub process uid, gid and groups according to the test procedure
        SetUidGid(UID0, GID555);
        // Step 3: Invoke the interface to operate the file system
        ret = rmdir(TOP_DIR "/" DACDIR0 "/" DACDIR0_DACDIR0);
        if (ret != FALSE) {
            LOG("ErrInfo: VFS error with DAC or Capability");
            exitCode = 1;
        }
        // Step 4: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        int status = 0;
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_0780
 * @tc.name       : DAC control mechanism-File system jffs2-System call rmdir-UID0-GID1-Capability NULL-Permission 077
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest0780, Function | MediumTest | Level2)
{
    int ret;
    // Preset action: Create a directory
    CreateDir();
    // Preset action: Change the file permission according to the test procedure
    ret = chmod(TOP_DIR "/" DACDIR0, CHMOD077);
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to chmod 077";
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Change the sub process capabilities according to the test procedure
        DropCAPDACOVERRIDEAndREADSEARCH();
        // Step 2: Change the sub process uid, gid and groups according to the test procedure
        SetUidGid(UID0, GID555);
        // Step 3: Invoke the interface to operate the file system
        ret = rmdir(TOP_DIR "/" DACDIR0 "/" DACDIR0_DACDIR0);
        if (ret != FALSE) {
            LOG("ErrInfo: VFS error with DAC or Capability");
            exitCode = 1;
        }
        // Step 4: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        int status = 0;
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_0790
 * @tc.name       : DAC control mechanism-File system jffs2-System call rmdir-UID1-GID0-Capability NULL-Permission 444
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest0790, Function | MediumTest | Level2)
{
    int ret;
    // Preset action: Create a directory
    CreateDir();
    // Preset action: Change the file permission according to the test procedure
    ret = chmod(TOP_DIR "/" DACDIR0, CHMOD444);
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to chmod 444";
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Change the sub process capabilities according to the test procedure
        DropCAPDACOVERRIDEAndREADSEARCH();
        // Step 2: Change the sub process uid, gid and groups according to the test procedure
        SetUidGid(UID555, GID0);
        // Step 3: Invoke the interface to operate the file system
        ret = rmdir(TOP_DIR "/" DACDIR0 "/" DACDIR0_DACDIR0);
        if (ret != FALSE) {
            LOG("ErrInfo: VFS error with DAC or Capability");
            exitCode = 1;
        }
        // Step 4: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        int status = 0;
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_0800
 * @tc.name       : DAC control mechanism-File system jffs2-System call rmdir-UID1-GID0-Capability
                    CAPDACREADSEARCH-Permission 716
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest0800, Function | MediumTest | Level2)
{
    int ret;
    // Preset action: Create a directory
    CreateDir();
    // Preset action: Change the file permission according to the test procedure
    ret = chmod(TOP_DIR "/" DACDIR0, CHMOD716);
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to chmod 716";
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Change the sub process capabilities according to the test procedure
        DropCAPDACOVERRIDE();
        // Step 2: Change the sub process uid, gid and groups according to the test procedure
        SetUidGid(UID555, GID0);
        // Step 3: Invoke the interface to operate the file system
        ret = rmdir(TOP_DIR "/" DACDIR0 "/" DACDIR0_DACDIR0);
        if (ret != FALSE) {
            LOG("ErrInfo: VFS error with DAC or Capability");
            exitCode = 1;
        }
        // Step 4: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        int status = 0;
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_0810
 * @tc.name       : DAC control mechanism-File system jffs2-System call rmdir-UID0-GID0-Capability
                    CAPDACREADSEARCH-Permission 222
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest0810, Function | MediumTest | Level2)
{
    int ret;
    // Preset action: Create a directory
    CreateDir();
    // Preset action: Change the file permission according to the test procedure
    ret = chmod(TOP_DIR "/" DACDIR0, CHMOD222);
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to chmod 222";
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Change the sub process capabilities according to the test procedure
        DropCAPDACOVERRIDE();
        // Step 2: Change the sub process uid, gid and groups according to the test procedure
        SetUidGid(UID0, GID0);
        // Step 3: Invoke the interface to operate the file system
        ret = rmdir(TOP_DIR "/" DACDIR0 "/" DACDIR0_DACDIR0);
        if (ret != FALSE) {
            LOG("ErrInfo: VFS error with DAC or Capability");
            exitCode = 1;
        }
        // Step 4: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        int status = 0;
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_0820
 * @tc.name       : DAC control mechanism-File system jffs2-System call stat-UID1-GID0-Capability
                    CAPDACOVERRIDE-Permission 000
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest0820, Function | MediumTest | Level2)
{
    int ret;
    struct stat buf = { 0 };
    // Preset action: Create a file
    CreateTxt();
    // Preset action: Change the file permission according to the test procedure
    ret = chmod(TOP_DIR "/" DACDIR0, CHMOD000);
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to chmod 000";
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Change the sub process capabilities according to the test procedure
        DropCAPDACREADSEARCH();
        // Step 2: Change the sub process uid, gid and groups according to the test procedure
        SetUidGid(UID0, GID0);
        // Step 3: Invoke the interface to operate the file system
        ret = stat(TOP_DIR "/" DACDIR0 "/" DACDIR0_DACFILE0, &buf);
        if (ret != 0) {
            LOG("ErrInfo: VFS error with DAC or Capability");
            exitCode = 1;
        }
        // Step 4: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        int status = 0;
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_0830
 * @tc.name       : DAC control mechanism-File system jffs2-System call stat-UID1-GID1-Capability NULL-Permission 422
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest0830, Function | MediumTest | Level2)
{
    int ret;
    struct stat buf = { 0 };
    // Preset action: Create a file
    CreateTxt();
    // Preset action: Change the file permission according to the test procedure
    ret = chmod(TOP_DIR "/" DACDIR0, CHMOD422);
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to chmod 422";
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Change the sub process capabilities according to the test procedure
        DropCAPDACOVERRIDEAndREADSEARCH();
        // Step 2: Change the sub process uid, gid and groups according to the test procedure
        SetUidGid(UID555, GID555);
        // Step 3: Invoke the interface to operate the file system
        ret = stat(TOP_DIR "/" DACDIR0 "/" DACDIR0_DACFILE0, &buf);
        if (ret != FALSE) {
            LOG("ErrInfo: VFS error with DAC or Capability");
            exitCode = 1;
        }
        // Step 4: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        int status = 0;
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_0840
 * @tc.name       : DAC control mechanism-File system jffs2-System call stat-UID1-GID1-Capability
                    CAPDACREADSEARCH-Permission 334
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest0840, Function | MediumTest | Level2)
{
    int ret;
    struct stat buf = { 0 };
    // Preset action: Create a file
    CreateTxt();
    // Preset action: Change the file permission according to the test procedure
    ret = chmod(TOP_DIR "/" DACDIR0, CHMOD334);
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to chmod 334";
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Change the sub process capabilities according to the test procedure
        DropCAPDACOVERRIDE();
        // Step 2: Change the sub process uid, gid and groups according to the test procedure
        SetUidGid(UID555, GID555);
        // Step 3: Invoke the interface to operate the file system
        ret = stat(TOP_DIR "/" DACDIR0 "/" DACDIR0_DACFILE0, &buf);
        if (ret != 0) {
            LOG("ErrInfo: VFS error with DAC or Capability");
            exitCode = 1;
        }
        // Step 4: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        int status = 0;
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_0850
 * @tc.name       : DAC control mechanism-File system jffs2-System call stat-UID1-GID1-Groups contain-Capability
                    CAPDACREADSEARCH_CAPDACOVERRIDE-Permission 543
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest0850, Function | MediumTest | Level2)
{
    int ret;
    struct stat buf = { 0 };
    gid_t list[SINGLESIZE] = {0};
    // Preset action: Create a file
    CreateTxt();
    // Preset action: Change the file permission according to the test procedure
    ret = chmod(TOP_DIR "/" DACDIR0, CHMOD334);
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to chmod 334";
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Change the sub process capabilities according to the test procedure
        CapInit();
        // Step 2: Change the sub process uid, gid and groups according to the test procedure
        SetUidGid(UID555, GID555);
        setgroups(SINGLESIZE, list);
        // Step 3: Invoke the interface to operate the file system
        ret = stat(TOP_DIR "/" DACDIR0 "/" DACDIR0_DACFILE0, &buf);
        if (ret != 0) {
            LOG("ErrInfo: VFS error with DAC or Capability");
            exitCode = 1;
        }
        // Step 4: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        int status = 0;
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_0860
 * @tc.name       : DAC control mechanism-File system jffs2-System call rename-UID0-GID1-Capability
                    CAPDACOVERRIDE-Permission 614
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest0860, Function | MediumTest | Level2)
{
    int ret;
    // Preset action: Create a file
    CreateTxt();
    // Preset action: Change the file permission according to the test procedure
    ret = chmod(TOP_DIR "/" DACDIR0, CHMOD614);
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to chmod 614";
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Change the sub process capabilities according to the test procedure
        CapInit();
        // Step 2: Change the sub process uid, gid and groups according to the test procedure
        SetUidGid(UID0, GID555);
        // Step 3: Invoke the interface to operate the file system
        ret = rename(TOP_DIR "/" DACDIR0 "/" DACDIR0_DACFILE0, TOP_DIR "/" DACDIR0 "/" DACDIR0_DACFILE1);
        if (ret != 0) {
            LOG("ErrInfo: VFS error with DAC or Capability");
            exitCode = 1;
        }
        // Step 4: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        int status = 0;
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_0870
 * @tc.name       : DAC control mechanism-File system jffs2-System call rename-UID0-GID1-Capability
                    CAPDACREADSEARCH-Permission 242
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest0870, Function | MediumTest | Level2)
{
    int ret;
    // Preset action: Create a file
    CreateTxt();
    // Preset action: Change the file permission according to the test procedure
    ret = chmod(TOP_DIR "/" DACDIR0, CHMOD242);
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to chmod 242";
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Change the sub process capabilities according to the test procedure
        DropCAPDACOVERRIDE();
        // Step 2: Change the sub process uid, gid and groups according to the test procedure
        SetUidGid(UID0, GID555);
        // Step 3: Invoke the interface to operate the file system
        ret = rename(TOP_DIR "/" DACDIR0 "/" DACDIR0_DACFILE0, TOP_DIR "/" DACDIR0 "/" DACDIR0_DACFILE1);
        if (ret != FALSE) {
            LOG("ErrInfo: VFS error with DAC or Capability");
            exitCode = 1;
        }
        // Step 4: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        int status = 0;
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_0880
 * @tc.name       : DAC control mechanism-File system jffs2-System call rename-UID0-GID0-Capability NULL-Permission 430
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest0880, Function | MediumTest | Level2)
{
    int ret;
    // Preset action: Create a file
    CreateTxt();
    // Preset action: Change the file permission according to the test procedure
    ret = chmod(TOP_DIR "/" DACDIR0, CHMOD430);
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to chmod 430";
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Change the sub process capabilities according to the test procedure
        DropCAPDACOVERRIDEAndREADSEARCH();
        // Step 2: Change the sub process uid, gid and groups according to the test procedure
        SetUidGid(UID0, GID0);
        // Step 3: Invoke the interface to operate the file system
        ret = rename(TOP_DIR "/" DACDIR0 "/" DACDIR0_DACFILE0, TOP_DIR "/" DACDIR0 "/" DACDIR0_DACFILE1);
        if (ret != FALSE) {
            LOG("ErrInfo: VFS error with DAC or Capability");
            exitCode = 1;
        }
        // Step 4: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        int status = 0;
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_0890
 * @tc.name       : DAC control mechanism-File system jffs2-System call rename-UID0-GID0-Capability NULL-Permission 765
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest0890, Function | MediumTest | Level2)
{
    int ret;
    // Preset action: Create a file
    CreateTxt();
    // Preset action: Change the file permission according to the test procedure
    ret = chmod(TOP_DIR "/" DACDIR0, CHMOD765);
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to chmod 765";
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Change the sub process capabilities according to the test procedure
        DropCAPDACOVERRIDEAndREADSEARCH();
        // Step 2: Change the sub process uid, gid and groups according to the test procedure
        SetUidGid(UID0, GID0);
        // Step 3: Invoke the interface to operate the file system
        ret = rename(TOP_DIR "/" DACDIR0 "/" DACDIR0_DACFILE0, TOP_DIR "/" DACDIR0 "/" DACDIR0_DACFILE1);
        if (ret != 0) {
            LOG("ErrInfo: VFS error with DAC or Capability");
            exitCode = 1;
        }
        // Step 4: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        int status = 0;
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_0900
 * @tc.name       : DAC control mechanism-File system jffs2-System call rename-UID0-GID0-Capability
                    CAPDACREADSEARCH-Permission 123
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest0900, Function | MediumTest | Level2)
{
    int ret;
    // Preset action: Create a file
    CreateTxt();
    // Preset action: Change the file permission according to the test procedure
    ret = chmod(TOP_DIR "/" DACDIR0, CHMOD123);
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to chmod 123";
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Change the sub process capabilities according to the test procedure
        DropCAPDACOVERRIDE();
        // Step 2: Change the sub process uid, gid and groups according to the test procedure
        SetUidGid(UID0, GID0);
        // Step 3: Invoke the interface to operate the file system
        ret = rename(TOP_DIR "/" DACDIR0 "/" DACDIR0_DACFILE0, TOP_DIR "/" DACDIR0 "/" DACDIR0_DACFILE1);
        if (ret != FALSE) {
            LOG("ErrInfo: VFS error with DAC or Capability");
            exitCode = 1;
        }
        // Step 4: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        int status = 0;
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_0910
 * @tc.name       : DAC control mechanism-File system jffs2-System call rename-UID1-GID1-Groups contain-Capability
                    NULL-Permission 151
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest0910, Function | MediumTest | Level2)
{
    int ret;
    gid_t list[SINGLESIZE] = {0};
    // Preset action: Create a file
    CreateTxt();
    // Preset action: Change the file permission according to the test procedure
    ret = chmod(TOP_DIR "/" DACDIR0, CHMOD151);
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to chmod 151";
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Change the sub process capabilities according to the test procedure
        DropCAPDACOVERRIDEAndREADSEARCH();
        // Step 2: Change the sub process uid, gid and groups according to the test procedure
        SetUidGid(UID555, GID555);
        setgroups(SINGLESIZE, list);
        // Step 3: Invoke the interface to operate the file system
        ret = rename(TOP_DIR "/" DACDIR0 "/" DACDIR0_DACFILE0, TOP_DIR "/" DACDIR0 "/" DACDIR0_DACFILE1);
        if (ret != FALSE) {
            LOG("ErrInfo: VFS error with DAC or Capability");
            exitCode = 1;
        }
        // Step 4: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        int status = 0;
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_0920
 * @tc.name       : DAC control mechanism-File system jffs2-System call chdir-UID1-GID0-Capability
                    CAPDACREADSEARCH_CAPDACOVERRIDE-Permission 256
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest0920, Function | MediumTest | Level2)
{
    int ret;
    // Preset action: Create a directory
    CreateDir();
    // Preset action: Change the file permission according to the test procedure
    ret = chmod(TOP_DIR "/" DACDIR0, CHMOD256);
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to chmod 256";
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Change the sub process capabilities according to the test procedure
        CapInit();
        // Step 2: Change the sub process uid, gid and groups according to the test procedure
        SetUidGid(UID555, GID0);
        // Step 3: Invoke the interface to operate the file system
        ret = chdir(TOP_DIR "/" DACDIR0 "/" DACDIR0_DACDIR0);
        if (ret != 0) {
            LOG("ErrInfo: VFS error with DAC or Capability");
            exitCode = 1;
        }
        // Step 4: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        int status = 0;
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_0930
 * @tc.name       : DAC control mechanism-File system jffs2-System call chdir-UID0-GID0-Capability
                    CAPDACREADSEARCH-Permission 235
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest0930, Function | MediumTest | Level2)
{
    int ret;
    // Preset action: Create a directory
    CreateDir();
    // Preset action: Change the file permission according to the test procedure
    ret = chmod(TOP_DIR "/" DACDIR0, CHMOD235);
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to chmod 235";
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Change the sub process capabilities according to the test procedure
        DropCAPDACOVERRIDE();
        // Step 2: Change the sub process uid, gid and groups according to the test procedure
        SetUidGid(UID0, GID0);
        // Step 3: Invoke the interface to operate the file system
        ret = chdir(TOP_DIR "/" DACDIR0 "/" DACDIR0_DACDIR0);
        if (ret != 0) {
            LOG("ErrInfo: VFS error with DAC or Capability");
            exitCode = 1;
        }
        // Step 4: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        int status = 0;
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_0940
 * @tc.name       : DAC control mechanism-File system jffs2-System call chdir-UID1-GID1-Capability NULL-Permission 670
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest0940, Function | MediumTest | Level2)
{
    int ret;
    // Preset action: Create a directory
    CreateDir();
    // Preset action: Change the file permission according to the test procedure
    ret = chmod(TOP_DIR "/" DACDIR0, CHMOD670);
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to chmod 670";
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Change the sub process capabilities according to the test procedure
        DropCAPDACOVERRIDEAndREADSEARCH();
        // Step 2: Change the sub process uid, gid and groups according to the test procedure
        SetUidGid(UID555, GID555);
        // Step 3: Invoke the interface to operate the file system
        ret = chdir(TOP_DIR "/" DACDIR0 "/" DACDIR0_DACDIR0);
        if (ret != FALSE) {
            LOG("ErrInfo: VFS error with DAC or Capability");
            exitCode = 1;
        }
        // Step 4: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        int status = 0;
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_0950
 * @tc.name       : DAC control mechanism-File system jffs2-System call chdir-UID1-GID1-Groups contain-Capability
                    CAPDACREADSEARCH-Permission 116
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest0950, Function | MediumTest | Level2)
{
    int ret;
    gid_t list[SINGLESIZE] = {0};
    // Preset action: Create a directory
    CreateDir();
    // Preset action: Change the file permission according to the test procedure
    ret = chmod(TOP_DIR "/" DACDIR0, CHMOD116);
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to chmod 116";
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Change the sub process capabilities according to the test procedure
        DropCAPDACOVERRIDE();
        // Step 2: Change the sub process uid, gid and groups according to the test procedure
        SetUidGid(UID555, GID555);
        setgroups(SINGLESIZE, list);
        // Step 3: Invoke the interface to operate the file system
        ret = chdir(TOP_DIR "/" DACDIR0 "/" DACDIR0_DACDIR0);
        if (ret != 0) {
            LOG("ErrInfo: VFS error with DAC or Capability");
            exitCode = 1;
        }
        // Step 4: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        int status = 0;
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_0960
 * @tc.name       : DAC control mechanism-File system jffs2-System call execute-UID0-GID1-Capability
                    CAPDACREADSEARCH-Permission 045
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest0960, Function | MediumTest | Level2)
{
    int ret;
    char *argv[] = {nullptr, nullptr};
    char *envp[] = {nullptr};
    // Preset action: Create a file
    CreateTxt();
    // Preset action: Change the file permission according to the test procedure
    ret = chmod(TOP_DIR "/" DACDIR0, CHMOD045);
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to chmod 045";
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Change the sub process capabilities according to the test procedure
        DropCAPDACOVERRIDE();
        // Step 2: Change the sub process uid, gid and groups according to the test procedure
        SetUidGid(UID0, GID555);
        // Step 3: Invoke the interface to operate the file system
        ret = execve(TOP_DIR "/" DACDIR0 "/" DACDIR0_DACFILE0, argv, envp);
        if (ret != FALSE) {
            LOG("ErrInfo: VFS error with DAC or Capability");
            exitCode = 1;
        }
        // Step 4: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        int status = 0;
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_0970
 * @tc.name       : DAC control mechanism-File system jffs2-System call execute-UID1-GID0-Capability NULL-Permission 124
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest0970, Function | MediumTest | Level2)
{
    int ret;
    char *argv[] = {nullptr, nullptr};
    char *envp[] = {nullptr};
    // Preset action: Create a file
    CreateTxt();
    // Preset action: Change the file permission according to the test procedure
    ret = chmod(TOP_DIR "/" DACDIR0, CHMOD124);
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to chmod 124";
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Change the sub process capabilities according to the test procedure
        DropCAPDACOVERRIDEAndREADSEARCH();
        // Step 2: Change the sub process uid, gid and groups according to the test procedure
        SetUidGid(UID555, GID0);
        // Step 3: Invoke the interface to operate the file system
        ret = execve(TOP_DIR "/" DACDIR0 "/" DACDIR0_DACFILE0, argv, envp);
        if (ret != FALSE) {
            LOG("ErrInfo: VFS error with DAC or Capability");
            exitCode = 1;
        }
        // Step 4: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        int status = 0;
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_0980
 * @tc.name       : DAC control mechanism-File system jffs2-System call execute-UID0-GID0-Capability NULL-Permission 536
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest0980, Function | MediumTest | Level2)
{
    int ret;
    char *argv[] = {nullptr, nullptr};
    char *envp[] = {nullptr};
    // Preset action: Create a file
    CreateTxt();
    // Preset action: Change the file permission according to the test procedure
    ret = chmod(TOP_DIR "/" DACDIR0, CHMOD536);
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to chmod 536";
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Change the sub process capabilities according to the test procedure
        DropCAPDACOVERRIDEAndREADSEARCH();
        // Step 2: Change the sub process uid, gid and groups according to the test procedure
        SetUidGid(UID0, GID0);
        // Step 3: Invoke the interface to operate the file system
        ret = execve(TOP_DIR "/" DACDIR0 "/" DACDIR0_DACFILE0, argv, envp);
        // the file is not elf , can not exec
        if (ret != FALSE) {
            LOG("ErrInfo: VFS error with DAC or Capability");
            exitCode = 1;
        }
        // Step 4: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        int status = 0;
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_0990
 * @tc.name       : DAC control mechanism-File system jffs2-System call execute-UID1-GID1-Capability
                    CAPDACREADSEARCH-Permission 657
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest0990, Function | MediumTest | Level2)
{
    int ret;
    char *argv[] = {nullptr, nullptr};
    char *envp[] = {nullptr};
    // Preset action: Create a file
    CreateTxt();
    // Preset action: Change the file permission according to the test procedure
    ret = chmod(TOP_DIR "/" DACDIR0, CHMOD657);
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to chmod 657";
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Change the sub process capabilities according to the test procedure
        DropCAPDACOVERRIDE();
        // Step 2: Change the sub process uid, gid and groups according to the test procedure
        SetUidGid(UID555, GID555);
        // Step 3: Invoke the interface to operate the file system
        ret = execve(TOP_DIR "/" DACDIR0 "/" DACDIR0_DACFILE0, argv, envp);
        // the file is not elf , can not exec
        if (ret != FALSE) {
            LOG("ErrInfo: VFS error with DAC or Capability");
            exitCode = 1;
        }
        // Step 4: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        int status = 0;
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_1000
 * @tc.name       : DAC control mechanism-File system jffs2-System call execute-UID1-GID1-Groups contain-Capability
                    NULL-Permission 310
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest1000, Function | MediumTest | Level2)
{
    int ret;
    char *argv[] = {nullptr, nullptr};
    char *envp[] = {nullptr};
    gid_t list[SINGLESIZE] = {0};
    // Preset action: Create a file
    CreateTxt();
    // Preset action: Change the file permission according to the test procedure
    ret = chmod(TOP_DIR "/" DACDIR0, CHMOD310);
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to chmod 310";
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Change the sub process capabilities according to the test procedure
        DropCAPDACOVERRIDEAndREADSEARCH();
        // Step 2: Change the sub process uid, gid and groups according to the test procedure
        SetUidGid(UID555, GID555);
        setgroups(SINGLESIZE, list);
        // Step 3: Invoke the interface to operate the file system
        ret = execve(TOP_DIR "/" DACDIR0 "/" DACDIR0_DACFILE0, argv, envp);
        // the file is not elf , can not exec
        if (ret != FALSE) {
            LOG("ErrInfo: VFS error with DAC or Capability");
            exitCode = 1;
        }
        // Step 4: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        int status = 0;
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_1010
 * @tc.name       : DAC control mechanism-File system jffs2-System call access-UID0-GID1-Capability NULL-Permission 354
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest1010, Function | MediumTest | Level2)
{
    int ret;
    // Preset action: Create a file
    CreateTxt();
    // Preset action: Change the file permission according to the test procedure
    ret = chmod(TOP_DIR "/" DACDIR0, CHMOD354);
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to chmod 354";
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Change the sub process capabilities according to the test procedure
        DropCAPDACOVERRIDEAndREADSEARCH();
        // Step 2: Change the sub process uid, gid and groups according to the test procedure
        SetUidGid(UID0, GID555);
        // Step 3: Invoke the interface to operate the file system
        ret = access(TOP_DIR "/" DACDIR0 "/" DACDIR0_DACFILE0, F_OK);
        if (ret != 0) {
            LOG("ErrInfo: VFS error with DAC or Capability");
            exitCode = 1;
        }
        // Step 4: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        int status = 0;
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_1020
 * @tc.name       : DAC control mechanism-File system jffs2-System call access-UID1-GID0-Capability NULL-Permission 623
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest1020, Function | MediumTest | Level2)
{
    int ret;
    // Preset action: Create a file
    CreateTxt();
    // Preset action: Change the file permission according to the test procedure
    ret = chmod(TOP_DIR "/" DACDIR0, CHMOD623);
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to chmod 623";
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Change the sub process capabilities according to the test procedure
        DropCAPDACOVERRIDEAndREADSEARCH();
        // Step 2: Change the sub process uid, gid and groups according to the test procedure
        SetUidGid(UID555, GID0);
        // Step 3: Invoke the interface to operate the file system
        ret = access(TOP_DIR "/" DACDIR0 "/" DACDIR0_DACFILE0, F_OK);
        if (ret != FALSE) {
            LOG("ErrInfo: VFS error with DAC or Capability");
            exitCode = 1;
        }
        // Step 4: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        int status = 0;
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_1030
 * @tc.name       : DAC control mechanism-File system jffs2-System call access-UID1-GID1-Capability
                    CAPDACREADSEARCH-Permission 717
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest1030, Function | MediumTest | Level2)
{
    int ret;
    // Preset action: Create a file
    CreateTxt();
    // Preset action: Change the file permission according to the test procedure
    ret = chmod(TOP_DIR "/" DACDIR0, CHMOD717);
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to chmod 717";
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Change the sub process capabilities according to the test procedure
        DropCAPDACOVERRIDE();
        // Step 2: Change the sub process uid, gid and groups according to the test procedure
        SetUidGid(UID555, GID555);
        // Step 3: Invoke the interface to operate the file system
        ret = access(TOP_DIR "/" DACDIR0 "/" DACDIR0_DACFILE0, F_OK);
        if (ret != 0) {
            LOG("ErrInfo: VFS error with DAC or Capability");
            exitCode = 1;
        }
        // Step 4: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        int status = 0;
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_1040
 * @tc.name       : DAC control mechanism-File system jffs2-System call mkdir-UID0-GID1-Capability NULL-Permission 203
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest1040, Function | MediumTest | Level2)
{
    int ret;
    // Preset action: Create a directory
    CreateDir();
    // Preset action: Change the file permission according to the test procedure
    ret = chmod(TOP_DIR "/" DACDIR0 "/" DACDIR0_DACDIR0, CHMOD203);
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to chmod 203";
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Change the sub process capabilities according to the test procedure
        DropCAPDACOVERRIDEAndREADSEARCH();
        // Step 2: Change the sub process uid, gid and groups according to the test procedure
        SetUidGid(UID0, GID555);
        // Step 3: Invoke the interface to operate the file system
        ret = mkdir(TOP_DIR "/" DACDIR0 "/" DACDIR0_DACDIR0 "/" DACDIR0_DACDIR0_DACDIR0, NORWX);
        if (ret != FALSE) {
            LOG("ErrInfo: VFS error with DAC or Capability");
            exitCode = 1;
        }
        // Step 4: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        int status = 0;
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_1050
 * @tc.name       : DAC control mechanism-File system jffs2-System call mkdir-UID0-GID0-Capability
                    CAPDACREADSEARCH-Permission 325
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest1050, Function | MediumTest | Level2)
{
    int ret;
    // Preset action: Create a directory
    CreateDir();
    // Preset action: Change the file permission according to the test procedure
    ret = chmod(TOP_DIR "/" DACDIR0 "/" DACDIR0_DACDIR0, CHMOD325);
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to chmod 325";
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Change the sub process capabilities according to the test procedure
        DropCAPDACOVERRIDE();
        // Step 2: Change the sub process uid, gid and groups according to the test procedure
        SetUidGid(UID0, GID0);
        // Step 3: Invoke the interface to operate the file system
        ret = mkdir(TOP_DIR "/" DACDIR0 "/" DACDIR0_DACDIR0 "/" DACDIR0_DACDIR0_DACDIR0, NORWX);
        if (ret != 0) {
            LOG("ErrInfo: VFS error with DAC or Capability");
            exitCode = 1;
        }
        // Step 4: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        int status = 0;
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_1060
 * @tc.name       : DAC control mechanism-File system jffs2-System call mkdir-UID0-GID0-Capability
                    CAPDACREADSEARCH-Permission 453
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest1060, Function | MediumTest | Level2)
{
    int ret;
    // Preset action: Create a directory
    CreateDir();
    // Preset action: Change the file permission according to the test procedure
    ret = chmod(TOP_DIR "/" DACDIR0 "/" DACDIR0_DACDIR0, CHMOD453);
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to chmod 453";
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Change the sub process capabilities according to the test procedure
        DropCAPDACOVERRIDE();
        // Step 2: Change the sub process uid, gid and groups according to the test procedure
        SetUidGid(UID0, GID0);
        // Step 3: Invoke the interface to operate the file system
        ret = mkdir(TOP_DIR "/" DACDIR0 "/" DACDIR0_DACDIR0 "/" DACDIR0_DACDIR0_DACDIR0, NORWX);
        if (ret != FALSE) {
            LOG("ErrInfo: VFS error with DAC or Capability");
            exitCode = 1;
        }
        // Step 4: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        int status = 0;
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_1070
 * @tc.name       : DAC control mechanism-File system jffs2-System call mkdir-UID1-GID1-Groups contain-Capability
                    NULL-Permission 342
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest1070, Function | MediumTest | Level2)
{
    int ret;
    gid_t list[SINGLESIZE] = {0};
    // Preset action: Create a directory
    CreateDir();
    // Preset action: Change the file permission according to the test procedure
    ret = chmod(TOP_DIR "/" DACDIR0 "/" DACDIR0_DACDIR0, CHMOD342);
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to chmod 342";
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Change the sub process capabilities according to the test procedure
        DropCAPDACOVERRIDEAndREADSEARCH();
        // Step 2: Change the sub process uid, gid and groups according to the test procedure
        SetUidGid(UID555, GID555);
        setgroups(SINGLESIZE, list);
        // Step 3: Invoke the interface to operate the file system
        ret = mkdir(TOP_DIR "/" DACDIR0 "/" DACDIR0_DACDIR0 "/" DACDIR0_DACDIR0_DACDIR0, NORWX);
        if (ret != FALSE) {
            LOG("ErrInfo: VFS error with DAC or Capability");
            exitCode = 1;
        }
        // Step 4: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        int status = 0;
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_1080
 * @tc.name       : DAC control mechanism-File system jffs2-System call mkdir-UID1-GID1-Groups contain-Capability
                    NULL-Permission 731
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest1080, Function | MediumTest | Level2)
{
    int ret;
    gid_t list[SINGLESIZE] = {0};
    // Preset action: Create a directory
    CreateDir();
    // Preset action: Change the file permission according to the test procedure
    ret = chmod(TOP_DIR "/" DACDIR0 "/" DACDIR0_DACDIR0, CHMOD731);
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to chmod 731";
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Change the sub process capabilities according to the test procedure
        DropCAPDACOVERRIDEAndREADSEARCH();
        // Step 2: Change the sub process uid, gid and groups according to the test procedure
        SetUidGid(UID555, GID555);
        setgroups(SINGLESIZE, list);
        // Step 3: Invoke the interface to operate the file system
        ret = mkdir(TOP_DIR "/" DACDIR0 "/" DACDIR0_DACDIR0 "/" DACDIR0_DACDIR0_DACDIR0, NORWX);
        if (ret != 0) {
            LOG("ErrInfo: VFS error with DAC or Capability");
            exitCode = 1;
        }
        // Step 4: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        int status = 0;
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_1090
 * @tc.name       : DAC control mechanism-File system jffs2-System call mkdir-UID1-GID1-Groups contain-Capability
                    CAPDACREADSEARCH-Permission 074
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest1090, Function | MediumTest | Level2)
{
    int ret;
    gid_t list[SINGLESIZE] = {0};
    // Preset action: Create a directory
    CreateDir();
    // Preset action: Change the file permission according to the test procedure
    ret = chmod(TOP_DIR "/" DACDIR0 "/" DACDIR0_DACDIR0, CHMOD074);
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to chmod 074";
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Change the sub process capabilities according to the test procedure
        DropCAPDACOVERRIDE();
        // Step 2: Change the sub process uid, gid and groups according to the test procedure
        SetUidGid(UID555, GID555);
        setgroups(SINGLESIZE, list);
        // Step 3: Invoke the interface to operate the file system
        ret = mkdir(TOP_DIR "/" DACDIR0 "/" DACDIR0_DACDIR0 "/" DACDIR0_DACDIR0_DACDIR0, NORWX);
        if (ret != 0) {
            LOG("ErrInfo: VFS error with DAC or Capability");
            exitCode = 1;
        }
        // Step 4: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        int status = 0;
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_1100
 * @tc.name       : DAC control mechanism-File system jffs2-System call unlink-UID1-GID0-Capability
                    CAPDACREADSEARCH-Permission 175
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest1100, Function | MediumTest | Level2)
{
    int ret;
    // Preset action: Create a file
    CreateTxt();
    // Preset action: Change the file permission according to the test procedure
    ret = chmod(TOP_DIR "/" DACDIR0, CHMOD175);
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to chmod 175";
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Change the sub process capabilities according to the test procedure
        DropCAPDACOVERRIDE();
        // Step 2: Change the sub process uid, gid and groups according to the test procedure
        SetUidGid(UID555, GID0);
        // Step 3: Invoke the interface to operate the file system
        ret = unlink(TOP_DIR "/" DACDIR0 "/" DACDIR0_DACFILE0);
        if (ret != 0) {
            LOG("ErrInfo: VFS error with DAC or Capability");
            exitCode = 1;
        }
        // Step 4: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        int status = 0;
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_1110
 * @tc.name       : DAC control mechanism-File system jffs2-System call unlink-UID1-GID0-Capability
                    CAPDACREADSEARCH-Permission 446
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest1110, Function | MediumTest | Level2)
{
    int ret;
    // Preset action: Create a file
    CreateTxt();
    // Preset action: Change the file permission according to the test procedure
    ret = chmod(TOP_DIR "/" DACDIR0, CHMOD446);
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to chmod 446";
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Change the sub process capabilities according to the test procedure
        DropCAPDACOVERRIDE();
        // Step 2: Change the sub process uid, gid and groups according to the test procedure
        SetUidGid(UID555, GID0);
        // Step 3: Invoke the interface to operate the file system
        ret = unlink(TOP_DIR "/" DACDIR0 "/" DACDIR0_DACFILE0);
        if (ret != FALSE) {
            LOG("ErrInfo: VFS error with DAC or Capability");
            exitCode = 1;
        }
        // Step 4: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        int status = 0;
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_1120
 * @tc.name       : DAC control mechanism-File system jffs2-System call unlink-UID1-GID0-Capability
                    CAPDACREADSEARCH-Permission 560
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest1120, Function | MediumTest | Level2)
{
    int ret;
    // Preset action: Create a file
    CreateTxt();
    // Preset action: Change the file permission according to the test procedure
    ret = chmod(TOP_DIR "/" DACDIR0, CHMOD560);
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to chmod 560";
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Change the sub process capabilities according to the test procedure
        DropCAPDACOVERRIDE();
        // Step 2: Change the sub process uid, gid and groups according to the test procedure
        SetUidGid(UID555, GID0);
        // Step 3: Invoke the interface to operate the file system
        ret = unlink(TOP_DIR "/" DACDIR0 "/" DACDIR0_DACFILE0);
        if (ret != FALSE) {
            LOG("ErrInfo: VFS error with DAC or Capability");
            exitCode = 1;
        }
        // Step 4: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        int status = 0;
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_1130
 * @tc.name       : DAC control mechanism-File system jffs2-System call unlink-UID1-GID1-Capability NULL-Permission 013
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest1130, Function | MediumTest | Level2)
{
    int ret;
    // Preset action: Create a file
    CreateTxt();
    // Preset action: Change the file permission according to the test procedure
    ret = chmod(TOP_DIR "/" DACDIR0, CHMOD013);
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to chmod 013";
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Change the sub process capabilities according to the test procedure
        DropCAPDACOVERRIDEAndREADSEARCH();
        // Step 2: Change the sub process uid, gid and groups according to the test procedure
        SetUidGid(UID555, GID555);
        // Step 3: Invoke the interface to operate the file system
        ret = unlink(TOP_DIR "/" DACDIR0 "/" DACDIR0_DACFILE0);
        if (ret != 0) {
            LOG("ErrInfo: VFS error with DAC or Capability");
            exitCode = 1;
        }
        // Step 4: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        int status = 0;
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_1140
 * @tc.name       : DAC control mechanism-File system jffs2-System call unlink-UID1-GID1-Groups contain-Capability
                    NULL-Permission 457
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest1140, Function | MediumTest | Level2)
{
    int ret;
    gid_t list[SINGLESIZE] = {0};
    // Preset action: Create a file
    CreateTxt();
    // Preset action: Change the file permission according to the test procedure
    ret = chmod(TOP_DIR "/" DACDIR0, CHMOD457);
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to chmod 457";
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Change the sub process capabilities according to the test procedure
        DropCAPDACOVERRIDEAndREADSEARCH();
        // Step 2: Change the sub process uid, gid and groups according to the test procedure
        SetUidGid(UID555, GID555);
        setgroups(SINGLESIZE, list);
        // Step 3: Invoke the interface to operate the file system
        ret = unlink(TOP_DIR "/" DACDIR0 "/" DACDIR0_DACFILE0);
        if (ret != FALSE) {
            LOG("ErrInfo: VFS error with DAC or Capability");
            exitCode = 1;
        }
        // Step 4: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        int status = 0;
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_1150
 * @tc.name       : DAC control mechanism-File system jffs2-System call open-UID0-GID1-Capability
                    CAPDACREADSEARCH-Permission 120
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest1150, Function | MediumTest | Level2)
{
    int ret;
    int fd = 0;
    // Preset action: Create a file
    CreateTxt();
    // Preset action: Change the file permission according to the test procedure
    ret = chmod(TOP_DIR "/" DACDIR0, CHMOD120);
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to chmod 120";
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Change the sub process capabilities according to the test procedure
        DropCAPDACOVERRIDE();
        // Step 2: Change the sub process uid, gid and groups according to the test procedure
        SetUidGid(UID0, GID555);
        // Step 3: Invoke the interface to operate the file system
        fd = open(TOP_DIR "/" DACDIR0 "/" DACDIR0_DACFILE0, F_OK);
        if (fd >= 0) {
            close(fd);
        } else {
            LOG("ErrInfo: VFS error with DAC or Capability");
            exitCode = 1;
        }
        // Step 4: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        int status = 0;
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_1160
 * @tc.name       : DAC control mechanism-File system jffs2-System call open-UID0-GID1-Capability
                    CAPDACREADSEARCH-Permission 564
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest1160, Function | MediumTest | Level2)
{
    int ret;
    int fd = 0;
    // Preset action: Create a file
    CreateTxt();
    // Preset action: Change the file permission according to the test procedure
    ret = chmod(TOP_DIR "/" DACDIR0, CHMOD564);
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to chmod 564";
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Change the sub process capabilities according to the test procedure
        DropCAPDACOVERRIDE();
        // Step 2: Change the sub process uid, gid and groups according to the test procedure
        SetUidGid(UID0, GID555);
        // Step 3: Invoke the interface to operate the file system
        fd = open(TOP_DIR "/" DACDIR0 "/" DACDIR0_DACFILE0, F_OK);
        if (fd >= 0) {
            close(fd);
        } else {
            LOG("ErrInfo: VFS error with DAC or Capability");
            exitCode = 1;
        }
        // Step 4: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        int status = 0;
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_1170
 * @tc.name       : DAC control mechanism-File system jffs2-System call open-UID0-GID0-Capability NULL-Permission 415
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest1170, Function | MediumTest | Level2)
{
    int ret;
    int fd = 0;
    // Preset action: Create a file
    CreateTxt();
    // Preset action: Change the file permission according to the test procedure
    ret = chmod(TOP_DIR "/" DACDIR0, CHMOD415);
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to chmod 415";
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Change the sub process capabilities according to the test procedure
        DropCAPDACOVERRIDEAndREADSEARCH();
        // Step 2: Change the sub process uid, gid and groups according to the test procedure
        SetUidGid(UID0, GID0);
        // Step 3: Invoke the interface to operate the file system
        fd = open(TOP_DIR "/" DACDIR0 "/" DACDIR0_DACFILE0, F_OK);
        if (fd >= 0) {
            LOG("ErrInfo: VFS error with DAC or Capability");
            close(fd);
            exitCode = 1;
        }
        // Step 4: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        int status = 0;
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_1180
 * @tc.name       : DAC control mechanism-File system jffs2-System call open-UID1-GID1-Capability NULL-Permission 044
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest1180, Function | MediumTest | Level2)
{
    int ret;
    int fd = 0;
    // Preset action: Create a file
    CreateTxt();
    // Preset action: Change the file permission according to the test procedure
    ret = chmod(TOP_DIR "/" DACDIR0, CHMOD044);
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to chmod 044";
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Change the sub process capabilities according to the test procedure
        DropCAPDACOVERRIDEAndREADSEARCH();
        // Step 2: Change the sub process uid, gid and groups according to the test procedure
        SetUidGid(UID555, GID555);
        // Step 3: Invoke the interface to operate the file system
        fd = open(TOP_DIR "/" DACDIR0 "/" DACDIR0_DACFILE0, F_OK);
        if (fd >= 0) {
            LOG("ErrInfo: VFS error with DAC or Capability");
            close(fd);
            exitCode = 1;
        }
        // Step 4: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        int status = 0;
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}


/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_1190
 * @tc.name       : DAC control mechanism-File system jffs2-System call open-UID1-GID1-Capability NULL-Permission 703
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest1190, Function | MediumTest | Level2)
{
    int ret;
    int fd = 0;
    // Preset action: Create a file
    CreateTxt();
    // Preset action: Change the file permission according to the test procedure
    ret = chmod(TOP_DIR "/" DACDIR0, CHMOD703);
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to chmod 703";
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Change the sub process capabilities according to the test procedure
        DropCAPDACOVERRIDEAndREADSEARCH();
        // Step 2: Change the sub process uid, gid and groups according to the test procedure
        SetUidGid(UID555, GID555);
        // Step 3: Invoke the interface to operate the file system
        fd = open(TOP_DIR "/" DACDIR0 "/" DACDIR0_DACFILE0, F_OK);
        if (fd >= 0) {
            close(fd);
        } else {
            LOG("ErrInfo: VFS error with DAC or Capability");
            exitCode = 1;
        }
        // Step 4: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        int status = 0;
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_1200
 * @tc.name       : DAC control mechanism-File system jffs2-System call open-UID1-GID1-Groups contain-Capability
                    NULL-Permission 637
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest1200, Function | MediumTest | Level2)
{
    int ret;
    int fd = 0;
    gid_t list[SINGLESIZE] = {0};
    // Preset action: Create a file
    CreateTxt();
    // Preset action: Change the file permission according to the test procedure
    ret = chmod(TOP_DIR "/" DACDIR0, CHMOD637);
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to chmod 637";
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Change the sub process capabilities according to the test procedure
        DropCAPDACOVERRIDEAndREADSEARCH();
        // Step 2: Change the sub process uid, gid and groups according to the test procedure
        SetUidGid(UID555, GID555);
        setgroups(SINGLESIZE, list);
        // Step 3: Invoke the interface to operate the file system
        fd = open(TOP_DIR "/" DACDIR0 "/" DACDIR0_DACFILE0, F_OK);
        if (fd >= 0) {
            close(fd);
        } else {
            LOG("ErrInfo: VFS error with DAC or Capability");
            exitCode = 1;
        }
        // Step 4: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        int status = 0;
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_1210
 * @tc.name       : DAC control mechanism-File system jffs2-System call opendir-UID1-GID0-Capability NULL-Permission 031
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest1210, Function | MediumTest | Level2)
{
    int ret;
    DIR* dir = nullptr;
    // Preset action: Create a directory
    CreateDir();
    // Preset action: Change the file permission according to the test procedure
    ret = chmod(TOP_DIR "/" DACDIR0, CHMOD031);
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to chmod 031";
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Change the sub process capabilities according to the test procedure
        DropCAPDACOVERRIDEAndREADSEARCH();
        // Step 2: Change the sub process uid, gid and groups according to the test procedure
        SetUidGid(UID555, GID0);
        // Step 3: Invoke the interface to operate the file system
        dir = opendir(TOP_DIR "/" DACDIR0 "/" DACDIR0_DACDIR0);
        if (dir == nullptr) {
            LOG("ErrInfo: VFS error with DAC or Capability");
            exitCode = 1;
        } else {
            closedir(dir);
        }
        // Step 4: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        int status = 0;
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_1220
 * @tc.name       : DAC control mechanism-File system jffs2-System call opendir-UID0-GID0-Capability NULL-Permission 712
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest1220, Function | MediumTest | Level2)
{
    int ret;
    DIR* dir = nullptr;
    // Preset action: Create a directory
    CreateDir();
    // Preset action: Change the file permission according to the test procedure
    ret = chmod(TOP_DIR "/" DACDIR0, CHMOD712);
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to chmod 712";
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Change the sub process capabilities according to the test procedure
        DropCAPDACOVERRIDEAndREADSEARCH();
        // Step 2: Change the sub process uid, gid and groups according to the test procedure
        SetUidGid(UID0, GID0);
        // Step 3: Invoke the interface to operate the file system
        dir = opendir(TOP_DIR "/" DACDIR0 "/" DACDIR0_DACDIR0);
        if (dir == nullptr) {
            LOG("ErrInfo: VFS error with DAC or Capability");
            exitCode = 1;
        } else {
            closedir(dir);
        }
        // Step 4: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        int status = 0;
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_1230
 * @tc.name       : DAC control mechanism-File system jffs2-System call opendir-UID1-GID1-Capability
                    CAPDACREADSEARCH-Permission 274
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest1230, Function | MediumTest | Level2)
{
    int ret;
    DIR* dir = nullptr;
    // Preset action: Create a directory
    CreateDir();
    // Preset action: Change the file permission according to the test procedure
    ret = chmod(TOP_DIR "/" DACDIR0, CHMOD274);
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to chmod 274";
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Change the sub process capabilities according to the test procedure
        DropCAPDACOVERRIDE();
        // Step 2: Change the sub process uid, gid and groups according to the test procedure
        SetUidGid(UID555, GID555);
        // Step 3: Invoke the interface to operate the file system
        dir = opendir(TOP_DIR "/" DACDIR0 "/" DACDIR0_DACDIR0);
        if (dir == nullptr) {
            LOG("ErrInfo: VFS error with DAC or Capability");
            exitCode = 1;
        } else {
            closedir(dir);
        }
        // Step 4: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        int status = 0;
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}

/*
 * @tc.number     : SUB_SEC_AppSEC_PermissionMgmt_DAC_1240
 * @tc.name       : DAC control mechanism-File system jffs2-System call opendir-UID1-GID1-Groups contain-Capability
                    CAPDACREADSEARCH-Permission 665
 * @tc.desc       : [C- SECURITY -0200]
 */
HWTEST_F(DacTestSuite, DACTest1240, Function | MediumTest | Level2)
{
    int ret;
    DIR* dir = nullptr;
    gid_t list[SINGLESIZE] = {0};
    // Preset action: Create a directory
    CreateDir();
    // Preset action: Change the file permission according to the test procedure
    ret = chmod(TOP_DIR "/" DACDIR0, CHMOD665);
    EXPECT_EQ(ret, 0) << "ErrInfo: Failed to chmod 665";
    // Preset action: Fork a sub process
    pid_t pid = fork();
    ASSERT_TRUE(pid >= 0) << "======== Fork Error! =========";
    usleep(SLEEP_NUM);
    if (pid == 0) {
        int exitCode = 0;
        // Step 1: Change the sub process capabilities according to the test procedure
        DropCAPDACOVERRIDE();
        // Step 2: Change the sub process uid, gid and groups according to the test procedure
        SetUidGid(UID555, GID555);
        setgroups(SINGLESIZE, list);
        // Step 3: Invoke the interface to operate the file system
        dir = opendir(TOP_DIR "/" DACDIR0 "/" DACDIR0_DACDIR0);
        if (dir == nullptr) {
            LOG("ErrInfo: VFS error with DAC or Capability");
            exitCode = 1;
        } else {
            closedir(dir);
        }
        // Step 4: The sub process exit with the exitCode
        exit(exitCode);
    } else {
        int status = 0;
        // Step 5: The parent process wait for the sub process to exit and obtain the exitCode
        waitpid(pid, &status, 0);
        EXPECT_NE(WIFEXITED(status), 0) << "ErrInfo: The sub process exit error, child_pid = " << pid;
        EXPECT_EQ(WEXITSTATUS(status), 0) << "ErrInfo: The exitCode is wrong, please query logs, child_pid = " << pid;
    }
}
#endif