//
//  ContentView.swift
//  Statisztika
//
//  Created by Némedi János on 2023. 07. 29..
//

import SwiftUI
import UniformTypeIdentifiers


var filePathURL = ""

struct ContentView: View {
    @State var fileName = "none"
    @State var filePath = ""
    @State var fileExt = "csv"
    @State var tmpExt = ""
    @State var openFile = false
    @State var saveFile = true
    @State var Stats: [InputData] = []
    
    var body: some View {
        ZStack {
            
            VStack {
                NavigationView{
                    VStack(spacing: 25) {
                        Text("Selected file: " + fileName)
                        
                        HStack {
                            Spacer()
                            
                            Button(action: {openFile.toggle()}, label: {
                                Text("Import file")
                            })
                            .buttonStyle(.bordered)
                            
                            if String(tmpExt) == "csv" {
                                Spacer()
                                
                                NavigationLink(destination: StatView(Stats: Stats )) {
                                    Text("Statistics")
                                        .padding()
                                        .foregroundColor(Color.blue)
                                        .frame(height: 32)
                                        .background(Color(.systemGray5))
                                        .cornerRadius(6)
                                }
                            }
                            
                            Spacer()
                        }
                        
                        if String(fileExt) != "csv" {
                            Text("You can only select CSV files")
                                .fontWeight(.bold)
                        }
                    }
                    .fileImporter(isPresented: $openFile, allowedContentTypes: [.data]) { (res) in
                        do {
                            let fileUrl = try res.get()
                            
                            if fileUrl.startAccessingSecurityScopedResource() {
                                do{
                                    //let fileUrl = try res.get()
                                    print(fileUrl)
                                    self.fileName = fileUrl.lastPathComponent
                                    self.fileExt = fileUrl.pathExtension
                                    self.tmpExt = fileUrl.pathExtension
                                    self.filePath = fileUrl.path
                                    filePathURL = filePath
                                    
                                    Stats = loadInputData()
                                }
                                catch{
                                    print("error reading file")
                                    print(error.localizedDescription)
                                }
                            }
                            
                            fileUrl.stopAccessingSecurityScopedResource()
                        } catch {
                            print("Error:", error.localizedDescription)
                        }
                    }
                }
            }
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
