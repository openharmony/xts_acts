/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

export class Count1 {
  public static count: number = 0
}

export class Count2 {
  public static count: number = 0
}

export class Count3 {
  public static count: number = 0
}

export class Count4 {
  public static count: number = 0
}

export class CountStr1 {
  public static count: string = ''
}

export class CountStr2 {
  public static count: string = ''
}

export class CountBol1 {
  public static count: boolean = false
}

export class CountBol2 {
  public static count: boolean = true
}

export class CountBigint1 {
  public static count: bigint = 0n
}

export class CountBigint2 {
  public static count: bigint = 0n
}

export class CountUndefined1 {
  public static count: undefined
}

export class CountUndefined2 {
  public static count: undefined
}

export enum MyEnum {
  Value1,
  Value2,
  Value3
}


@Sendable
export class MyClass {
  public id: number;

  constructor(id: number,) {
    this.id = id;
  }

  greet(): string {
    return `Hello, my name is ${this.id}!`;
  }
}


@Sendable
export class SendableTestClass {
  public value: number;

  constructor(value: number) {
    this.value = value;
  }

  public increaseValue(): void {
    this.value++;
  }

  public printValue(): void {
    console.log(`The value is: ${this.value}`);
  }
}


