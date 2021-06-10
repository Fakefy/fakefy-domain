//
//  ITunesConfig.swift
//  TouchTunes SDK
//
//  Created by Ney Moura on 10/06/21.
//

import Foundation
import Alamofire

class ITunesConfig {
    var baseURL: String { ITunesConfig.baseURL }
}

extension ITunesConfig {
    static let baseURL: String = "https://itunes.apple.com"
}
