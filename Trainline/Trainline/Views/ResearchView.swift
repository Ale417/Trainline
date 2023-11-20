//
//  ResearchView.swift
//  Trainline
//
//  Created by Alessia Previdente on 15/11/23.
//

import SwiftUI

struct CustomColor {
    static let DelftBlue = Color("Delft Blue")
    static let Teal = Color("Teal")
    static let LightGreen = Color("Light Green")
    static let WhiteSmokes = Color("White Smoke")
    
}

struct MainView: View {
    @State private var showSheet = false
    @State private var partenza:String = ""
    @State private var arrivo:String = ""
    @State private var Date_Departure = Date()
    @State private var Date_Arrival = Date()
    var body: some View {
        NavigationStack{
            VStack{
                CustomColor.WhiteSmokes
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
                        HStack{
                            Text("from:")
                                .foregroundColor(CustomColor.Teal)
                                .padding(.leading, 16.0)
                            TextField("Stazione di Partenza", text: $partenza)
                                .textInputAutocapitalization(.never)
                                .frame(height: 50)
                                .foregroundColor(.black)
                        }
                        .background(Rectangle())
                        .cornerRadius(15)
                        .foregroundColor(CustomColor.WhiteSmokes)
                        .padding(4.0)
                        
                        HStack{
                            Text("to:")
                                .foregroundColor(CustomColor.Teal)
                                .padding(.leading, 25.0)
                            TextField("Stazione di Arrivo", text: $arrivo)
                                .frame(height: 50)
                                .foregroundColor(.black)
                                .textInputAutocapitalization(.never)
                        }
                        .background(Rectangle())
                        .cornerRadius(15)
                        .foregroundColor(CustomColor.WhiteSmokes)
                        .padding(4.0)
                    }
                }
                
                VStack{
                    DatePicker(selection:$Date_Departure, label: { Text("Outbound")
                            .bold()
                        .foregroundColor(CustomColor.Teal)})
                    .padding()
                    Divider()
                    DatePicker(selection:$Date_Arrival, label: { Text("Return")
                            .bold()
                        .foregroundColor(CustomColor.Teal)})
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
                        .foregroundColor(.black)
                        .padding()
                    })
                    Divider()
                    NavigationLink(destination:{
                       AddPassengerView()
                    }, label: {
                        HStack(spacing:170.0){
                            Image(systemName: "ticket")
                                .resizable()
                                .frame(width: 30, height: 20)
                            HStack{
                                Text("Add discount code")
                                    .font(.subheadline)
                                
                                Image(systemName: "chevron.forward")
                            }
                        }
                        .foregroundColor(.black)
                        .padding()
                    })
                    
                    NavigationLink(destination:{
                        ListTrainView()
                    }, label: {
                        Text("Find times and prices")
                            .font(.title2)
                            .fontWeight(.bold)
                            .frame(height:50)
                            .padding(.horizontal, 40)
                            .foregroundColor(.white)
                            .background(CustomColor.Teal)
                            .cornerRadius(8)
                    })
                    .padding(.bottom, 250)
                }
            }
        }
    }
    
    struct OnBoardingView: View {
        @Environment(\.dismiss) var dismiss
        var body: some View {
            ZStack {
                
                
            }
        }
    }
}
    
    #Preview {
        MainView()
    }
    
