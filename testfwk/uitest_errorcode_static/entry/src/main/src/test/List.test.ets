import uitestComponentErrorTest from './UitestComponentErrorCode.test'
import uitestDriverErrorTest from './UitestDriverErrorCode.test'
import uitestUiWindowErrorTest from './UitestUiWindowErrorCode.test'
export default function testsuite() {
  uitestComponentErrorTest();
  uitestDriverErrorTest();
  uitestUiWindowErrorTest();
}