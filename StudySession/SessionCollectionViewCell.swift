//
//  SessionCollectionViewCell.swift
//  StudySession
//
//  Created by Jeremy Jung on 11/14/19.
//  Copyright © 2019 Jeremy Jung. All rights reserved.
//

import UIKit

class SessionCollectionViewCell: UICollectionViewCell {
    var sessionImageView: UIImageView!
    var sessionName: UITextView!
    var sessionTime: UITextView!
    var sessionDate: UITextView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        sessionImageView = UIImageView()
        sessionImageView.contentMode = .scaleAspectFill
        sessionImageView.layer.masksToBounds = true
        sessionImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(sessionImageView)
        
        sessionName = UITextView()
        sessionName.isEditable = false
        sessionName.font = .boldSystemFont(ofSize: 13)
        sessionName.isScrollEnabled = false
        sessionName.textColor = .black
        sessionName.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(sessionName)
        
        sessionTime = UITextView()
        sessionTime.isEditable = false
        sessionTime.font = .systemFont(ofSize: 10)
        sessionTime.isScrollEnabled = false
        sessionTime.textColor = .black
        sessionTime.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(sessionTime)
        
        sessionDate = UITextView()
        sessionDate.isEditable = false
        sessionDate.font = .systemFont(ofSize: 10)
        sessionDate.isScrollEnabled = false
        sessionDate.textColor = .black
        sessionDate.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(sessionDate)
        
        setupConstraints()
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            sessionImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            sessionImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            sessionImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            sessionImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -50)

        ])
        
        NSLayoutConstraint.activate([
            sessionName.topAnchor.constraint(equalTo: sessionImageView.bottomAnchor),
            sessionName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            sessionName.heightAnchor.constraint(equalToConstant: 25),
            sessionName.widthAnchor.constraint(equalToConstant: 150)
        ])
        
        NSLayoutConstraint.activate([
            sessionTime.topAnchor.constraint(equalTo: sessionName.bottomAnchor),
            sessionTime.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            sessionTime.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            sessionTime.heightAnchor.constraint(equalToConstant: 20),
            sessionTime.widthAnchor.constraint(equalToConstant: 70)
        ])
        
        NSLayoutConstraint.activate([
            sessionDate.topAnchor.constraint(equalTo: sessionTime.bottomAnchor),
            sessionDate.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            sessionDate.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            sessionDate.heightAnchor.constraint(equalToConstant: 20),
            sessionDate.widthAnchor.constraint(equalToConstant: 70)
        ])
    }
    
    func configure(for session: Session) {
        let imageString = session.image
        sessionImageView.image = UIImage(named: imageString)
        sessionName.text = session.name
        sessionDate.text = "Date: \(session.date)"
        sessionTime.text = "Time: \(session.time)"
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
