//
//  AreaTableViewController.swift
//  FansArea2
//
//  Created by Talk GoGo on 2017/8/7.
//  Copyright © 2017年 Talk GoGo. All rights reserved.
//

import UIKit

class AreaTableViewController: UITableViewController {
//    var areas = ["东城区","西城区","朝阳区","丰台区","石景山区","海淀区","顺义区","通州区","大兴区","房山区"];
//    var areaImages = ["xinzhuang","qilihe","youxi","baiyun","shangjie","nangang","yaodu","wuhou","jinping","furong"];
//    var provinces = ["上海","甘肃","福建","青海","广东","福建","黑龙江","山西","四川","广东","湖南",];
//    var parts = ["华东","西北","东南","西北","华南","东南","东北","华北","西南","华南","华中"];
//    //创建一个bool类型的数组，数组为11个false
//    var visited = [Bool](repeatElement(false, count: 11));
    var areas = [
        Area(name:"我局驻台基厂办公区（北京市东城区台基厂大街三条3号）", province:"上海", part:"华东",image:"xinzhuang", isVisited:false) ,
        Area(name:"西城区西直门南小街20号", province:"甘肃", part:"西北",image:"qilihe", isVisited:false) ,
        Area(name:"北京市朝阳区八里庄南里21号院", province:"福建", part:"东南",image:"youxi", isVisited:false) ,
        Area(name:"丰台区菜户营东街乙360号（菜户营桥西南角） 邮政编码：100069", province:"青海", part:"西北",image:"baiyun", isVisited:false) ,
        Area(name:"石景山区是北京西部的一个行政区，是北京市六个主城区之一。位于长安街西段，最东端距距天安门14公里，面积84.38平方公里，暖温带半湿润气候。常住人口63.9万人。交通畅捷，可进入性强。石景山因“燕都第一仙山——石景山”而得名", province:"广东", part:"华南",image:"shangjie", isVisited:false) ,
        Area(name:"海淀区，隶属于北京市，位于北京城区西部和西北部，东与西城区、朝阳区相邻，南与丰台区毗连，西与石景山区、门头沟区交界，北与昌平区接壤。面积430.8平方千米", province:"福建", part:"东南",image:"nangang", isVisited:false) ,
        Area(name:"义区，隶属于北京市，位于北京市东北方向", province:"黑龙江", part:"东北",image:"yaodu", isVisited:false) ,
        Area(name:"通州区位于北京市东南部，京杭大运河北端。西临朝阳区、大兴区，北与顺义区接壤，东隔潮白河与河北省三河市、大厂回族自治县、香河县相连", province:"山西", part:"华北",image:"wuhou", isVisited:false) ,
        Area(name:"大兴区是北京市下属的一个区，位于北京市南部，新城北距市中心13公里，是距离北京市区最近的郊区。它是1984年国务院批准建设的首都第一批重点发展的卫星城之一；北京新城亦庄，即北京经济技术开发区。大兴历史悠久", province:"四川", part:"西南",image:"jinping", isVisited:false) ,
        Area(name:"房山区隶属于北京市，地处华北平原与太行山交界地带", province:"广东", part:"华南",image:"furong", isVisited:false)
    ];
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.backBarButtonItem = UIBarButtonItem.init(title: nil, style: .plain, target: nil, action: nil);
        tableView.estimatedRowHeight = 200;
        tableView.rowHeight = UITableViewAutomaticDimension;
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
        cell.nameLabel.text = areas[indexPath.row].name;
        cell.thumbImage.image = UIImage.init(named: areas[indexPath.row].image);
        cell.thumbImage.layer.cornerRadius = cell.thumbImage.frame.size.height/2;
        cell.thumbImage.clipsToBounds = true;
        cell.partLabel.text = areas[indexPath.row].part;
        cell.provinceLabel.text = areas[indexPath.row].province;
        cell.accessoryType = areas[indexPath.row].isVisited ? .checkmark : .none;

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
            
            self.areas.remove(at: indexPath.row);
            
            
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
            
            self.areas.remove(at: indexPath.row);
            
            
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
    @IBAction func close(segue:UIStoryboardSegue){
    
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
            let dest = segue.destination as! DetailTableViewController;
            dest.area = areas[(tableView.indexPathForSelectedRow?.row)!];
            
        }
    }
    

}
