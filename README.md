# ViewControllerNavigatior
[![Cocoapods](https://img.shields.io/cocoapods/v/ViewControllerNavigator.svg?style=flat)](https://cocoapods.org/pods/ViewControllerNavigator)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
![Swift](https://img.shields.io/badge/Swift-4.1-orange.svg)
[![GitHub license](https://img.shields.io/badge/license-MIT-lightgrey.svg?style=flat)](https://raw.githubusercontent.com/k-lpmg/ViewControllerNavigator/master/LICENSE)

Moves to a specific ViewController in any iOS ViewStack situation.

## Introduction
![navigation](https://user-images.githubusercontent.com/15151687/44308660-d96dce80-a3f4-11e8-9483-29642be29c68.gif)
![modal](https://user-images.githubusercontent.com/15151687/44308670-faceba80-a3f4-11e8-8acf-3f36cedf0768.gif)
![tabbar](https://user-images.githubusercontent.com/15151687/44308676-09b56d00-a3f5-11e8-8c04-ff62efd864ad.gif)
![page](https://user-images.githubusercontent.com/15151687/44308686-19cd4c80-a3f5-11e8-92e2-5b01fc9d2ea1.gif)

## Usage

#### move to RootViewController
```swift
ViewControllerNavigator.shared.moveRootViewController()
```

#### move to Specific ViewController
```swift
ViewControllerNavigator.shared.move(viewController: TabBarController())
```

#### move to Specific ViewController Class
```swift
ViewControllerNavigator.shared.move(class: TabBarController.self)
```

#### with Completion
```swift
ViewControllerNavigator.shared.move(viewController: TabBarController) { (tabBarController) in
    tabBarController.selectedIndex = 2
}
```

## Installation

#### CocoaPods (iOS 8+)

```ruby
platform :ios, '8.0'
use_frameworks!

target 'MyApp' do
    pod 'ViewControllerNavigator'
end
```

### Carthage (iOS 8+)

```ruby
github "k-lpmg/ViewControllerNavigator"
```


## LICENSE

These works are available under the MIT license. See the [LICENSE][license] file
for more info.

[license]: LICENSE
