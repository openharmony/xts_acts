


export default interface IIdlServiceExt {
    add(num1: number, num2: number, callback: addCallback): void;
}
export type addCallback = (errCode: number, returnValue: number) => void;

