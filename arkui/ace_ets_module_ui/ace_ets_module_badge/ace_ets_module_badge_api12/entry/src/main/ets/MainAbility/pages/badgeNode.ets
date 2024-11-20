import { typeNode, NodeController, FrameNode } from  '@ohos.arkui.node';
let data1: BadgeParamWithNumber = {
  count: 201,
  maxCount: 200,
  style: {},
  position: undefined
}
let data2: BadgeParamWithString = {
  value: '123123',
  style: {
    color: Color.Black,
    badgeColor: Color.Brown,
    borderColor: Color.Orange,
    badgeSize: '30vp',
    borderWidth: 5,
    fontWeight: 'bolder',
    fontSize: '20vp'
  },
  position: undefined
}
class MyNodeController extends  NodeController {
  makeNode(uiContext: UIContext): FrameNode | null {
    let node = new FrameNode(uiContext)
    let col = typeNode.createNode(uiContext, 'Column')
    let row = typeNode.createNode(uiContext, 'Row')
    col.initialize({ space: 10 }).borderColor(Color.Black).alignItems(HorizontalAlign.Center)

    let badgeNumber = typeNode.createNode(uiContext, 'Badge')
    badgeNumber.initialize(data1).width(20).key('key_ badge_001')
    let imageNumber = typeNode.createNode(uiContext, 'Image')
    imageNumber.initialize($r('app.media.icon')).width(100)
    badgeNumber.appendChild(imageNumber)

    let badgeString = typeNode.createNode(uiContext, 'Badge')
    badgeString.initialize(data2)
    let imageString = typeNode.createNode(uiContext, 'Image')
    imageString.initialize($r('app.media.icon')).width(100)
    badgeString.appendChild(imageString)


    col.appendChild(badgeNumber)
    col.appendChild(badgeString)
    node.appendChild(col)
    node.appendChild(row)
    return node
  }
}
@Entry
@Component
struct badge {
  private myNodeController: MyNodeController = new MyNodeController()
  build() {
    Column({ space: 10 }) {
      NodeContainer(this.myNodeController)
      Text('origin')
      Badge(data1){
       Image($r('app.media.icon'))
         .width(100)
      }
      Badge(data2){
         Image($r('app.media.icon'))
           .width(100)
      }
    }
    .width('100%')
    .alignItems(HorizontalAlign.Center)
  }
}