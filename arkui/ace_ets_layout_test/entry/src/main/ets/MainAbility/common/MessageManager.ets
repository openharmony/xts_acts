
export interface Callback {
  (message:any):void
}

export class MessageManager {
    callback:Callback
    callbacks:Map<string,Callback> = new Map()

    constructor() {

    }

   registerCallback(callback:Callback , type?:string) {
    if (type == undefined) {
      console.error('registerCallback callback set')
      this.callback = callback
      return
    }
    this.callbacks.set(type,callback)
  }

   notify(message:any, type?:string) {
    if (type == undefined) {
      this.callback(message)
      return
    }

    let tmpCallback:Callback = this.callbacks.get(type)
    if (tmpCallback === undefined) {
      console.error('callbacks has no callback for type ' + type)
      return
    }
    tmpCallback(message)
  }

   clear() {
    this.callbacks.clear()
    this.callback = null
  }
}