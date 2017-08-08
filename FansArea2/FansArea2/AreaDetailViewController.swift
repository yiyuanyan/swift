//
//  AreaDetailViewController.swift
//  FansArea2
//
//  Created by Talk GoGo on 2017/8/7.
//  Copyright © 2017年 Talk GoGo. All rights reserved.
//

import UIKit

class AreaDetailViewController: UIViewController {
    
    @IBOutlet weak var areaImageView: UIImageView!
    
    var areaImageName:String?;
    override func viewDidLoad() {
        super.viewDidLoad()
        areaImageView.image = UIImage.init(named: areaImageName!);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
