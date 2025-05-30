/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType} from "@ohos/hypium";
import { Decimal } from '@kit.ArkTS';
type Rounding = 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8;
function test_tan_001 (n: string, pr: number, rm: Rounding, expected: string) {
    Decimal.set({ precision: pr, rounding: rm });
    expect(expected).assertEqual(Decimal.tan(n).valueOf());
}
export default function DecimalTest022() {
  describe("DecimalTest022", () => {
    beforeAll(() => {
        console.info("beforeAll: Prerequisites at the test suite level, which are executed before the test suite is executed.");
    });
    beforeEach(() => {
        console.info("beforeEach: Prerequisites at the test case level, which are executed before each test case is executed.");
    });
    afterEach(() => {
        console.info("afterEach: Test case-level clearance conditions, which are executed after each test case is executed.");
    });
    afterAll(() => {
        console.info("afterAll: Test suite-level cleanup condition, which is executed after the test suite is executed");
    });
        console.info("start################################start");
    /**
     * @tc.number    : DECIMAL_TEST_001
     * @tc.name      : Decimal_tan_Func_001
     * @tc.desc      : Test tan
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("Decimal_tan_Func_001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        Decimal.set ({
            precision: 40,
            rounding: 4,
            toExpNeg: -9e15,
            toExpPos: 9e15,
            minE: -9e15,
            maxE: 9e15
        });
        test_tan_001('NaN', 40, 4, 'NaN');
        test_tan_001('0', 20, 4, '0');
        test_tan_001('-0', 20, 4, '-0');
        test_tan_001('Infinity', 40, 4, 'NaN');
        test_tan_001('-Infinity', 40, 4, 'NaN');
        test_tan_001('3', 5, 5, '-0.14255');
        test_tan_001('0.8', 7, 6, '1.029639');
        test_tan_001('539998661123466984649191689138494900416386817996524', 7, 6, '32.04695');
        test_tan_001('0.5172293543584894071801901902', 5, 1, '0.56888');
        test_tan_001('5', 10, 5, '-3.380515006');
        test_tan_001('0.5283979979897015', 1, 4, '0.6');
        test_tan_001('0.032294', 4, 5, '0.03231');
        test_tan_001('6339441327243052114957865586706124503.386166832963015135918043343179', 7, 0, '-0.06666567');
        test_tan_001('0.9483926380646355642560348839879277', 4, 6, '1.394');
        test_tan_001('0.4989999', 7, 6, '0.5450046');
        test_tan_001('80', 8, 6, '9.0036549');
        test_tan_001('9', 2, 0, '-0.46');
        test_tan_001('710.0571640039', 2, 2, '0.058');
        test_tan_001('2485', 2, 0, '0.00022');
        test_tan_001('1', 8, 1, '1.5574077');
        test_tan_001('1683930704126586032365374681825182443446390958574678366195884605194996193', 6, 1, '-0.540063');
        test_tan_001('4', 7, 2, '1.157822');
        test_tan_001('488888888888999.88888888406189896488888888888', 9, 0, '5.10971582');
        test_tan_001('0.76322415', 7, 0, '0.9566071');
        test_tan_001('0.005', 4, 2, '0.005001');
        test_tan_001('0.313', 9, 6, '0.323638526');
        test_tan_001('9798000000100000070000000000010007300', 5, 0, '1.1308');
        test_tan_001('0.0000002', 2, 0, '0.00000021');
        test_tan_001('7.9548', 4, 1, '-9.885');
        test_tan_001('7', 5, 1, '0.87144');
        test_tan_001('50080000', 10, 3, '0.3252122977');
        test_tan_001('1687619439340503284670339680.931590414877', 6, 6, '-4.69126');
        test_tan_001('60970535.5', 3, 1, '0.804');
        test_tan_001('0.17', 3, 2, '0.172');
        test_tan_001('0.5', 5, 6, '0.5463');
        test_tan_001('976.8', 2, 0, '-0.24');
        test_tan_001('5957.69', 6, 0, '2.82277');
        test_tan_001('3859393443331162786655368.87986161531415848272022672234461227844', 3, 6, '0.47');
        test_tan_001('0.5', 1, 5, '0.5');
        test_tan_001('468455006548968895675682202443647176252098177665257898933', 5, 5, '-1.4111');
        test_tan_001('26588816756666', 1, 2, '0.07');
        test_tan_001('0.239424045403994683949187909216', 5, 2, '0.24411');
        test_tan_001('810209.109', 6, 6, '-4.52238');
        test_tan_001('799063368.11558288974072', 1, 2, '-0.9');
        test_tan_001('72.3640503', 7, 2, '0.1078344');
        test_tan_001('843003462755848631687717888604', 5, 5, '-1.1699');
        test_tan_001('90706.61', 3, 2, '-0.676');
        test_tan_001('0.1', 7, 5, '0.1003347');
        test_tan_001('29555.88888888888885555555', 9, 5, '-0.218161582');
        test_tan_001('3079999999999999999999.999949999999999999999999999999999999999999999', 2, 5, '1.6');
        test_tan_001('6', 3, 4, '-0.291');
        test_tan_001('9.648589238187519', 7, 0, '0.2276248');
        test_tan_001('590.89', 7, 1, '0.2773838');
        test_tan_001('807876335', 9, 2, '0.965588602');
        test_tan_001('32099561.989', 8, 4, '-0.24584079');
        test_tan_001('7743398777777777777777733.77', 3, 2, '-0.526');
        test_tan_001('45.52', 5, 2, '30.207');
        test_tan_001('399999999999999999999999999999999999999999999999909999999999.99999999999999', 4, 4, '1.742');
        test_tan_001('32400', 3, 2, '0.941');
        test_tan_001('4152914444444444444444444544444444444444444444444444444.944444444440444442444494444444444', 9, 0, '-0.101470716');
        test_tan_001('90000000000508319.117628510842726222', 5, 0, '5.1435');
        test_tan_001('0.0074072', 8, 3, '0.0074073354');
        test_tan_001('0.413272', 4, 5, '0.4385');
        test_tan_001('0.8633', 10, 3, '1.169338115');
        test_tan_001('33333333333333333333333333333.33333333333333333333', 8, 2, '0.5813679');
        test_tan_001('562', 10, 0, '-0.3594685138');
        test_tan_001('6433373233.39333336638333334', 5, 4, '-1.383');
        test_tan_001('233333333331549444444444.09076555555555555', 10, 4, '-5.305366526');
        test_tan_001('40', 9, 2, '-1.11721493');
        test_tan_001('906287052558597992196230844623', 10, 1, '0.3528425701');
        test_tan_001('900000', 4, 6, '-0.3334');
        test_tan_001('57777777777.88888888887777777428970596211366', 13, 1, '4.620958871418');
        test_tan_001('33109173612614237', 15, 1, '0.697054002938309');
        test_tan_001('446571', 8, 4, '-0.11299979');
        test_tan_001('55.33', 25, 1, '-2.721513818553435443556001');
        test_tan_001('0.6874', 3, 4, '0.821');
        test_tan_001('97415551555.55555655655655554555555855555', 38, 6, '0.63497857004739965579501336949790595112');
        test_tan_001('3052744161971196989887333333333333333', 15, 0, '2.3893665412711');
        test_tan_001('20083.4596122', 37, 0, '-0.9171727446291034528773430723329592848');
        test_tan_001('9200', 30, 3, '6.43843719089952501300840146253');
        test_tan_001('1', 23, 0, '1.557407724654902230507');
        test_tan_001('78887888588.8', 15, 5, '-0.0613791279629461');
        test_tan_001('1147231', 8, 4, '-0.097582634');
        test_tan_001('0.000553763344', 27, 4, '0.000553763400604559119913346525');
        test_tan_001('68', 24, 1, '-2.04008159801594615389349');
        test_tan_001('49999999999999999999999999999999999999999999999999999999.399999999999999999992702', 15, 2, '-4.12257063808152');
        test_tan_001('49999999999999999999999999999999999999999999999999999.99999999999999999999999999999', 38, 6, '-0.41507238166911582158673379470559517419');
        test_tan_001('0.00000391163258651029507727', 31, 2, '0.000003911632586530245537172208314767');
        test_tan_001('0.17183171313', 36, 4, '0.173543103883274147884533120728007237');
        test_tan_001('861646.5732966967557082', 34, 2, '-2.464947656728891301675656852697406');
        test_tan_001('47777777777777777.410171', 105, 5, '-13.74058038972407219477409398839850580956304359987902889186211451339313466403485175336849944968942741891');
        test_tan_001('0.390071731702448005162815294909486174474947036240529240590971978418532990165699316733956931596883519677657915509998387416505531185920438999174869181240110048120035540672577', 63, 1, '0.411138769556421473902517663320961167226706740351370710111315144');
        test_tan_001('23174769554', 70, 3, '0.2212756420749658903960662285747816321880538429001022336777294070264195');
        test_tan_001('0.5592', 74, 1, '0.625835640923790139625307834841776614566589496394316390500913130105766275');
        test_tan_001('6661489439437775791.114329793186996632507954406585491', 17, 5, '-1.5847845023422794');
        test_tan_001('4391137181720764819571909798888888888888888888', 86, 1, '-0.8685635418477878118403689813703497084174127945629019783498553011616589497613259649227');
        test_tan_001('300000000000000000000000000000000000000000000000000000000000000000000000000200000000400300000000000000000000000000000.0000000000000000000000000000000000000000000000000003', 122, 3, '-1.5903229154055637520787252214804110216069360069379104488574199058901135519171083962076619886567087892277814852998414939069');
        test_tan_001('6587685840713754402278094276205491723366077405819490595067025408026873250375623638673063957701601231', 107, 3, '0.88106648906135934944047838538886082156746682725824571546159607795133625640190620741982638843180493222615294');
        test_tan_001('0.524217411165998018391262237830297491516856805040463896080592290487405064611025001607311512479709354535407130581948832593516281243820812174844723190311545869854968531247730387537943969800839367585396013641826800875467649274673709974876292276089324234102809573076731030535244688816', 76, 3, '0.5781754114340578960371795632804762026798421163023137415437904934165060267084');
        test_tan_001('323646192595.4845', 127, 6, '-0.3747612268270038347175054875779625030989108207803221587812055629899198693615407534041949990189331417585285760850333254670480789');
        expect(true).assertEqual(true);    });
    /**
     * @tc.number    : DECIMAL_TEST_002
     * @tc.name      : Decimal_tan_Func_002
     * @tc.desc      : Test tan
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("Decimal_tan_Func_002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
        Decimal.set ({
            precision: 40,
            rounding: 4,
            toExpNeg: -9e15,
            toExpPos: 9e15,
            minE: -9e15,
            maxE: 9e15
        });
        try {
            test_tan_001('e', 40, 4, 'NaN');
            expect(true).assertEqual(false);
        } catch (err) {
            expect(err.name).assertEqual(`BusinessError`);
            expect(err.code).assertEqual(401);
            expect(err.message).assertEqual(`The type of "test(str)" must be Hex/Binary/Octal. Received value is: e`);
        }
    });
  });
}