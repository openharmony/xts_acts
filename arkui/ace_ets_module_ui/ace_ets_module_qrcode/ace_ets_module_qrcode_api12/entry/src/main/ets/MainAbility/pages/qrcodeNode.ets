import { typeNode, NodeController, FrameNode } from  '@ohos.arkui.node';
let data:(string) =  '123'

class MyNodeController extends  NodeController {
  makeNode(uiContext: UIContext): FrameNode | null {
    let node = new FrameNode(uiContext)
    let scroll = typeNode.createNode(uiContext, 'Scroll')
    let col = typeNode.createNode(uiContext, 'Column')
    col.initialize({ space: 10 }).borderColor(Color.Black).alignItems(HorizontalAlign.Center).width('50%')
    let text = typeNode.createNode(uiContext, 'Text')
    text.initialize('command')
    let qrcode = typeNode.createNode(uiContext, 'QRCode')
    qrcode.initialize(data).width(100).color(Color.Blue).contentOpacity(undefined).key('key_QRCode_001')
    
    col.appendChild(qrcode)
    scroll.appendChild(col)
    node.appendChild(scroll)
    return node
  }
}
@Entry
@Component
struct qrcode {
  private myNodeController: MyNodeController = new MyNodeController()
  build() {
    Row() {
      NodeContainer(this.myNodeController)
      Column({space: 10}){
        QRCode(data).width(100).color(Color.Blue).backgroundColor(Color.White)

      }.width('50%')
    }.width('100%')

  }
}