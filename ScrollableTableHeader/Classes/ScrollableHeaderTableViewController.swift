//
//  ScrollableHeaderTableViewController.swift
//  VidaPrevidencia
//
//  Created by Cristian Madrid on 12/15/16.
//  Copyright © 2016 Porto Seguro. All rights reserved.
//

public class ScrollableHeaderTableViewController: UITableViewController {
    
    weak var scrollViewNotifier: ScrollableHeaderNotifier!
    weak var scrollViewDataSource: ScrollableHeaderDataSource!
    
    override public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.didScroll(scrollView: scrollView)
        
        if scrollView.contentOffset.y == 0 {
            scrollViewNotifier.didReachEndOfScroll(viewController: self)
        }
    }
    
    func didScroll(scrollView: UIScrollView) {
        
        var yPosition = -scrollView.contentOffset.y
        
        if yPosition <= 0 {
            yPosition = yPosition * 0.1
        }
        
        let minHeight = CGFloat(scrollViewDataSource.getHeaderHeightRange().lowerBound)
        let maxHeight = CGFloat(scrollViewDataSource.getHeaderHeightRange().upperBound)
        
        let newSizeForHeader = scrollViewDataSource.getHeaderConstraint().constant + yPosition
        if newSizeForHeader > maxHeight {
            scrollViewDataSource.getHeaderConstraint().constant = maxHeight
        } else if newSizeForHeader < minHeight {
            scrollViewDataSource.getHeaderConstraint().constant = minHeight
        } else {
            scrollViewDataSource.getHeaderConstraint().constant = newSizeForHeader
        }
        
        view.layoutIfNeeded()
    }
}
