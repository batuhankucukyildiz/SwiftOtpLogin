//
//  RegisterView.swift
//  SwiftOtpLogin
//
//  Created by Batuhan Küçükyıldız on 26.08.2023.
//


import SwiftUI

struct RegisterView: View {
    @State var email  = ""
    @State var password  = ""
    let icons : [String] = ["facebook" ,"google" , "twitter"]

    var body: some View {
        VStack{
            HStack{
                Text("Hesap Oluştur").font(.title)
                    .fontWeight(.bold)
                Spacer()
                
            }.padding(.horizontal , 25)
                .padding(.top , 30)
            
            
            VStack(alignment: .leading, spacing: 15){
                Text("Email").font(.caption).fontWeight(.bold).foregroundColor(.gray)
                TextField("Email" , text: $email)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(5)
                    .shadow(color: Color.white.opacity(0.1), radius: 5 ,x: 0 ,  y:5)
                    .shadow(color: Color.white.opacity(0.08), radius: 5 ,x: 0 ,  y:-5)
                
                Text("Parola").font(.caption).fontWeight(.bold).foregroundColor(.gray)
                TextField("Parola" , text: $password)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(5)
                    .shadow(color: Color.white.opacity(0.1), radius: 5 ,x: 0 ,  y:5)
                    .shadow(color: Color.white.opacity(0.08), radius: 5 ,x: 0 ,  y:-5)
                
            }.padding(.horizontal , 25)
                .padding(.top , 25)
            
            Button(action: {}){
                Text("Kayıt Ol")
                    .font(.system(size:20))
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .frame(width: UIScreen.main.bounds.width - 50)
                    .background(
                        LinearGradient(gradient :Gradient(colors: [Color.blue , Color.purple]),
                                       startPoint: .trailing , endPoint: .leading))
                    .cornerRadius(10)
            
            }.padding(.horizontal ,25)
                .padding(.top ,20)
            
            HStack(spacing: 30){
                ForEach(icons, id: \.self){ icon in
                    Button(action : {}) {
                        Image(icon).renderingMode(.template)
                            .resizable()
                            .frame(width: 25 , height: 25)
                            .padding(.top)
                    }.padding(.horizontal, 20)
                        .padding(.vertical , 30)
                }
                
            }
            
        }
        
    }
}

struct Register_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()

    }
}
