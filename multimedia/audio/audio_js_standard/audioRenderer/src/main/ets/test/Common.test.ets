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

// 枚举，音频并发模式
export class AudioConcurrencyMode {
  static readonly CONCURRENCY_DEFAULT: number = 0; //默认模式
  static readonly CONCURRENCY_MIX_WITH_OTHERS: number = 1; //混音模式:可以和其它后台App进行混音
  static readonly CONCURRENCY_DUCK_OTHERS: number = 2; //混音降低音量模式:压低其它App声音
  static readonly CONCURRENCY_PAUSE_OTHERS: number = 3; //暂停模式:暂停其它App声音
}

// 枚举,去激活事件类型
export enum AudioSessionDeactivatedReason {
  DEACTIVATED_LOWER_PRIORITY = 0,
  DEACTIVATED_TIMEOUT = 1,
}

/**
 * 定义常量类
 */
export class Constant {
  static readonly SLEEP_TIME_100: number = 100;
  static readonly EORRCODE: number = 6800301;
  static readonly SYS_EORRCODE: Number = 6800101;
  static readonly DEACTIVATED_LOWER_PRIORITY:number = 0;
  static readonly DEACTIVATED_TIMEOUT:number = 1;
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
