//
//  ViewController.swift
//  sc2796_p2
//
//  Created by Steven Chen on 9/29/21.
//

import UIKit

class ViewController: UIViewController {
    
    var imageView: UIImageView!
    var titleLabel: UILabel!
    var itemField: UITextField!
    var quantityField: UITextField!
    var addButton: UIButton!
    var textView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .white
        
        setupViews()
        setupConstraints()
        
    }

    func setupViews() {
        
        imageView = UIImageView()
        imageView.image = UIImage(named: "shopping")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        view.addSubview(imageView)
        
        titleLabel = UILabel()
        titleLabel.text = "My Shopping List"
        titleLabel.textColor = .blue
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        itemField = UITextField()
        itemField.textAlignment = .center
        itemField.placeholder = "Item"
        itemField.textColor = .blue
        itemField.layer.borderWidth = 1
        itemField.layer.borderColor = UIColor.blue.cgColor
        itemField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(itemField)
        
        quantityField = UITextField()
        quantityField.textAlignment = .center
        quantityField.placeholder = "Quantity"
        quantityField.textColor = .blue
        quantityField.layer.borderWidth = 1
        quantityField.layer.borderColor = UIColor.blue.cgColor
        quantityField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(quantityField)
        
        addButton = UIButton()
        addButton.titleLabel?.textAlignment = .center
        addButton.setTitle("Add item(s) to List", for: .normal)
        addButton.setTitleColor(.blue, for: .normal)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.layer.borderWidth = 1
        addButton.layer.borderColor = UIColor.blue.cgColor
        addButton.backgroundColor = .green
        addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        view.addSubview(addButton)
        
        textView = UITextView()
        textView.backgroundColor = .lightGray
        textView.text = "Items to buy:"
        textView.font = UIFont.systemFont(ofSize: 18)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isEditable = false
        textView.isScrollEnabled = true
        view.addSubview(textView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 191),
            imageView.widthAnchor.constraint(equalToConstant: 287)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        NSLayoutConstraint.activate([
            itemField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            itemField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            itemField.widthAnchor.constraint(equalToConstant:325),
            itemField.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        NSLayoutConstraint.activate([
            quantityField.topAnchor.constraint(equalTo: itemField.bottomAnchor, constant: 5),
            quantityField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            quantityField.widthAnchor.constraint(equalToConstant: 150),
            quantityField.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: quantityField.bottomAnchor, constant: 30),
            addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addButton.widthAnchor.constraint(equalToConstant: 200),
            addButton.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: 40),
            textView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            textView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
    }
    
    @objc func addButtonTapped() {
        if addButton.isTouchInside && itemField.text != "" && quantityField.text != ""{
                textView.text = textView.text + "\n" + "- " + itemField.text! + " (" + quantityField.text! + ")"
        } else {
            textView.text = textView.text
        }
    }
}

