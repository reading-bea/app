//
//  FamilySetup.swift
//  reading-bea
//
//  Created by Craig Harvie on 26/02/2019.
//  Copyright © 2019 Reading Bea. All rights reserved.
//

import UIKit

private let familyMemberReuseIdentifier = "familyMemberCell"
private let addFamilyMemberReuseIdentifier = "addFamilyMemberCell"
private let addFamilyMemberStoryboardIdentifier = "addFamilyMemberController"
private let numberOfItems = 1
private let sectionInsetsTotal = CGFloat(30)

class FamilySetup: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(addTapped))
        doneButton.setTitleTextAttributes([
            NSAttributedString.Key.font: UIFont(name: "Varela Round", size: 16.0)!,
            NSAttributedString.Key.foregroundColor: Colours.baseBlack],
                                              for: .normal)
        self.navigationItem.rightBarButtonItem = doneButton
    }
    
    @objc func addTapped() {
        print("done")
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfItems + 1 // number of family members + 1 (for the add button)
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == (numberOfItems) {
            let addButtonCell = collectionView.dequeueReusableCell(withReuseIdentifier: addFamilyMemberReuseIdentifier, for: indexPath) as! AddFamilyMember
            
            addButtonCell.iconContainerView.layer.cornerRadius = 20
            
            return addButtonCell
        } else {
            let familyMemberCell = collectionView.dequeueReusableCell(withReuseIdentifier: familyMemberReuseIdentifier, for: indexPath) as! FamilyMember
            
            familyMemberCell.containerView.layer.cornerRadius = 10
            familyMemberCell.iconContainerView.layer.cornerRadius = 20
            familyMemberCell.containerView.dropShadow(scale: false)
            
            return familyMemberCell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenSize: CGRect = UIScreen.main.bounds
        let screenWidth = screenSize.width - sectionInsetsTotal
        return CGSize(width: (screenWidth/2), height: (screenWidth/2));
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.item == (numberOfItems) {
            if let addFamilyMemberController = self.storyboard?.instantiateViewController(withIdentifier: addFamilyMemberStoryboardIdentifier) as? NewFamilyMember {
                self.navigationController?.pushViewController(addFamilyMemberController, animated: true)
            }
            
            print("add button clicked")
        }
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }
     
    */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using [segue destinationViewController].
     // Pass the selected object to the new view controller.
     }
     */

}
