import WebSocketTest from "./WebSocket.test";
import webSocketCreateTest from "./WebSocketCreate.test";
import webSocketJsunit from './WebSocketJsunit.test';
export default function testsuite() {
    webSocketCreateTest();
    WebSocketTest();
    webSocketJsunit();
}
