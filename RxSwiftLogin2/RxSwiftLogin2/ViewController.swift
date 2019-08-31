//
//  ViewController.swift
//  RxSwiftLogin2
//
//  Created by Lyunho Kim on 2019/08/29.
//  Copyright © 2019 Lyunho Kim. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    @IBOutlet var idField: UITextField!
    @IBOutlet var pwField: UITextField!
    
    @IBOutlet var markInvalidId: UIView!
    @IBOutlet var markInvalidPw: UIView!
    
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        BindUI()
        
        
        
    }
    
    func BindUI() {
        
        
        idField.rx.text.orEmpty
        .map(checkId)
        .subscribe(onNext: { (isValid) in
            self.markInvalidId.isHidden = isValid
        })
        .disposed(by: disposeBag)
        
        pwField.rx.text.orEmpty
        .map(checkPw)
        .subscribe(onNext: { (isValid) in
            self.markInvalidPw.isHidden = isValid
        })
        .disposed(by: disposeBag)
        
        
        
        
    }
    
    func checkId(_ id: String) -> Bool {
        return id.contains("@") && id.contains(".")
    }
    
    func checkPw(_ pw: String) -> Bool {
        return pw.count > 5
    }
    


}

