//
//  ListTrainExample.swift
//  Trainline
//
//  Created by Alessia Previdente on 22/11/23.
//

import SwiftUI

struct ListTrainExample: View {
    
    let week = ["Mon", "Tue", "Wed", "Thur", "Fri", "Sat", "Sun"]
    var viewModels = TrainsViewModel()
    var body: some View {
        NavigationStack{
            VStack{
                ZStack{
                    Rectangle()
                        .frame(height: 290)
                        .foregroundStyle(CustomColor.DelftBlue)
                        .ignoresSafeArea()
                    
                    VStack(alignment:.leading){
                        HStack
                        {
                            Text("Napoli")
                                .bold()
                            Image(systemName: "arrow.forward")
                                .accessibilityHidden(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                            Text("Salerno")
                        }
                        .accessibilityElement(children: .combine)
                        .padding(.leading)
                        .foregroundColor(.white)
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack(spacing:25.0){
                                ForEach(week,id: \.self){day in
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 5.0)
                                            .foregroundColor(.white)
                                            .frame(width: 90.0, height:80.0)
                                        VStack{
                                            Text(day)
                                                .bold()
                                            Text("€8")
                                            Image(systemName: "magnifyingglass")
                                                .accessibilityHidden(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                        }
                                        .foregroundColor(CustomColor.DelftBlue)
                                    }
                                    .accessibilityElement(children: .combine)
                                }
                            }
                        }
                        .padding()
                    }
                    .padding(.top,-150)
                }
                ScrollView{
                    ForEach(viewModels.Trains){ train in
                        ZStack{
                            Rectangle()
                                .frame(width:500 , height:150)
                                .foregroundColor(CustomColor.WhiteSmokes)
                            VStack{
                                HStack(alignment:.top, spacing: 100){
                                    HStack{
                                        ZStack{
                                            Circle()
                                                .frame(width: 2, height: 2)
                                                .opacity(0)
                                                .accessibilityLabel(Text("Departure"))
                                                
                                            
                                            VStack(alignment:.leading){
                                                Text(train.TimeDeparture)
                                                    .font(.title2)
                                                    .bold()
                                                    .foregroundColor(.black)
                                                
                                                Text(train.Departure)
                                                    .foregroundColor(.gray)
                                            }
                                            .accessibilityElement(children: .combine)

                                        }
                                        Image(systemName: "arrow.forward")
                                            .foregroundColor(.gray)
                                            .accessibilityHidden(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                        
                                        ZStack {
                                            Circle()
                                                .frame(width: 2, height: 2)
                                                .opacity(0)
                                                .accessibilityLabel(Text("Arrival"))
                                            
                                            VStack{
                                                Text(train.TimeArrival)
                                                    .font(.title2)
                                                    .bold()
                                                    .foregroundColor(.black)
                                                Text(train.Arrival)
                                                    .foregroundColor(.gray)
                                            }
                                            .accessibilityElement(children: .combine)
                                        }
                                        
                                        
                                    }
                                    Text("€ \(train.Prices)")
                                        .font(.title3)
                                        .bold()
                                        .foregroundColor(CustomColor.DelftBlue)
                                    
                                }
                                Divider()
                                HStack{
                                    Image(systemName: "train.side.front.car")
                                        .accessibilityHidden(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                        .foregroundColor(.gray)
                                    Text(train.Durata)
                                        .foregroundColor(.gray)
                                }
                                .padding(.leading, -180)
                            }
                            .padding(.leading, -15)
                            .accessibilityElement(children: .combine)
                        }
                    }
                }
                .padding(.top,-150)
            }.navigationTitle("Choose Outbound")
            
        }
    }
}


#Preview {
    ListTrainExample()
}
