//
//  ModalExampleView.swift
//  Trainline
//
//  Created by Alessia Previdente on 20/11/23.
//

import SwiftUI

struct ButtonView: View {
    @State private var isModalPresented = false
    @Binding var partenza:String
    var body: some View {
        Button("Show Full-Screen Modal") {
            isModalPresented.toggle()
        }
        .fullScreenCover(isPresented: $isModalPresented) {
            ModalView(isModalPresented:self.$isModalPresented)
        }.frame(maxWidth: .infinity, maxHeight: .infinity).background(CustomColor.WhiteSmokes)
    }
}


struct ModalView: View {
    @Environment(\.modelContext) var ModelContext
    @Environment(\.dismiss) var dismiss
    @Binding var isModalPresented:Bool
    @State private var focused:Bool = false
    @State private var partenza:String = ""
    @State private var arrivo:String = ""
    var body: some View {
        VStack{
            HStack(spacing:250){
            
                Button("Cancel") {
                    self.isModalPresented.toggle()
                }
                .fontWeight(.bold)
                .font(.system(size: 20))
            }
            VStack{
                HStack{
                    Text("from:")
                        .foregroundColor(CustomColor.Teal)
                        .padding(.leading, 30.0)
                        .font(.system(size: 20))
                    TextField("Stazione di Partenza", text: $partenza)
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                        .frame(height: 50)
                        .foregroundColor(.black)
                        .font(.system(size: 20))
                }
                .background(Rectangle())
                .cornerRadius(12)
                .foregroundColor(CustomColor.WhiteSmokes)
        
                HStack{
                    Text("to:")
                        .font(.system(size: 20))
                        .foregroundColor(CustomColor.Teal)
                        .padding(.leading, 50.0)
                    TextField("Stazione di Arrivo", text: $arrivo)
                        .frame(height: 50)
                        .font(.system(size: 20))
                        .foregroundColor(.black)
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                }
                .background(Rectangle())
                .cornerRadius(12)
                .foregroundColor(CustomColor.WhiteSmokes)
                
            }
            .padding(.leading)
            
            ScrollView{
                VStack(alignment:.leading, spacing: 25.0){
                    Text("Suggested Stations")
                        .font(.title2)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    
                    HStack{
                        HStack{
                            Image(systemName: "sparkles")
                            VStack(alignment:.leading){
                                Text("Firenze Santa Maria Novella ")
                                Text("Firenze ")
                            }
                            .padding(.trailing, 180)
                        }
                        Text("IT")
                            .foregroundStyle(.gray)
                    }
                    HStack{
                        HStack{
                            Image(systemName: "sparkles")
                            VStack(alignment:.leading){
                                Text("Pisa Centrale")
                                Text("Pisa")
                            }
                        }
                        .padding(.trailing, 190)
                        Text("IT")
                            .foregroundStyle(.gray)
                    }
                    HStack{
                        HStack{
                            Image(systemName: "sparkles")
                            VStack(alignment: .leading){
                                Text("Milano Centrale")
                                Text("Milano")
                            }
                        }.padding(.trailing, 169)
                        Text("IT")
                            .foregroundStyle(.gray)
                    }
                    
                }
                .font(.system(size: 20))
                
                VStack(alignment:.leading, spacing: 25.0){
                    Text("Recent Stations")
                        .font(.title2)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    
                    HStack{
                        HStack{
                            Image(systemName: "timer")
                            VStack(alignment:.leading){
                                Text("Napoli Centrale")
                                Text("Napoli")
                            }
                            .padding(.trailing, 170)
                        }
                        Text("IT")
                            .foregroundStyle(.gray)
                    }
                    HStack{
                        HStack{
                            Image(systemName: "timer")
                            VStack(alignment:.leading){
                                Text("Santa Maria Capua Vetere")
                                Text("SMCV")
                            }
                        }
                        .padding(.trailing, 185)
                        Text("IT")
                            .foregroundStyle(.gray)
                    }
                    HStack{
                        HStack{
                            Image(systemName: "timer")
                            VStack(alignment:.leading){
                                Text("Capua")
                                Text("Capua")
                            }
                        }.padding(.trailing, 245)
                        Text("IT")
                            .foregroundStyle(.gray)
                    }
                    
                }
                .padding(.top, 25)
                .font(.system(size: 20))
            }
        }
    }
}

#Preview {
ModalView(isModalPresented:.constant(false))
//ButtonView(partenza: .constant("Stazione di partenza"))
    
}
