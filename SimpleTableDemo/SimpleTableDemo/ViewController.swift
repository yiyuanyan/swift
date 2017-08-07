//
//  ViewController.swift
//  SimpleTableDemo
//
//  Created by 何建新 on 2017/8/4.
//  Copyright © 2017年 何建新. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!
    
    var areas = ["海淀区","朝阳区","石景山区","东城区","西城区","宣武区","大兴区","房山区","通州区","顺义区","昌平区","怀柔区"];
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return areas.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "Cell");
        if(cell == nil){
            cell = UITableViewCell.init(style: UITableViewCellStyle(rawValue: 0)!, reuseIdentifier: "Cell");
        }
        cell?.textLabel?.text = areas[indexPath.row];
        cell?.imageView?.image = UIImage.init(named: "xining");
        
        return cell!;
    }
    //隐藏状态栏
    override var prefersStatusBarHidden: Bool{
        return true;
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

