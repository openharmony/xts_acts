import testNapi from 'libhspone.so';

export { add } from "./src/main/ets/utils/Calc";

export function hspSOAdd(a:number, b:number) {
    return testNapi.add(a, b);
  }
