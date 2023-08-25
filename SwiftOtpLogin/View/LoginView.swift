//
//  LoginView.swift
//  SwiftOtpLogin
//
//  Created by Batuhan Küçükyıldız on 25.08.2023.
//

import SwiftUI


struct LoginView: View {
    @State var username : String  = ""
    @State var password : String  = ""
    @State private var isLogged = false // Giriş yapıldı mı kontrolü
    var body: some View {
        NavigationView {
            
            VStack{
                HStack{
                    
                    Text("Giriş Yap 🥳 ").font(.title)
                        .fontWeight(.bold)
                    Spacer()
                    
                }.padding(.horizontal , 25)
                    .padding(.top , 30)
                
                
                VStack(alignment: .leading, spacing: 15){
                    Text("Username").font(.caption).fontWeight(.bold).foregroundColor(.gray)
                    TextField("Username" , text: $username)
                        .padding()
                        .shadow(color: Color.white.opacity(0.1), radius: 5 ,x: 0 ,  y:5)
                        .shadow(color: Color.white.opacity(0.08), radius: 5 ,x: 0 ,  y:-5)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)

                    
                    Text("Parola").font(.caption).fontWeight(.bold).foregroundColor(.gray)
                    TextField("Parola" , text: $password)
                        .padding()
                        .shadow(color: Color.white.opacity(0.1), radius: 5 ,x: 0 ,  y:5)
                        .shadow(color: Color.white.opacity(0.08), radius: 5 ,x: 0 ,  y:-5)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)

                }.padding(.horizontal , 25)
                    .padding(.top , 25)
                
                Button(action: {
                   let user = LoginViewModel(username: username , password: password)
                    user.login { isLogin in
                        if(isLogin){isLogged = true}
                    }
                    
                }){
                    Text("Giriş Yap")
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
            }
            
        }.fullScreenCover(isPresented: $isLogged) {
            ContentView() // MainScreenView tam ekran olarak açılır
        }
    }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
