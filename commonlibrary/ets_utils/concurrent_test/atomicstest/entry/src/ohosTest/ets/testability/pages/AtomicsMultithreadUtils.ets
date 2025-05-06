import { BusinessError } from '@ohos.base';

export class SharedCounter {
  private sharedBuffer: SharedArrayBuffer;
  private sharedArray: Int32Array;

  constructor(initialValue: number) {
    this.sharedBuffer = new SharedArrayBuffer(4);
    this.sharedArray = new Int32Array(this.sharedBuffer);
    this.sharedArray[0] = initialValue;
  }

  getBuffer(): SharedArrayBuffer {
    return this.sharedBuffer;
  }

  add(value: number): number {
    return Atomics.add(this.sharedArray, 0, value);
  }

  subtract(value: number): number {
    return Atomics.sub(this.sharedArray, 0, value);
  }

  and(mask: number): number {
    return Atomics.and(this.sharedArray, 0, mask);
  }

  exchange(newValue: number): number {
    return Atomics.exchange(this.sharedArray, 0, newValue);
  }

  getValue(): number {
    return Atomics.load(this.sharedArray, 0);
  }
}

