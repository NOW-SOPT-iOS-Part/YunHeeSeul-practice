//
//  ItemModel.swift
//  34th-Sopt-Seminar
//
//  Created by 윤희슬 on 4/20/24.
//

import UIKit

struct ItemModel {
    let itemImg: UIImage
    let name: String
    let price: String
    var heartIsSelected: Bool
}

extension ItemModel {
    static func dummy() -> [ItemModel] {
        return [
            ItemModel(itemImg: .p1, name: "ㅇㅇㅇ", price: "22000원", heartIsSelected: false),
            ItemModel(itemImg: .p2, name: "ㅁㅁㅁ", price: "22000원", heartIsSelected: false),
            ItemModel(itemImg: .p3, name: "ㄹㄹㄹ", price: "22000원", heartIsSelected: false),
            ItemModel(itemImg: .p4, name: "ㅎㅎㅎ", price: "22000원", heartIsSelected: false),
            ItemModel(itemImg: .p5, name: "ㅁㄴㅇ", price: "22000원", heartIsSelected: false),
            ItemModel(itemImg: .p6, name: "ㄴㅇㄹ", price: "22000원", heartIsSelected: false),
            ItemModel(itemImg: .p7, name: "ㅈㄷㄱ", price: "22000원", heartIsSelected: false),
            ItemModel(itemImg: .p8, name: "ㅇㄴㄹ", price: "22000원", heartIsSelected: false),
            ItemModel(itemImg: .p9, name: "ㄹㄴㅇ", price: "22000원", heartIsSelected: false),
            ItemModel(itemImg: .p10, name: "ㅈㄷㄱ", price: "22000원", heartIsSelected: false),
            ItemModel(itemImg: .p1, name: "ㅎ롤ㅇ", price: "22000원", heartIsSelected: false)
        ]
    }
}

