        const isSupportImageFormat = async (fileName: string, format: string) => {
          let filePath = ""
          let isSupportFormat = false;
          let globalImagesource: image.ImageSource;
          try {
              filePath = filesDir + "/" + fileName;
              globalImagesource = image.createImageSource(filePath);
              if (globalImagesource != undefined) {
                isSupportFormat = globalImagesource.supportedFormats.includes(format);
                console.info('isSupportFormat is ' + isSupportFormat);
                globalImagesource.release();
              }
              return isSupportFormat;
          } catch (error) {
              console.info("getRawFileContent case" + error);
              return isSupportFormat;
          }
          return isSupportFormat;
        }