//
//  LoginRegisterBindView.swift
//  SwiftOtpLogin
//
//  Created by Batuhan Küçükyıldız on 26.08.2023.
//

import SwiftUI

struct LoginRegisterBindView: View {
    @State var index : Int = 0
    @Namespace var name
    var body: some View {
        NavigationView {
            VStack{
                Image("Logo").resizable().aspectRatio(contentMode: .fill).frame(width: 70 , height: 70)
                    .cornerRadius(10)
                
                HStack(spacing : 0){
                    Button(action: {
                        withAnimation(.spring()){
                            index = 0
                        }
                    }) {
                        VStack{
                            Text("Giriş Yap").font(.system(size: 20))
                            
                                .fontWeight(.bold)
                                .foregroundColor(.gray)
                            
                            ZStack{
                                Capsule().fill(Color.gray.opacity(0.4))
                                    .frame(height: 5)
                                if index == 0 {
                                    Capsule().fill(Color.purple).frame(height: 5)
                                        .matchedGeometryEffect(id: "Tab", in: name)
                                }
                            }
                        }.padding(.leading)
                    }
                    
                    Button(action: {
                        withAnimation(.spring()){
                            index = 1
                        }
                    }) {
                        VStack{
                            Text("Kayıt Ol").font(.system(size: 20))
                                .fontWeight(.bold)
                                .foregroundColor(.gray)
                            
                            ZStack{
                                Capsule().fill(Color.gray.opacity(0.4))
                                    .frame(height: 5)
                                if index == 1 {
                                    Capsule().fill(Color.purple).frame(height: 5)
                                        .matchedGeometryEffect(id: "Tab", in: name)
                                }
                            }
                        }.padding(.trailing)
                    }
                }.padding(.top , 30)
                
                if index == 0 {
                    LoginView()
                }
                else{
                    RegisterView()
                }
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        LoginRegisterBindView()

    }
}
