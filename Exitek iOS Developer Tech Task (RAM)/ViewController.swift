//
//  ViewController.swift
//  Exitek iOS Developer Tech Task (RAM)
//
//  Created by Дмитрий Скворцов on 05.09.2022.
//

import UIKit

class ViewController: UIViewController {
    var mobilePhone: MobilePhone?
    var newSet: Set<Mobile> = []

    override func viewDidLoad() {
        super.viewDidLoad()
        mobilePhone = MobilePhone()
        newSet = mobilePhone?.getAll() ?? []
        print(newSet)
    }
}
