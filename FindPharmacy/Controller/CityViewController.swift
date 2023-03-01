//
//  CityViewController.swift
//  FindPharmacy
//
//  Created by Batuhan Arat on 27.11.2022.
//

import UIKit

class CityViewController: UIViewController {
    
    
    @IBOutlet weak var CityTableView: UITableView!
    private let pharmacyDataSource = PharmacyDataSource()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        pharmacyDataSource.delegate = self
        pharmacyDataSource.getListOfCities()
        
        
        

        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

//     In a storyboard-based application, you will often want to do a little preparation before navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let cell = sender as? CityTableViewCell,
           let indexPath = CityTableView.indexPath(for: cell),
           let city = pharmacyDataSource.getCity(for: indexPath.row),
           let regionController = segue.destination as? RegionViewController {
            regionController.cityIdentifier = city.Id
            
        }
        
        
        
    }
    

}
extension CityViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pharmacyDataSource.getNumberOfCities()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell")
                as? CityTableViewCell
        else {
            return UITableViewCell()
        }
        
        if let city = pharmacyDataSource.getCity(for: indexPath.row) {
            cell.cityLabel.text = city.Name
        } else {
            cell.cityLabel.text = ""

        }
            
        return cell
        
    }
    
    
    
}

extension CityViewController: CityDataDelegate {
    
    
    func cityListLoaded() {
        self.CityTableView.reloadData()
        
    }
    
    
    
}



