//
//  TabbarController.swift
//  MojadiApp
//
//  Created by yoga arie on 07/04/22.
//

import UIKit

class TabbarController: UITabBarController {

    @IBOutlet weak var tabBarMain: UITabBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
        
        // Do any additional setup after loading the view.
        tabBarMain.layer.masksToBounds = true
        tabBarMain.layer.cornerRadius = 15
        if #available(iOS 11.0, *) {
            tabBarMain.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        } else {
            // Fallback on earlier versions
        }
        
    }
    

    func setup(){
        tabBar.tintColor = UIColor(hex: "14B8A6")
        tabBar.unselectedItemTintColor = UIColor(hex: "8D8D8D")
    }

}
