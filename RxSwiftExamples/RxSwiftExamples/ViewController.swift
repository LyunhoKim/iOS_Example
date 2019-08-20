//
//  ViewController.swift
//  RxSwiftExamples
//
//  Created by Lyunho Kim on 20/08/2019.
//  Copyright © 2019 Lyunho Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var array = [1, 2, 3]
    var currentIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


    @IBAction func tappedButton(_ sender: Any) {
        
        print(array[currentIndex])
        
        if currentIndex != array.count - 1 {
            currentIndex += 1
        }
        
    }
}

