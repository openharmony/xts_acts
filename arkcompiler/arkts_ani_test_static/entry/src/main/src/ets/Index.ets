export class Foo {
  native test_GetVersion(): int;
  native test_FindClass(): boolean;
  native test_Class_FindStaticMethodBoolean(): boolean;
  native test_Class_FindStaticMethodInt(): boolean;
  native test_ExistUnhandledError(): boolean;
  native test_Class_FindMethod(): boolean;
  native test_Class_BindNativeMethods(): boolean;
  native test_Type_GetSuperClass(): boolean;
  native test_Type_IsAssignableFrom(): boolean;
  native test_FindModule(): boolean;
  native test_FindNamespace(): boolean;
  native test_FindEnum(): boolean;
  native test_GlobalReference_Create(): boolean;
  native test_Reference_StrictEquals(): boolean;
  native test_GlobalReference_Delete(): boolean;
  native test_Reference_Delete(): boolean;
  native test_EnsureEnoughReferences(): boolean;
  native test_Object_InstanceOf(): boolean;
  native test_Object_GetType(): boolean;
  native test_Object_New(): boolean;
  native test_Reference_IsNull(): boolean;
  native test_Reference_IsUndefined(): boolean;
  native test_Reference_IsNullishValue(): boolean;
  native test_Reference_Equals(): boolean;
  native test_Array_New_Ref(): boolean;
  native test_Object_New_A(): boolean;
  native test_Class_GetStaticField_Boolean(): boolean;
  native test_Class_GetStaticField_Char(): boolean;
  native test_Class_GetStaticField_Byte(): boolean;
  native test_Class_GetStaticField_Short(): boolean;
  native test_Class_GetStaticField_Int(): boolean;
  native test_Class_GetStaticField_Long(): boolean;
  native test_Class_GetStaticField_Float(): boolean;
  native test_Class_GetStaticField_Double(): boolean;
  native test_Class_GetStaticField_Ref(): boolean;
  native test_Class_SetStaticField_Boolean(): boolean;
  native test_Class_SetStaticField_Char(): boolean;
  native test_Class_SetStaticField_Byte(): boolean;
  native test_Class_SetStaticField_Short(): boolean;
  native test_Class_SetStaticField_Int(): boolean;
  native test_Class_SetStaticField_Long(): boolean;
  native test_Class_SetStaticField_Float(): boolean;
  native test_Class_SetStaticField_Double(): boolean;
  native test_Class_SetStaticField_Ref(): boolean;
  native test_Class_GetStaticFieldByName_Boolean(): boolean;
  native test_Class_GetStaticFieldByName_Char(): boolean;
  native test_Class_GetStaticFieldByName_Byte(): boolean;
  native test_Class_GetStaticFieldByName_Short(): boolean;
  native test_Class_GetStaticFieldByName_Int(): boolean;
  native test_Class_GetStaticFieldByName_Long(): boolean;
  native test_Class_GetStaticFieldByName_Float(): boolean;
  native test_Class_GetStaticFieldByName_Double(): boolean;
  native test_Class_GetStaticFieldByName_Ref(): boolean;
  native test_Class_SetStaticFieldByName_Boolean(): boolean;
  native test_Class_SetStaticFieldByName_Char(): boolean;
  native test_Class_SetStaticFieldByName_Byte(): boolean;
  native test_Class_SetStaticFieldByName_Short(): boolean;
  native test_Class_SetStaticFieldByName_Int(): boolean;
  native test_Class_SetStaticFieldByName_Long(): boolean;
  native test_Class_SetStaticFieldByName_Float(): boolean;
  native test_Class_SetStaticFieldByName_Double(): boolean;
  native test_Class_SetStaticFieldByName_Ref(): boolean;
  native test_Class_CallStaticMethodByName_Boolean(): boolean;
  native test_Class_CallStaticMethodByName_Boolean_A(): boolean;
  native test_Class_CallStaticMethodByName_Boolean_V(): boolean;
  native test_Class_CallStaticMethodByName_Char(): boolean;
  native test_Class_CallStaticMethodByName_Char_A(): boolean;
  native test_Class_CallStaticMethodByName_Char_V(): boolean;
  native test_Class_CallStaticMethodByName_Byte(): boolean;
  native test_Class_CallStaticMethodByName_Byte_A(): boolean;
  native test_Class_CallStaticMethodByName_Byte_V(): boolean;
  native test_Class_CallStaticMethodByName_Short(): boolean;
  native test_Class_CallStaticMethodByName_Short_A(): boolean;
  native test_Class_CallStaticMethodByName_Short_V(): boolean;
  native test_Class_CallStaticMethodByName_Int(): boolean;
  native test_Class_CallStaticMethodByName_Int_A(): boolean;
  native test_Class_CallStaticMethodByName_Int_V(): boolean;
  native test_Class_CallStaticMethodByName_Long(): boolean;
  native test_Class_CallStaticMethodByName_Long_A(): boolean;
  native test_Class_CallStaticMethodByName_Long_V(): boolean;
  native test_Class_CallStaticMethodByName_Float(): boolean;
  native test_Class_CallStaticMethodByName_Float_A(): boolean;
  native test_Class_CallStaticMethodByName_Float_V(): boolean;
  native test_Class_CallStaticMethodByName_Double(): boolean;
  native test_Class_CallStaticMethodByName_Double_A(): boolean;
  native test_Class_CallStaticMethodByName_Double_V(): boolean;
  native test_Class_CallStaticMethodByName_Ref(): boolean;
  native test_Class_CallStaticMethodByName_Ref_A(): boolean;
  native test_Class_CallStaticMethodByName_Ref_V(): boolean;
  native test_Class_CallStaticMethodByName_Void(): boolean;
  native test_Class_CallStaticMethodByName_Void_A(): boolean;
  native test_Class_CallStaticMethodByName_Void_V(): boolean;
  native test_Class_CallStaticMethod_Short(): boolean;
  native test_Class_CallStaticMethod_Short_A(): boolean;
  native test_Class_CallStaticMethod_Short_V(): boolean;
  native test_Class_CallStaticMethod_Int(): boolean;
  native test_Class_CallStaticMethod_Int_A(): boolean;
  native test_Class_CallStaticMethod_Int_V(): boolean;

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