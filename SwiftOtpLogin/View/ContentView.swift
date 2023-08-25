//
//  ContentView.swift
//  SwiftOtpLogin
//
//  Created by Batuhan Küçükyıldız on 25.08.2023.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        NavigationStack {
            
            Text("Enter the code sent to your phone")
                .foregroundColor(.gray)
                .padding(.vertical, 38)
            
            CustomTextField(numberOfFields: 4)
            
            Spacer()
            Button(action: {
    
            }){
                Text("Register")
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
                Button(action: {}){
                    Text("Try Again")
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                        
                }
            }
            }
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
