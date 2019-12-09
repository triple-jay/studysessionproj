//
//  FavSessionInfoViewController.swift
//  StudySession
//
//  Created by Christy Song on 12/7/19.
//  Copyright © 2019 Jeremy Jung. All rights reserved.
//

import UIKit
import MapKit

class FavSessionInfoViewController: UIViewController {

        var photoImage: UIImageView!
        var className: UILabel!
        var date: UILabel!
        var time: UILabel!
        var location: UILabel! //googlemap
        var descriptionField: UITextView!
        var backButton: UIBarButtonItem!
        var deleteButton: UIBarButtonItem!
        var mapView: MKMapView!
        
        var sessionObject: Session!
        
        var favdelegate: FavSessionInfoDelegate?
        
        init(sessionObject: Session) {
            self.sessionObject = sessionObject

            super.init(nibName: nil, bundle: nil)
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override func viewDidLoad() {
            super.viewDidLoad()

            title = "\(sessionObject.name)"
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
            
            location = UILabel()
            location.translatesAutoresizingMaskIntoConstraints = false
            location.text = "Location: \(sessionObject.location)"
            location.font = UIFont.systemFont(ofSize: 16)
            location.textColor = .black
            view.addSubview(location)
            
            descriptionField = UITextView()
            descriptionField.text = "Description:\n\n   \(sessionObject.description)"
            descriptionField.translatesAutoresizingMaskIntoConstraints = false
            descriptionField.textAlignment = .natural
            descriptionField.textColor = .black
            descriptionField.isEditable = false
            descriptionField.font = .systemFont(ofSize: 16)
            view.addSubview(descriptionField)
            
            mapView = MKMapView()
            mapView.translatesAutoresizingMaskIntoConstraints = false
            // set initial location to Duffield Hall
            let initial = CLLocation(latitude: 42.4449, longitude: -76.4830)
            let initialLocation = SetLocation(title: "Duffield", locationName: "Duffield", discipline: "Hall", coordinate: CLLocationCoordinate2D(latitude: 42.4449, longitude: -76.4830))
            mapView.addAnnotation(initialLocation)
            view.addSubview(mapView)
            
            backButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(back))
            navigationItem.leftBarButtonItem = backButton
            
            deleteButton = UIBarButtonItem(title: "Delete", style: .plain, target: self, action: #selector(deleteFromSessions))
            navigationItem.rightBarButtonItem = deleteButton
            
            
            setupConstraints()
            centerMapOnLocation(location: initial)
        }
        
        func setupConstraints(){
            NSLayoutConstraint.activate([
                photoImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
    //            photoImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
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
                descriptionField.leadingAnchor.constraint(equalTo: date.leadingAnchor),
                descriptionField.widthAnchor.constraint(equalToConstant: 360),
                descriptionField.heightAnchor.constraint(equalToConstant: 130),
            ])
            NSLayoutConstraint.activate([
                location.topAnchor.constraint(equalTo: descriptionField.bottomAnchor, constant: 10),
                location.leadingAnchor.constraint(equalTo: date.leadingAnchor),
                location.trailingAnchor.constraint(equalTo: date.trailingAnchor),
                location.heightAnchor.constraint(equalToConstant: 20)
            ])
            NSLayoutConstraint.activate([
                mapView.topAnchor.constraint(equalTo: location.bottomAnchor, constant: 10),
                mapView.leadingAnchor.constraint(equalTo: date.leadingAnchor),
                mapView.widthAnchor.constraint(equalToConstant: 360),
                mapView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
            ])
            
    //        NSLayoutConstraint.activate([
    //            addToMySessionButton.topAnchor
    //        ])
        }
        let regionRadius: CLLocationDistance = 1000
        func centerMapOnLocation(location: CLLocation) {
            let coordinateRegion = MKCoordinateRegion(center: location.coordinate,
                                                      latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
          mapView.setRegion(coordinateRegion, animated: true)
        }

       @objc func back(){
           dismiss(animated: true, completion: nil)
       }
    @objc func deleteFromSessions(){
        if let storedFavorites = userDefaults.data(forKey: Strings.favorites),
            var favorites = try? decoder.decode([Session].self, from: storedFavorites) {
            if favorites.contains(where: { $0 == sessionObject}) {
                if let index = favorites.firstIndex(of: sessionObject) {
                    favorites.remove(at: index)
                }
                
            }
            print(favorites)
            if let encodedFavorites = try? encoder.encode(favorites) {
                userDefaults.set(encodedFavorites, forKey: Strings.favorites)
                dismiss(animated: true, completion: nil)
            }
            
        }
    }
    }

        




