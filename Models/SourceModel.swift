//
//  SourceModel.swift
//  微漯河
//
//  Created by iAPPS Pte Ltd on 09/04/16.
//
//

import Foundation

class SourceModel {
    
    var id : Int!
    var name: String!
    var imgName: String!
    var isAvailable: Bool!
    
    init(){
        id = 0
        name = ""
        imgName = ""
        isAvailable = false
    }
    
    static func loadModels() -> Array<SourceModel>{
        
        //        let img = "boy_selected"
        
        var modelList : Array<SourceModel> = []
        // if you want to make all the same values, but multiple objects
        let m1 = SourceModel()
        m1.id = 1
        m1.name = "全部板块"
        m1.imgName = "icn_directory"
        m1.isAvailable = true
        modelList.append(m1)
        
        let m2 = SourceModel()
        m2.id = 2
        m2.name = "投诉爆料"
        m2.imgName = "icn_pif"
        m2.isAvailable = true
        modelList.append(m2)
        
        let m5 = SourceModel()
        m5.id = 3
        m5.name = "求职招聘"
        m5.imgName = "icn_peerlending"
        m5.isAvailable = true
        modelList.append(m5)
        
        let m3 = SourceModel()
        m3.id = 4
        m3.name = "情感天空"
        m3.imgName = "icn_invest"
        m3.isAvailable = true
        modelList.append(m3)
        
        let m7 = SourceModel()
        m7.id = 5
        m7.name = "租房售房"
        m7.imgName = "icn_events"
        m7.isAvailable = true
        modelList.append(m7)
        
        let m6 = SourceModel()
        m6.id = 6
        m6.name = "资讯"
        m6.imgName = "icn_mart"
        m6.isAvailable = true
        modelList.append(m6)
        
        let m4 = SourceModel()
        m4.id = 7
        m4.name = "教育"
        m4.imgName = "icn_bills"
        m4.isAvailable = true
        modelList.append(m4)
        
        let m8 = SourceModel()
        m8.id = 8
        m8.name = "娱乐"
        m8.imgName = "icn_remit"
        m8.isAvailable = true
        modelList.append(m8)
        
        return modelList
    }
}