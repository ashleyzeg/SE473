//
//  TableViewController.swift
//  ZegiestowskyGreekIslandsCloud
//
//  Created by Ashley Zegiestowsky on 10/27/15.
//  Copyright © 2015 Zegiestowsky, Ashley. All rights reserved.
//

import UIKit
import ParseUI
import Bolts
import Parse 

class TableViewController: PFQueryTableViewController {
    
    //initialize the PFQueryTable table view
    override init(style: UITableViewStyle, className: String!) {
        super.init(style: style, className: className)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
        //configure the PFQueryTableView
        self.parseClassName = "Island"
        self.textKey = "name"
        self.pullToRefreshEnabled = true
        self.paginationEnabled = false
    }
    
    //define the query that will provide the data for the table view
    override func queryForTable() -> PFQuery {
        let query = PFQuery(className: "Island")
        query.orderByAscending("name")
        
        //more filtering/querying can be done here
        return query
    }

}
