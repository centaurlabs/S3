//
//  ListInfo.swift
//  S3
//
//  Created by Zachary Rausnitz on 11/14/19.
//

public struct ListInfo: Content {
    private let listType: String = "2"
    public let continuationToken: String?
    public let prefix: String?
    public let startAfter: String?
    public let maxKeys: Int?
    
    public init(continuationToken: String? = nil, prefix: String? = nil, startAfter: String? = nil, maxKeys: Int? = nil) {
        self.continuationToken = continuationToken
        self.prefix = prefix
        self.startAfter = startAfter
        self.maxKeys = maxKeys
    }
    
    public static var `default`: ListInfo {
        return ListInfo()
    }
    
    public var urlQueryItems: [URLQueryItem] {
        var items: [URLQueryItem] = [URLQueryItem(name: CodingKeys.listType.rawValue, value: listType)]
        
        if let continuationToken = continuationToken {
            items.append(URLQueryItem(name: CodingKeys.continuationToken.rawValue, value: continuationToken))
        }
        
        if let prefix = prefix {
            items.append(URLQueryItem(name: CodingKeys.prefix.rawValue, value: prefix))
        }
        
        if let startAfter = startAfter {
            items.append(URLQueryItem(name: CodingKeys.startAfter.rawValue, value: startAfter))
        }
        
        if let maxKeys = maxKeys {
            items.append(URLQueryItem(name: CodingKeys.maxKeys.rawValue, value: String(maxKeys)))
        }
        
        return items
    }
    
    /// Coding keys
    enum CodingKeys: String, CodingKey {
        case listType = "list-type"
        case continuationToken = "continuation-token"
        case startAfter = "start-after"
        case prefix
        case maxKeys = "max-keys"
    }
}