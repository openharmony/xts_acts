import cryptoHmacOptParaJsTestUnit from './HmacOptParameter.test'
import cryptoPbkdf2JsTestUnit from './Pbkdf2.test'
import cryptoSymOptAADJsTestUnit from './SymOptAAD.test'
export default function testsuite() {
  cryptoHmacOptParaJsTestUnit();
  cryptoPbkdf2JsTestUnit();
  cryptoSymOptAADJsTestUnit();
}