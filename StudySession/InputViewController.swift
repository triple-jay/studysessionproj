//
//  InputViewController.swift
//  StudySession
//
//  Created by Jeremy Jung on 11/16/19.
//  Copyright © 2019 Jeremy Jung. All rights reserved.
//

import UIKit

protocol didSelectImageDelegate : AnyObject {
    func sendImage(imageString: String)
}

class InputViewController: UIViewController {
    
    var titleField: UITextField!
    var locationField: UITextField!
    var descriptionField: UITextField!
    var dateField: UIDatePicker!
    var selectButton: UIButton!
    var fieldsButton: UIButton!
    var imageString: String!
    
    var durationScrollDelegate: UIPickerViewDelegate!
    var durationScrollData: UIPickerViewDataSource!
    var durationScroll: UIPickerView!
    var durationField: UITextField!
    var durationScrollValue: [String] = []
    var bar: UIToolbar!
    var durationValue: Int = 0
    
    var sessions: [Session]!
    
//    location picker, pickPhoto(included) or Other(pickfromphotos/upload)

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        title = "New Session"
        
        let toolbarFrame = CGRect(x: 0, y: 0,
          width: view.frame.width, height: 44)
        bar = UIToolbar(frame: toolbarFrame)
        bar.translatesAutoresizingMaskIntoConstraints = false
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(back(sender:)))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
          target: nil,
          action: nil)
        bar.items = [flexibleSpace, doneButton]
        
        titleField = UITextField()
        titleField.translatesAutoresizingMaskIntoConstraints = false
        titleField.placeholder = "Title"
        titleField.textAlignment = .center
        titleField.contentVerticalAlignment = .top
        titleField.layer.borderWidth = 1
        titleField.layer.borderColor = UIColor.systemBlue.cgColor
        titleField.textColor = .black
        titleField.layer.cornerRadius = 5
        titleField.font = .systemFont(ofSize: 20)
        view.addSubview(titleField)
        
        locationField = UITextField()
        locationField.translatesAutoresizingMaskIntoConstraints = false
        locationField.placeholder = "Location Description"
        locationField.textAlignment = .center
        locationField.contentVerticalAlignment = .top
        locationField.layer.borderWidth = 1
        locationField.layer.borderColor = UIColor.systemBlue.cgColor
        locationField.textColor = .black
        locationField.layer.cornerRadius = 5
        locationField.font = .systemFont(ofSize: 20)
        view.addSubview(locationField)
        
        descriptionField = UITextField()
        descriptionField.translatesAutoresizingMaskIntoConstraints = false
        descriptionField.placeholder = "Description"
        descriptionField.textAlignment = .center
        descriptionField.contentVerticalAlignment = .top
        descriptionField.layer.borderWidth = 1
        descriptionField.layer.borderColor = UIColor.systemBlue.cgColor
        descriptionField.textColor = .black
        descriptionField.layer.cornerRadius = 5
        descriptionField.font = .systemFont(ofSize: 20)
        view.addSubview(descriptionField)
        
        dateField = UIDatePicker()
        dateField.translatesAutoresizingMaskIntoConstraints = false
//        var mindatecompo = DateComponents()
//        mindatecompo.calendar = Calendar(identifier: .gregorian)
//        mindatecompo.year =
        dateField.minimumDate = NSDate() as Date

//              let timeFormat = DateFormatter()
//              let date = Date()
//              timeFormat.dateFormat = "h:mm a"
//              dateFormat.dateFormat = "MM/dd/yyyy"
//              let timeString = timeFormat.string(from: date)
//              let dateString = dateFormat.string(from: date)
//        date.string(format: "h:mm a")
        view.addSubview(dateField)
                
        fieldsButton = UIButton()
        fieldsButton.translatesAutoresizingMaskIntoConstraints = false
        fieldsButton.setTitle("Upload", for: .normal)
        fieldsButton.setTitleColor(.blue, for: .normal)
        fieldsButton.addTarget(self, action: #selector(upload), for: .touchUpInside)
        view.addSubview(fieldsButton)
        
        selectButton = UIButton()
        selectButton.translatesAutoresizingMaskIntoConstraints = false
        selectButton.setTitle("Select Image", for: .normal)
        selectButton.setTitleColor(.blue, for: .normal)
        selectButton.addTarget(self, action: #selector(chooseImage), for: .touchUpInside)
        view.addSubview(selectButton)
        
        durationScroll = UIPickerView()
        durationField = UITextField()
        durationScrollValue = ["1","2","3","4","5","6","7","8"]
        durationScroll.delegate = durationScrollDelegate
        durationField.inputView = durationScroll
        durationScroll.delegate = self
        durationField.translatesAutoresizingMaskIntoConstraints = false
        durationField.placeholder = "Pick Duration"
        durationField.textAlignment = .center
        durationField.contentVerticalAlignment = .top
        durationField.layer.borderWidth = 1
        durationField.layer.borderColor = UIColor.systemBlue.cgColor
        durationField.textColor = .black
        durationField.layer.cornerRadius = 5
        durationField.font = .systemFont(ofSize: 20)
        durationField.inputAccessoryView = bar
        
//        backButton = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(back))
//        navigationItem.leftBarButtonItem = backButton
//
        view.addSubview(durationField)
        
        
        setupConstraints()
        
    }
    
    func setupConstraints() {
         NSLayoutConstraint.activate([
            titleField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            titleField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleField.heightAnchor.constraint(equalToConstant: 30),
            titleField.widthAnchor.constraint(equalToConstant: 350)
               ])
        
        NSLayoutConstraint.activate([
            locationField.topAnchor.constraint(equalTo: titleField.bottomAnchor, constant: 20),
            locationField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            locationField.heightAnchor.constraint(equalToConstant: 30),
            locationField.widthAnchor.constraint(equalToConstant: 350)
        ])
        
        NSLayoutConstraint.activate([
            descriptionField.topAnchor.constraint(equalTo: locationField.bottomAnchor, constant: 20),
            descriptionField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            descriptionField.heightAnchor.constraint(equalToConstant: 100),
            descriptionField.widthAnchor.constraint(equalToConstant: 350)
        ])
        NSLayoutConstraint.activate([
            durationField.topAnchor.constraint(equalTo: descriptionField.bottomAnchor, constant: 20),
            durationField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            durationField.heightAnchor.constraint(equalToConstant: 30),
            durationField.widthAnchor.constraint(equalToConstant: 350)
        ])
        
        NSLayoutConstraint.activate([
            dateField.topAnchor.constraint(equalTo: durationField.bottomAnchor, constant: 20),
            dateField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dateField.heightAnchor.constraint(equalToConstant: 130),
            dateField.widthAnchor.constraint(equalToConstant: 350)
        ])
        
        NSLayoutConstraint.activate([
            selectButton.topAnchor.constraint(equalTo: dateField.bottomAnchor, constant: 20),
            selectButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            selectButton.heightAnchor.constraint(equalToConstant: 30),
            selectButton.widthAnchor.constraint(equalToConstant: 140)
        ])
        
        NSLayoutConstraint.activate([
            fieldsButton.topAnchor.constraint(equalTo: selectButton.bottomAnchor, constant: 20),
            fieldsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            fieldsButton.heightAnchor.constraint(equalToConstant: 30),
            fieldsButton.widthAnchor.constraint(equalToConstant: 140)
        ])
        
    }
    @objc func back(sender: UIBarButtonItem){
        if durationField.isFirstResponder {
            durationField.resignFirstResponder()
        }
    }
    
    @objc func upload(){
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "MM/dd/yyyy"
        let date = dateFormat.string(from: dateField.date)
        let timeFormat = DateFormatter()
        timeFormat.dateFormat = "h:mm a"
        let time = timeFormat.string(from: dateField.date)
        let object = Session(name: titleField.text ?? "No name", date: date, time: time, description: descriptionField.text ?? "No description", duration: durationValue, image: imageString ?? "history", location: locationField.text ?? "No location")
        print(object)
        checkDuplicateSessions(object: object)
        titleField.text = ""
        descriptionField.text = ""
        locationField.text = ""
        durationField.text = ""
        durationScroll.selectRow(0, inComponent: 0, animated: true)
        dateField.date = NSDate() as Date
        
    }
    
    @objc func chooseImage() {
        let viewController = SelectPictureViewController()
        viewController.delegate = self
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    func checkDuplicateSessions(object: Session) {
        NetworkManager.getSessions { sessions in
            self.sessions = sessions
            if !sessions.contains(where: { $0 == object}) {
                NetworkManager.postSessions(object: object)
            }}
    }
    
   
}

extension InputViewController: didSelectImageDelegate {
    func sendImage(imageString: String) {
        self.imageString = imageString
    }
}

//extension InputViewController: UIImagePickerControllerDelegate {
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        <#code#>
//    }
//
//    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
//        <#code#>
//    }
//}
extension InputViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return durationScrollValue.count
    }
}
extension InputViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return durationScrollValue[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        durationValue = Int(durationScrollValue[row]) ?? 0
        durationField.text = "\(durationScrollValue[row]) hours"
        if "\(durationScrollValue[row])" == "1"{
            durationField.text = "\(durationScrollValue[row]) hour"
        }
    }
}
