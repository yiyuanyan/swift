//
//  AreaTableViewController.swift
//  FansArea
//
//  Created by 何建新 on 2017/8/4.
//  Copyright © 2017年 何建新. All rights reserved.
//

import UIKit

class AreaTableViewController: UITableViewController {
    var areas = ["东城区","西城区","朝阳区","丰台区","石景山区","海淀区","顺义区","通州区","大兴区","房山区"];
    var areaImages = ["xinzhuang","qilihe","youxi","baiyun","shangjie","nangang","yaodu","wuhou","jinping","furong"];
    var provinces = ["上海","甘肃","福建","青海","广东","福建","黑龙江","山西","四川","广东","湖南",];
    var parts = ["华东","西北","东南","西北","华南","东南","东北","华北","西南","华南","华中"];
    //创建一个bool类型的数组，数组为11个false
    var visited = [Bool](repeatElement(false, count: 11));
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
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
        return self.areas.count;
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell;
        cell.nameLabel.text = self.areas[indexPath.row];
        cell.thumbImage.image = UIImage.init(named: areaImages[indexPath.row]);
        //图片切圆角，图片是正方形，cornerRadius是图片的高度的一半。
        cell.thumbImage.layer.cornerRadius = cell.thumbImage.frame.size.height/2;
        //切圆角生效
        cell.thumbImage.clipsToBounds = true;
        cell.partLabel.text = parts[indexPath.row];
        cell.provinceLabel.text = provinces[indexPath.row];
//        if(visited[indexPath.row] == true){
//            cell.accessoryType = .checkmark;
//        }else{
//            cell.accessoryType = .none;
//        }
        cell.accessoryType = visited[indexPath.row] ? .checkmark : .none;
        return cell;
    }
    override var prefersStatusBarHidden: Bool{
        return true;
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80;
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("已经选择了\(indexPath.row)行的CELL");
        let menu = UIAlertController.init(title: "提示", message: "您选择了\(indexPath.row)", preferredStyle: UIAlertControllerStyle.actionSheet);
        let option = UIAlertAction.init(title: "取消", style: .cancel, handler: nil);
        
        let option2 = UIAlertAction.init(title: "我去过", style: .destructive) { (_) in
            //改变选中的cell的状态为打勾状态
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark;
            self.visited[indexPath.row] = true;
        };
        menu.addAction(option2);
        menu.addAction(option);
        self.present(menu, animated: true, completion: nil);
        //取消cell条的灰色选中状态
        tableView.deselectRow(at: indexPath, animated: true);
    }
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        print("将要选择\(indexPath.row)行的CELL");
        return indexPath;
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
