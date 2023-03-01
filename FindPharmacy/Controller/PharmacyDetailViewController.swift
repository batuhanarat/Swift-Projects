//
//  PharmacyDetailViewController.swift
//  FindPharmacy
//
//  Created by Batuhan Arat on 28.11.2022.
//

import UIKit

class PharmacyDetailViewController: UIViewController {

    
    var pharmacyIdentifier: String!
    let pharmacyDataSource = PharmacyDataSource()
    

    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pharmacyDataSource.delegate = self

        if let pharmacyIdentifier = pharmacyIdentifier {
            
            pharmacyDataSource.getDetailedPharmacy(with: pharmacyIdentifier)

        }
        

        // Do any additional setup after loading the view.
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
extension PharmacyDetailViewController: CityDataDelegate {
    
    
    
    func detailPharmacyLoaded(detailedpharmacy :DetailedPharmacy) {
        
        nameLabel.text = detailedpharmacy.Name
        
        addressLabel.text = detailedpharmacy.Address
        
       phoneLabel.text = detailedpharmacy.Phone
        
    }

    
    
    
    
}
