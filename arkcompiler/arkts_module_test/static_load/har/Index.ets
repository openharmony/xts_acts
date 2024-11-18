/**
 * Copyright (c) 2024 SwanLink (Jiangsu) Technology Development Co., LTD.
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

import stringify from '@wolfx/json5/src/main/ets/json5/stringify';

export { MainPage } from './src/main/ets/components/MainPage'

export { add } from 'ets/testAdd';

export { add as add1 } from './testAdd';

export { subtract } from './src/main/ets/test';

export { multiply } from './src/main/ets/test';

export { getInfo as testGetCNInfo } from './src/main/ets/test/中文';

export { addTest } from 'loadHar';

export { getHarName } from 'loadHar/src/main/ets/getHarNameTest';

export { addTest as addTest2 } from '@test/library';

export { getHarName as getHarName2 } from '@test/library/src/main/ets/getHarNameTest';

export { OHUtils } from 'ohutils';

export { OHUtils as SrcOHUtils } from 'ohutils/src/main/ets/utils/OHUtils';

export { JSON5 } from '@wolfx/json5';

export { add as hspAdd } from 'loadHsp';

export { add as hspAdd2 } from '@test/library1';

export { subtract as hspSubtract } from 'loadHsp/src/test/testSubtract';

export { subtract as hspSubtract2 } from '@test/library1/src/test/testSubtract';

export { stringify };

