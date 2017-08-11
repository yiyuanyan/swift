//
//  DetailTableViewController.swift
//  FansArea2
//
//  Created by 何建新 on 2017/8/9.
//  Copyright © 2017年 Talk GoGo. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController {
    @IBOutlet weak var LargeImageView: UIImageView!

    @IBOutlet weak var ratingBtn: UIButton!
    @IBOutlet weak var fieldLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    var area:Area!;
    override func viewDidLoad() {
        super.viewDidLoad()
        LargeImageView.image = UIImage.init(named: area.image);
        tableView.backgroundColor = UIColor.init(white: 0.98, alpha: 1);
        tableView.tableFooterView = UIView.init(frame: CGRect.zero);
        tableView.separatorColor = UIColor.init(white: 0.9, alpha: 1);
        tableView.estimatedRowHeight = 36;
        tableView.rowHeight = UITableViewAutomaticDimension;
        self.title = area.name;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1;
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 4;
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell", for: indexPath) as! DetailTableViewCell;
        switch indexPath.row {
        case 0:
            cell.fieldLabel.text = "地区";
            cell.valueLabel.text = area.name;
            break;
        case 1:
            cell.fieldLabel.text = "省";
            cell.valueLabel.text = area.province;
            break;
        case 2:
            cell.fieldLabel.text = "地域";
            cell.valueLabel.text = area.part;
            break;
        case 3:
            cell.fieldLabel.text = "是否去过";
            cell.valueLabel.text = area.isVisited ? "去过" : "没去过";
            break;
        default:
            break;
        }
        cell.backgroundColor = UIColor.clear;
        return cell
    }
    
    @IBAction func close(segue:UIStoryboardSegue){
        let reviewVc = segue.source as! ReviewViewController;
        if let rating = reviewVc.rating {
            self.area.rating = rating;
            self.ratingBtn.setImage(UIImage.init(named: rating), for: .normal);
        }
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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
