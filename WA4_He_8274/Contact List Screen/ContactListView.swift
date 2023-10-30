//
//  ContactListView.swift
//  WA4_He_8274
//
//  Created by Christopher on 10/5/23.
//

import UIKit

class ContactListView: UIView {
    var tableViewContact: UITableView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        //MARK: initialize the TableView
        setupTableViewContact()
        initConstraints()
    }
    
    func setupTableViewContact() {
        tableViewContact = UITableView()
        tableViewContact.translatesAutoresizingMaskIntoConstraints = false
        tableViewContact.register(TableViewContactCell.self, forCellReuseIdentifier: "contacts")
        self.addSubview(tableViewContact)
    }
    
    func initConstraints() {
        NSLayoutConstraint.activate([
            tableViewContact.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 8),
            tableViewContact.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -8),
            tableViewContact.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8),
            tableViewContact.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -8)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
