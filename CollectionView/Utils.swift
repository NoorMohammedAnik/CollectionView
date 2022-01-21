//
//  Utils.swift
//  CollectionView
//
//  Created by Noor Mohammed Anik on 13/1/22.
//
import UIKit
import MBProgressHUD

extension UIViewController {
    
    func showToast(message : String) {
        
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 125, y: self.view.frame.size.height-100, width: 250, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.font = UIFont(name: "Montserrat-Light", size: 12.0)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        
        //     UIApplication.shared.keyWindow!.addSubview(toastLabel)
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
    
    func showAlertDialog(title:String, message:String){
        let alert = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func showLoadingView(message:String){
        let progressHUD = MBProgressHUD.showAdded(to: view.self, animated: true)
        progressHUD.label.text = message
    }
    
    func hideLoadingView() {
        MBProgressHUD.hide(for: self.view, animated: false)
    }
    
    func getString(key: String) -> String {
        return NSLocalizedString(key, comment: "")
    }
    
}

