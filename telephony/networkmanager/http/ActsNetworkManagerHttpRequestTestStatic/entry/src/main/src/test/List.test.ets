import httpRequestMethodTest from "./HttpRequestMethod.test";
import httpRequestOptionsTest from "./HttpRequestOptions.test";
import httpRequestDestroyTest from './HttpRequestDestroy.test';
import httpRequestErrorCodeTest from "./HttpRequestErrorCode.test";

export default function testsuite() {
    httpRequestMethodTest();
    httpRequestOptionsTest();
    httpRequestDestroyTest();
    httpRequestErrorCodeTest();
}
