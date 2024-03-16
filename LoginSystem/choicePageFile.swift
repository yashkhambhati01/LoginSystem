//
//  choicePageFile.swift
//  LoginSystem
//
//  Created by R93 on 02/03/24.
//

import UIKit

class choicePageFile: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        sqliteHelperFile.Createfile()
        navigationItem.hidesBackButton = true
        button()
        button2()
    }
    func button(){
        let buttn = UIButton()
        buttn.setTitle("REGISTER NOW", for: .normal)
        buttn.backgroundColor = .systemGreen
        view.addSubview(buttn)
        buttn.frame = CGRect(x: 20, y: 393, width: 393, height: 50)
        buttn.layer.cornerRadius = 10
        buttn.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
    }
    func button2(){
        let btn = UIButton()
        btn.setTitle("LOGIN NOW", for: .normal)
        btn.backgroundColor = .systemGreen
        view.addSubview(btn)
        btn.frame = CGRect(x: 20, y: 475, width: 393, height: 50)
        btn.layer.cornerRadius = 10
        btn.addTarget(self, action: #selector(buttonAction2), for: .touchUpInside)
    }
    
    @objc func buttonAction(){
        let neviget = storyboard?.instantiateViewController(identifier: "ViewController") as! ViewController
        navigationController?.pushViewController(neviget, animated: true)
    }
    @objc func buttonAction2(){
        let neviget = storyboard?.instantiateViewController(identifier: "loginpage") as! loginpage
        navigationController?.pushViewController(neviget, animated: true)
    }
    
    
}
