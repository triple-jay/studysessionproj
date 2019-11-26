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
    var sessionName: UILabel!
    var sessionTime: UILabel!
    var sessionDate: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
                
        sessionImageView = UIImageView()
        sessionImageView.contentMode = .scaleAspectFill
        sessionImageView.layer.masksToBounds = true
        sessionImageView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(sessionImageView)
        
        sessionName = UILabel()
        sessionName.font = .boldSystemFont(ofSize: 13)
        sessionName.textColor = .black
        sessionName.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(sessionName)
        
        sessionTime = UILabel()
        sessionTime.font = .systemFont(ofSize: 10)
        sessionTime.textColor = .black
        sessionTime.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(sessionTime)
        
        sessionDate = UILabel()
        sessionDate.font = .systemFont(ofSize: 10)
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
            sessionImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -70)

        ])
        
        NSLayoutConstraint.activate([
            sessionName.topAnchor.constraint(equalTo: sessionImageView.bottomAnchor),
            sessionName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            sessionName.heightAnchor.constraint(equalToConstant: 25),
            sessionName.widthAnchor.constraint(equalToConstant: 150)
        ])
        
        NSLayoutConstraint.activate([
            sessionTime.topAnchor.constraint(equalTo: sessionName.bottomAnchor),
            sessionTime.leadingAnchor.constraint(equalTo: sessionName.leadingAnchor, constant: 5),
            sessionTime.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            sessionTime.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            sessionDate.topAnchor.constraint(equalTo: sessionTime.bottomAnchor, constant: -4),
            sessionDate.leadingAnchor.constraint(equalTo: sessionName.leadingAnchor, constant: 5),
            sessionDate.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            sessionDate.heightAnchor.constraint(equalToConstant: 20)
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
