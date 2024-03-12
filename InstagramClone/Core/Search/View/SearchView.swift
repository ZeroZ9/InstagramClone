//
//  SearchVoew.swift
//  InstagramClone
//
//  Created by Long Tran M2 on 23/2/24.
//

import SwiftUI

struct SearchView: View {
    
    @State private var searchText = ""
    @State var viewModel = SearchViewModel()
    
    var body: some View {
        NavigationStack{
            ScrollView {
                LazyVStack(spacing: 12) {
                    
                    ForEach(viewModel.users) { user in
                        
                        NavigationLink(value: user) {
                            HStack{
                                Image(systemName: "person.circle")
                                    .resizable()
                                    .scaledToFill()
                                    .foregroundStyle(.gray)
                                    .frame(width: 40, height: 40)
                                    .clipShape(Circle())
                                
                                VStack(alignment: .leading) {
                                    Text(user.username)
                                        .fontWeight(.semibold)
                                    if let fullname = user.fullname {
                                        Text(fullname)
                                    }
                                }
                                .font(.footnote)
                                
                                Spacer()
                            }
                            .padding(.horizontal)
                            .foregroundStyle(.black)
                        }
    
                    }
                }
                .padding(.top,8)
                .searchable(text: $searchText, prompt: "Search...")
            }
            .navigationDestination(for: User.self, destination: { user in
                ProfileView(user: user)
            })
            .navigationTitle("Explore")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    SearchView()
}
