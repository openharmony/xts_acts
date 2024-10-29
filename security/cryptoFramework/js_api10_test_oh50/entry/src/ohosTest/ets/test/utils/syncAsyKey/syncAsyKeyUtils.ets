/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import cryptoFramework from '@ohos.security.cryptoFramework';
import * as rsa from '../pkcs1Topkcs8/pkcs1topkcs8';

let pri_dsa_2048: string =
  '-----BEGIN PRIVATE KEY-----\n'                                      +
  'MIICXAIBADCCAjUGByqGSM44BAEwggIoAoIBAQCTQpPC0XKDO8Gl6AQWHeUtcK0K\n' +
  'k06VEGrsM9kql5QTGlw0kgxWJ/OEHnwYnjoWlrfpm2OFwEYQrMOxL7g7bB3W5VPW\n' +
  'mCF+lYxm1Q60ZENVA5D2qyGlfTEeggqid8lvMs5sE52TJJPBTzUTb8+jS+HM3Jez\n' +
  'fxNPcg0YVJfQP7IKIVzMo6zgtAVRbYqwNMMvEt5sVaAgnZVxeyHyDZFpfuEkFIOw\n' +
  'tFJ5ZR0K79eNBGPOji1qAsUp4r2Ps+V2Zhku+eO4Ts2dwjtDAX0oNEXFRQlo0l7E\n' +
  'jPEt7eloJWccPh+Yuj688HfpHrFve3xKHA6XL2k8pjMsKUjftJ4/iFCOVXXTAh0A\n' +
  'm43NQ9rnaVQuRTL2lYgYz7E3xTKgln+N14eyzQKCAQAoZROu+D0rzK9MxO9+I4sX\n' +
  'RJ6gHtcJfy0FRY1+tRArB5lh0kuzpo/hL3WPthlQIpzpyD2g84iw2KqEKgOu12t9\n' +
  '/gITgWwcSzxxqa6xyuZv2vcMdHoJX5nCBLBv9rimTSKk9gpLIrai8ZJHN5ZgxS42\n' +
  'de01aujOLRGEou2zbj2OzGXC3uO+Meir9Y1s0GDX4NI2lgJENvho1e9kHRdCuIFJ\n' +
  'JkwaX953j0Gi0MXuegQ3xRLzZEQSWQx2lqLHDTL19q50elA0XXv46p5asH0/HfYA\n' +
  'jAiH7knH7zMybYxU4o3b8U/9qGO/qcvUsCIAAfXprCurgrnb4tTpu8a6o4itH63P\n' +
  'BB4CHEbjxeajc9r/ZhySyTLsUqOTR019wNVZ2fJdNiE=\n'                     +
  '-----END PRIVATE KEY-----\n';
let pub_dsa_2048: string =
  '-----BEGIN PUBLIC KEY-----\n'                                       +
  'MIIDRzCCAjoGByqGSM44BAEwggItAoIBAQDaxITb9+08bVZehMVK0CYIbe7DQVkH\n' +
  'Hjhm663WpKdnQ5zIlx1rfag0gkqKAQ1udQoh3Iy9fs1IpNVE3y/m0mZOUPVT5Wln\n' +
  '6bAqtW6RkH1SEbipzlHvUXEJ2ZeBHugV9jdQCj98KFx21Xy1j6lz4ee081pVrpFd\n' +
  'FpDZeIJGSLck8ZHulVMm6uBpX+tXvdwExOAiserTx4j+h9itoE0gi8RZnnzUhQgo\n' +
  'sVWlSWbZCGGXjr0nLdaifoVMjSpXdsHLS/NCX32PwS1oFZ8bUmhTC22hu+7/w9Uo\n' +
  'TM9A+T/s/2aFj2NyWBUw3Hieu50gecF6DIUPdjHGMRfqQhD+C7+GLJKRAiEA59Ml\n' +
  '4IsGRCRYv1HELhmM2Z709+NSI114yIiExFQ9CnkCggEBANonKP6tfcSdhwrXELWM\n' +
  'pA9LuuA+obgmbWqqb7jRONcXy4BuNaqqB6ZnYhWAx1UJRN5MTPu1IfCT6NPBwb5U\n' +
  '00VLtXG2DnGH4q/zVTk0ZBcMpDLlS2LBfAmfEXRvRTSKBvb3znP1Aor6pejoElQq\n' +
  '1qHynlfDtQgd8zNTBomIIoqdYcIZTmqFIdiF8I02qgGvPHLDTg+Bk88p3XEM6dkD\n' +
  'KPnPPJQyeClvxMOcNwK9RF6NTbeUb6q45RR3a5OFMVbjqw3LWc/PDdZ8G9R3EHwE\n' +
  'cmjlKeIsLVqJP+ZAwv7LB82vxhW3yPdYfuIb+b7W43sUdBz1eDtnDPck8th6LObs\n' +
  '7wEDggEFAAKCAQA1SyQYmrRq2ejIHV1OBDowV6BEiMMTsHEhHSUztH6sx2teshzd\n' +
  'zenUImK1TT9HiHV4YpV/v3J7ouO+t5QoLzy2XPa+Cq+RWwYUP2NseONntAm7aE+g\n' +
  'SvzR3Ckh+lnn2Bj7Jft6BVGPcuwXZbfjc21vZtlgzVWPUZZ1cbp2apvLOiOfeNPQ\n' +
  'FLEqNPfz8z7nDRTTj2yETqs4ZuYq09VKNzTOZcjE+E7FQnka5al9fc6TCJdCLHl6\n' +
  'jIfU5qG25UUEDsqI+einTeLm0m7gwcCnyr2gtqydJ68aaHRnMxIiBauzUM3QvTe1\n' +
  '3Q5agGzkKl0/LFncx/Mi8G4Ia1krRb1zJGj3\n'                             +
  '-----END PUBLIC KEY-----\n';

let pri_DH_ffdhe4096: string =
  '-----BEGIN PRIVATE KEY-----\n'                                      +
  'MIICSwIBADCCAhcGCSqGSIb3DQEDATCCAggCggIBAP//////////rfhUWKK7Spqv\n' +
  '3FYgJz088di5xYPOLTaVqeE2QRRkM/vMk53OJJs++X0v42NjDHXY9oGyAq7EYXrT\n' +
  '3x7V1f1lYSQz9R9fBm7QhWNlVT3tGvO1VxNef1fJNZhPDHDg5ot34qaJ2vPv6HId\n' +
  '8VihNq3nNTCsyk9IOnl6vAqxgrMk+2HRCKlLssjj+7lq2rdg1/RoHU9Co945TfSu\n' +
  'Vu3nY3K7GQsHp8juCm1wngL84c334uzANATNKDQvYZFy/pzphYP/jk8SMu7ygYPD\n' +
  '/jsbTG+tczu1/LwuwiAFxY7xg30Wg7LG80omwbLv+ohrQjhhH8/c3jVbO2UZA1u8\n' +
  'NPTe+ZwCOGG0b8nW5skHetkdJpH39+5ZjLD6wYbZHK7+EwmFE5JwtBMMk7xDeUT0\n' +
  '/URS4tdN02Ty4h5x9Uv/XK6Cq5yd9p7obSvFIjY6DavFIZebDeraHb+aQtXESE4K\n' +
  'vNBr+lPd7zwbIO4/1Z18JeQdK2aeHvFub1LDFk30+3kw6eTliFe2rH1fQtafbRh3\n' +
  'Y88dVQNABIf1W6V+Mcx6cTXIhu+0MYrtah4BLZ5oMqkHYAqRgTDEbcd4+XGtADgJ\n' +
  'KZmjM8uLehoduT1xQAA8Kk7OqfmNCswKgpHNzsl9z47JtVp/iKRrTbWoUfRBguHG\n' +
  'igB+XmVfav//////////AgECBCsCKQp3naqHfKyZkUYOs7YP83O1fETUlkcZisJR\n' +
  'IWA8wGtvVyHeuYo3OAxE\n'                                             +
  '-----END PRIVATE KEY-----\n';

let pub_DH_ffdhe4096: string =
  '-----BEGIN PUBLIC KEY-----\n'                                       +
  'MIIEJDCCAhcGCSqGSIb3DQEDATCCAggCggIBAP//////////rfhUWKK7Spqv3FYg\n' +
  'Jz088di5xYPOLTaVqeE2QRRkM/vMk53OJJs++X0v42NjDHXY9oGyAq7EYXrT3x7V\n' +
  '1f1lYSQz9R9fBm7QhWNlVT3tGvO1VxNef1fJNZhPDHDg5ot34qaJ2vPv6HId8Vih\n' +
  'Nq3nNTCsyk9IOnl6vAqxgrMk+2HRCKlLssjj+7lq2rdg1/RoHU9Co945TfSuVu3n\n' +
  'Y3K7GQsHp8juCm1wngL84c334uzANATNKDQvYZFy/pzphYP/jk8SMu7ygYPD/jsb\n' +
  'TG+tczu1/LwuwiAFxY7xg30Wg7LG80omwbLv+ohrQjhhH8/c3jVbO2UZA1u8NPTe\n' +
  '+ZwCOGG0b8nW5skHetkdJpH39+5ZjLD6wYbZHK7+EwmFE5JwtBMMk7xDeUT0/URS\n' +
  '4tdN02Ty4h5x9Uv/XK6Cq5yd9p7obSvFIjY6DavFIZebDeraHb+aQtXESE4KvNBr\n' +
  '+lPd7zwbIO4/1Z18JeQdK2aeHvFub1LDFk30+3kw6eTliFe2rH1fQtafbRh3Y88d\n' +
  'VQNABIf1W6V+Mcx6cTXIhu+0MYrtah4BLZ5oMqkHYAqRgTDEbcd4+XGtADgJKZmj\n' +
  'M8uLehoduT1xQAA8Kk7OqfmNCswKgpHNzsl9z47JtVp/iKRrTbWoUfRBguHGigB+\n' +
  'XmVfav//////////AgECA4ICBQACggIAGw9owVmRxKfS3sH7iYGFFP1xymcPVa3+\n' +
  'WNetrWo41UO6yhByYfP5M5Psro777AigCwQwO/p4IBozlhs2eB3K8Gzm/pONCcsa\n' +
  '+lSMPl25rtSTHk6CYdCPlC4nQbxZJ1v6eThbpT7YoglHFACto94iJThV5SHBl1fU\n' +
  'xO0AyxSair/l8ddYb3TdHL9Y2y+N0p3GQR0MnRE64VMhEvsbp1xGTFo6uAeF2cLg\n' +
  'TfsY1U0IVb2I2dHvZyyauBsWq64h1/ag1m9RUEER7kufWcOAS1ht1/tZs1v6aFgk\n' +
  'ZG4ABN568+PO3mPC4FdjdrDhaqJ5Ih5S3BcZnKQXIfAafObsyZumrIVpQ19MVYgO\n' +
  'qEk0Ovs4yyz6LlXacaBL3a6WfrUDwua/zo14MuXsB10P9c4cfVz1UtIOu79UecUB\n' +
  'uKD/Kz2VwH6GHRwLkWYptrF52ShWOjphjaqJjeGlEWKsIjwC/ekDPx6XPvtNhcgi\n' +
  'enEYWVx9XcyGuMtkaqsCh6+WdG95/nW2aPjuFx34/7245R2Hj2/I77j7Am9mk4+D\n' +
  'MyMPX+0WdRUsDAhkB/ZG8ayLPhtowrwNuOVY7AEPNpDezuzh4ql1BUjc8NNnNFU7\n' +
  'qmQj+LgsieG6FCLMf597JjJL06dD/WgEshNU+XTsH6z9WqlF+UdmopE6uB6/iraV\n' +
  'E+YABhjAZcI=\n'                                                     +
  '-----END PUBLIC KEY-----\n';

let pri_DH_ffdhe6144: string =
  '-----BEGIN PRIVATE KEY-----\n'                                      +
  'MIIDUQIBADCCAxcGCSqGSIb3DQEDATCCAwgCggMBAP//////////rfhUWKK7Spqv\n' +
  '3FYgJz088di5xYPOLTaVqeE2QRRkM/vMk53OJJs++X0v42NjDHXY9oGyAq7EYXrT\n' +
  '3x7V1f1lYSQz9R9fBm7QhWNlVT3tGvO1VxNef1fJNZhPDHDg5ot34qaJ2vPv6HId\n' +
  '8VihNq3nNTCsyk9IOnl6vAqxgrMk+2HRCKlLssjj+7lq2rdg1/RoHU9Co945TfSu\n' +
  'Vu3nY3K7GQsHp8juCm1wngL84c334uzANATNKDQvYZFy/pzphYP/jk8SMu7ygYPD\n' +
  '/jsbTG+tczu1/LwuwiAFxY7xg30Wg7LG80omwbLv+ohrQjhhH8/c3jVbO2UZA1u8\n' +
  'NPTe+ZwCOGG0b8nW5skHetkdJpH39+5ZjLD6wYbZHK7+EwmFE5JwtBMMk7xDeUT0\n' +
  '/URS4tdN02Ty4h5x9Uv/XK6Cq5yd9p7obSvFIjY6DavFIZebDeraHb+aQtXESE4K\n' +
  'vNBr+lPd7zwbIO4/1Z18JeQdK2aeHvFub1LDFk30+3kw6eTliFe2rH1fQtafbRh3\n' +
  'Y88dVQNABIf1W6V+Mcx6cTXIhu+0MYrtah4BLZ5oMqkHYAqRgTDEbcd4+XGtADgJ\n' +
  'KZmjM8uLehoduT1xQAA8Kk7OqfmNCswKgpHNzsl9z47JtVp/iKRrTbWoUfRBguHG\n' +
  'igB+Xg3ZAgv9ZLZFA2x6Tmd9LDhTKjojukRCyvU+pju0VDKbdiTIkXvdZLHA/Uyz\n' +
  'jowzTHAcOs2tBlf8z+xxmx9cPk5GBB84gUf7TP20d6UkcfepqWkQuFUyLttjQNig\n' +
  'DvCSNQUR4wq+wf/546Juf7KfjBgwI8NYfjjaAHfZtHY+TkuUsrvBlMZlHnfK+ZLu\n' +
  'qsAjKigb9rOnOcEiYRaCCujbWEemfL75yQkbRi1TjNcrA3Rq539eYiksMRViqEZQ\n' +
  'XcgtuFQziuSfUjXJW5EXjM8t1crO9APsnRgQxicrBFs7cfnca4DWP91KjprbHmli\n' +
  'ppUm1DFhwaQdVw15ONrUpA4ynNDkDmX//////////wIBAgQxAi9D0rgpePWZIcC7\n' +
  '4b1f51EJIlh14HbdtZsXOTY8NkCulvu7OGfFHX+sdKV0xU5OVg==\n'             +
  '-----END PRIVATE KEY-----\n';

let pub_DH_ffdhe6144: string =
  '-----BEGIN PUBLIC KEY-----\n'                                       +
  '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\n'         +
  '-----END PUBLIC KEY-----\n';

let pri_DH_ffdhe8192: string =
  '-----BEGIN PRIVATE KEY-----\n'                                      +
  'MIIEVQIBADCCBBcGCSqGSIb3DQEDATCCBAgCggQBAP//////////rfhUWKK7Spqv\n' +
  '3FYgJz088di5xYPOLTaVqeE2QRRkM/vMk53OJJs++X0v42NjDHXY9oGyAq7EYXrT\n' +
  '3x7V1f1lYSQz9R9fBm7QhWNlVT3tGvO1VxNef1fJNZhPDHDg5ot34qaJ2vPv6HId\n' +
  '8VihNq3nNTCsyk9IOnl6vAqxgrMk+2HRCKlLssjj+7lq2rdg1/RoHU9Co945TfSu\n' +
  'Vu3nY3K7GQsHp8juCm1wngL84c334uzANATNKDQvYZFy/pzphYP/jk8SMu7ygYPD\n' +
  '/jsbTG+tczu1/LwuwiAFxY7xg30Wg7LG80omwbLv+ohrQjhhH8/c3jVbO2UZA1u8\n' +
  'NPTe+ZwCOGG0b8nW5skHetkdJpH39+5ZjLD6wYbZHK7+EwmFE5JwtBMMk7xDeUT0\n' +
  '/URS4tdN02Ty4h5x9Uv/XK6Cq5yd9p7obSvFIjY6DavFIZebDeraHb+aQtXESE4K\n' +
  'vNBr+lPd7zwbIO4/1Z18JeQdK2aeHvFub1LDFk30+3kw6eTliFe2rH1fQtafbRh3\n' +
  'Y88dVQNABIf1W6V+Mcx6cTXIhu+0MYrtah4BLZ5oMqkHYAqRgTDEbcd4+XGtADgJ\n' +
  'KZmjM8uLehoduT1xQAA8Kk7OqfmNCswKgpHNzsl9z47JtVp/iKRrTbWoUfRBguHG\n' +
  'igB+Xg3ZAgv9ZLZFA2x6Tmd9LDhTKjojukRCyvU+pju0VDKbdiTIkXvdZLHA/Uyz\n' +
  'jowzTHAcOs2tBlf8z+xxmx9cPk5GBB84gUf7TP20d6UkcfepqWkQuFUyLttjQNig\n' +
  'DvCSNQUR4wq+wf/546Juf7KfjBgwI8NYfjjaAHfZtHY+TkuUsrvBlMZlHnfK+ZLu\n' +
  'qsAjKigb9rOnOcEiYRaCCujbWEemfL75yQkbRi1TjNcrA3Rq539eYiksMRViqEZQ\n' +
  'XcgtuFQziuSfUjXJW5EXjM8t1crO9APsnRgQxicrBFs7cfnca4DWP91KjprbHmli\n' +
  'ppUm1DFhwaQdVw15ONrUpA4ynM/0aqo2rQBM9gDIOB5CWjHZUa5k/bI/zslQnUNo\n' +
  'f+tp7dHMXguMw732SxDvhrYxQqOriClVWy90fJMmZcssDxzAG9cCKTiIOdKvBeRU\n' +
  'UErHi3WCgihGwLo1w19cWRYMwEb9glFUH8aMnIawIrtwmYdqRg50UaipMQlwP+4c\n' +
  'IX5sOCblLFGqaR4OQjz8menjFlDBIXtiSBbNrZqV+dW4AZSI2cCgof4wdaV34jGD\n' +
  '+B1KPy+kVx78jOC6ik/otoVd/nKwpm7e0vur++WKMPr6vhxdcah+L3Qe+MH+hv6m\n' +
  'u/3lMGd/DZfRHUn3qEQ9CCLlBqn0YU4BHiqUg4/4jNaMi7fFxkJM//////////8C\n' +
  'AQIENQIzAM498kyICk6xskzHZkdZAO7ONW9uWe2LH6+q6KngArD3p4UGoysIreox\n' +
  'PzfxQC0U7ZNa\n'                                                     +
  '-----END PRIVATE KEY-----\n';

let pub_DH_ffdhe8192: string =
  '-----BEGIN PUBLIC KEY-----\n'                                       +
  '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\n' +
  '1ba4gLxZM/VeG/9O0cMBhEyv41Ldjp0B\n'                                 +
  '-----END PUBLIC KEY-----\n';

let pri_DH_modp2048: string =
  '-----BEGIN PRIVATE KEY-----\n'                                      +
  'MIIBPwIBADCCARcGCSqGSIb3DQEDATCCAQgCggEBAP//////////yQ/aoiFowjTE\n' +
  'xmKLgNwc0SkCTgiKZ8x0Agu+pjsTmyJRSgh5jjQE3e+VGbPNOkMbMCsKbfJfFDdP\n' +
  '4TVtbVHCReSFtXZiXn7G9ExC6aY37WsL/1y29Aa37e44a/taiZ+lrp8kEXxLH+ZJ\n' +
  'KGZR7ORbPcIAfLihY78FmNpINhxV05ppFj+o/STPX4NlXSPco62WHGLzViCFUrue\n' +
  '1SkHcJaWbWcMNU5KvJgE8XRsCMoYIXwykF5GLjbOO+OedywYDoYDmyeDouwHoo+1\n' +
  'xV3wb0xSyd4ry/aVWBcYOZVJfOqVauUV0iYYmPoFEBVyjlqKrKpo//////////8C\n' +
  'AQIEHwIdAKk4Yyc/192ynBy708zjGha7IsFvurKUP7DIE/Y=\n'                 +
  '-----END PRIVATE KEY-----\n';

let pub_DH_modp2048: string =
  '-----BEGIN PUBLIC KEY-----\n'                                       +
  'MIICJDCCARcGCSqGSIb3DQEDATCCAQgCggEBAP//////////yQ/aoiFowjTExmKL\n' +
  'gNwc0SkCTgiKZ8x0Agu+pjsTmyJRSgh5jjQE3e+VGbPNOkMbMCsKbfJfFDdP4TVt\n' +
  'bVHCReSFtXZiXn7G9ExC6aY37WsL/1y29Aa37e44a/taiZ+lrp8kEXxLH+ZJKGZR\n' +
  '7ORbPcIAfLihY78FmNpINhxV05ppFj+o/STPX4NlXSPco62WHGLzViCFUrue1SkH\n' +
  'cJaWbWcMNU5KvJgE8XRsCMoYIXwykF5GLjbOO+OedywYDoYDmyeDouwHoo+1xV3w\n' +
  'b0xSyd4ry/aVWBcYOZVJfOqVauUV0iYYmPoFEBVyjlqKrKpo//////////8CAQID\n' +
  'ggEFAAKCAQAale6hp8pKIypjuZ2GCQlQrle23gsFS+s4Bk6l43Qlye3w8Qoh0dYz\n' +
  'mGqxMt9atB3tQrp+Vejnh5Ezq8p/nko4iTyW6q7otJpa8UUDFC8wTR6hpEx01hEx\n' +
  'JKBs1afj61K0bDm1r3DYrBNXB52TXsXPLR7yRGSyPeidpW4zo4EeCLXQblktDXjx\n' +
  'gyKBbf/Y/MHbCxNC2iEQnce2LZVqXKiAPIMcqRwUfR1Co59Gn67mfYSmeRQyKfjE\n' +
  'ZbxqFR+BEHwb797BwFjTqY4LivJaxuo1cKdCe/p6TJQ40TmMvRlC8wPZkitonip1\n' +
  'sID4+LkP4YMXDQ1esxC/Vh+jbDu6kk4F\n'                                 +
  '-----END PUBLIC KEY-----\n';

let pri_DH_modp3072: string =
  '-----BEGIN PRIVATE KEY-----\n'                                      +
  'MIIBxQIBADCCAZcGCSqGSIb3DQEDATCCAYgCggGBAP//////////yQ/aoiFowjTE\n' +
  'xmKLgNwc0SkCTgiKZ8x0Agu+pjsTmyJRSgh5jjQE3e+VGbPNOkMbMCsKbfJfFDdP\n' +
  '4TVtbVHCReSFtXZiXn7G9ExC6aY37WsL/1y29Aa37e44a/taiZ+lrp8kEXxLH+ZJ\n' +
  'KGZR7ORbPcIAfLihY78FmNpINhxV05ppFj+o/STPX4NlXSPco62WHGLzViCFUrue\n' +
  '1SkHcJaWbWcMNU5KvJgE8XRsCMoYIXwykF5GLjbOO+OedywYDoYDmyeDouwHoo+1\n' +
  'xV3wb0xSyd4ry/aVWBcYOZVJfOqVauUV0iYYmPoFEBVyjlqKqsQtrTMXDQRQejOo\n' +
  'VSGr3xy6ZOz7hQRY2+8KiupxV10GDH2zlw+FpuHkx6v1rozbCTPXHoyU4EolYZ3O\n' +
  '49ImGtLua/Ev+gbZighk2HYCcz7IamRSHysYF3sgDLvhF1d6YV1sdwmIwLrZRuII\n' +
  '4k+gdOWrMUPbW/zg/RCOS4LRIKk60sr//////////wIBAgQlAiMBEUjNc/iLknYp\n' +
  'uHG21LqMYN43Z/7s+S0El8Tu3/SjmPZZYA==\n'                             +
  '-----END PRIVATE KEY-----\n';

let pub_DH_modp3072: string =
  '-----BEGIN PUBLIC KEY-----\n'                                       +
  'MIIDJTCCAZcGCSqGSIb3DQEDATCCAYgCggGBAP//////////yQ/aoiFowjTExmKL\n' +
  'gNwc0SkCTgiKZ8x0Agu+pjsTmyJRSgh5jjQE3e+VGbPNOkMbMCsKbfJfFDdP4TVt\n' +
  'bVHCReSFtXZiXn7G9ExC6aY37WsL/1y29Aa37e44a/taiZ+lrp8kEXxLH+ZJKGZR\n' +
  '7ORbPcIAfLihY78FmNpINhxV05ppFj+o/STPX4NlXSPco62WHGLzViCFUrue1SkH\n' +
  'cJaWbWcMNU5KvJgE8XRsCMoYIXwykF5GLjbOO+OedywYDoYDmyeDouwHoo+1xV3w\n' +
  'b0xSyd4ry/aVWBcYOZVJfOqVauUV0iYYmPoFEBVyjlqKqsQtrTMXDQRQejOoVSGr\n' +
  '3xy6ZOz7hQRY2+8KiupxV10GDH2zlw+FpuHkx6v1rozbCTPXHoyU4EolYZ3O49Im\n' +
  'GtLua/Ev+gbZighk2HYCcz7IamRSHysYF3sgDLvhF1d6YV1sdwmIwLrZRuII4k+g\n' +
  'dOWrMUPbW/zg/RCOS4LRIKk60sr//////////wIBAgOCAYYAAoIBgQD6c3g4cZvv\n' +
  '0n7WRCtLfDTgpay7OBo1EwAlwpmJuJxn/pqhoVoF0I3KRJ8IPrV7V0WjkzCg/Qnu\n' +
  '7tZ0FxWnpBT1M4qwi1NYIGv+AdSOjqrrlPtUq9TdkFlQHJ4Fib55htyZO4KpX5fO\n' +
  'T3e1sgmxL4A5D7ApnI1807/VLi86XmnXHnUvJJk+hKT73sY3cJ7YogTnLB4PB/DU\n' +
  'OhZ60yNhFDytKP5Bv+XnGiNk/RtqsIzbOile+I0GbS4kGpVLaluvsh/h6NZE+BRr\n' +
  'oJC56FP9ku+yRijkEpFy0hBZv5zDayscgjWuE5TNePp/C7cujDvpbX3C106PbAfg\n' +
  'QTDXfUbLB4KkoGEDt/ASVDMxCbp8najnqUT5NWc0QLx5fViya0dzB3HSH/nleog4\n' +
  'MXThz4q5KwuhLaNPAcfU/uZTUtaMFzrHQPpC6HLyfkeys3jtTCdI20Fl2HC0c511\n' +
  'aggMTwOh/bW4e3z9WWWTYlVrIRPMtoBoLcwzDMp8PksOCFe2uv8X5fQ=\n'         +
  '-----END PUBLIC KEY-----\n';

let pri_DH_modp4096: string =
  '-----BEGIN PRIVATE KEY-----\n'                                      +
  'MIICSwIBADCCAhcGCSqGSIb3DQEDATCCAggCggIBAP//////////yQ/aoiFowjTE\n' +
  'xmKLgNwc0SkCTgiKZ8x0Agu+pjsTmyJRSgh5jjQE3e+VGbPNOkMbMCsKbfJfFDdP\n' +
  '4TVtbVHCReSFtXZiXn7G9ExC6aY37WsL/1y29Aa37e44a/taiZ+lrp8kEXxLH+ZJ\n' +
  'KGZR7ORbPcIAfLihY78FmNpINhxV05ppFj+o/STPX4NlXSPco62WHGLzViCFUrue\n' +
  '1SkHcJaWbWcMNU5KvJgE8XRsCMoYIXwykF5GLjbOO+OedywYDoYDmyeDouwHoo+1\n' +
  'xV3wb0xSyd4ry/aVWBcYOZVJfOqVauUV0iYYmPoFEBVyjlqKqsQtrTMXDQRQejOo\n' +
  'VSGr3xy6ZOz7hQRY2+8KiupxV10GDH2zlw+FpuHkx6v1rozbCTPXHoyU4EolYZ3O\n' +
  '49ImGtLua/Ev+gbZighk2HYCcz7IamRSHysYF3sgDLvhF1d6YV1sdwmIwLrZRuII\n' +
  '4k+gdOWrMUPbW/zg/RCOS4LRIKkhCAEacjwSp4fm14hxmhC9ulsmmcMnGGr04jwa\n' +
  'lGg0thUL2iWD6coq1Ezo27vC2wTejvkujvwUH77Kpih8WUdOa8BdmbKWT6CQw6Ij\n' +
  'O6GGUVvn7R9hKXDO4tevuBvddiFwSBzQBpEn1bBaqZO06piNj93Bhv+33JCmwI9N\n' +
  '9DXJNAYxmf//////////AgECBCsCKQawDTS62nDidIky6ZHOfuSpXTHsJm4JKowq\n' +
  'oOERSTz6a22EWArJEd7z\n'                                             +
  '-----END PRIVATE KEY-----\n';

let pub_DH_modp4096: string =
  '-----BEGIN PUBLIC KEY-----\n'                                       +
  'MIIEJTCCAhcGCSqGSIb3DQEDATCCAggCggIBAP//////////yQ/aoiFowjTExmKL\n' +
  'gNwc0SkCTgiKZ8x0Agu+pjsTmyJRSgh5jjQE3e+VGbPNOkMbMCsKbfJfFDdP4TVt\n' +
  'bVHCReSFtXZiXn7G9ExC6aY37WsL/1y29Aa37e44a/taiZ+lrp8kEXxLH+ZJKGZR\n' +
  '7ORbPcIAfLihY78FmNpINhxV05ppFj+o/STPX4NlXSPco62WHGLzViCFUrue1SkH\n' +
  'cJaWbWcMNU5KvJgE8XRsCMoYIXwykF5GLjbOO+OedywYDoYDmyeDouwHoo+1xV3w\n' +
  'b0xSyd4ry/aVWBcYOZVJfOqVauUV0iYYmPoFEBVyjlqKqsQtrTMXDQRQejOoVSGr\n' +
  '3xy6ZOz7hQRY2+8KiupxV10GDH2zlw+FpuHkx6v1rozbCTPXHoyU4EolYZ3O49Im\n' +
  'GtLua/Ev+gbZighk2HYCcz7IamRSHysYF3sgDLvhF1d6YV1sdwmIwLrZRuII4k+g\n' +
  'dOWrMUPbW/zg/RCOS4LRIKkhCAEacjwSp4fm14hxmhC9ulsmmcMnGGr04jwalGg0\n' +
  'thUL2iWD6coq1Ezo27vC2wTejvkujvwUH77Kpih8WUdOa8BdmbKWT6CQw6IjO6GG\n' +
  'UVvn7R9hKXDO4tevuBvddiFwSBzQBpEn1bBaqZO06piNj93Bhv+33JCmwI9N9DXJ\n' +
  'NAYxmf//////////AgECA4ICBgACggIBAJJlHygSixWYnuEhBz7FMDWf59xEHEMW\n' +
  'ghZuUs3GtPFl0xI44dUUVekyZhwHwL//ETw/BpgbCyhx4kYhhiD90pNPZBg5zJqI\n' +
  'XDSJU22v3VL8SK6bQS7Ha6rV+uy/0SkTA9sx1DsQOyySUNgibujgdCR6YS0g+lFk\n' +
  'Ef1c4nCTn0yhQEDAkJlTtSsQQgR60rcMV/8/aanFKUHbRAV9yuuKwZKkQo/ZfD3y\n' +
  'mY+cJRiGnmkKLvmtP7ogXHXDLpfm0YmHxkXeaNOcxl4Y/PMyr60P04POfO+2GCwU\n' +
  'n7jW+SQLwGut/SvofLEdWaYpl66F8VBHSgNq39aR7mLuwRiZpAC5tPcHPZcAxN6B\n' +
  'eI6v8AyAqIfMaYozUqETVONHG7EmPVnYDo7PNO8Z+VSnJlYfOxkCrPqchEEw33l+\n' +
  '64eWGCkzCJRwm73Yfzu+mHPtSrmVq2EUmAG8px6no3G+rZJQoK6Ig+GwauErXz6y\n' +
  '27I34aEWQhpwJm/WLmurYcXsEstDkt/7PULkvWd4QFZdfsNMgn0Ov20SYbzYLJFW\n' +
  'vynRnp++gav8vEKYWUY4WkZ2IHmHFpcsYWGlr9yYkYuBCLKyQxP6B1BYwvnkzWLN\n' +
  'z6YIVMszrCIFn+ofU6FXHLNTCEgLqIjNppPedN7GZn6vzdXLmyQso+2jdN080MD0\n' +
  'nmd99Rs/hIIi\n'                                                     +
  '-----END PUBLIC KEY-----\n';

let pri_DH_modp6144: string =
  '-----BEGIN PRIVATE KEY-----\n'                                      +
  'MIIDUQIBADCCAxcGCSqGSIb3DQEDATCCAwgCggMBAP//////////yQ/aoiFowjTE\n' +
  'xmKLgNwc0SkCTgiKZ8x0Agu+pjsTmyJRSgh5jjQE3e+VGbPNOkMbMCsKbfJfFDdP\n' +
  '4TVtbVHCReSFtXZiXn7G9ExC6aY37WsL/1y29Aa37e44a/taiZ+lrp8kEXxLH+ZJ\n' +
  'KGZR7ORbPcIAfLihY78FmNpINhxV05ppFj+o/STPX4NlXSPco62WHGLzViCFUrue\n' +
  '1SkHcJaWbWcMNU5KvJgE8XRsCMoYIXwykF5GLjbOO+OedywYDoYDmyeDouwHoo+1\n' +
  'xV3wb0xSyd4ry/aVWBcYOZVJfOqVauUV0iYYmPoFEBVyjlqKqsQtrTMXDQRQejOo\n' +
  'VSGr3xy6ZOz7hQRY2+8KiupxV10GDH2zlw+FpuHkx6v1rozbCTPXHoyU4EolYZ3O\n' +
  '49ImGtLua/Ev+gbZighk2HYCcz7IamRSHysYF3sgDLvhF1d6YV1sdwmIwLrZRuII\n' +
  '4k+gdOWrMUPbW/zg/RCOS4LRIKkhCAEacjwSp4fm14hxmhC9ulsmmcMnGGr04jwa\n' +
  'lGg0thUL2iWD6coq1Ezo27vC2wTejvkujvwUH77Kpih8WUdOa8BdmbKWT6CQw6Ij\n' +
  'O6GGUVvn7R9hKXDO4tevuBvddiFwSBzQBpEn1bBaqZO06piNj93Bhv+33JCmwI9N\n' +
  '9DXJNAKEkjbD+rTSfHAmwdTcsmAmRt7JdR52Pbo3vfj/lAatnlMO5ds4L0EwAa6w\n' +
  'alPtkCfYMReXJ7CGWokY2j7b68+bFO1Ezmy6ztS7G9t/FEfmzCVLMyBRUSvXr0Jv\n' +
  'uPQBN4zSv1mDygHGS5Ls8DLqFdFyHQP0gtfObnT+9tVecC9GmAyCtahAMZALHJ5Z\n' +
  '58l/vsfo8yOpen42zIi+Dx1Ft/9YWsVL1AeyK0FUqsyPbX6/SOHYFMxe0g+AN+Cn\n' +
  'lxXu8pvjKAah1Yu3xdp29VCqPYofv/DrGcyxoxPVXNpWyewu8pYyOH/o1248BGgE\n' +
  'Po9mP0hg7hK/LVsLdHTW5pT5Hm3MQCT//////////wIBAgQxAi9BnrqSwwMlvV4v\n' +
  'TbnECoCKJexFmJLdDO0Nm06gz7x14rwoCik8ZJFgzLCQmwJE7g==\n'             +
  '-----END PRIVATE KEY-----\n';

let pub_DH_modp6144: string =
  '-----BEGIN PUBLIC KEY-----\n'                                       +
  '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\n'         +
  '-----END PUBLIC KEY-----\n';

let pri_DH_modp8192: string =
  '-----BEGIN PRIVATE KEY-----\n'                                      +
  'MIIEVQIBADCCBBcGCSqGSIb3DQEDATCCBAgCggQBAP//////////yQ/aoiFowjTE\n' +
  'xmKLgNwc0SkCTgiKZ8x0Agu+pjsTmyJRSgh5jjQE3e+VGbPNOkMbMCsKbfJfFDdP\n' +
  '4TVtbVHCReSFtXZiXn7G9ExC6aY37WsL/1y29Aa37e44a/taiZ+lrp8kEXxLH+ZJ\n' +
  'KGZR7ORbPcIAfLihY78FmNpINhxV05ppFj+o/STPX4NlXSPco62WHGLzViCFUrue\n' +
  '1SkHcJaWbWcMNU5KvJgE8XRsCMoYIXwykF5GLjbOO+OedywYDoYDmyeDouwHoo+1\n' +
  'xV3wb0xSyd4ry/aVWBcYOZVJfOqVauUV0iYYmPoFEBVyjlqKqsQtrTMXDQRQejOo\n' +
  'VSGr3xy6ZOz7hQRY2+8KiupxV10GDH2zlw+FpuHkx6v1rozbCTPXHoyU4EolYZ3O\n' +
  '49ImGtLua/Ev+gbZighk2HYCcz7IamRSHysYF3sgDLvhF1d6YV1sdwmIwLrZRuII\n' +
  '4k+gdOWrMUPbW/zg/RCOS4LRIKkhCAEacjwSp4fm14hxmhC9ulsmmcMnGGr04jwa\n' +
  'lGg0thUL2iWD6coq1Ezo27vC2wTejvkujvwUH77Kpih8WUdOa8BdmbKWT6CQw6Ij\n' +
  'O6GGUVvn7R9hKXDO4tevuBvddiFwSBzQBpEn1bBaqZO06piNj93Bhv+33JCmwI9N\n' +
  '9DXJNAKEkjbD+rTSfHAmwdTcsmAmRt7JdR52Pbo3vfj/lAatnlMO5ds4L0EwAa6w\n' +
  'alPtkCfYMReXJ7CGWokY2j7b68+bFO1Ezmy6ztS7G9t/FEfmzCVLMyBRUSvXr0Jv\n' +
  'uPQBN4zSv1mDygHGS5Ls8DLqFdFyHQP0gtfObnT+9tVecC9GmAyCtahAMZALHJ5Z\n' +
  '58l/vsfo8yOpen42zIi+Dx1Ft/9YWsVL1AeyK0FUqsyPbX6/SOHYFMxe0g+AN+Cn\n' +
  'lxXu8pvjKAah1Yu3xdp29VCqPYofv/DrGcyxoxPVXNpWyewu8pYyOH/o1248BGgE\n' +
  'Po9mP0hg7hK/LVsLdHTW5pT5Hm2+EVl0o5JvEv7l5Dh3fLapMt+M2L7E0HO5Mbo7\n' +
  'yDK2jZ3TAHQfp7+K/EftJXb2k2ukJGY6q2OcWuT1aDQjtHQr8cl4I48Wy+OdZS3j\n' +
  '/bi+/ISK2SIiLgSkA3wHE+tXqBoj8Mc0c/xkbOowa0vLyIYvg4Xd+p1Lf6LAh+h5\n' +
  'aDMD7VvdOgYrPPWzonimbSoT+D9E+C3fMQ7gdKtqNkWX6JmgJV3BZPMcxQhGhR35\n' +
  'q0gZXe1+obHVEL1+501z+vNrwx7Pomg1kEb064efkkAJQ4tIHGzXiJoALtXuOCvJ\n' +
  'GQ2m/AJuR5VY5EdWd+mqnjBQ4nZWlN/IH1bogLlucWDJgN2Y7dPf//////////8C\n' +
  'AQIENQIzAJA6V8YgS39f2yjKWzyil2rEtbBzIRp8R0xpS9FHWNNK9yJfNOCWWyd4\n' +
  'JzZtAzDrGdvC\n'                                                     +
  '-----END PRIVATE KEY-----\n';

let pub_DH_modp8192: string =
  '-----BEGIN PUBLIC KEY-----\n'                                       +
  'MIIIJDCCBBcGCSqGSIb3DQEDATCCBAgCggQBAP//////////yQ/aoiFowjTExmKL\n' +
  'gNwc0SkCTgiKZ8x0Agu+pjsTmyJRSgh5jjQE3e+VGbPNOkMbMCsKbfJfFDdP4TVt\n' +
  'bVHCReSFtXZiXn7G9ExC6aY37WsL/1y29Aa37e44a/taiZ+lrp8kEXxLH+ZJKGZR\n' +
  '7ORbPcIAfLihY78FmNpINhxV05ppFj+o/STPX4NlXSPco62WHGLzViCFUrue1SkH\n' +
  'cJaWbWcMNU5KvJgE8XRsCMoYIXwykF5GLjbOO+OedywYDoYDmyeDouwHoo+1xV3w\n' +
  'b0xSyd4ry/aVWBcYOZVJfOqVauUV0iYYmPoFEBVyjlqKqsQtrTMXDQRQejOoVSGr\n' +
  '3xy6ZOz7hQRY2+8KiupxV10GDH2zlw+FpuHkx6v1rozbCTPXHoyU4EolYZ3O49Im\n' +
  'GtLua/Ev+gbZighk2HYCcz7IamRSHysYF3sgDLvhF1d6YV1sdwmIwLrZRuII4k+g\n' +
  'dOWrMUPbW/zg/RCOS4LRIKkhCAEacjwSp4fm14hxmhC9ulsmmcMnGGr04jwalGg0\n' +
  'thUL2iWD6coq1Ezo27vC2wTejvkujvwUH77Kpih8WUdOa8BdmbKWT6CQw6IjO6GG\n' +
  'UVvn7R9hKXDO4tevuBvddiFwSBzQBpEn1bBaqZO06piNj93Bhv+33JCmwI9N9DXJ\n' +
  'NAKEkjbD+rTSfHAmwdTcsmAmRt7JdR52Pbo3vfj/lAatnlMO5ds4L0EwAa6walPt\n' +
  'kCfYMReXJ7CGWokY2j7b68+bFO1Ezmy6ztS7G9t/FEfmzCVLMyBRUSvXr0JvuPQB\n' +
  'N4zSv1mDygHGS5Ls8DLqFdFyHQP0gtfObnT+9tVecC9GmAyCtahAMZALHJ5Z58l/\n' +
  'vsfo8yOpen42zIi+Dx1Ft/9YWsVL1AeyK0FUqsyPbX6/SOHYFMxe0g+AN+CnlxXu\n' +
  '8pvjKAah1Yu3xdp29VCqPYofv/DrGcyxoxPVXNpWyewu8pYyOH/o1248BGgEPo9m\n' +
  'P0hg7hK/LVsLdHTW5pT5Hm2+EVl0o5JvEv7l5Dh3fLapMt+M2L7E0HO5Mbo7yDK2\n' +
  'jZ3TAHQfp7+K/EftJXb2k2ukJGY6q2OcWuT1aDQjtHQr8cl4I48Wy+OdZS3j/bi+\n' +
  '/ISK2SIiLgSkA3wHE+tXqBoj8Mc0c/xkbOowa0vLyIYvg4Xd+p1Lf6LAh+h5aDMD\n' +
  '7VvdOgYrPPWzonimbSoT+D9E+C3fMQ7gdKtqNkWX6JmgJV3BZPMcxQhGhR35q0gZ\n' +
  'Xe1+obHVEL1+501z+vNrwx7Pomg1kEb064efkkAJQ4tIHGzXiJoALtXuOCvJGQ2m\n' +
  '/AJuR5VY5EdWd+mqnjBQ4nZWlN/IH1bogLlucWDJgN2Y7dPf//////////8CAQID\n' +
  'ggQFAAKCBAB6RLQc+J0oUfYyzf7fJCP7zeYs+f4Q4w4XF8sSD2XnkxUkR3RXRNf1\n' +
  'nMD6x+lFq4zDG5YyrW1gfYTVe5cOppPpaadoY5JYWTjMOAoX/J2o4gsL7KFmrsdP\n' +
  'kwapn5fcaHJQK/JyittuLdQtatd52zz68ZaslpLxkZCbDPYKJmD0BiG8PuqiI4W/\n' +
  'WovJec6Oko1Ku/HGJ98C4nPmxLakg/DjnAKKabJlG4nd1q2I019jDYNcFO4gWMiS\n' +
  'z2khfq5UcM/iv8QZJfQrqWpGelYvXIEOtR9HG8BT1GKqLFn7oDxSWSVM8LdLEwSR\n' +
  'peegHFW/UvdFcnTCsaLYh01yLIrES/8JvqZP+rLQiJAI3SCQ9smHDc8x4PThAB/u\n' +
  'NagviXXxfyYzSpVW65zDnlHlOPQ++iBlh7jWaIDrLHShfufJeWqRfS6/qtzrOPzU\n' +
  'Raz2+OgBckF7GIucB0eM/iS6jCFMeVTI3ke2OTw9y2Sk8yeWh6f2/Z6lB3ogcKqn\n' +
  'ue94479BHaHr1YinkDy/z/SdU1hCsqSlgBuQ30ouOFGXIyYmC3vbjLo8q5dpgd/V\n' +
  'lMhGfG7MZfYpKWsQyrnGMBuyjz6dJfZcFu+bDX2Jjla/sGq+lSeTr6BSUqPYkSgP\n' +
  'MGZ12p5J5sktKxRmapaMnMJGiiW6uROkOuyeTXkLQt8AKHIw9bAP1BEVmx4WRrXe\n' +
  'CYCuO9zb+Bb4sw/FF5nNySiukGvmhYLNwajCZJGq6myLq06n65GhwxNyXBNa5nBN\n' +
  'E4HU7RDDJWMWgX/UQmBH37uGbDSchwWfYCa94kqQpJLIBzS0bfsaQV3VZwOJXTs8\n' +
  'p+WWCoS/0NmwxZ4YvouwH/TKkfYgN+m7QFzvd2vy/bc/nRnDmJcQMA3LQoSpgAFg\n' +
  'MQnYo0pSzjWbAmFTkx7emwOKr5+e5YJfKWthHYjEj2EnhgolZfqXtvmxPeA7YvT2\n' +
  'l2FWsIAyu8b5t6s3PrPCal87r3ExMa42Ar+PtLpMmBaqhEPx8CLDWkZcpjKS7YSw\n' +
  'euir1b2FFT+tjx5moWs/PlQLnlC3mRJHknCsK2vrkVUMrfiwhSV/J+Zd1io9sGin\n' +
  'K7IcTIMEBKERaUKmwIJmkh+TgqfoULlAFE6VvioL/f+EV/8XnArwzl7uvNJjn8LF\n' +
  'ScYslsJW9DpoS5JsvtTG6Vr9fGL4JGJfCuyZuZwizHfcNiKvRr2dUrTruYr1AUXE\n' +
  'YiX1YEY8P3wjUOuTrBg4jKA3/H7k3f9MZwaZ96cRQnAu7YoXf3JWOoxrBLUtAXel\n' +
  'xfh8UFYygEAUL1gV0fARrmRUWO8jNML5ZanzYWqjZf6eG5Ns3yOlwC/l17fZvHga\n' +
  '3AVWr7ZnX/X8BT8rlhRTO6x6mQgntE2R\n'                                 +
  '-----END PUBLIC KEY-----\n';

async function createAsyKeySync(algName: string): Promise<cryptoFramework.KeyPair> {
  try {
    let asyKeyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
    let syncAsyKey: cryptoFramework.KeyPair = {} as cryptoFramework.KeyPair;
    if (algName === "RSA2048") {
      syncAsyKey = asyKeyGenerator.convertPemKeySync(rsa.pubKeyPkcs1Str2048, rsa.priKeyPkcs1Str2048);
    } else if (algName === "RSA3072") {
      syncAsyKey = asyKeyGenerator.convertPemKeySync(rsa.pubKeyPkcs1Str3072, rsa.priKeyPkcs1Str3072);
    } else if (algName === "RSA4096") {
      syncAsyKey = asyKeyGenerator.convertPemKeySync(rsa.pubKeyPkcs1Str4096, rsa.priKeyPkcs1Str4096);
    } else if (algName === "RSA8192") {
      syncAsyKey = asyKeyGenerator.convertPemKeySync(rsa.pubKeyPkcs1Str8192, rsa.priKeyPkcs1Str8192);
    } else if (algName === "DSA2048") {
      syncAsyKey = await asyKeyGenerator.convertPemKey(pub_dsa_2048, pri_dsa_2048);
    } else if (algName === "DH_ffdhe4096") {
      syncAsyKey = await asyKeyGenerator.convertPemKey(pub_DH_ffdhe4096, pri_DH_ffdhe4096);
    } else if (algName === "DH_ffdhe6144") {
      syncAsyKey = await asyKeyGenerator.convertPemKey(pub_DH_ffdhe6144, pri_DH_ffdhe6144);
    } else if (algName === "DH_ffdhe8192") {
      syncAsyKey = await asyKeyGenerator.convertPemKey(pub_DH_ffdhe8192, pri_DH_ffdhe8192);
    } else if (algName === "DH_modp2048") {
      syncAsyKey = await asyKeyGenerator.convertPemKey(pub_DH_modp2048, pri_DH_modp2048);
    } else if (algName === "DH_modp3072") {
      syncAsyKey = await asyKeyGenerator.convertPemKey(pub_DH_modp3072, pri_DH_modp3072);
    } else if (algName === "DH_modp4096") {
      syncAsyKey = await asyKeyGenerator.convertPemKey(pub_DH_modp4096, pri_DH_modp4096);
    } else if (algName === "DH_modp6144") {
      syncAsyKey = await asyKeyGenerator.convertPemKey(pub_DH_modp6144, pri_DH_modp6144);
    } else if (algName === "DH_modp8192") {
      syncAsyKey = await asyKeyGenerator.convertPemKey(pub_DH_modp8192, pri_DH_modp8192);
    } else {
      syncAsyKey = await asyKeyGenerator.generateKeyPair();
    }

    return syncAsyKey;
  } catch (error) {
    console.error('sync error, ' + error.code + " errorMsg " + error.message);
    throw error as Error;
  }
}

function convertAsyKeySync(algName: string, pubKeyData: cryptoFramework.DataBlob|null,
                           priKeyData: cryptoFramework.DataBlob|null): cryptoFramework.KeyPair {
  try {
    let asyKeyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
    let syncAsyKey: cryptoFramework.KeyPair = asyKeyGenerator.convertKeySync(pubKeyData, priKeyData);

    return syncAsyKey;
  } catch (error) {
    console.error('sync error, ' + error.code + " errorMsg " + error.message);
    throw error as Error;
  }
}

async function createAsyKeyPromise(algName: string): Promise<cryptoFramework.KeyPair> {
  try {
    let asyKeyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
    let syncAsyKey: cryptoFramework.KeyPair = await asyKeyGenerator.generateKeyPair();

    return syncAsyKey;
  } catch (error) {
    console.error('sync error, ' + error.code + " errorMsg " + error.message);
    throw error as Error;
  }
}

async function convertAsyKeyPromise(algName: string, pubKeyData: cryptoFramework.DataBlob, priKeyData: cryptoFramework.DataBlob): Promise<cryptoFramework.KeyPair> {
  try {
    let asyKeyGenerator: cryptoFramework.AsyKeyGenerator = cryptoFramework.createAsyKeyGenerator(algName);
    let syncAsyKey: cryptoFramework.KeyPair = await  asyKeyGenerator.convertKey(pubKeyData, priKeyData);

    return syncAsyKey;
  } catch (error) {
    console.error('sync error, ' + error.code + " errorMsg " + error.message);
    throw error as Error;
  }
}

function genRsaPubKeySpec(nIn: bigint, eIn: bigint): cryptoFramework.RSAPubKeySpec {
  let rsaCommSpec: cryptoFramework.RSACommonParamsSpec = {
    n: nIn,
    algName: 'RSA',
    specType: cryptoFramework.AsyKeySpecType.COMMON_PARAMS_SPEC
  };
  let rsaPubKeySpec: cryptoFramework.RSAPubKeySpec = {
    params: rsaCommSpec,
    pk: eIn,
    algName: 'RSA',
    specType: cryptoFramework.AsyKeySpecType.PUBLIC_KEY_SPEC
  };
  return rsaPubKeySpec;
}


function genRsa2048PubKeySpec() {
  let nIn = BigInt('0x9260d0750ae117eee55c3f3deaba74917521a262ee76007cdf8a56755ad73a1598a1408410a01434c3f5bc54a88b57fa19fc4328daea0750a4c44e88cff3b2382621b80f670464433e4336e6d003e8cd65bff211da144b88291c2259a00a72b711c116ef7686e8fee34e4d933c868187bdc26f7be071493c86f7a5941c3510806ad67b0f94d88f5cf5c02a092821d8626e8932b65c5bd8c92049c210932b7afa7ac59c0e886ae5c1edb00d8ce2c57633db26bd6639bff73cee82be9275c402b4cf2a4388da8cf8c64eefe1c5a0f5ab8057c39fa5c0589c3e253f0960332300f94bea44877b588e1edbde97cf2360727a09b775262d7ee552b3319b9266f05a25');
  let eIn = BigInt('0x010001');
  return genRsaPubKeySpec(nIn, eIn);
}

function compareRsaPubKeyBySpec(rsaKeySpec: cryptoFramework.RSAPubKeySpec, n: bigint | string | number, e: bigint | string | number) {
  if (typeof n === 'string' || typeof e === 'string') {
    console.error('type is string');
    return false;
  }
  if (typeof n === 'number' || typeof e === 'number') {
    console.error('type is number');
    return false;
  }
  if (rsaKeySpec.params.n != n) {
    return false;
  }
  if (rsaKeySpec.pk != e) {
    return false;
  }
  return true;
}

function genEccCommonSpec(): cryptoFramework.ECCCommonParamsSpec {
  let fieldFp: cryptoFramework.ECFieldFp = {
    fieldType: 'Fp',
    p: BigInt('0xffffffffffffffffffffffffffffffff000000000000000000000001')
  }
  let G: cryptoFramework.Point = {
    x: BigInt('0xb70e0cbd6bb4bf7f321390b94a03c1d356c21122343280d6115c1d21'),
    y: BigInt('0xbd376388b5f723fb4c22dfe6cd4375a05a07476444d5819985007e34')
  }
  let eccCommonSpec: cryptoFramework.ECCCommonParamsSpec = {
    algName: 'ECC',
    specType: cryptoFramework.AsyKeySpecType.COMMON_PARAMS_SPEC,
    field: fieldFp,
    a: BigInt('0xfffffffffffffffffffffffffffffffefffffffffffffffffffffffe'),
    b: BigInt('0xb4050a850c04b3abf54132565044b0b7d7bfd8ba270b39432355ffb4'),
    g: G,
    n: BigInt('0xffffffffffffffffffffffffffff16a2e0b8f03e13dd29455c5c2a3d'),
    h: 1
  }
  return eccCommonSpec;
}

function genSM2KeyPairSpec() {
  let sm2CommonParamsSpec = cryptoFramework.ECCKeyUtil.genECCCommonParamsSpec('NID_sm2');
  let sm2KeyPairSpec: cryptoFramework.ECCKeyPairSpec = {
    algName: "SM2",
    specType: cryptoFramework.AsyKeySpecType.KEY_PAIR_SPEC,
    params: sm2CommonParamsSpec,
    sk: BigInt('0x6330B599ECD23ABDC74B9A5B7B5E00E553005F72743101C5FAB83AEB579B7074'),
    pk: {
      x: BigInt('0x67F3B850BDC0BA5D3A29D8A0883C4B17612AB84F87F18E28F77D824A115C02C4'),
      y: BigInt('0xD48966CE754BBBEDD6501A1385E1B205C186E926ADED44287145E8897D4B2071')
    },
  };
  return sm2KeyPairSpec;
}

function showBigIntInfo(bnName: string, bnValue: bigint | string | number) {
  if (typeof bnValue === 'string') {
    console.error('type is string');
    return;
  }
  if (typeof bnValue === 'number') {
    console.error('type is number');
    return;
  }
  console.info(bnName + ':');
  console.info('. Decimal: ' + bnValue.toString());
  console.info('. Hexadecimal: ' + bnValue.toString(16));
  console.info('. Length (bits): ' + bnValue.toString(2).length);
}

function showEccSpecDetailInfo(key: cryptoFramework.PubKey | cryptoFramework.PriKey, keyType: string) {
  console.info('show detail of ' + keyType + ':');
  try {
    let p = key.getAsyKeySpec(cryptoFramework.AsyKeySpecItem.ECC_FP_P_BN);
    showBigIntInfo('--- p', p);
    let a = key.getAsyKeySpec(cryptoFramework.AsyKeySpecItem.ECC_A_BN);
    showBigIntInfo('--- a', a);
    let b = key.getAsyKeySpec(cryptoFramework.AsyKeySpecItem.ECC_B_BN);
    showBigIntInfo('--- b', b);
    let gX = key.getAsyKeySpec(cryptoFramework.AsyKeySpecItem.ECC_G_X_BN);
    showBigIntInfo('--- gX', gX);
    let gY = key.getAsyKeySpec(cryptoFramework.AsyKeySpecItem.ECC_G_Y_BN);
    showBigIntInfo('--- gY', gY);
    let n = key.getAsyKeySpec(cryptoFramework.AsyKeySpecItem.ECC_N_BN);
    showBigIntInfo('--- n', n);
    let h = key.getAsyKeySpec(cryptoFramework.AsyKeySpecItem.ECC_H_NUM);
    console.warn('--- h: ' + h);
    let fieldType = key.getAsyKeySpec(cryptoFramework.AsyKeySpecItem.ECC_FIELD_TYPE_STR);
    console.warn('--- field type: ' + fieldType);
    let fieldSize = key.getAsyKeySpec(cryptoFramework.AsyKeySpecItem.ECC_FIELD_SIZE_NUM);
    console.warn('--- field size: ' + fieldSize);
    let curveName = key.getAsyKeySpec(cryptoFramework.AsyKeySpecItem.ECC_CURVE_NAME_STR);
    console.warn('--- curve name: ' + curveName);
    if (keyType == 'priKey') {
      let sk = key.getAsyKeySpec(cryptoFramework.AsyKeySpecItem.ECC_SK_BN);
      showBigIntInfo('--- sk', sk);
    } else if (keyType == 'pubKey') {
      let pkX = key.getAsyKeySpec(cryptoFramework.AsyKeySpecItem.ECC_PK_X_BN);
      showBigIntInfo('--- pkX', pkX);
      let pkY = key.getAsyKeySpec(cryptoFramework.AsyKeySpecItem.ECC_PK_Y_BN);
      showBigIntInfo('--- pkY', pkY);
    }
  } catch (e) {
    console.error(`getAsyKeySpec failed, ${e.code}, ${e.message}`);
  }
}

function genEccPriKeySpec(xIn: bigint, yIn: bigint, aIn: bigint, bIn: bigint, pIn: bigint,
                          nIn: bigint, hIn: number, skIn: bigint): cryptoFramework.ECCPriKeySpec {
  let field: cryptoFramework.ECFieldFp = {
    fieldType: "Fp",
    p: pIn
  };
  let g: cryptoFramework.Point = {
    x: xIn,
    y: yIn
  };
  let params: cryptoFramework.ECCCommonParamsSpec = {
    field: field,
    a: aIn,
    b: bIn,
    g: g,
    n: nIn,
    h: hIn,
    algName: "ECC",
    specType: cryptoFramework.AsyKeySpecType.COMMON_PARAMS_SPEC
  };

  let eccPriKeySpec: cryptoFramework.ECCPriKeySpec = {
    params: params,
    sk: skIn,
    algName: "ECC",
    specType: cryptoFramework.AsyKeySpecType.PRIVATE_KEY_SPEC
  }

  return eccPriKeySpec;
}

let ASY_RSA_KEY_SPEC = [
  [["RSA512"], ["PRIMES_2"]],
  [["RSA768"], ["PRIMES_2"]],
  [["RSA1024"], ["PRIMES_2", "PRIMES_3"]],
]

let ASY_ECC_KEY_SPEC_1 = [
  "ECC224", "ECC256", "ECC384", "ECC521", "ECC_BrainPoolP160r1", "ECC_BrainPoolP160t1",
]

let ASY_ECC_KEY_SPEC_2 = [
  "ECC_BrainPoolP192r1", "ECC_BrainPoolP224r1",
  "ECC_BrainPoolP256r1", "ECC_BrainPoolP320r1",
  "ECC_BrainPoolP384r1", "ECC_BrainPoolP512r1",
]

let ASY_ECC_KEY_SPEC_3 = [
  "ECC_BrainPoolP192t1", "ECC_BrainPoolP224t1",
  "ECC_BrainPoolP256t1", "ECC_BrainPoolP320t1",
  "ECC_BrainPoolP384t1", "ECC_BrainPoolP512t1",
]

let ASY_DSA_KEY_SPEC_1 = [
  "DSA1024"
]

let ASY_DSA_KEY_SPEC_2 = [
  "DSA2048"
]

let ASY_SM2_KEY_SPEC = [
  "SM2_256"
]

let ASY_25519_KEY_SPEC = [
  "Ed25519", "X25519"
]

let ASY_DH_KEY_SPEC_1 = [
  "DH_modp1536", "DH_modp2048", "DH_modp3072", "DH_modp4096",
]

let ASY_DH_KEY_SPEC_2 = [
  "DH_modp6144", "DH_modp8192", "DH_ffdhe2048", "DH_ffdhe3072",
]

let ASY_DH_KEY_SPEC_3 = [
  "DH_ffdhe4096", "DH_ffdhe6144", "DH_ffdhe8192"
]

export {
  createAsyKeySync,
  convertAsyKeySync,
  createAsyKeyPromise,
  convertAsyKeyPromise,
  genSM2KeyPairSpec,
  genRsa2048PubKeySpec,
  compareRsaPubKeyBySpec,
  genEccCommonSpec,
  genEccPriKeySpec,
  showEccSpecDetailInfo,
  ASY_RSA_KEY_SPEC,
  ASY_ECC_KEY_SPEC_1,
  ASY_ECC_KEY_SPEC_2,
  ASY_ECC_KEY_SPEC_3,
  ASY_DSA_KEY_SPEC_1,
  ASY_DSA_KEY_SPEC_2,
  ASY_SM2_KEY_SPEC,
  ASY_25519_KEY_SPEC,
  ASY_DH_KEY_SPEC_1,
  ASY_DH_KEY_SPEC_2,
  ASY_DH_KEY_SPEC_3,
}