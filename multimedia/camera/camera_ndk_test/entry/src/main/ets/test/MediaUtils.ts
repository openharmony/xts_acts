/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// @ts-nocheck

import mediaLibrary from '@ohos.multimedia.mediaLibrary'
import DateTimeUtil from './DateTimeUtil'

export default class MediaUtils {

    private mediaTest: mediaLibrary.MediaLibrary = mediaLibrary.getMediaLibrary(this.context)
    private static instance: MediaUtils = new MediaUtils()
    private num: number = 0

    public static getInstance() {
        if (this.instance === undefined) {
            this.instance = new MediaUtils()
        }
        return this.instance
    }

    async createAndGetUri(mediaType: number) {
        console.info('createAndGetUri');
        let info = this.getInfoFromType(mediaType)
        let dateTimeUtil = new DateTimeUtil()
        let name = `${dateTimeUtil.getDate()}_${dateTimeUtil.getTime()}`
        let displayName = `${info.prefix}${name}${info.suffix}`
        console.info('createAndGetUri displayName : ' + displayName);
        let publicPath = await this.mediaTest.getPublicDirectory(info.directory)
        console.info('createAndGetUri publicPath : ' + publicPath);
        try {
            return await this.mediaTest.createAsset(mediaType, displayName, publicPath)
        } catch {
            this.num++
            displayName = `${info.prefix}${name}_${this.num}${info.suffix}`
            return await this.mediaTest.createAsset(mediaType, displayName, publicPath)
        }
    }

    async queryFile(dataUri: any) {
        let fileKeyObj = mediaLibrary.FileKey
        if (dataUri !== undefined) {
            let args = dataUri.id.toString()
            let fetchOp = {
                selections: `${fileKeyObj.ID}=?`,
                selectionArgs: [args],
            }
            const fetchFileResult = await this.mediaTest.getFileAssets(fetchOp)

            const fileAsset = await fetchFileResult.getAllObject()
            return fileAsset[0]
        }
    }

    async getFdPath(fileAsset: any) {
        let fd = await fileAsset.open('Rw')

        return fd
    }

    async createFile(mediaType: number) {
        let dataUri = await this.createAndGetUri(mediaType)
        if (dataUri) {
            let fileAsset = await this.queryFile(dataUri)
            if (fileAsset) {
                let fd = await this.getFdPath(fileAsset)
                return fd
            }
        }
    }

    async getFileAssetsFromType(mediaType: number) {

        let fileKeyObj = mediaLibrary.FileKey
        let fetchOp = {
            selections: `${fileKeyObj.MEDIA_TYPE}=?`,
            selectionArgs: [`${mediaType}`],
        }
        const fetchFileResult = await this.mediaTest.getFileAssets(fetchOp)

        let fileAssets = []
        if (fetchFileResult.getCount() > 0) {
            fileAssets = await fetchFileResult.getAllObject()
        }
        return fileAssets
    }

    async getAlbums() {

        let albums = []
        const [ files, images, videos, audios ] = await Promise.all([
        this.getFileAssetsFromType(mediaLibrary.MediaType.FILE),
        this.getFileAssetsFromType(mediaLibrary.MediaType.IMAGE),
        this.getFileAssetsFromType(mediaLibrary.MediaType.VIDEO),
        this.getFileAssetsFromType(mediaLibrary.MediaType.AUDIO)
        ])
        albums.push({
            albumName: 'Documents', count: files.length, mediaType: mediaLibrary.MediaType.FILE
        })
        albums.push({
            albumName: 'Pictures', count: images.length, mediaType: mediaLibrary.MediaType.IMAGE
        })
        albums.push({
            albumName: 'Camera', count: videos.length, mediaType: mediaLibrary.MediaType.VIDEO
        })
        albums.push({
            albumName: 'Audios', count: audios.length, mediaType: mediaLibrary.MediaType.AUDIO
        })
        return albums
    }

    deleteFile(media: any) {
        let uri = media.uri

        return this.mediaTest.deleteAsset(uri)
    }

    onDateChange(callback: () => void) {
        this.mediaTest.on('albumChange', () => {

            callback()
        })
        this.mediaTest.on('imageChange', () => {

            callback()
        })
        this.mediaTest.on('audioChange', () => {

            callback()
        })
        this.mediaTest.on('videoChange', () => {

            callback()
        })
        this.mediaTest.on('fileChange', () => {

            callback()
        })
    }

    offDateChange() {
        this.mediaTest.off('albumChange')
        this.mediaTest.off('imageChange')
        this.mediaTest.off('audioChange')
        this.mediaTest.off('videoChange')
        this.mediaTest.off('fileChange')
    }
    // 照片格式
    onChangePhotoFormat() {
        if (globalThis.settingDataObj.photoFormat == 0) {
            return 'png'
        }
        if (globalThis.settingDataObj.photoFormat == 1) {
            return 'jpg'
        }
        if (globalThis.settingDataObj.photoFormat == 2) {
            return 'bmp'
        }
        if (globalThis.settingDataObj.photoFormat == 3) {
            return 'webp'
        }
        if (globalThis.settingDataObj.photoFormat == 4) {
            return 'jpeg'
        }
    }

    getInfoFromType(mediaType: number) {
        let result = {
            prefix: '', suffix: '', directory: 0
        }
        switch (mediaType) {
            case mediaLibrary.MediaType.FILE:
                result.prefix = 'FILE_'
                result.suffix = '.txt'
                result.directory = mediaLibrary.DirectoryType.DIR_DOCUMENTS
                break
            case mediaLibrary.MediaType.IMAGE:
                result.prefix = 'IMG_'
            // result.suffix =  '.jpg'
                result.suffix = `.${this.onChangePhotoFormat()}`
                result.directory = mediaLibrary.DirectoryType.DIR_CAMERA
                break
            case mediaLibrary.MediaType.VIDEO:
                result.prefix = 'VID_'
                result.suffix = '.mp4'
                result.directory = mediaLibrary.DirectoryType.DIR_CAMERA
                break
            case mediaLibrary.MediaType.AUDIO:
                result.prefix = 'AUD_'
                result.suffix = '.wav'
                result.directory = mediaLibrary.DirectoryType.DIR_AUDIO
                break
        }
        return result
    }
}