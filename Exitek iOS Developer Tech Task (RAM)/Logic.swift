//
//  Logic.swift
//  Exitek iOS Developer Tech Task (RAM)
//
//  Created by Дмитрий Скворцов on 05.09.2022.
//

/*

Task

Implement mobile phone storage protocol

Requirements:
- Mobiles must be unique (IMEI is an unique number)
- Mobiles must be stored in memory

*/

import Foundation

protocol MobileStorage {
    func getAll() -> Set<Mobile>
    func findByImei(_ imei: String) -> Mobile?
    func save(_ mobile: Mobile) throws -> Mobile
    func delete(_ product: Mobile) throws
    func exists(_ product: Mobile) -> Bool
}

class MobilePhone: MobileStorage {
    var setOfMobiles: Set<Mobile> = []

    func getAll() -> Set<Mobile> {
        setOfMobiles = LocalStorage.shared.mobilesStorageSet
        print(setOfMobiles)
        return setOfMobiles
    }

    func findByImei(_ imei: String) -> Mobile? {
        let imeiArray = Array(imei)
        switch imeiArray.count {
        case 15:
            print("You have entered imei: \(imei)")
        default:
            print("Sorry, enter imei that contains 15 numbers and try again")
            return nil
        }

        var mobile: Mobile = Mobile(imei: imei, model: "")
        var foundMobile: Set<Mobile> = []
        for i in getAll() {
            if i.imei == imei {
                foundMobile = getAll().filter({$0.imei == mobile.imei})
                for i in foundMobile {
                    mobile = Mobile(imei: i.imei, model: i.model)
                    print("Success! Found mobile imei: \(mobile)")
                    return mobile
                }
            }
        }

        for i in foundMobile {
            mobile = Mobile(imei: i.imei, model: i.model)
            print("Sucess! Found mobile imei: \(mobile)")
            return mobile
        }
        print("Sorry... Cant find mobile imei: \(imei)")
        return nil
    }

    func save(_ mobile: Mobile) throws -> Mobile {
        do {
            let mobileCheck = findByImei(mobile.imei)
            if mobileCheck?.imei != mobile.imei {
                switch exists(mobile) {
                case false:
                    let newMobile = Mobile(imei: mobile.imei, model: mobile.model)
                    print("\(mobile) is unique and has been saved")
                    return newMobile
                case true:
                    throw MobileError.NotUnique
                }
            }
        } catch {
            print("Something goes wrong")
        }
        return mobile
    }

    func delete(_ product: Mobile) throws {
        do {
            if exists(product) {
                let deletedProducts: Set<Mobile> = setOfMobiles.filter({$0 != product})
                setOfMobiles.removeAll()
                setOfMobiles = deletedProducts
                print("\(product) has been deleted")
                print("Set: \(setOfMobiles)")
                return
            } else {
                throw MobileError.CantDelete
            }
        } catch {
            print("Error. Can't delete \(product)")
        }
    }

    func exists(_ product: Mobile) -> Bool {
        let mobileCheck = findByImei(product.imei)
        if mobileCheck?.imei != product.imei {
            print("\(product) doesn't exist")
            return false
        } else {
            print("\(product) exists")
            return true
        }
    }
}
