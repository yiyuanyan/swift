//
//  AreaTableViewController.swift
//  FansArea2
//
//  Created by Talk GoGo on 2017/8/7.
//  Copyright © 2017年 Talk GoGo. All rights reserved.
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
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
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
        cell.thumbImage.layer.cornerRadius = cell.thumbImage.frame.size.height/2;
        cell.thumbImage.clipsToBounds = true;
        cell.partLabel.text = self.parts[indexPath.row];
        cell.provinceLabel.text = self.provinces[indexPath.row];
        cell.accessoryType = visited[indexPath.row] ? .checkmark : .none;

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80;
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let menu = UIAlertController.init(title: "提示", message: "您选择了\(indexPath.row)", preferredStyle: .actionSheet);
//        let option = UIAlertAction.init(title: "取消", style: .cancel, handler: nil);
//        let option2 = UIAlertAction.init(title: "我去过", style: .destructive) { (_) in
//            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark;
//            self.visited[indexPath.row] = true;
//            
//        }
//        menu.addAction(option);
//        menu.addAction(option2);
//        self.present(menu, animated: true, completion: nil);
//        tableView.deselectRow(at: indexPath, animated: true);
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print("删除了");
            self.areaImages.remove(at: indexPath.row);
            self.areas.remove(at: indexPath.row);
            self.provinces.remove(at: indexPath.row);
            self.parts.remove(at: indexPath.row);
            self.visited.remove(at: indexPath.row);
            
            tableView.deleteRows(at: [indexPath], with: .fade);
        }else if(editingStyle == .insert){
        
        }
    }
    //自定义cell左滑样式  cell左滑自定义按钮,UITableViewController的代理方法
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        //定义左滑动显示的按钮
        let actionShare = UITableViewRowAction.init(style: .normal, title: "分享") { (_, indexPath) in
            //点击分享弹出提示信息
            let actionSheet = UIAlertController.init(title: "分享", message: nil, preferredStyle: .actionSheet);
            let option1 = UIAlertAction.init(title: "QQ", style: .default, handler: nil);
            let option2 = UIAlertAction.init(title: "微信", style: .default, handler: nil);
            let optionCancel = UIAlertAction.init(title: "取消", style: .cancel, handler: nil);
            actionSheet.addAction(option1);
            actionSheet.addAction(option2);
            actionSheet.addAction(optionCancel);
            
            self.present(actionSheet, animated: true, completion: nil);
        }
        //自定义按钮背景颜色
        actionShare.backgroundColor = UIColor.orange;
        //删除按钮
        let actionDel = UITableViewRowAction.init(style: .destructive, title: "删除") { (_, _) in
            print("删除了");
            self.areaImages.remove(at: indexPath.row);
            self.areas.remove(at: indexPath.row);
            self.provinces.remove(at: indexPath.row);
            self.parts.remove(at: indexPath.row);
            self.visited.remove(at: indexPath.row);
            
            tableView.deleteRows(at: [indexPath], with: .fade);
        }
        //置顶按钮
        let actionTop = UITableViewRowAction.init(style: .default, title: "置顶") { (_, _) in
            
        }
        //设置按钮背景颜色
        actionTop.backgroundColor = UIColor.init(red: 245/255.0, green: 199/255.0, blue: 221/255.0, alpha: 1);
        //返回的是数组
        return [actionShare,actionDel,actionTop];
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showAreaDetail" {
            let dest = segue.destination as! AreaDetailViewController;
            dest.areaImageName = areaImages[(tableView.indexPathForSelectedRow?.row)!];
            
        }
    }
    

}
