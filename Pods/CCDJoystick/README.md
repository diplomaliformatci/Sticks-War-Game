# CCDJoystick

[![Version](https://img.shields.io/cocoapods/v/CCDJoystick.svg?style=flat)](http://cocoapods.org/pods/CCDJoystick)
[![License](https://img.shields.io/badge/license-MIT-blue.svg?style=flat)](http://cocoapods.org/pods/CCDJoystick)
[![Platform](https://img.shields.io/cocoapods/p/CCDJoystick.svg?style=flat)](http://cocoapods.org/pods/CCDJoystick)
[![Language](http://img.shields.io/badge/language-swift-orange.svg?style=flat
             )](https://developer.apple.com/swift/)

## What is it?

CCDJoystick is a Joystick for UIKit.

It is written in Swift 2 and uses `IBDesignable`, `IBInspectable` and Core Graphics.

## Installation

CDJoystick is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```
pod "CCDJoystick"
```

Alternatively, you can install it manually by copying the file `Pod/Classes/CCDJoystick.swift` into your project.


## Usage (Storyboards)

1. Drag a UIView into your storyboard.
2. Change the class of the UIView to `CCDJoystick`.
3. Customize your joystick using the inspector.

![alt tag](https://github.com/tzraikov/CCDJoystick/blob/master/Images/Storyboard.png)

## Usage (Programmatically)

1. Import the module:

    ```
    import CCDJoystick
    ```

2. Initialize an instance of `CDJoystick` using the constructor:

    ```
    let joystick = CCDJoystick()
    joystick.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
    joystick.backgroundColor = .clearColor()
    ```

3. Customize the joystick:

    ```
    joystick.substrateColor = .lightGrayColor()
    joystick.substrateBorderColor = .grayColor()
    joystick.substrateBorderWidth = 1.0
    joystick.stickSize = CGSize(width: 50, height: 50)
    joystick.stickColor = .darkGrayColor()
    joystick.stickBorderColor = .blackColor()
    joystick.stickBorderWidth = 2.0
    joystick.fade = 0.5
    ```

4. Setup the tracking handler to get velocity and angle data:
  
    ```
    joystick.trackingHandler = { (joystickData) -> () in
        self.objectView.center.x += joystickData.velocity.x
        self.objectView.center.y += joystickData.velocity.y
    }
    ```

5. Add the joystick to your view:

    ```
    view.addSubview(joystick)
    ```

## Author

Cole Dunsby, coledunsby@gmail.com

> modified by Tsvetan Raikov to support ObjC

## License

CCDJoystick is available under the MIT license. See the LICENSE file for more info.
