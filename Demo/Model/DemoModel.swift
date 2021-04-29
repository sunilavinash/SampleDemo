//
//  ProfileModel.swift
//  IMA Awards
//
//  Created by Murugan on 22/02/20.
//  Copyright © 2020 WLMACAIR. All rights reserved.
//

import Foundation

struct DemoModel : Decodable
{
    var sectionData: [SectionModel]
    static func convertData() -> DemoModel? {
        let data = readLocalFile()!
        let model = try! JSONDecoder().decode(DemoModel.self, from: data)
        return model
    }
    static func readLocalFile() -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: "data",
                                                 ofType: "json"),
                let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print(error)
        }
        return nil
    }
}
struct SectionModel: Codable{
    let sectionName: String!
    var rowData: [RowModel]!
    var isSelected :Bool!
    var selectedDiscription :String!

    mutating func setDiscription(discription:String){
        selectedDiscription = discription
    }
    mutating func setSelected(selected:Bool){
        isSelected = selected
    }
}
struct RowModel: Codable{
    let rowName: String!
    let rowDiscription: String!
    var isSelected :Bool!
    mutating func setSelected(selected:Bool){
        isSelected = selected
    }
}

struct Observable<T> {
    typealias Observer = String
    
    private var handlers: [Observer: (T) -> Void] = [:]
    var value: T{
        didSet{
            handlers.forEach{$0.value(value)}
        }
    }
    init(_ value: T) {
        self.value = value
    }
    
    @discardableResult
        mutating func observeNext(_ handler: @escaping (T) -> Void) -> Observer {
            let key = UUID().uuidString as Observer
            handlers[key] = handler
            return key
        }

        mutating func remove(_ key: Observer) {
            handlers.removeValue(forKey: key)
        }
}
