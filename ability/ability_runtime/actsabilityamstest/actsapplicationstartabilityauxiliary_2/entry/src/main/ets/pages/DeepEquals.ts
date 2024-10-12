export class DeepEquals {
  public static deepEqual<T>(obj1: T, obj2: T): boolean {
    if (obj1 === obj2) return true; // 如果两者引用相同，直接返回true
    if (typeof obj1 !== 'object' || obj1 === null ||
      typeof obj2 !== 'object' || obj2 === null) return false; // 不是对象则返回false

    const keys1 = Object.keys(obj1);
    const keys2 = Object.keys(obj2);

    if (keys1.length !== keys2.length) return false;

    for (let key of keys1) {
      if (!(key in obj2)) return false;

      if (typeof obj1[key] === 'object' && typeof obj2[key] === 'object') {
        if (!DeepEquals.deepEqual(obj1[key] as T, obj2[key] as T)) return false;
      } else if (obj1[key] !== obj2[key]) {
        return false;
      }
    }
    return true;
  }
}
