import { SelectTitleBar } from '@ohos.arkui.advanced.SelectTitleBar';
import promptAction from '@ohos.promptAction';

interface menuItems {
  value: Resource;
  isEnabled?: boolean;
  action?: () => void
}

@Entry
@Component
struct Index {
  private  menuItems:Array<menuItems> =
    [
      {
        value:$r('sys.media.ohos_save_button_line'),
        isEnabled:true,
        action:() => promptAction.showToast({ message: 'show toast index 1' })
      },
      {
        value:$r('sys.media.ohos_ic_public_clock'),
        isEnabled:true,
        action:() => promptAction.showToast({ message: 'show toast index 2' })
      },
      {
        value:$r('sys.media.ohos_ic_public_edit'),
        isEnabled:true,
        action:() => promptAction.showToast({ message: 'show toast index 3' })
      },
      {
        value:$r('sys.media.ohos_ic_public_clock'),
        isEnabled:true,
        action:() => promptAction.showToast({ message: 'show toast index 4' })
      },
    ]

  build() {
    Row() {
      Column() {
        Divider().height(2).color(0xCCCCCC)
        SelectTitleBar({
          options: [
            { value: '所有照片' },
            { value: '本地（设备）' },
            { value: '本地本地本地本地本地（储存卡）' }
          ],
          selected: 0,
          onSelected: (index) => promptAction.showToast({ message: 'page index ' + index }),
          hidesBackButton: true,
        })
        Divider().height(2).color(0xCCCCCC)
        SelectTitleBar({
          options: [
            { value: '所有照片' },
            { value: '本地（设备）' },
            { value: '本地本地本地本地本地（储存卡）' }
          ],
          selected: 0,
          onSelected: (index) => promptAction.showToast({ message: 'page index ' + index }),
          hidesBackButton: false,
        })
        Divider().height(2).color(0xCCCCCC)
        SelectTitleBar({
          options: [
            { value: '所有照片' },
            { value: '本地（设备）' },
            { value: '本地本地本地本地本地（储存卡）' }
          ],
          selected: 1,
          onSelected: (index) => promptAction.showToast({ message: 'page index ' + index }),
          subtitle: 'example@example.com',
        })
        Divider().height(2).color(0xCCCCCC)
        SelectTitleBar({
          options: [
            { value: '所有照片' },
            { value: '本地（设备）' },
            { value: '本地本地本地本地本地（储存卡）' }
          ],
          selected: 1,
          onSelected: (index) => promptAction.showToast({ message: 'page index ' + index }),
          subtitle: 'example@example.com',
          menuItems: [{ isEnabled: true, value: $r('sys.media.ohos_save_button_line'),
            action: () => promptAction.showToast({ message: 'show toast index 1' })
          }],
        })
        Divider().height(2).color(0xCCCCCC)
        SelectTitleBar({
          options: [
            { value: '所有照片' },
            { value: '本地（设备）' },
            { value: '本地本地本地本地本地（储存卡）' }
          ],
          selected: 0,
          onSelected: (index) => promptAction.showToast({ message: 'page index ' + index }),
          subtitle: 'example@example.com',
          menuItems: this.menuItems,
          badgeValue: 99,
          hidesBackButton: true,
        })
        Divider().height(2).color(0xCCCCCC)
      }.width('100%')
    }.height('100%')
  }
}