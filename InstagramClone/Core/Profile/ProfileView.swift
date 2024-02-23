//
//  ProfileView.swift
//  InstagramClone
//
//  Created by Long Tran M2 on 20/2/24.
//

import SwiftUI

struct ProfileView: View {
    
    private let gridItems: [GridItem] = [
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1),
        .init(.flexible(), spacing: 1)
    ]
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack {
                    // HEADER
                    VStack(spacing: 12) {
                        
                        // pic and stat
                        HStack {
                            Image("doremon")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 80, height: 80)
                                .clipShape(Circle())
                            
                            Spacer()
                            
                            HStack(spacing: 8){
                                UserStatView(value: 3, title: "Posts")
                                
                                UserStatView(value: 12, title: "Followers")
                                
                                UserStatView(value: 3, title: "Following")
                            }
                        }
                        .padding(.horizontal)
                        
                        // name and bio
                        VStack(alignment: .leading) {
                            Text("Long Tran")
                                .font(.footnote)
                                .fontWeight(.semibold)
                            
                            Text("Wakanda Forever")
                                .font(.footnote)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                        
                        // action button
                        Button(action: {}, label: {
                            Text("Edit Profile")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .frame(width: 360, height: 32 )
                                .foregroundStyle(.black)
                                .overlay(RoundedRectangle(cornerRadius: 6).stroke(.gray, lineWidth: 1))
                        })
                        
                        Divider()
                    }
                    
                    // POST GRID VIEW
                    LazyVGrid(columns: gridItems, spacing: 1 ,content: {
                        Image("doremon")
                            .resizable()
                            .scaledToFit()
                        
                        Image("doremon1")
                            .resizable()
                            .scaledToFit()
                        
                        Image("doremon1")
                            .resizable()
                            .scaledToFit()
                    })
                }
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundStyle(.black)
                    })
                }
            })
        }
    }
}

#Preview {
    ProfileView()
}
