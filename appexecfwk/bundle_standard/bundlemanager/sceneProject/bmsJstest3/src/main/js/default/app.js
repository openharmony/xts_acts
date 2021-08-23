

export default {
	onCreate() {
		console.info('AceApplication onCreate start');
		//console.info('AceApplication onCreate add ' + demo.add(123,456));
		//console.info('AceApplication onCreate getApplicationInfos ' + demo.getApplicationInfos(0,0));
		//demo.getApplicationInfosPromise().then(function (data) {console.info('AceApplication onCreate GetApplicationInfosPromise');});
	},
	onDestroy() {
		console.info('AceApplication onDestroy');
	}
};
