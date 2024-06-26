@Entry
@Component
struct RoleTest {
  build() {
    Row() {
      Column() {
        Button('Role')
          .role(ButtonRole.ERROR)
          .id('Role')
      }
      .width('100%')
    }
    .height('100%')
  }
}
