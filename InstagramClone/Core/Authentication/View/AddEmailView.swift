//
//  AddEmailView.swift
//  InstagramClone
//
//  Created by Long Tran M2 on 26/2/24.
//

import SwiftUI

struct AddEmailView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: RegistrationViewModel
    //@Environment(RegistrationViewModel.self) var viewModel
    
    var body: some View {
        VStack {
            Text("Add your email")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)
            
            Text("You'll use this email to sign in to your account")
                .font(.footnote)
                .foregroundStyle(.gray)
                .multilineTextAlignment(.center)
            
            TextField("Enter your email", text: $viewModel.email)
                .textInputAutocapitalization(.never)
                .modifier(IGTextFieldModifier())
            
            NavigationLink {
                CreateUsernameView()
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
    AddEmailView()
}
