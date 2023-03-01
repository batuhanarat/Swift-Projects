//
//  PharmacyViewController.swift
//  FindPharmacy
//
//  Created by Batuhan Arat on 28.11.2022.
//

import UIKit

class PharmacyViewController: UIViewController {

    var regionIdentifier: String!
    let pharmacyDataSource = PharmacyDataSource()
    

    @IBOutlet weak var pharmacyTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        pharmacyDataSource.delegate = self


        if let regionIdentifier = regionIdentifier {
            
            pharmacyDataSource.getListOfPharmacies(with: regionIdentifier)

        }
        
        
        

        // Do any additional setup after loading the view.
    }
    
    
    
    
    
    
    

    
//     MARK: - Navigation

//     In a storyboard-based application, you will often want to do a little preparation before navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//         Get the new view controller using segue.destination.
//         Pass the selected object to the new view controller.
        
          if let cell = sender as? PharmacyTableViewCell,
           let indexPath = pharmacyTableView.indexPath(for: cell),
           let pharmacy = pharmacyDataSource.getPharmacy(for: indexPath.row),
           let pharmacyController = segue.destination as? PharmacyDetailViewController {
              pharmacyController.pharmacyIdentifier = pharmacy.Id
              
            
        }
        
    }
    

}


extension PharmacyViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pharmacyDataSource.getNumberOfPharmacy()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PharmacyCell")
                as? PharmacyTableViewCell
        else {
            return UITableViewCell()
        }
        
        if let pharmacy = pharmacyDataSource.getPharmacy(for: indexPath.row) {
            
            cell.pharmacyLabel.text = "\(pharmacy.Name)"
            
            
        } else {
            cell.pharmacyLabel.text = ""
        }
        
        return cell
        
        
        
        
        
    }
    
    
    
}


extension PharmacyViewController: CityDataDelegate {
    
    func pharmacyListLoaded() {
        self.pharmacyTableView.reloadData()
    }
}
   
