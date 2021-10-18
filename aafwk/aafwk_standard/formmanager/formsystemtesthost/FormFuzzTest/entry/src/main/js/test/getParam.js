/*
 * Copyright (C) 2021 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
var RANDOM_BEGIN_POSITION = 0;
var RANDOM_BEGIN_POSITION_A = 2;
var STRING_RANDOM_LENGTH = 2064;
var ASCII_RANDOM_LENGTH = 256;
var BOOLEAN_RANDOM_LENGTH = 2;
var ARRAY_RANDOM_LENGTH = 10;
var ARRAY_RANDOM_TYPE_LENGTH = 3;
var OBJECT_RANDOM_LENGTH = 2;
var FUNCTION_RANDOM_LENGTH = 2;

//string ascii
var STRING_RANDOM_LENGTH_A = 48;
var STRING_RANDOM_LENGTH_B = 58;
var STRING_RANDOM_LENGTH_C = 65;
var STRING_RANDOM_LENGTH_D = 91;
var STRING_RANDOM_LENGTH_E = 97;
var STRING_RANDOM_LENGTH_F = 122;

// Return integer random, the range is: [iStart, iEnd)
function  getIntegerRandom(iStart, iEnd) {
    var decimal = iStart + (iEnd - iStart) * Math.random();
    return Math.floor(decimal);
}

// return string random, the string length is: [0, 2064)
const stringTest = function() {
    // string
    var res = "";

    // string length
    var iNumber = getIntegerRandom(RANDOM_BEGIN_POSITION, STRING_RANDOM_LENGTH);
    for(var iAsciiToChar = RANDOM_BEGIN_POSITION; iAsciiToChar < iNumber ; iAsciiToChar ++) {

        var iNumberString = getIntegerRandom(RANDOM_BEGIN_POSITION, RANDOM_BEGIN_POSITION_A);

        switch (iNumberString) {
        case 0:
            // get ascii [0-9]
            iNumber = getIntegerRandom(STRING_RANDOM_LENGTH_A, STRING_RANDOM_LENGTH_B);
        break;
        case 1:
            // get ascii [A-Z]
            iNumber = getIntegerRandom(STRING_RANDOM_LENGTH_C, STRING_RANDOM_LENGTH_D);
        break;
        case 2:
        default:
            // get ascii [a-z]
            iNumber = getIntegerRandom(STRING_RANDOM_LENGTH_E, STRING_RANDOM_LENGTH_F);
        break;

        }
        // from ascii to char
        var asciiToChar = String.fromCharCode(iNumber);
        res += asciiToChar;
    }
    return res;
}

// return number random, the number length is: [Number.MIN_SAFE_INTEGER, Number.MAX_SAFE_INTEGER]
const numberTest = function() {
    return getIntegerRandom(Number.MIN_SAFE_INTEGER, Number.MAX_SAFE_INTEGER + 1);
}

// return boolean random, the boolean value is: 0->(false), 1->(true)
const booleanTest = function() {
    return getIntegerRandom(RANDOM_BEGIN_POSITION, BOOLEAN_RANDOM_LENGTH);
}

// return null
const nullTest = function() {
    return null;
}

// return undefinedTest
const undefinedTest = function() {
    return undefined;
}

// return array random, the array value is: string,number,bool
const arrayTest = function() {
    var arrValue = [];

    // array length
    var iNumber = getIntegerRandom(RANDOM_BEGIN_POSITION, ARRAY_RANDOM_LENGTH);
    for(var iArrNumber = 0; iArrNumber < iNumber ; iArrNumber ++) {

        // string,number,bool
        iNumber = getIntegerRandom(RANDOM_BEGIN_POSITION, ARRAY_RANDOM_TYPE_LENGTH);
        switch(iNumber) {
        case 0:
            arrValue[iArrNumber] = stringTest();
            break;
        case 1:
            arrValue[iArrNumber] = numberTest();
            break;
        case 2:
            arrValue[iArrNumber] = booleanTest();
            break;
        default:
            arrValue[iArrNumber] = '';
        }
    }
    return arrValue;
}

// return objectTest random, the objectTest value is: null, not null
const objectTest = function() {
    var objectA = Object.create(null);
    var objectB = Object.create("objectTest");

    return getIntegerRandom(RANDOM_BEGIN_POSITION, OBJECT_RANDOM_LENGTH) ? objectA: objectB;
}

// return functionTest random, the functionTest value is: null, not null
const functionTest = function() {
    var functionA = {};
    var functionB = {id:"functionTest"};

    return getIntegerRandom(RANDOM_BEGIN_POSITION, FUNCTION_RANDOM_LENGTH) ? functionA: functionB;
}

// get parameter value from: string, number, bool, null, undefined, object, array, function
const parameterValue = function() {

    var fuzzConfigData = [
            {"name":"string", "paramWeight":25},
            {"name":"number", "paramWeight":45},
            {"name":"boolean", "paramWeight":50},
            {"name":"null", "paramWeight":52},
            {"name":"undefined", "paramWeight":54},
            {"name":"object", "paramWeight":62},
            {"name":"array", "paramWeight":92},
            {"name":"function", "paramWeight":100},
        ]

    var weightSum = fuzzConfigData[fuzzConfigData.length - 1].paramWeight;
    console.log("The weight sum of this fuzzTest:" + weightSum);

    var paramValue = '';
    var iNumber = getIntegerRandom(RANDOM_BEGIN_POSITION, weightSum);
    console.log("The iNumber of this fuzzTest random:" + iNumber);

    for(var iFuzzDataNumber = 0; iFuzzDataNumber < fuzzConfigData.length; iFuzzDataNumber ++) {

        if((iFuzzDataNumber == 0 &&
        iNumber < fuzzConfigData[iFuzzDataNumber].paramWeight) ||
        (iNumber < fuzzConfigData[iFuzzDataNumber].paramWeight &&
        iNumber > fuzzConfigData[iFuzzDataNumber - 1].paramWeight) ) {
            console.log("The name of this fuzzTest random:" + fuzzConfigData[iFuzzDataNumber].name);
            switch(fuzzConfigData[iFuzzDataNumber].name) {
                case "string":
                    paramValue = stringTest();
                    break;
                case "number":
                    paramValue = numberTest();
                    break;
                case "boolean":
                    paramValue = booleanTest();
                    break;
                case "null":
                    paramValue = nullTest();
                    break;
                case "undefined":
                    paramValue = undefinedTest();
                    break;
                case "object":
                    paramValue = objectTest();
                    break;
                case "array":
                    paramValue = arrayTest();
                    break;
                case "function":
                    paramValue = functionTest();
                    break;
                default:
                    paramValue = '';
                    break;
            }
        }
    }

    console.log("The paramValue of this fuzzTest random:" + paramValue);
    return paramValue;
}

export {
    parameterValue, stringTest, numberTest, booleanTest, nullTest, undefinedTest, objectTest, arrayTest, functionTest
}