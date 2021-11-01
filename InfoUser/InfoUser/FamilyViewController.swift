//
//  FamilyViewController.swift
//  InfoUser
//
//  Created by Павел Заруцков on 01.10.2021.
//

import UIKit

protocol AnswerCellUITextFieldChanged {
    func didAnswerTextFieldChanged(childId: Int, childName: String, childAge: String)
}

class FamilyViewController: UIViewController {
    
    @IBOutlet weak var childTableView: UITableView!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var fio: UITextField!
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var deleteAllButton: UIButton!
    
    var childNameArray = [String]()
    var childAgeArray = [String]()
    var childCount = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableviewProtocol()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configButton(addButton, .systemBlue)
        configButton(deleteAllButton, .systemRed)

        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    
    
    @IBAction func deleteChildCell(_ sender: UIButton) {
        let point = sender.convert(CGPoint.zero, to: childTableView)
        guard let indexpath = childTableView.indexPathForRow(at: point) else {return}
        childNameArray.remove(at: indexpath.row)
        childAgeArray.remove(at: indexpath.row)
        childCount -= 1
        hideAddChildButton()
        childTableView.reloadData()
    }
    
    
    @IBAction func deleteAll(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Удалить содержимое?", message: nil, preferredStyle: .actionSheet)
        let  deleteButton = UIAlertAction(title: "Сбросить данные", style: .destructive, handler: { (action) -> Void in
            self.childAgeArray.removeAll()
            self.childNameArray.removeAll()
            self.childCount = 0
            self.fio.text = ""
            self.age.text = ""
            self.hideAddChildButton()
            self.childTableView.reloadData()
        })
    
        let cancelButton = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        
        alertController.addAction(deleteButton)
        alertController.addAction(cancelButton)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func addChildButton(_ sender: UIButton) {
        childNameArray.append("")
        childAgeArray.append("")
        childCount += 1
        hideAddChildButton()
        childTableView.reloadData()
        
    }
    
    private func tableviewProtocol() {
        childTableView.delegate = self
        childTableView.dataSource = self
        
    }
    
    private func configButton(_ button: UIButton, _ borderColor: UIColor) {
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        button.layer.borderWidth = 2
        button.layer.borderColor = borderColor.cgColor
    }
    
    private func hideAddChildButton() {
        if childCount == 5 {
            addButton.isHidden = true
        } else {
            addButton.isHidden = false
        }
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
