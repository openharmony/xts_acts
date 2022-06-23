export default class MySequenceable {
    constructor() {
        this.num = 14;
        this.str = "hello";
    }
    getNum() : number {
        return this.num;
    }

    getString() : string {
        return this.str;
    }

    marshalling(messageParcel) {
        console.info('marshalling++++');
        messageParcel.writeInt(this.num);
        messageParcel.writeString(this.str);
        return true;
    }
    unmarshalling(messageParcel) {
        console.info('unmarshalling++++');
        this.num = messageParcel.readInt();
        this.str = messageParcel.readString();
        return true;
    }
    private num;
    private str;
}