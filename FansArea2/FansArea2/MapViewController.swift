//
//  MapViewController.swift
//  FansArea2
//
//  Created by 何建新 on 2017/8/11.
//  Copyright © 2017年 Talk GoGo. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController,MKMapViewDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    var area:Area!;
    override func viewDidLoad() {
        super.viewDidLoad()
        //实例化地址坐标解码对象
        let coder = CLGeocoder();
        coder.geocodeAddressString(area.name) { (ps, error) in
            guard let ps = ps else{
                print(error ?? "位置错误")
                return;
            }
            let place = ps.first
            let annotation = MKPointAnnotation();
            annotation.title = self.area.name;
            annotation.subtitle = self.area.province;
            if let loc = place?.location{
                annotation.coordinate = loc.coordinate;
                self.mapView.showAnnotations([annotation], animated: true);
            }
        }
        mapView.showsScale = true;
        mapView.showsCompass = true;
        mapView.showsTraffic = true;
        mapView.showsUserLocation = true;
        mapView.showsBuildings = true;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //给地主标注加个图标
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation{
            return nil;
        }
        let id = "myid";
        var av = mapView.dequeueReusableAnnotationView(withIdentifier: id) as? MKPinAnnotationView;
        if av == nil{
            av = MKPinAnnotationView.init(annotation: annotation, reuseIdentifier: id);
            av?.canShowCallout = true;
        }
        let leftIconView = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: 53, height: 53));
        leftIconView.image = UIImage.init(named: area.image);
        av?.leftCalloutAccessoryView = leftIconView;
        //自定义图钉颜色。默认是红色
        av?.pinTintColor = UIColor.green;
        return av;
        
    }

}
