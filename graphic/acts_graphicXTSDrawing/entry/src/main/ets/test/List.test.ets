/*
 * Copyright (c) 2024 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
import samplingOptionsTest from './SamplingOptions.test';
import maskFilterTest from './MaskFilter.test';
import pathEffectTest from './PathEffect.test';
import shadowLayerTest from './ShadowLayer.test';
import colorFilterTest from './ColorFilter.test';
import penTest from './Pen.test';
import brushTest from './Brush.test';
import fontTest from './Font.test';
import typefaceTest from './Typeface.test';
import textBlobTest from './TextBlob.test';
import drawingTsPathTest from './Path.test';
import drawingTsCanvasTest from './Canvas.test';
import drawingTsCanvasPart2Test from './CanvasPart2.test';
import drawingTsCanvasPart3Test from './CanvasPart3.test';

export default function testsuite() {
  samplingOptionsTest();
  maskFilterTest();
  pathEffectTest();
  shadowLayerTest();
  colorFilterTest();
  penTest();
  brushTest();
  fontTest();
  typefaceTest();
  textBlobTest();
  drawingTsPathTest();
  drawingTsCanvasTest();
  drawingTsCanvasPart2Test();
  drawingTsCanvasPart3Test();
}