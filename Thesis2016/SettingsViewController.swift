//
//  SettingsViewController.swift
//  Thesis2016
//
//  Created by Niclas Bach Nielsen on 23/01/2017.
//  Copyright © 2017 Niclas Bach Nielsen. All rights reserved.
//

import UIKit

class SettingsViewController: UINavigationController {
    
    let navigationBarAppearance = UINavigationBar.appearance()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        self.navigationBarAppearance.backgroundColor = UIColor.blue
//        self.navigationBar.backgroundColor = UIColor.blue
        let settingsText = drawTipLabel(placementX: 0, placementY: 0)
        settingsText.backgroundColor = UIColor.clear
        
        self.view.addSubview(settingsText)
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

    func popToRoot(sender:UIBarButtonItem){
        self.navigationController?.popToRootViewController(animated: true)
    }
    func back(sender: UIBarButtonItem) {
        // Perform your custom actions
        // ...
        // Go back to the previous ViewController
        _ = navigationController?.popViewController(animated: true)
    }
    
    func drawTipLabel(placementX: CGFloat, placementY: CGFloat) -> UILabel {//, UILabel) {
        let label = UILabel(frame: CGRect(x: placementX, y: placementY, width: 375, height: self.view.frame.height))
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 36)// topLabel.font.withSize(14)
        label.text = "SETTINGS"

        return label
    }

}
