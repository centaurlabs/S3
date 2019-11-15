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
    
    public init(continuationToken: String? = nil, prefix: String? = nil) {
        self.continuationToken = continuationToken
        self.prefix = prefix
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
        
        return items
    }
    
    /// Coding keys
    enum CodingKeys: String, CodingKey {
        case listType = "list-type"
        case continuationToken = "ContinuationToken"
        case prefix = "Prefix"
    }
}
