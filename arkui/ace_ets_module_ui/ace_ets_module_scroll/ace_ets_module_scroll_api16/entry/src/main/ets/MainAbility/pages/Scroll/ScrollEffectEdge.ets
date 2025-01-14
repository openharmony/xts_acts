@Entry
@Component
struct ScrollEffectEdge {
  @State message: string = 'Hello World';
  listScroller: Scroller = new Scroller();
  listScroller2: Scroller = new Scroller();

  build() {
    Row() {
      Column() {
        Scroll(this.listScroller){

        }.edgeEffect(EdgeEffect.Spring, {
          alwaysEnabled: true,
          effectEdge: EffectEdge.START
        }).id('scroll1')

        Scroll(this.listScroller){

        }.edgeEffect(EdgeEffect.Spring, {
          alwaysEnabled: true,
          effectEdge: undefined
        }).id('scroll2')

        List(){

        }.edgeEffect(EdgeEffect.Spring, {
          alwaysEnabled: true,
          effectEdge: EffectEdge.END
        }).id('list2')

        Grid(){

        }.edgeEffect(EdgeEffect.Spring, {
          alwaysEnabled: true,
          effectEdge: EffectEdge.END|EffectEdge.START
        }).id('grid3')

        WaterFlow(){

        }.edgeEffect(EdgeEffect.Spring, {
          alwaysEnabled: true,
          effectEdge: EffectEdge.START
        }).id('waterFlow4')
      }
      .width('100%')
    }
    .height('100%')
  }
}