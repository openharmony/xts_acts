export class Foo {
  native add(arg1: int, arg2: int): int;
  native test_GetVersion(): int;
  native test_FindClass(): boolean;
  native test_Class_FindStaticMethodBoolean(): boolean;
  native test_Class_FindStaticMethodInt(): boolean;
  native test_GlobalReference_Create(): boolean;
  native test_Object_New(): boolean;
  native test_ExistUnhandledError(): boolean;
  native test_Object_GetFieldByName_Ref(): boolean;

  constructor() {
  }

  public static new_Foo(): Foo {
    return new Foo();
  }
  static or(a0: boolean, a1: boolean): boolean {
    return a0 || a1;
  }
  static sum(a0: int, a1: int): int {
    return a0 + a1;
  }

  stringValue: string = 'test';
}