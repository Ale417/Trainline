//
//  ListTrainView.swift
//  Trainline
//
//  Created by Alessia Previdente on 17/11/23.
//

import SwiftUI

struct ListTrainView: View {
    let week = ["Mon", "Tue", "Wed", "Thur", "Fri", "Sat", "Sun"]
    
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
                            Text("Patenza")
                                .bold()
                            Image(systemName: "arrow.forward")
                            Text("Arrivo")
                        }
                        .padding(.leading)
                        .foregroundColor(.white)
                        ScrollView(.horizontal, showsIndicators: false){
                            HStack(spacing:25.0){
                                ForEach(week,id: \.self){day in
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 5.0)
                                            .stroke(.white, lineWidth: 5)
                                            .frame(width: 90.0, height:80.0)
                                        VStack{
                                            Text(day)
                                                .bold()
                                            Text("4$")
                                        }
                                        .foregroundColor(CustomColor.WhiteSmokes)
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
                                .frame(width:500 , height:200)
                                .foregroundColor(CustomColor.WhiteSmokes)
                            VStack{
                                HStack{
                                    Text("Orario Partenza")
                                    Image(systemName: "arrow.forward")
                                    Text("Orario Arrivo")
                                }
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
