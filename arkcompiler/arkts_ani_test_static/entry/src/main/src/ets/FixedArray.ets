function getArray1(): FixedArray<(Object | null)> {
  return [null, null, 'Hello World!']
}

function getArray2(): FixedArray<(string | null)> {
  let a: FixedArray<(string | null)> = [null, null, 'Hello World!']
  return a
}

const string1 = 'New String 1!'

function getNewString1(): string {
  return string1
}