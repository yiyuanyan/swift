//
//  AddAreaController.swift
//  FansArea2
//
//  Created by 何建新 on 2017/8/11.
//  Copyright © 2017年 Talk GoGo. All rights reserved.
//

import UIKit

class AddAreaController: UITableViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var coverImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.row == 0){
            //判断是否可以访问相册
            guard UIImagePickerController.isSourceTypeAvailable(.photoLibrary) else {
                //不可访问相册则直接退出
                print("相册不可用");
                return;
            }
            //相册控制器
            let pciker = UIImagePickerController();
            //不可编辑相册
            pciker.allowsEditing = false;
            //访问相册\相机等
            pciker.sourceType = .photoLibrary;
            pciker.delegate = self;
            self.present(pciker, animated: true, completion: { 
                
            });
        }
        
        
        tableView.deselectRow(at: indexPath, animated: true);
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        coverImageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage;
        coverImageView.contentMode = .scaleAspectFill;
        coverImageView.clipsToBounds = true;
        dismiss(animated: true, completion: nil);
    }
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
