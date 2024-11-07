import booleanTest from './Boolean/Boolean.test';
import dataViewTest from './DataView/DataView.test';
import arrayTest from './Array/Array.test';
import numberTest from './Number/Number.test';
import stringTest from './String/String.test';
import weakMapTest from './WeakMap/WeakMap.test';
import nativeJSONTest from './NativeJSON/NativeJSON.test';

export default function testsuite() {
  booleanTest();
  dataViewTest();
  arrayTest();
  numberTest();
  stringTest();
  weakMapTest();
  nativeJSONTest();
}