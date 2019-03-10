//
//  ViewController.swift
//  bookXCHANGE
//
//  Created by Eric Chu on 2/17/19.
//  Copyright © 2019 Eric Chu. All rights reserved.
//

import UIKit
import Firebase

extension UIViewController{
    func HideKeyboard()  {
        
        let Tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(DismissKeyboard))
        
        
        view.addGestureRecognizer(Tap)
        
    }
    
    @objc func DismissKeyboard(){
        
        view.endEditing(true)
    }
    
    
    
    
    
}

class ViewController: UIViewController {

    @IBOutlet weak var signInSelector: UISegmentedControl!
    
    @IBOutlet weak var signInLabel: UITextView!
    
    
    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBAction func loginTapped(_ sender: Any) {
        
       
    }
    
    @IBOutlet weak var signInButton: UIButton!
    
    
    
    
    var isSignIn: Bool = true
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let topColor = UIColor(red: (33/255.0), green: (51/255.0), blue: (87/255.0), alpha: 1)
        
        let bottomColor = UIColor(red: (72/255.0), green: (109/255.0), blue: (180/255.0), alpha: 1)
        
        let gradientColors: [CGColor] = [topColor.cgColor, bottomColor.cgColor]
        
        let gradientLocations: [Float] = [0.0,1.0]
        
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColors
        gradientLayer.locations = gradientLocations as [NSNumber]
        
        gradientLayer.frame = self.view.bounds
        self.view.layer.insertSublayer(gradientLayer, at: 0)

        
        
        
        
        
        
        
       
        self.HideKeyboard()
        
        
        
        
        
    }
    
    
   
    
    
   
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let mainTabBarController = segue.destination as? MainTabBarController{
            
mainTabBarController.userName = userNameTextField.text
mainTabBarController.password = passwordTextField.text

            
            
        }
    }
    
    @IBAction func signInSelectorChanged(_ sender: UISegmentedControl) {
        
        //Flip the boolean
        isSignIn = !isSignIn
        
        //check the bool
        if isSignIn{
            
            signInLabel.text = "Sign In"
            signInButton.setTitle("Sign in", for: .normal)
        }
        else{
            signInLabel.text = "Register"
            
            signInButton.setTitle("Sign in", for: .normal)
            
        }
        
        
    }
    
    @IBAction func signInButtonTapped(_ sender: UIButton) {
        //check if signed in or registerd
        if let email = userNameTextField.text, let pass = passwordTextField.text{
            
            if isSignIn{
                Auth.auth().createUser(withEmail: email, password: pass) { (user, error) in
                    //check that user isn't nil
                    if let u = user{
                        self.performSegue(withIdentifier: "goToHome", sender: self) }
                    else{
                    }}
            } else{
                Auth.auth().createUser(withEmail: email, password: pass) { (user, error) in
                    //check that user isn't nil
                    if let u = user{
                        self.performSegue(withIdentifier: "goToHome", sender: self)
                    }
                    else{
                    }
                }} }
         }

}
