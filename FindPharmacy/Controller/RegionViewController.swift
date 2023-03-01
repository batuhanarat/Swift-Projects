//
//  RegionViewController.swift
//  FindPharmacy
//
//  Created by Batuhan Arat on 27.11.2022.
//

import UIKit

class RegionViewController: UIViewController {

    @IBOutlet weak var regionTableView: UITableView!
    
    var regionIdentifier: String! 
    var cityIdentifier: Int!
    let pharmacyDataSource = PharmacyDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pharmacyDataSource.delegate = self

        if let cityIdentifier = cityIdentifier {
            pharmacyDataSource.getListOfRegions(with: cityIdentifier)

        }

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        
    }
 
        
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//         Get the new view controller using segue.destination.
//         Pass the selected object to the new view controller.

        if let cell = sender as? RegionTableViewCell,
           let indexPath = regionTableView.indexPath(for: cell),
           let region = pharmacyDataSource.getRegion(for: indexPath.row),
           let regionController = segue.destination as? PharmacyViewController {
            regionController.regionIdentifier = region.Id
            
            
        }




    }
    

}

extension RegionViewController: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pharmacyDataSource.getNumberOfRegions()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RegionCell")
                as? RegionTableViewCell
        else {
            return UITableViewCell()
        }
        
        if let region = pharmacyDataSource.getRegion(for: indexPath.row) {
            
            cell.regionLabel.text = "\(region.Name)"
            
        } else {
            cell.regionLabel.text = ""
        }
        
        return cell

    }



    }
    

extension RegionViewController: CityDataDelegate {
    
    func regionListLoaded() {
        
        self.regionTableView.reloadData()
    }
    
}
    

