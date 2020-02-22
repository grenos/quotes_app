//
//  Data.swift
//  quotesApp
//
//  Created by Vasileios Gkreen on 31/01/2020.
//  Copyright © 2020 Vasileios Gkreen. All rights reserved.
//

import SwiftUI
import UIKit

//fetch our JSON file in the quoteData Array that's expecting type of Quote(Model)
let quoteData: [Quote] = load("quotes.json")

//Call the function load from above
func load<T: Decodable>(_ filename: String, as type: T.Type = T.self) -> T {
//    Convert the file to Data type so we can use it in Swift
    let data: Data
    
    guard let file =
        Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't find \(filename) in main bundle:\n\(error).")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
