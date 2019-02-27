//
//  Login.swift
//  reading-bea
//
//  Created by Craig Harvie on 25/02/2019.
//  Copyright © 2019 Reading Bea. All rights reserved.
//

import UIKit

class Login: UIViewController {
    
    @IBOutlet weak var iconUsernameTextField: UITextField! {
        didSet {
            iconUsernameTextField.layer.cornerRadius = 10
            iconUsernameTextField.tintColor = Colours.baseBlack
            iconUsernameTextField.setIcon(UIImage(imageLiteralResourceName: "user"))
        }
    }
    
    @IBOutlet weak var iconPasswordTextField: UITextField! {
        didSet {
            iconPasswordTextField.layer.cornerRadius = 10
            iconPasswordTextField.tintColor = Colours.baseBlack
            iconPasswordTextField.setIcon(UIImage(imageLiteralResourceName: "password"))
        }
    }

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    private func setupUI() {
        self.loginButton.layer.cornerRadius = 10
    }

    @IBAction func onClickCancelButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
