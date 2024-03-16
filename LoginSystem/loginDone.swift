//
//  loginDone.swift
//  LoginSystem
//
//  Created by R93 on 02/03/24.
//

import UIKit
import SQLite3

class loginDone: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    
    
    //MARK: -  OUTLETS
    
    
    @IBOutlet weak var password: UITextField!
    
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var segmentControllerOutlet: UISegmentedControl!
    
    
    @IBOutlet weak var imageOutlet: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    //MARK: - ACTIONS
    
//    @IBAction func segmentControllerAction(_ sender: UISegmentedControl) {
//        switch segmentControllerOutlet.selectedSegmentIndex {
//        case 0:
//            imageOutlet.image = UIImage(named: "males")
//        case 1:
//            imageOutlet.image = UIImage(named: "Females")
//        default:
//            break
//        }
//        
//    }
//    
//    @IBAction func saveActionButtn(_ sender: Any) {
//
//        
//    }
    
    
    
    
}
