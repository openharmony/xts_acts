import booleanTest from './Boolean/Boolean.test';
import dataViewTest from './DataView/DataView.test';
import arrayTest from './Array/Array.test';
import numberTest from './Number/Number.test';
import stringTest from './String/String.test';
import weakMapTest from './WeakMap/WeakMap.test';
import nativeJSONTest from './NativeJSON/NativeJSON.test';
import bigIntTest from './BigInt/BigInt.test';
import reflectTest from './Reflect/Reflect.test';
import localeTest from './Locale/Locale.test';
import objectTest from './Object/Object.test';
import intlTest from './Intl/Intl.test';
import promiseTest from './Promise/Promise.test';
import mapTest from './Map/Map.test';
import regExpTest from './RegExp/RegExp.test';
import setTest from './Set/Set.test';
import weakRefTest from './WeakRef/WeakRef.test';
import weakSetTest from './WeakSet/WeakSet.test';

export default function testsuite() {
  booleanTest();
  dataViewTest();
  arrayTest();
  numberTest();
  stringTest();
  weakMapTest();
  nativeJSONTest();
  bigIntTest();
  reflectTest();
  localeTest();
  objectTest();
  intlTest();
  promiseTest();
  mapTest();
  regExpTest();
  setTest();
  weakRefTest();
  weakSetTest();
}