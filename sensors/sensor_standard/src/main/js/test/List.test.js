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
import SystemParameterTest from './SensorOnOffTest.test.js'
import SensorJsTest_sensor_2 from './SensorGeomagneticTest.test.js'
import SensorJsTest_sensor_1 from './SensorGeneralalgorithm.test.js'
import SensorJsTest_sensor_60 from './SensorOnOffTest.test_newSensorGeomagnetic.js'
import SensorJsTest_sensor_35 from './SensorOnOffTest.test_newGetSensorList.js'
import SensorJsTest_sensor_36 from './SensorOnOffTest.test_newGetSingleSensor.js'
import SensorJsTest_sensor_3 from './SensorOnOffTest.test_oldAccelerometer.js'
import SensorJsTest_sensor_25 from './Subscribe_subscribeAccelerometer.js'
import SensorJsTest_sensor_39 from './SensorOnOffTest.test_newAccelerometer.js'
import SensorJsTest_sensor_43 from './SensorOnOffTest.test_newGyroScope.js'
import SensorJsTest_sensor_5 from './SensorOnOffTest.test_oldGyroScope.js'
import SensorJsTest_sensor_29 from './Subscribe_subscribeGyroscope.js'
import SensorJsTest_sensor_41 from './SensorOnOffTest.test_newAmbient_Light.js'
import SensorJsTest_sensor_4 from './SensorOnOffTest.test_oldAmbient_light.js'
import SensorJsTest_sensor_31 from './Subscribe_subscribeLight.js'
import SensorJsTest_sensor_42 from './SensorOnOffTest.test_newGravity.js'
import SensorJsTest_sensor_9 from './SensorOnOffTest.test_oldGravity.js'
import SensorJsTest_sensor_37 from './SensorOnOffTest.test_newMagneticField.js'
import SensorJsTest_sensor_15 from './SensorOnOffTest.test_oldMagneticField.js'
import SensorJsTest_sensor_49 from './SensorOnOffTest.test_newRotatingVector.js'
import SensorJsTest_sensor_20 from './SensorOnOffTest.test_oldRotatingVector.js'
import SensorJsTest_sensor_45 from './SensorOnOffTest.test_newHall.js'
import SensorJsTest_sensor_7 from './SensorOnOffTest.test_oldHall.js'
import SensorJsTest_sensor_48 from './SensorOnOffTest.test_newOrientating.js'
import SensorJsTest_sensor_16 from './SensorOnOffTest.test_oldOrientating.js'
import SensorJsTest_sensor_27 from './Subscribe_subscribeDeviceOrientation.js'
import SensorJsTest_sensor_53 from './SensorOnOffTest.test_newBarometer.js'
import SensorJsTest_sensor_8 from './SensorOnOffTest.test_oldBarometer.js'
import SensorJsTest_sensor_26 from './Subscribe_subscribeBarometer.js'


export default function testsuite() {
		SystemParameterTest()
		SensorJsTest_sensor_2()
		SensorJsTest_sensor_1()
		SensorJsTest_sensor_60()
		SensorJsTest_sensor_35()
		SensorJsTest_sensor_36()
		SensorJsTest_sensor_3()
		SensorJsTest_sensor_25()
		SensorJsTest_sensor_39()
		SensorJsTest_sensor_43()
		SensorJsTest_sensor_5()
		SensorJsTest_sensor_29()
		SensorJsTest_sensor_41()
		SensorJsTest_sensor_4()
		SensorJsTest_sensor_31()
		SensorJsTest_sensor_42()
		SensorJsTest_sensor_9()			
		SensorJsTest_sensor_37()
		SensorJsTest_sensor_15()
		SensorJsTest_sensor_49()
		SensorJsTest_sensor_20()
		SensorJsTest_sensor_45()
		SensorJsTest_sensor_7()
		SensorJsTest_sensor_48()
		SensorJsTest_sensor_16()
		SensorJsTest_sensor_27()
		SensorJsTest_sensor_53()
		SensorJsTest_sensor_8()
		SensorJsTest_sensor_26()
}                    
