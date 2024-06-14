/**
 * In TypeScript, the keys of an enum include both the key names and the enum values,
 * so you can count the number of key names to determine the quantity.
 */
export function getEnumCount(obj: Object): number {
  let count = 0;
  Object.values(obj).forEach((v: string | number) => {
    if (typeof v === 'string') {
      count++;
    }
  });
  return count;
}