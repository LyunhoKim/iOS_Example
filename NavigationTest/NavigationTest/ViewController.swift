//
//  ViewController.swift
//  NavigationTest
//
//  Created by Lyunho Kim on 28/07/2019.
//  Copyright © 2019 Lyunho Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "title1"
        self.navigationItem.title = "title2"
        self.navigationController?.navigationItem.title = "title3"     // title 이 설정되지 않음
//        self.navigationController?.navigationBar.topItem?.title = "title4"
        
        print("title test")
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let secondeViewController = segue.destination as! SecondViewController
        
        secondeViewController.titleOfViewController = "뷰컨트롤러 타이틀"
//        secondeViewController.labelViewContoller.text = "뷰컨트롤러 레이블"
    }


}

