//
//  CityDataDelegate.swift
//  FindPharmacy
//
//  Created by Batuhan Arat on 27.11.2022.
//

import Foundation

protocol CityDataDelegate {
    
 func cityListLoaded()
 func regionListLoaded()
 func pharmacyListLoaded()
 func detailPharmacyLoaded(detailedpharmacy : DetailedPharmacy)

}

extension CityDataDelegate {
    
    func cityListLoaded() {}
    func regionListLoaded() {}
    func pharmacyListLoaded() {}
    func detailPharmacyLoaded(detailedpharmacy : DetailedPharmacy) {}


    
}
