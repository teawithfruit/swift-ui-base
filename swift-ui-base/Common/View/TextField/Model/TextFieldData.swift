//
//  TextFieldData.swift
//  swift-ui-base
//
//  Created by Germán Stábile on 3/11/20.
//  Copyright © 2020 Rootstrap. All rights reserved.
//

import Foundation

final class TextFieldData: ObservableObject, Identifiable {
  @Published var value: String = "" {
    didSet {
      hasTyped = hasTyped || !value.isEmpty
      validate()
    }
  }
  var validationType: ValidationType
  var errorMessage: String
  var title: String
  var isSecure = false
  @Published var hasTyped = false
  @Published var isValid = true
  
  var isEmpty: Bool {
    return value.isEmpty
  }
  
  init(title: String,
       value: String = "",
       validationType: ValidationType = .none,
       isSecure: Bool = false,
       errorMessage: String = "") {
    self.title = title
    self.value = value
    self.validationType = validationType
    self.errorMessage = errorMessage
    self.isSecure = isSecure
    validate()
  }
  
  func validate() {
    isValid = value.isValid(type: validationType)
  }
}
