//
//  AuthService.swift
//  InstagramClone
//
//  Created by Long Tran M2 on 27/2/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestoreSwift
import FirebaseFirestore

class AuthService {
    
    @Published var userSession: FirebaseAuth.User?
    
    static let shared = AuthService()
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    @MainActor
    func login(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
        } catch {
            print("DEBUG: Failed to log in user with error \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func createUser(email: String, password: String, username: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            print("DEBUG: did create user")
            await self.uploadUserData(uid: result.user.uid, username: username, email: email)
            print("DEBUG: did upload user data...")
        } catch {
            print("DEBUG: Failed to register user with error \(error.localizedDescription)")
        }
    }
    
    func loadUserData() async throws {
        
    }
    
    func signout() {
        try? Auth.auth().signOut()
        self.userSession = nil
    }
    
    private func uploadUserData(uid: String, username: String, email: String) async {
        let user = User(id: uid, username: username, email: email)
        guard let encodeUser = try? Firestore.Encoder().encode(user) else { return }
        
        try? await Firestore.firestore().collection("users").document(user.id).setData(encodeUser)
    }
}
