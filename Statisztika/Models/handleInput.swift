//
//  handleInput.swift
//  Statisztika
//
//  Created by Némedi János on 2023. 08. 01..
//

import Foundation
import SwiftUI

func cleanRows(file: String) -> String {
    var cleanFile = file
    cleanFile = cleanFile.replacingOccurrences(of: "\r", with: "\n")
    cleanFile = cleanFile.replacingOccurrences(of: "\n\n", with: "\n")
    
    return cleanFile
}

func loadInputData() -> [InputData] {
    var inputToStruct = [InputData]()
    var dataString = ""
    
    do {
        dataString = try String(contentsOfFile: filePathURL)
    } catch {
        print(error)
        return []
    }
    
    //clean
    dataString = cleanRows(file: dataString)
    
    //split into an array
    var rows = dataString.components(separatedBy: "\n")
    
    //remove the header
    rows.removeFirst()
    
    CatName = rows.first!
    CatName = String(String(CatName).dropLast())
    rows.removeFirst()
    
    UnitName = rows.first!
    UnitName = String(String(UnitName).dropLast())
    rows.removeFirst()
    
    for row in rows {
        let inputColums = row.components(separatedBy: ",")
        if inputColums.count == rows.first?.components(separatedBy: ",").count {
            let linesStruct = InputData.init(raw: inputColums)
            inputToStruct.append(linesStruct)
        }
    }
    
    return inputToStruct
}



