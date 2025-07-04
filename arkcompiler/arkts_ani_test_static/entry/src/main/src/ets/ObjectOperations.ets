class A {
  public static new_A(): A {
    return new A();
  }

  public static new_A_array(): Array<A> {
    return [];
  }

  boolean_method(a0: int, a1: int): boolean {
    if (a0 + a1 > 10) {
      return true;
    } else {
      return false;
    }
  }
}

class B extends A {
  public static new_B(): B {
    return new B();
  }

  boolean_method(a0: int, a1: int): boolean {
    if (a0*a1 > 10) {
      return true;
    } else {
      return false;
    }
  }
}

class C extends B {
  public static new_C(): C {
    return new C();
  }

  boolean_method(a0: int, a1: int): boolean {
    if (a0 - a1 > 10) {
      return true;
    } else {
      return false;
    }
  }
}

enum ToFind {
  RED,
  GREEN,
  BLUE
}


class MobilePhone {
  constructor(model: String, weight: int) {
    this.model = model;
    this.weight = weight;
  }
  public model: String;
  public weight: int;
}