//
//  Extentions.swift
//  ToDo
//
//  Created by Ash Kumar on 2024-03-04.
//

import Foundation

extension Encodable{
    func asDictionary() -> [String: Any]{
        
        guard let data = try? JSONEncoder().encode(self) else {
            return [:]
        }
        
        do {
            let json = try JSONSerialization.jsonObject(with: data) as? [String: Any]
            return json ?? [:]
        } catch {
            return [:]
        }
        
    }
}
