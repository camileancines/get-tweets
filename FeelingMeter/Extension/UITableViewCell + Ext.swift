//
//  UITableViewCell + Ext.swift
//  FeelingMeter
//
//  Created by Camile Ancines on 17/11/21.
//

import Foundation
import UIKit

extension UITableViewCell {
    
    class var identifier: String {
        return String(describing: self)
    }
    
    func tableViewReference() -> UITableView? {
        if let first = self.superview {
            if let second = first.superview {
                return second as? UITableView
            }
        }
        return nil
    }
}
