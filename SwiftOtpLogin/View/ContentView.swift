//
//  ContentView.swift
//  SwiftOtpLogin
//
//  Created by Batuhan Küçükyıldız on 25.08.2023.
//

import SwiftUI
import AlertToast


struct ContentView: View {
    @State private var emptyInputAlert = false
    var body: some View {
        NavigationStack {
            
            Text("Enter the code sent to your phone")
                .foregroundColor(.gray)
                .padding(.vertical, 38)
            
            CustomTextField(numberOfFields: 4)
            
            Spacer()
            Button(action: {
                emptyInputAlert.toggle()
            }){
                Text("Login")
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
            
            HStack{
                Text("Didn't recieve code?")
                    .padding(.vertical)
                    .navigationTitle("Verify Phone")
                    .navigationBarTitleDisplayMode(.inline)
                Button(action: {
                   
                }){
                    Text("Try Again")
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                        
                }
             }
            }.toast(isPresenting: $emptyInputAlert){
                
                // `.alert` is the default displayMode
                //AlertToast(displayMode: .hud, type: .systemImage("xmark", .white), style: .style(backgroundColor: .black))

                //Choose .hud to toast alert from the top of the screen
                //AlertToast(displayMode: .hud, type: .regular, title: "Message Sent!")
                
                //Choose .banner to slide/pop alert from the bottom of the screen
                AlertToast(type: .complete(.green), title: "Login successful", subTitle: nil)

            }
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
