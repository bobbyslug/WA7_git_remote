//
//  Package.swift
//  WA4_He_8274
//
//  Created by Christopher on 10/28/23.
//

import Foundation
import UIKit

public struct Package {
    var name: String?
    var email: String?
    var phone: Int?
    var phoneType: String?
    var address: String?
    var cityState: String?
    var zip: Int?
    var image: UIImage?
    
    init(name: String? = nil, email: String? = nil, phone: Int? = nil, phoneType: String? = nil, address: String? = nil, cityState: String? = nil, zip: Int? = nil, image: UIImage? = nil) {
        self.name = name
        self.email = email
        self.phone = phone
        self.phoneType = phoneType
        self.address = address
        self.cityState = cityState
        self.zip = zip
        self.image = image
    }
}
