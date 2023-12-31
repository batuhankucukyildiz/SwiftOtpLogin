//
//  CustomTextField.swift
//  SwiftOtpLogin
//
//  Created by Batuhan Küçükyıldız on 25.08.2023.
//

import SwiftUI


struct CustomTextField: View {
    let numberOfFields: Int
    @FocusState private var fieldFocus: Int?
    @State var enterValue: [String]
    @State var oldValue = ""
    
    init(numberOfFields: Int) {
        self.numberOfFields = numberOfFields
        self.enterValue = Array(repeating: "", count: numberOfFields)
    }
    
    var body: some View {
        HStack(spacing: 10) {
            ForEach(0..<numberOfFields, id: \.self) { index in
                TextField("", text: $enterValue[index], onEditingChanged: { editing in
                    if editing {
                        oldValue = enterValue[index]
                    }
                })
                    .keyboardType(.numberPad)
                    .frame(width: 48, height: 48)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(5)
                    .multilineTextAlignment(.center)
                    .focused($fieldFocus, equals: index)
                    .tag(index)
                    .onChange(of: enterValue[index]) { newValue in
                        if !newValue.isEmpty {
                            // Update to new value if there is already an value.
                            if enterValue[index].count > 1 {
                                let currentValue = Array(enterValue[index])
                                
                                // ADD THIS IF YOU DON'T HAVE TO HIDE THE KEYBOARD WHEN THEY ENTERED
                                // THE LAST VALUE.
                                // if oldValue.count == 0 {
                                //    enterValue[index] = String(enterValue[index].suffix(1))
                                //    return
                                // }
                                
                                if currentValue[0] == Character(oldValue) {
                                    enterValue[index] = String(enterValue[index].suffix(1))
                                } else {
                                    enterValue[index] = String(enterValue[index].prefix(1))
                                }
                            }
                            
                            // MARK: - Move to Next
                            if index == numberOfFields-1 {
                                // COMMENT IF YOU DON'T HAVE TO HIDE THE KEYBOARD WHEN THEY ENTERED
                                // THE LAST VALUE.
                                fieldFocus = nil
                            } else {
                                fieldFocus = (fieldFocus ?? 0) + 1
                            }
                        } else {
                            // MARK: - Move back
                            fieldFocus = (fieldFocus ?? 0) - 1
                        }
                    }
            }
        }
    }

}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(numberOfFields: 4)
    }
}
