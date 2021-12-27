@Entry
@Component
struct navigator_testcase {
  @State active:boolean =false
  @State params:Object ={ text: 'news' }

  build() {
    Column(){
      Navigator({target:"pages/index",type:NavigationType.Back}){
        Text('Navigator test  go to Navigator， back called')
      }.active(this.active)
      .key('navigator')
      .params({
        data:24
      })

      Navigator({target:"pages/index",type:NavigationType.Push}){
        Text('Navigator test  go to Navigator, router called')
      }.active(this.active)
      .key('navigator2')
      .params({
        data:24
      })

      Navigator({target:"pages/index",type:NavigationType.Replace}){
        Text('Navigator test  go to Navigator，changed called')
      }.active(this.active)
      .key('navigator3')
      .params({
        data:24
      })
    }.width(300)
    .height(300)
    .borderColor(Color.Pink)
    .borderWidth(2)
  }
}
