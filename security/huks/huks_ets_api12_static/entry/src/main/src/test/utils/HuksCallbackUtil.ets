// import huks from '@ohos.security.huks';
// import { BusinessError } from '@ohos.base';
//
// export async function generateKeyItem(keyAlias: string, options: huks.HuksOptions): Promise<void> {
//   return new Promise<void>((resolve, reject) => {
//     huks.generateKeyItem(keyAlias, options, (err: BusinessError, data: string): void => {
//       if (err) {
//         reject(err);
//       }
//       resolve(undefined);
//     })
//   })
// }
//
//
// export async function deleteKeyItem(keyAlias: string, options: huks.HuksOptions): Promise<void> {
//   return new Promise<void>((resolve, reject) => {
//     huks.deleteKeyItem(keyAlias, options, (err: BusinessError, data: string): void => {
//       if (err) {
//         reject(err);
//       }
//       resolve(undefined);
//     })
//   })
// }
//
// export async function importKeyItem(keyAlias: string, options: huks.HuksOptions): Promise<void> {
//   return new Promise<void>((resolve, reject) => {
//     huks.importKeyItem(keyAlias, options, (err: BusinessError, data: string): void => {
//       if (err) {
//         reject(err);
//       }
//       resolve(undefined);
//     })
//   })
// }
//
// export async function importWrappedKeyItem(keyAlias: string, wrappingKeyAlias: string, options: huks.HuksOptions): Promise<void> {
//   return new Promise<void>((resolve, reject) => {
//     huks.importWrappedKeyItem(keyAlias, wrappingKeyAlias, options, (err: BusinessError, data: string): void => {
//       if (err) {
//         reject(err);
//       }
//       resolve(undefined);
//     })
//   })
// }
//
// export async function exportKeyItem(keyAlias: string, options: huks.HuksOptions): Promise<huks.HuksReturnResult> {
//   return new Promise<huks.HuksReturnResult>((resolve, reject) => {
//     huks.exportKeyItem(keyAlias, options, (err: BusinessError, data: huks.HuksReturnResult): void => {
//       if (err) {
//         reject(err);
//       }
//       resolve(data);
//     })
//   })
// }
//
// // export async function getKeyItemProperties(keyAlias: string, options: huks.HuksOptions): Promise<huks.HuksReturnResult> {
// //   return new Promise<huks.HuksReturnResult>((resolve, reject) => {
// //     huks.getKeyItemProperties(keyAlias, options, (err: BusinessError, data: huks.HuksReturnResult): void => {
// //       if (err) {
// //         reject(err);
// //       }
// //       resolve(data);
// //     })
// //   })
// // }
//
// export async function isKeyItemExist(keyAlias: string, options: huks.HuksOptions): Promise<boolean> {
//   return new Promise<boolean>((resolve, reject) => {
//     huks.isKeyItemExist(keyAlias, options, (err: BusinessError, data: boolean): void => {
//       if (err) {
//         reject(err);
//       }
//       resolve(data);
//     })
//   })
// }
//
// // export async function hasKeyItem(keyAlias: string, options: huks.HuksOptions): Promise<boolean> {
// //   return new Promise<boolean>((resolve, reject) => {
// //     huks.hasKeyItem(keyAlias, options, (err: BusinessError, data: boolean): void => {
// //       if (err) {
// //         reject(err);
// //       }
// //       resolve(data);
// //     })
// //   })
// // }
//
// export async function initSession(keyAlias: string, options: huks.HuksOptions): Promise<huks.HuksSessionHandle> {
//   return new Promise<huks.HuksSessionHandle>((resolve, reject) => {
//     huks.initSession(keyAlias, options, (err: BusinessError, data: huks.HuksSessionHandle): void => {
//       if (err) {
//         reject(err);
//       }
//       resolve(data);
//     })
//   })
// }
//
// export async function updateSession(handle: long, options: huks.HuksOptions): Promise<huks.HuksReturnResult> {
//   return new Promise<huks.HuksReturnResult>((resolve, reject) => {
//     huks.updateSession(handle, options, (err: BusinessError, data: huks.HuksReturnResult): void => {
//       if (err) {
//         reject(err);
//       }
//       resolve(data);
//     })
//   })
// }
//
// export async function finishSession(handle: long, options: huks.HuksOptions): Promise<huks.HuksReturnResult> {
//   return new Promise<huks.HuksReturnResult>((resolve, reject) => {
//     huks.finishSession(handle, options, (err: BusinessError, data: huks.HuksReturnResult): void => {
//       if (err) {
//         reject(err);
//       }
//       resolve(data);
//     })
//   })
// }
//
// export async function abortSession(handle: long, options: huks.HuksOptions): Promise<void> {
//   return new Promise<void>((resolve, reject) => {
//     huks.abortSession(handle, options, (err: BusinessError, data: string): void => {
//       if (err) {
//         reject(err);
//       }
//       resolve(undefined);
//     })
//   })
// }
//
// // export async function anonAttestKeyItem(keyAlias: string, options: huks.HuksOptions): Promise<huks.HuksReturnResult> {
// //   return new Promise<huks.HuksReturnResult>((resolve, reject) => {
// //     huks.anonAttestKeyItem(keyAlias, options, (err: BusinessError, data: huks.HuksReturnResult): void => {
// //       if (err) {
// //         reject(err);
// //       }
// //       resolve(data);
// //     })
// //   })
// // }
//
// // export async function update(handle: long, token: Uint8Array | undefined, options: huks.HuksOptions): Promise<huks.HuksReturnResult> {
// //   return new Promise<huks.HuksReturnResult>((resolve, reject) => {
// //     huks.update(handle, token, options, (err: BusinessError, data: huks.HuksReturnResult): void => {
// //       if (err) {
// //         reject(err);
// //       }
// //       resolve(data);
// //     })
// //   })
// // }