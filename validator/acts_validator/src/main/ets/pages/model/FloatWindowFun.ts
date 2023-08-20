
import window from '@ohos.window';

export class FloatWindowFun {
  static floatingWindowOffsetX: number = 50;
  static floatingWindowOffsetY: number = 500;
  static windowWidth: number = 2560;
  static windowHeight: number = 1600;
  static atWidth: number = 180;
  static title: String= 'start';
  static initAllFun() {
    globalThis.CreateFloatingWindow = (() => {
      window.createWindow({ctx:globalThis.abilityContext, name:'sp_floatingWindow', windowType:window.WindowType.TYPE_FLOAT}).then((floatWin) => {
        floatWin.moveWindowTo(this.floatingWindowOffsetX, this.floatingWindowOffsetY).then(() => {
          floatWin.resize(this.atWidth, this.atWidth).then(() => {
            floatWin.getWindowProperties()
            floatWin.setUIContent('pages/model/FloatBall').then(() => {
              floatWin.setWindowBackgroundColor('#00000000')
              // floatWin.hide()
//              floatWin.showWindow().then(() => {
//                globalThis.showFloatingWindow = false;
//              })
            })
          })
        })
      })
    })

    globalThis.MoveFloatingWindow = ((offsetX: number, offsetY: number) => {
      let xx = (this.floatingWindowOffsetX + offsetX * 2) < 0 ? 0 : ((this.floatingWindowOffsetX + offsetX * 2) > (this.windowWidth - 200) ? (this.windowWidth - 200) : (this.floatingWindowOffsetX + offsetX * 2));
      let yy = (this.floatingWindowOffsetY + offsetY * 2) < 0 ? 0 : ((this.floatingWindowOffsetY + offsetY * 2) > (this.windowHeight - 200) ? (this.windowHeight - 200) : (this.floatingWindowOffsetY + offsetY * 2));
      window.findWindow("sp_floatingWindow").moveWindowTo(xx, yy);
    })

    globalThis.DestroyFloatingWindow = (() => {
      window.findWindow('sp_floatingWindow').destroyWindow().then(() => {
        globalThis.showFloatingWindow = false;
      })
    })

    globalThis.SetFloatingWindowPosition = ((offsetX: number, offsetY: number) => {
      this.floatingWindowOffsetX = (this.floatingWindowOffsetX + offsetX * 2) < 0 ? 0 : ((this.floatingWindowOffsetX + offsetX * 2) > (this.windowWidth - 200) ? (this.windowWidth - 200) : (this.floatingWindowOffsetX + offsetX * 2));
      this.floatingWindowOffsetY = (this.floatingWindowOffsetY + offsetY * 2) < 0 ? 0 : ((this.floatingWindowOffsetY + offsetY * 2) > (this.windowHeight - 200) ? (this.windowHeight - 200): (this.floatingWindowOffsetY + offsetY * 2));
    })

    globalThis.HideFloatingWindow = (() => {
      window.findWindow("sp_floatingWindow").hide().then(() => {
        globalThis.showFloatingWindow = false;
      })
    })

    globalThis.ShowFloatingWindow = (() => {
      window.findWindow("sp_floatingWindow").showWindow().then(() => {
        globalThis.title = this.title;
      })

      //   .then(() => {
      //   globalThis.showFloatingWindow = true;
      //   console.log('2222222222');
      // })
    })
  }
}