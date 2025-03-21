import test from 'libentry.so'
// 定义 HiAppEvent_Processor 类型
declare class HiAppEvent_Processor {}

// 导出 Processor 类型
export type Processor = HiAppEvent_Processor;

const NativeMock: Record<string, Object> = {
  'add': (a: number, b: number) => {
    return a + b;
  },
  'CreateProcessor': (name: string) => {
    return test.CreateProcessor(name);
  },
  'SetReportRoute': (processor: Processor, appId: string, routeInfo: string) => {
    return test.SetReportRoute(processor,appId,routeInfo);
  },
  'SetReportPolicy': (processor: Processor, periodReport: number , batchReport: number, onStartReport: boolean, onBackgroundReport:boolean) => {
    return test.SetReportPolicy(processor, periodReport, batchReport, onStartReport, onBackgroundReport);
  },
  'SetReportEvent': (processor: Processor, domain: string, name: string, isRealTime: boolean) => {
    return test.SetReportEvent(processor, domain, name, isRealTime);
  },
  'SetCustomConfig': (processor: Processor, key: string, value: string ) => {
    return test.SetCustomConfig(processor, key, value);
  },
  'SetConfigId': (processor: Processor, configId: number ) => {
    return test.SetConfigId(processor, configId);
  },
  'SetReportUserId': (processor: Processor, userIdNames: string[], size: number) => {
    return test.SetReportUserId(processor, userIdNames, size);
  },
  'SetReportUserProperty': (processor: Processor, userPropertyNames: string[], size: number) => {
    return test.SetReportUserProperty(processor, userPropertyNames, size);
  },
  'AddProcessor': (processor: Processor) => {
    return test.AddProcessor(processor);
  },
  'RemoveProcessor': (processorId: number) => {
    return test.RemoveProcessor(processorId);
  },
  'DestroyProcessor': (processor: Processor) => {
    return test.DestroyProcessor(processor);
  },
};

export default NativeMock;