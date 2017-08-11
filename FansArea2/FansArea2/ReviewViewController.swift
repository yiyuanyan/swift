//
//  ReviewViewController.swift
//  FansArea2
//
//  Created by 何建新 on 2017/8/10.
//  Copyright © 2017年 Talk GoGo. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {
    var rating:String?
    @IBOutlet weak var ratingStackView: UIStackView!
    @IBOutlet weak var bgImageView: UIImageView!
    
    @IBAction func ratingTap(_ sender: Any) {
        switch (sender as AnyObject).tag {
        case 100:
            rating = "dislike";
            break;
        case 101:
            rating = "good";
            break;
            
        case 102:
            rating = "great";
            break;
        default:
            break;
        }
        performSegue(withIdentifier: "unwindToDetailView", sender: self);
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //虚化背景
        //创建虚化效果
        let effect = UIBlurEffect.init(style: .light);
        //创建虚化效果的view并添加效果
        let effectView = UIVisualEffectView.init(effect: effect);
        //设置虚化view的大小
        effectView.frame = self.view.frame;
        //将其添加到图片视图上
        bgImageView.addSubview(effectView);
        // Do any additional setup after loading the view.
        
        //设置动画
        //将stackView的动画初始范围设置为0，不显示
        //ratingStackView.transform = CGAffineTransform.init(scaleX: 0, y: 0);
        let startPos = CGAffineTransform.init(translationX: 0, y: 500);
        let startScale = CGAffineTransform.init(scaleX: 0, y: 0);
        //位置大小的组合
        ratingStackView.transform = startScale.concatenating(startPos);
    }
    override func viewDidAppear(_ animated: Bool) {
//        UIView.animate(withDuration: 0.3) {
//            //闭包，必须用self
//            self.ratingStackView.transform = CGAffineTransform.identity;
//        }
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.5, options: [], animations: {
            let endPos = CGAffineTransform.init(translationX: 0, y: 0);
            let endScale = CGAffineTransform.identity;
            //闭包，必须用self
            self.ratingStackView.transform = endScale.concatenating(endPos);
        }, completion: nil)
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
