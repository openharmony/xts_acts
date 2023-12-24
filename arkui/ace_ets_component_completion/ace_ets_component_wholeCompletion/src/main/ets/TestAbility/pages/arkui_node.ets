/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */


import { UIContext } from '@ohos.arkui.UIContext';
import { NodeController,BuilderNode, Size, BaseNode }  from '@ohos.arkui.node';

class Params{
  text:string = "this is a text"
}


@Builder
function buttonBuilder(params:Params)
{
  Column()
  {
    Button(`button ` + params.text )
      .borderWidth(2)
      .backgroundColor(Color.Orange)
  }
}

class MyNodeController extends NodeController {
  private rootNode :BuilderNode<Params[]> | null= null;
  private wrapBuilder  = new WrappedBuilder(buttonBuilder);

  makeNode(uiContext:UIContext) : BaseNode | null
  {
    if(this.rootNode == null)
    {
      this.rootNode = new BuilderNode(uiContext);
      this.rootNode.build(this.wrapBuilder,{ text:"this is a string" })
    }
    return this.rootNode;
  }

  aboutToResize(size:Size)
  {
    console.log("aboutToResize width : "+ size.width  +  " height : " + size.height )
  }

  aboutToAppear()
  {
    console.log("aboutToAppear")
  }

  aboutToDisappear()
  {
    console.log("aboutToDisappear");
  }

  update()
  {
    if(this.rootNode == null)
    {
      return;
    }
    this.rootNode.build(this.wrapBuilder, { text:"this is a update string" })
    this.rebuild();
  }
}


@Entry
@Component
struct Index {
  @State myNodeController :MyNodeController = new MyNodeController();

  build() {
    Row() {
      NodeContainer(this.myNodeController)
        .onClick(()=>{
          this.myNodeController.update();
        }).key('nodeContainer')
    }
  }
}