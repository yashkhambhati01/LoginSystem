//
//  userProfilePage.swift
//  LoginSystem
//
//  Created by R93 on 13/03/24.
//

import UIKit

class userProfilePage: UIViewController {
    
    
    
    @IBOutlet weak var image1: UIImageView!
    
    @IBOutlet weak var nameOutlet: UILabel!
    
    @IBOutlet weak var emailOutlet: UILabel!
    
    @IBOutlet weak var passwordOutlet: UILabel!
    
    @IBOutlet weak var addressOutlet: UILabel!
    
    @IBOutlet weak var shaowPassWordOutlet: UIButton!
    
    @IBOutlet weak var passwordShow: UILabel!
    

    var array = [userData]()
    var i = ""
    var email = ""
    var password = ""
    var address = ""
    var name = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        array = sqliteHelperFile.array1
        imageGet()
        
        emailOutlet.text = email
        nameOutlet.text = name
        addressOutlet.text = address
            }
    func imageGet(){
        for i in array{
            let stringToImage = convertBase64ToImage(base64String: i.image)
            image1.image = stringToImage
            print("image Get SuccessFully")
            break
        }
    }
    func convertBase64ToImage(base64String: String) -> UIImage? {
        if let imageData = Data(base64Encoded: base64String, options: .ignoreUnknownCharacters) {
            return UIImage(data: imageData)
        }
        return nil
    }
    
    @IBAction func showPasswordActionButton(_ sender: Any) {
        
        
    }
    
}
