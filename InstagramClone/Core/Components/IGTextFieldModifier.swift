//
//  IGTextFieldModifier.swift
//  InstagramClone
//
//  Created by Long Tran M2 on 26/2/24.
//

import Foundation
import SwiftUI

struct IGTextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .padding(.horizontal,24)
    }
}
