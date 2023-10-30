//
//  ViewController.swift
//  WA4_He_8274
//
//  Created by Christopher on 10/5/23.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    let contactListScreen = ContactListView()
    let notificationCenter = NotificationCenter.default
    
    var contacts = [Contact]()
    var contactNames = [String]()
    
    override func loadView() {
        view = contactListScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Testing this change"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 24)]
        contactListScreen.tableViewContact.delegate = self
        contactListScreen.tableViewContact.dataSource = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add, target: self, action: #selector(onAddBarButtonTapped)
        )
        notificationCenter.addObserver(
            self,
            selector: #selector(notificationReceivedForDelete(notification:)),
            name: Notification.Name("deleteContact"),
            object: nil)
        notificationCenter.addObserver(self, selector: #selector(notificationReceivedEditContact(notification:)), name: Notification.Name("editContact"), object: nil)
    }
    
    @objc func onAddBarButtonTapped() {
        let createContactController = CreateContactViewController()
        createContactController.delegate = self
        navigationController?.pushViewController(createContactController, animated: true)
    }
    
    func delegateOnCreateContact(contact: Contact) {
        contacts.append(contact)
        addContact(contact: contact)
        contactListScreen.tableViewContact.reloadData()
    }
    
    @objc func notificationReceivedForDelete(notification: Notification){
        let newContact = notification.object as! String
        
        if let url = URL(string: APIConfigs.baseURL+"delete"){
            AF.request(url, method:.get, parameters:
                        [
                            "name": newContact,
                        ], encoding: URLEncoding.queryString)
                .responseString(completionHandler: { response in
                    //MARK: retrieving the status code...
                    let status = response.response?.statusCode
                    
                    switch response.result{
                    case .success(let data):
                        //MARK: there was no network error...
                        
                        //MARK: status code is Optional, so unwrapping it...
                        if let uwStatusCode = status{
                            switch uwStatusCode{
                                case 200...299:
                                //MARK: the request was valid 200-level...
                                let name = notification.object as! String
                                
                                for (index, contact) in self.contacts.enumerated() {
                                    if contact.name == name {
                                        self.contacts.remove(at: index)
                                    }
                                }
                                self.getAllContacts()
                                self.contactListScreen.tableViewContact.reloadData()
                                break
                        
                                case 400...499:
                                //MARK: the request was not valid 400-level...
                                    print(data)
                                    break
                        
                                default:
                                //MARK: probably a 500-level error...
                                    print(data)
                                    break
                        
                            }
                        }
                        break
                        
                    case .failure(let error):
                        //MARK: there was a network error...
                        print(error)
                        break
                    }
                })
                    }else{
            //alert that the URL is invalid...
        }
    }
    
    @objc func notificationReceivedEditContact(notification: Notification) {
        let newContact = notification.object as! Contact
        let originalName = notification.userInfo!["name"] as! String
        if let url = URL(string: APIConfigs.baseURL+"delete"){
            AF.request(url, method:.get, parameters:
                        [
                            "name": originalName,
                        ])
                .responseString(completionHandler: { response in
                    //MARK: retrieving the status code...
                    let status = response.response?.statusCode
                    
                    switch response.result{
                    case .success(let data):
                        //MARK: there was no network error...
                        
                        //MARK: status code is Optional, so unwrapping it...
                        if let uwStatusCode = status{
                            switch uwStatusCode{
                                case 200...299:
                                //MARK: the request was valid 200-level...
                                let name = originalName
                                
                                for (index, contact) in self.contacts.enumerated() {
                                    if contact.name == name {
                                        self.contacts.remove(at: index)
                                    }
                                }
                                self.addContact(contact: newContact)
                                self.contacts.append(newContact)
                                self.contactListScreen.tableViewContact.reloadData()

                                break
                        
                                case 400...499:
                                //MARK: the request was not valid 400-level...
                                    print(data)
                                    break
                        
                                default:
                                //MARK: probably a 500-level error...
                                    print(data)
                                    break
                        
                            }
                        }
                        break
                        
                    case .failure(let error):
                        //MARK: there was a network error...
                        print(error)
                        break
                    }
                })
                    }else{
            //alert that the URL is invalid...
        }
    }
        
    
    func addContact(contact: Contact) {
        if let url = URL(string: APIConfigs.baseURL+"add"){
            
            AF.request(url, method:.post, parameters:
                        [
                            "name": contact.name!,
                            "email": contact.email!,
                            "image": contact.image!,
                            "phoneType": contact.phoneType!,
                            "phone": contact.phone!,
                            "address": contact.address!,
                            "cityState": contact.cityState!,
                            "zip": contact.zip!
                        ])
                .responseString(completionHandler: { response in
                    //MARK: retrieving the status code...
                    let status = response.response?.statusCode
                    
                    switch response.result{
                    case .success(let data):
                        //MARK: there was no network error...
                        
                        //MARK: status code is Optional, so unwrapping it...
                        if let uwStatusCode = status{
                            switch uwStatusCode{
                                case 200...299:
                                    //MARK: the request was valid 200-level...
                                    self.getAllContacts()
                                    break
                        
                                case 400...499:
                                //MARK: the request was not valid 400-level...
                                    print(data)
                                    break
                        
                                default:
                                //MARK: probably a 500-level error...
                                    print(data)
                                    break
                        
                            }
                        }
                        break
                        
                    case .failure(let error):
                        //MARK: there was a network error...
                        print(error)
                        break
                    }
                })
        }else{
            //alert that the URL is invalid...
        }
    }
    
    //MARK: get all contacts...
    func getAllContacts(){
        if let url = URL(string: APIConfigs.baseURL + "getall"){
            AF.request(url, method: .get).responseString(completionHandler: { response in
                //MARK: retrieving the status code...
                let status = response.response?.statusCode
                
                switch response.result{
                case .success(let data):
                    //MARK: there was no network error...
                    
                    //status code is Optional, so unwrapping it...
                    if let uwStatusCode = status{
                        switch uwStatusCode{
                            case 200...299:
                            //MARK: the request was valid 200-level...
                                var names = data.components(separatedBy: "\n")
                                self.contactNames = names
                                self.contactNames.removeLast()
                                self.contactListScreen.tableViewContact.reloadData()

                                print(self.contactNames)
                                break
                    
                            case 400...499:
                            //MARK: the request was not valid 400-level...
                                print(data)
                                break
                    
                            default:
                            //MARK: probably a 500-level error...
                                print(data)
                                break
                    
                        }
                    }
                    break
                    
                case .failure(let error):
                    //MARK: there was a network error...
                    print(error)
                    break
                }
            })
        }
    }

    
    //MARK: when user clicks on a contact cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            
        let details = self.contacts[indexPath.row]
        let contactDetailsController = ContactDetailsViewController()

        if let uwName = details.name, let uwEmail = details.email, let uwPhone = details.phone, let uwPhoneType = details.phoneType, let uwAddress = details.address, let uwCityState = details.cityState, let uwZip = details.zip, let uwImage = details.image {
            let package = Package(name: uwName, email: uwEmail, phone: uwPhone, phoneType: uwPhoneType, address: uwAddress, cityState: uwCityState, zip: uwZip, image: uwImage)
            contactDetailsController.receivedPackage = package
            
            navigationController?.pushViewController(contactDetailsController, animated: true)
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contacts", for: indexPath) as! TableViewContactCell
        let details = contacts[indexPath.row]
        if let uwName = details.name {
            cell.labelName.text = uwName
        }
        if let uwEmail = details.email{
            cell.labelEmail.text = "Email: \(uwEmail)"
        }
        if let uwPhone = details.phone, let uwPhoneType = details.phoneType {
            cell.labelPhone.text = "Phone: \(uwPhone) (\(uwPhoneType))"
        }
        if let uwImage = details.image{
            cell.imageProfile.image = uwImage
        }
        return cell
    }
}
