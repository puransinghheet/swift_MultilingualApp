//
//  HomeViewController.swift
//  MultilingualApp
//
//  Created by Puran on 18/08/23.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var _lblTitle:UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        refreshUIPart()
    }
    func refreshUIPart(){
        
        self.title = "change_language".localiz()
        _lblTitle.text = "trendingnews_txt".localiz()
    }
    
    @IBAction func btnSelectLanguageOptionPressed(_ sender: Any) {
        
        print("Select language option")
        let alertController = UIAlertController.init(title: nil, message: "Select your prefered language", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "English", style: .default, handler: { action in
            
            UserDefaults.standard.set("en", forKey: "selected_language")
            UserDefaults.standard.synchronize()
            self.changeLanguageSuccess(selectedLanguage: .en, rootController: AppDelegate.getDelegate().window!.rootViewController!)
            self.refreshUIPart()
        }))
        alertController.addAction(UIAlertAction(title: "Hindi", style: .default, handler: { action in
            
            UserDefaults.standard.set("hi", forKey: "selected_language")
            UserDefaults.standard.synchronize()
            self.changeLanguageSuccess(selectedLanguage: .hi, rootController: AppDelegate.getDelegate().window!.rootViewController!)
            self.refreshUIPart()
        }))
        
        alertController.addAction(UIAlertAction(title: "Japanese", style: .default, handler: { action in
            
            UserDefaults.standard.set("ja", forKey: "selected_language")
            UserDefaults.standard.synchronize()
            self.changeLanguageSuccess(selectedLanguage: .ja, rootController: AppDelegate.getDelegate().window!.rootViewController!)
            self.refreshUIPart()
            
        }))
        alertController.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: { action in
            
            self.refreshUIPart()
        }))
        
        self.present(alertController, animated: true)
    }
    
}


extension UIViewController{
    
    func changeLanguageSuccess(selectedLanguage: Languages, rootController: UIViewController) {
        
        LanguageManager.shared.setLanguage(language: selectedLanguage, rootViewController: rootController, animation: { view in
            
            //view.transform = CGAffineTransform(scaleX: 2, y: 2)
            view.alpha = 0
        })
    }
}
