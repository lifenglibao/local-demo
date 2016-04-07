//
//  ConcernsTableView.swift
//  微漯河
//
//  Created by iAPPS Pte Ltd on 03/04/16.
//
//

import Foundation
import UIKit

class ConcernsTableView :UITableView {    
    

    override func numberOfRowsInSection(section: Int) -> Int {
        return 3
    }
    
    override func cellForRowAtIndexPath(indexPath: NSIndexPath) -> UITableViewCell? {
        let identifier = "cell"
        var cell = dequeueReusableCellWithIdentifier(identifier)
        if cell == nil {
            cell = UITableViewCell.init(style: .Default, reuseIdentifier: identifier)
        }
        cell?.textLabel?.text = "test1"
        return cell!
    }
    
}