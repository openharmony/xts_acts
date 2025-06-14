export class Foo {
  native add(arg1: int, arg2: int): int;
  native test_GetVersion(): int;
  native test_FindClass(): boolean;
  native test_Class_FindStaticMethod(): boolean;

  public static new_Foo(): Foo {
    return new Foo();
  }
  static or(a0: boolean, a1: boolean): boolean {
    return a0 || a1;
  }
}