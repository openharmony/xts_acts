/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/
// 类型导出
export enum OrderStatus {
  Pending = 'PENDING', // 订单待处理
  Shipped = 'SHIPPED', // 订单已发货
  Delivered = 'DELIVERED', // 订单已送达
  Cancelled = 'CANCELLED', // 订单已取消
}

// 对象导出 默认导出 定义和导出在一条语句中
export const OrderStatus1 = {
  Pending: 'PENDING', // 订单待处理
  Shipped: 'SHIPPED', // 订单已发货
  Delivered: 'DELIVERED', // 订单已送达
  Cancelled: 'CANCELLED', // 订单已取消
}

// 对象导出 先定义再导出对象
const OrderStatus2 = {
  Pending: 'PENDING', // 订单待处理
  Shipped: 'SHIPPED', // 订单已发货
  Delivered: 'DELIVERED', // 订单已送达
  Cancelled: 'CANCELLED', // 订单已取消
}

export { OrderStatus2 }

// 先定义，再导出对象，取别名
export { OrderStatus2 as OrderStatus3 }

