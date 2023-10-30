//
//  TableViewContactCell.swift
//  WA4_He_8274
//
//  Created by Christopher on 10/5/23.
//

import UIKit


class TableViewContactCell: UITableViewCell {
    var wrapperCellView: UIView!
    var labelName: UILabel!
    var labelEmail: UILabel!
    var labelPhone: UILabel!
    var imageProfile: UIImageView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupWrapperCellView()
        setupLabelName()
        setupLabelEmail()
        setupLabelPhone()
        setupImageProfile()
        initConstraints()
    }
    
    func setupWrapperCellView(){
        wrapperCellView = UITableViewCell()
        wrapperCellView.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.layer.borderColor = UIColor.gray.cgColor
        wrapperCellView.layer.borderWidth = 1
        wrapperCellView.layer.cornerRadius = 10
        self.addSubview(wrapperCellView)
    }
    
    func setupLabelName(){
        labelName = UILabel()
        labelName.translatesAutoresizingMaskIntoConstraints = false
        labelName.font = UIFont.boldSystemFont(ofSize: 24)
        labelName.textAlignment = .left
        wrapperCellView.addSubview(labelName)
    }
    func setupLabelEmail(){
        labelEmail = UILabel()
        labelEmail.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelEmail)
    }
    func setupLabelPhone(){
        labelPhone = UILabel()
        labelPhone.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(labelPhone)
    }
    func setupImageProfile(){
        imageProfile = UIImageView()
        imageProfile.image = UIImage(systemName: "photo")
        imageProfile.tintColor = UIColor.black
        imageProfile.contentMode = .scaleToFill
        imageProfile.clipsToBounds = true
        imageProfile.layer.cornerRadius = 10
        imageProfile.translatesAutoresizingMaskIntoConstraints = false
        wrapperCellView.addSubview(imageProfile)
    }
    
    func initConstraints(){
        NSLayoutConstraint.activate([
            wrapperCellView.topAnchor.constraint(equalTo: self.topAnchor),
            wrapperCellView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            wrapperCellView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            wrapperCellView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            
            labelName.topAnchor.constraint(equalTo: wrapperCellView.topAnchor, constant: 8),
            labelName.leadingAnchor.constraint(equalTo: imageProfile.trailingAnchor, constant: 8),
            labelName.heightAnchor.constraint(equalToConstant: 20),
            
            labelEmail.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 12),
            labelEmail.leadingAnchor.constraint(equalTo: labelName.leadingAnchor),
            labelEmail.heightAnchor.constraint(equalToConstant: 20),
            
            labelPhone.topAnchor.constraint(equalTo: labelEmail.bottomAnchor, constant: 8),
            labelPhone.leadingAnchor.constraint(equalTo: labelName.leadingAnchor),
            labelPhone.heightAnchor.constraint(equalToConstant: 20),
            
            imageProfile.leadingAnchor.constraint(equalTo: wrapperCellView.leadingAnchor, constant: 8),
            imageProfile.centerYAnchor.constraint(equalTo: wrapperCellView.centerYAnchor),
            imageProfile.heightAnchor.constraint(equalTo: wrapperCellView.heightAnchor, constant: -20),
            imageProfile.widthAnchor.constraint(equalTo: wrapperCellView.heightAnchor, constant: -20),
                        
            wrapperCellView.heightAnchor.constraint(equalToConstant: 96)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }


}
