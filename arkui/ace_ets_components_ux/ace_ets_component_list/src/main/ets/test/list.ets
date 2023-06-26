/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
export default function abilityTest() {
  /**
    * @tc.number ArkUX_Stage_List_Style_0100
    * @tc.name   Test the style attribute of the ListItem component and the style attribute of the
    *            ListItemGroup component
    * @tc.desc   Test setting the style parameter in ListItemGroup to ListItemGroupStyle.CARD,
    *            Does the style take effect after setting the style parameter in ListItem to ListItemStyle.CARD
    */

  describe('ActsAbilityTest', function () {
    it('ArkUX_Stage_List_Style_0100', 0, function (done) {
      setTimeout(() => {
        try {
          let left = JSON.stringify(JSON.parse(JSON.parse(getInspectorByKey("nurmal"))
            .$attrs.margin).left)
          let right = JSON.stringify(JSON.parse(JSON.parse(getInspectorByKey("nurmal"))
            .$attrs.margin).right)
          console.log("====> ArkUX_Stage_List_Style_0100 listItemLeft:" + left + "listItemRight:" + right)
          let listItemHeight = JSON.parse(getInspectorByKey("ArkUXII_List_style_0100"))
            .$attrs.size.height
          console.log("====> ArkUX_Stage_List_Style_0100 listItemHeight:" + listItemHeight)
          let listItemGroupLeft = JSON.stringify(JSON.parse(JSON.parse(getInspectorByKey("ListItemGroup"))
            .$attrs.margin).left)
          let listItemGroupRight = JSON.stringify(JSON.parse(JSON.parse(getInspectorByKey("ListItemGroup"))
            .$attrs.margin).right)
          console.log("====> ArkUX_Stage_List_Style_0100 listItemGroupLeft:" + listItemGroupLeft +
            "listItemGroupRight:" + listItemGroupRight)
          expect(listItemGroupLeft).assertEqual(left)
          expect(listItemGroupRight).assertEqual(right)
          expect(parseFloat(listItemHeight)).assertEqual(48);
          expect(listItemHeight.substr(listItemHeight.length-2, 2)).assertEqual("vp");
        } catch (err) {
          console.info('ArkUX_Stage_List_Style_0100 ERR  ' + JSON.stringify(err));
          expect().assertFail();
        }
        done()
      }, 500);
    })

    /** 
      * @tc.number ArkUX_Stage_List_Style_0200
      * @tc.name   Test the style attribute of the ListItem component and the style attribute of the
      *            ListItemGroup component
      * @tc.desc   Test setting the style parameter in ListItemGroup to ListItemGroupStyle.CARD,
      *            Does the style take effect after setting the style parameter in ListItem to ListItemStyle.CARD
      */

    it('ArkUX_Stage_List_Style_0200', 0, function (done) {
      setTimeout(() => {
        try {
          let left = JSON.stringify(JSON.parse(JSON.parse(getInspectorByKey("nurmal")).$attrs.margin).left)
          let right = JSON.stringify(JSON.parse(JSON.parse(getInspectorByKey("nurmal")).$attrs.margin).right)
          console.log("====> ArkUX_Stage_List_Style_0200 listItemLeft:" + left + "listItemRight:" + right)
          let listItemHeight = JSON.parse(getInspectorByKey("ListItem_ArkUXII_List_style_0200"))
            .$attrs.size.height
          console.log("====> ArkUX_Stage_List_Style_0200 listItemHeight:" + listItemHeight)
          let listItemGroupLeft = JSON.stringify(JSON.parse(JSON.parse(getInspectorByKey("ArkUXII_List_style_0200"))
            .$attrs.margin).left)
          let listItemGroupRight = JSON.stringify(JSON.parse(JSON.parse(getInspectorByKey("ArkUXII_List_style_0200"))
            .$attrs.margin).right)
          console.log("====> ArkUX_Stage_List_Style_0200 listItemGroupLeft:" + listItemGroupLeft +
            "listItemGroupRight:" + listItemGroupRight)
          expect(listItemGroupLeft).assertEqual(left)
          expect(listItemGroupRight).assertEqual(right)
          expect(parseFloat(listItemHeight)).assertEqual(48);
          expect(listItemHeight.substr(listItemHeight.length-2, 2)).assertEqual("vp");
        } catch (err) {
          expect().assertFail();
          console.info('ArkUX_Stage_List_Style_0200 ERR  ' + JSON.stringify(err));
        }
        done()
      },500);
    })
    
    /**
      * @tc.number ArkUX_Stage_List_Style_0300
      * @tc.name   Test the style attribute of the ListItem component and the style attribute of the
      *            ListItemGroup component
      * @tc.desc   Test setting the style parameter in ListItemGroup to ListItemGroupStyle.CARD,
      *            Does the style take effect after setting the style parameter in ListItem to ListItemStyle.NONE
      */

    it('ArkUX_Stage_List_Style_0300', 0, function (done) {
      try {
        let left = JSON.stringify(JSON.parse(JSON.parse(getInspectorByKey("nurmal")).$attrs.margin).left)
        let right = JSON.stringify(JSON.parse(JSON.parse(getInspectorByKey("nurmal")).$attrs.margin).right)
        console.log("====> ArkUX_Stage_List_Style_0300 listItemLeft:" + left + "listItemRight:" + right)
        let listItemHeight = JSON.parse(getInspectorByKey("ArkUXII_List_style_0300"))
          .$attrs.size.height
        console.log("====> ArkUX_Stage_List_Style_0300 listItemHeight:" + listItemHeight)
        let listItemGroupLeft = JSON.stringify(JSON.parse(JSON.parse(getInspectorByKey("ListItemGroup"))
          .$attrs.margin).left)
        let listItemGroupRight = JSON.stringify(JSON.parse(JSON.parse(getInspectorByKey("ListItemGroup"))
          .$attrs.margin).right)
        console.log("====> ArkUX_Stage_List_Style_0300 listItemGroupLeft:" + listItemGroupLeft +
          "listItemGroupRight:" + listItemGroupRight)
        expect(listItemGroupLeft).assertEqual(left)
        expect(listItemGroupRight).assertEqual(right)
        expect(parseFloat(listItemHeight)==48).assertFalse();
      } catch (err) {
        console.info('ArkUX_Stage_List_Style_0300 ERR  ' + JSON.stringify(err));
        expect().assertFail();
      }
      done()
    })

    /**
      * @tc.number ArkUX_Stage_List_Style_0400
      * @tc.name   Test the style attribute of the ListItem component and the style attribute of the
      *            ListItemGroup component
      * @tc.desc   Test setting the style parameter in ListItemGroup to ListItemGroupStyle.CARD,
      *            Does the style take effect after setting the style parameter in ListItem to null
      */

    it('ArkUX_Stage_List_Style_0400', 0, function (done) {
      try {
        let left = JSON.stringify(JSON.parse(JSON.parse(getInspectorByKey("nurmal")).$attrs.margin).left)
        let right = JSON.stringify(JSON.parse(JSON.parse(getInspectorByKey("nurmal")).$attrs.margin).right)
        console.log("====> ArkUX_Stage_List_Style_0400 listItemLeft:" + left + "listItemRight:" + right)
        let listItemHeight = JSON.parse(getInspectorByKey("ArkUXII_List_style_0400"))
          .$attrs.size.height
        console.log("====> ArkUX_Stage_List_Style_0400 listItemHeight:" + listItemHeight)
        let listItemGroupLeft = JSON.stringify(JSON.parse(JSON.parse(getInspectorByKey("ListItemGroup"))
          .$attrs.margin).left)
        let listItemGroupRight = JSON.stringify(JSON.parse(JSON.parse(getInspectorByKey("ListItemGroup"))
          .$attrs.margin).right)
        console.log("====> ArkUX_Stage_List_Style_0400 listItemGroupLeft:" + listItemGroupLeft +
          "listItemGroupRight:" + listItemGroupRight)
        expect(listItemGroupLeft).assertEqual(left)
        expect(listItemGroupRight).assertEqual(right)
        expect(parseFloat(listItemHeight)==48).assertFalse();
      } catch (err) {
        console.info('ArkUX_Stage_List_Style_0400 ERR  ' + JSON.stringify(err));
        expect().assertFail();
      }
      done()
    })

    /**
      * @tc.number ArkUX_Stage_List_Style_0500
      * @tc.name   Test the style attribute of the ListItem component and the style attribute of the
      *            ListItemGroup component
      * @tc.desc   Test setting the style parameter in ListItemGroup to ListItemGroupStyle.CARD,
      *            Does the style take effect after setting the style parameter in ListItem to undefined
      */

    it('ArkUX_Stage_List_Style_0500', 0, function (done) {
      try {
        let left = JSON.stringify(JSON.parse(JSON.parse(getInspectorByKey("nurmal")).$attrs.margin).left)
        let right = JSON.stringify(JSON.parse(JSON.parse(getInspectorByKey("nurmal")).$attrs.margin).right)
        console.log("====> ArkUX_Stage_List_Style_0500 listItemLeft:" + left + "listItemRight:" + right)
        let listItemHeight = JSON.parse(getInspectorByKey("ArkUXII_List_style_0500"))
          .$attrs.size.height
        console.log("====> ArkUX_Stage_List_Style_0500 listItemHeight:" + listItemHeight)
        let listItemGroupLeft = JSON.stringify(JSON.parse(JSON.parse(getInspectorByKey("ListItemGroup"))
          .$attrs.margin).left)
        let listItemGroupRight = JSON.stringify(JSON.parse(JSON.parse(getInspectorByKey("ListItemGroup"))
          .$attrs.margin).right)
        console.log("====> ArkUX_Stage_List_Style_0500 listItemGroupLeft:" + listItemGroupLeft +
          "listItemGroupRight:" + listItemGroupRight)
        expect(listItemGroupLeft).assertEqual(left)
        expect(listItemGroupRight).assertEqual(right)
        expect(parseFloat(listItemHeight)==48).assertFalse();
      } catch (err) {
        console.info('ArkUX_Stage_List_Style_0500 ERR  ' + JSON.stringify(err));
        expect().assertFail();
      }
      done()
    })

    /**
      * @tc.number ArkUX_Stage_List_Style_0600
      * @tc.name   Test the style attribute of the ListItem component and the style attribute of the
      *            ListItemGroup component
      * @tc.desc   Test setting the style parameter in ListItemGroup to ListItemGroupStyle.CARD,
      *            Does the style take effect after setting the style parameter in ListItem to ""
      */

    it('ArkUX_Stage_List_Style_0600', 0, function (done) {
      try {
        let left = JSON.stringify(JSON.parse(JSON.parse(getInspectorByKey("nurmal")).$attrs.margin).left)
        let right = JSON.stringify(JSON.parse(JSON.parse(getInspectorByKey("nurmal")).$attrs.margin).right)
        console.log("====> ArkUX_Stage_List_Style_0600 listItemLeft:" + left + "listItemRight:" + right)
        let listItemHeight = JSON.parse(getInspectorByKey("ArkUXII_List_style_0600"))
          .$attrs.size.height
        console.log("====> ArkUX_Stage_List_Style_0600 listItemHeight:" + listItemHeight)
        let listItemGroupLeft = JSON.stringify(JSON.parse(JSON.parse(getInspectorByKey("ListItemGroup"))
          .$attrs.margin).left)
        let listItemGroupRight = JSON.stringify(JSON.parse(JSON.parse(getInspectorByKey("ListItemGroup"))
          .$attrs.margin).right)
        console.log("====> ArkUX_Stage_List_Style_0600 listItemGroupLeft:" + listItemGroupLeft +
          "listItemGroupRight:" + listItemGroupRight)
        expect(listItemGroupLeft).assertEqual(left)
        expect(listItemGroupRight).assertEqual(right)
        expect(parseFloat(listItemHeight)==48).assertFalse();
      } catch (err) {
        console.info('ArkUX_Stage_List_Style_0600 ERR  ' + JSON.stringify(err));
        expect().assertFail();
      }
      done()
    })

    /** 
      * @tc.number ArkUX_Stage_List_Style_0700
      * @tc.name   Test the style attribute of the ListItem component and the style attribute of the
      *            ListItemGroup component
      * @tc.desc   Test setting the style parameter in ListItemGroup to ListItemGroupStyle.CARD,
      *            Does the style take effect after setting the style parameter  is not set
      */

    it('ArkUX_Stage_List_Style_0700', 0, function (done) {
      try {
        let left = JSON.stringify(JSON.parse(JSON.parse(getInspectorByKey("nurmal")).$attrs.margin).left)
        let right = JSON.stringify(JSON.parse(JSON.parse(getInspectorByKey("nurmal")).$attrs.margin).right)
        console.log("====> ArkUX_Stage_List_Style_0700 listItemLeft:" + left + "listItemRight:" + right)
        let listItemHeight = JSON.parse(getInspectorByKey("ArkUXII_List_style_0700"))
          .$attrs.size.height
        console.log("====> ArkUX_Stage_List_Style_0700 listItemHeight:" + listItemHeight)
        let listItemGroupLeft = JSON.stringify(JSON.parse(JSON.parse(getInspectorByKey("ListItemGroup"))
          .$attrs.margin).left)
        let listItemGroupRight = JSON.stringify(JSON.parse(JSON.parse(getInspectorByKey("ListItemGroup"))
          .$attrs.margin).right)
        console.log("====> ArkUX_Stage_List_Style_0700 listItemGroupLeft:" + listItemGroupLeft +
          "listItemGroupRight:" + listItemGroupRight)
        expect(listItemGroupLeft).assertEqual(left)
        expect(listItemGroupRight).assertEqual(right)
        expect(parseFloat(listItemHeight)==48).assertFalse();
      } catch (err) {
        console.info('ArkUX_Stage_List_Style_0700 ERR  ' + JSON.stringify(err));
        expect().assertFail();
      }
      done()
    })

    /** 
      * @tc.number ArkUX_Stage_List_Style_0800
      * @tc.name   Test the style attribute of the ListItem component and the style attribute of the
      *            ListItemGroup component
      * @tc.desc   Test setting the style parameter in ListItemGroup to ListItemGroupStyle.NONE,
      *            Does the style take effect after setting the style parameter in ListItem to ListItemStyle.CARD
      */

    it('ArkUX_Stage_List_Style_0800', 0, function (done) {
      try {
        let margin = JSON.stringify(JSON.parse(getInspectorByKey("nurmal")).$attrs.margin)
        console.log("====> ArkUX_Stage_List_Style_0800 margin:" + margin)
        let listItemGroupMargin = JSON.stringify(JSON.parse(getInspectorByKey("ArkUXII_List_style_0800"))
          .$attrs.margin)
        console.log("====> ArkUX_Stage_List_Style_0800 listItemGroupMargin:" + listItemGroupMargin)
        expect(listItemGroupMargin == margin).assertFalse()
      } catch (err) {
        console.info('ArkUX_Stage_List_Style_0800 ERR  ' + JSON.stringify(err));
        expect().assertFail();
      }
      done()
    })

    /** 
      * @tc.number ArkUX_Stage_List_Style_0900
      * @tc.name   Test the style attribute of the ListItem component and the style attribute of the
      *            ListItemGroup component
      * @tc.desc   Test setting the style parameter in ListItemGroup to null,
      *            Does the style take effect after setting the style parameter in ListItem to ListItemStyle.CARD
      */

    it('ArkUX_Stage_List_Style_0900', 0, function (done) {
      try {
        let margin = JSON.stringify(JSON.parse(getInspectorByKey("nurmal")).$attrs.margin)
        console.log("====> ArkUX_Stage_List_Style_0900 margin:" + margin)
        let listItemGroupMargint = JSON.stringify(JSON.parse(getInspectorByKey("ArkUXII_List_style_0900"))
          .$attrs.margin)
        console.log("====> ArkUX_Stage_List_Style_0900 listItemGroupMargint:" + listItemGroupMargint)
        expect(listItemGroupMargint == margin).assertFalse()
      } catch (err) {
        console.info('ArkUX_Stage_List_Style_0900 ERR  ' + JSON.stringify(err));
        expect().assertFail();
      }
      done()
    })

    /** 
      * @tc.number ArkUX_Stage_List_Style_1000
      * @tc.name   Test the style attribute of the ListItem component and the style attribute of the
      *            ListItemGroup component
      * @tc.desc   Test setting the style parameter in ListItemGroup to  undefined,
      *            Does the style take effect after setting the style parameter in ListItem to ListItemStyle.CARD
      */

    it('ArkUX_Stage_List_Style_1000', 0, function (done) {
      try {
        let margin = JSON.stringify(JSON.parse(getInspectorByKey("nurmal")).$attrs.margin)
        console.log("====> ArkUX_Stage_List_Style_1000 margin:" + margin)
        let listItemGroupMargin = JSON.stringify(JSON.parse(getInspectorByKey("ArkUXII_List_style_1000"))
          .$attrs.margin)
        console.log("====> ArkUX_Stage_List_Style_1000 listItemGroupMargin:" + listItemGroupMargin)
        expect(listItemGroupMargin == margin).assertFalse()
      } catch (err) {
        console.info('ArkUX_Stage_List_Style_1000 ERR' + JSON.stringify(err));
        expect().assertFail();
      }
      done()
    })

    /** 
      * @tc.number ArkUX_Stage_List_Style_1100
      * @tc.name   Test the style attribute of the ListItem component and the style attribute of the
      *            ListItemGroup component
      * @tc.desc   Test setting the style parameter in ListItemGroup to in "",
      *            Does the style take effect after setting the style parameter in ListItem to ListItemStyle.CARD
      */

    it('ArkUX_Stage_List_Style_1100', 0, function (done) {
      try {
        let margin = JSON.stringify(JSON.parse(getInspectorByKey("nurmal")).$attrs.margin)
        console.log("====> ArkUX_Stage_List_Style_1100 margin:" + margin)
        let listItemGroupMargin = JSON.stringify(JSON.parse(getInspectorByKey("ArkUXII_List_style_1100"))
          .$attrs.margin)
        console.log("====> ArkUX_Stage_List_Style_1100 listItemGroupMargin:" + listItemGroupMargin)
        expect(listItemGroupMargin == margin).assertFalse()
      } catch (err) {
        console.info('ArkUX_Stage_List_Style_1100 ERR' + JSON.stringify(err));
        expect().assertFail();
      }
      done()
    })

    /** 
      * @tc.number ArkUX_Stage_List_Style_1200
      * @tc.name   Test the style attribute of the ListItem component and the style attribute of the
      *            ListItemGroup component
      * @tc.desc   Test setting the style parameter in ListItemGroup to ListItem is not set,
      *            Does the style take effect after setting the style parameter in ListItem to ListItemStyle.CARD
      */

    it('ArkUX_Stage_List_Style_1200', 0, function (done) {
      try {
        let margin = JSON.stringify(JSON.parse(getInspectorByKey("nurmal")).$attrs.margin)
        console.log("====> ArkUX_Stage_List_Style_1200 margin:" + margin)
        let listItemGroupMargin = JSON.stringify(JSON.parse(getInspectorByKey("ArkUXII_List_style_1200"))
          .$attrs.margin)
        console.log("====> ArkUX_Stage_List_Style_1200 listItemGroupMargin:" + listItemGroupMargin)
        expect(listItemGroupMargin == margin).assertFalse()
      } catch (err) {
        console.info('ArkUX_Stage_List_Style_1200 ERR  ' + JSON.stringify(err));
        expect().assertFail();
      }
      done()
    })


    /** 
      * @tc.number ArkUX_Stage_List_RollBack_0100
      * @tc.name   Testing the rolling back effect of the list and adding new parameters
      * @tc.desc   ScrollerForList calls the interface scrollTo(), and the animation parameter is passed in as true
      */

    it('ArkUX_Stage_List_RollBack_0100', 0, function (done) {
      try {
        sendEventByKey("scrollerForList", 10, "")
        let obj = JSON.stringify(JSON.parse(getInspectorByKey("RollBack")).$attrs.scrollerForList)
        expect(obj).assertEqual(undefined)
      } catch (err) {
        console.info('ArkUX_Stage_List_RollBack_0100 ERR  ' + JSON.stringify(err));
        expect().assertFail();
      }
      done()
    })

  })
}
