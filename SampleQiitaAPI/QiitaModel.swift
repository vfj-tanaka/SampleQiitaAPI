//
//  Model.swift
//  SampleQiitaAPI
//
//  Created by mtanaka on 2022/08/29.
//

import Foundation

struct QiitaModel: Decodable {
    var title: String?
    var user: QiitaUser
    var url: String?
}

struct QiitaUser: Decodable {
    
    var profileImageUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case profileImageUrl = "profile_image_url"
    }
}
