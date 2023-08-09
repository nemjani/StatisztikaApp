//
//  BarChart.swift
//  Statisztika
//
//  Created by Némedi János on 2023. 08. 03..
//

import Foundation
import SwiftUI
import Charts

struct BarChart : View {
    
    @State var Stats: [InputData]
    
    var body: some View {
        VStack{
            AnimatedChart()
        }
        .padding()
        .navigationTitle("Bar Chart")
    }
    
    
    @ViewBuilder
    func AnimatedChart()->some View{
        let max = Stats.max() { item1, item2 in
            return item2.Num > item1.Num
        }?.Num ?? 0
        
        //let myColor: Color = .random
        
        Chart{
            ForEach(Stats) { stat in
                BarMark(x: .value(CatName, stat.id),
                        y: .value(UnitName, stat.animate ? stat.Num : 0)
                )
                .annotation {
                    Text("\(stat.Num)")
                }
                
                .foregroundStyle(Color.mint)
            }
        }
        .chartYScale(domain: 0...(max + 10))
        .frame(height: 300)
        .onAppear {
            animateGraph()
        }
    }
    
    func animateGraph(forChange: Bool = false){
        for (index,_) in Stats.enumerated(){
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * (forChange ? 0.03 : 0.05)){
                withAnimation(forChange ? .easeOut(duration: 0.8) : .interactiveSpring(response: 0.8, dampingFraction: 0.8, blendDuration: 0.8)){
                    Stats[index].animate = true
                }
            }
        }
    }
    
    
    
    
    
}
