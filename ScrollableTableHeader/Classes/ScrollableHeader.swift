//
//  ScrollableHeaderManager.swift
//  VidaPrevidencia
//
//  Created by Cristian Madrid on 12/15/16.
//  Copyright © 2016 Porto Seguro. All rights reserved.
//

import Foundation

public class ScrollableHeader {
    
    let constraintHeight: NSLayoutConstraint
    var headerHeightRange: ClosedRange<Int>
    var viewControllers: [ScrollableHeaderTableViewController]! = [] {
        didSet {
            viewControllers.last?.scrollViewNotifier = self
            viewControllers.last?.scrollViewDataSource = self
        }
    }
    
    public init(constraintHeightHeader: NSLayoutConstraint, headerHeightRange: ClosedRange<Int>) {
        self.constraintHeight = constraintHeightHeader
        self.headerHeightRange = headerHeightRange
    }
}

extension ScrollableHeader: ScrollableHeaderNotifier {
    
    func didReachEndOfScroll(viewController: UITableViewController) {
        for viewController in viewControllers where viewController != viewController {
            viewController.tableView.setContentOffset(CGPoint.zero, animated:true)
        }
    }
}

extension ScrollableHeader: ScrollableHeaderDataSource {
    
    func getHeaderHeightRange() -> ClosedRange<Int> {
        return headerHeightRange
    }
    
    func getHeaderConstraint() -> NSLayoutConstraint {
        return constraintHeight
    }
}
