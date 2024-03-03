let nextIdA: number = 0;

@observed
class Arr {
  id: number = 0;
  @track numberArr: number[] = [];

  constructor() {
    this.id = nextIdA++;
    this.numberArr = [0, 1, 2];
  }
}

@Entry
@Component
struct ArrayTrack {
  arr: Arr = new Arr();

  build() {
    Column() {
      Text(`length:${this.arr.numberArr.length}`)
        .id('ArrayTrack_1A')
        .fontSize(40)
      Divider()
      if (this.arr.numberArr.length >= 3) {
        Text(`${this.arr.numberArr[0]}`)
          .fontSize(40)
          .onClick(() => {
            this.arr.numberArr[0]++;
          })
        Text(`${this.arr.numberArr[1]}`)
          .fontSize(40)
          .onClick(() => {
            this.arr.numberArr[1]++;
          })
        Text(`${this.arr.numberArr[2]}`)
          .fontSize(40)
          .onClick(() => {
            this.arr.numberArr[2]++;
          })
      }

      Divider()

      ForEach(this.arr.numberArr, (item: number, index: number) => {
        Text(`${index} ${item}`)
          .fontSize(40)
      })

      Button('push')
        .id('ArrayTrack_2A')
        .onClick(() => {
          this.arr.numberArr.push(50);
        })

      Button('pop')
        .onClick(() => {
          this.arr.numberArr.pop();
        })

      Button('shift')
        .onClick(() => {
          this.arr.numberArr.shift();
        })

      Button('splice')
        .onClick(() => {
          this.arr.numberArr.splice(1, 0, 60);
        })


      Button('unshift')
        .onClick(() => {
          this.arr.numberArr.unshift(100);
        })

      Button('copywithin')
        .onClick(() => {
          this.arr.numberArr.copyWithin(0, 1, 2);
        })

      Button('fill')
        .onClick(() => {
          this.arr.numberArr.fill(0, 2, 4);
        })

      Button('reverse')
        .onClick(() => {
          this.arr.numberArr.reverse();
        })

      Button('sort')
        .onClick(() => {
          this.arr.numberArr.sort();
        })
    }
  }
}