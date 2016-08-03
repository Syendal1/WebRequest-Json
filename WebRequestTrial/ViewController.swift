//
//  ViewController.swift
//  WebRequestTrial
//
//  Created by SnehithNitin on 8/2/16.
//  Copyright © 2016 Snehith. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlString = "http://swapi.co/api/people/1/"
        let url = NSURL(string: urlString)!
        let session=NSURLSession.sharedSession()
        
        session.dataTaskWithURL(url) { (data:NSData?, response:NSURLResponse?, error:NSError?) in
            if let responseData = data {
                
                do {
                    let json = try NSJSONSerialization.JSONObjectWithData(responseData, options: NSJSONReadingOptions.AllowFragments)
                    
                    if let dict = json as? Dictionary<String, AnyObject> {
                        
                        if let name = dict["name"] as? String, let height = dict["height"] as? String, let gender = dict["gender"] as? String{
                            
                            let person = SWPerson(name: name, height: height, gender:gender)
                            
                            print(person.name)
                            print(person.height)
                            print(person.gender)
                            
                            if let films = dict["films"] as? [String] {
                                for film in films {
                                    print(film)
                                }
                            }
                            
                        }
                    }
                } catch {
                    print("Could not serialize")
                }
            }
        }.resume()
    }
}