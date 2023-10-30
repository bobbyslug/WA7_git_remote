//
//  ContactDetailsView.swift
//  WA4_He_8274
//
//  Created by Christopher on 10/5/23.
//

import UIKit

class ContactDetailsView: UIView {
    var contentWrapper:UIScrollView!
    var labelContactName: UILabel!
    var labelEmail: UILabel!
    var labelPhoneType: UILabel!
    var labelPhone: UILabel!
    var labelAddressHeader: UILabel!
    var labelAddress: UILabel!
    var labelCityState: UILabel!
    var labelZip: UILabel!
    var imageProfile: UIImageView!
    var buttonEdit: UIButton!
    var buttonDelete: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        //MARK: initialize the TableView
        setupContentWrapper()
        setupLabelContactName()
        setupLabelEmail()
        setupLabelPhoneType()
        setupLabelPhone()
        setupLabelAddressHeader()
        setupLabelAddress()
        setupLabelCityState()
        setupLabelZip()
        setupImageProfile()
        setupButtonDelete()
        setupButtonEdit()
        initConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupContentWrapper(){
        contentWrapper = UIScrollView()
        contentWrapper.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(contentWrapper)
    }
    
    func setupLabelContactName() {
        labelContactName = UILabel()
        labelContactName.font = UIFont.boldSystemFont(ofSize: 26)
        labelContactName.translatesAutoresizingMaskIntoConstraints = false
        labelContactName.textAlignment = .center
        contentWrapper.addSubview(labelContactName)
    }
    
    func setupLabelEmail() {
        labelEmail = UILabel()
        labelEmail.font = UIFont.systemFont(ofSize: 22)
        labelEmail.translatesAutoresizingMaskIntoConstraints = false
        labelEmail.textAlignment = .center
        contentWrapper.addSubview(labelEmail)
    }
        
    func setupLabelPhoneType() {
        labelPhoneType = UILabel()
        labelPhoneType.font = UIFont.systemFont(ofSize: 22)
        labelPhoneType.translatesAutoresizingMaskIntoConstraints = false
        labelPhoneType.textAlignment = .center
        contentWrapper.addSubview(labelPhoneType)
    }
    
    func setupLabelPhone() {
        labelPhone = UILabel()
        labelPhone.font = UIFont.systemFont(ofSize: 22)
        labelPhone.translatesAutoresizingMaskIntoConstraints = false
        labelPhone.textAlignment = .center
        contentWrapper.addSubview(labelPhone)
    }
        
    func setupLabelAddressHeader() {
        labelAddressHeader = UILabel()
        labelAddressHeader.text = "Address:"
        labelAddressHeader.translatesAutoresizingMaskIntoConstraints = false
        labelAddressHeader.textAlignment = .center
        labelAddressHeader.font = UIFont.boldSystemFont(ofSize: 22)
        contentWrapper.addSubview(labelAddressHeader)
    }
    
        
    func setupLabelAddress() {
        labelAddress = UILabel()
        labelAddress.font = UIFont.systemFont(ofSize: 22)
        labelAddress.translatesAutoresizingMaskIntoConstraints = false
        labelAddress.textAlignment = .center
        contentWrapper.addSubview(labelAddress)
    }
    
        
    func setupLabelCityState() {
        labelCityState = UILabel()
        labelCityState.font = UIFont.systemFont(ofSize: 22)
        labelCityState.translatesAutoresizingMaskIntoConstraints = false
        labelCityState.textAlignment = .center
        contentWrapper.addSubview(labelCityState)
    }
    
        
    func setupLabelZip() {
        labelZip = UILabel()
        labelZip.font = UIFont.systemFont(ofSize: 22)
        labelZip.translatesAutoresizingMaskIntoConstraints = false
        labelZip.textAlignment = .center
        contentWrapper.addSubview(labelZip)
    }
    
    func setupImageProfile(){
        imageProfile = UIImageView()
        imageProfile.image = UIImage(systemName: "photo")
        imageProfile.tintColor = UIColor.black
        imageProfile.contentMode = .scaleToFill
        imageProfile.clipsToBounds = true
        imageProfile.layer.cornerRadius = 10
        imageProfile.translatesAutoresizingMaskIntoConstraints = false
        contentWrapper.addSubview(imageProfile)
    }
    
    func setupButtonEdit(){
        buttonEdit = UIButton(type: .system)
        buttonEdit.setTitle("Edit", for: .normal)
        buttonEdit.translatesAutoresizingMaskIntoConstraints = false
        buttonEdit.titleLabel?.font = .systemFont(ofSize: 22)
        contentWrapper.addSubview(buttonEdit)
    }
    
    func setupButtonDelete(){
        buttonDelete = UIButton(type: .system)
        buttonDelete.setTitle("Delete", for: .normal)
        buttonDelete.translatesAutoresizingMaskIntoConstraints = false
        buttonDelete.titleLabel?.font = .systemFont(ofSize: 22)
        contentWrapper.addSubview(buttonDelete)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            contentWrapper.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 84),
            contentWrapper.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            contentWrapper.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor),
            contentWrapper.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor),
            
            imageProfile.topAnchor.constraint(equalTo: contentWrapper.topAnchor),
            imageProfile.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            imageProfile.heightAnchor.constraint(equalToConstant: 200),
            imageProfile.widthAnchor.constraint(equalToConstant: 200),
                       
            labelContactName.topAnchor.constraint(equalTo: imageProfile.bottomAnchor, constant: 32),
            labelContactName.widthAnchor.constraint(equalTo: contentWrapper.widthAnchor),
            labelContactName.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            
            labelEmail.topAnchor.constraint(equalTo: labelContactName.bottomAnchor, constant: 16),
            labelEmail.widthAnchor.constraint(equalTo: contentWrapper.widthAnchor),
            labelEmail.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            
            labelPhone.leadingAnchor.constraint(equalTo: contentWrapper.leadingAnchor, constant: 0),
            labelPhone.topAnchor.constraint(equalTo: labelEmail.bottomAnchor, constant: 16),
            labelPhone.widthAnchor.constraint(equalTo: contentWrapper.widthAnchor),
            labelPhone.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            
            labelPhoneType.topAnchor.constraint(equalTo: labelEmail.bottomAnchor, constant: 16),
            labelPhoneType.widthAnchor.constraint(equalTo: contentWrapper.widthAnchor),
            labelPhoneType.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            labelPhoneType.leadingAnchor.constraint(equalTo: labelPhone.trailingAnchor, constant: 24),
            labelPhoneType.trailingAnchor.constraint(equalTo: contentWrapper.trailingAnchor, constant: -32),
            
            labelAddressHeader.topAnchor.constraint(equalTo: labelPhone.bottomAnchor, constant: 16),
            labelAddressHeader.widthAnchor.constraint(equalTo: contentWrapper.widthAnchor),
            labelAddressHeader.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),

            labelAddress.topAnchor.constraint(equalTo: labelAddressHeader.bottomAnchor, constant: 8),
            labelAddress.widthAnchor.constraint(equalTo: contentWrapper.widthAnchor),
            labelAddress.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),

            labelCityState.topAnchor.constraint(equalTo: labelAddress.bottomAnchor, constant: 4),
            labelCityState.widthAnchor.constraint(equalTo: contentWrapper.widthAnchor),
            labelCityState.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),

            labelZip.topAnchor.constraint(equalTo: labelCityState.bottomAnchor, constant: 4),
            labelZip.widthAnchor.constraint(equalTo: contentWrapper.widthAnchor),
            labelZip.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),

            buttonDelete.topAnchor.constraint(equalTo: labelZip.bottomAnchor, constant: 4),
            buttonDelete.widthAnchor.constraint(equalTo: contentWrapper.widthAnchor),
            buttonDelete.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            
            buttonEdit.topAnchor.constraint(equalTo: buttonDelete.bottomAnchor, constant: 4),
            buttonEdit.widthAnchor.constraint(equalTo: contentWrapper.widthAnchor),
            buttonEdit.centerXAnchor.constraint(equalTo: contentWrapper.centerXAnchor),
            buttonEdit.bottomAnchor.constraint(equalTo: contentWrapper.bottomAnchor),

        ])
    }
    

}

