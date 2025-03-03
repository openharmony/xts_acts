  let startSession = async (i: number, mode: number) => {
    // 创建相机
    getCameraDevices()
    // 创建输出流
    createOutput(i, mode)
    // 配置录制参数, 获取 videoSurfaceId
    await getVideoSurface();
    console.info('videoSurfaceId: ' + videoSurfaceId)
    // 创建VideoOutput对象
    videoOutput = cameraManager.createVideoOutput(videoProfilesArray[0], videoSurfaceId);
    //创建会话
    createPhotoSession(mode)
    // 配置会话
    createInput(i);
    if (cameraInput) {
      cameraSession.addInput(cameraInput);
    }
    if (previewOutput) {
      cameraSession.addOutput(previewOutput);
    }
    if (videoOutput) {
      cameraSession.addOutput(videoOutput);
    }
    cameraSession.commitConfig();
    cameraSession.start();
}