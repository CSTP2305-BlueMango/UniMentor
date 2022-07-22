//
//  CustomError.swift
//  UniMentor
//
//  Created by Son Minh Nguyen on 2022-06-30.
//

import Foundation

enum CustomError: Error {
    case form(field: String? = nil, message: String? = nil)
}

