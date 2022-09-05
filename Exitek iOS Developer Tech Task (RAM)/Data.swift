//
//  Data.swift
//  Exitek iOS Developer Tech Task (RAM)
//
//  Created by Дмитрий Скворцов on 05.09.2022.
//

import Foundation

struct Mobile: Hashable {
    let imei: String
    let model: String
}

struct LocalStorage {
    static var shared = LocalStorage()
    var mobilesStorageSet: Set<Mobile> = [iPhone8, iPhoneXr]
}

let iPhone8 = Mobile(imei: "123456789123456", model: "iPhone 8")
let iPhoneXr = Mobile(imei: "987654321234567", model: "iPhone XR")
