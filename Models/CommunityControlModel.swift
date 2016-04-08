//
//  CommunityControlModel.swift
//  微漯河
//
//  Created by iAPPS Pte Ltd on 08/04/16.
//
//

import Foundation
import UIKit

class CommunityControlModel: UIViewController {
    
    @IBOutlet var communityTable  : UITableView?
    @IBOutlet var searchBar  : UISearchBar?

    override func viewDidAppear(animated: Bool) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let diyRefreshGifHeader = DIYRefreshGifHeader.init()
        communityTable!.mj_header    = diyRefreshGifHeader.headerWithRefreshingTarget(self, refreshingAction: "loadData")
        communityTable!.mj_header.beginRefreshing()
    }
}