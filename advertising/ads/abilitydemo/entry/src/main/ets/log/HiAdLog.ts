import hilog from '@ohos.hilog';

class Logger {
  private tag: number;
  private pre: string;
  private format: string = "%{public}s, %{public}s";

  constructor() {
    this.pre = '[Sample_Advertising]';
    this.tag = 0xFF00;
  }

  d(...args: any[]) {
    hilog.debug(this.tag, this.pre, this.format, args);
  }

  i(...args: any[]) {
    hilog.info(this.tag, this.pre, this.format, args);
  }

  w(...args: any[]) {
    hilog.warn(this.tag, this.pre, this.format, args);
  }

  e(...args: any[]) {
    hilog.error(this.tag, this.pre, this.format, args);
  }
}

export default new Logger()