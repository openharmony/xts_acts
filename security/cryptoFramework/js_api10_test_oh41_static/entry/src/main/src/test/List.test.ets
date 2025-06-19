import abilityTest from "./Ability.test";
import SecurityCryptoFwCipherSM2TestUnit from './SecurityCryptoFwCipherSM2.test'
import SecurityCryptoFwGenECCCommonSpecTestUnit from './SecurityCryptoFwGenECCCommonSpec.test'
import SecurityCryptoFwKeyGenerateECCTestUnit from './SecurityCryptoFwKeyGenerateECC.test'
import SecurityCryptoFwKeyGenerateDHTestUnit from './SecurityCryptoFwKeyGenerateDH.test'
import SecurityCryptoFwAgreementDHTestUnit from './SecurityCryptoFwAgreementDH.test'
import SecurityCryptoFwAgreementECCTestUnit from './SecurityCryptoFwAgreementECC.test'
import SecurityCryptoFwAgreementECCBrainPoolTestUnit from './SecurityCryptoFwAgreementECCBrainPool.test'
import SecurityCryptoFwKeyGenerateECCBrainPoolTestUnit from './SecurityCryptoFwKeyGenerateECCBrainPool.test'
import SecurityCryptoFwKeyGenerateSM2TestUnit from './SecurityCryptoFwKeyGenerateSM2.test'
import SecurityCryptoFwSignVerifyECCTestUnit from './SecurityCryptoFwSignVerifyECC.test'
import SecurityCryptoFwSignVerifyECCBrainPoolTestUnit from './SecurityCryptoFwSignVerifyECCBrainPool.test'
import SecurityCryptoFwSignVerifySM2TestUnit from './SecurityCryptoFwSignVerifySM2.test'
export default function testsuite() {
  abilityTest();
  SecurityCryptoFwCipherSM2TestUnit();
  SecurityCryptoFwGenECCCommonSpecTestUnit();
  SecurityCryptoFwKeyGenerateECCTestUnit();
  SecurityCryptoFwKeyGenerateDHTestUnit();
  SecurityCryptoFwAgreementDHTestUnit();
  SecurityCryptoFwAgreementECCTestUnit();
  SecurityCryptoFwAgreementECCBrainPoolTestUnit();
  SecurityCryptoFwKeyGenerateECCBrainPoolTestUnit();
  SecurityCryptoFwKeyGenerateSM2TestUnit();
  SecurityCryptoFwSignVerifyECCTestUnit();
  SecurityCryptoFwSignVerifyECCBrainPoolTestUnit();
  SecurityCryptoFwSignVerifySM2TestUnit();
}