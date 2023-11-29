import preferencescallback from './PreferencesCallBack.test'
import preferenceshelper from './PreferencesHelper.test'
import preferencespromise from './PreferencesPromise.test'
import preferencescallbackwitherror from './PreferencesCallBackWithError.test'
import preferencespromisewitherror from './PreferencesPromiseWithError.test'
import preferencesIgnoreTest from './PreferencesIgnore.test'


export default function testsuite() {
  preferencescallback()
  preferenceshelper()
  preferencespromise()
  preferencescallbackwitherror()
  preferencespromisewitherror()
  preferencesIgnoreTest()
}