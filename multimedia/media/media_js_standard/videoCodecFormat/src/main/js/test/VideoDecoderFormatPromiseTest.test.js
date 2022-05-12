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

import media from '@ohos.multimedia.media'
import fileio from '@ohos.fileio'
import router from '@system.router'
import {getFileDescriptor, closeFileDescriptor} from './VideoFormatTestBase.test.js'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from 'deccjsunit/index'


describe('VideoDecoderFormatPromise', function () {
    let videoDecodeProcessor = null;
    let readStreamSync = undefined;
    let frameCountIn = 0;
    let frameCountOut = 0;
    let timestamp = 0;
    let inputQueue = [];
    let outputQueue = [];
    let isCodecData = false;
    let inputEosFlag = false;
    let surfaceID = '';
    let fdRead;
    let readPath;
    const events = require('events');
    const eventEmitter = new events.EventEmitter();
    let ES_FRAME_SIZE = [];
        const H264_HP_720_480_30_3000000 = 
        [728, 40437, 1906, 332, 1686, 2982, 757, 418, 429, 4448, 843, 502, 589, 8593, 1479, 755, 958, 4426, 
            655, 7936, 1266, 871, 699, 9715, 1126, 806, 578, 7895, 1272, 825, 821, 11842, 1417, 801, 685, 
            8102, 1147, 673, 517, 8747, 1488, 708, 774, 11322, 1788, 893, 851, 11258, 1920, 804, 893, 10941, 
            1932, 1020, 1003, 10665, 2159, 926, 869, 12877, 2336, 956, 1116, 11833, 2313, 1261, 1117, 11244, 
            2288, 1330, 1147, 11050, 2409, 1170, 1089, 12664, 2214, 1148, 1021, 10131, 2078, 1165, 1116, 10119, 
            2029, 1109, 951, 9146, 2022, 1011, 968, 12018, 2155, 1210, 934, 10460, 1928, 1034, 1024, 9221, 1798, 
            1119, 907, 11673, 2070, 996, 918, 8907, 1823, 947, 892, 9064, 1924, 853, 845, 9037, 1939, 962, 947, 
            13892, 1813, 1003, 1100, 15610, 2047, 1014, 997, 7361, 1624, 726, 806, 8081, 1849, 879, 889, 11001, 
            1805, 1111, 874, 8621, 1997, 817, 837, 10759, 2090, 809, 915, 7513, 1896, 754, 817, 13041, 2318, 
            1086, 922, 9502, 1856, 1016, 846, 8742, 1765, 942, 882, 11996, 2094, 992, 1066, 11028, 2131, 892, 
            922, 10127, 2008, 820, 775, 10027, 2072, 864, 827, 13105, 2045, 894, 908, 10002, 2012, 999, 947, 
            11283, 2198, 1027, 1073, 13148, 2021, 1157, 1045, 14008, 1921, 1265, 892, 11677, 2206, 1059, 910, 
            11252, 2166, 959, 987, 10932, 2306, 1000, 1052, 15844, 2812, 1460, 1220, 14077, 2599, 1270, 987, 
            13004, 2780, 1028, 1073, 17485, 3059, 1061, 1281, 12442, 2763, 1050, 1066, 13364, 2980, 1040, 1058, 
            13577, 3145, 1031, 1207, 20744, 3196, 1181, 1251, 15036, 3198, 1350, 1256, 13803, 3182, 1381, 1328, 
            55738, 13170, 3310, 1203, 1416, 18895, 4845, 1459, 1566, 16371, 4074, 1545, 1404, 19016, 3848, 1722, 
            1369, 21951, 4223, 1509, 1773, 19066, 4667, 1400, 1488, 17942, 4359, 1391, 1355, 18426, 4791, 1455, 
            1532, 20372, 4725, 1585, 1538, 18356, 4784, 1793, 1821, 14652, 4161, 1794, 1705, 9162, 3985, 1780, 
            1679, 4662, 1990];
        const H264_HP_640_480_30_3000000 = 
        [743, 63936, 4460, 396, 10897, 1792, 679, 940, 11454, 1710, 737, 1290, 17241, 3312, 1680, 1693, 11061, 
            2780, 1453, 1302, 23837, 2632, 1282, 2176, 35973, 6681, 2633, 3444, 42011, 8777, 3216, 6874, 38772, 
            8060, 3365, 4494, 35185, 8901, 3273, 4695, 33756, 8701, 3823, 5087, 38271, 9178, 4816, 6756, 36184, 
            9334, 4563, 4805, 36973, 11092, 5606, 6194, 33918, 10006, 4902, 6477, 40721, 13116, 5890, 6768, 36257, 
            12561, 5395, 6879, 35119, 11022, 5688, 5774, 34217, 10554, 4757, 6331, 35387, 12323, 5931, 6045, 
            32344, 10362, 5022, 5825, 30627, 9493, 4649, 5483, 35773, 11762, 4427, 6933, 27406, 7668, 3767, 4399, 
            30636, 9420, 4498, 4063, 29005, 8269, 3835, 4091, 32397, 8079, 4030, 5067, 26621, 4409, 2476, 27101, 
            6079, 2597, 2357, 26866, 5981, 2970, 2901, 35881, 5607, 3052, 3172, 38951, 6441, 2768, 3087, 24246, 
            5105, 2088, 2370, 25463, 5952, 2535, 2549, 31704, 5851, 3275, 2586, 28264, 6431, 2721, 2539, 32251, 
            7212, 2727, 2885, 24577, 6191, 2510, 2781, 38290, 7584, 3358, 2696, 30966, 6312, 3219, 2801, 28991, 
            5771, 2989, 2694, 35444, 7185, 3387, 3446, 33693, 7236, 3138, 3150, 32460, 6919, 3148, 2821, 32533, 
            7376, 3380, 3241, 38535, 7123, 3545, 3315, 32887, 7049, 3637, 3335, 35576, 7974, 3661, 3797, 38577, 
            7304, 3990, 3766, 41779, 7278, 4270, 3254, 37088, 7838, 3935, 3301, 35575, 7863, 3274, 3685, 34905, 
            8328, 3706, 3880, 44228, 9725, 4943, 4088, 41434, 8537, 4344, 3415, 38094, 8691, 3707, 3624, 46871, 
            9739, 3740, 4382, 36805, 8894, 3364, 3489, 38708, 9526, 3923, 3833, 38738, 10251, 4035, 3970, 52101, 
            9865, 4296, 4306, 41157, 10454, 4493, 4141, 37595, 10394, 4305, 4464, 104472, 35250, 8448, 3308, 4712, 
            44980, 12853, 4810, 4576, 41299, 10986, 4550, 4010, 45272, 11350, 4848, 3869, 50554, 11692, 4471, 5039, 
            46210, 12196, 4929, 4757, 43445, 11696, 4745, 4387, 43209, 12442, 4849, 4662, 46742, 12373, 5002, 4550, 
            42787, 12206, 5258, 4955, 35329, 11197, 5068, 4761, 23276, 10832, 4967, 4683, 11847, 5721];
        const H264_HP_352_288_30_3000000 = 
        [742, 36497, 5278, 212, 6150, 5552, 8919, 12122, 5996, 15180, 2588, 475, 830, 19788, 5367, 931, 2712, 
            22962, 5980, 1420, 3952, 28389, 7696, 4122, 5502, 29632, 10135, 6434, 7119, 30403, 12246, 7684, 
            6269, 27573, 5078, 26781, 6530, 2991, 2204, 27175, 11539, 6180, 5660, 30117, 9143, 7689, 7241, 
            30681, 11321, 6951, 7532, 29027, 11887, 6534, 6894, 28780, 12298, 4863, 6583, 30142, 12234, 6025, 
            6773, 29164, 12888, 8220, 6745, 28869, 12614, 8579, 7127, 28191, 11547, 7938, 6810, 29429, 11982, 
            5941, 6362, 27297, 10981, 8020, 6912, 26342, 11157, 7225, 5811, 25430, 10934, 5939, 6450, 27865, 
            10635, 7425, 5724, 25732, 10184, 6180, 5200, 26895, 9935, 6148, 5004, 27885, 11012, 6118, 5283, 
            26388, 9679, 5465, 4702, 25873, 8785, 4146, 3926, 25744, 8620, 4436, 4397, 22665, 4487, 28251, 
            12077, 5772, 4643, 30974, 10517, 4675, 3716, 26544, 10492, 4079, 4453, 29068, 12315, 4539, 5448, 
            27197, 10351, 4325, 5139, 27197, 11107, 4856, 5021, 27573, 11015, 5506, 3668, 31021, 11234, 4444, 
            5128, 27541, 10158, 4461, 4812, 27553, 10129, 4572, 4739, 27503, 10766, 4444, 5549, 29377, 11983, 
            6007, 6116, 29258, 11378, 6150, 5993, 29260, 11518, 6179, 5677, 28332, 11544, 6257, 6051, 30606, 
            12887, 7401, 6438, 28131, 12275, 6542, 6759, 30492, 13558, 7399, 6868, 32975, 14744, 7528, 8233, 
            29525, 12300, 6482, 7367, 29630, 12717, 7198, 6864, 28971, 12234, 7058, 7117, 32200, 13661, 7122, 
            7684, 30213, 12982, 7067, 6718, 31374, 13440, 6318, 5720, 30542, 12722, 5390, 5823, 32150, 13747, 
            5847, 4949, 30227, 13087, 4889, 6989, 31044, 13790, 6614, 7787, 31120, 14286, 7850, 8052, 34565, 
            16446, 9818, 8794, 30881, 14559, 8200, 7963, 16479, 7882, 58919, 28702, 13492, 6564, 7880, 33011, 
            14889, 8653, 8195, 32121, 13675, 7376, 6760, 32498, 14412, 7331, 7701, 34309, 14522, 8507, 8905, 
            32786, 14655, 9382, 9863, 31939, 14323, 9314, 9444, 31232, 14584, 9551, 9587, 32446, 14877, 9517, 
            9745, 31232, 15121, 9074, 8991, 28188, 14357, 8382, 8945, 21889, 14254, 8563, 8656, 14054, 9237];
        const H264_HP_720_480_25_3000000 = 
        [743, 60211, 13239, 2404, 721, 583, 15194, 3156, 698, 1305, 19512, 4168, 2265, 1964, 5082, 836, 23296, 
            2413, 1066, 2395, 45168, 8091, 2133, 3059, 51275, 10454, 1989, 1667, 50231, 11000, 6240, 2852, 
            31581, 6058, 5392, 1839, 50092, 8396, 1985, 8991, 33764, 5318, 1928, 26902, 5189, 2134, 47829, 
            10578, 2229, 10068, 60009, 23327, 7081, 12297, 45044, 15151, 2740, 3803, 46563, 16209, 9797, 5845, 
            44561, 8182, 12401, 2359, 45573, 12349, 2651, 9682, 43127, 15810, 5811, 9279, 43962, 14386, 2270, 
            2632, 39471, 11830, 6869, 4661, 30940, 5559, 6094, 1824, 40202, 7871, 2183, 6841, 26306, 4385, 1941, 
            32358, 10212, 3832, 5078, 38561, 14111, 4071, 2257, 42239, 16583, 2551, 3728, 49743, 16669, 7062, 
            3694, 18227, 4029, 1618, 1600, 25356, 4526, 1801, 40613, 10173, 1883, 7923, 40666, 11985, 4629, 7445, 
            46053, 13073, 1829, 2126, 42021, 11787, 8567, 4217, 32222, 6250, 5758, 2011, 48044, 9596, 2247, 10336, 
            33612, 4829, 1979, 45756, 15151, 4731, 5700, 42536, 13382, 4085, 2116, 51106, 19127, 1966, 4540, 36989, 
            11179, 5329, 4492, 28014, 4266, 2228, 1992, 30706, 4585, 1825, 45353, 9172, 2156, 7298, 32588, 5422, 
            2087, 23603, 5832, 2136, 54917, 14394, 3006, 9240, 39316, 6710, 1825, 50371, 16490, 6229, 8822, 59214, 
            21224, 6862, 2073, 32776, 1903, 52810, 17090, 6242, 9555, 52896, 21251, 6748, 2295, 62780, 28542, 2313, 
            6233, 41294, 16753, 8849, 6811, 81209, 32379, 19115, 11043, 50019, 12939, 4210, 2401, 57348, 21554, 
            9758, 9795, 56247, 20227, 7331, 4734, 63172, 28454, 2681, 10578, 51879, 15705, 10655, 8051, 41145, 
            12054, 4073, 2301, 56660, 22137, 10170, 9181, 47945, 16788, 7329, 5933, 37066, 19820, 2623, 6587, 
            12775, 7829, 74448];
        const H264_BP_720_480_10_3000000 = 
        [680, 126740, 23028, 17628, 34165, 50078, 53489, 50449, 51692, 51133, 49406, 61788, 57943, 19487, 39050, 
            51366, 58590, 46431, 47553, 44008, 40903, 43186, 46840, 41363, 38577, 36246, 47333, 37886, 36028, 
            32547, 34046, 42447, 29904, 31922, 32428, 33792, 35887, 29424, 29191, 32212, 28429, 39255, 26639, 
            46125, 29321, 25941, 36184, 29629, 31368, 32575, 27336, 42706, 33502, 29499, 31225, 30249, 40616, 
            34124, 35283, 33528, 36250, 38209, 35903, 34273, 38720, 39956, 47535, 38312, 38075, 34822, 38343, 
            51007, 38141, 40807, 41597, 42305, 48904, 38583, 42058, 41818, 43584, 53600, 45287, 41925, 84667, 
            43272, 50947, 51329, 42615, 55263, 44633, 59839, 48709, 52740, 44754, 51337, 47877, 49915, 40111, 
            37680, 25386];
        const H264_BP_720_480_30_2000000 = 
        [680, 49724, 1285, 1261, 1708, 1747, 2620, 2662, 1490, 1779, 2361, 3189, 4068, 2004, 906, 3253, 5253, 
            4275, 5281, 6861, 8592, 7656, 10797, 9571, 11650, 15580, 7380, 12554, 7993, 8004, 12172, 17409, 
            8588, 7552, 12740, 9769, 9501, 5744, 6334, 8456, 7815, 9238, 9193, 7411, 9530, 8489, 13051, 8510, 
            9198, 11093, 10317, 6356, 12730, 9230, 11289, 8106, 10540, 8782, 10877, 7584, 10706, 13111, 10250, 
            10543, 13859, 6702, 9674, 9418, 11851, 7675, 10324, 8274, 10460, 6414, 11198, 7486, 14728, 7472, 
            8481, 8262, 9580, 7510, 9418, 8441, 9051, 8178, 8906, 7224, 9435, 7386, 8289, 14392, 8568, 5416, 
            7530, 6513, 10988, 7935, 6047, 6952, 9597, 7051, 6756, 6254, 9586, 6145, 12074, 6462, 7193, 5281, 
            9665, 6277, 8296, 5740, 8345, 5904, 9326, 6029, 7547, 5725, 8113, 16515, 6141, 4945, 7807, 4278, 
            20449, 5011, 5539, 6759, 6707, 6500, 6322, 6935, 7172, 6970, 11064, 6268, 6409, 7461, 6162, 7159, 
            7184, 7211, 6803, 8987, 9551, 7912, 5032, 8016, 5218, 16041, 7563, 8061, 6689, 8839, 7014, 8217, 
            6664, 8307, 6154, 8126, 5474, 6795, 6740, 8027, 11368, 8868, 6207, 8343, 9793, 9689, 5711, 9753, 
            6156, 9720, 6010, 9767, 6680, 8312, 6426, 15208, 6078, 8184, 7522, 9259, 6684, 8617, 7536, 9989, 
            8981, 7948, 10001, 12890, 7360, 6745, 15933, 7280, 7910, 9347, 7600, 9639, 9134, 6721, 9088, 8114, 
            9831, 7774, 8513, 8648, 9059, 15029, 10979, 8706, 10016, 7460, 10915, 12219, 9660, 7793, 11334, 8018, 
            11665, 7278, 11586, 9058, 16880, 7223, 9440, 9107, 11077, 9344, 9383, 8555, 11157, 8415, 9976, 9098, 
            11488, 9006, 10534, 22505, 8890, 9126, 11692, 9655, 11609, 8359, 10764, 9269, 10429, 72196, 5123, 7357, 
            12030, 9882, 17039, 7044, 13383, 9575, 12643, 8266, 12365, 8596, 11837, 14485, 10228, 9531, 11412, 
            8195, 11795, 17081, 13839, 8466, 14967, 11254, 12838, 8544, 14473, 9963, 13612, 8580, 14640, 10393, 
            12139, 8665, 18055, 8449, 11454, 7941, 13955, 10724, 10074, 8741, 9950, 9508, 7961, 6732, 6925, 6344, 
            4010, 4664];
        const H264_BP_720_480_30_768000 = 
        [679, 24012, 438, 391, 520, 539, 689, 718, 475, 533, 657, 898, 1072, 668, 423, 514, 712, 879, 1250, 1706, 
            2620, 2480, 3922, 3336, 4092, 5666, 2934, 4643, 3587, 3285, 5005, 5732, 3112, 2701, 4596, 3333, 3211, 
            2030, 2159, 2591, 2459, 2981, 3000, 2343, 2940, 2811, 4875, 2882, 3460, 4231, 3988, 2636, 4753, 3482, 
            4578, 3051, 4091, 3497, 4109, 2987, 4145, 4737, 4048, 3943, 5325, 2591, 3631, 3377, 4414, 3076, 4151, 
            3234, 3676, 2499, 4222, 2547, 5258, 2929, 3159, 3028, 3700, 2979, 3456, 3219, 3348, 3151, 3539, 2753, 
            3511, 3010, 3211, 5316, 3637, 2234, 2955, 2566, 4239, 3261, 2364, 2795, 3936, 2919, 2699, 2625, 3824, 
            2281, 4868, 2599, 2993, 2087, 4001, 2523, 3360, 2197, 3408, 2272, 3739, 2423, 2871, 2269, 3023, 6413, 
            2863, 1839, 2812, 1853, 8341, 2240, 2453, 2606, 2736, 2536, 2576, 2686, 2664, 2588, 3946, 2681, 2467, 
            2654, 2463, 2734, 2822, 2656, 2618, 3509, 3668, 2991, 1972, 3093, 1996, 5495, 3447, 3320, 2681, 3466, 
            2565, 3449, 2516, 3108, 2191, 3335, 2203, 2608, 2370, 2967, 4195, 3429, 2405, 3295, 3669, 3909, 2189, 
            3790, 2563, 3711, 2355, 3885, 2493, 3004, 2375, 5746, 2367, 3156, 2912, 3823, 2519, 3251, 2768, 4080, 
            3354, 2974, 3500, 5067, 2947, 2663, 5328, 3321, 3001, 3663, 2865, 3783, 3525, 2530, 3536, 3129, 4080, 
            2906, 3327, 3325, 3463, 5093, 4389, 3257, 3975, 2801, 4020, 4622, 3750, 2885, 4318, 2920, 4509, 2675, 
            4512, 3333, 6607, 2841, 3760, 3454, 4273, 3588, 3777, 3264, 4352, 3100, 3978, 3449, 4367, 3266, 3707, 
            8386, 3680, 3443, 4691, 3708, 4481, 2777, 3951, 3540, 3899, 42203, 1407, 3017, 4043, 2997, 5491, 2550, 
            4857, 3142, 4463, 3081, 4083, 2731, 3937, 4763, 3590, 3293, 3972, 2917, 3971, 5633, 4970, 3350, 5260, 
            3999, 4581, 3386, 4779, 3462, 4743, 3379, 5042, 3641, 4177, 3326, 6202, 3249, 4218, 2917, 4868, 3915, 
            3813, 3443, 3700, 3353, 3119, 2587, 2638, 2157, 1606, 1572];
        const H264_MP_720_480_30_384000 = 
        [739, 13489, 299, 105, 269, 439, 288, 164, 157, 579, 305, 190, 212, 393, 311, 239, 213, 322, 147, 689, 
            308, 186, 185, 2657, 331, 294, 260, 4683, 342, 257, 339, 5843, 412, 351, 327, 3954, 480, 427, 321, 
            3595, 662, 445, 432, 3926, 653, 520, 416, 2951, 461, 5036, 850, 503, 523, 4673, 903, 559, 501, 4882, 
            977, 522, 581, 6158, 1129, 634, 617, 4693, 933, 598, 617, 4478, 944, 571, 609, 5104, 926, 520, 546, 
            3934, 941, 533, 559, 4243, 905, 575, 580, 4085, 916, 518, 508, 5300, 908, 513, 563, 4076, 874, 484, 
            469, 4152, 890, 467, 494, 3842, 861, 465, 504, 3748, 776, 469, 455, 2958, 432, 4066, 770, 454, 422, 
            4137, 816, 495, 446, 5667, 814, 525, 506, 6038, 888, 532, 448, 3501, 782, 472, 438, 3709, 901, 484, 
            470, 4257, 849, 552, 450, 3888, 928, 499, 457, 4742, 899, 506, 433, 3498, 876, 441, 422, 5571, 963, 
            541, 453, 4315, 831, 547, 426, 4093, 773, 525, 470, 4960, 852, 515, 446, 4933, 940, 511, 476, 4483, 
            890, 474, 478, 4539, 900, 507, 488, 5386, 878, 498, 483, 4650, 879, 531, 467, 5244, 961, 520, 508, 
            5511, 882, 611, 541, 5619, 829, 624, 528, 5490, 949, 553, 503, 5009, 954, 545, 541, 4856, 978, 568, 
            553, 6329, 1067, 663, 577, 5621, 969, 621, 503, 5643, 1093, 576, 547, 7022, 1170, 589, 578, 5031, 
            1084, 599, 541, 5343, 1149, 624, 606, 5230, 1209, 597, 604, 3500, 621, 6934, 1569, 650, 641, 5236, 
            1282, 656, 622, 3793, 602, 32774, 3475, 1077, 577, 696, 5238, 1493, 680, 658, 4734, 1343, 738, 638, 
            4983, 1273, 680, 621, 5450, 1210, 658, 642, 5555, 1345, 669, 658, 4918, 1322, 692, 632, 5199, 1396, 
            686, 600, 5294, 1266, 701, 621, 5074, 1477, 728, 656, 4218, 1260, 720, 641, 2575, 1265, 652, 650, 
            1203, 719];
        const H264_MP_720_480_30_192000 = 
        [739, 6283, 234, 71, 152, 264, 151, 111, 110, 301, 173, 121, 116, 208, 152, 111, 142, 183, 100, 348, 170, 
            89, 88, 868, 203, 169, 189, 1798, 203, 183, 179, 2721, 251, 183, 218, 2212, 307, 297, 250, 1943, 371, 
            335, 291, 1670, 421, 354, 282, 1345, 304, 2140, 458, 364, 300, 1976, 494, 400, 292, 2106, 542, 381, 
            375, 2702, 553, 459, 370, 2166, 518, 404, 412, 2091, 530, 391, 371, 2260, 537, 335, 319, 1798, 537, 
            357, 348, 1907, 521, 439, 350, 1892, 555, 407, 338, 2320, 489, 364, 351, 1880, 488, 350, 320, 1905, 
            520, 306, 300, 1740, 501, 326, 317, 1583, 462, 340, 282, 1318, 308, 1920, 443, 310, 273, 1914, 467, 
            306, 291, 2271, 430, 312, 282, 2332, 467, 314, 255, 1634, 499, 287, 247, 1802, 491, 304, 281, 1856, 
            506, 327, 282, 1855, 523, 341, 279, 2064, 481, 345, 293, 1590, 499, 287, 279, 2466, 542, 346, 274, 
            1990, 487, 345, 239, 1739, 471, 308, 272, 2023, 480, 322, 262, 2145, 480, 327, 304, 2069, 505, 333, 
            308, 2114, 598, 336, 288, 2224, 506, 370, 313, 2117, 487, 360, 296, 2271, 503, 362, 333, 2393, 569, 
            359, 316, 2509, 470, 384, 315, 2321, 541, 379, 337, 2269, 514, 376, 319, 2170, 573, 373, 361, 2700, 
            632, 456, 369, 2516, 527, 398, 325, 2546, 551, 392, 351, 2956, 614, 383, 345, 2256, 582, 365, 327, 
            2359, 597, 408, 368, 2327, 632, 394, 339, 1651, 343, 2955, 651, 462, 391, 2324, 646, 450, 360, 1619, 
            392, 18036, 1446, 540, 366, 434, 2109, 757, 454, 421, 2099, 773, 429, 362, 1903, 659, 437, 368, 2238, 
            682, 395, 385, 2287, 698, 430, 376, 2023, 696, 405, 365, 2033, 686, 441, 363, 2042, 670, 431, 373, 
            2239, 731, 404, 392, 1888, 682, 417, 395, 1345, 644, 409, 392, 648, 398];
        const H264_MP_720_480_30_128000 = 
        [739, 3759, 141, 53, 88, 193, 97, 97, 42, 217, 120, 53, 85, 156, 159, 103, 62, 137, 48, 274, 143, 81, 103, 
            541, 144, 141, 132, 1026, 160, 110, 134, 1746, 170, 164, 172, 1435, 221, 244, 181, 1335, 273, 267, 
            186, 1060, 315, 312, 221, 897, 263, 1298, 379, 280, 219, 1171, 356, 302, 200, 1365, 404, 309, 258, 
            1666, 442, 343, 276, 1393, 418, 274, 256, 1342, 424, 278, 267, 1291, 383, 288, 225, 1197, 408, 262, 
            270, 1205, 413, 309, 275, 1269, 417, 286, 263, 1378, 359, 291, 243, 1224, 350, 253, 208, 1243, 354, 
            244, 226, 1263, 402, 233, 223, 988, 318, 232, 169, 893, 216, 1158, 324, 221, 172, 1255, 303, 219, 192, 
            1415, 285, 232, 194, 1363, 312, 241, 162, 1066, 345, 211, 182, 1094, 373, 215, 198, 1231, 353, 238, 
            206, 1286, 363, 227, 221, 1322, 335, 265, 209, 944, 309, 200, 199, 1369, 318, 278, 191, 1210, 297, 234, 
            161, 1202, 298, 201, 184, 1255, 334, 251, 223, 1444, 371, 235, 249, 1261, 359, 256, 233, 1399, 384, 
            241, 237, 1287, 371, 260, 261, 1302, 346, 261, 232, 1366, 406, 274, 231, 1487, 396, 287, 235, 1387, 
            331, 277, 224, 1460, 353, 283, 221, 1298, 365, 262, 257, 1342, 408, 289, 247, 1510, 440, 331, 258, 
            1493, 371, 296, 256, 1517, 390, 286, 252, 1758, 393, 297, 230, 1411, 412, 264, 224, 1453, 437, 313, 
            299, 1524, 430, 287, 269, 1064, 261, 1805, 455, 325, 296, 1403, 451, 312, 269, 1026, 284, 11888, 975, 
            392, 270, 325, 1332, 482, 328, 301, 1248, 506, 298, 259, 1227, 445, 292, 264, 1289, 466, 330, 278, 
            1391, 419, 322, 289, 1275, 468, 321, 320, 1283, 505, 335, 300, 1281, 452, 336, 296, 1335, 517, 350, 
            314, 1139, 480, 317, 287, 882, 495, 316, 307, 495, 340];
        const H264_MP_720_480_30_64000 = 
        [738, 1462, 127, 49, 40, 128, 71, 40, 27, 138, 46, 25, 30, 166, 67, 38, 30, 130, 30, 166, 61, 31, 36, 201, 
            100, 35, 38, 308, 113, 76, 58, 456, 150, 107, 117, 606, 190, 138, 123, 724, 222, 180, 121, 637, 273, 
            168, 159, 493, 138, 585, 215, 190, 151, 567, 168, 202, 156, 586, 259, 186, 171, 645, 283, 202, 181, 
            660, 279, 196, 148, 646, 290, 165, 161, 621, 251, 177, 151, 563, 254, 171, 128, 579, 246, 150, 123, 
            543, 207, 144, 132, 599, 226, 130, 106, 534, 183, 118, 103, 604, 198, 109, 81, 664, 185, 117, 74, 480, 
            179, 118, 43, 407, 114, 535, 171, 95, 61, 565, 155, 80, 54, 620, 152, 88, 71, 651, 151, 124, 62, 585, 
            162, 74, 50, 561, 161, 107, 73, 625, 185, 131, 74, 633, 151, 117, 45, 594, 178, 135, 60, 525, 158, 108, 
            65, 716, 184, 118, 49, 630, 147, 103, 50, 531, 146, 82, 63, 588, 207, 132, 59, 660, 201, 104, 79, 617, 
            226, 130, 126, 614, 215, 97, 102, 656, 184, 131, 105, 646, 233, 133, 110, 633, 209, 141, 95, 684, 196, 
            152, 100, 683, 180, 118, 107, 655, 201, 137, 69, 546, 204, 135, 83, 687, 183, 146, 75, 692, 225, 179, 
            84, 686, 216, 133, 123, 651, 224, 161, 121, 791, 203, 149, 113, 618, 202, 136, 121, 608, 231, 153, 127, 
            656, 264, 161, 120, 528, 159, 763, 275, 173, 110, 686, 257, 180, 123, 486, 158, 5082, 460, 219, 173, 
            160, 626, 252, 169, 153, 624, 220, 174, 135, 636, 243, 153, 151, 659, 288, 168, 147, 657, 293, 179, 152, 
            650, 270, 174, 134, 649, 286, 178, 173, 609, 269, 192, 149, 635, 274, 177, 146, 570, 293, 173, 132, 513, 
            259, 172, 131, 306, 167];
            
    beforeAll(async function() {
        console.info('beforeAll case');
    })

    beforeEach(async function() {
        console.info('beforeEach case');
        await toDisplayPage().then(() => {
        }, failCallback).catch(failCatch);
        await msleep(1000).then(() => {
        }, failCallback).catch(failCatch);
        frameCountIn = 0;
        frameCountOut = 0;
        timestamp = 0;
        inputQueue = [];
        outputQueue = [];
        isCodecData = false;
        inputEosFlag = false;
        surfaceID = globalThis.value;
    })

    afterEach(async function() {
        console.info('afterEach case');
        if (videoDecodeProcessor != null) {
            await videoDecodeProcessor.release().then(() => {
                console.info('in case : videoDecodeProcessor release success');
            }, failCallback).catch(failCatch);
            videoDecodeProcessor = null;
        }
        await closeFileDescriptor(readPath);
        await router.clear();
    })

    afterAll(function() {
        console.info('afterAll case');
    })

    let failCallback = function(err) {
        console.info(`in case error failCallback called, errMessage is ${error.message}`);
        expect(err).assertUndefined();
    }
    let failCatch = function(err) {
        console.info(`in case error failCatch called,errMessage is ${error.message}`);
        expect(err).assertUndefined();
    }

    function msleep(ms) {
        return new Promise((resolve) => setTimeout(resolve, ms));
    }

    async function toDisplayPage() {
        let path = 'pages/display/display';
        let options = {
            uri: path,
        }
        try {
            await router.push(options);
        } catch (e) {
            console.error('in case toDisplayPage' + e);
        }
    }

    async function getFdRead(pathName, done) {
        await getFileDescriptor(pathName).then((res) => {
            if (res == undefined) {
                expect().assertFail();
                console.info('case error fileDescriptor undefined, open file fail');
                done();
            } else {
                fdRead = res.fd;
                console.info("case fdRead is: " + fdRead);
            }
        })
    }
    
    function readFile(path) {
        console.info('case read file start execution');
        try{
            console.info('case filepath: ' + path);
            readStreamSync = fileio.fdopenStreamSync(fdRead, 'rb');
        }catch(e) {
            console.info(e);
        }
    }

    function getContent(buf, len) {
        console.info("case start get content");
        console.info("case start get content length is: " + len);
        let lengthreal = -1;
        lengthreal = readStreamSync.readSync(buf,{length:len});
        console.info('case lengthreal is :' + lengthreal);
    }

    /* push inputbuffers into codec  */
    async function enqueueInputs(){
        console.info('in case: enqueueInputs in');
        while (inputQueue.length > 0 && !inputEosFlag) {
            let inputObject = inputQueue.shift(); 
            console.log('in case: inputObject.index: ' + inputObject.index);
            if (frameCountIn < ES_FRAME_SIZE.length) {
                getContent(inputObject.data, ES_FRAME_SIZE[frameCountIn]);
                inputObject.timeMs = timestamp;
                inputObject.offset = 0;
                inputObject.length = ES_FRAME_SIZE[frameCountIn];
                console.info('in case: frameCountIn ' + frameCountIn);
                frameCountIn++;
                timestamp += 16.67;
            }
            if (isCodecData) {
                inputObject.flags = 8;
                isCodecData = false;
                timestamp = 0;
            } else if (frameCountIn >= ES_FRAME_SIZE.length - 1) {
                inputObject.flags = 1;
                inputEosFlag = true;
            } else {
                inputObject.flags = 4;
            }
            videoDecodeProcessor.pushInputData(inputObject).then(() => {
                console.info('in case: pushInputData success ');
            }, failCallback).catch(failCatch);          
        }
    }

    /* get outputbuffers from codec  */
    async function dequeueOutputs(nextStep){
        console.log('outputQueue.length:' + outputQueue.length);
        while (outputQueue.length > 0){
            let outputObject = outputQueue.shift();
            if (outputObject.flags == 1) {
                nextStep();
                return;
            }
            frameCountOut++;
            await videoDecodeProcessor.freeOutputBuffer(outputObject).then(() => {
                console.log('in case: release output count:' + frameCountOut);
            }, failCallback).catch(failCatch);
        }
    }

    async function toGetVideoDecoderCaps() {
        await videoDecodeProcessor.getVideoDecoderCaps().then((videoCaps) => {
            console.info("case get getVideoDecoderCaps success");
            console.info(`print videoCaps: 
            codecInfo.name ${videoCaps.codecInfo.name}
            codecInfo.type ${videoCaps.codecInfo.type}
            codecInfo.mimeType ${videoCaps.codecInfo.mimeType}
            codecInfo.isHardwareAccelerated ${videoCaps.codecInfo.isHardwareAccelerated}
            codecInfo.isSoftwareOnly ${videoCaps.codecInfo.isSoftwareOnly}
            codecInfo.isVendor ${videoCaps.codecInfo.isVendor}
            supportedBitrate [${videoCaps.supportedBitrate.min},  ${videoCaps.supportedBitrate.max}]
            supportedFormats ${videoCaps.supportedFormats}
            supportedHeightAlignment ${videoCaps.supportedHeightAlignment}
            supportedWidthAlignment ${videoCaps.supportedWidthAlignment}
            supportedWidth [${videoCaps.supportedWidth.min},  ${videoCaps.supportedWidth.max}]
            supportedHeight [${videoCaps.supportedHeight.min},  ${videoCaps.supportedHeight.max}]
            supportedProfiles ${videoCaps.supportedProfiles}
            supportedLevels ${videoCaps.supportedLevels}
            supportedBitrateMode ${videoCaps.supportedBitrateMode}
            supportedQuality [${videoCaps.supportedQuality.min},  ${videoCaps.supportedQuality.max}]
            supportedComplexity [${videoCaps.supportedComplexity.min},  ${videoCaps.supportedComplexity.max}]
            `);
        }, failCallback).catch(failCatch);
    }

    function setCallback(nextStep){
        console.info('in case:  setCallback in');
        videoDecodeProcessor.on('needInputData', async (inBuffer) => {
            console.info('in case: needInputData inBuffer.index: '+ inBuffer.index);
            inputQueue.push(inBuffer);
            await enqueueInputs();
        });

        videoDecodeProcessor.on('newOutputData', async (outBuffer) => {
            console.info('in case: newOutputData outBuffer.index: '+ outBuffer.index);
            outputQueue.push(outBuffer);
            await dequeueOutputs(nextStep);
        });

        videoDecodeProcessor.on('error',(err) => {
            console.info('in case: error called,errName is' + err);
        });

        videoDecodeProcessor.on('streamChanged',(format) => {
            console.info('in case: Output format changed: ' + format.toString());
        });
        console.info('in case:  setCallback out');
    }

    eventEmitter.on('nextStep', async (done) => {
        console.info('in case : nextStep success');
        await videoDecodeProcessor.stop().then(() => {
            console.info('in case : stop success');
        }, failCallback).catch(failCatch);
        await videoDecodeProcessor.reset().then(() => {
            console.info('in case : reset success');
        }, failCallback).catch(failCatch);
        await videoDecodeProcessor.release().then(() => {
            console.info('in case : release success');
        }, failCallback).catch(failCatch);
        videoDecodeProcessor = null;
        console.info('in case : done');
        done();
    });

    function printfDescription(obj) {
        for (let item in obj) {
            let property = obj[item];
            console.info("AudioEncoder config is " + item + ":" + property);
        }
    }

    async function decoderSource(config, name, srcPath, done){
        let mediaDescription = config;
        console.info('start test case');
        readPath = srcPath;
        await getFdRead(readPath, done);
        await media.createVideoDecoderByName(name).then((processor) => {
            if (typeof (processor) != 'undefined') {
                videoDecodeProcessor = processor;
                console.info('in case : createVideoDecoderByName success');
            } else {
                console.info('in case : createVideoDecoderByName fail');
                expect().assertFail();
                done();
            }
        }, failCallback).catch(failCatch);
        
        await toGetVideoDecoderCaps();

        await videoDecodeProcessor.configure(mediaDescription).then(() =>{
            console.info('in case : configure success');
            readFile(srcPath);
        }, failCallback).catch(failCatch);

        await videoDecodeProcessor.setOutputSurface(surfaceID, true).then(() => {
            console.info('in case : setOutputSurface success. surfaceID ' + surfaceID);
        }, failCallback).catch(failCatch);

        setCallback(
            function(){eventEmitter.emit('nextStep', done);}
        );

        await videoDecodeProcessor.prepare().then(() => {
            console.info('in case : prepare success');
        }, failCallback).catch(failCatch);

        await videoDecodeProcessor.start().then(() => {
            console.info('in case : start success');
        }, failCallback).catch(failCatch);

        await videoDecodeProcessor.getOutputMediaDescription().then((mediaDescription) => {
            console.info("getOutputMediaDescription success");
            printfDescription(mediaDescription);
        },failCallback).catch(failCatch);
        
        videoDecodeProcessor.on('error',(err) => {
            console.info(`case error called,errName is ${err.name}`);
            console.info(`case error called,errCode is ${err.code}`);
            console.info(`case error called,errMessage is ${err.message}`);
            expect().assertFail();
            done();
        });
    }

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_DECODER_SOFTWARE_FORMAT_COMPATIBILITY_H264_PROMISE_01_0100
        * @tc.name      : 001.test h264 format-HP-resolution 720*480-frame rate 30FPS-bitrate 3000000bps
        * @tc.desc      : video decoder format compatibility test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */ 
    it('SUB_MEDIA_VIDEO_DECODER_SOFTWARE_FORMAT_COMPATIBILITY_H264_PROMISE_01_0100', 0, async function (done) {
        console.info("case test h264 format-HP-resolution 720*480-frame rate 30FPS-bitrate 3000000bps");
        ES_FRAME_SIZE = H264_HP_720_480_30_3000000;
        let name = "avdec_h264";
        isCodecData = true;
        let srcPath = 'H264_HP_720_480_30_3000000.h264';
        let mediaDescription = {
            "track_type": 1,
            "codec_mime": 'video/avc',
            "width": 720,
            "height": 480,
            "pixel_format": 3,
            "frame_rate": 30.00,
            "max_input_size": 150000,
            "codec_profile" : 4,
            "bitrate" : 3000000,
        }

        await decoderSource(mediaDescription, name, srcPath, done);
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_DECODER_SOFTWARE_FORMAT_COMPATIBILITY_H264_PROMISE_01_0200
        * @tc.name      : 001.test h264 format-HP-resolution 640*480-frame rate 30FPS-bitrate 3000000bps
        * @tc.desc      : video decoder format compatibility test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */ 
    it('SUB_MEDIA_VIDEO_DECODER_SOFTWARE_FORMAT_COMPATIBILITY_H264_PROMISE_01_0200', 0, async function (done) {
        console.info("case test h264 format-HP-resolution 640*480-frame rate 30FPS-bitrate 3000000bps");
        ES_FRAME_SIZE = H264_HP_640_480_30_3000000;
        let name = "avdec_h264";
        isCodecData = true;
        let srcPath = 'H264_HP_640_480_30_3000000.h264';
        let mediaDescription = {
            "track_type": 1,
            "codec_mime": 'video/avc',
            "width": 640,
            "height": 480,
            "pixel_format": 3,
            "frame_rate": 30.00,
            "max_input_size": 150000,
            "codec_profile" : 4,
            "bitrate" : 3000000,
        }

        await decoderSource(mediaDescription, name, srcPath, done);
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_DECODER_SOFTWARE_FORMAT_COMPATIBILITY_H264_PROMISE_01_0300
        * @tc.name      : 001.test h264 format-HP-resolution 352*288-frame rate 30FPS-bitrate 3000000bps
        * @tc.desc      : video decoder format compatibility test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */ 
    it('SUB_MEDIA_VIDEO_DECODER_SOFTWARE_FORMAT_COMPATIBILITY_H264_PROMISE_01_0300', 0, async function (done) {
        console.info("case test h264 format-HP-resolution 352*288-frame rate 30FPS-bitrate 3000000bps");
        ES_FRAME_SIZE = H264_HP_352_288_30_3000000;
        let name = "avdec_h264";
        isCodecData = true;
        let srcPath = 'H264_HP_352_288_30_3000000.h264';
        let mediaDescription = {
            "track_type": 1,
            "codec_mime": 'video/avc',
            "width": 352,
            "height": 288,
            "pixel_format": 3,
            "frame_rate": 30.00,
            "max_input_size": 150000,
            "codec_profile" : 4,
            "bitrate" : 3000000,
        }

        await decoderSource(mediaDescription, name, srcPath, done);
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_DECODER_SOFTWARE_FORMAT_COMPATIBILITY_H264_PROMISE_02_0100
        * @tc.name      : 001.test h264 format-HP-resolution 720*480-frame rate 25FPS-bitrate 3000000bps
        * @tc.desc      : video decoder format compatibility test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */ 
    it('SUB_MEDIA_VIDEO_DECODER_SOFTWARE_FORMAT_COMPATIBILITY_H264_PROMISE_02_0100', 0, async function (done) {
        console.info("case test h264 format-HP-resolution 720*480-frame rate 25FPS-bitrate 3000000bps");
        ES_FRAME_SIZE = H264_HP_720_480_25_3000000;
        let name = "avdec_h264";
        isCodecData = true;
        let srcPath = 'H264_HP_720_480_25_3000000.h264';
        let mediaDescription = {
            "track_type": 1,
            "codec_mime": 'video/avc',
            "width": 720,
            "height": 480,
            "pixel_format": 3,
            "frame_rate": 25.00,
            "max_input_size": 150000,
            "codec_profile" : 4,
            "bitrate" : 3000000,
        }

        await decoderSource(mediaDescription, name, srcPath, done);
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_DECODER_SOFTWARE_FORMAT_COMPATIBILITY_H264_PROMISE_02_0200
        * @tc.name      : 001.test h264 format-BP-resolution 720*480-frame rate 10FPS-bitrate 3000000bps
        * @tc.desc      : video decoder format compatibility test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */ 
    it('SUB_MEDIA_VIDEO_DECODER_SOFTWARE_FORMAT_COMPATIBILITY_H264_PROMISE_02_0200', 0, async function (done) {
        console.info("case test h264 format-BP-resolution 720*480-frame rate 10FPS-bitrate 3000000bps");
        ES_FRAME_SIZE = H264_BP_720_480_10_3000000;
        let name = "avdec_h264";
        isCodecData = true;
        let srcPath = 'H264_BP_720_480_10_3000000.h264';
        let mediaDescription = {
            "track_type": 1,
            "codec_mime": 'video/avc',
            "width": 720,
            "height": 480,
            "pixel_format": 3,
            "frame_rate": 10.00,
            "max_input_size": 150000,
            "codec_profile" : 0,
            "bitrate" : 3000000,
        }

        await decoderSource(mediaDescription, name, srcPath, done);
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_DECODER_SOFTWARE_FORMAT_COMPATIBILITY_H264_PROMISE_03_0100
        * @tc.name      : 001.test h264 format-BP-resolution 720*480-frame rate 30FPS-bitrate 2000000bps
        * @tc.desc      : video decoder format compatibility test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */ 
    it('SUB_MEDIA_VIDEO_DECODER_SOFTWARE_FORMAT_COMPATIBILITY_H264_PROMISE_03_0100', 0, async function (done) {
        console.info("case test h264 format-BP-resolution 720*480-frame rate 30FPS-bitrate 2000000bps");
        ES_FRAME_SIZE = H264_BP_720_480_30_2000000;
        let name = "avdec_h264";
        isCodecData = true;
        let srcPath = 'H264_BP_720_480_30_2000000.h264';
        let mediaDescription = {
            "track_type": 1,
            "codec_mime": 'video/avc',
            "width": 720,
            "height": 480,
            "pixel_format": 3,
            "frame_rate": 30.00,
            "max_input_size": 150000,
            "codec_profile" : 0,
            "bitrate" : 2000000,
        }

        await decoderSource(mediaDescription, name, srcPath, done);
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_DECODER_SOFTWARE_FORMAT_COMPATIBILITY_H264_PROMISE_03_0200
        * @tc.name      : 001.test h264 format-BP-resolution 720*480-frame rate 30FPS-bitrate 768000bps
        * @tc.desc      : video decoder format compatibility test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */ 
    it('SUB_MEDIA_VIDEO_DECODER_SOFTWARE_FORMAT_COMPATIBILITY_H264_PROMISE_03_0200', 0, async function (done) {
        console.info("case test h264 format-BP-resolution 720*480-frame rate 30FPS-bitrate 768000bps");
        ES_FRAME_SIZE = H264_BP_720_480_30_768000;
        let name = "avdec_h264";
        isCodecData = true;
        let srcPath = 'H264_BP_720_480_30_768000.h264';
        let mediaDescription = {
            "track_type": 1,
            "codec_mime": 'video/avc',
            "width": 720,
            "height": 480,
            "pixel_format": 3,
            "frame_rate": 30.00,
            "max_input_size": 150000,
            "codec_profile" : 0,
            "bitrate" : 768000,
        }

        await decoderSource(mediaDescription, name, srcPath, done);
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_DECODER_SOFTWARE_FORMAT_COMPATIBILITY_H264_PROMISE_03_0300
        * @tc.name      : 001.test h264 format-MP-resolution 720*480-frame rate 30FPS-bitrate 384000bps
        * @tc.desc      : video decoder format compatibility test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */ 
    it('SUB_MEDIA_VIDEO_DECODER_SOFTWARE_FORMAT_COMPATIBILITY_H264_PROMISE_03_0300', 0, async function (done) {
        console.info("case test h264 format-MP-resolution 720*480-frame rate 30FPS-bitrate 384000bps");
        ES_FRAME_SIZE = H264_MP_720_480_30_384000;
        let name = "avdec_h264";
        isCodecData = true;
        let srcPath = 'H264_MP_720_480_30_384000.h264';
        let mediaDescription = {
            "track_type": 1,
            "codec_mime": 'video/avc',
            "width": 720,
            "height": 480,
            "pixel_format": 3,
            "frame_rate": 30.00,
            "max_input_size": 150000,
            "codec_profile" : 8,
            "bitrate" : 384000,
        }

        await decoderSource(mediaDescription, name, srcPath, done);
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_DECODER_SOFTWARE_FORMAT_COMPATIBILITY_H264_PROMISE_03_0400
        * @tc.name      : 001.test h264 format-MP-resolution 720*480-frame rate 30FPS-bitrate 192000bps
        * @tc.desc      : video decoder format compatibility test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */ 
    it('SUB_MEDIA_VIDEO_DECODER_SOFTWARE_FORMAT_COMPATIBILITY_H264_PROMISE_03_0400', 0, async function (done) {
        console.info("case test h264 format-MP-resolution 720*480-frame rate 30FPS-bitrate 192000bps");
        ES_FRAME_SIZE = H264_MP_720_480_30_192000;
        let name = "avdec_h264";
        isCodecData = true;
        let srcPath = 'H264_MP_720_480_30_192000.h264';
        let mediaDescription = {
            "track_type": 1,
            "codec_mime": 'video/avc',
            "width": 720,
            "height": 480,
            "pixel_format": 3,
            "frame_rate": 30.00,
            "max_input_size": 150000,
            "codec_profile" : 8,
            "bitrate" : 192000,
        }

        await decoderSource(mediaDescription, name, srcPath, done);
    })

    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_DECODER_SOFTWARE_FORMAT_COMPATIBILITY_H264_PROMISE_03_0500
        * @tc.name      : 001.test h264 format-MP-resolution 720*480-frame rate 30FPS-bitrate 128000bps
        * @tc.desc      : video decoder format compatibility test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */ 
    it('SUB_MEDIA_VIDEO_DECODER_SOFTWARE_FORMAT_COMPATIBILITY_H264_PROMISE_03_0500', 0, async function (done) {
        console.info("case test h264 format-MP-resolution 720*480-frame rate 30FPS-bitrate 128000bps");
        ES_FRAME_SIZE = H264_MP_720_480_30_128000;
        let name = "avdec_h264";
        isCodecData = true;
        let srcPath = 'H264_MP_720_480_30_128000.h264';
        let mediaDescription = {
            "track_type": 1,
            "codec_mime": 'video/avc',
            "width": 720,
            "height": 480,
            "pixel_format": 3,
            "frame_rate": 30.00,
            "max_input_size": 150000,
            "codec_profile" : 8,
            "bitrate" : 128000,
        }

        await decoderSource(mediaDescription, name, srcPath, done);
    })
    
    /* *
        * @tc.number    : SUB_MEDIA_VIDEO_DECODER_SOFTWARE_FORMAT_COMPATIBILITY_H264_PROMISE_03_0600
        * @tc.name      : 001.test h264 format-MP-resolution 720*480-frame rate 30FPS-bitrate 64000bps
        * @tc.desc      : video decoder format compatibility test
        * @tc.size      : MediumTest
        * @tc.type      : Function test
        * @tc.level     : Level0
    */ 
    it('SUB_MEDIA_VIDEO_DECODER_SOFTWARE_FORMAT_COMPATIBILITY_H264_PROMISE_03_0600', 0, async function (done) {
        console.info("case test h264 format-MP-resolution 720*480-frame rate 30FPS-bitrate 64000bps");
        ES_FRAME_SIZE = H264_MP_720_480_30_64000;
        let name = "avdec_h264";
        isCodecData = true;
        let srcPath = 'H264_MP_720_480_30_64000.h264';
        let mediaDescription = {
            "track_type": 1,
            "codec_mime": 'video/avc',
            "width": 720,
            "height": 480,
            "pixel_format": 3,
            "frame_rate": 30.00,
            "max_input_size": 150000,
            "codec_profile" : 8,
            "bitrate" : 64000,
        }

        await decoderSource(mediaDescription, name, srcPath, done);
    })

})
    
