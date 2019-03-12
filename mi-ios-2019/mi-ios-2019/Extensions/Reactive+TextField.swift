//
//  Reactive+TextField.swift
//  mi-ios-2019
//
//  Created by Dominik Vesely on 12/03/2019.
//  Copyright © 2019 ČVUT. All rights reserved.
//

import Foundation
import ReactiveCocoa
import ReactiveSwift
import UIKit

infix operator <~> : BindingPrecedence

/// Binds given `property` to continousValues of given `textField`
public func <~> (property: MutableProperty<String?>, textField: UITextField) {
    textField.reactive.text <~ property.producer.observe(on: UIScheduler()).filter { [unowned textField] in textField.text != $0 }
    property <~ textField.reactive.continuousTextValues
}

/// Binds given `property` to continousValues of given `textField`
public func <~> (textField: UITextField, property: MutableProperty<String?>) {
    textField.reactive.text <~ property.producer.observe(on: UIScheduler()).filter { [unowned textField] in textField.text != $0 }
    property <~ textField.reactive.continuousTextValues
}

/// Binds given `property` to continousValues of given `textField`
/// If `textField` sends `nil` value then it is mapped to an empty string
public func <~> (property: MutableProperty<String>, textField: UITextField) {
    textField.reactive.text <~ property.producer.observe(on: UIScheduler()).filter { [unowned textField] in textField.text != $0 }
    property <~ textField.reactive.continuousTextValues.map { $0 ?? "" }
}

/// Binds given `property` to continousValues of given `textField`
/// If `textField` sends `nil` value then it is mapped to an empty string
public func <~> (textField: UITextField, property: MutableProperty<String>) {
    textField.reactive.text <~ property.producer.observe(on: UIScheduler()).filter { [unowned textField] in textField.text != $0 }
    property <~ textField.reactive.continuousTextValues.map { $0 ?? "" }
}

/// Binds given `property` to continousValues of given `textView`
public func <~> (property: MutableProperty<String?>, textView: UITextView) {
    textView.reactive.text <~ property.producer.observe(on: UIScheduler()).filter { [unowned textView] in textView.text != $0 }
    property <~ textView.reactive.continuousTextValues
}

/// Binds given `property` to continousValues of given `textView`
public func <~> (textView: UITextView, property: MutableProperty<String?>) {
    textView.reactive.text <~ property.producer.observe(on: UIScheduler()).filter { [unowned textView] in textView.text != $0 }
    property <~ textView.reactive.continuousTextValues
}

/// Binds given `property` to continousValues of given `textView`
/// If `textView` sends `nil` value then it is mapped to an empty string
public func <~> (textView: UITextView, property: MutableProperty<String>) {
    textView.reactive.text <~ property.producer.observe(on: UIScheduler()).filter { [unowned textView] in textView.text != $0 }
    property <~ textView.reactive.continuousTextValues.map { $0 ?? "" }
}

/// Binds given `property` to continousValues of given `textView`
/// If `textView` sends `nil` value then it is mapped to an empty string
public func <~> (property: MutableProperty<String>, textView: UITextView) {
    textView.reactive.text <~ property.producer.observe(on: UIScheduler()).filter { [unowned textView] in textView.text != $0 }
    property <~ textView.reactive.continuousTextValues.map { $0 ?? "" }
}
