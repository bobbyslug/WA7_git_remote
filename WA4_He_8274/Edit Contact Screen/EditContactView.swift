//
//  EditContactView.swift
//  WA4_He_8274
//
//  Created by Christopher on 10/27/23.
//

import UIKit

class EditContactView: UIView {
    var textFieldName: UITextField!
    var buttonTakePhoto: UIButton!
    var labelPhoto: UILabel!
    var textFieldEmail: UITextField!
    var textFieldPhone: UITextField!
    var buttonSelectType: UIButton!
    var textFieldAddress: UITextField!
    var textFieldCityState: UITextField!
    var textFieldZip: UITextField!

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        setuptextFieldName()
        setupButtonTakePhoto()
        setupLabelPhoto()
        setuptextFieldEmail()
        setuptextFieldPhone()
        setupButtonSelectType()
        setuptextFieldAddress()
        setuptextFieldCityState()
        setuptextFieldZip()
        
        initConstraints()
    }
    
//    MARK: methods to initialize the UI elements
    func setuptextFieldName(){
        textFieldName = UITextField()
        textFieldName.translatesAutoresizingMaskIntoConstraints = false
        textFieldName.layer.borderColor = UIColor.lightGray.cgColor
        textFieldName.layer.borderWidth = 1
        textFieldName.layer.cornerRadius = 5
        textFieldName.borderStyle = .roundedRect
        textFieldName.textAlignment = .left
        textFieldName.font = UIFont.systemFont(ofSize: 18)
        self.addSubview(textFieldName)
    }
    func setupButtonTakePhoto(){
        buttonTakePhoto = UIButton(type: .system)
        buttonTakePhoto.setTitle("", for: .normal)
        buttonTakePhoto.setImage(UIImage(systemName: "camera.fill"), for: .normal)
        buttonTakePhoto.tintColor = UIColor.black
        buttonTakePhoto.contentHorizontalAlignment = .fill
        buttonTakePhoto.contentVerticalAlignment = .fill
        buttonTakePhoto.imageView?.contentMode = .scaleAspectFit
        buttonTakePhoto.translatesAutoresizingMaskIntoConstraints = false
        buttonTakePhoto.showsMenuAsPrimaryAction = true
        self.addSubview(buttonTakePhoto)
    }
    func setupLabelPhoto(){
        labelPhoto = UILabel()
        labelPhoto.textColor = UIColor.lightGray
        labelPhoto.font = UIFont.systemFont(ofSize: 24)
        labelPhoto.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(labelPhoto)
    }
    func setuptextFieldEmail(){
        textFieldEmail = UITextField()
        textFieldEmail.translatesAutoresizingMaskIntoConstraints = false
        textFieldEmail.layer.borderColor = UIColor.lightGray.cgColor
        textFieldEmail.layer.borderWidth = 1
        textFieldEmail.layer.cornerRadius = 3
        textFieldEmail.borderStyle = .roundedRect
        textFieldEmail.textAlignment = .left
        textFieldEmail.font = UIFont.systemFont(ofSize: 18)
        self.addSubview(textFieldEmail)
    }
    func setuptextFieldPhone(){
        textFieldPhone = UITextField()
        textFieldPhone.translatesAutoresizingMaskIntoConstraints = false
        textFieldPhone.layer.borderColor = UIColor.lightGray.cgColor
        textFieldPhone.layer.borderWidth = 1
        textFieldPhone.layer.cornerRadius = 3
        textFieldPhone.borderStyle = .roundedRect
        textFieldPhone.textAlignment = .left
        textFieldPhone.font = UIFont.systemFont(ofSize: 18)
        textFieldPhone.keyboardType = .numberPad
        self.addSubview(textFieldPhone)
    }
    func setupButtonSelectType(){
        buttonSelectType = UIButton(type: .system)
        buttonSelectType.showsMenuAsPrimaryAction = true
        buttonSelectType.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(buttonSelectType)
    }

    func setuptextFieldAddress(){
        textFieldAddress = UITextField()
        textFieldAddress.translatesAutoresizingMaskIntoConstraints = false
        textFieldAddress.layer.borderColor = UIColor.lightGray.cgColor
        textFieldAddress.layer.borderWidth = 1
        textFieldAddress.borderStyle = .roundedRect
        textFieldAddress.textAlignment = .left
        textFieldAddress.font = UIFont.systemFont(ofSize: 18)
        self.addSubview(textFieldAddress)
    }
    func setuptextFieldCityState(){
        textFieldCityState = UITextField()
        textFieldCityState.translatesAutoresizingMaskIntoConstraints = false
        textFieldCityState.layer.borderColor = UIColor.lightGray.cgColor
        textFieldCityState.layer.borderWidth = 1
        textFieldCityState.layer.cornerRadius = 3
        textFieldCityState.borderStyle = .roundedRect
        textFieldCityState.textAlignment = .left
        textFieldCityState.font = UIFont.systemFont(ofSize: 18)
        self.addSubview(textFieldCityState)
    }
    func setuptextFieldZip(){
        textFieldZip = UITextField()
        textFieldZip.translatesAutoresizingMaskIntoConstraints = false
        textFieldZip.layer.borderColor = UIColor.lightGray.cgColor
        textFieldZip.layer.borderWidth = 1
        textFieldZip.layer.cornerRadius = 5
        textFieldZip.borderStyle = .roundedRect
        textFieldZip.textAlignment = .left
        textFieldZip.font = UIFont.systemFont(ofSize: 18)
        textFieldZip.keyboardType = .numberPad
        self.addSubview(textFieldZip)
    }
    
    //MARK: initialize the constraints...
    func initConstraints(){
        NSLayoutConstraint.activate([
            textFieldName.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 96),
            textFieldName.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            textFieldName.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            textFieldName.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -24),
            
            buttonTakePhoto.topAnchor.constraint(equalTo: textFieldName.bottomAnchor, constant: 16),
            buttonTakePhoto.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            buttonTakePhoto.widthAnchor.constraint(equalToConstant: 100),
            buttonTakePhoto.heightAnchor.constraint(equalToConstant: 100),
            
            labelPhoto.topAnchor.constraint(equalTo: buttonTakePhoto.bottomAnchor, constant: -8),
            labelPhoto.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            
            textFieldEmail.topAnchor.constraint(equalTo: labelPhoto.bottomAnchor, constant: 16),
            textFieldEmail.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            textFieldEmail.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            textFieldEmail.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -24),

            textFieldPhone.topAnchor.constraint(equalTo: textFieldEmail.bottomAnchor, constant: 16),
            textFieldPhone.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            textFieldPhone.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            textFieldPhone.trailingAnchor.constraint(equalTo: buttonSelectType.leadingAnchor, constant: -16),
            textFieldPhone.widthAnchor.constraint(lessThanOrEqualToConstant: 800),

            buttonSelectType.topAnchor.constraint(equalTo: textFieldEmail.bottomAnchor, constant: 16),
            buttonSelectType.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            buttonSelectType.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -32),
            buttonSelectType.widthAnchor.constraint(lessThanOrEqualToConstant: 70),
            
            textFieldAddress.topAnchor.constraint(equalTo: buttonSelectType.bottomAnchor, constant: 16),
            textFieldAddress.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            textFieldAddress.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            textFieldAddress.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -24),

            textFieldCityState.topAnchor.constraint(equalTo: textFieldAddress.bottomAnchor, constant: 16),
            textFieldCityState.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            textFieldCityState.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            textFieldCityState.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -24),

            textFieldZip.topAnchor.constraint(equalTo: textFieldCityState.bottomAnchor, constant: 16),
            textFieldZip.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            textFieldZip.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            textFieldZip.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -24),
        ])
    }
    
   
    
    //MARK: unused methods...
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

