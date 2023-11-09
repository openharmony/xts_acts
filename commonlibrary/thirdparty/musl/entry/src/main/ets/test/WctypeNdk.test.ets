/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use thisw file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * diswtributed under the License isw diswtributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permiswsions and
 * limitations under the License.
 */

import { describe, expect, it } from '@ohos/hypium'
import wctype from 'libwctypendk.so'

export default function wctypeNdkTest() {
  describe('MuslWctypeTest', () => {

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISALNUM_0100
     * @tc.name       : testMuslWctypeIswalnum001
     * @tc.desc       : test iswalnum
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testMuslWctypeIswalnum001", 0, async (done: Function) => {
      let b = '1'
      let a = wctype.iswalnum(b);
      expect(a).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISALNUM_0200
     * @tc.name       : testMuslWctypeIswalnum002
     * @tc.desc       : test iswalnum
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testMuslWctypeIswalnum002", 0, async (done: Function) => {
      let b = 'a'
      let a = wctype.iswalnum(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISALNUM_0300
     * @tc.name       : testMuslWctypeIswalnum003
     * @tc.desc       : test iswalnum
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testMuslWctypeIswalnum003", 0, async (done: Function) => {
      let b = '?'
      let a = wctype.iswalnum(b);
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISALNUM_L_0100
     * @tc.name       : testMuslWctypeIswalnumL001
     * @tc.desc       : test iswalnumL
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testMuslWctypeIswalnumL001", 0, async (done: Function) => {
      let b = '1'
      let a = wctype.iswalnumL(b);
      expect(a).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISALNUM_L_0200
     * @tc.name       : testMuslWctypeIswalnumL002
     * @tc.desc       : test iswalnumL
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testMuslWctypeIswalnumL002", 0, async (done: Function) => {
      let b = 'a'
      let a = wctype.iswalnumL(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISALNUM_L_0300
     * @tc.name       : testMuslWctypeIswalnumL003
     * @tc.desc       : test iswalnumL
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testMuslWctypeIswalnumL003", 0, async (done: Function) => {
      let b = '?'
      let a = wctype.iswalnumL(b);
      expect(a).assertEqual(0);
      done()
    });


    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISALPHA_0100
     * @tc.name       : testMuslWctypeIswalpha001
     * @tc.desc       : test iswalpha
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testMuslWctypeIswalpha001", 0, async (done: Function) => {
      let b = '1'
      let a = wctype.iswalpha(b);
      expect(a).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISALPHA_0200
     * @tc.name       : testMuslWctypeIswalpha002
     * @tc.desc       : test iswalpha
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testMuslWctypeIswalpha002", 0, async (done: Function) => {
      let b = 'a'
      let a = wctype.iswalpha(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISALPHA_0300
     * @tc.name       : testMuslWctypeIswalpha003
     * @tc.desc       : test iswalpha
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testMuslWctypeIswalpha003", 0, async (done: Function) => {
      let b = '?'
      let a = wctype.iswalpha(b);
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISALPHA_L_0100
     * @tc.name       : testMuslWctypeIswalphaL001
     * @tc.desc       : test iswalphal
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testMuslWctypeIswalphaL001", 0, async (done: Function) => {
      let b = '1'
      let a = wctype.iswalphaL(b);
      expect(a).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISALPHA_L_0200
     * @tc.name       : testMuslWctypeIswalphaL002
     * @tc.desc       : test iswalphal
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testMuslWctypeIswalphaL002", 0, async (done: Function) => {
      let b = 'a'
      let a = wctype.iswalphaL(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISALPHA_L_0300
     * @tc.name       : testMuslWctypeIswalphaL003
     * @tc.desc       : test iswalphal
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testMuslWctypeIswalphaL003", 0, async (done: Function) => {
      let b = '!'
      let a = wctype.iswalphaL(b);
      expect(a).assertEqual(0);
      done()
    });


    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISBLANK_0100
     * @tc.name       : testMuslWctypeIswblank001
     * @tc.desc       : test iswblank
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testMuslWctypeIswblank001", 0, async (done: Function) => {
      let b = 'a'
      let a = wctype.iswblank(b);
      expect(a).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISBLANK_0200
     * @tc.name       : testMuslWctypeIswblank002
     * @tc.desc       : test iswblank
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testMuslWctypeIswblank002", 0, async (done: Function) => {
      let b = ' '
      let a = wctype.iswblank(b);
      expect(a).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISBLANK_L_0100
     * @tc.name       : testMuslWctypeIswblankL001
     * @tc.desc       : test iswblankl
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testMuslWctypeIswblankL001", 0, async (done: Function) => {
      let b = 'a'
      let a = wctype.iswblankL(b);
      expect(a).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISBLANK_L_0200
     * @tc.name       : testMuslWctypeIswblankL002
     * @tc.desc       : test iswblankl
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testMuslWctypeIswblankL002", 0, async (done: Function) => {
      let b = ' '
      let a = wctype.iswblankL(b);
      expect(a).assertEqual(1);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISCNTRL_0100
     * @tc.name       : testMuslWctypeIswcntrl001
     * @tc.desc       : test iswcntrl
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testMuslWctypeIswcntrl001", 0, async (done: Function) => {
      let b = 0
      let a = wctype.iswcntrl(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISCNTRL_0200
     * @tc.name       : testMuslWctypeIswcntrl002
     * @tc.desc       : test iswcntrl
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testMuslWctypeIswcntrl002", 0, async (done: Function) => {
      let b = 31
      let a = wctype.iswcntrl(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISCNTRL_0300
     * @tc.name       : testMuslWctypeIswcntrl003
     * @tc.desc       : test iswcntrl
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testMuslWctypeIswcntrl003", 0, async (done: Function) => {
      let b = 127
      let a = wctype.iswcntrl(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISCNTRL_0400
     * @tc.name       : testMuslWctypeIswcntrl004
     * @tc.desc       : test iswcntrl
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testMuslWctypeIswcntrl004", 0, async (done: Function) => {
      let b = 32
      let a = wctype.iswcntrl(b);
      expect(a).assertEqual(0);
      done()
    });


    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISCNTRL_L_0100
     * @tc.name       : testMuslWctypeIswcntrlL001
     * @tc.desc       : test iswcntrll
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testMuslWctypeIswcntrlL001", 0, async (done: Function) => {
      let b = 0
      let a = wctype.iswcntrlL(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISCNTRL_L_0200
     * @tc.name       : testMuslWctypeIswcntrlL002
     * @tc.desc       : test iswcntrll
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testMuslWctypeIswcntrlL002", 0, async (done: Function) => {
      let b = 31
      let a = wctype.iswcntrlL(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISCNTRL_L_0300
     * @tc.name       : testMuslWctypeIswcntrlL003
     * @tc.desc       : test iswcntrll
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testMuslWctypeIswcntrlL003", 0, async (done: Function) => {
      let b = 127
      let a = wctype.iswcntrlL(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISCNTRL_L_0400
     * @tc.name       : testMuslWctypeIswcntrlL004
     * @tc.desc       : test iswcntrll
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testMuslWctypeIswcntrlL004", 0, async (done: Function) => {
      let b = 32
      let a = wctype.iswcntrlL(b);
      expect(a).assertEqual(0);
      done()
    });


    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISDIGIT_0100
     * @tc.name       : testMuslWctypeIswdigit001
     * @tc.desc       : test iswdigit
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testMuslWctypeIswdigit001", 0, async (done: Function) => {
      let b = '1'
      let a = wctype.iswdigit(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISDIGIT_0200
     * @tc.name       : testMuslWctypeIswdigit002
     * @tc.desc       : test iswdigit
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testMuslWctypeIswdigit002", 0, async (done: Function) => {
      let b = 'a'
      let a = wctype.iswdigit(b);
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISDIGIT_L_0100
     * @tc.name       : testMuslWctypeIswdigitL001
     * @tc.desc       : test iswdigitl
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testMuslWctypeIswdigitL001", 0, async (done: Function) => {
      let b = '1'
      let a = wctype.iswdigitL(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISDIGIT_L_0200
     * @tc.name       : testMuslWctypeIswdigitL002
     * @tc.desc       : test iswdigitl
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testMuslWctypeIswdigitL002", 0, async (done: Function) => {
      let b = 'a'
      let a = wctype.iswdigitL(b);
      expect(a).assertEqual(0);
      done()
    });


    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISGRAPH_L_0100
     * @tc.name       : testMuslWctypeIswgraphL001
     * @tc.desc       : test iswgraphl
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testMuslWctypeIswgraphL001", 0, async (done: Function) => {
      let b = '2'
      let a = wctype.iswgraphL(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISGRAPH_L_0200
     * @tc.name       : testMuslWctypeIswgraphL002
     * @tc.desc       : test iswgraphl
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testMuslWctypeIswgraphL002", 0, async (done: Function) => {
      let b = 'b'
      let a = wctype.iswgraphL(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISGRAPH_L_0300
     * @tc.name       : testMuslWctypeIswgraphL003
     * @tc.desc       : test iswgraphl
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testMuslWctypeIswgraphL003", 0, async (done: Function) => {
      let b = ' '
      let a = wctype.iswgraphL(b);
      expect(a).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISGRAPH_0100
     * @tc.name       : testMuslWctypeIswgraph001
     * @tc.desc       : test iswgraph
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testMuslWctypeIswgraph001", 0, async (done: Function) => {
      let b = '2'
      let a = wctype.iswgraph(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISGRAPH_0200
     * @tc.name       : testMuslWctypeIswgraph002
     * @tc.desc       : test iswgraph
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testMuslWctypeIswgraph002", 0, async (done: Function) => {
      let b = 'b'
      let a = wctype.iswgraph(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISGRAPH_0300
     * @tc.name       : testMuslWctypeIswgraph003
     * @tc.desc       : test iswgraph
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testMuslWctypeIswgraph003", 0, async (done: Function) => {
      let b = ' '
      let a = wctype.iswgraph(b);
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISLOWER_0100
     * @tc.name       : testMuslWctypeIswlower001
     * @tc.desc       : test iswlower
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testMuslWctypeIswlower001", 0, async (done: Function) => {
      let b = 'b'
      let a = wctype.iswlower(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISLOWER_0200
     * @tc.name       : testMuslWctypeIswlower002
     * @tc.desc       : test iswlower
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testMuslWctypeIswlower002", 0, async (done: Function) => {
      let b = 'B'
      let a = wctype.iswlower(b);
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISLOWER_L_0100
     * @tc.name       : testMuslWctypeIswlowerL001
     * @tc.desc       : test iswlowerl
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testMuslWctypeIswlowerL001", 0, async (done: Function) => {
      let b = 'b'
      let a = wctype.iswlowerL(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISLOWER_L_0200
     * @tc.name       : testMuslWctypeIswlowerL002
     * @tc.desc       : test iswlowerl
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testMuslWctypeIswlowerL002", 0, async (done: Function) => {
      let b = 'B'
      let a = wctype.iswlowerL(b);
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISPRINT_0100
     * @tc.name       : testMuslWctypeIswprint001
     * @tc.desc       : test iswprint
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testMuslWctypeIswprint001", 0, async (done: Function) => {
      let b = '3'
      let a = wctype.iswprint(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISPRINT_0200
     * @tc.name       : testMuslWctypeIswprint002
     * @tc.desc       : test iswprint
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testMuslWctypeIswprint002", 0, async (done: Function) => {
      let b = 'c'
      let a = wctype.iswprint(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISPRINT_0300
     * @tc.name       : testMuslWctypeIswprint003
     * @tc.desc       : test iswprint
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testMuslWctypeIswprint003", 0, async (done: Function) => {
      let b = ' '
      let a = wctype.iswprint(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISPRINT_0400
     * @tc.name       : testMuslWctypeIswprint004
     * @tc.desc       : test iswprint
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testMuslWctypeIswprint004", 0, async (done: Function) => {
      let b = '\t'
      let a = wctype.iswprint(b);
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISPRINT_L_0100
     * @tc.name       : testMuslWctypeIswprintL001
     * @tc.desc       : test iswprintl
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testMuslWctypeIswprintL001", 0, async (done: Function) => {
      let b = '3'
      let a = wctype.iswprintL(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISPRINT_L_0200
     * @tc.name       : testMuslWctypeIswprintL002
     * @tc.desc       : test iswprintl
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testMuslWctypeIswprintL002", 0, async (done: Function) => {
      let b = 'c'
      let a = wctype.iswprintL(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISPRINT_L_0300
     * @tc.name       : testMuslWctypeIswprintL003
     * @tc.desc       : test iswprintl
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testMuslWctypeIswprintL003", 0, async (done: Function) => {
      let b = ' '
      let a = wctype.iswprintL(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISPRINT_L_0400
     * @tc.name       : testMuslWctypeIswprintL004
     * @tc.desc       : test iswprintl
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testMuslWctypeIswprintL004", 0, async (done: Function) => {
      let b = '\t'
      let a = wctype.iswprintL(b);
      expect(a).assertEqual(0);
      done()
    });


    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISPUNCT_0100
     * @tc.name       : testMuslWctypeIswpunct001
     * @tc.desc       : test iswpunct
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testMuslWctypeIswpunct001", 0, async (done: Function) => {
      let b = '/'
      let a = wctype.iswpunct(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISPUNCT_0200
     * @tc.name       : testMuslWctypeIswpunct002
     * @tc.desc       : test iswpunct
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testMuslWctypeIswpunct002", 0, async (done: Function) => {
      let b = 'a'
      let a = wctype.iswpunct(b);
      expect(a).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISPUNCT_L_0100
     * @tc.name       : testMuslWctypeIswpunctL001
     * @tc.desc       : test iswpunctl
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testMuslWctypeIswpunctL001", 0, async (done: Function) => {
      let b = '/'
      let a = wctype.iswpunctL(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISPUNCT_L_0200
     * @tc.name       : testMuslWctypeIswpunctL002
     * @tc.desc       : test iswpunctl
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testMuslWctypeIswpunctL002", 0, async (done: Function) => {
      let b = 'a'
      let a = wctype.iswpunctL(b);
      expect(a).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISSPACE_0100
     * @tc.name       : testMuslWctypeIswspace001
     * @tc.desc       : test iswspace
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testMuslWctypeIswspace001", 0, async (done: Function) => {
      let b = '\v'
      let a = wctype.iswspace(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISSPACE_0200
     * @tc.name       : testMuslWctypeIswspace002
     * @tc.desc       : test iswspace
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testMuslWctypeIswspace002", 0, async (done: Function) => {
      let b = 'v'
      let a = wctype.iswspace(b);
      expect(a).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISSPACE_L_0100
     * @tc.name       : testMuslWctypeIswspaceL001
     * @tc.desc       : test iswspacel
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testMuslWctypeIswspaceL001", 0, async (done: Function) => {
      let b = '\v'
      let a = wctype.iswspaceL(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISSPACE_L_0200
     * @tc.name       : testMuslWctypeIswspaceL002
     * @tc.desc       : test iswspacel
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testMuslWctypeIswspaceL002", 0, async (done: Function) => {
      let b = 'v'
      let a = wctype.iswspaceL(b);
      expect(a).assertEqual(0);
      done()
    });


    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISUPPER_L_0100
     * @tc.name       : testMuslWctypeIswupperL001
     * @tc.desc       : test iswupperl
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testMuslWctypeIswupperL001", 0, async (done: Function) => {
      let b = 'A'
      let a = wctype.iswupperL(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISUPPER_L_0200
     * @tc.name       : testMuslWctypeIswupperL002
     * @tc.desc       : test iswupperl
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testMuslWctypeIswupperL002", 0, async (done: Function) => {
      let b = 'a'
      let a = wctype.iswupperL(b);
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISUPPER_0100
     * @tc.name       : testMuslWctypeIswupper001
     * @tc.desc       : test iswupper
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testMuslWctypeIswupper001", 0, async (done: Function) => {
      let b = 'A'
      let a = wctype.iswupper(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISUPPER_0200
     * @tc.name       : testMuslWctypeIswupper002
     * @tc.desc       : test iswupper
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testMuslWctypeIswupper002", 0, async (done: Function) => {
      let b = 'a'
      let a = wctype.iswupper(b);
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISWCTYPE_0100
     * @tc.name       : testMuslWctypeIswctype001
     * @tc.desc       : test iswctype
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testMuslWctypeIswctype001", 0, async (done: Function) => {
      let b = 'A'
      let c = "upper"
      let a = wctype.iswctype(b, c);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISWCTYPE_0200
     * @tc.name       : testMuslWctypeIswctype002
     * @tc.desc       : test iswctype
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testMuslWctypeIswctype002", 0, async (done: Function) => {
      let b = 'a'
      let c = "upper"
      let a = wctype.iswctype(b, c);
      expect(a).assertEqual(0);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISWCTYPE_L_0100
     * @tc.name       : testMuslWctypeIswctypeL001
     * @tc.desc       : test iswctypel
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testMuslWctypeIswctypeL001", 0, async (done: Function) => {
      let b = 'A'
      let c = "upper"
      let a = wctype.iswctypeL(b, c);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISWCTYPE_L_0200
     * @tc.name       : testMuslWctypeIswctypeL002
     * @tc.desc       : test iswctypel
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testMuslWctypeIswctypeL002", 0, async (done: Function) => {
      let b = 'a'
      let c = "upper"
      let a = wctype.iswctypeL(b, c);
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISWXDIGIT_0100
     * @tc.name       : testMuslCtypeIswxdigit001
     * @tc.desc       : test iswxdigit
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testMuslCtypeIswxdigit001", 0, async (done: Function) => {
      let b = '6'
      let a = wctype.iswxdigit(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISWXDIGIT_0200
     * @tc.name       : testMuslCtypeIswxdigit002
     * @tc.desc       : test iswxdigit
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testMuslCtypeIswxdigit002", 0, async (done: Function) => {
      let b = 'L'
      let a = wctype.iswxdigit(b);
      expect(a).assertEqual(0);
      done()
    });

    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISWXDIGIT_L_0100
     * @tc.name       : testMuslCtypeIswxdigitL001
     * @tc.desc       : test iswxdigitl
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testMuslCtypeIswxdigitL001", 0, async (done: Function) => {
      let b = '6'
      let a = wctype.iswxdigitL(b);
      expect(a).assertEqual(1);
      done()
    });
    /**
     * @tc.number     : SUB_THIRDPARTY_MUSL_CTYPE_ISWXDIGIT_L_0200
     * @tc.name       : testMuslCtypeIswxdigitL002
     * @tc.desc       : test iswxdigitl
     * @tc.size       : MEDIUM
     * @tc.type       : Function
     * @tc.level      : Level 1
     */
    it("testMuslCtypeIswxdigitL002", 0, async (done: Function) => {
      let b = 'L'
      let a = wctype.iswxdigitL(b);
      expect(a).assertEqual(0);
      done()
    });

  })
}