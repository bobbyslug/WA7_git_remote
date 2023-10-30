//
//  CreateContactViewController.swift
//  WA4_He_8274
//
//  Created by Christopher on 10/5/23.
//

import UIKit
import PhotosUI

class CreateContactViewController: UIViewController {
    
    //MARK: initializing the CreateContactView
    let createContactScreen = CreateContactView()
    var selectedType = "Home"
    // delegate to view controller when getting back
    var delegate:ViewController!
    var pickedImage:UIImage?
    
    //MARK: set the current view to addExpenseScreen...
    override func loadView() {
        view = createContactScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Add Contact"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .save, target: self, action: #selector(onSaveBarButtonTapped)
        )
        createContactScreen.buttonSelectType.menu = getMenuTypes()
        createContactScreen.buttonTakePhoto.menu = getMenuImagePicker()

        //MARK: recognize the taps on the app screen
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(hideKeyboardOnTap))
        view.addGestureRecognizer(tapRecognizer)
    }
    
    //MARK: menu for buttonSelectType setup
    func getMenuTypes() -> UIMenu{
        var menuItems = [UIAction]()
        
        for type in PhoneTypes.types{
            let menuItem = UIAction(title: type,handler: {(_) in
                                self.selectedType = type
                                self.createContactScreen.buttonSelectType.setTitle(self.selectedType, for: .normal)
                            })
            menuItems.append(menuItem)
        }
        
        return UIMenu(title: "Select type", children: menuItems)
    }
    
    func getMenuImagePicker() -> UIMenu{
        var menuItems = [
            UIAction(title: "Camera",handler: {(_) in
                self.pickUsingCamera()
            }),
            UIAction(title: "Gallery",handler: {(_) in
                self.pickPhotoFromGallery()
            })
        ]
        
        return UIMenu(title: "Select source", children: menuItems)
    }
    
    //MARK: take photo using camera
    func pickUsingCamera() {
        let cameraController = UIImagePickerController()
        cameraController.sourceType = .camera
        cameraController.allowsEditing = true
        cameraController.delegate = self
        present(cameraController, animated: true)
    }
    
    //MARK: pick photo using gallery
    func pickPhotoFromGallery() {
        var configuration = PHPickerConfiguration()
        configuration.filter = PHPickerFilter.any(of: [.images])
        configuration.selectionLimit = 1
        
        let photoPicker = PHPickerViewController(configuration: configuration)
        
        photoPicker.delegate = self
        present(photoPicker, animated: true, completion: nil)
    }

    //MARK: Hide keyboard
    @objc func hideKeyboardOnTap() {
        //MARK: remove the keyboard from the screen
        view.endEditing(true)
    }
    //MARK: action for tapping save
    @objc func onSaveBarButtonTapped(){
        var name:String?
        if let nameText = createContactScreen.textFieldName.text{
            if !nameText.isEmpty{
                name = nameText
            }else{
                showEmptyErrorAlert()
                return
            }
        }
        
        var email:String?
        if let emailText = createContactScreen.textFieldEmail.text{
            if !emailText.isEmpty{
                if isValidEmail(emailText) {
                    email = emailText
                } else {
                    showInvalidEmailAlert()
                    return
                }
            }else{
                showEmptyErrorAlert()
                return
            }
        }
        
        var phone = 0
        if let phoneText = createContactScreen.textFieldPhone.text{
            if !phoneText.isEmpty{
                if let uwPhone = Int(phoneText), isValidPhone(phoneText){
                    phone = uwPhone
                }else{
                    showInvalidPhoneAlert()
                    return
                }
            }else{
                showEmptyErrorAlert()
                return
            }
            
        }
        
        var address:String?
        if let addressText = createContactScreen.textFieldAddress.text{
            if !addressText.isEmpty{
                address = addressText
            }else{
                showEmptyErrorAlert()
                return
            }
        }
        
        var cityState:String?
        if let cityStateText = createContactScreen.textFieldCityState.text{
            if !cityStateText.isEmpty{
                cityState = cityStateText
            }else{
                showEmptyErrorAlert()
                return
            }
        }
        
        var zip = 0
        if let zipText = createContactScreen.textFieldZip.text{
            if !zipText.isEmpty{
                if let uwZip = Int(zipText), isValidZip(zipText) {
                    zip = uwZip
                }else{
                    showInvalidZipAlert()
                    return
                }
            }else{
                showEmptyErrorAlert()
                return
            }
        }
        
        let newContact = Contact(name: name, email: email, phoneType: selectedType, phone: phone, address: address, cityState: cityState, zip: zip, image: pickedImage ?? (UIImage(systemName: "person.fill")))
        delegate.delegateOnCreateContact(contact: newContact)
        navigationController?.popViewController(animated: true)
    }
    
    /*regex taken from https://stackoverflow.com/questions/25471114/how-to-validate-an-e-mail-address-in-swift/25471164#25471164
     */
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    /* regex taken from
     https://stackoverflow.com/questions/20120522/postal-code-validation-in-ios
     */
    func isValidZip(_ zip: String) -> Bool {
        let zipRegex = "^[0-9]{5}(-[0-9]{4})?$"
        let zipPred = NSPredicate(format:"SELF MATCHES %@", zipRegex)
        return zipPred.evaluate(with: zip)
    }
    
    /* regex taken from
     https://stackoverflow.com/questions/27998409/email-phone-validation-in-swift
     */
    func isValidPhone(_ phone: String) -> Bool {
        let phoneRegex = "^\\d{3}\\d{3}\\d{4}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return phoneTest.evaluate(with: phone)
    }
    
    //MARK: Alert controller logic
    func showEmptyErrorAlert() {
        let alert = UIAlertController(title: "Error!", message: "Text Fields must not be empty!", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        self.present(alert, animated: true)
    }
    
    func showInvalidEmailAlert() {
        let alert = UIAlertController(title: "Error!", message: "Email must be valid!", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        self.present(alert, animated: true)
    }
    func showInvalidPhoneAlert() {
        let alert = UIAlertController(title: "Error!", message: "Phone number must be valid!", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        self.present(alert, animated: true)
    }
    func showInvalidZipAlert() {
        let alert = UIAlertController(title: "Error!", message: "Zip Code must be valid!", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        self.present(alert, animated: true)
    }
    
}

//MARK: adopt the required protocols
extension CreateContactViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        //MARK: we are using only one section...
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        //MARK: we are displaying the options from Utilities.types...
        return PhoneTypes.types.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        //MARK: updating the selected type when the user picks this row...
        selectedType = PhoneTypes.types[row]
        return PhoneTypes.types[row]
    }
}

//MARK: adopting required protocols for PHPicker
extension CreateContactViewController:PHPickerViewControllerDelegate{
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        dismiss(animated: true)
        
        print(results)
        
        let itemprovider = results.map(\.itemProvider)
        
        for item in itemprovider{
            if item.canLoadObject(ofClass: UIImage.self){
                item.loadObject(ofClass: UIImage.self, completionHandler: { (image, error) in
                    DispatchQueue.main.async{
                        if let uwImage = image as? UIImage{
                            self.createContactScreen.buttonTakePhoto.setImage(
                                uwImage.withRenderingMode(.alwaysOriginal),
                                for: .normal
                            )
                            self.pickedImage = uwImage
                        }
                    }
                })
            }
        }
    }
}

//MARK: adopting required protocols for UIImagePicker
extension CreateContactViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        
        if let image = info[.editedImage] as? UIImage{
            self.createContactScreen.buttonTakePhoto.setImage(
                image.withRenderingMode(.alwaysOriginal),
                for: .normal
            )
            self.pickedImage = image
        }else{
            // Do your thing for No image loaded.
        }
    }
}
