//
//  loginpage.swift
//  LoginSystem
//
//  Created by R93 on 02/03/24.
//

import UIKit

class loginpage: UIViewController {
    
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var passwordTextFieldOutlet: UITextField!
    
    var array = [userData]()
    var i = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sqliteHelperFile.getdata()
        array = sqliteHelperFile.array1
        print(array)
    }
    
    @IBAction func loginActionButtn(_ sender: Any) {
        for i in array {
            if email.text == i.email && passwordTextFieldOutlet.text == i.password {
                print("Done")
                nextPage()
                break
            }
            else {
                alert(title: "error", massege: "invalid details")
            }
        }
    }
    func alert(title: String,massege: String){
        let a = UIAlertController(title: title, message: massege, preferredStyle: .alert)
        a.addAction(UIAlertAction(title: "ok", style: .default))
        a.addAction(UIAlertAction(title: "Cancle", style: .cancel))
        present(a, animated: true)
    }
    func neviget(){
        let neviget = storyboard?.instantiateViewController(identifier: "userProfilePage") as! userProfilePage
        navigationController?.pushViewController(neviget, animated: true)
        
        neviget.email = email.text ?? ""
        neviget.password = passwordTextFieldOutlet.text ?? ""
    }
    
    @IBAction func dontHaveAccountActionButtn(_ sender: Any) {
        let neviget = storyboard?.instantiateViewController(identifier: "ViewController") as! ViewController
        navigationController?.pushViewController(neviget, animated: true)
    }
    
    
    func neviget2(){
        let neviget = storyboard?.instantiateViewController(identifier: "ViewController") as! ViewController
        navigationController?.pushViewController(neviget, animated: true)
    }
    
    func nextPage(){
        let a = UIAlertController(title: "All Done", message: "Choice One", preferredStyle: .alert)
        a.addAction(UIAlertAction(title: "Go to Profile", style: .default, handler: { a in
            self.neviget()
        }))
        a.addAction(UIAlertAction(title: "Check Deatils Again", style: .default, handler: nil))
        present(a, animated: true)
    }
    
    
}
