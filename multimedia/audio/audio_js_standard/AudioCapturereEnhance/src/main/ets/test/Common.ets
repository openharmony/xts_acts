/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2023-2024. All rights reserved.
 */

// 枚举，音频状态
export class AudioState {
  static readonly STATE_INVALID: number = -1; //无效状态。
  static readonly STATE_NEW: number = 0; //创建新实例状态
  static readonly STATE_PREPARED: number = 1; //准备状态
  static readonly STATE_RUNNING: number = 2; //运行状态
  static readonly STATE_STOPPED: number = 3; //停止状态
  static readonly STATE_RELEASED: number = 4; //释放状态
  static readonly STATE_PAUSED: number = 5; //暂停状态
}
/**
 * 定义常量类
 */
export class Constant {
  static readonly SLEEP_TIME_100: number = 100;
  static readonly EORRCODE: number = 6800301;
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
