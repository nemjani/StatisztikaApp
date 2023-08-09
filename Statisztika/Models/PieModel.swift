//
//  PieModel.swift
//  Statisztika
//
//  Created by Némedi János on 2023. 08. 04..
//

import Foundation
import SwiftUI

struct PieModel: Identifiable {
    
    var id : String
    var Num : Int
    var color : Color
    
    init(raw:[String]) {
        self.id = raw[0]
        self.Num = Int(raw[1])!
        self.color = Color(raw[2])
    }
}
