@Entry
@Component
struct BounceSymbolEffect_Scope {
  @State isActive: boolean = true;
  @State triggerValueReplace: number = 0;
  replaceFlag: boolean = true;
  @State BounceSymbolEffect_Scope: EffectScope = EffectScope.LAYER
  @State ReplaceSymbolEffect_Scope: EffectScope = EffectScope.WHOLE
  @State BounceSymbolEffectText: string = ''
  @State ReplaceSymbolEffectText: string = ''

  build() {
    Column({ space: 12 }) {
      Text(this.BounceSymbolEffectText)
        .id('BounceSymbolEffect')
      Text(this.ReplaceSymbolEffectText)
      Row({ space: 20 }) {
        SymbolGlyph(this.replaceFlag ? $r('sys.symbol.checkmark_circle') : $r('sys.symbol.repeat_1'))
          .fontSize(96)
          .symbolEffect(new BounceSymbolEffect(this.BounceSymbolEffect_Scope, EffectDirection.DOWN), this.triggerValueReplace)
        SymbolGlyph(this.replaceFlag ? $r('sys.symbol.checkmark_circle') : $r('sys.symbol.repeat_1'))
          .fontSize(96)
          .symbolEffect(new ReplaceSymbolEffect(this.ReplaceSymbolEffect_Scope), this.triggerValueReplace)
      }
      Button('trigger').width('50%').onClick(() => {
        this.replaceFlag = !this.replaceFlag;
        this.triggerValueReplace = this.triggerValueReplace + 1;
        this.BounceSymbolEffectText = this.BounceSymbolEffect_Scope + ''
        this.ReplaceSymbolEffectText = this.ReplaceSymbolEffect_Scope + ''
      }).id('btn')
    }.margin({
      left:30,
      top:50
    })
  }
}