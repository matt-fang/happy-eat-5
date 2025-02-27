//
//  TransparentTextEntry.swift
//  happy-eat-5
//
//  Created by Matthew Fang on 2/26/25.
//

import SwiftUI

struct TransparentTextEntry: View {
    @Binding var text: String
    var placeholder: String
    
    var body: some View {
        TextField(placeholder, text: $text, axis: .vertical)
            .font(.system(size: 30, weight: .medium, design: .rounded))
            .cornerRadius(8)
    }
}
