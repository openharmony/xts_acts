import testNapi from 'libharone.so';

export { MainPage } from './src/main/ets/components/mainpage/MainPage'

export function harSOAdd(a:number, b:number) {
  return testNapi.add(a, b);
}