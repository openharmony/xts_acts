export function sleep(time: number): Promise<void> {
  return new Promise((re, je) => {
    setTimeout(() => {
      re();
    }, time);
  });
};

@Concurrent
export function printArgs2(args: number): number {
  console.info("printArgs: " + args);
  return args;
}
