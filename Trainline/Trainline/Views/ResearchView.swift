//
//  ResearchView.swift
//  Trainline
//
//  Created by Alessia Previdente on 15/11/23.
//

import SwiftUI
import SwiftData

struct CustomColor {
    static let DelftBlue = Color("Delft Blue")
    static let Teal = Color("Teal")
    static let LightGreen = Color("Light Green")
    static let WhiteSmokes = Color("White Smoke")
}

struct MainView: View {
    @State private var isModalPresented = false
    @Binding var partenza:String
    @Binding var arrivo:String
    @State private var Date_Departure = Date()
    @State private var Date_Arrival = Date()
    @State var isSaved:Bool = false
    @State var cont:Int = 1
    @Environment(\.modelContext) var modelContext
    
    
    @Query var CorseTreni: [TrainData]
    var body: some View {
        NavigationStack{
            ZStack{
                CustomColor.WhiteSmokes
                VStack{
                    ZStack(){
                        Rectangle()
                            .frame(height: 270)
                            .foregroundStyle(CustomColor.DelftBlue)
                            .ignoresSafeArea()
                        
                        VStack{
                            Text("Live times & Tickets")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(CustomColor.WhiteSmokes)
                                .padding(.top, 0)
                            ZStack{
                                RoundedRectangle(cornerRadius: 15.0)
                                    .frame(height: 50)
                                    .foregroundColor(CustomColor.WhiteSmokes)
                                HStack(spacing:10.0){
                                    Text("from:")
                                        .foregroundColor(CustomColor.Teal)
                                    Button(isSaved==false ? "\(partenza)": "\(CorseTreni[0].Departure)") {
                                        isModalPresented.toggle()
                                    }
                                    .foregroundColor(.gray)
                                        .fullScreenCover(isPresented: $isModalPresented) {
                                            StationModalView(isModalPresented:self.$isModalPresented, isSaved: $isSaved)
                                        }
                                }
                                .padding(.leading, -180)
                                .font(.system(size: 18))
                                .accessibilityElement(children: .combine)
                            }
                            
                            ZStack{
                                RoundedRectangle(cornerRadius: 15.0)
                                    .frame(height: 50)
                                    .foregroundColor(CustomColor.WhiteSmokes)
                                HStack(spacing:10.0){
                                    Text("to:")
                                        .foregroundColor(CustomColor.Teal)
                                    Button(isSaved==false ? "\(arrivo)": "\(CorseTreni[0].Arrival)"){
                                        isModalPresented.toggle()
                                    }
                                    .foregroundColor(.gray)
                                     .fullScreenCover(isPresented: $isModalPresented) {
                                         StationModalView(isModalPresented:self.$isModalPresented, isSaved: $isSaved)
                                        }
                                     
                                }
                                .padding(.leading, -170)
                                .font(.system(size: 18))
                                .accessibilityElement(children: .combine)
                            }
                        }
                    }
                    
                    VStack{
                        DatePicker(selection:$Date_Departure, label: { Text("Outbound")
                                .bold()
                            .foregroundColor(CustomColor.Teal)})
                        .padding()
                        .accessibilityElement(children: .combine)
                            
                        Divider()
                        DatePicker(selection:$Date_Arrival, label: { Text("Return")
                                .bold()
                            .foregroundColor(CustomColor.Teal)})
                        .accessibilityElement(children: .combine)
                        .padding()
                        Divider()
                        NavigationLink(destination:{
                            AddPassengerView()
                        }, label: {
                            HStack(spacing:250.0){
                                Image(systemName: "person.fill")
                                    .resizable()
                                    .frame(width:20, height: 20, alignment: .center)
                                HStack{
                                    Text("1 Adult")
                                    Image(systemName: "chevron.forward")
                                }
                            }
                            .accessibilityHint(Text("Click to add a passenger"))
                            .foregroundColor(.black)
                            .padding()
                        })
                        Divider()
                        NavigationLink(destination:{
                            DiscountCodeView()
                        }, label: {
                            HStack(spacing:170.0){
                                Image(systemName: "ticket")
                                    .resizable()
                                    .frame(width: 30, height: 20)
                                HStack{
                                    Text("Add discount code")
                                        .font(.subheadline)
                                        .font(.system(size: 18))
                                
                                    Image(systemName: "chevron.forward")
                                }
                            }
                            .foregroundColor(.black)
                            .padding()
                        })
                        
                        NavigationLink(destination: ListTrainExample()) {
                            Text("Find times and prices")
                                .font(.title2)
                                .fontWeight(.bold)
                                .frame(height:50)
                                .padding(.horizontal, 40)
                                .foregroundColor(.white)
                                .background(CustomColor.Teal)
                                .cornerRadius(8)
                        }
                        .padding(.bottom, 250)
//                        .onTapGesture {
//                            modelContext.insert(Info(OrarioA: Date_Departure, OrarioB: Date_Arrival))
//                        }
                    }
                }
            }
        }
    }
}



struct StationModalView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.dismiss) var dismiss
    @Binding var isModalPresented:Bool
    @State private var focused:Bool = false
    @State var partenza:String = ""
    @State var arrivo:String = ""
    @Binding var isSaved:Bool
    
    
    @Query var CorseTreni: [TrainData]
    var body: some View {
        VStack{
            HStack(spacing:250){
                Button("Done"){
                    modelContext.insert(TrainData(Departure: partenza, Arrival: arrivo))
                    self.isModalPresented.toggle()
                    isSaved = true
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
                        .accessibilityHint(Text("Click to add Departure Station"))
                    TextField("", text: $partenza, prompt: Text("Departure Station")
                        .foregroundStyle(.gray))
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
                        .accessibilityHint(Text("Click to add Arrival Station"))
                    TextField("", text:$arrivo, prompt: Text("Arrival Station").foregroundStyle(.gray))
                        .frame(height: 50)
                        .font(.system(size: 20))
                        .foregroundColor(colorScheme == . dark ? .black: .black)
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
                                .accessibilityHidden(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
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
                                .accessibilityHidden(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
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
                                .accessibilityHidden(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
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
                                .accessibilityHidden(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
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
                                .accessibilityHidden(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
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
                                .accessibilityHidden(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
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
    MainView(partenza:.constant("Departure Station"), arrivo: .constant("Arrival Station"))
}

