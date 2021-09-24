//
//  SignInViewController.swift
//  Test App
//
//  Created by Diya Sreedhar on 9/16/21.
//

import UIKit

class SignInViewController: UIViewController {
    
    let patients = ["Ava":"password1","Bob":"password2", "Celine":"password3"]
    let doctors = ["Alice":"password4", "Brooke":"password5", "Cathy":"password6"]
    
    @IBOutlet weak var SignIn: UILabel!
    @IBOutlet weak var Username: UITextField!
    @IBOutlet weak var Password: UITextField!
    
    @IBOutlet weak var Button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func ButtonPress(_ sender: Any) {
        print("Username: ",Username.text!)
        print("Password: ",Password.text!)
        if DoctorPatientSignIn()=="doctor" {
            print("GoToDoctor")
            performSegue(withIdentifier: "GoToDoctor", sender: self)
        } else if DoctorPatientSignIn()=="patient" {
            print("GoToPatient")
            performSegue(withIdentifier: "GoToPatient", sender: self)
        } else {
            print("Username or password not found.")
        }
        
    }
    @IBAction func Button(_ sender: Any) {
    }
    
    func DoctorPatientSignIn()->String {
        if (doctors[Username.text!] != nil) {
            if (doctors[Username.text!] == Password.text!){
                return "doctor"
            }
        }
        else if (patients[Username.text!] != nil) {
            if (patients[Username.text!] == Password.text!){
                return "patient"
            }
        }
        return ""
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            Username.resignFirstResponder()
            Password.resignFirstResponder()
        }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
