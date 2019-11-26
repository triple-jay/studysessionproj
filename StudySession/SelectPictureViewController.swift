//
//  SelectPictureViewController.swift
//  StudySession
//
//  Created by Jeremy Jung on 11/23/19.
//  Copyright © 2019 Jeremy Jung. All rights reserved.
//

import UIKit

class SelectPictureViewController: UIViewController {

    let imageReuseIdentifier: String = "imageReuseIdentifier"
    let padding: CGFloat = 15
    var collectionView: UICollectionView!
    
    var images: [Image]!
    
    weak var delegate: didSelectImageDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Select Image"
        view.backgroundColor = .systemGray5
        
        let math = Image(image: "math")
        let history = Image(image: "history")
        let comsci = Image(image: "comsci")
        let biology = Image(image: "bio")
        
        images = [math, history, comsci, biology]
               
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = padding
        layout.minimumInteritemSpacing = padding
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemGray5
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
               
        collectionView.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: imageReuseIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        setUpConstraints()
        
        // Do any additional setup after loading the view.
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding)
        ])
    }
    

    
}

extension SelectPictureViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let image = images[indexPath.row]
        let imageString = image.image
        delegate?.sendImage(imageString: imageString)
        navigationController?.popViewController(animated: true)
    }
}

extension SelectPictureViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: imageReuseIdentifier, for: indexPath) as! ImageCollectionViewCell
        cell.configure(for: images[indexPath.row])
        cell.backgroundColor = .white
        cell.layer.cornerRadius = 8
        return cell
    }
    
    
}

extension SelectPictureViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (collectionView.frame.width - padding) / 2
        return CGSize(width: size, height: size)
    }
}

extension SelectPictureViewController: SessionInfoDelegate{
    func sessionInfoDelegate() {
        collectionView.reloadData()
    }
}
