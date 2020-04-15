//
//  JSONAdapter.swift
//  CRP
//
//  Created by Robert Mietelski on 27.08.2018.
//  Copyright © 2018 altconnect. All rights reserved.
//

import Foundation

open class JSONAdapter {

    // MARK: - Private attributes

    private var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970

        return decoder
    }

    private var encoder: JSONEncoder {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .secondsSince1970

        return encoder
    }

    // MARK: - Access methods

    public func decodeToArray<R: Decodable>(from json: Any) throws -> [R] {
        let data = try JSONSerialization.data(withJSONObject: json)
        let remoteList = try data.decoded(using: self.decoder) as [R]

        return remoteList
    }
    
    public func decodeToObject<R: Decodable>(from json: [String: Any]) throws -> R {
        let data = try JSONSerialization.data(withJSONObject: json)
        let object = try data.decoded(using: self.decoder) as R
        
        return object
    }

    public func encodeToJSON<R: Encodable>(from object: R) throws -> [String: Any] {
        if let json = try JSONSerialization.jsonObject(with: try object.encoded(using: self.encoder), options: []) as? [String: Any] {
            return json
        }
        return [:]
    }
    
    public func encodeToJSONArray<R: Encodable>(from array: [R]) throws -> Any {
        return try array.map { try JSONSerialization.jsonObject(with: try $0.encoded(using: self.encoder), options: []) }
    }
}
