


export default interface SubServiceExt {
    sub(num1: number, num2: number, callback: subCallback): void;
}
export type subCallback = (errCode: number, returnValue: number) => void;

