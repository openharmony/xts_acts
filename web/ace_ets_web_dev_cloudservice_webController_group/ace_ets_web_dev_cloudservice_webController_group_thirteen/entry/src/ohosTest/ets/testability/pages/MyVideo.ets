import { BuilderNode, FrameNode, NodeController, NodeRenderType } from '@kit.ArkUI';

@Component
export struct MyVideo {
  @Link src: string;

  build() {
    Video({
      src: this.src
    });
  }
}

interface ComponentParams {}

export class MyNodeController extends NodeController {
  private rootNode: BuilderNode<[ComponentParams]> | undefined;

  constructor(surfaceId: string, renderType: NodeRenderType) {
    super();

    // 获取之前保存的 UIContext 。
    let uiContext = AppStorage.get<UIContext>('UIContext');
    this.rootNode = new BuilderNode(uiContext as UIContext, { surfaceId: surfaceId, type: renderType });
  }

  makeNode(uiContext: UIContext): FrameNode | null {
    if (this.rootNode) {
      return this.rootNode.getFrameNode() as FrameNode;
    }
    return null;
  }

  build() {
    // 构造本地播放器组件
    return MyVideo;
  }
}
