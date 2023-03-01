//
//  PharmacyDataSource.swift
//  FindPharmacy
//
//  Created by Batuhan Arat on 27.11.2022.
//

import Foundation

class PharmacyDataSource {
    
    private let baseURL = "https://koc.api.staging.tarentum.io"
    private var cityArray: [City] = []
    private var regionArray: [Region] = []
    private var pharmacyArray: [Pharmacy] = []
    
    var delegate: CityDataDelegate?

    init() {
        
    }
       
    
    func getListOfCities() {
        
        let session = URLSession.shared

        if let url = URL(string: "\(baseURL)/city") {
            
            
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.addValue( "application/json",
                              forHTTPHeaderField: "Content-Type")
            
            let dataTask = session.dataTask(with: request) {
                data, response, error in
               
                if let data = data {
                    //{\"Id\":1,\"Name\":\"Adana\"},{\"Id\":2,\"Name\":\"Ankara\"}
                    
                    let decoder = JSONDecoder()
                    self.cityArray = try! decoder.decode([City].self, from: data)
                    
                    
                    DispatchQueue.main.async {
                        
                        self.delegate?.cityListLoaded()

                    }
                    
                }
            }
            
            dataTask.resume()

        }

        
    }
    
    
    
    func getListOfRegions(with id : Int) {
        
        let session = URLSession.shared
        
        if let url = URL(string: "\(baseURL)/city/\(id)/region") {

            
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.addValue( "application/json",
                              forHTTPHeaderField: "Content-Type")
            
            let dataTask = session.dataTask(with: request) {
                data, response, error in
                
                if let data = data {
                    

                  let decoder = JSONDecoder()
                    self.regionArray = try! decoder.decode([Region].self, from: data)
                    
                    DispatchQueue.main.async {
                        self.delegate?.regionListLoaded()
                    }
                }
                
            }
            
            
            dataTask.resume()
        }
    }
       
       
    func getListOfPharmacies(with id : String) {
        
        let session = URLSession.shared

        
        
        if let url = URL(string: "\(baseURL)/region/\(id)/pharmacy") {
            
            
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.addValue( "application/json",
                             forHTTPHeaderField: "Content-Type")
            
            
            let dataTask = session.dataTask(with: request) {
                data, response, error in
                
                if let data = data {
                    
                    
                    let decoder = JSONDecoder()
                    self.pharmacyArray = try! decoder.decode([Pharmacy].self, from: data)
                     
                    
                    DispatchQueue.main.async {
                        
                        self.delegate?.pharmacyListLoaded()
                        

                    }
                    
                    
                    
                }
            }
            
            dataTask.resume()

        }
        
    }
    
    func getDetailedPharmacy(with id: String) {
        let session = URLSession.shared

        
        
        if let url = URL(string: "\(baseURL)/pharmacy/\(id)") {
            
            
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            request.addValue( "application/json",
                             forHTTPHeaderField: "Content-Type")
            
            
            let dataTask = session.dataTask(with: request) {
                data, response, error in
                
                if let data = data {
                    
                    
                    let decoder = JSONDecoder()
                    let detailedpharmacy = try! decoder.decode(DetailedPharmacy.self, from: data)
                    
                    DispatchQueue.main.async {
                        
                        self.delegate?.detailPharmacyLoaded(detailedpharmacy :detailedpharmacy)
                        
     
                    }
                    
                
                }
            }
            
            dataTask.resume()

        }
        
    }
    

    

    
    func getNumberOfCities() -> Int {
        return cityArray.count
    }
    
    
    
    func getCity(for index: Int) -> City? {
        
        guard index <  cityArray.count  else {
            return nil
            
        }
        return cityArray[index]
        
    }
    
    
    func getNumberOfRegions() -> Int {
        return regionArray.count
    }
    
    
    func getRegion(for index : Int) -> Region? {
        
        guard index < regionArray.count else {
            return nil
        }
        
        return regionArray[index]
    }
    
    
    
    func getNumberOfPharmacy() -> Int {
        
        return pharmacyArray.count
        
    }
    
    func getPharmacy(for index: Int) ->Pharmacy? {
        
        
        guard index < pharmacyArray.count else {
            return nil
        }
        return pharmacyArray[index]
        
    }
    
    

    
    
}
