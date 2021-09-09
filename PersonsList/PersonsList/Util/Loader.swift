//
//  LoaderView.swift
//  PersonsList
//
//  Created by Milena Milakara on 9/8/21.
//

import Foundation
import UIKit

class Loader {
    
    static let shared = Loader()
    private init() {
        
    }
    
    var loader: UIActivityIndicatorView?
    
    func showLoader(view: UIView) {
        hideLoader(from: view)
        loader = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        loader?.style = UIActivityIndicatorView.Style.gray
        loader?.hidesWhenStopped = true;
        loader?.center = view.center
        view.addSubview(loader!)
        view.alpha = 0.7
        loader?.startAnimating()
    }

    func hideLoader(from view: UIView) {
        self.loader?.stopAnimating()
        self.loader?.removeFromSuperview()
        view.alpha = 1
        self.loader = nil
    }
}
