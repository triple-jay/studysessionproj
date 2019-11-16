//
//  InputViewController.swift
//  StudySession
//
//  Created by Jeremy Jung on 11/16/19.
//  Copyright © 2019 Jeremy Jung. All rights reserved.
//

import UIKit

class InputViewController: UIViewController {
    
    var titleField: UITextField!
    var descriptionField: UITextField!
    var dateField: UIDatePicker!
    var fieldsButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        title = "New Session"
        
        titleField = UITextField()
        titleField.translatesAutoresizingMaskIntoConstraints = false
        titleField.placeholder = "Title"
        titleField.textAlignment = .center
        titleField.contentVerticalAlignment = .top
        titleField.layer.borderWidth = 1
        titleField.layer.borderColor = UIColor.black.cgColor
        titleField.textColor = .black
        titleField.font = .systemFont(ofSize: 20)
        view.addSubview(titleField)
        
        descriptionField = UITextField()
        descriptionField.translatesAutoresizingMaskIntoConstraints = false
        descriptionField.placeholder = "Description"
        descriptionField.textAlignment = .center
        descriptionField.contentVerticalAlignment = .top
        descriptionField.layer.borderWidth = 1
        descriptionField.layer.borderColor = UIColor.black.cgColor
        descriptionField.textColor = .black
        descriptionField.font = .systemFont(ofSize: 20)
        view.addSubview(descriptionField)
        
        dateField = UIDatePicker()
        dateField.translatesAutoresizingMaskIntoConstraints = false
//        let date = dateField.date
//        date.getStringOfDatetime(format: "h:mm a")
//        let dateFormat = DateFormatter()
        view.addSubview(dateField)
        
        fieldsButton = UIButton()
        fieldsButton.translatesAutoresizingMaskIntoConstraints = false
        fieldsButton.setTitle("Upload", for: .normal)
        fieldsButton.setTitleColor(.blue, for: .normal)
        view.addSubview(fieldsButton)
        
        setupConstraints()
        
    }
    
    func setupConstraints() {
         NSLayoutConstraint.activate([
            titleField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            titleField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleField.heightAnchor.constraint(equalToConstant: 30),
            titleField.widthAnchor.constraint(equalToConstant: 350)
               ])
        
        NSLayoutConstraint.activate([
            descriptionField.topAnchor.constraint(equalTo: titleField.bottomAnchor, constant: 10),
            descriptionField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            descriptionField.heightAnchor.constraint(equalToConstant: 380),
            descriptionField.widthAnchor.constraint(equalToConstant: 350)
        ])
        
        NSLayoutConstraint.activate([
            dateField.topAnchor.constraint(equalTo: descriptionField.bottomAnchor, constant: 10),
            dateField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dateField.heightAnchor.constraint(equalToConstant: 150),
            dateField.widthAnchor.constraint(equalToConstant: 350)
        ])
        
        NSLayoutConstraint.activate([
            fieldsButton.topAnchor.constraint(equalTo: dateField.bottomAnchor, constant: 10),
            fieldsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            fieldsButton.heightAnchor.constraint(equalToConstant: 30),
            fieldsButton.widthAnchor.constraint(equalToConstant: 140)
        ])
        
    }
    
}
