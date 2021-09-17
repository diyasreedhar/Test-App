//
//  Page2ViewController.swift
//  Test App
//
//  Created by Diya Sreedhar on 9/10/21.
//

import UIKit
import Alamofire
import SwiftyJSON
import AVFoundation

class Page2ViewController: UIViewController,UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var UploadScans: UILabel!
    @IBOutlet weak var ImageDisplay: UIImageView!
    @IBOutlet weak var Prediction: UILabel!
    @IBOutlet weak var Button2: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func PressButton2(_ sender: Any) {
        print("Pressed Button 2")
        let vc = UIImagePickerController()
        //vc.sourceType = .camera
        vc.sourceType = .photoLibrary
        vc.allowsEditing = true
        vc.delegate = self
        present(vc, animated: true)
        Prediction.text = "Getting Image..."
        Button2.isHidden = true
    }
    
    func processFile(image: Data) {
        let imageB64 = Data(image).base64EncodedData()
        //let uploadURL = "https://3h6ys7t373.execute-api.us-east-1.amazonaws.com/Predict/03378121-5f5b-4e24-8b5b-7a029003f2a4"
        //let uploadURL = "https://svexr6i4fi.execute-api.us-east-1.amazonaws.com/Predict/93396303-c75a-49d0-9736-c540ca073768"
        let uploadURL = "https://qj9d854kd0.execute-api.us-east-1.amazonaws.com/Predict/57dd75b8-cca1-4eba-a69b-431f948a7757"
        
        AF.upload(imageB64, to: uploadURL).responseJSON { response in
            
            debugPrint(response)
            switch response.result {
               case .success(let responseJsonStr):
                   print("\n\n Success value and JSON: \(responseJsonStr)")
                   let myJson = JSON(responseJsonStr)
                   let predictedValue = myJson["predicted_label"].string
                   print("Saw predicted value \(String(describing: predictedValue))")
                   let predictionMessage = "Animal Name: " + predictedValue!
                   self.Prediction.text=predictionMessage
                //self.say(string: predictionMessage)

               case .failure(let error):
                   print("\n\n Request failed with error: \(error)")
              

               }
            self.Button2.isHidden = false
            
        }
        
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
