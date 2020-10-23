//
//  TableViewController.swift
//  SearchItems
//
//  Created by MAC on 16/10/20.
//

import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating{
 
    
    @IBOutlet weak var listTable: UITableView!
    let tableData = ["One","Two","Three","Four","Five"]
    var filteredTableData = [String]()
    var resultSearchBar = UISearchBar()
    var isActive = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultSearchBar = ({
            let search = UISearchBar(frame: CGRect(x: 0, y: 0, width:(UIScreen.main.bounds.size.width), height: 50))
            
            listTable.tableHeaderView = search
            
            return search
        })()
        
        listTable.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(isActive)
        if isActive {
            print(filteredTableData.count)
            return filteredTableData.count
            
        } else {
            print(tableData.count)
            return tableData.count
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = listTable.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
  //  if
        //isActive
//        {
//            cell.textLabel?.text = filteredTableData[indexPath.row]
//            isActive = false
//            return cell
//        }
//        else
//        {
            cell.textLabel?.text = tableData[indexPath.row]
            print(tableData[indexPath.row])
            isActive = true
            return cell
        //`}
    }
        func updateSearchResults(for searchController: UISearchController) {
            //filteredTableData.removeAll(keepingCapacity: false)
    
            let searchPredicate = NSPredicate(format: "SELF CONTAINS[c] %@", resultSearchBar.text!)
                let array = (tableData as NSArray).filtered(using: searchPredicate)
                filteredTableData = array as! [String]
                print(filteredTableData)
                self.listTable.reloadData()
            isActive = true
        }
}
