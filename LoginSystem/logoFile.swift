//
//  logoFile.swift
//  LoginSystem
//
//  Created by R93 on 02/03/24.
//

import UIKit

class logoFile: UIViewController {
    let buttonWidth: CGFloat = 250
    let buttonHeight: CGFloat = 50

    override func viewDidLoad() {
        super.viewDidLoad()
        DYButtn()
    }
    func DYButtn(){
        let Button = UIButton()
        Button.setTitle("GET STARTUP", for:  .normal)
        Button.backgroundColor = .systemGreen
        view.addSubview(Button)
        Button.frame = CGRect(x: 90, y: 734, width: buttonWidth, height: buttonHeight)
        Button.addTarget(self, action: #selector(buttnAction), for: .touchUpInside)
        Button.layer.cornerRadius = 10
        Button.layer.shadowOpacity = 100
        Button.layer.shadowColor = CGColor.init(gray: 100, alpha: 1)
        Button.layer.shadowRadius = 100
        Button.layer.shadowOffset = CGSize(width: 0, height: 0)
        
    }
    
    
    @objc func buttnAction(){
        let neviget = storyboard?.instantiateViewController(identifier: "choicePageFile") as! choicePageFile
        navigationController?.pushViewController(neviget, animated: true)
    }
    
    
    
 
}
