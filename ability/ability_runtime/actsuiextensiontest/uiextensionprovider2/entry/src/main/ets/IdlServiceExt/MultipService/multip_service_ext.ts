


export default interface MultipServiceExt {
    multip(num1: number, num2: number, callback: multipCallback): void;
}
export type multipCallback = (errCode: number, returnValue: number) => void;

