//
//  Errors.swift
//  Exitek iOS Developer Tech Task (RAM)
//
//  Created by Дмитрий Скворцов on 05.09.2022.
//

import Foundation

enum MobileError: Error {
    case SetIsEmpty
    case CantDelete
    case CantFind
    case CantSave
    case NotUnique
}

extension MobileError: CustomStringConvertible {
    var description: String {
        switch self {
        case .SetIsEmpty: return "Set is empty"
        case .CantDelete: return "Can not delete the Mobile"
        case .CantFind: return "Can not find the Mobile"
        case .CantSave: return "Can not save the Mobile"
        case .NotUnique: return "the imei is not unique"
        }
    }
}
