//
//  ContactDetailsViewController.swift
//  WA4_He_8274
//
//  Created by Christopher on 10/6/23.
//

import UIKit
import Alamofire

class ContactDetailsViewController: UIViewController {
    let contactDetailsScreen = ContactDetailsView()
    let editContactController = EditContactViewController()
    let notificationCenter = NotificationCenter.default

    override func loadView() {
        view = contactDetailsScreen
        contactDetailsScreen.buttonDelete.addTarget(self, action: #selector(onButtonDeleteTapped), for: .touchUpInside)
        contactDetailsScreen.buttonEdit.addTarget(self, action: #selector(onButtonEditTapped), for: .touchUpInside)


    }

    @objc func onButtonDeleteTapped(){
        let alert = UIAlertController(title: "Stop!", message: "Are you sure you want to delete this contact?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: {(action: UIAlertAction!) in return}))
        alert.addAction(UIAlertAction(title: "Confirm", style: .default, handler: {(action: UIAlertAction!) in
            if let contact = self.contactDetailsScreen.labelContactName.text{
                //MARK: posting text to NotificationCenter...
                self.notificationCenter.post(
                    name: Notification.Name("deleteContact"),
                    object: contact)
                self.navigationController?.popViewController(animated: true)
            }else{
                //Alert invalid input...
            } }
            )
        )
        
        self.present(alert, animated: true)

    }
    
    @objc func onButtonEditTapped(){
        //do the validations...
        if let name = contactDetailsScreen.labelContactName.text,
           let email = contactDetailsScreen.labelEmail.text,
           let phone = contactDetailsScreen.labelPhone.text,
           let address = contactDetailsScreen.labelAddress.text,
           let cityState = contactDetailsScreen.labelCityState.text,
           let zip = contactDetailsScreen.labelZip.text{
            let uwPhone = phone.components(separatedBy: " ")
            let phoneNum = uwPhone[1]
            let phoneType: String? = String(uwPhone[2].dropLast())
            let uwEmail = email.components(separatedBy: " ")[1]
            if let phone = Int(phoneNum), let zip = Int(zip) {
                print("here")
                //The String 'phoneText' is successfully converted to an Int...
                let package = Package(name: name, email: uwEmail, phone: phone, phoneType: phoneType, address: address, cityState: cityState, zip: zip)
                editContactController.receivedPackage = package
                navigationController?.pushViewController(editContactController, animated: true)
            }else{
                //alert...
            }
        }
        else{
            //alert....
        }
    }
    
    @objc func notificationReceivedEditContact(notification: Notification){
        let newContact = notification.object as! Contact
        
        if let uwName = newContact.name{
            if !uwName.isEmpty{
                contactDetailsScreen.labelContactName.text = uwName
            }
        }
        if let uwEmail = newContact.email{
            if !uwEmail.isEmpty{
                contactDetailsScreen.labelEmail.text = "Email: \(uwEmail)"
            }
        }
        if let uwPhone = newContact.phone, let uwPhoneType = receivedPackage.phoneType {
            if !uwPhoneType.isEmpty {
                contactDetailsScreen.labelPhone.text = "Phone: \(uwPhone) (\(uwPhoneType))"
            }
        }
        if let uwAddress = newContact.address{
            if !uwAddress.isEmpty{
                contactDetailsScreen.labelAddress.text = uwAddress
            }
        }
        if let uwCityState = newContact.cityState{
            if !uwCityState.isEmpty{
                contactDetailsScreen.labelCityState.text = uwCityState
            }
        }
        if let uwZip = newContact.zip{
            contactDetailsScreen.labelZip.text = "\(uwZip)"
        }
        if let uwImage = newContact.image{
            contactDetailsScreen.imageProfile.image = uwImage
        }
    }
    var receivedPackage: Package = Package()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        notificationCenter.addObserver(self, selector: #selector(notificationReceivedEditContact(notification:)), name: Notification.Name("editContact"), object: nil)
        
        if let uwName = receivedPackage.name{
            if !uwName.isEmpty{
                contactDetailsScreen.labelContactName.text = uwName
            }
        }
        if let uwEmail = receivedPackage.email{
            if !uwEmail.isEmpty{
                contactDetailsScreen.labelEmail.text = "Email: \(uwEmail)"
            }
        }
        if let uwPhone = receivedPackage.phone, let uwPhoneType = receivedPackage.phoneType {
            if !uwPhoneType.isEmpty {
                contactDetailsScreen.labelPhone.text = "Phone: \(uwPhone) (\(uwPhoneType))"
            }
        }
        if let uwAddress = receivedPackage.address{
            if !uwAddress.isEmpty{
                contactDetailsScreen.labelAddress.text = uwAddress
            }
        }
        if let uwCityState = receivedPackage.cityState{
            if !uwCityState.isEmpty{
                contactDetailsScreen.labelCityState.text = uwCityState
            }
        }
        if let uwZip = receivedPackage.zip{
            contactDetailsScreen.labelZip.text = "\(uwZip)"
        }
        if let uwImage = receivedPackage.image{
            contactDetailsScreen.imageProfile.image = uwImage
        }
    }

    

}
