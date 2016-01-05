//
//  SSN.swift
//  ssnField
//
//  Created by Sergey Sahakyan on 12/29/15.
//  Copyright © 2015 Sergey Sahakyan. All rights reserved.
//

import Foundation

public class SSN {
    var areaNumber: String = ""
    var groupCode: String = ""
    var serialNumber: String = ""
    
    init(areaNumber: String, groupCode: String, serialNumber: String) {
        self.areaNumber = areaNumber
        self.groupCode = groupCode
        self.serialNumber = serialNumber
    }
    
    // MARK: private methods
    private func isAreaNumberValid() -> Bool {
        guard let areaNumber = Int(self.areaNumber) else {
            return false
        }
        
        return areaNumber > 0 && areaNumber < 900 && areaNumber != 666
    }
    
    private func isGroupCodeValid() -> Bool {
        guard let groupCode = Int(self.groupCode) else {
            return false
        }
        
        return groupCode > 0 && groupCode < 100
    }
    
    private func isSerialNumberValid() -> Bool {
        guard let serialNumber = Int(self.serialNumber) else {
            return false
        }

        return serialNumber > 0  && serialNumber < 9999
    }
    
    // MARK: public methids
    public func isValid() -> Bool {
        return isAreaNumberValid() && isGroupCodeValid() && isSerialNumberValid()
    }
}
