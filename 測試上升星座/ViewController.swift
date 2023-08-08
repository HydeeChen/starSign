//
//  ViewController.swift
//  測試上升星座
//
//  Created by Hydee Chen on 2023/8/3.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var birth: UIDatePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBSegueAction func calculate(_ coder: NSCoder) -> WebViewController? {
        let controller = WebViewController(coder: coder)
        controller?.birth = birth.date
        return controller
    }
}

