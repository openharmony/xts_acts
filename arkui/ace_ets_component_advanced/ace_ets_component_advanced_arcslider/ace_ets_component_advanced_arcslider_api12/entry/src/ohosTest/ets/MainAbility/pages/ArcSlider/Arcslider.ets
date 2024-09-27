import { ArcSlider, ArcSliderOptions, ArcSliderValueOptions, ArcSliderLayoutOptions, ArcSliderStyleOptions, ArcSliderValueOptionsConstructorOptions, ArcSliderLayoutOptionsConstructorOptions, ArcSliderStyleOptionsConstructorOptions, ArcSliderOptionsConstructorOptions } from '@ohos.arkui.advanced.ArcSlider'

@Entry
@ComponentV2
struct Index {
  scroll: Scroller = new Scroller()

  valueOptionsConstructorOptions: ArcSliderValueOptionsConstructorOptions = {
    value: 50,
    min: 5,
    max: 95
  }

  layoutOptionsConstructorOptions: ArcSliderLayoutOptionsConstructorOptions = {
    x: 100,
    y: 100,
    radius: 100,
    padding: 6,
    startAngle: -45,
    endAngle: 45,
    activeStartAngle: -30,
    activeEndAngle: 70,
    reverse: true
  }
  styleOptionsConstructorOptions: ArcSliderStyleOptionsConstructorOptions = {
    trackThickness: 8,
    activeTrackThickness: 20,
    trackColor: '#999999',
    selectedColor: '#00FF00',
    trackBlur: 20
  }
  valueOptions: ArcSliderValueOptions = new ArcSliderValueOptions(this.valueOptionsConstructorOptions)
  layoutOptions: ArcSliderLayoutOptions = new ArcSliderLayoutOptions(this.layoutOptionsConstructorOptions)
  styleOptions: ArcSliderStyleOptions = new ArcSliderStyleOptions(this.styleOptionsConstructorOptions)
  arcSliderOptionsConstructorOptions: ArcSliderOptionsConstructorOptions = {
    valueOptions: this.valueOptions,
    layoutOptions: this.layoutOptions,
    styleOptions: this.styleOptions,
    digitalCrownSensitivity:CrownSensitivity.LOW,
    onTouch: (event: TouchEvent) => {
    },
    onChange: (value: number) => {
    }
  }
  arcSliderOptions: ArcSliderOptions = new ArcSliderOptions(this.arcSliderOptionsConstructorOptions)

  build() {
    Scroll(this.scroll) {
      Column({ space: 5 }) {
        List({ space: 5, initialIndex: 0 }) {
          ListItem() {
            ArcSlider().key('arcSliderTest001')
          }.backgroundColor(Color.Black)
          ListItem() {
            ArcSlider({ options: this.arcSliderOptions }).key('arcSliderTest002')
          }.backgroundColor(Color.Black)
        }
      }
    }
  }
}