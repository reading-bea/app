//
//  AddFamilyMember.swift
//  reading-bea
//
//  Created by Craig Harvie on 26/02/2019.
//  Copyright © 2019 Reading Bea. All rights reserved.
//

import UIKit

class NewFamilyMember: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var statusOption: UISegmentedControl!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameTextField.setIcon(UIImage(imageLiteralResourceName: "user"))
        self.nameTextField.layer.cornerRadius = 10
        self.statusOption.layer.cornerRadius = 10
        self.loginButton.layer.cornerRadius = 10
        self.statusOption.layer.borderColor = Colours.baseBlack.cgColor
        self.statusOption.layer.borderWidth = 1.0;
        self.statusOption.layer.masksToBounds = true
    }
    
    @IBAction func onClickAddButton(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
