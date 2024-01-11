@Entry
@Component
struct textInputApi1 {
  @State value: string = ''
  @State text1: string = ''
  @State TextError: string = ''
  build() {
    Column() {
      TextInput({ placeholder: '请输入用户名', text: this.text1 })
        .id('textInputApi1')
        .showUnderline(true)
        .width(380)
        .showError(this.TextError)
        .enterKeyType(EnterKeyType.PREVIOUS)
        .onSubmit((enter: EnterKeyType) => {
          this.value = EnterKeyType[enter]
        })


      Text( this.value ).height('60%').width('100%') .key('textInputApi1_text')
    }
  }
}