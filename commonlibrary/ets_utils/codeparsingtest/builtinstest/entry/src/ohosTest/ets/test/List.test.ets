import bigIntTest from './BigInt/BigInt.test';
import booleanTest from './Boolean/Boolean.test';
import dataViewTest from './DataView/DataView.test';
import dateTest from './Date/Date.test';
import arrayTest from './Array/Array.test';
import numberTest from './Number/Number.test';
import stringTest from './String/String.test';
import weakMapTest from './WeakMap/WeakMap.test';
import nativeJSONTest from './NativeJSON/NativeJSON.test';
import intlTest from './Intl/Intl.test';

import atomicsTest from './Atomics.test';
import streamTest from './Stream.test';

export default function testsuite() {
  bigIntTest();
  booleanTest();
  dataViewTest();
  dateTest();
  arrayTest();
  numberTest();
  stringTest();
  weakMapTest();
  nativeJSONTest();
  intlTest();

  atomicsTest();
  streamTest();

}