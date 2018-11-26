# ViewControllerNavigatior
[![Cocoapods](https://img.shields.io/cocoapods/v/ViewControllerNavigator.svg?style=flat)](https://cocoapods.org/pods/ViewControllerNavigator)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
![Swift](https://img.shields.io/badge/Swift-4.1-orange.svg)
[![GitHub license](https://img.shields.io/badge/license-MIT-lightgrey.svg?style=flat)](https://raw.githubusercontent.com/k-lpmg/ViewControllerNavigator/master/LICENSE)

Moves to a specific ViewController in any iOS ViewStack situation.

## Introduction
### Modally
![modally](https://user-images.githubusercontent.com/15151687/48996478-9e1b3280-f18f-11e8-89be-c663f91ff74c.gif)

### Navigating
![navigating](https://user-images.githubusercontent.com/15151687/48996480-9f4c5f80-f18f-11e8-85b5-20f84d3414f6.gif)

### Page
![page](https://user-images.githubusercontent.com/15151687/48996481-a1162300-f18f-11e8-96aa-f0e66a0b4078.gif)

### TabBar
![tabbar](https://user-images.githubusercontent.com/15151687/48996534-d15dc180-f18f-11e8-830b-982abaf370f6.gif)

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
