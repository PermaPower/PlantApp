//
//  CreatePlantController.swift
//  PlantApp
//
//  Created by MacOS on 3/5/19.
//  Copyright © 2019 MacOS. All rights reserved.
//

import UIKit

// Properties
let plantType = ["Tree", "Seed", "Seedling"]

protocol CreatePlantControllerDelegate {
    func didAddPlant(plantDeleagate: Plant)
}

class CreatePlantController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    // Link the controllers
    var delegate: CreatePlantControllerDelegate?
    
    let backgroundColorForView: UIView = {
        let view = UIView()
        view.backgroundColor = .clightBlue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter name"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let plantPicker: UIPickerView = {
        let plantPickerView = UIPickerView()
        plantPickerView.translatesAutoresizingMaskIntoConstraints = false
        return plantPickerView
    }()
    
    let pickerLabel: UILabel = {
        let label = UILabel()
        label.text = "Type"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        
        view.backgroundColor = .cdarkBlue
        
        navigationItem.title = "Create Plant"
        
        setupNavigationButtons()
        
        plantPicker.dataSource = self
        plantPicker.delegate = self
        
        setupUI()
    }
    
    private func setupNavigationButtons(){
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(handleCancelPlantsCreateButton))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(handleSavePlantsCreateButton))
        
    }
    
    private func setupUI(){
        
        view.addSubview(backgroundColorForView)
        view.addSubview(nameLabel)
        view.addSubview(nameTextField)
        view.addSubview(pickerLabel)
        view.addSubview(plantPicker)
        
        backgroundColorForView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundColorForView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        backgroundColorForView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        nameLabel.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        nameTextField.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        nameTextField.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        nameTextField.leftAnchor.constraint(equalTo: nameLabel.rightAnchor).isActive = true
        nameTextField.bottomAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
        
        pickerLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
        pickerLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        pickerLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        pickerLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        plantPicker.topAnchor.constraint(equalTo: nameTextField.bottomAnchor).isActive = true
        plantPicker.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        plantPicker.leftAnchor.constraint(equalTo: pickerLabel.rightAnchor).isActive = true
        plantPicker.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
       
        backgroundColorForView.bottomAnchor.constraint(equalTo: plantPicker.bottomAnchor).isActive = true
        
        
    }
    
    @objc func handleCancelPlantsCreateButton(){
        print("Cancel button pressed")
        
        dismiss(animated: true, completion: nil)
    }
    
    @objc func handleSavePlantsCreateButton(){
        
        dismiss(animated: true) {
            // Execute Code after dismissal has taken place
            
            guard let plantName = self.nameTextField.text else { return }
            
            let newPlant = Plant(name: plantName, date: Date())
        
            self.delegate?.didAddPlant(plantDeleagate: newPlant)
        }
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return plantType.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return plantType[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
            let pLabel: UIView = {
                let pLabel = UILabel()
                pLabel.textAlignment = .left
                pLabel.text = plantType[row]
                pLabel.textColor = .cTeal
                return pLabel
        }()
        
        return pLabel
    }
}