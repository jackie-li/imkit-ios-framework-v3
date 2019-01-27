# IMKit iOS Framework v3.0
IMKit iOS Framework is the core of IMKit iOS SDK.

# About IMKit
IMKit is a live chat platform solution, more detail please visit: https://imkit.io

## Features

- [x] Room list / Chat room
- [x] Support text, sticker, image, video, audio, location message
- [x] Support reply message
- [x] URL detection and preview
- [x] Typing indicator
- [x] Support Traditional Chinese and English

## Requirements

- iOS 10.0+
- Xcode 10.1+
- Swift 4.2+

## Installation

### CocoaPods
[CocoaPods](https://cocoapods.org) is a dependency manager for Cocoa projects. For usage and installation instructions, visit their website. To integrate IMKit into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
pod 'IMKit', :git => 'https://github.com/imkit/imkit-ios-framework-v3.git', :branch => 'swift4.2'
```
We enhanced [IGListKit](https://github.com/Instagram/IGListKit) and [SwiftLinkPreview](https://github.com/LeonardoCardoso/SwiftLinkPreview) to fit our need. So also specify them in your `Podfile`:

```ruby
pod 'IGListKit', :git => 'https://github.com/imkit/IGListKit.git'
pod 'SwiftLinkPreview', :git => 'https://github.com/imkit/SwiftLinkPreview.git'
```

## Installation

## Quick Start - Demo App
```bash
$ git clone https://github.com/imkit/imkit-ios-sdk-v3.git
$ cd imkit-ios-sdk-v3/
$ pod install
$ open imkit-ios-sdk-v3-demo.xcworkspace
```

## Integration

### Initial Settings
In your App Delegate, initialize IMKit with your client key and chat server url:
```swift
import IMKit
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    IMKit.configure(apiKey: "", clientKey: "fangho_imkit_0412_2018_001_clientkey", chatServerURL: URL(string: "https://chat.fangho.com")!, authServerURL: URL(string: "https://auth.fangho.com")!, bucket: "chatserver-upload")
    return true
}
```
In demo app, we use `IMFetchTokenTask` to get the token just for demo. In real case, your backend needs to provide a token, then initialize IMKit with token and user id.(Our chat server will ask your backend if the token is validated.)
```swift
IMKit.token = token
IMKit.uid = uid
```

Congratulations! From now on, leverage the powerful IMKit.

 ### UI
 There are tow main classes. One is `IMRoomsViewController`, the other is `IMMessagesViewController`.
 You can use them anywhere in your iOS app:
 ```swift
let vc = UINavigationController(rootViewController: IMRoomsViewController())
present(vc, animated: true)

// Or
navigationController?.pushViewController(IMRoomsViewController(), animated: true)

// Or
navigationController?.pushViewController(IMMessagesViewController(roomID: room.id), animated: true)
 ```
We provide customizable UI. Place the code before using IMKit ui elements.
```swift
// For example
IMStyle.rooms.backgroundColor = UIColor(red: 249/255, green: 249/255, blue: 249/255, alpha: 1)
IMStyle.rooms.cell.height = 66
IMStyle.rooms.cell.title.font = UIFont.systemFont(ofSize: 17, weight: .regular)
IMStyle.messages.inputAccessory.textBar.cornerRadius = 17
IMStyle.messages.outgoingCell.borderWidth = 1
```
#### Advanced
Override `IMRoomsViewController` or `IMMessagesViewController` to do anything you want.

```swift
// For example
class RoomsViewController: IMRoomsViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let logoutButton = UIBarButtonItem(title: "登出", style: .plain, target: self, action: #selector(logout))
        navigationItem.setLeftBarButton(logoutButton, animated: false)
    }
    
    override func didSelectRoom(room: IMRoom) {
        navigationController?.pushViewController(MessagesViewController(roomID: room.id), animated: true)
    }
    
    @objc func logout() {
        IMKit.logout()
        navigationController?.dismiss(animated: true, completion: nil)
    }
    
    override func emptyView(for listAdapter: ListAdapter) -> UIView? {
        if viewModel.state == .Loaded {
            let imageView = UIImageView(image: UIImage(named: "empty"))
            imageView.contentMode = .scaleAspectFill
            return imageView
        } else {
            return nil
        }
    }
}
class MessagesViewController: IMMessagesViewController {
 
    override func viewDidLoad() {
        super.viewDidLoad()
        inputBarViewController.sendButton.setImage(UIImage(named: "sent"), for: .normal)
        inputBarViewController.addButton.setImage(UIImage(named: "add"), for: .normal)
        let image = UIImage(named: "happy")?.withRenderingMode(.alwaysTemplate)
        inputBarViewController.stickerButton.setImage(image, for: .normal)
        inputBarViewController.stickerButton.tintColor = UIColor(red: 158/255, green: 158/255, blue: 158/255, alpha: 1)
        
        let imagePickerViewController = UIImagePickerController()
        imagePickerViewController.delegate = inputBarViewController
        inputBarViewController.photosImagePicker = imagePickerViewController
        
        bottomButton.setImage(UIImage(named: "btnBackToButton"), for: .normal)
        
        let infoButton = UIBarButtonItem(image: UIImage(named: "setting"), style: .plain, target: self, action: #selector(infoButtonTapped))
        infoButton.tintColor = UIColor(red: 47/255, green: 60/255, blue: 75/255, alpha: 1)
        navigationItem.setRightBarButton(infoButton, animated: false)
        
        let backButton = UIBarButtonItem(title: nil, style: .plain, target: self, action: #selector(back))
        backButton.image = UIImage(named: "back")
        backButton.tintColor = UIColor(red: 47/255, green: 60/255, blue: 75/255, alpha: 1)
        navigationItem.setLeftBarButton(backButton, animated: false)
    }
    
    @objc func back() {
        _ = navigationController?.popViewController(animated: true)
    }
    
    override func messageDidSelect(_ message: IMMessage) {
      
    }
    
    override func infoButtonTapped() {
        
    }
    
    override func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        if object is IMDate {
            return IMDateSectionController()
        } else if object is String {
            return IMTypingSectionController()
        }
        if let message = object as? IMMessage {
            switch message.type {
            case .Text:
                return TextMessageSectionController()
            case .Image:
                return ImageMessageSectionController()
            case .Audio:
                return AudioMessageSectionController()
            case .Video:
                return VideoMessageSectionController()
            case .File:
                return FileMessageSectionController()
            case .Location:
                return MapMessageSectionController()
            case .Sticker:
                return StickerMessageSectionController()
            case .System:
                return IMSystemMessageSectionController()
            case .Other:
                return TextMessageSectionController()
            }
        }
        return TextMessageSectionController()
    }
}
```

### Task

We wrap all our task using [PromiseKit](https://github.com/mxcl/PromiseKit). Before using IMKit, you should know how to deal with promise.

```swift
// There are tow types of chat room, direct char and group chat
IMCreateDirectChatTask().perform(roomName: <#T##String?#>, coverURL: <#T##URL?#>, description: <#T##String?#>, invitee: <#T##String#>, isSystemMessageEnabled: <#T##Bool#>)
IMCreateGroupChatTask().perform(roomName: <#T##String?#>, coverURL: <#T##URL?#>, description: <#T##String?#>, invitees: <#T##[String]#>, isSystemMessageEnabled: <#T##Bool#>)

IMAddMembersTask().perform(roomID: <#T##String#>, invitees: <#T##[String]#>, isSystemMessageEnabled: <#T##Bool#>)
IMJoinRoomTask().perform(id: <#T##String#>)
IMDeleteMemberTask().perform(roomdID: <#T##String#>, uid: <#T##String#>)

IMMuteRoomTask().perform(id: <#T##String#>)
IMUnmuteRoomTask().perform(id: <#T##String#>)

// These are for push notifications. Type needs to be `fcm` for using Firebase Cloud Messaging and `ios` for APNS
IMSubscribeTask().perform(fcmToken: <#T##String#>, type: <#T##String#>)
IMUnsubscribeTask().perform(fcmToken: <#T##String#>, type: <#T##String#>)

IMUpdateRoomTask().perform(id: <#T##String#>, name: <#T##String?#>, coverURL: <#T##URL?#>)
IMUpdateMyProfileTask().perform(nickname: <#T##String?#>, avatarURL: <#T##URL?#>, description: <#T##String?#>)
IMFetchBadgeTask().perform()
IMFetchMyProfileTask().perform()
```
