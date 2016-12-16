//
//  ScrollableHeaderManagerProtocols.swift
//  VidaPrevidencia
//
//  Created by Cristian Madrid on 12/15/16.
//  Copyright © 2016 Porto Seguro. All rights reserved.
//

protocol ScrollableHeaderDataSource: class {
    
    func getHeaderConstraint() -> NSLayoutConstraint
    func getHeaderHeightRange() -> ClosedRange<Int>
    
}

protocol ScrollableHeaderNotifier: class {
    
    func didReachEndOfScroll(viewController: UITableViewController)
}
