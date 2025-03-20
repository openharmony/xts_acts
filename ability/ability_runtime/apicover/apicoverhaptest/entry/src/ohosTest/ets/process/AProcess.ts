import { ChildProcess, ChildProcessArgs } from '@kit.AbilityKit';

export default class DemoProcess extends ChildProcess {

  onStart() {
    console.log('ChildProcess start!!!')
  }
}