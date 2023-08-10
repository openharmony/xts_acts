import intelligentVoiceManagerApi10Test from './IntelligentVoiceManagerApi10.test'
import enrollIntelligentVoiceEngineTest from './EnrollIntelligentVoiceEngine.test'
import wakeupIntelligentVoiceEngineTest from './WakeupIntelligentVoiceEngine.test'

export default function testsuite() {
  intelligentVoiceManagerApi10Test()
  enrollIntelligentVoiceEngineTest()
  wakeupIntelligentVoiceEngineTest()
}