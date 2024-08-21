/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2023-2024. All rights reserved.
 */

/**
 * 定义常量类
 */
export class Constant {
  static readonly SLEEP_TIME_100: number = 100;
  static readonly PARAM_EORRCODE: string = "401";
  static readonly PERM_EORRCODE: string = "13900012";
  static readonly ARGS_EORRCODE: string = "13900020";
  static readonly SYSTEM_EORRCODE: string = "14000011";
}

export function sleep(ms: number): Promise<string> {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve('');
    }, ms);
  });
}
export function rand_sleep(ms: number): Promise<string> {
  let random:number = Math.floor(Math.random()*ms);
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve('');
    }, random);
  });
}
