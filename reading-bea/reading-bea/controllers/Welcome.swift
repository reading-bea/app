//
//  Welcome.swift
//  reading-bea
//
//  Created by Craig Harvie on 25/02/2019.
//  Copyright © 2019 Reading Bea. All rights reserved.
//

import UIKit

class Welcome: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    private func setupUI() {
        self.loginButton.layer.cornerRadius = 10
        self.signUpButton.layer.cornerRadius = 10
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
