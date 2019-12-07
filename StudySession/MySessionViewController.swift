//
//  MySessionViewController.swift
//  StudySession
//
//  Created by Christy Song on 11/16/19.
//  Copyright © 2019 Jeremy Jung. All rights reserved.
//

import UIKit



class MySessionViewController: UIViewController {
    
    var collectionView: UICollectionView!
    var favorites: [Session]!
    
    let studyReuseIdentifier: String = "studyReuseIdentifier"
    let padding: CGFloat = 15
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "My Study Sessions"
        view.backgroundColor = .systemGray5
        // Do any additional setup after loading the view.
        
        favorites = []
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = padding
        layout.minimumInteritemSpacing = padding
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemGray5
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        
        collectionView.register(SessionCollectionViewCell.self, forCellWithReuseIdentifier: studyReuseIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        if let storedFavorites = userDefaults.data(forKey: Strings.favorites),
        var favoriteSessions = try? decoder.decode([Session].self, from: storedFavorites) {
            favorites = favoriteSessions
            collectionView.reloadData()
        } 
        
        setUpConstraints()
        
    }
    
    func setUpConstraints() {
           NSLayoutConstraint.activate([
               collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
               collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
               collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
               collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding)
           ])
       }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        if let storedFavorites = userDefaults.data(forKey: Strings.favorites),
        var favoriteSessions = try? decoder.decode([Session].self, from: storedFavorites) {
            favorites = favoriteSessions
            collectionView.reloadData()
    }
    }
    


}

extension MySessionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: studyReuseIdentifier, for: indexPath) as! SessionCollectionViewCell
        cell.configure(for: favorites[indexPath.row])
        cell.backgroundColor = .white
        cell.layer.cornerRadius = 8
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return favorites.count
    }
}

extension MySessionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (collectionView.frame.width - padding) / 2
        return CGSize(width: size, height: size)
    }
}


