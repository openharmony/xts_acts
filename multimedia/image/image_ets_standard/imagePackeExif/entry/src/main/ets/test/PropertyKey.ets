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


export enum PropertyKey {

  BITS_PER_SAMPLE = 'BitsPerSample',

  ORIENTATION = 'Orientation',

  IMAGE_LENGTH = 'ImageLength',

  IMAGE_WIDTH = 'ImageWidth',

  GPS_LATITUDE = 'GPSLatitude',

  GPS_LONGITUDE = 'GPSLongitude',

  GPS_LATITUDE_REF = 'GPSLatitudeRef',

  GPS_LONGITUDE_REF = 'GPSLongitudeRef',

  DATE_TIME_ORIGINAL = 'DateTimeOriginal',

  EXPOSURE_TIME = 'ExposureTime',

  SCENE_TYPE = 'SceneType',

  ISO_SPEED_RATINGS = 'ISOSpeedRatings',

  F_NUMBER = 'FNumber',

  DATE_TIME = 'DateTime',

  GPS_TIME_STAMP = 'GPSTimeStamp',

  GPS_DATE_STAMP = 'GPSDateStamp',

  IMAGE_DESCRIPTION = 'ImageDescription',

  MAKE = 'Make',

  MODEL = 'Model',

  PHOTO_MODE = 'PhotoMode',

  SENSITIVITY_TYPE = 'SensitivityType',

  STANDARD_OUTPUT_SENSITIVITY = 'StandardOutputSensitivity',

  RECOMMENDED_EXPOSURE_INDEX = 'RecommendedExposureIndex',

  ISO_SPEED = 'ISOSpeedRatings',

  APERTURE_VALUE = 'ApertureValue',

  EXPOSURE_BIAS_VALUE = 'ExposureBiasValue',

  METERING_MODE = 'MeteringMode',

  LIGHT_SOURCE = 'LightSource',

  FLASH = 'Flash',

  FOCAL_LENGTH = 'FocalLength',

  USER_COMMENT = 'UserComment',

  PIXEL_X_DIMENSION = 'PixelXDimension',

  PIXEL_Y_DIMENSION = 'PixelYDimension',

  WHITE_BALANCE = 'WhiteBalance',

  FOCAL_LENGTH_IN_35_MM_FILM = 'FocalLengthIn35mmFilm',

  COMPRESSION = 'Compression',

  PHOTOMETRIC_INTERPRETATION = 'PhotometricInterpretation',

  STRIP_OFFSETS = 'StripOffsets',

  SAMPLES_PER_PIXEL = 'SamplesPerPixel',

  ROWS_PER_STRIP = 'RowsPerStrip',

  STRIP_BYTE_COUNTS = 'StripByteCounts',

  X_RESOLUTION = 'XResolution',

  Y_RESOLUTION = 'YResolution',

  PLANAR_CONFIGURATION = 'PlanarConfiguration',

  RESOLUTION_UNIT = 'ResolutionUnit',

  TRANSFER_FUNCTION = 'TransferFunction',

  SOFTWARE = 'Software',

  ARTIST = 'Artist',

  WHITE_POINT = 'WhitePoint',

  PRIMARY_CHROMATICITIES = 'PrimaryChromaticities',

  YCBCR_COEFFICIENTS = 'YCbCrCoefficients',

  YCBCR_SUB_SAMPLING = 'YCbCrSubSampling',

  YCBCR_POSITIONING = 'YCbCrPositioning',

  REFERENCE_BLACK_WHITE = 'ReferenceBlackWhite',

  COPYRIGHT = 'Copyright',

  JPEG_INTERCHANGE_FORMAT = 'JPEGInterchangeFormat',

  JPEG_INTERCHANGE_FORMAT_LENGTH = 'JPEGInterchangeFormatLength',

  EXPOSURE_PROGRAM = 'ExposureProgram',

  SPECTRAL_SENSITIVITY = 'SpectralSensitivity',

  OECF = 'OECF',

  EXIF_VERSION = 'ExifVersion',

  DATE_TIME_DIGITIZED = 'DateTimeDigitized',

  COMPONENTS_CONFIGURATION = 'ComponentsConfiguration',

  SHUTTER_SPEED = 'ShutterSpeedValue',

  BRIGHTNESS_VALUE = 'BrightnessValue',

  MAX_APERTURE_VALUE = 'MaxApertureValue',

  SUBJECT_DISTANCE = 'SubjectDistance',

  SUBJECT_AREA = 'SubjectArea',

  MAKER_NOTE = 'MakerNote',

  SUBSEC_TIME = 'SubsecTime',

  SUBSEC_TIME_ORIGINAL = 'SubsecTimeOriginal',

  SUBSEC_TIME_DIGITIZED = 'SubsecTimeDigitized',

  FLASHPIX_VERSION = 'FlashpixVersion',

  COLOR_SPACE = 'ColorSpace',

  RELATED_SOUND_FILE = 'RelatedSoundFile',

  FLASH_ENERGY = 'FlashEnergy',

  SPATIAL_FREQUENCY_RESPONSE = 'SpatialFrequencyResponse',

  FOCAL_PLANE_X_RESOLUTION = 'FocalPlaneXResolution',

  FOCAL_PLANE_Y_RESOLUTION = 'FocalPlaneYResolution',

  FOCAL_PLANE_RESOLUTION_UNIT = 'FocalPlaneResolutionUnit',

  SUBJECT_LOCATION = 'SubjectLocation',

  EXPOSURE_INDEX = 'ExposureIndex',

  SENSING_METHOD = 'SensingMethod',

  FILE_SOURCE = 'FileSource',

  CFA_PATTERN = 'CFAPattern',

  CUSTOM_RENDERED = 'CustomRendered',

  EXPOSURE_MODE = 'ExposureMode',

  DIGITAL_ZOOM_RATIO = 'DigitalZoomRatio',

  SCENE_CAPTURE_TYPE = 'SceneCaptureType',

  GAIN_CONTROL = 'GainControl',

  CONTRAST = 'Contrast',

  SATURATION = 'Saturation',

  SHARPNESS = 'Sharpness',

  DEVICE_SETTING_DESCRIPTION = 'DeviceSettingDescription',

  SUBJECT_DISTANCE_RANGE = 'SubjectDistanceRange',

  IMAGE_UNIQUE_ID = 'ImageUniqueID',

  GPS_VERSION_ID = 'GPSVersionID',

  GPS_ALTITUDE_REF = 'GPSAltitudeRef',

  GPS_ALTITUDE = 'GPSAltitude',

  GPS_SATELLITES = 'GPSSatellites',

  GPS_STATUS = 'GPSStatus',

  GPS_MEASURE_MODE = 'GPSMeasureMode',

  GPS_DOP = 'GPSDOP',

  GPS_SPEED_REF = 'GPSSpeedRef',

  GPS_SPEED = 'GPSSpeed',

  GPS_TRACK_REF = 'GPSTrackRef',

  GPS_TRACK = 'GPSTrack',

  GPS_IMG_DIRECTION_REF = 'GPSImgDirectionRef',

  GPS_IMG_DIRECTION = 'GPSImgDirection',

  GPS_MAP_DATUM = 'GPSMapDatum',

  GPS_DEST_LATITUDE_REF = 'GPSDestLatitudeRef',

  GPS_DEST_LATITUDE = 'GPSDestLatitude',

  GPS_DEST_LONGITUDE_REF = 'GPSDestLongitudeRef',

  GPS_DEST_LONGITUDE = 'GPSDestLongitude',

  GPS_DEST_BEARING_REF = 'GPSDestBearingRef',

  GPS_DEST_BEARING = 'GPSDestBearing',

  GPS_DEST_DISTANCE_REF = 'GPSDestDistanceRef',

  GPS_DEST_DISTANCE = 'GPSDestDistance',

  GPS_PROCESSING_METHOD = 'GPSProcessingMethod',

  GPS_AREA_INFORMATION = 'GPSAreaInformation',

  GPS_DIFFERENTIAL = 'GPSDifferential',

  BODY_SERIAL_NUMBER = 'BodySerialNumber',

  CAMERA_OWNER_NAME = 'CameraOwnerName',

  COMPOSITE_IMAGE = 'CompositeImage',

  COMPRESSED_BITS_PER_PIXEL = 'CompressedBitsPerPixel',

  DNG_VERSION = 'DNGVersion',

  DEFAULT_CROP_SIZE = 'DefaultCropSize',

  GAMMA = 'Gamma',

  ISO_SPEED_LATITUDE_YYY = 'ISOSpeedLatitudeyyy',

  ISO_SPEED_LATITUDE_ZZZ = 'ISOSpeedLatitudezzz',

  LENS_MAKE = 'LensMake',

  LENS_MODEL = 'LensModel',

  LENS_SERIAL_NUMBER = 'LensSerialNumber',

  LENS_SPECIFICATION = 'LensSpecification',

  NEW_SUBFILE_TYPE = 'NewSubfileType',

  OFFSET_TIME = 'OffsetTime',

  OFFSET_TIME_DIGITIZED = 'OffsetTimeDigitized',

  OFFSET_TIME_ORIGINAL = 'OffsetTimeOriginal',

  SOURCE_EXPOSURE_TIMES_OF_COMPOSITE_IMAGE = 'SourceExposureTimesOfCompositeImage',

  SOURCE_IMAGE_NUMBER_OF_COMPOSITE_IMAGE = 'SourceImageNumberOfCompositeImage',

  SUBFILE_TYPE = 'SubfileType',

  GPS_H_POSITIONING_ERROR = 'GPSHPositioningError',

  PHOTOGRAPHIC_SENSITIVITY = 'PhotographicSensitivity',

  BURST_NUMBER = 'HwMnoteBurstNumber',

  FACE_CONF = 'HwMnoteFaceConf',

  FACE_LEYE_CENTER = 'HwMnoteFaceLeyeCenter',

  FACE_MOUTH_CENTER = 'HwMnoteFaceMouthCenter',

  FACE_POINTER = 'HwMnoteFacePointer',

  FACE_RECT = 'HwMnoteFaceRect',

  FACE_REYE_CENTER = 'HwMnoteFaceReyeCenter',

  FACE_SMILE_SCORE = 'HwMnoteFaceSmileScore',

  FACE_VERSION = 'HwMnoteFaceVersion',

  FRONT_CAMERA = 'HwMnoteFrontCamera',

  SCENE_POINTER = 'HwMnoteScenePointer',

  SCENE_VERSION = 'HwMnoteSceneVersion',

  CAPTURE_MODE = 'HwMnoteCaptureMode',

  PHYSICAL_APERTURE = 'HwMnotePhysicalAperture',

  ROLL_ANGLE = 'HwMnoteRollAngle',

  PITCH_ANGLE = 'HwMnotePitchAngle',

  SCENE_FOOD_CONF = 'HwMnoteSceneFoodConf',

  SCENE_STAGE_CONF = 'HwMnoteSceneStageConf',

  SCENE_BLUE_SKY_CONF = 'HwMnoteSceneBlueSkyConf',

  SCENE_GREEN_PLANT_CONF = 'HwMnoteSceneGreenPlantConf',

  SCENE_BEACH_CONF = 'HwMnoteSceneBeachConf',

  SCENE_SNOW_CONF = 'HwMnoteSceneSnowConf',

  SCENE_SUNSET_CONF = 'HwMnoteSceneSunsetConf',

  SCENE_FLOWERS_CONF = 'HwMnoteSceneFlowersConf',

  SCENE_NIGHT_CONF = 'HwMnoteSceneNightConf',

  SCENE_TEXT_CONF = 'HwMnoteSceneTextConf',

  FACE_COUNT = 'HwMnoteFaceCount',

  FOCUS_MODE = 'HwMnoteFocusMode',
}
