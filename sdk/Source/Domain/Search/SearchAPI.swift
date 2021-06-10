//
//  SearchAPI.swift
//  TouchTunes SDK
//
//  Created by Ney Moura on 10/06/21.
//

import Moya

enum SearchAPI {
    case search(term: String, country: String, media: String, entity: String, attribute: String, config: ITunesConfig)
}

extension SearchAPI: TargetType {
    var baseURL: URL {
        switch self {
        case .search(_, _, _, _, _, let config):
            return try! config.baseURL.asURL()
        }
    }
    
    var path: String {
        switch self {
        case .search:
            return "/search"
        }
    }
    
    var method: Method {
        switch self {
        case .search:
            return .get
        }
    }
    
    // TODO: Add sample data for testing
    var sampleData: Data {
        switch self {
        case .search:
            return Data()
        }
    }
    
    var task: Task {
        switch self {
        case .search(let term, let country, let media, let entity, let attribute, _):
            var parameters: [String: Any] = [:]
            parameters["term"] = term
            parameters["country"] = country
            parameters["media"] = media
            parameters["entity"] = entity
            parameters["attribute"] = attribute
            return .requestParameters(parameters: parameters, encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    var validationType: ValidationType {
        return .successCodes
    }
}
