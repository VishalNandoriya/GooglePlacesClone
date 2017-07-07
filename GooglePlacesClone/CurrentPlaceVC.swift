//
//  CurrentPlaceVC.swift
//  GooglePlaces
//
//  Created by Mac-Vishal on 07/07/17.
//  Copyright © 2017 Vishal. All rights reserved.
//

import UIKit
import GooglePlaces

class CurrentPlaceVC: UIViewController {
    
    @IBOutlet var lblName:UILabel!
    @IBOutlet var lblAddress:UILabel!
    @IBOutlet var lblLatitude:UILabel!
    @IBOutlet var lblLongitude:UILabel!
    
    @IBOutlet var viewContainer:UIView!
    
    var _placesClient = GMSPlacesClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.getCurrentAddress()
        
    }
    @IBAction func refresh(sender: UIButton)
    {
        self.viewContainer.isHidden = true
        self.getCurrentAddress()
        
    }
    func getCurrentAddress()
    {
        _placesClient.currentPlace(callback: { (placeLikelihoodList, error) -> Void in
            if let error = error {
                print("Pick Place error: \(error.localizedDescription)")
                self.viewContainer.isHidden = true
                return
            }
            self.viewContainer.isHidden = false
            
            self.lblName.text = "No current place"
            self.lblAddress.text = ""
            
            if let placeLikelihoodList = placeLikelihoodList {
                let place = placeLikelihoodList.likelihoods.first?.place
                if let place = place {
                    self.lblName.text = place.name
                    self.lblAddress.text = place.formattedAddress?.components(separatedBy: ", ")
                        .joined(separator: "\n")
                    self.lblLatitude.text = String(place.coordinate.latitude)
                    self.lblLongitude.text = String(place.coordinate.longitude)
                }
            }
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
