function stringToUint8Array(str) {
    var arr = [];
    for (var i = 0, j = str.length; i < j; ++i) {
        arr.push(str.charCodeAt(i));
    }
    var tmpUint8Array = new Uint8Array(arr);
    return tmpUint8Array
}

function Uint8ArrayToString(array) {
    var dataString = "";
    for (var i = 0; i < array.length; i++) {
        dataString += String.fromCharCode(array[i]);
    }
    return dataString
}

function GetDataRandom(){
    var result='';
    for(var i=0;i<16;i++){
        result+=Math.floor(Math.random()*10).toString();
    }
    console.log(`test GetDataRandom ${result}`)
    return result;
}

function stringToArray(str) {
    var arr = [];
    for (var i = 0, j = str.length; i < j; ++i) {
        arr.push(str.charCodeAt(i));
    }
    return arr
}

export {stringToUint8Array,Uint8ArrayToString,GetDataRandom,stringToArray};