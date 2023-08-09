//
//  StatView.swift
//  Statisztika
//
//  Created by Némedi János on 2023. 08. 01..
//

import Foundation
import SwiftUI
import Charts

struct StatView: View {
    
    @State var Stats: [InputData]
    
    var body: some View {
        NavigationStack{
            VStack{
                HStack{
                    Spacer()
                    Text(CatName + ":")
                        .fontWeight(.bold)
                    Spacer()
                    Text(UnitName + ":")
                        .fontWeight(.bold)
                    Spacer()
                }
                VStack{
                    ForEach(Stats) { stat in
                        HStack{
                            Spacer()
                            Text(stat.id)
                            Spacer()
                            Text(String(stat.Num))
                            Spacer()
                        }
                    }
                }
                .padding()
                HStack(alignment: .bottom, spacing: 12) {
                    Text("Charts")
                        .fontWeight(.semibold)
                    Spacer()
                    NavigationLink(destination: BarChart(Stats: Stats)){
                        Text("Bar Chart")
                    }
                    Spacer()
                    NavigationLink(destination: PieChart(Stats: Stats)){
                        Text("Pie Chart")
                    }
                    .pickerStyle(.segmented)
                    .padding(.leading, 20)
                }
                .padding()
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            .padding()
            .navigationTitle("Datas")
        }
    }
}
