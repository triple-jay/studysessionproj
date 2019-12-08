//
//  ViewController.swift
//  StudySession
//
//  Created by Jeremy Jung on 11/14/19.
//  Copyright © 2019 Jeremy Jung. All rights reserved.
//

import UIKit
import GoogleSignIn

protocol SessionInfoDelegate: class {
    func sessionInfoDelegate()
}

class ViewController: UIViewController {
    
    var collectionView: UICollectionView!
    var sessions: [Session] = []
    var signoutbutton: UIBarButtonItem!
    
    let studyReuseIdentifier: String = "studyReuseIdentifier"
    let padding: CGFloat = 15

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Study Sessions"
        view.backgroundColor = .systemGray5        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = padding
        layout.minimumInteritemSpacing = padding
        
        let dateFormat = DateFormatter()
        let timeFormat = DateFormatter()
        let date = Date()
        timeFormat.dateFormat = "h:mm a"
        dateFormat.dateFormat = "MM/dd/yyyy"
        let timeString = timeFormat.string(from: date)
        let dateString = dateFormat.string(from: date)

        
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemGray5
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        
        collectionView.register(SessionCollectionViewCell.self, forCellWithReuseIdentifier: studyReuseIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        signoutbutton = UIBarButtonItem(title: "Sign Out", style: .plain, target: self, action: #selector(signOut))
        navigationItem.rightBarButtonItem = signoutbutton
        
        setUpConstraints()
         getSessions()

    }

    func setUpConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding)
        ])
    }
    
    func getSessions() {
        NetworkManager.getSessions { sessions in
            self.sessions = sessions
            DispatchQueue.main.async {
                self.collectionView.reloadData()
        }
    }
    }
    
    @objc func signOut(_ sender: AnyObject) {
        GIDSignIn.sharedInstance().signOut()
//        UIApplication.sharedApplication.window.rootViewController = SignInViewController()
        let signInVC = SignInViewController()
        navigationController?.pushViewController(signInVC, animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        getSessions()
    }

}

extension ViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let newView = SessionInfoViewController(sessionObject: sessions[indexPath.row])
        newView.delegate = self
        let modalNavigationVC = UINavigationController(rootViewController: newView)
        navigationController?.present(modalNavigationVC, animated: true, completion: nil)
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sessions.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: studyReuseIdentifier, for: indexPath) as! SessionCollectionViewCell
        cell.configure(for: sessions[indexPath.row])
        cell.backgroundColor = .white
        cell.layer.cornerRadius = 8
        return cell
    }
    
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (collectionView.frame.width - padding) / 2
        return CGSize(width: size, height: size)
    }
}

extension ViewController: SessionInfoDelegate{
    func sessionInfoDelegate() {
        collectionView.reloadData()
    }
}
