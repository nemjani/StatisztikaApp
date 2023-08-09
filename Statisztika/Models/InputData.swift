//
//  InputData.swift
//  Statisztika
//
//  Created by Némedi János on 2023. 08. 01..
//

import Foundation
import SwiftUI

public var CatName = ""
public var UnitName = ""

struct InputData: Identifiable {
    
    var id : String
    var Num : Int
    var color : Color = .random
    var animate: Bool = false
    
    init(raw:[String]) {
        self.id = raw[0]
        self.Num = Int(raw[1])!
    }
}


extension Color {
    static var random: Color {
        let rnd1 = Double.random(in: 10...245)
        let rnd2 = Double.random(in: 10...245)
        let rnd3 = Double.random(in: 10...245)

        let rndColor = Color(red: rnd1/255, green: rnd2/255, blue: rnd3/255)
        return rndColor
    }
}
