/**
 * @file 日期工具
 */
export default class DateTimeUtil {

    /**
     * 时分秒
     */
    getTime() {
        const DATETIME = new Date()
        return this.concatTime(DATETIME.getHours(), DATETIME.getMinutes(), DATETIME.getSeconds())
    }

    /**
     * 年月日
     */
    getDate() {
        const DATETIME = new Date()
        return this.concatDate(DATETIME.getFullYear(), DATETIME.getMonth() + 1, DATETIME.getDate())
    }

    /**
     * 日期不足两位补充0
     * @param value-数据值
     */
    fill(value: number) {
        return (value > 9 ? '' : '0') + value
    }
    /**
     * 录制时间定时器
     * @param millisecond-数据值
     */
    getVideoTime(millisecond: number): string {
        let minute = Math.floor(millisecond / 60000)
        let second = Math.floor((millisecond - minute * 60000) / 1000)
        return `${this.fill(minute)} : ${this.fill(second)}`
    }
    /**
     * 年月日格式修饰
     * @param year
     * @param month
     * @param date
     */
    concatDate(year: number, month: number, date: number) {
        return `${year}${this.fill(month)}${this.fill(date)}`
    }

    /**
     * 时分秒格式修饰
     * @param hours
     * @param minutes
     * @param seconds
     */
    concatTime(hours: number, minutes: number, seconds: number) {
        return `${this.fill(hours)}${this.fill(minutes)}${this.fill(seconds)}`
    }
}