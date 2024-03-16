//
//  ViewController.swift
//  LoginSystem
//
//  Created by R93 on 29/02/24.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var imageOutlet: UIImageView!
    
    
    @IBOutlet weak var usernameTexfieldOutlet: UITextField!
    
    
    @IBOutlet weak var emailTextFieldoutlet: UITextField!
    
    @IBOutlet weak var passwordTextFieldOutlet: UITextField!
    
    
    @IBOutlet weak var conformPassword: UITextField!
    
    
    @IBOutlet weak var addressTextFIeldOutlet: UITextField!
    
    
    @IBOutlet weak var segmentControllerOutlet: UISegmentedControl!
    
    @IBOutlet weak var profileImageOutlet: UIImageView!
    
    @IBOutlet weak var deleteTextFieldOutlet: UIButton!
    
    @IBOutlet weak var registerOutlet: UIButton!
    
    static var player: AVAudioPlayer!
    
    var array2 = ""
    var array = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sqliteHelperFile.getdata()
        profileImageOutlet.image = UIImage(named: "males")
        
    }
    
    
    @IBAction func deleteFunc(_ sender: Any) {
        sqliteHelperFile.delete(email: emailTextFieldoutlet.text ?? "")
    }
    
    @IBAction func segmentControllerActionButtn(_ sender: Any) {
        switch segmentControllerOutlet.selectedSegmentIndex {
        case 0:
            profileImageOutlet.image = UIImage(named: "males")
        case 1:
            profileImageOutlet.image = UIImage(named: "Females")
        default:
            break
        }
        
    }
    
    
    
    @IBAction func registerActionButtn(_ sender: Any) {
        if array == "" {
            array = emailTextFieldoutlet.text ?? ""
        }else if array2 == ""{
            array2 = passwordTextFieldOutlet.text ?? ""
        }
        imageSaver()
        checkAll()
        conform()
        nextPage()
        neviget()
        
        
    }
    
    func conform(){
        if passwordTextFieldOutlet.text  != conformPassword.text {
            alert()
        }
    }
    
    func checkAll(){
        if usernameTexfieldOutlet.text == ""{
            alert2()
        }else if emailTextFieldoutlet.text == ""{
            alert2()
        }else if passwordTextFieldOutlet.text == ""{
            alert2()
        }else if conformPassword.text == ""{
            alert2()
        }else if addressTextFIeldOutlet.text == ""{
            alert2()
        }
        
    }
    
    
    func neviget(){
        let neviget = storyboard?.instantiateViewController(identifier: "loginpage") as! loginpage
        navigationController?.pushViewController(neviget, animated: true)
        
    }
    
    func alert(){
        let a = UIAlertController(title: "Error", message: "PLZ ENTER THE RIGHT PASSWORD", preferredStyle: .alert)
        a.addAction(UIAlertAction(title: "Ok", style: .default,handler: { a in
            
        }))
        a.addAction(UIAlertAction(title: "Cancle", style: .cancel,handler: { a in
            
        }))
        present(a, animated: true)
    }
    func alert2(){
        let a = UIAlertController(title: "Error", message: "PLZ ENTER THE DETAIL", preferredStyle: .alert)
        a.addAction(UIAlertAction(title: "Ok", style: .default,handler: { a in
            
        }))
        a.addAction(UIAlertAction(title: "Cancle", style: .cancel,handler: { a in
            
        }))
        present(a, animated: true)
        
    }
    func nextPage(){
        let a = UIAlertController(title: "All Done", message: "choich One", preferredStyle: .alert)
        a.addAction(UIAlertAction(title: "Go to Profile", style: .default,handler: { a in
            self.neviget3()
        }))
        a.addAction(UIAlertAction(title: "Go to Home Page", style: .default,handler: { a in
            self.HomeScreenNeviget()
            
        }))
        present(a, animated: true)
    }
    
    func neviget3(){
        let neviget = storyboard?.instantiateViewController(identifier: "userProfilePage") as! userProfilePage
        
        navigationController?.pushViewController(neviget, animated: true)
        
        neviget.email = emailTextFieldoutlet.text ?? ""
        neviget.password = passwordTextFieldOutlet.text ?? ""
        neviget.address = addressTextFIeldOutlet.text ?? ""
        neviget.name = usernameTexfieldOutlet.text ?? ""
    }
    
    func HomeScreenNeviget(){
        let neviget = storyboard?.instantiateViewController(identifier: "TabView") as! TabView
        navigationController?.pushViewController(neviget, animated: true)
    }

    
    
    func convertImageToBase64(image: UIImage) -> String? {
        if let imageData = image.jpegData(compressionQuality: 1.0) {
            return imageData.base64EncodedString(options: .lineLength64Characters)
        }
        return nil
    }
    
    
    
    func imageSaver(){
        switch segmentControllerOutlet.selectedSegmentIndex {
        case 0:
            let imagetoString = self.convertImageToBase64(image: imageOutlet.image ?? UIImage())
            sqliteHelperFile.add(Email: emailTextFieldoutlet.text ?? "", Password: passwordTextFieldOutlet.text ?? "", image: imagetoString!)
            print("String Create SuccessFully")
        case 1:
            let imagetoString = self.convertImageToBase64(image: imageOutlet.image ?? UIImage())
            sqliteHelperFile.add(Email: emailTextFieldoutlet.text ?? "", Password: passwordTextFieldOutlet.text ?? "", image: imagetoString!)
            print("String Create SuccessFully")
        default:
            break
        }
    }
    
}

