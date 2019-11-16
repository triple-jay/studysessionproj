//
//  CellViewController.swift
//  StudySession
//
//  Created by Jeremy Jung on 11/16/19.
//  Copyright © 2019 Jeremy Jung. All rights reserved.
//

import UIKit

class CellViewController: UIViewController {
    
    var session: Session
    
    var descriptionText: UITextView!
    var descriptionField: UITextView!
    
    init(session: Session) {
        self.session = session
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = session.name
        view.backgroundColor = .white
        
        descriptionField = UITextView()
        descriptionField.text = "Description:\n\(session.description)"
        descriptionField.translatesAutoresizingMaskIntoConstraints = false
        descriptionField.textAlignment = .left
        descriptionField.textColor = .black
        descriptionField.font = .systemFont(ofSize: 20)
        view.addSubview(descriptionField)
        
        setupConstraints()
        
        
        }
    
    func setupConstraints() {

        NSLayoutConstraint.activate([
            descriptionField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            descriptionField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            descriptionField.heightAnchor.constraint(equalToConstant: 380),
            descriptionField.widthAnchor.constraint(equalToConstant: 350)])
    }

    }


