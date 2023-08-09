//
//  PieChart.swift
//  Statisztika
//
//  Created by Némedi János on 2023. 08. 03..
//

import Foundation
import SwiftUI
import Charts

struct PieChart: View {
    @State var Stats: [InputData]
    
    var body: some View {
        VStack{
            Canvas { context, size in
                let total = Stats.reduce(0) { $0 + $1.Num }
                context.translateBy(x: size.width / 2, y: size.height / 2)
                
                var pieContext = context
                pieContext.rotate(by: .degrees(90))
                
                let radius = min(size.width, size.height) * 0.45
                
                var startAngle = Angle.zero
                
                for stat in Stats {
                    let angle = Angle(degrees: 360 * (Double(stat.Num) / Double(total)))
                    
                    let endAngle = startAngle + angle
                    
                    let path = Path { p in
                        p.move(to: .zero)
                        p.addArc(center: .zero, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
                        p.closeSubpath()
                    }
                    pieContext.fill(path, with: .color(stat.color.opacity(0.6)))
                    pieContext.stroke(path, with: .color(Color.black), lineWidth: 2)
                    startAngle = endAngle
                }
            }
            HStack{
                Spacer()
                Text(CatName)
                    .fontWeight(.bold)
                //Spacer()
                Text(":")
                    .fontWeight(.bold)
                //Spacer()
                Text(UnitName)
                    .fontWeight(.bold)
                Spacer()
            }
            VStack {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
                    ForEach(Stats) { stat in
                        HStack{
                            Text(stat.id + ": " + String(stat.Num))
                                .foregroundColor(stat.color)
                        }
                    }
                }
            }
            Spacer()
        }
        .padding()
        .navigationTitle("Pie Chart")
    }
}

    




