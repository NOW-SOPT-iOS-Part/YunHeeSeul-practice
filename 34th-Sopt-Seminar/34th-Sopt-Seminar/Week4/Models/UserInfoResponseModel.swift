//
//  UserInfoResponseModel.swift
//  34th-Sopt-Seminar
//
//  Created by 윤희슬 on 4/27/24.
//

import Foundation

// MARK: - UserInfoResponseModel
struct UserInfoResponseModel: Codable {
    let code: Int
    let message: String
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let authenticationId, nickname, phone: String
}
