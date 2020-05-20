//
//  AppUtility.swift
//  Swapi
//
//  Created by mac on 2020/05/20.
//  Copyright © 2020 mac. All rights reserved.
//

import Foundation
import UIKit

class AppUtility{
    
    
}


extension UIViewController
{
       
func startActivityIndicator(){
      let loc =  self.view.center
    let activityIndicator = UIActivityIndicatorView(style: .large)
      activityIndicator.tag = ACTIVITY_INDICATOR_TAG
      activityIndicator.center = loc
      activityIndicator.hidesWhenStopped = true
            
      activityIndicator.startAnimating()
      self.view.addSubview(activityIndicator)
    }
        
func stopActivityIndicator()
    {
      if let activityIndicator = self.view.subviews.filter(
      { $0.tag == ACTIVITY_INDICATOR_TAG}).first as? UIActivityIndicatorView {
        activityIndicator.stopAnimating()
        activityIndicator.removeFromSuperview()
      }
    }
}
    
    
