//
//  BaseResponse.swift
//  TouchTunes SDK
//
//  Created by Ney Moura on 10/06/21.
//

struct BaseResponse<T: Codable>: Codable {
    let resultCount: Int
    let results: [T]
    
    enum CodingKeys: String, CodingKey {
        case resultCount
        case results
    }
}
