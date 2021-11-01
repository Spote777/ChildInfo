//
//  ExtensionFamilyViewController.swift
//  InfoUser
//
//  Created by Павел Заруцков on 01.10.2021.
//

import UIKit

extension FamilyViewController: UITableViewDelegate, UITableViewDataSource, AnswerCellUITextFieldChanged {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return childNameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ChildTableViewCell
        
        cell.fioChild.text = childNameArray[indexPath.row]
        cell.ageChild.text = childAgeArray[indexPath.row]
        cell.childId = indexPath.row
        cell.nameAndAgeFieldsChangled = self
        cell.configureCell()
        return cell
    }
    
    func didAnswerTextFieldChanged(childId: Int, childName: String, childAge: String) {
        childNameArray[childId] = childName
        childAgeArray[childId] = childAge
    }
    
}
