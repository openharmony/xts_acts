/*
 * Copyright (c) 2020-2030 iSoftStone Information Technology (Group) Co.,Ltd.
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
 import flexBase_AutoJsunit from './Flex/alignItems/ItemAlign_Auto/FlexBaseJsunit.test.ets';
 import flexPadding_AutoJsunit from './Flex/alignItems/ItemAlign_Auto/FlexPaddingJsunit.test.ets';
 import flexMargin_AutoJsunit from './Flex/alignItems/ItemAlign_Auto/FlexMarginJsunit.test.ets';
 import flexExceed_AutoJsunit from './Flex/alignItems/ItemAlign_Auto/FlexExceedJsunit.test.ets';
 import flexHeightModify_AutoJsunit from './Flex/alignItems/ItemAlign_Auto/FlexHeightModifyJsunit.test.ets';
 import flexOffset_AutoJsunit from './Flex/alignItems/ItemAlign_Auto/FlexOffsetJsunit.test.ets';
 import flexVisibility_AutoJsunit from './Flex/alignItems/ItemAlign_Auto/FlexVisibilityJsunit.test.ets';
 import flexAlignSelf_AutoJsunit from './Flex/alignItems/ItemAlign_Auto/FlexAlignSelfJsunit.test.ets';
 import flexTextMargin_AutoJsunit from './Flex/alignItems/ItemAlign_Auto/FlexTextMarginJsunit.test.ets';

export default function testsuite() {
  flexBase_AutoJsunit()
  flexPadding_AutoJsunit()
  flexMargin_AutoJsunit()
  flexExceed_AutoJsunit()
  flexHeightModify_AutoJsunit()
  flexOffset_AutoJsunit()
  flexVisibility_AutoJsunit()
  flexAlignSelf_AutoJsunit()
  flexTextMargin_AutoJsunit()
}