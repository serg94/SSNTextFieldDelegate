//
//  SSNTextFieldDelegate.swift
//  ssnField
//
//  Created by Sergey Sahakyan on 12/29/15.
//  Copyright © 2015 Sergey Sahakyan. All rights reserved.
//

import Foundation
import UIKit

private extension NSRange {
    func toRange(string: String) -> Range<String.Index> {
        let startIndex = string.startIndex.advancedBy(location)
        let endIndex = startIndex.advancedBy(length)
        return startIndex..<endIndex
    }
}

class SSNTextFieldDelegate: NSObject, UITextFieldDelegate {
    private var ssn: String?
    
    func setSSN(textField: UITextField, ssn: String) {
        let length = textField.text?.characters.count ?? 1
        self.textField(textField, shouldChangeCharactersInRange: NSMakeRange(0, length), replacementString: ssn)
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        let str = (textField.text ?? "") as NSString
        var result = str.stringByReplacingCharactersInRange(range, withString: string)
        
        result = result.stringByReplacingOccurrencesOfString("-", withString: "")
        let count = result.characters.count
        
        if count <= 3 {
            textField.text = result
            return false
        }
        
        let areaRange = NSRange(location: 0, length: 3)
        let areaString = result.substringWithRange(areaRange.toRange(result))
        
        let groupRange = NSRange(location: 3, length: min(count - 3, 2))
        let groupString = result.substringWithRange(groupRange.toRange(result))
        
        if count <= 5 {
            textField.text = "\(areaString)-\(groupString)"
            return false
        }
        
        let serialRange = NSRange(location: 5, length: min(count - 5, 4))
        let serialString = result.substringWithRange(serialRange.toRange(result))
        
        textField.text = "\(areaString)-\(groupString)-\(serialString)"
        
        if textField.text?.characters.count == 11 {
            self.ssn = textField.text
        }
        
        return false
    }
    
    func getSSN() -> SSN? {
        guard self.ssn?.characters.count == 11 else {
            return nil;
        }
        
        let ssnParts = ssn!.componentsSeparatedByString("-")
        
        guard ssnParts.count == 3 else {
            return nil
        }
        
        return SSN(areaNumber: ssnParts[0], groupCode: ssnParts[1], serialNumber: ssnParts[2])
    }
}
