import { typeNode, NodeController, FrameNode } from  '@ohos.arkui.node';
import { MenuItemModifier, SymbolGlyphModifier } from '@kit.ArkUI'

let symbolModifier1: SymbolGlyphModifier = new SymbolGlyphModifier($r('sys.symbol.ohos_trash')).fontColor([Color.Gray]);
let symbolModifier2: SymbolGlyphModifier = new SymbolGlyphModifier($r('sys.symbol.exposure')).fontColor([Color.Gray]);

class MyNodeController extends  NodeController {
  makeNode(uiContext: UIContext): FrameNode | null {
    let node = new FrameNode(uiContext)
    let col = typeNode.createNode(uiContext, 'Column')
    col.initialize()
    let select = typeNode.createNode(uiContext, 'Select')
    select.initialize([{ value: 'item1', icon: $r('app.media.icon'), symbolIcon: symbolModifier1 },
      { value: 'item1', icon: $r('app.media.icon'), symbolIcon: symbolModifier2 },
      { value: 'item1', icon: $r('app.media.icon'), symbolIcon: undefined } ,
      { value: 'item1', icon: $r('app.media.icon'), symbolIcon: null }])
      .key('key_Select_001')
    node.appendChild(col)
    col.appendChild(select)
    return node
  }
}

@Entry
@Component
struct SelectExample {
  private myNodeController: MyNodeController = new MyNodeController()
  build() {
    Column() {
      NodeContainer(this.myNodeController).margin({top:50})
    }
  }
}