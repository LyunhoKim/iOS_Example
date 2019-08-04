//
//  SecondViewController.swift
//  NavigationTest
//
//  Created by Lyunho Kim on 28/07/2019.
//  Copyright © 2019 Lyunho Kim. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var titleOfViewController: String? {
        didSet {
            self.title = titleOfViewController
        }
    }
    @IBOutlet var labelViewContoller: UILabel!
    
    
    override func loadView() {
        super.loadView()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        self.title = "title1"
//        self.navigationItem.title = "title2"
//        self.navigationController?.navigationItem.title = "title3"     // 실패
//        self.navigationController?.navigationBar.topItem?.title = "title4"
//        print("test2")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
