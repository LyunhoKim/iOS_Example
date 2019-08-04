//
//  ViewController.swift
//  AsyncExample
//
//  Created by Lyunho Kim on 04/08/2019.
//  Copyright © 2019 Lyunho Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


    @IBAction func tappedDownload(_ sender: Any) {
        
        OperationQueue().addOperation {
            let url = URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/4/4e/Pleiades_large.jpg/1280px-Pleiades_large.jpg")!
            let data = try! Data.init(contentsOf: url)
            let image = UIImage(data: data)
            
            OperationQueue.main.addOperation {
                self.imageView.image = image
            }
        }
    }
}

