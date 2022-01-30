/**
 * Copyright (c) 2020-2021 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */


#include <cstdio>
#include <cstdlib>
#include <fstream>
#include <gtest/gtest.h>
#include <sstream>
#include <string>

#include "zlib.h"

using namespace std;
using namespace testing::ext;
namespace {
static const char DICTIONARY[] = "hello";
static const char GARBAGE[] = "garbage";
static const char TESTFILE[] = "foo.gz";
static char HELLO[] = "hello, hello!";
static unsigned int CALLOC_SIZE = 1;
static int FOUR = 4;
static int SIX = 6;
static int EIGHT = 8;
}

class ZlibCppTest : public testing::Test {
protected:
    ZlibCppTest();
    ~ZlibCppTest();
    static void SetUpTestCase();
    static void TearDownTestCase();
};

ZlibCppTest::ZlibCppTest()
{}

ZlibCppTest::~ZlibCppTest()
{}

void ZlibCppTest::SetUpTestCase()
{}

void ZlibCppTest::TearDownTestCase()
{}

/**
 * @tc.number    : ZlibCppTest_0100
 * @tc.name      : Test compress and uncompress test
 * @tc.desc      : [C- SOFTWARE -0200]
 */
HWTEST_F(ZlibCppTest, ZlibCppTestCompress, Function | MediumTest | Level2)
{
#ifdef Z_SOLO
    fprintf(stderr, "*********ZlibCppTestCompress Z_SOLO**********\n");
#else
    Byte *compr, *uncompr;
    uLong comprLen = 10000 * sizeof(int); /* don't overflow on MSDOS */
    uLong uncomprLen = comprLen;
    compr = static_cast<Byte*>(calloc(static_cast<uInt>(comprLen), CALLOC_SIZE));
    uncompr = static_cast<Byte*>(calloc(static_cast<uInt>(uncomprLen), CALLOC_SIZE));
    ASSERT_TRUE(compr != Z_NULL && uncompr != Z_NULL);

    int err;
    uLong len = static_cast<uLong>(strlen(HELLO)) + 1;
    err = compress(compr, &comprLen, reinterpret_cast<const Bytef*>(HELLO), len);
    fprintf(stderr, "compress error: %d\n", err);
    ASSERT_EQ(err, Z_OK);

    strcpy(reinterpret_cast<char *>(uncompr), GARBAGE);
    err = uncompress(uncompr, &uncomprLen, compr, comprLen);
    fprintf(stderr, "uncompress error: %d\n", err);
    ASSERT_EQ(err, Z_OK);
    fprintf(stderr, "uncompress: %s\n", reinterpret_cast<char *>(uncompr));
    free(compr);
    free(uncompr);
#endif
}

/**
 * @tc.number    : ZlibCppTest_0200
 * @tc.name      : Test gzio
 * @tc.desc      : [C- SOFTWARE -0200]
 */
HWTEST_F(ZlibCppTest, ZlibCppTestGzio, Function | MediumTest | Level2)
{
#ifdef Z_SOLO
    fprintf(stderr, "*********ZlibCppTestGzio Z_SOLO**********\n");
#else
    int err;
    int len = static_cast<int>(strlen(HELLO)) + 1;
    gzFile file;
    z_off_t pos;
    file = gzopen(TESTFILE, "wb");
    ASSERT_TRUE(file != NULL);

    gzputc(file, 'h');
    ASSERT_TRUE(gzputs(file, "ello") == FOUR);
    if (gzprintf(file, ", %s!", "hello") != EIGHT) {
        fprintf(stderr, "gzprintf err: %s\n", gzerror(file, &err));
        ASSERT_TRUE(false);
    }

    gzseek(file, 1L, SEEK_CUR); /* add one zero byte */
    gzclose(file);
    file = gzopen(TESTFILE, "rb");
    ASSERT_TRUE(file != NULL);

    Byte *compr, *uncompr;
    uLong comprLen = 10000 * sizeof(int); /* don't overflow on MSDOS */
    uLong uncomprLen = comprLen;
    compr = static_cast<Byte*>(calloc(static_cast<uInt>(comprLen), CALLOC_SIZE));
    uncompr = static_cast<Byte*>(calloc(static_cast<uInt>(uncomprLen), CALLOC_SIZE));
    ASSERT_TRUE(compr != Z_NULL && uncompr != Z_NULL);

    strcpy(reinterpret_cast<char *>(uncompr), GARBAGE);
    ASSERT_TRUE(gzread(file, uncompr, static_cast<unsigned>(uncomprLen)) == len);
    ASSERT_FALSE(strcmp(reinterpret_cast<char *>(uncompr), HELLO));

    pos = gzseek(file, -8L, SEEK_CUR);
    ASSERT_FALSE(pos != SIX || gztell(file) != pos);
    ASSERT_FALSE(gzgetc(file) != ' ');
    ASSERT_FALSE(gzungetc(' ', file) != ' ');

    fprintf(stderr, "gzgets\n");
    gzgets(file, reinterpret_cast<char *>(uncompr), static_cast<int>(uncomprLen));
    ASSERT_FALSE(strcmp(reinterpret_cast<char *>(uncompr), HELLO + SIX));
    gzclose(file);
    free(compr);
    free(uncompr);
#endif
}

/**
 * @tc.number    : ZlibCppTest_0300
 * @tc.name      : Test deflate
 * @tc.desc      : [C- SOFTWARE -0200]
 */
HWTEST_F(ZlibCppTest, ZlibCppTestDeflate, Function | MediumTest | Level2)
{
    Byte *compr;
    uLong comprLen = 10000 * sizeof(int);
    compr = static_cast<Byte*>(calloc(static_cast<uInt>(comprLen), CALLOC_SIZE));
    ASSERT_TRUE(compr != Z_NULL);

    z_stream c_stream; /* compression stream */
    int err;
    uLong len = static_cast<uLong>(strlen(HELLO)) + 1;
    c_stream.zalloc = nullptr;
    c_stream.zfree = nullptr;
    c_stream.opaque = nullptr;
    err = deflateInit(&c_stream, Z_DEFAULT_COMPRESSION);
    fprintf(stderr, "deflateInit result: %d\n", err);
    ASSERT_EQ(err, Z_OK);

    c_stream.next_in  = reinterpret_cast<z_const unsigned char *>(HELLO);
    c_stream.next_out = compr;
    fprintf(stderr, "deflate\n");
    while (c_stream.total_in != len && c_stream.total_out < comprLen) {
        c_stream.avail_in = c_stream.avail_out = 1; /* force small buffers */
        err = deflate(&c_stream, Z_NO_FLUSH);
        fprintf(stderr, "deflate result: %d\n", err);
        ASSERT_EQ(err, Z_OK);
    }

    for (;;) {
        c_stream.avail_out = 1;
        err = deflate(&c_stream, Z_FINISH);
        fprintf(stderr, "deflate result: %d\n", err);
        if (err == Z_STREAM_END) {
            break;
        }
        ASSERT_EQ(err, Z_OK);
    }

    err = deflateEnd(&c_stream);
    fprintf(stderr, "deflateEnd result: %d\n", err);
    ASSERT_EQ(err, Z_OK);
    free(compr);
}

/**
 * @tc.number    : ZlibCppTest_0400
 * @tc.name      : Test inflate
 * @tc.desc      : [C- SOFTWARE -0200]
 */
HWTEST_F(ZlibCppTest, ZlibCppTestInflate, Function | MediumTest | Level2)
{
    Byte *compr, *uncompr;
    uLong comprLen = 10000 * sizeof(int); /* don't overflow on MSDOS */
    uLong uncomprLen = comprLen;
    compr = static_cast<Byte*>(calloc(static_cast<uInt>(comprLen), CALLOC_SIZE));
    uncompr = static_cast<Byte*>(calloc(static_cast<uInt>(uncomprLen), CALLOC_SIZE));
    ASSERT_TRUE(compr != Z_NULL && uncompr != Z_NULL);

    int err;
    z_stream d_stream; /* decompression stream */
    strcpy(reinterpret_cast<char *>(uncompr), GARBAGE);
    d_stream.zalloc = nullptr;
    d_stream.zfree = nullptr;
    d_stream.opaque = nullptr;
    d_stream.next_in  = compr;
    d_stream.avail_in = 0;
    d_stream.next_out = uncompr;
    err = inflateInit(&d_stream);
    fprintf(stderr, "inflateInit result: %d\n", err);
    ASSERT_EQ(err, Z_OK);

    while (d_stream.total_out < uncomprLen && d_stream.total_in < comprLen) {
        d_stream.avail_in = d_stream.avail_out = 1; /* force small buffers */
        err = inflate(&d_stream, Z_NO_FLUSH);
        if (err == Z_STREAM_END || err == Z_DATA_ERROR) {
            break;
        }
        fprintf(stderr, "inflate result: %d\n", err);
        ASSERT_EQ(err, Z_OK);
    }

    fprintf(stderr, "inflateEnd result: %d\n", inflateEnd(&d_stream));
    free(compr);
    free(uncompr);
}

/**
 * @tc.number    : ZlibCppTest_0500
 * @tc.name      : Test deflate with large buffers and dynamic change of compression level
 * @tc.desc      : [C- SOFTWARE -0200]
 */
HWTEST_F(ZlibCppTest, ZlibCppTestLargeDeflate, Function | MediumTest | Level2)
{
    Byte *compr, *uncompr;
    uLong comprLen = 10000 * sizeof(int); /* don't overflow on MSDOS */
    uLong uncomprLen = comprLen;
    compr = static_cast<Byte*>(calloc(static_cast<uInt>(comprLen), CALLOC_SIZE));
    uncompr = static_cast<Byte*>(calloc(static_cast<uInt>(uncomprLen), CALLOC_SIZE));
    ASSERT_TRUE(compr != Z_NULL && uncompr != Z_NULL);

    z_stream c_stream; /* compression stream */
    int err;
    c_stream.zalloc = nullptr;
    c_stream.zfree = nullptr;
    c_stream.opaque = nullptr;

    err = deflateInit(&c_stream, Z_BEST_SPEED);
    fprintf(stderr, "deflateInit result: %d\n", err);
    ASSERT_EQ(err, Z_OK);

    c_stream.next_out = compr;
    c_stream.avail_out = static_cast<uInt>(comprLen);

    /* At this point, uncompr is still mostly zeroes, so it should compress
     * very well:
     */
    c_stream.next_in = uncompr;
    c_stream.avail_in = static_cast<uInt>(uncomprLen);
    err = deflate(&c_stream, Z_NO_FLUSH);
    fprintf(stderr, "deflate result: %d\n", err);
    ASSERT_EQ(err, Z_OK);
    ASSERT_TRUE(c_stream.avail_in == 0);

    /* Feed in already compressed data and switch to no compression: */
    deflateParams(&c_stream, Z_NO_COMPRESSION, Z_DEFAULT_STRATEGY);
    c_stream.next_in = compr;
    c_stream.avail_in = static_cast<uInt>(comprLen) / 2;
    err = deflate(&c_stream, Z_NO_FLUSH);
    fprintf(stderr, "deflate result: %d\n", err);
    ASSERT_EQ(err, Z_OK);

    /* Switch back to compressing mode: */
    deflateParams(&c_stream, Z_BEST_COMPRESSION, Z_FILTERED);
    c_stream.next_in = uncompr;
    c_stream.avail_in = static_cast<uInt>(uncomprLen);
    err = deflate(&c_stream, Z_NO_FLUSH);
    ASSERT_EQ(err, Z_OK);

    err = deflate(&c_stream, Z_FINISH);
    ASSERT_EQ(err, Z_STREAM_END);

    err = deflateEnd(&c_stream);
    ASSERT_EQ(err, Z_OK);
    free(compr);
    free(uncompr);
}

/**
 * @tc.number    : ZlibCppTest_0600
 * @tc.name      : Test inflate with large buffers
 * @tc.desc      : [C- SOFTWARE -0200]
 */
HWTEST_F(ZlibCppTest, ZlibCppTestLargeInflate, Function | MediumTest | Level2)
{
    Byte *compr, *uncompr;
    uLong comprLen = 10000 * sizeof(int); /* don't overflow on MSDOS */
    uLong uncomprLen = comprLen;
    compr = static_cast<Byte*>(calloc(static_cast<uInt>(comprLen), CALLOC_SIZE));
    uncompr = static_cast<Byte*>(calloc(static_cast<uInt>(uncomprLen), CALLOC_SIZE));
    ASSERT_TRUE(compr != Z_NULL && uncompr != Z_NULL);

    int err;
    z_stream d_stream; /* decompression stream */
    strcpy(reinterpret_cast<char *>(uncompr), GARBAGE);
    d_stream.zalloc = nullptr;
    d_stream.zfree = nullptr;
    d_stream.opaque = nullptr;
    d_stream.next_in  = compr;
    d_stream.avail_in = static_cast<uInt>(comprLen);
    err = inflateInit(&d_stream);
    ASSERT_EQ(err, Z_OK);

    for (;;) {
        d_stream.next_out = uncompr;            /* discard the output */
        d_stream.avail_out = static_cast<uInt>(uncomprLen);
        err = inflate(&d_stream, Z_NO_FLUSH);
        if (err == Z_STREAM_END || err == Z_DATA_ERROR) {
            break;
        }
        ASSERT_EQ(err, Z_OK);
    }

    err = inflateEnd(&d_stream);
    ASSERT_EQ(err, Z_OK);
    free(compr);
    free(uncompr);
}

/**
 * @tc.number    : ZlibCppTest_0700
 * @tc.name      : Test deflate with full flush
 * @tc.desc      : [C- SOFTWARE -0200]
 */
HWTEST_F(ZlibCppTest, ZlibCppTestFlush, Function | MediumTest | Level2)
{
    Byte *compr;
    uLong comprLen = 10000 * sizeof(int);
    compr = static_cast<Byte*>(calloc(static_cast<uInt>(comprLen), CALLOC_SIZE));
    ASSERT_TRUE(compr != Z_NULL);

    z_stream c_stream; /* compression stream */
    int err;
    uInt len = static_cast<uInt>(strlen(HELLO)) + 1;
    c_stream.zalloc = nullptr;
    c_stream.zfree = nullptr;
    c_stream.opaque = nullptr;
    err = deflateInit(&c_stream, Z_DEFAULT_COMPRESSION);
    ASSERT_EQ(err, Z_OK);

    c_stream.next_in  = reinterpret_cast<z_const unsigned char *>(HELLO);
    c_stream.next_out = compr;
    c_stream.avail_in = 3;
    c_stream.avail_out = static_cast<uInt>(comprLen);
    err = deflate(&c_stream, Z_FULL_FLUSH);
    ASSERT_EQ(err, Z_OK);

    compr[3]++; /* force an error in first compressed block */
    c_stream.avail_in = len - 3;
    err = deflate(&c_stream, Z_FINISH);
    if (err != Z_STREAM_END) {
        ASSERT_EQ(err, Z_OK);
    }

    err = deflateEnd(&c_stream);
    ASSERT_EQ(err, Z_OK);
    comprLen = c_stream.total_out;
    free(compr);
}

/**
 * @tc.number    : ZlibCppTest_0800
 * @tc.name      : Test inflateSync
 * @tc.desc      : [C- SOFTWARE -0200]
 */
HWTEST_F(ZlibCppTest, ZlibCppTestSync, Function | MediumTest | Level2)
{
    Byte *compr, *uncompr;
    uLong comprLen = 10000 * sizeof(int); /* don't overflow on MSDOS */
    uLong uncomprLen = comprLen;
    compr = static_cast<Byte*>(calloc(static_cast<uInt>(comprLen), CALLOC_SIZE));
    uncompr = static_cast<Byte*>(calloc(static_cast<uInt>(uncomprLen), CALLOC_SIZE));
    ASSERT_TRUE(compr != Z_NULL && uncompr != Z_NULL);

    int err;
    z_stream d_stream; /* decompression stream */
    strcpy(reinterpret_cast<char *>(uncompr), GARBAGE);
    d_stream.zalloc = nullptr;
    d_stream.zfree = nullptr;
    d_stream.opaque = nullptr;
    d_stream.next_in  = compr;
    d_stream.avail_in = 2; /* just read the zlib header */
    err = inflateInit(&d_stream);
    ASSERT_EQ(err, Z_OK);

    d_stream.next_out = uncompr;
    d_stream.avail_out = static_cast<uInt>(uncomprLen);

    inflate(&d_stream, Z_NO_FLUSH);
    d_stream.avail_in = static_cast<uInt>(comprLen) - 2;   /* read all compressed data */
    inflateSync(&d_stream);
    inflate(&d_stream, Z_FINISH);
    inflateEnd(&d_stream);
    printf("after inflateSync: hel%s\n", reinterpret_cast<char *>(uncompr));
    free(compr);
    free(uncompr);
}

/**
 * @tc.number    : ZlibCppTest_0900
 * @tc.name      : Test deflate with preset dictionary
 * @tc.desc      : [C- SOFTWARE -0200]
 */
HWTEST_F(ZlibCppTest, ZlibCppTestDictDeflate, Function | MediumTest | Level2)
{
    Byte *compr, *uncompr;
    uLong comprLen = 10000 * sizeof(int); /* don't overflow on MSDOS */
    uLong uncomprLen = comprLen;
    compr = static_cast<Byte*>(calloc(static_cast<uInt>(comprLen), CALLOC_SIZE));
    uncompr = static_cast<Byte*>(calloc(static_cast<uInt>(uncomprLen), CALLOC_SIZE));
    ASSERT_TRUE(compr != Z_NULL && uncompr != Z_NULL);

    z_stream c_stream; /* compression stream */
    int err;
    c_stream.zalloc = nullptr;
    c_stream.zfree = nullptr;
    c_stream.opaque = nullptr;
    err = deflateInit(&c_stream, Z_BEST_COMPRESSION);
    ASSERT_EQ(err, Z_OK);

    err = deflateSetDictionary(&c_stream,
                reinterpret_cast<const Bytef*>(DICTIONARY), static_cast<int>(sizeof(DICTIONARY)));
    ASSERT_EQ(err, Z_OK);

    c_stream.next_out = compr;
    c_stream.avail_out = static_cast<uInt>(comprLen);
    c_stream.next_in  = reinterpret_cast<z_const unsigned char *>(HELLO);
    c_stream.avail_in = static_cast<uInt>(strlen(HELLO)) + 1;
    err = deflate(&c_stream, Z_FINISH);
    ASSERT_EQ(err, Z_STREAM_END);

    err = deflateEnd(&c_stream);
    ASSERT_EQ(err, Z_OK);
    free(compr);
    free(uncompr);
}

/**
 * @tc.number    : ZlibCppTest_1000
 * @tc.name      : Test inflate with a preset dictionary
 * @tc.desc      : [C- SOFTWARE -0200]
 */
HWTEST_F(ZlibCppTest, ZlibCppTestDictInflate, Function | MediumTest | Level2)
{
    Byte *compr, *uncompr;
    uLong comprLen = 10000 * sizeof(int); /* don't overflow on MSDOS */
    uLong uncomprLen = comprLen;
    compr = static_cast<Byte*>(calloc(static_cast<uInt>(comprLen), CALLOC_SIZE));
    uncompr = static_cast<Byte*>(calloc(static_cast<uInt>(uncomprLen), CALLOC_SIZE));
    ASSERT_TRUE(compr != Z_NULL && uncompr != Z_NULL);

    int err;
    z_stream d_stream; /* decompression stream */
    strcpy(reinterpret_cast<char *>(uncompr), GARBAGE);
    d_stream.zalloc = nullptr;
    d_stream.zfree = nullptr;
    d_stream.opaque = nullptr;
    d_stream.next_in  = compr;
    d_stream.avail_in = static_cast<uInt>(comprLen);
    err = inflateInit(&d_stream);
    ASSERT_EQ(err, Z_OK);
    d_stream.next_out = uncompr;
    d_stream.avail_out = static_cast<uInt>(uncomprLen);
    for (;;) {
        err = inflate(&d_stream, Z_NO_FLUSH);
        if (err == Z_STREAM_END) {
            break;
        }
        if (err == Z_NEED_DICT) {
            err = inflateSetDictionary(
                &d_stream, reinterpret_cast<const Bytef*>(DICTIONARY), static_cast<int>(sizeof(DICTIONARY)));
        }
        if (err == Z_DATA_ERROR) {
            break;
        }
        ASSERT_EQ(err, Z_OK);
    }

    err = inflateEnd(&d_stream);
    ASSERT_EQ(err, Z_OK);
    if (strcmp(reinterpret_cast<char *>(uncompr), HELLO)) {
        fprintf(stderr, "bad inflate with dict\n");
    } else {
        printf("inflate with dictionary: %s\n", reinterpret_cast<char *>(uncompr));
    }

    free(compr);
    free(uncompr);
}