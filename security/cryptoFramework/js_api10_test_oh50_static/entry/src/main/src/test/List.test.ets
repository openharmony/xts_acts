import abilityTest from "./Ability.test";
import SecurityCryptoFwSignRecoverRSARecoverTestUnit from './SecurityCryptoFwSignVerifyRSARecover.test'
import SecurityCryptoFwSymKeyGeneratorTestUnit from './SecurityCryptoFwSymKeyGenerator.test'
import SecurityCryptoFwSymEncryptAndDecryptTestUnit from './SecurityCryptoFwSymEncryptAndDecrypt.test'
import SecurityCryptoFwAsyKeyGeneratorTestUnit from './SecurityCryptoFwAsyKeyGenerator.test'
import SecurityCryptoFwHkdfTestUnit from './SecurityCryptoFwHkdf.test'
import SecurityCryptoFwMd5TestUnit from './SecurityCryptoFwMd5.test'
import SecurityCryptoFwECCRfc5208TestUnit from './SecurityCryptoFwRfc5915ToRfc5208.test'
import SecurityCryptoFwDigestSyncTestUnit from './SecurityCryptoFwDigestSync.test'
import SecurityCryptoFwPbkdf2TestUnit from './SecurityCryptoFwPbkdf2Sync.test'
import SecurityCryptoFwHmacSyncTestUnit from './SecurityCryptoHmacSync.test'
import SecurityCryptoFwAgreementSyncTestUnit from './SecurityCryptoFwNegotiateAlgSync.test'
import SecurityCryptoFwSignVerifySyncTestUnit from './SecurityCryptoFwSignVerify.test'
import SecurityCryptoFwPkcs1ToPkcs8TestUnit from './SecurityCryptoFwPkcs1ToPkcs8.test'
import SecurityCryptoFwVectorTestUnit from './SecurityCryptoFwVector.test'
import SecurityCryptoFwDataBlobToPemTestUnit from './SecurityCryptoFwExternalPemDataBlobToKeyPair.test'
import SecurityCryptoFwSECP256K1TestUnit from './SecurityCryptoFwSecp256k1.test'
import SecurityCryptoFwRSAEncodeDecodeWithSecretTestUnit from './SecurityCryptoFwRSAencodeDecodeWithSecret.test'
import SecurityCryptoFwCmacTestUnit from './SecurityCryptoFwCmac.test'
import SecurityCryptoFwScryptKdfTestUnit from './SecurityCryptoFwScryptKdf.test'
import SecurityCryptoFwErrCodeTestUnit from './SecurityCryptoErrCode.test'
import SecurityCryptoFwDESTestUnit from './SecurityCryptoFwDes.test'
export default function testsuite() {
  abilityTest();
  SecurityCryptoFwSignRecoverRSARecoverTestUnit();
  SecurityCryptoFwSymKeyGeneratorTestUnit();
  SecurityCryptoFwSymEncryptAndDecryptTestUnit();
  SecurityCryptoFwAsyKeyGeneratorTestUnit();
  SecurityCryptoFwHkdfTestUnit();
  SecurityCryptoFwECCRfc5208TestUnit();
  SecurityCryptoFwMd5TestUnit();
  SecurityCryptoFwDigestSyncTestUnit();
  SecurityCryptoFwHmacSyncTestUnit();
  SecurityCryptoFwPbkdf2TestUnit();
  SecurityCryptoFwAgreementSyncTestUnit();
  SecurityCryptoFwSignVerifySyncTestUnit();
  SecurityCryptoFwPkcs1ToPkcs8TestUnit();
  SecurityCryptoFwVectorTestUnit();
  SecurityCryptoFwDataBlobToPemTestUnit();
  SecurityCryptoFwSECP256K1TestUnit();
  SecurityCryptoFwRSAEncodeDecodeWithSecretTestUnit();
  SecurityCryptoFwCmacTestUnit();
  SecurityCryptoFwScryptKdfTestUnit();
  SecurityCryptoFwErrCodeTestUnit();
  SecurityCryptoFwDESTestUnit();
}