//
//  SettingsViewController2.swift
//  Thesis2016
//
//  Created by Niclas Bach Nielsen on 23/01/2017.
//  Copyright © 2017 Niclas Bach Nielsen. All rights reserved.
//

import UIKit

class SettingsViewController2: UINavigationController {

//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(true)
////        self.title = "Settings"
//        self.navigationController?.navigationBar.topItem?.title = "Settings"
////        self.navigationItem.title = "Settings"
//    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.topItem?.title = "Settings"

        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
