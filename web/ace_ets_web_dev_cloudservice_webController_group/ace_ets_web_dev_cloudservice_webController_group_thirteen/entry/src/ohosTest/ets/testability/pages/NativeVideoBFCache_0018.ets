import { webview } from '@kit.ArkWeb';
import { MyNodeController } from './MyVideo';
import { NodeRenderType, Type } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';
import { LocalContext } from '../../test/GloablConfig';


class ActualNativeMediaPlayerListener {
  private handler: webview.NativeMediaPlayerHandler;

  constructor(handler: webview.NativeMediaPlayerHandler) {
    this.handler = handler;
  }

  onPlaying() {
    // 本地播放器开始播放。
    this.handler.handleStatusChanged(webview.PlaybackStatus.PLAYING);
  }

  onPaused() {
    // 本地播放器暂停播放。
    this.handler.handleStatusChanged(webview.PlaybackStatus.PAUSED);
  }

  onSeeking() {
    // 本地播放器开始执行跳转到目标时间点。
    this.handler.handleSeeking();
  }

  onSeekDone() {
    // 本地播放器 seek 完成。
    this.handler.handleSeekFinished();
  }

  onEnded() {
    // 本地播放器播放完成。
    this.handler.handleEnded();
  }

  onVolumeChanged() {
    // 获取本地播放器的音量。
    let volume: number = getVolume();
    this.handler.handleVolumeChanged(volume);
  }

  onCurrentPlayingTimeUpdate() {
    // 更新播放时间。
    let currentTime: number = getCurrentPlayingTime();
    // 将时间单位换算成秒。
    let currentTimeInSeconds = convertToSeconds(currentTime);
    this.handler.handleTimeUpdate(currentTimeInSeconds);
  }

  onBufferedChanged() {
    // 缓存发生了变化。
    // 获取本地播放器的缓存时长。
    let bufferedEndTime: number = getCurrentBufferedTime();
    // 将时间单位换算成秒。
    let bufferedEndTimeInSeconds = convertToSeconds(bufferedEndTime);
    this.handler.handleBufferedEndTimeChanged(bufferedEndTimeInSeconds);

    // 检查缓存状态。
    // 如果缓存状态发生了变化，则向 ArkWeb 内核通知缓存状态。
    let lastReadyState: webview.ReadyState = getLastReadyState();
    let currentReadyState: webview.ReadyState = getCurrentReadyState();
    if (lastReadyState != currentReadyState) {
      this.handler.handleReadyStateChanged(currentReadyState);
    }
  }

  onEnterFullscreen() {
    // 本地播放器进入了全屏状态。
    let isFullscreen: boolean = true;
    this.handler.handleFullscreenChanged(isFullscreen);
  }

  onExitFullscreen() {
    // 本地播放器退出了全屏状态。
    let isFullscreen: boolean = false;
    this.handler.handleFullscreenChanged(isFullscreen);
  }

  onUpdateVideoSize(width: number, height: number) {
    // 当本地播放器解析出视频宽高时， 通知 ArkWeb 内核。
    this.handler.handleVideoSizeChanged(width, height);
  }

  onDurationChanged(duration: number) {
    // 本地播放器解析到了新的媒体时长， 通知 ArkWeb 内核。
    this.handler.handleDurationChanged(duration);
  }

  onError(error: webview.MediaError, errorMessage: string) {
    // 本地播放器出错了，通知 ArkWeb 内核。
    this.handler.handleError(error, errorMessage);
  }

  onNetworkStateChanged(state: webview.NetworkState) {
    // 本地播放器的网络状态发生了变化， 通知 ArkWeb 内核。
    this.handler.handleNetworkStateChanged(state);
  }

  onPlaybackRateChanged(playbackRate: number) {
    // 本地播放器的播放速率发生了变化， 通知 ArkWeb 内核。
    this.handler.handlePlaybackRateChanged(playbackRate);
  }

  onMutedChanged(muted: boolean) {
    // 本地播放器的静音状态发生了变化， 通知 ArkWeb 内核。
    this.handler.handleMutedChanged(muted);
  }

  // ... 监听本地播放器其他的状态 ...
}

class NativeMediaPlayerImpl implements webview.NativeMediaPlayerBridge {
  private handler: webview.NativeMediaPlayerHandler;

  constructor(handler: webview.NativeMediaPlayerHandler, mediaInfo: webview.MediaInfo) {
    // 1. 创建一个本地播放器的状态监听。
    let listener: ActualNativeMediaPlayerListener = new ActualNativeMediaPlayerListener(handler);
    this.handler = handler;
  }

  updateRect(x: number, y: number, width: number, height: number) {
    // <video> 标签的位置和大小发生了变化。
    // 根据该信息变化，作出相应的改变。
  }

  play() {

    // 启动本地播放器播放。
  }

  pause() {
    // 暂停本地播放器播放。


  }

  seek(targetTime: number) {
    // 本地播放器跳转到指定的时间点。
  }

  release() {

    // 销毁本地播放器。
  }

  setVolume(volume: number) {
    // ArkWeb 内核要求调整本地播放器的音量。
    // 设置本地播放器的音量。
  }

  setMuted(muted: boolean) {
    // 将本地播放器静音或取消静音。
  }

  setPlaybackRate(playbackRate: number) {
    // 调整本地播放器的播放速度。
  }

  enterFullscreen() {
    // 将本地播放器设置为全屏播放。
  }

  exitFullscreen() {
    // 将本地播放器退出全屏播放。
  }

  resumePlayer() {
    // 重新创建应用内播放器。
    // 恢复应用内播放器的状态信息。
  }

  suspendPlayer(type: webview.SuspendType) {
    // 记录应用内播放器的状态信息。
    // 销毁应用内播放器。
    return 1

  }
}

@Entry
@Component
struct WebComponent {
  @State flag: boolean = false;
  @State result: number = 2;
  controller: webview.WebviewController = new webview.WebviewController()

  build() {
    Column() {
      Web({ src: $rawfile('test.html'), controller: this.controller })
        .enableNativeMediaPlayer({ enable: false, shouldOverlay: false })
        .onPageBegin(() => {
          this.controller.onCreateNativeMediaPlayer((handler: webview.NativeMediaPlayerHandler,
            mediaInfo: webview.MediaInfo) => {
            if (!shouldHandle(mediaInfo)) {
              // 本地播放器不接管该媒体。
              // ArkWeb 内核将用自己的播放器来播放该媒体。
              return null;
            }
            let nativePlayer: NativeMediaPlayerImpl = new NativeMediaPlayerImpl(handler, mediaInfo);
            try {
              nativePlayer.suspendPlayer(3);
              LocalContext.context.eventHub.emit('testWebView_NativeVideoPlayerBFCache0018_1',
                nativePlayer.suspendPlayer(3));
            } catch (error) {
              console.error(`ErrorCode: ${(error as BusinessError).code},  Message: ${(error as BusinessError).message}`);
            }
            return nativePlayer;
          });
        })
    }
  }
}

// stub
function getVolume() {
  return 1;
}

function getCurrentPlayingTime() {
  return 1;
}

function getCurrentBufferedTime() {
  return 1;
}

function convertToSeconds(input: number) {
  return input;
}

function getLastReadyState() {
  return webview.ReadyState.HAVE_NOTHING;
}

function getCurrentReadyState() {
  return webview.ReadyState.HAVE_NOTHING;
}

function shouldHandle(mediaInfo: webview.MediaInfo) {
  return true;
}