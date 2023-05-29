//
//  ProfileDataFormViewModel.swift
//  TwitterClone
//
//  Created by Md Shohidur Rahman on 5/29/23.
//

import Foundation
import Combine

final class ProfileDataFormViewViewModel: ObservableObject {
    
    @Published var displayName: String?
    @Published var username: String?
    @Published var bio: String?
    @Published var avatarPath: String?
}
