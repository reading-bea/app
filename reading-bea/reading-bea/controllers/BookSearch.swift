//
//  BookSearch.swift
//  reading-bea
//
//  Created by Craig Harvie on 27/02/2019.
//  Copyright © 2019 Reading Bea. All rights reserved.
//

import UIKit

private let bookCellIdentifier = "bookTableCell"

class BookSearch: UITableViewController, UISearchBarDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    
    var searchActive : Bool = false
    let books = [
        ["title": "book 1 mate with a really long title that might span over", "author": "Jimmy The Kid", "recordedBy": "Craig", "type": "recording"],
        ["title": "book 2 mate", "author": "Franky is a very long name for an author", "recordedBy": "Craig", "type": "recording"],
        ["title": "book 3 mate", "author": "Jimmy", "recordedBy": "Craig", "type": "recording"],
        ["title": "book 4 mate", "author": "Henry", "recordedBy": "Alfie", "type": "recording"],
        ["title": "book 5 mate", "author": "Thomas", "recordedBy": "Craig", "type": "recording"],
        ["title": "book 6 mate", "author": "Perry", "recordedBy": "Alex", "type": "recording"],
        ["title": "book 7 mate", "author": "Xzavier", "recordedBy": "Craig", "type": "recording"],
        ["title": "book 8 mate", "author": "Pablo", "recordedBy": "Anna-Marie-Esmarelda jrkmrfrij rifjrif rifr", "type": "recording"]
    ]
    var filtered: [[String: String]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
        self.tableView.estimatedRowHeight = 60
        searchBar.delegate = self
        searchBar.setFont(textFont: UIFont(name: "Varela Round", size: 15))
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return books.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: bookCellIdentifier, for: indexPath) as? BookRecording {
            let dataItem = books[indexPath.row]
            cell.bookTitle.text = dataItem["title"]
            cell.bookImage.downloaded(from: "http://books.google.com/books/content?id=7yW4AwAAQBAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api")
            if let author = dataItem["author"] {
                cell.bookAuthor.text = "By \(author)"
            }
            return cell
        }
        
        return UITableViewCell()
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchActive = true;
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let filtered = books.filter({ (book) -> Bool in
            if let bookTitle = book["title"] {
                return bookTitle.lowercased().contains(searchText.lowercased())
            }
            return false
        })
        if(filtered.count == 0){
            searchActive = false;
        } else {
            searchActive = true;
        }
        self.tableView.reloadData()
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
