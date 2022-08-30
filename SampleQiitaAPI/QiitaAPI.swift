//
//  QiitaAPI.swift
//  SampleQiitaAPI
//
//  Created by mtanaka on 2022/08/29.
//

import Foundation
import Moya

enum QiitaError: Error {
    case error
}

enum QiitaAPI {
    case user
}

extension QiitaAPI: TargetType {
    
    var baseURL: URL {
        guard let url = URL(string: "https://qiita.com/api/v2/") else { fatalError() }
        return url
    }
    
    var path: String {
        switch self {
        case .user: return "/items"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var headers: [String : String]? {
        return nil
    }
}
