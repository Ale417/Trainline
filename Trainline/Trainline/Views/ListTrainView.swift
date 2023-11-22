//
//  ListTrainView.swift
//  Trainline
//
//  Created by Alessia Previdente on 17/11/23.
//

import SwiftUI
import SwiftData

struct ListTrainView: View {
    
    let week = ["Mon", "Tue", "Wed", "Thur", "Fri", "Sat", "Sun"]
    
//    @Query var CorseTreni: [TrainData]

    var body: some View {
        NavigationStack{
            VStack{
                ZStack{
                    Rectangle()
                        .frame(height: 290)
                        .foregroundStyle(CustomColor.DelftBlue)
                        .ignoresSafeArea()
                    
                    
                    VStack(alignment:.leading){
                        HStack{
////                            Text(CorseTreni[0].Departure)
//                                .bold()
//                            Image(systemName: "arrow.forward")
////                            Text(CorseTreni[0].Arrival)
                        }
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
                                            Text("4$")
                                            Image(systemName: "magnifyingglass")
                                        }
                                        .foregroundColor(CustomColor.DelftBlue)
                                    }
                                }
                            }
                        }
                        .padding()
                    }
                    .padding(.top,-150)
                }
                ScrollView{
                    ForEach(1..<11){ n in
                        ZStack{
                            Rectangle()
                                .frame(width:500 , height:150)
                                .foregroundColor(CustomColor.WhiteSmokes)
                            HStack(alignment:.top, spacing: 100){
                                HStack{
                                    Text("16:14")
                                        .font(.title2)
                                        .bold()
                                    Image(systemName: "arrow.forward")
                                        .foregroundColor(.gray)
                                    Text("19:42")
                                        .font(.title2)
                                        .bold()
                                }
                                Text("€104.69")
                                    .font(.title3)
                                    .bold()
                            }
                            
                        }
                    }
                }
                .padding(.top,-150)
            } .navigationTitle("Choose Outbound")
                
        }
    }
}

#Preview {
    ListTrainView()
}
