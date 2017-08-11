//
//  Area.swift
//  FansArea2
//
//  Created by 何建新 on 2017/8/9.
//  Copyright © 2017年 Talk GoGo. All rights reserved.
//

struct Area {
    var name:String;
    var province:String;
    var part:String;
    var image:String;
    var isVisited:Bool;
    var rating = "";
    init(name: String, province: String, part: String, image: String, isVisited: Bool) {
        self.name = name;
        self.province = province;
        self.part = part;
        self.image = image;
        self.isVisited = isVisited;
    }
}

