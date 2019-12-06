//
//  MainTableViewController.swift
//  BookToDoList
//
//  Created by Yvonne on 2019/12/5.
//  Copyright © 2019 Yvonne. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {
  //   var booksName = ["goes to school","up","my hair","AAA"]
    
    var booksName = [Alist(name: "goes to school", imageName: "goes to school"),Alist(name: "up", imageName: "up"),Alist(name: "my hair", imageName: "myHair"),Alist(name: "fact", imageName: "4"),Alist(name: "show", imageName: "5")]
    
    var markOrNot = Array(repeating: false, count: 20)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
   //  var markOrNot = Array(repeating: false, count: booksName.count)
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return booksName.count
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ATableViewCell

        // Configure the cell...
//        cell.textLabel?.text = booksName[indexPath.row]
//        cell.imageView?.image = UIImage(named: "book")
        
        cell.nameLabel.text = booksName[indexPath.row].name
        cell.bookImageVIew.image = UIImage(named: booksName[indexPath.row].imageName)
        
        cell.accessoryType = markOrNot[indexPath.row] ?.checkmark:.none
        
        if indexPath.row % 5 == 0{
            cell.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        }else if indexPath.row % 5 == 1{
            cell.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
        }else if indexPath.row % 5 == 2{
            cell.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        }else if indexPath.row % 5 == 3{
            cell.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        }else if indexPath.row % 5 == 4{
            cell.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        }
        
        return cell
    }
   
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        tableView.deselectRow(at: indexPath, animated: false)
        
        let cell = tableView.cellForRow(at: indexPath)
        cell?.accessoryType = .checkmark
    //    markOrNot[indexPath.row] = true
        switch markOrNot[indexPath.row]{
        case true :
            markOrNot[indexPath.row] = false
        case false :
            markOrNot[indexPath.row] = true
        }
     tableView.reloadData()
        
    }
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delet") { (action, sourceView, completionHandler) in
            self.booksName.remove(at: indexPath.row)
            self.markOrNot.remove(at: indexPath.row)
            
            self.tableView.deleteRows(at: [indexPath], with: .fade)
            completionHandler(true)
        }
        
        let shareAction = UIContextualAction(style: .normal, title: "Share") { (action, sourceView, completionHandler) in
            
   //         let shareText = "分享" + self.booksName[indexPath.row]
            let shareText = "SHARE"
            let activtyController = UIActivityViewController(activityItems: [shareText], applicationActivities: nil)
        
            
            self.present(activtyController,animated: true,completion: nil)
            completionHandler(true)
        }
        
        deleteAction.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        shareAction.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        
        let swipeC = UISwipeActionsConfiguration(actions: [deleteAction,shareAction])
        return swipeC
        
    }
      
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            // Delete the row from the data source
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        } else if editingStyle == .insert {
//            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
//        }
//    }
   

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
