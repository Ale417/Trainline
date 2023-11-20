//
//  ModalExampleView.swift
//  Trainline
//
//  Created by Alessia Previdente on 20/11/23.
//

import SwiftUI

struct ButtonView: View {
    @State private var showSheet = false
    @Binding var partenza:String
    var body: some View {
        ZStack{
            CustomColor.DelftBlue
                .ignoresSafeArea()
            
            ZStack{
                RoundedRectangle(cornerRadius: 15.0)
                    .frame(height: 50)
                    .foregroundColor(CustomColor.WhiteSmokes)
                HStack{
                    
                    Text("from:")
                        .foregroundColor(CustomColor.Teal)
                        .padding(.leading, 16.0)
                    Button("\(partenza)") {
                        showSheet.toggle()
                    }.font(.body)
                        .sheet(isPresented: $showSheet) {
                            ModalView()
                        }
                        .foregroundColor(.gray)
                }
                
            }
            
        }
        
    }
}

struct ModalView: View {
    @Environment(\.dismiss) var dismiss
    @State private var partenza:String = "Stazione di Partenza"
    @State private var arrivo:String = "Stazione di Partenza"
    var body: some View {
        VStack{
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
}




#Preview {
    ButtonView(partenza: .constant("Stazione di partenza"))
}
