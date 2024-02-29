//
//  ContentView.swift
//  InstagramClone
//
//  Created by Long Tran M2 on 20/2/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ContentViewModel()
    @StateObject var registrationViewModel = RegistrationViewModel()
    
    var body: some View {
        Group {
            if viewModel.userSession == nil {
                LoginView()
                    .environmentObject(registrationViewModel)
            } else {
                MainTabView()
            }
        }
    }
}

#Preview {
    ContentView()
}
