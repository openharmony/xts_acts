import { typeNode, NodeController, FrameNode } from '@ohos.arkui.node';

interface Info {
  start: boolean;
  step?: number;
  loop?: number;
  fromStart?: boolean;
  src: string;
}

let data: Info = {
  start: true,
  step: 6,
  loop: undefined,
  fromStart: false,
  src: 'Running Marquee Running Marquee Running Marquee'
}


class MyNodeController extends NodeController {
  makeNode(uiContext: UIContext): FrameNode | null{
    let node = new FrameNode(uiContext)
    let col = typeNode.createNode(uiContext, 'Column')
    col.initialize({ space: 10 }).borderColor(Color.Black).alignItems(HorizontalAlign.Center)
    let marquee = typeNode.createNode(uiContext, 'Marquee')
    marquee.initialize(undefined)
    marquee.initialize(data)
      .width(300)
      .height(80)
      .fontColor('#FFFFFF')
      .fontSize(48)
      .fontWeight(700)
      .marqueeUpdateStrategy(MarqueeUpdateStrategy.DEFAULT)
      .backgroundColor('#182431')
      .key('key_marquee_Node_001')
      .margin({ bottom: 40 })
    col.appendChild(marquee)
    node.appendChild(col)
    console.log('marqueeNode0100: page' + new Date().getTime())
    return node
  }
}
@Entry
@Component
struct qrcode {
  private fromStart: boolean = false
  private step: number = 10
  private loop: number = 4
  @State marqueeText: string = 'Running Marquee Running Marquee'
  @State fontSize: number = 12
  private myNodeController: MyNodeController = new MyNodeController()
  build(){
    Column({ space: 10 }) {
      NodeContainer(this.myNodeController)
    }.width('100%')
    .alignItems(HorizontalAlign.Center)
  }
}