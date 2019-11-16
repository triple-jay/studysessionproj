//
//  SessionInfoViewController.swift
//  StudySession
//
//  Created by Jeremy Jung on 11/16/19.
//  Copyright © 2019 Jeremy Jung. All rights reserved.
//

import UIKit

class SessionInfoViewController: UIViewController {
    
    var photoImage: UIImageView!
    var className: UILabel!
    var descriptionField: UITextView!
//    var location: UILabel! //googlemap
    var date: UILabel!
    var time: UILabel!
    
    var sessionObject: Session!
    
    var delegate: SessionInfoDelegate?
    
    init(sessionObject: Session) {
        self.sessionObject = sessionObject
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        photoImage = UIImageView()
        photoImage.translatesAutoresizingMaskIntoConstraints = false
        photoImage.contentMode = .scaleAspectFit
        photoImage.sizeThatFits(CGSize(width: 400, height: 350))
        photoImage.layer.masksToBounds = true
        photoImage.image = UIImage(named: sessionObject.image)
        view.addSubview(photoImage)
        
        className = UILabel()
        className.translatesAutoresizingMaskIntoConstraints = false
        className.text = "\(sessionObject.name)"
        className.font = UIFont.boldSystemFont(ofSize: 20)
        className.textColor = .black
        view.addSubview(className)
        
//        location = UILabel()
//        location.translatesAutoresizingMaskIntoConstraints = false
//        location.text = "\(sessionObject.location)"
        
        date = UILabel()
        date.translatesAutoresizingMaskIntoConstraints = false
        date.text = "Date: \(sessionObject.date)"
        date.font = UIFont.systemFont(ofSize: 16)
        date.textColor = .black
        view.addSubview(date)
        
        time = UILabel()
        time.translatesAutoresizingMaskIntoConstraints = false
        time.text = "Time: \(sessionObject.time)"
        time.font = UIFont.systemFont(ofSize: 16)
        time.textColor = .black
        view.addSubview(time)
        
        descriptionField = UITextView()
        descriptionField.text = "Description:\n\(sessionObject.description)"
        descriptionField.translatesAutoresizingMaskIntoConstraints = false
        descriptionField.textAlignment = .left
        descriptionField.textColor = .black
        descriptionField.font = .systemFont(ofSize: 16)
        view.addSubview(descriptionField)
        
        setupConstraints()
    }
    
    func setupConstraints(){
        NSLayoutConstraint.activate([
            photoImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            photoImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            photoImage.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            photoImage.widthAnchor.constraint(equalToConstant: 450),
            photoImage.heightAnchor.constraint(equalToConstant: 250)
        ])
        NSLayoutConstraint.activate([
            className.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            className.topAnchor.constraint(equalTo: photoImage.bottomAnchor, constant: 10),
            className.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
        NSLayoutConstraint.activate([
            date.topAnchor.constraint(equalTo: className.bottomAnchor, constant: 10),
            date.leadingAnchor.constraint(equalTo: className.leadingAnchor, constant: 10),
            date.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
        NSLayoutConstraint.activate([
            time.topAnchor.constraint(equalTo: date.bottomAnchor, constant: 10),
            time.leadingAnchor.constraint(equalTo: date.leadingAnchor),
            time.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
        NSLayoutConstraint.activate([
            descriptionField.topAnchor.constraint(equalTo: time.bottomAnchor, constant: 10),
            descriptionField.leadingAnchor.constraint(equalTo: time.leadingAnchor),
            descriptionField.heightAnchor.constraint(equalToConstant: 380),
            descriptionField.widthAnchor.constraint(equalToConstant: 350)
        ])
        
    }
   

}

