//
//  ExtensionVC.swift
//  InfoUser
//
//  Created by Павел Заруцков on 01.10.2021.
//

import UIKit

extension UIViewController {
func showActionSheetWithCancel(title: [ActionSheetLabel], action: @escaping () -> ()?) {
    let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
    for value in title {
        actionSheet.addAction(UIAlertAction(title: value.rawValue, style: .default, handler: {
            (alert: UIAlertAction!) -> Void in
           // action
            action()

        }))
    }
    let alertAction = UIAlertAction(title: ActionSheetLabel.cancel.rawValue, style: .cancel) { (_) in
        action() // or for cancel call it here
    }
    actionSheet.addAction(alertAction)
    self.present(actionSheet, animated: true, completion: nil)


  }
}
