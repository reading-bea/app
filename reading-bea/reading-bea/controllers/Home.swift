//
//  Home.swift
//  reading-bea
//
//  Created by Craig Harvie on 26/02/2019.
//  Copyright © 2019 Reading Bea. All rights reserved.
//

import UIKit

private let childReuseIdentifier = "childTableCell"
private let bookRecordingIdentifier = "bookRecordingTableCell"

private let homeScreenData = [
    ["name": "Alfie", "type": "child"],
    ["name": "Bea", "type": "child"],
    ["name": "Odie", "type": "child"],
    ["title": "book 1 mate with a really long title that might span over", "author": "Jimmy The Kid", "recordedBy": "Craig", "type": "recording"],
    ["title": "book 2 mate", "author": "Franky is a very long name for an author", "recordedBy": "Craig", "type": "recording"],
    ["title": "book 3 mate", "author": "Jimmy", "recordedBy": "Craig", "type": "recording"],
    ["title": "book 4 mate", "author": "Henry", "recordedBy": "Alfie", "type": "recording"],
    ["title": "book 5 mate", "author": "Thomas", "recordedBy": "Craig", "type": "recording"],
    ["title": "book 6 mate", "author": "Perry", "recordedBy": "Alex", "type": "recording"],
    ["title": "book 7 mate", "author": "Xzavier", "recordedBy": "Craig", "type": "recording"],
    ["title": "book 8 mate", "author": "Pablo", "recordedBy": "Anna-Marie-Esmarelda jrkmrfrij rifjrif rifr", "type": "recording"]
]

class Home: UITableViewController {
    
    // The magic enum to end our pain and suffering!
    // For the most part the order of our cases do not matter.
    // What is important is that our first case is set to 0, and that our last case is always `total`.
    enum TableSection: Int {
        case children = 0, recordings, drama, indie, total
    }
    
    // This is the size of our header sections that we will use later on.
    let SectionHeaderHeight: CGFloat = 40
    
    // Data variable to track our sorted data.
    var data = [TableSection: [[String: String]]]()
    
    // When generating sorted table data we can easily use our TableSection to make look up simple and easy to read.
    func sortData() {
        data[.children] = homeScreenData.filter({ $0["type"] == "child" })
        data[.recordings] = homeScreenData.filter({ $0["type"] == "recording" })
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
        sortData()
        self.tableView.estimatedRowHeight = 60
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return TableSection.total.rawValue
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Using Swift's optional lookup we first check if there is a valid section of table.
        // Then we check that for the section there is data that goes with.
        if let tableSection = TableSection(rawValue: section), let childData = data[tableSection] {
            return childData.count
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if let tableSection = TableSection(rawValue: section), let childData = data[tableSection], childData.count > 0 {
            return SectionHeaderHeight
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: SectionHeaderHeight))
        view.backgroundColor = UIColor.white
        let label = UILabel(frame: CGRect(x: 15, y: 0, width: tableView.bounds.width - 30, height: SectionHeaderHeight))
        label.font = UIFont(name: "Fredoka One", size: 17.0)
        label.textColor = Colours.baseBlack
        if let tableSection = TableSection(rawValue: section) {
            switch tableSection {
            case .children:
                label.text = "Your kids"
            case .recordings:
                label.text = "Your stories"
            case .drama:
                label.text = "Drama"
            case .indie:
                label.text = "Indie"
            default:
                label.text = ""
            }
        }
        view.addSubview(label)
        return view
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let tableSection = TableSection(rawValue: indexPath.section), let dataItem = data[tableSection]?[indexPath.row] {
            if (dataItem["type"] == "child") {
                if let cell = tableView.dequeueReusableCell(withIdentifier: childReuseIdentifier, for: indexPath) as? Child {
                    cell.iconView.layer.cornerRadius = 20
                    cell.childNameLabel.text = dataItem["name"]
                    cell.iconLabel.text = String(dataItem["name"]!.prefix(1)).uppercased()
                    return cell
                }
            } else if (dataItem["type"] == "recording") {
                if let cell = tableView.dequeueReusableCell(withIdentifier: bookRecordingIdentifier, for: indexPath) as? BookRecording {
                    cell.bookTitle.text = dataItem["title"]
                    cell.bookImage.downloaded(from: "http://books.google.com/books/content?id=7yW4AwAAQBAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api")
                    if let author = dataItem["author"] {
                        cell.bookAuthor.text = "By \(author)"
                    }
                    if let recordedByText = dataItem["author"] {
                        cell.recordedBy.text = "Recorded by \(recordedByText)"
                    }
                    return cell
                }
                print(dataItem)
            }
        }
        
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return UITableView.automaticDimension;
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
