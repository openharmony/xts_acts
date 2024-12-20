export function convertOrientationToString(orientation:ImageRotateOrientation): string | undefined {
  switch (orientation) {
    case ImageRotateOrientation.UP:
      return "UP"
    case ImageRotateOrientation.DOWN:
      return "DOWN"
    case ImageRotateOrientation.LEFT:
      return "LEFT"
    case ImageRotateOrientation.RIGHT:
      return "RIGHT"
    case ImageRotateOrientation.AUTO:
      return "AUTO"
    default:
      return undefined
  }
}

export function convertRepeatToString(orientation:ImageRepeat): string | undefined {
  switch (orientation) {
    case ImageRepeat.NoRepeat:
      return "NoRepeat"
    case ImageRepeat.X:
      return "X"
    case ImageRepeat.Y:
      return "Y"
    case ImageRepeat.XY:
      return "XY"
    default:
      return undefined
  }
}

export function convertImageFitToString(fit:ImageFit): string | undefined {
  switch (fit) {
    case ImageFit.Contain:
      return "Contain"
    case ImageFit.Cover:
      return "Cover"
    case ImageFit.Auto:
      return "Auto"
    case ImageFit.Fill:
      return "Fill"
    case ImageFit.ScaleDown:
      return "ScaleDown"
    case ImageFit.None:
      return "None"
    case ImageFit.TOP_START:
      return "TOP_START"
    case ImageFit.TOP_END:
      return "TOP_END"
    case ImageFit.START:
      return "START"
    case ImageFit.CENTER:
      return "CENTER"
    case ImageFit.END:
      return "END"
    case ImageFit.BOTTOM_START:
      return "END"
    case ImageFit.BOTTOM_END:
      return "END"
    case ImageFit.BOTTOM:
      return "END"
    default:
      return undefined
  }
}