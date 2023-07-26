(function() {
  "use strict";
  var e = globalThis.requireNapi("hilog");
  class t extends ViewPU {
    constructor(e, t, o, s = -1) {
      super(e, o, s);
      this.__message = new ObservedPropertySimplePU("Hello World", this, "message");
      this.setInitiallyProvidedValue(t);
    }
    setInitiallyProvidedValue(e) {
      if (e.message !== void 0) {
        this.message = e.message;
      }
    }
    updateStateVars(e) {}
    purgeVariableDependenciesOnElmtId(e) {
      this.__message.purgeDependencyOnElmtId(e);
    }
    aboutToBeDeleted() {
      this.__message.aboutToBeDeleted();
      SubscriberManager.Get().delete(this.id__());
      this.aboutToBeDeletedInternal();
    }
    aboutToAppear() {
      e.info(0, "testTag", "%{public}s", "TestAbility index aboutToAppear");
    }
    get message() {
      return this.__message.get();
    }
    set message(e) {
      this.__message.set(e);
    }
    initialRender() {
      this.observeComponentCreation(((e, t) => {
        ViewStackProcessor.StartGetAccessRecordingFor(e);
        Row.create();
        Row.height("100%");
        if (!t) {
          Row.pop();
        }
        ViewStackProcessor.StopGetAccessRecording();
      }));
      this.observeComponentCreation(((e, t) => {
        ViewStackProcessor.StartGetAccessRecordingFor(e);
        Column.create();
        Column.width("100%");
        if (!t) {
          Column.pop();
        }
        ViewStackProcessor.StopGetAccessRecording();
      }));
      this.observeComponentCreation(((e, t) => {
        ViewStackProcessor.StartGetAccessRecordingFor(e);
        Text.create(this.message);
        Text.fontSize(50);
        Text.fontWeight(FontWeight.Bold);
        if (!t) {
          Text.pop();
        }
        ViewStackProcessor.StopGetAccessRecording();
      }));
      Text.pop();
      this.observeComponentCreation(((e, t) => {
        ViewStackProcessor.StartGetAccessRecordingFor(e);
        Button.createWithChild();
        Button.type(ButtonType.Capsule);
        Button.margin({
          top: 20
        });
        Button.backgroundColor("#0D9FFB");
        Button.width("35%");
        Button.height("5%");
        Button.onClick((() => {}));
        if (!t) {
          Button.pop();
        }
        ViewStackProcessor.StopGetAccessRecording();
      }));
      this.observeComponentCreation(((e, t) => {
        ViewStackProcessor.StartGetAccessRecordingFor(e);
        Text.create("next page");
        Text.fontSize(20);
        Text.fontWeight(FontWeight.Bold);
        if (!t) {
          Text.pop();
        }
        ViewStackProcessor.StopGetAccessRecording();
      }));
      Text.pop();
      Button.pop();
      Column.pop();
      Row.pop();
    }
    rerender() {
      this.updateDirtyElements();
    }
  }
  ViewStackProcessor.StartGetAccessRecordingFor(ViewStackProcessor.AllocateNewElmetIdForNextComponent());
  loadDocument(new t(void 0, {}));
  ViewStackProcessor.StopGetAccessRecording();
})();
//# sourceMappingURL=index.js.map
