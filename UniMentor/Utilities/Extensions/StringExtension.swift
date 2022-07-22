//
//  StringExtension.swift
//  UniMentor
//
//  Created by Son Minh Nguyen on 2022-07-21.
//

import Foundation

// reference: Yoonseo Jeong CSTP2305 Quiz7
extension String {
    
    /// check number of whitespaces
    /// parameter: string, number of whitespace wanted
    func hasMoreWhiteSpacesThan(_ count: Int) -> Bool {
        // check for whitespaces
        // reference: https://stackoverflow.com/questions/30993208/find-number-of-spaces-in-a-string-in-swift
        let spaceCount = self.reduce(0) { $1 == " " ? $0 + 1 : $0 }
        // check if number of whitespaces is not bigger than parameter count
        guard spaceCount > count else {
            return false
        }
        return true
    }

    /// check if string contains int
    /// parameter: string
    func hasInt() -> Bool {
        // check for int in string
        // reference: https://stackoverflow.com/questions/31790677/how-to-check-if-a-string-contains-an-int-swift
        let numberCharacters = NSCharacterSet.decimalDigits
        // check if string contains int
        guard self.rangeOfCharacter(from: numberCharacters) == nil else {
            return false
        }
        return true
    }

    /// check if string contains special character
    /// parameter: string
    func hasSpecialChar() -> Bool {
        // check for spectial characters
        // reference: https://stackoverflow.com/questions/36872825/prevent-special-characters-in-uitextfield
        let validString = CharacterSet(charactersIn: "!@#$%^&*()_+{}[]|\"<>,.~`/:;?-=\\¥'£•¢")
        // check if string contains special charactor
        guard self.rangeOfCharacter(from: validString) == nil else {
            return false
        }
        return true
    }
    
}

