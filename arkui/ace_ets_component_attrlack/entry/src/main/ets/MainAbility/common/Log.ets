
const TAG = 'ets_apiLack_add';

/**
 * Basic log class
 */
export default class Log {

    /**
     * print info level log
     *
     * @param {string} tag - Page or class tag
     * @param {string} log - Log needs to be printed
     */
    static showInfo(tag, log) {
        console.info(`${TAG} tag: ${tag} --> ${log}`);
    }

    /**
     * print debug level log
     *
     * @param {string} tag - Page or class tag
     * @param {string} log - Log needs to be printed
     */
    static showDebug(tag, log) {
        console.debug(`${TAG} tag: ${tag} --> ${log}`);
    }

    /**
     * print error level log
     *
     * @param {string} tag - Page or class tag
     * @param {string} log - Log needs to be printed
     */
    static showError(tag, log) {
        console.error(`${TAG} tag: ${tag} --> ${log}`);
    }
}
