//
//  Models.swift
//  Test
//
//  Created by Bora Erdem on 16.09.2022.
//

import Foundation

struct TurModel: Identifiable{
    let id = UUID().uuidString
    let title: String
    let image: String
}
