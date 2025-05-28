/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License,Version 2.0 (the 'License');
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing,software
* distributed under the License is distributed on an 'AS IS' BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';

function sleep(time: number) {
  return new Promise<void>((resolve) => setTimeout(resolve, time))
}

function logValue<T>(target: Box<T>): void {
  console.log('Value:', target.getValue());
}

class Box<T> {
  value: T;

  constructor(value: T) {
    this.value = value;
  }

  getValue(): T {
    return this.value;
  }
}

export default function builtinsNoGenericsRestraintTest() {
  describe('BuiltinsNoGenericsRestraintTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action,which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(async () => {
      await sleep(100);
      // Presets an action,which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action,which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action,which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })
    /**
     * @tc.number SUB_BUILTINS_NO_GENERICS_RESTRAINT_TEST_0100
     * @tc.name builtinsNoGenericsRestraintTest0600
     * @tc.desc test Classes with multiple generic parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsNoGenericsRestraintTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsNoGenericsRestraintTest0100';
        console.info(`${caseName} test start`);

        class Pair<T1, T2> {
          value1: T1;
          value2: T2;

          constructor(value1: T1, value2: T2) {
            this.value1 = value1;
            this.value2 = value2;
          }

          getValue1(): T1 {
            return this.value1;
          }

          getValue2(): T2 {
            return this.value2;
          }
        }

        const numberStringPair = new Pair<number, string>(11, 'Hello');
        const booleanNumberPair = new Pair<boolean, number>(true, 100);
        expect(numberStringPair.getValue1()).assertEqual(11);
        expect(numberStringPair.getValue2()).assertEqual('Hello');
        expect(booleanNumberPair.getValue1()).assertEqual(true);
        expect(booleanNumberPair.getValue2()).assertEqual(100);
        console.info(`${caseName} test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_NO_GENERICS_RESTRAINT_TEST_0200
     * @tc.name builtinsNoGenericsRestraintTest0200
     * @tc.desc test Generic classes and arrays
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsNoGenericsRestraintTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsNoGenericsRestraintTest0200';

        class ArrayWrapper<T> {
          array: T[];

          constructor(array: T[]) {
            this.array = array;
          }

          getFirst(): T {
            return this.array[0];
          }
        }

        const numberArrayWrapper = new ArrayWrapper<number>([1, 2, 3]);
        const stringArrayWrapper = new ArrayWrapper<string>(['a', 'b', 'c']);
        expect(numberArrayWrapper.getFirst()).assertEqual(1);
        expect(stringArrayWrapper.getFirst()).assertEqual('a');
        console.info(`${caseName} test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_NO_GENERICS_RESTRAINT_TEST_0300
     * @tc.name builtinsNoGenericsRestraintTest0300
     * @tc.desc test Generic classes and functions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsNoGenericsRestraintTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsNoGenericsRestraintTest0300';
        console.info(`${caseName} test start`);

        class FunctionWrapper<T> {
          func: (arg: T) => T;

          constructor(func: (arg: T) => T) {
            this.func = func;
          }

          execute(arg: T): T {
            return this.func(arg);
          }
        }

        const numberFunctionWrapper = new FunctionWrapper<number>((x) => x * 2);
        const stringFunctionWrapper = new FunctionWrapper<string>((s) => s.toUpperCase());
        expect(numberFunctionWrapper.execute(10)).assertEqual(20);
        expect(stringFunctionWrapper.execute('hello')).assertEqual('HELLO');
        console.info(`${caseName} test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_NO_GENERICS_RESTRAINT_TEST_0400
     * @tc.name builtinsNoGenericsRestraintTest0400
     * @tc.desc test GGeneric classes vs. static methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsNoGenericsRestraintTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsNoGenericsRestraintTest0400';
        console.info(`${caseName} test start`);

        class MathUtils {
          static add<T extends number>(a: T, b: T): T {
            return (a + b) as T;
          }
        }

        const result = MathUtils.add<number>(10, 20);
        expect(result).assertEqual(30);
        console.info(`${caseName} test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_NO_GENERICS_RESTRAINT_TEST_0500
     * @tc.name builtinsNoGenericsRestraintTest0500
     * @tc.desc test Generic classes and sorting
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsNoGenericsRestraintTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsNoGenericsRestraintTest0500';
        console.info(`${caseName} test start`);

        class Sorter<T> {
          sort(array: T[], compareFn: (a: T, b: T) => number): T[] {
            return array.sort(compareFn);
          }
        }

        const numberSorter = new Sorter<number>();
        const result = numberSorter.sort([3, 1, 2], (a, b) => a - b);
        expect(result.toString()).assertEqual('1,2,3');
        console.info(`${caseName} test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_NO_GENERICS_RESTRAINT_TEST_0600
     * @tc.name builtinsNoGenericsRestraintTest0600
     * @tc.desc test Generic classes and stacks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsNoGenericsRestraintTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsNoGenericsRestraintTest0600';
        console.info(`${caseName} test start`);

        class Stack<T> {
          private items: T[] = [];

          push(item: T): void {
            this.items.push(item);
          }

          pop(): T | undefined {
            return this.items.pop();
          }
        }

        const numberStack = new Stack<number>();
        numberStack.push(1);
        numberStack.push(2);
        expect(numberStack.pop()).assertEqual(2);
        expect(numberStack.pop()).assertEqual(1);
        console.info(`${caseName} test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_NO_GENERICS_RESTRAINT_TEST_0700
     * @tc.name builtinsNoGenericsRestraintTest0700
     * @tc.desc test Generic classes and queues
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsNoGenericsRestraintTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsNoGenericsRestraintTest0700';
        console.info(`${caseName} test start`);

        class Queue<T> {
          private items: T[] = [];

          enqueue(item: T): void {
            this.items.push(item);
          }

          dequeue(): T | undefined {
            return this.items.shift();
          }
        }

        const numberQueue = new Queue<number>();
        numberQueue.enqueue(1);
        numberQueue.enqueue(2);
        expect(numberQueue.dequeue()).assertEqual(1);
        expect(numberQueue.dequeue()).assertEqual(2);
        console.info(`${caseName} test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_NO_GENERICS_RESTRAINT_TEST_0800
     * @tc.name builtinsNoGenericsRestraintTest0800
     * @tc.desc test Generic classes vs. static factory methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsNoGenericsRestraintTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsNoGenericsRestraintTest0800';
        console.info(`${caseName} test start`);

        class Box<T> {
          private value: T;

          private constructor(value: T) {
            this.value = value;
          }

          static create<T>(value: T): Box<T> {
            return new Box(value);
          }

          getValue(): T {
            return this.value;
          }
        }

        const numberBox = Box.create<number>(19);
        expect(numberBox.getValue()).assertEqual(19);
        console.info(`${caseName} test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_NO_GENERICS_RESTRAINT_TEST_0900
     * @tc.name builtinsNoGenericsRestraintTest0900
     * @tc.desc test Generic classes and chained methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsNoGenericsRestraintTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsNoGenericsRestraintTest0900';
        console.info(`${caseName} test start`);

        class Chain<T> {
          private value: T;

          constructor(value: T) {
            this.value = value;
          }

          map<U>(fn: (value: T) => U): Chain<U> {
            return new Chain(fn(this.value));
          }

          getValue(): T {
            return this.value;
          }
        }

        const result = new Chain<number>(19)
          .map((x) => x * 2)
          .getValue();
        expect(result).assertEqual(38);
        console.info(`${caseName} test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_NO_GENERICS_RESTRAINT_TEST_1000
     * @tc.name builtinsNoGenericsRestraintTest1000
     * @tc.desc test Generic classes vs. asynchronous methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsNoGenericsRestraintTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsNoGenericsRestraintTest1000';
        console.info(`${caseName} test start`);

        class AsyncBox<T> {
          private value: T;

          constructor(value: T) {
            this.value = value;
          }

          async getValueAsync(): Promise<T> {
            return Promise.resolve(this.value);
          }
        }

        const asyncBox = new AsyncBox<number>(19);
        asyncBox.getValueAsync().then((value) => expect(value).assertEqual(19));
        console.info(`${caseName} test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_NO_GENERICS_RESTRAINT_TEST_1100
     * @tc.name builtinsNoGenericsRestraintTest1100
     * @tc.desc test Generic classes and callback functions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsNoGenericsRestraintTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsNoGenericsRestraintTest1100';
        console.info(`${caseName} test start`);

        class CallbackBox<T> {
          private value: T;

          constructor(value: T) {
            this.value = value;
          }

          onValue(callback: (value: T) => void): void {
            callback(this.value);
          }
        }

        const callbackBox = new CallbackBox<number>(19);
        callbackBox.onValue((value) => expect(value).assertEqual(19));
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_NO_GENERICS_RESTRAINT_TEST_1200
     * @tc.name builtinsNoGenericsRestraintTest1200
     * @tc.desc test Generic classes and lazy initialization
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsNoGenericsRestraintTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsNoGenericsRestraintTest1200';
        console.info(`${caseName} test start`);

        class LazyBox<T> {
          private value?: T;
          private initializer: () => T;

          constructor(initializer: () => T) {
            this.initializer = initializer;
          }

          getValue(): T {
            if (!this.value) {
              this.value = this.initializer();
            }
            return this.value;
          }
        }

        const lazyBox = new LazyBox<number>(() => 19);
        expect(lazyBox.getValue()).assertEqual(19);
        console.info(`${caseName} test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_NO_GENERICS_RESTRAINT_TEST_1300
     * @tc.name builtinsNoGenericsRestraintTest1300
     * @tc.desc test Generic classes and event emitters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsNoGenericsRestraintTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsNoGenericsRestraintTest1300';
        console.info(`${caseName} test start`);

        class EventEmitter<T> {
          private listeners: ((value: T) => void)[] = [];

          emit(value: T): void {
            for (const listener of this.listeners) {
              listener(value);
            }
          }

          on(listener: (value: T) => void): void {
            this.listeners.push(listener);
          }
        }

        const emitter = new EventEmitter<number>();
        emitter.on((value) => expect(value).assertEqual(19));
        emitter.emit(19);
        console.info(`${caseName} test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_NO_GENERICS_RESTRAINT_TEST_1400
     * @tc.name builtinsNoGenericsRestraintTest1400
     * @tc.desc test Generic classes and caching
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsNoGenericsRestraintTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsNoGenericsRestraintTest1400';
        console.info(`${caseName} test start`);

        class CachedBox<T> {
          private cache?: T;

          getValue(initializer: () => T): T {
            if (!this.cache) {
              this.cache = initializer();
            }
            return this.cache;
          }
        }

        const cachedBox = new CachedBox<number>();
        expect(cachedBox.getValue(() => 19)).assertEqual(19);
        console.info(`${caseName} test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_NO_GENERICS_RESTRAINT_TEST_1500
     * @tc.name builtinsNoGenericsRestraintTest1500
     * @tc.desc test Generic classes and decorators
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsNoGenericsRestraintTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsNoGenericsRestraintTest1500';
        console.info(`${caseName} test start`);
        const numberBox = new Box<number>(19);
        logValue(numberBox);
        expect(numberBox.getValue()).assertEqual(19);
        console.info(`${caseName} test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_NO_GENERICS_RESTRAINT_TEST_1600
     * @tc.name builtinsNoGenericsRestraintTest1600
     * @tc.desc test Generic classes and policy patterns
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsNoGenericsRestraintTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsNoGenericsRestraintTest1600';
        console.info(`${caseName} test start`);

        class StrategyBox<T> {
          private strategy: (value: T) => T;

          constructor(strategy: (value: T) => T) {
            this.strategy = strategy;
          }

          apply(value: T): T {
            return this.strategy(value);
          }
        }

        const doubleStrategy = new StrategyBox<number>((x) => x * 2);
        expect(doubleStrategy.apply(19)).assertEqual(38);
        console.info(`${caseName} test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_NO_GENERICS_RESTRAINT_TEST_1700
     * @tc.name builtinsNoGenericsRestraintTest1700
     * @tc.desc test Generic classes and observer patterns
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsNoGenericsRestraintTest1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsNoGenericsRestraintTest1700';
        console.info(`${caseName} test start`);

        class ObservableBox<T> {
          private value: T;
          private observers: ((value: T) => void)[] = [];

          constructor(value: T) {
            this.value = value;
          }

          setValue(value: T): void {
            this.value = value;
            for (const observer of this.observers) {
              observer(value);
            }
          }

          subscribe(observer: (value: T) => void): void {
            this.observers.push(observer);
          }
        }

        const observableBox = new ObservableBox<number>(19);
        observableBox.subscribe((value) => expect(value).assertEqual(20));
        observableBox.setValue(20);
        console.info(`${caseName} test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_NO_GENERICS_RESTRAINT_TEST_1800
     * @tc.name builtinsNoGenericsRestraintTest1800
     * @tc.desc test Generic classes and memo patterns
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsNoGenericsRestraintTest1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsNoGenericsRestraintTest1800';
        console.info(`${caseName} test start`);

        class MementoBox<T> {
          private value: T;
          private history: T[] = [];

          constructor(value: T) {
            this.value = value;
          }

          save(): void {
            this.history.push(this.value);
          }

          restore(): T | undefined {
            return this.history.pop();
          }
        }

        const mementoBox = new MementoBox<number>(19);
        mementoBox.save();
        mementoBox.restore();
        mementoBox.save();
        expect(JSON.stringify(mementoBox.restore())?.toString()).assertEqual('19');
        console.info(`${caseName} test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_NO_GENERICS_RESTRAINT_TEST_1900
     * @tc.name builtinsNoGenericsRestraintTest1900
     * @tc.desc test Bubbling ordering of unconstrained generics
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsNoGenericsRestraintTest1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsNoGenericsRestraintTest1900';
        console.info(`${caseName} test start`);

        class BubbleSorter<T> {
          private array: T[];

          constructor(array: T[]) {
            this.array = array;
          }

          sort(): void {
            const n = this.array.length;
            for (let i = 0; i < n - 1; i++) {
              for (let j = 0; j < n - 1 - i; j++) {
                if (this.array[j] > this.array[j + 1]) {
                  const temp = this.array[j];
                  this.array[j] = this.array[j + 1];
                  this.array[j + 1] = temp;
                }
              }
            }
          }

          getSortedArray(): T[] {
            return this.array;
          }
        }

        const sorter = new BubbleSorter([5, 3, 8, 4, 2]);
        sorter.sort();
        expect(sorter.getSortedArray().toString()).assertEqual('2,3,4,5,8');
        console.info(`${caseName} test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_NO_GENERICS_RESTRAINT_TEST_2000
     * @tc.name builtinsNoGenericsRestraintTest2000
     * @tc.desc test Bubbling ordering of unconstrained generics
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsNoGenericsRestraintTest2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsNoGenericsRestraintTest2000';
        console.info(`${caseName} test start`);

        class BubbleSorter<T> {
          private array: T[];

          constructor(array: T[]) {
            this.array = array;
          }

          sort(): void {
            const n = this.array.length;
            for (let i = 0; i < n - 1; i++) {
              for (let j = 0; j < n - 1 - i; j++) {
                if (this.array[j] > this.array[j + 1]) {
                  const temp = this.array[j];
                  this.array[j] = this.array[j + 1];
                  this.array[j + 1] = temp;
                }
              }
            }
          }

          getSortedArray(): T[] {
            return this.array;
          }
        }

        const sorter = new BubbleSorter([5, 3, 8, 4, 2]);
        sorter.sort();
        expect(sorter.getSortedArray().toString()).assertEqual('2,3,4,5,8');
        console.info(`${caseName} test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_NO_GENERICS_RESTRAINT_TEST_2100
     * @tc.name builtinsNoGenericsRestraintTest2100
     * @tc.desc test Returns the maximum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsNoGenericsRestraintTest2100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsNoGenericsRestraintTest2100';
        console.info(`${caseName} test start`);

        class MaxValue<T> {
          private value1: T;
          private value2: T;
          private value3: T;

          constructor(value1: T, value2: T, value3: T) {
            this.value1 = value1;
            this.value2 = value2;
            this.value3 = value3;
          }

          getMax(): T {
            let max = this.value1;
            if (this.value2 > max) {
              max = this.value2;
            }
            if (this.value3 > max) {
              max = this.value3;
            }
            return max;
          }
        }

        const maxValue = new MaxValue(10, 20, 30);
        expect(maxValue.getMax()).assertEqual(30);
        const maxValue2 = new MaxValue(-5, 0, 5);
        expect(maxValue2.getMax()).assertEqual(5);
        const maxValue3 = new MaxValue(42, 42, 42);
        expect(maxValue3.getMax()).assertEqual(42);
        console.info(`${caseName} test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_NO_GENERICS_RESTRAINT_TEST_2200
     * @tc.name builtinsNoGenericsRestraintTest2200
     * @tc.desc test Returns the minimum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsNoGenericsRestraintTest2200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsNoGenericsRestraintTest2200';
        console.info(`${caseName} test start`);

        class MinValue<T> {
          private value1: T;
          private value2: T;
          private value3: T;

          constructor(value1: T, value2: T, value3: T) {
            this.value1 = value1;
            this.value2 = value2;
            this.value3 = value3;
          }

          getMin(): T {
            let min = this.value1;
            if (this.value2 < min) {
              min = this.value2;
            }
            if (this.value3 < min) {
              min = this.value3;
            }
            return min;
          }
        }

        const minValue = new MinValue(10, 20, 30);
        expect(minValue.getMin()).assertEqual(10);
        const minValue2 = new MinValue(-5, 0, 5);
        expect(minValue2.getMin()).assertEqual(-5);
        const minValue3 = new MinValue(42, 42, 42);
        expect(minValue3.getMin()).assertEqual(42);
        const minValue4 = new MinValue(3.5, 2.2, 4.8);
        expect(minValue4.getMin()).assertEqual(2.2);
        console.info(`${caseName} test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_NO_GENERICS_RESTRAINT_TEST_2300
     * @tc.name builtinsNoGenericsRestraintTest2300
     * @tc.desc test Returns the minimum value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsNoGenericsRestraintTest2300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsNoGenericsRestraintTest2300';
        console.info(`${caseName} test start`);

        class MinValue<T> {
          private value1: T;
          private value2: T;
          private value3: T;

          constructor(value1: T, value2: T, value3: T) {
            this.value1 = value1;
            this.value2 = value2;
            this.value3 = value3;
          }

          getMin(): T {
            let min = this.value1;
            if (this.value2 < min) {
              min = this.value2;
            }
            if (this.value3 < min) {
              min = this.value3;
            }
            return min;
          }
        }

        const minValue = new MinValue(10, 20, 30);
        expect(minValue.getMin()).assertEqual(10);
        const minValue2 = new MinValue(-5, 0, 5);
        expect(minValue2.getMin()).assertEqual(-5);
        const minValue3 = new MinValue(42, 42, 42);
        expect(minValue3.getMin()).assertEqual(42);
        const minValue4 = new MinValue(3.5, 2.2, 4.8);
        expect(minValue4.getMin()).assertEqual(2.2);
        console.info(`${caseName} test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_NO_GENERICS_RESTRAINT_TEST_2400
     * @tc.name builtinsNoGenericsRestraintTest2400
     * @tc.desc test Returns an average
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsNoGenericsRestraintTest2400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsNoGenericsRestraintTest2400';
        console.info(`${caseName} test start`);

        class AverageCalculator<T> {
          private value1: T;
          private value2: T;
          private value3: T;
          private value4: T;

          constructor(value1: T, value2: T, value3: T, value4: T) {
            this.value1 = value1;
            this.value2 = value2;
            this.value3 = value3;
            this.value4 = value4;
          }

          getAverage(): number {
            const sum = (Number(this.value1) +
            Number(this.value2) +
            Number(this.value3) +
            Number(this.value4));
            return sum / 4;
          }
        }

        const avgCalc1 = new AverageCalculator(10, 20, 30, 40);
        expect(avgCalc1.getAverage()).assertEqual(25);
        const avgCalc2 = new AverageCalculator(1, 2, 3, 4);
        expect(avgCalc2.getAverage()).assertEqual(2.5);
        const avgCalc3 = new AverageCalculator(0, 0, 0, 0);
        expect(avgCalc3.getAverage()).assertEqual(0);
        const avgCalc4 = new AverageCalculator(-1, -2, -3, -4);
        expect(avgCalc4.getAverage()).assertEqual(-2.5);
        console.info(`${caseName} test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_NO_GENERICS_RESTRAINT_TEST_2500
     * @tc.name builtinsNoGenericsRestraintTest2500
     * @tc.desc test The average value after removing the maximum and minimum values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsNoGenericsRestraintTest2500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsNoGenericsRestraintTest2500';
        console.info(`${caseName} test start`);

        class TrimmedMeanCalculator<T> {
          private value1: T;
          private value2: T;
          private value3: T;
          private value4: T;
          private value5: T;

          constructor(value1: T, value2: T, value3: T, value4: T, value5: T) {
            this.value1 = value1;
            this.value2 = value2;
            this.value3 = value3;
            this.value4 = value4;
            this.value5 = value5;
          }

          getTrimmedMean(): number {
            const values = [
              Number(this.value1),
              Number(this.value2),
              Number(this.value3),
              Number(this.value4),
              Number(this.value5)
            ];
            const max = Math.max(...values);
            const min = Math.min(...values);
            const sum = values.reduce((acc, val) => acc + val, 0) - max - min;
            return sum / (values.length - 2);
          }
        }

        const calc1 = new TrimmedMeanCalculator(10, 20, 30, 40, 50);
        expect(calc1.getTrimmedMean()).assertEqual(30);
        const calc2 = new TrimmedMeanCalculator(1, 2, 3, 4, 5);
        expect(calc2.getTrimmedMean()).assertEqual(3);
        const calc3 = new TrimmedMeanCalculator(0, 0, 0, 0, 0);
        expect(calc3.getTrimmedMean()).assertEqual(0);
        const calc4 = new TrimmedMeanCalculator(-10, -5, 0, 5, 10);
        expect(calc4.getTrimmedMean()).assertEqual(0);
        console.info(`${caseName} test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_NO_GENERICS_RESTRAINT_TEST_2600
     * @tc.name builtinsNoGenericsRestraintTest2600
     * @tc.desc test The average value after removing the maximum and minimum values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsNoGenericsRestraintTest2600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsNoGenericsRestraintTest2600';
        console.info(`${caseName} test start`);

        class InsertionSorter<T> {
          private values: T[];

          constructor(value1: T, value2: T, value3: T, value4: T, value5: T) {
            this.values = [value1, value2, value3, value4, value5];
          }

          sort(): void {
            for (let i = 1; i < this.values.length; i++) {
              const key = this.values[i];
              let j = i - 1;
              while (j >= 0 && this.values[j] > key) {
                this.values[j + 1] = this.values[j];
                j--;
              }
              this.values[j + 1] = key;
            }
          }

          getSortedValues(): T[] {
            return this.values;
          }
        }

        const sorter1 = new InsertionSorter(5, 2, 9, 1, 5);
        sorter1.sort();
        expect(sorter1.getSortedValues().toString()).assertEqual('1,2,5,5,9');
        const sorter2 = new InsertionSorter(10, 3, 7, 1, 4);
        sorter2.sort();
        expect(sorter2.getSortedValues().toString()).assertEqual('1,3,4,7,10');
        const sorter3 = new InsertionSorter(-1, -3, 0, 2, 1);
        sorter3.sort();
        expect(sorter3.getSortedValues().toString()).assertEqual('-3,-1,0,1,2');
        console.info(`${caseName} test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_NO_GENERICS_RESTRAINT_TEST_2700
     * @tc.name builtinsNoGenericsRestraintTest2700
     * @tc.desc test Select Sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsNoGenericsRestraintTest2700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsNoGenericsRestraintTest2700';
        console.info(`${caseName} test start`);

        class SelectionSorter<T> {
          private values: T[];

          constructor(value1: T, value2: T, value3: T, value4: T, value5: T, value6: T) {
            this.values = [value1, value2, value3, value4, value5, value6];
          }

          sort(): void {
            for (let i = 0; i < this.values.length - 1; i++) {
              let minIndex = i;
              for (let j = i + 1; j < this.values.length; j++) {
                if (this.values[j] < this.values[minIndex]) {
                  minIndex = j;
                }
              }
              if (minIndex !== i) {
                const temp = this.values[i];
                this.values[i] = this.values[minIndex];
                this.values[minIndex] = temp;
              }
            }
          }

          getSortedValues(): T[] {
            return this.values;
          }
        }

        const sorter1 = new SelectionSorter(5, 2, 9, 1, 5, 3);
        sorter1.sort();
        expect(sorter1.getSortedValues().toString()).assertEqual('1,2,3,5,5,9');
        const sorter2 = new SelectionSorter(10, 3, 7, 1, 4, 8);
        sorter2.sort();
        expect(sorter2.getSortedValues().toString()).assertEqual('1,3,4,7,8,10');
        const sorter3 = new SelectionSorter(-1, -3, 0, 2, 1, -2);
        sorter3.sort();
        expect(sorter3.getSortedValues().toString()).assertEqual('-3,-2,-1,0,1,2');
        console.info(`${caseName} test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_NO_GENERICS_RESTRAINT_TEST_2800
     * @tc.name builtinsNoGenericsRestraintTest2800
     * @tc.desc test Select Sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsNoGenericsRestraintTest2800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsNoGenericsRestraintTest2800';
        console.info(`${caseName} test start`);

        class SelectionSorter<T> {
          private values: T[];

          constructor(value1: T, value2: T, value3: T, value4: T, value5: T, value6: T) {
            this.values = [value1, value2, value3, value4, value5, value6];
          }

          sort(): void {
            for (let i = 0; i < this.values.length - 1; i++) {
              let minIndex = i;
              for (let j = i + 1; j < this.values.length; j++) {
                if (this.values[j] < this.values[minIndex]) {
                  minIndex = j;
                }
              }
              if (minIndex !== i) {
                const temp = this.values[i];
                this.values[i] = this.values[minIndex];
                this.values[minIndex] = temp;
              }
            }
          }

          getSortedValues(): T[] {
            return this.values;
          }
        }

        const sorter1 = new SelectionSorter(5, 2, 9, 1, 5, 3);
        sorter1.sort();
        expect(sorter1.getSortedValues().toString()).assertEqual('1,2,3,5,5,9');
        const sorter2 = new SelectionSorter(10, 3, 7, 1, 4, 8);
        sorter2.sort();
        expect(sorter2.getSortedValues().toString()).assertEqual('1,3,4,7,8,10');
        const sorter3 = new SelectionSorter(-1, -3, 0, 2, 1, -2);
        sorter3.sort();
        expect(sorter3.getSortedValues().toString()).assertEqual('-3,-2,-1,0,1,2');
        console.info(`${caseName} test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_NO_GENERICS_RESTRAINT_TEST_2900
     * @tc.name builtinsNoGenericsRestraintTest2900
     * @tc.desc test Select Sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsNoGenericsRestraintTest2900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsNoGenericsRestraintTest2900';
        console.info(`${caseName} test start`);

        class ShellSorter<T> {
          private values: T[];

          constructor(value1: T, value2: T, value3: T, value4: T, value5: T, value6: T) {
            this.values = [value1, value2, value3, value4, value5, value6];
          }

          sort(): void {
            let gap = Math.floor(this.values.length / 2);
            while (gap > 0) {
              for (let i = gap; i < this.values.length; i++) {
                const temp = this.values[i];
                let j = i;
                while (j >= gap && this.values[j - gap] > temp) {
                  this.values[j] = this.values[j - gap];
                  j -= gap;
                }
                this.values[j] = temp;
              }
              gap = Math.floor(gap / 2);
            }
          }

          getSortedValues(): T[] {
            return this.values;
          }
        }

        const sorter1 = new ShellSorter(5, 2, 9, 1, 5, 3);
        sorter1.sort();
        expect(sorter1.getSortedValues().toString()).assertEqual('1,2,3,5,5,9');
        const sorter2 = new ShellSorter(10, 3, 7, 1, 4, 8);
        sorter2.sort();
        expect(sorter2.getSortedValues().toString()).assertEqual('1,3,4,7,8,10');
        const sorter3 = new ShellSorter(-1, -3, 0, 2, 1, -2);
        sorter3.sort();
        expect(sorter3.getSortedValues().toString()).assertEqual('-3,-2,-1,0,1,2');
        console.info(`${caseName} test end`);
        Done();
      })

    /**
     * @tc.number SUB_BUILTINS_NO_GENERICS_RESTRAINT_TEST_3000
     * @tc.name builtinsNoGenericsRestraintTest3000
     * @tc.desc test Select Sort
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('builtinsNoGenericsRestraintTest3000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1,
      async (Done: Function) => {
        const caseName = 'builtinsNoGenericsRestraintTest3000';
        console.info(`${caseName} test start`);

        class BucketSorter<T extends number> {
          private values: T[];

          constructor(value1: T, value2: T, value3: T, value4: T, value5: T, value6: T) {
            this.values = [value1, value2, value3, value4, value5, value6];
          }

          sort(): void {
            const numberValues = this.values as number[];
            const min = Math.min(...numberValues);
            const max = Math.max(...numberValues);
            const bucketSize = 5;
            const bucketCount = Math.floor((max - min) / bucketSize) + 1;
            const buckets: number[][] = new Array(bucketCount).fill(null).map(() => []);
            for (const value of numberValues) {
              const index = Math.floor((value - min) / bucketSize);
              buckets[index].push(value);
            }
            for (let i = 0; i < buckets.length; i++) {
              buckets[i].sort((a, b) => a - b);
            }
            let index = 0;
            for (const bucket of buckets) {
              for (const value of bucket) {
                numberValues[index++] = value;
              }
            }
          }

          getSortedValues(): T[] {
            return this.values;
          }
        }

        const sorter1 = new BucketSorter(170, 45, 75, 90, 802, 24);
        sorter1.sort();
        expect(sorter1.getSortedValues().toString()).assertEqual('24,45,75,90,170,802');
        const sorter2 = new BucketSorter(10, 3, 7, 1, 4, 8);
        sorter2.sort();
        expect(sorter2.getSortedValues().toString()).assertEqual('1,3,4,7,8,10');
        const sorter3 = new BucketSorter(-1, -3, 0, 2, 1, -2);
        sorter3.sort();
        expect(sorter3.getSortedValues().toString()).assertEqual('-3,-2,-1,0,1,2');
        console.info(`${caseName} test end`);
        Done();
      })
  })
}