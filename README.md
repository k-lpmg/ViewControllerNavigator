# ViewControllerNavigatior
[![Cocoapods](https://img.shields.io/cocoapods/v/ViewControllerNavigator.svg?style=flat)](https://cocoapods.org/pods/ViewControllerNavigator)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
![Swift](https://img.shields.io/badge/Swift-4.1-orange.svg)
[![GitHub license](https://img.shields.io/badge/license-MIT-lightgrey.svg?style=flat)](https://raw.githubusercontent.com/k-lpmg/ViewControllerNavigator/master/LICENSE)

Moves to a specific ViewController in any iOS ViewStack situation.

## Introduction
![modally](https://user-images.githubusercontent.com/15151687/48996102-2ac4f100-f18e-11e8-9655-1bb91e7db226.gif)
![navigating](https://user-images.githubusercontent.com/15151687/48996144-51832780-f18e-11e8-9012-e03600602120.gif)
![page](https://user-images.githubusercontent.com/15151687/48996245-bb9bcc80-f18e-11e8-95ed-95c015721d96.gif)
![tabbar](https://user-images.githubusercontent.com/15151687/48996253-c2c2da80-f18e-11e8-9aa8-229a76ff31b6.gif)

## Usage

#### move to RootViewController
```swift
ViewControllerNavigator.moveRootViewController()
```

#### move to Specific ViewController
```swift
ViewControllerNavigator.move(TabBarController())
```

#### move to Specific ViewController Class
```swift
ViewControllerNavigator.move(TabBarController.self)
```

#### with Completion
```swift
ViewControllerNavigator.move(TabBarController.self) { (tabBarController) in
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
