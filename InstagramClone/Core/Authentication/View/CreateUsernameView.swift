//
//  CreateUsernameView.swift
//  InstagramClone
//
//  Created by Long Tran M2 on 26/2/24.
//

import SwiftUI

struct CreateUsernameView: View {
    
    @EnvironmentObject var viewModel: RegistrationViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Text("Create username")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
            
            Text("You'll use this email to sign in to your account")
                .font(.footnote)
                .foregroundStyle(.gray)
                .multilineTextAlignment(.center)
            
            TextField("Username", text: $viewModel.username)
                .textInputAutocapitalization(.never)
                .modifier(IGTextFieldModifier())
            
            NavigationLink {
                CreatePasswordView()
                    .navigationBarBackButtonHidden()
            } label: {
                Text("Next")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(minWidth: 360, minHeight: 44)
                    .background(Color(.systemBlue))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .padding(.vertical)
            
            Spacer()
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Image(systemName: "chevron.left")
                    .imageScale(.large)
                    .onTapGesture {
                        dismiss()
                    }
                
            }
        }
    }
}

#Preview {
    CreateUsernameView()
}
