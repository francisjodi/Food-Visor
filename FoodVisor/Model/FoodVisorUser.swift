//
//  FoodVisorUser.swift
//  FoodVisor
//
//  Created by Betram Lalusha on 23/04/2022.
//

import Foundation

struct FoodVisorUser: Hashable, Codable, Identifiable {
    var id: String
    var email: String
    var password: String
    var userName: String
    var profilePictureUrl: String?
}
