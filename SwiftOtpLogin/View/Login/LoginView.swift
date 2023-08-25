//
//  LoginView.swift
//  SwiftOtpLogin
//
//  Created by Batuhan Küçükyıldız on 25.08.2023.
//

import SwiftUI
import AlertToast

struct LoginView: View {
    @State var password = ""
    @State var username = "Batuhan"
    @State private var isRiveViewVisible = false
    @State private var isLogged = false // Giriş yapıldı mı kontrolü
    @State private var emptyInputAlert = false
    let icons : [String] = ["facebook" ,"google" , "twitter"]
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    VStack(alignment: .leading ,spacing: 12 ){
                        Text("Tekrar Merhaba")
                            .fontWeight(.bold)
                        Text("Batuhan")
                            .font(.title)
                            .fontWeight(.bold)

                        Button(action: {}){
                            Text("Bu ben değilim 🧐")
                                .font(.system(size:14))
                            
                        }
                    }.padding(.leading ,20)
                        .padding(.top ,40)
                    Spacer()
                    Image("DefaultPhoto")
                        .resizable()
                        .aspectRatio(contentMode : .fill)
                        .frame(width: 100 ,height: 100)
                        .clipShape(Circle())
                        .padding(.trailing , 20)
                        .padding(.top , 20)
                }.padding(.top , 40)
                VStack(alignment: .leading ,spacing: 15){
                    Text("Parola")
                        .fontWeight(.thin)
                        .font(.system(size:15))
                    
                    SecureField("Parola", text: $password).padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(5)
                        .shadow(color: Color.black.opacity(0.1), radius: 5 ,x: 0 ,  y:5)
                        .shadow(color: Color.black.opacity(0.08), radius: 5 ,x: 0 ,  y:-5)
                    
                    Button(action: {}) {
                        Text("Parolamı Unuttum").font(.system(size:15))
                    }.padding(.top ,10)
                }.padding(.horizontal ,25)
                    .padding(.top,25)
                
                Button(action: {
                    let user = LoginViewModel(username: username , password: password)
                                       user.login { isLogin in
                                           if(isLogin){isLogged = true}
                                       }
                                       
                }){
                    Text("Oturum Aç")
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
                            .padding(.vertical , 20)
                    }
                    
                }
              
            }//V
            
            
           
        }.fullScreenCover(isPresented: $isLogged) {
            ContentView() // MainScreenView tam ekran olarak açılır
            
        }
        .toast(isPresenting: $emptyInputAlert){

            // `.alert` is the default displayMode
            //AlertToast(displayMode: .hud, type: .systemImage("xmark", .white), style: .style(backgroundColor: .black))

            //Choose .hud to toast alert from the top of the screen
            //AlertToast(displayMode: .hud, type: .regular, title: "Message Sent!")
            
            //Choose .banner to slide/pop alert from the bottom of the screen
            AlertToast(displayMode: .banner(.slide), type: .regular, title: "shouldbetextfieldfull-string")
        }
       
        
    }
    
    
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        
        LoginView()

        
    }
}
