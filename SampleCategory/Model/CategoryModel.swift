//
//  CategoryModel.swift
//  SampleCategory
//
//  Created by mtanaka on 2022/08/17.
//

import Foundation

struct CategoryModel {
    
    var image: String?
    var name: String?
    
    static func createModel() -> [CategoryModel] {
        return [
            
            CategoryModel(image: "すべて"),
            CategoryModel(image: "トップス"),
            CategoryModel(image: "インナー・ルームウェア"),
            CategoryModel(image: "アウトドア・レジャー用品"),
            CategoryModel(image: "ビジネス・フォーマル"),
            CategoryModel(image: "アウター"),
            
            CategoryModel(name: "すべて"),
            CategoryModel(name: "トップス"),
            CategoryModel(name: "インナー・ルームウェア"),
            CategoryModel(name: "アウトドア・レジャー用品"),
            CategoryModel(name: "ビジネス・フォーマル"),
            CategoryModel(name: "アウター")
        ]
    }
}
