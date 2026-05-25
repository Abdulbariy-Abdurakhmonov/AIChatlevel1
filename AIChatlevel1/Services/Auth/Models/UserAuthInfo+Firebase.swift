//
//  UserAuthInfo+Firebase.swift
//  AIChatlevel1
//
//  Created by Abdulboriy on 25/05/26.
//

import FirebaseAuth

extension UserAuthInfo {
    
    init(user: User) {
        self.uid = user.uid
        self.email = user.email
        self.isAnonymous = user.isAnonymous
        self.creationDate = user.metadata.creationDate
        self.lastSignInDate = user.metadata.lastSignInDate
    }
}
