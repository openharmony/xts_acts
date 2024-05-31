/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the License);
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an AS IS BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { Vec4, Aabb, SceneResourceType, SceneResource, Shader, MaterialType, Material, ShaderMaterial, SubMesh, Mesh,
  Animation, EnvironmentBackgroundType, Environment, Node, Geometry, SceneResourceFactory, Scene } from '@ohos.graphics.scene'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import * as scene3d from '@ohos.graphics.scene'

export default function sceneResourcesTest() {
  describe('sceneResourcesTest', function () {
    let scene0: Scene | null = null;
    let scene1: Scene | null = null;
    let scene2: Scene | null = null;
    let env: Environment;
    let anim: Animation;
    let envImage1: scene3d.Image | null = null;
    let envImage2: scene3d.Image | null = null;
    let envImage3: scene3d.Image | null = null;
    let radianceImage: scene3d.Image | null = null;
    let rf: SceneResourceFactory;
    let rf1: SceneResourceFactory;
    let material: ShaderMaterial | null = null;
    let shader: Shader | null = null;
    let geom: Geometry | null = null;
    let node: Node;
    beforeAll(async function () {
      scene0 = await Scene.load($rawfile("gltf/BrainStem/glTF/BrainStem.gltf"));
      scene1 = await Scene.load($rawfile("gltf/DamagedHelmet/glTF/DamagedHelmet.gltf"));
      scene2 = await Scene.load($rawfile("gltf/Cube/glTF/Cube.gltf"));
      rf = scene1?.getResourceFactory();
      rf1 = scene2?.getResourceFactory();
      env = scene1?.environment;
      envImage1 = await rf.createImage({ name: "envImage1", uri: $rawfile("gltf/Cube/glTF/Cube_BaseColor.png")});
      envImage2 = await rf.createImage({ name: "envImage2", uri: $rawfile("gltf/Environment/glTF/images/quarry_02_2k_skybox.ktx")});
      envImage3 = await rf.createImage({ name: "envImage3", uri: $rawfile("gltf/DamagedHelmet/glTF/Default_albedo.jpg")});
      radianceImage = await rf.createImage({ name: "radianceImage", uri: $rawfile("gltf/Environment/glTF/images/quarry_02_2k_radiance.ktx")});
      material = await rf1.createMaterial({ name: "CustomMaterial" }, MaterialType.SHADER);
      shader = await rf1.createShader({ name: "CustomShader", uri: $rawfile("shaders/custom_shader/custom_material_sample.shader")});
      node = await rf.createNode({ name: "createNode" });
      geom = scene2?.getNodeByPath("rootNode_/Unnamed Node 1/Cube") as Geometry;
      anim = scene0?.animations[0];
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0320
     * @tc.name      : testAnimationStart
     * @tc.desc      : Used to play animation
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testAnimationStart', 0, async function (done) {
      let msg = "============================testAnimationStart";
      console.info(msg + ' begin ');
      try {
        let startFlag = false;
        anim.onStarted(() => {
          console.info(msg + " Succeed in anim.start() ");
          startFlag = true;
        })
        anim.start();
        anim.progress;
        await sleep(200);
        expect(startFlag).assertTrue();
        done();
      } catch (err) {
        console.info(msg + " Failed in anim.start()  " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0330
     * @tc.name      : testAnimationPause
     * @tc.desc      : Used to pause animation
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testAnimationPause', 0, function (done) {
      let msg = "============================testAnimationPause";
      console.info(msg + ' begin ');
      try {
        anim.pause();
        console.info(msg + " Succeed in anim.pause() ");
        expect(anim.running).assertFalse();
        done();
      } catch (err) {
        console.info(msg + " Failed in anim.pause() " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0340
     * @tc.name      : testAnimationSeek
     * @tc.desc      : Used to set he starting position for playing the animation
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testAnimationSeek', 0, function (done) {
      let msg = "============================testAnimationSeek";
      console.info(msg + ' begin ');
      try {
        anim.seek(0.3);
        console.info(msg + " Succeed in anim.seek(0.3) ");
        done();
      } catch (err) {
        console.info(msg + " Failed in anim.seek(0.3) " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0350
     * @tc.name      : testAnimationRestart
     * @tc.desc      : Used to add restart animation
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testAnimationRestart', 0, function (done) {
      let msg = "============================testAnimationRestart";
      console.info(msg + ' begin ');
      try {
        anim.restart();
        console.info(msg + " Succeed in anim.restart() ");
        expect(true).assertTrue();
        done();
      } catch (err) {
        console.info(msg + " Failed in anim.restart() " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0360
     * @tc.name      : testAnimationStop
     * @tc.desc      : Used to stop animation
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testAnimationStop', 0, function (done) {
      let msg = "============================testAnimationStop";
      console.info(msg + ' begin ');
      try {
        anim.stop();
        console.info(msg + " Succeed in anim.stop() ");
        expect(anim.running).assertFalse();
        done();
      } catch (err) {
        console.info(msg + " Failed in anim.stop() " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0370
     * @tc.name      : testAnimationFinished
     * @tc.desc      : Used to the callback function that is executed at the end of the animation playback
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testAnimationFinished', 0, async function (done) {
      let msg = "============================testAnimationFinished";
      console.info(msg + ' begin ');
      try {
        let finishFlag = false;
        anim.onFinished(() => {
          console.info(msg + " Succeed in anim.finish() ");
          finishFlag = true;
        })
        anim.finish();
        await sleep(200);
        expect(finishFlag).assertTrue();
        done();
      } catch (err) {
        console.info(msg + " Failed in anim.finish()  " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0380
     *
     * @tc.name      : testAnimationDuration
     * @tc.desc      : Used to get length of animation
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testAnimationDuration', 0, function (done) {
      let msg = "============================testAnimationDuration";
      console.info(msg + ' begin ');
      try {
        let duration = anim.duration;
        console.info(msg + " Succeed in anim.duration ");
        expect(duration != 0).assertTrue();
        done();
      } catch (err) {
        console.info(msg + " Failed in anim.duration " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0390
     * @tc.name      : testAnimationEnabled
     * @tc.desc      : Used to set weather the animation is enable
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testAnimationEnabled', 0, function (done) {
      let msg = "============================testAnimationEnabled";
      console.info(msg + ' begin ');
      try {
        anim.start();
        expect(anim.running).assertTrue();
        anim.enabled = false;
        console.info(msg + " Succeed in anim.enabled = false ");
        expect(anim.running).assertFalse();
        done();
      } catch (err) {
        console.info(msg + " Failed in anim.enabled = false " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0400
     * @tc.name      : testEnvironmentIndirectDiffuseFactor
     * @tc.desc      : Used to set environment indirectDiffuseFactor
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testEnvironmentIndirectDiffuseFactor', 0, async function (done) {
      let msg = "============================testEnvironmentIndirectDiffuseFactor";
      console.info(msg + ' begin ');
      try {
        let vec4: Vec4 = {x:1, y:40, z:1, w:1}
        env.indirectDiffuseFactor = vec4;
        console.info(msg + " Succeed in env.indirectDiffuseFactor ");
        expect(env.indirectDiffuseFactor.y).assertEqual(40);
        let env1 = await rf.createEnvironment({ "name" : "Env"});
        expect(env1 != null).assertTrue();
        done();
      } catch (err) {
        console.info(msg + " Failed in env.indirectDiffuseFactor " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0410
     * @tc.name      : testEnvironmentIndirectSpecularFactor
     * @tc.desc      : Used to set environment indirectSpecularFactor
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testEnvironmentIndirectSpecularFactor', 0, function (done) {
      let msg = "============================testEnvironmentIndirectSpecularFactor";
      console.info(msg + ' begin ');
      try {
        let vec4: Vec4 = {x:1, y:40, z:1, w:1}
        env.indirectSpecularFactor = vec4;
        console.info(msg + " Succeed in env.indirectSpecularFactor ");
        expect(env.indirectSpecularFactor.y).assertEqual(40);
        done();
      } catch (err) {
        console.info(msg + " Failed in env.indirectSpecularFactor " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0420
     * @tc.name      : testEnvironmentMapFactor
     * @tc.desc      : Used to set environment environmentMapFactor
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testEnvironmentMapFactor', 0, function (done) {
      let msg = "============================testEnvironmentMapFactor";
      console.info(msg + ' begin ');
      try {
        let vec4: Vec4 = {x:1, y:40, z:1, w:1}
        env.environmentMapFactor = vec4;
        console.info(msg + " Succeed in env.environmentMapFactor ");
        expect(env.environmentMapFactor.y).assertEqual(40);
        done();
      } catch (err) {
        console.info(msg + " Failed in env.environmentMapFactor " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0430
     * @tc.name      : testEnvironmentImage
     * @tc.desc      : Used to set environment environmentImage
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testEnvironmentImage', 0, function (done) {
      let msg = "============================testEnvironmentImage";
      console.info(msg + ' begin ');
      try {
        env.backgroundType = EnvironmentBackgroundType.BACKGROUND_NONE;
        console.info(msg + " Succeed in Environment environmentImage set NONE ");
        env.backgroundType = EnvironmentBackgroundType.BACKGROUND_IMAGE;
        env.environmentImage = envImage1;
        console.info(msg + " Succeed in Environment environmentImage set envImage1 IMAGE ");
        env.backgroundType = EnvironmentBackgroundType.BACKGROUND_CUBEMAP;
        env.environmentImage = envImage2;
        console.info(msg + " Succeed in Environment environmentImage set envImage2 CUBEMAP ");
        env.backgroundType = EnvironmentBackgroundType.BACKGROUND_EQUIRECTANGULAR;
        env.environmentImage = envImage3;
        console.info(msg + " Succeed in Environment environmentImage set envImage3 EQUIRECTANGULAR ");
        done();
      } catch (err) {
        console.info(msg + " Failed in Environment environmentImage set " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0440
     * @tc.name      : testRadianceImage
     * @tc.desc      : Used to set environment radianceImage
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testRadianceImage', 0, function (done) {
      let msg = "============================testRadianceImage";
      console.info(msg + ' begin ');
      try {
        env.radianceImage = null;
        console.info(msg + " Succeed in Environment radianceImage set null ");
        env.radianceImage = radianceImage;
        console.info(msg + " Succeed in Environment radianceImage set radianceImage ");
        radianceImage?.width;
        radianceImage?.height;
        done();
      } catch (err) {
        console.info(msg + " Failed in Environment radianceImage set " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0450
     * @tc.name      : testEnvironmentIrradianceCoefficients
     * @tc.desc      : Used to set environment irradianceCoefficients
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testEnvironmentIrradianceCoefficients', 0, function (done) {
      let msg = "============================testEnvironmentIrradianceCoefficients";
      console.info(msg + ' begin ');
      try {
        env.irradianceCoefficients =
          [{ x: GenRandom(), y: GenRandom(), z: GenRandom() },
            { x: GenRandom(), y: GenRandom(), z: GenRandom() },
            { x: GenRandom(), y: GenRandom(), z: GenRandom() },
            { x: GenRandom(), y: GenRandom(), z: GenRandom() },
            { x: GenRandom(), y: GenRandom(), z: GenRandom() },
            { x: GenRandom(), y: GenRandom(), z: GenRandom() },
            { x: GenRandom(), y: GenRandom(), z: GenRandom() },
            { x: GenRandom(), y: GenRandom(), z: GenRandom() },
            { x: GenRandom(), y: GenRandom(), z: GenRandom() }];
        console.info(msg + " Succeed in env.irradianceCoefficients ");
        done();
      } catch (err) {
        console.info(msg + " Failed in env.irradianceCoefficients " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0460
     * @tc.name      : testMesh
     * @tc.desc      : Used to get mesh of geometry
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testMesh', 0, function (done) {
      let msg = "============================testMesh";
      console.info(msg + ' begin ');
      try {
        let mesh: Mesh;
        let subMeshes: SubMesh[];
        let aabb: Aabb;
        let materialOrg: Material;
        if (geom) {
          mesh = geom.mesh;
          subMeshes = mesh.subMeshes;
          aabb = mesh.aabb;
          aabb.aabbMin;
          aabb.aabbMax;
          subMeshes[0].name = "AnimatedCubeSubMesh";
          materialOrg = subMeshes[0].material;
          if (material) {
            material.colorShader = shader as Shader;
          }else {
            console.info(msg + " Failed in createMaterial ");
            expect().assertFail();
          }
          if (material && material.colorShader && envImage1) {
            subMeshes[0].material = material;
            (material.colorShader.inputs["BASE_COLOR_Image"] as scene3d.Image) = envImage1;
            mesh.materialOverride = undefined;
            mesh.materialOverride = materialOrg;
          }else {
            console.info(msg + " Failed in material.colorShader ")
            expect().assertFail();
          }
        }else {
          console.info(msg + ' Failed in getNodeByPath("rootNode_/Unnamed Node 1/AnimatedCube") ');
          expect().assertFail();
        }
        done();
      } catch (err) {
        console.info(msg + " Failed in Mesh " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0470
     * @tc.name      : testSceneResourceType
     * @tc.desc      : Used to get resourceType of resource
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSceneResourceType', 0, function (done) {
      let msg = "============================testSceneResourceType";
      console.info(msg + ' begin ');
      try {
        expect(shader?.resourceType).assertEqual(SceneResourceType.SHADER);
        expect(node?.resourceType).assertEqual(SceneResourceType.NODE);
        expect(env?.resourceType).assertEqual(SceneResourceType.ENVIRONMENT);
        expect(material?.resourceType).assertEqual(SceneResourceType.MATERIAL);
        expect(anim?.resourceType).assertEqual(SceneResourceType.ANIMATION);
        expect(envImage1?.resourceType).assertEqual(SceneResourceType.IMAGE);
        expect(envImage1?.resourceType != SceneResourceType.UNKNOWN).assertTrue();
        done();
      } catch (err) {
        console.info(msg + " Failed in SceneResourceType " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_GRAPHIC3D_JS_API_0480
     * @tc.name      : testSceneResource
     * @tc.desc      : Used to get attribute of resource
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 3
     */
    it('testSceneResource', 0, function (done) {
      let msg = "============================testSceneResource";
      console.info(msg + ' begin ');
      try {
        let resource: SceneResource;
        resource = envImage1 as scene3d.Image;
        expect(resource.name).assertEqual("envImage1");
        expect(resource.resourceType).assertEqual(SceneResourceType.IMAGE);
        expect(resource.uri != undefined).assertTrue();
        resource.destroy();
        done();
      } catch (err) {
        console.info(msg + " Failed in SceneResource " + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    })
  })
}


function sleep(time: number) {
  return new Promise<void>((resolve, reject) => {
    setTimeout(() => {
      resolve();
    }, time)
  }).then(() => {
    console.info(`sleep ${time} over...`);
  })
}

function GenRandom(): number {
  return Math.random() * 2 - 1;
}
