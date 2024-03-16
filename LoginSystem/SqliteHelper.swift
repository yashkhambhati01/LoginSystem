//
//  SqliteHelper.swift
//  LoginSystem
//
//  Created by R93 on 29/02/24.
//

import Foundation
import SQLite3
import UIKit

struct userData{
    var email: String
    var password: String
    var image : String
}

class sqliteHelperFile {
    
    static var array1 = [userData]()
    static var file : OpaquePointer?
    
    static func Createfile(){
        var a = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        a.appendPathComponent("my login.db")
        sqlite3_open(a.path, &file)
        print("File Created succesefully")
        print(a.path)
        CreateTable()
    }
    
    static func CreateTable(){
        let q = "Create Table if not exists login (Email text,Password text,image text)"
        var table : OpaquePointer?
        sqlite3_prepare(file, q, -1, &table, nil)
        sqlite3_step(table)
        print("Create Table successefully")
    }
    
    static func add(Email: String,Password: String,image: String){
        let q = "insert into login values ('\(Email)','\(Password)','\(image)')"
        var add : OpaquePointer?
        sqlite3_prepare(file, q, -1, &add, nil)
        sqlite3_step(add)
        print("Data Add successefully")
    }
    
    static func getdata(){
        let q = "SELECT * FROM login"
        var getdata : OpaquePointer?
        sqlite3_prepare(file, q, -1, &getdata, nil)
        
        while sqlite3_step(getdata) == SQLITE_ROW {
            if let emailPointer = sqlite3_column_text(getdata, 0),
               let passwordPointer = sqlite3_column_text(getdata, 1),
               let image1 = sqlite3_column_text(getdata, 2) {
                let email = String(cString: emailPointer)
                let password = String(cString: passwordPointer)
                let userImage = String(cString: image1)
                let userData = userData(email: email, password: password, image: userImage)
                array1.append(userData)
            }
        }
    }
    static func delete(email: String){
        let q = "DELETE FROM login WHERE email ='\(email)'"
        var delete : OpaquePointer?
        sqlite3_prepare(file, q, -1, &delete, nil)
        sqlite3_step(delete)
        print("SuccessFully Date delete")
    }
}
