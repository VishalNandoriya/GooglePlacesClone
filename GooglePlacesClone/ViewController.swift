//
//  ViewController.swift
//  GooglePlaces
//
//  Created by Mac-Vishal on 07/07/17.
//  Copyright © 2017 Vishal. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

    var locationManager = CLLocationManager()

    var arrItems:[String] = ["Get Current Places","Auto Complete Search","Place Picker With Map"]
    
    @IBOutlet weak var tblItems:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Authorization
        locationManager.requestAlwaysAuthorization()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension ViewController : UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdetifier")! as UITableViewCell
        
        cell.textLabel?.text = arrItems[indexPath.row]
        cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var vc : UIViewController = UIViewController()
        switch indexPath.row {
        case 0:
            let currentVC = self.storyboard?.instantiateViewController(withIdentifier: String(describing: CurrentPlaceVC.self)) as! CurrentPlaceVC
                vc = currentVC
            break
        case 1:
            let currentVC = self.storyboard?.instantiateViewController(withIdentifier: String(describing: AutoCompleteVC.self)) as! AutoCompleteVC
            vc = currentVC
            break
        case 2:
            let currentVC = self.storyboard?.instantiateViewController(withIdentifier: String(describing: PlacePickerVC.self)) as! PlacePickerVC
            vc = currentVC
            break
        default:
            break
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
