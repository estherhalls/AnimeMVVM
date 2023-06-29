//
//  ServiceRequestingImageView.swift
//  AnimeMVVM
//
//  Created by Esther on 6/29/23.
//

import UIKit

class ServiceRequestingImageView: UIImageView, APIDataProvidable {
    func fetchImage(with url: URL) {
        let request = URLRequest(url: url)
        perform(request) { [weak self] result in
            switch result {
            case .success(let imageData):
                guard let image = UIImage(data: imageData) else { return }
                DispatchQueue.main.async {
                    self?.contentMode = .scaleAspectFill
                    self?.image = image
                }
            case .failure(let failure):
                print("Error Fetching Image", failure.errorDescription!)
                self?.setDefaultImage()
            }
        }
    }
    
    func setDefaultImage() {
        contentMode = .scaleAspectFit
        self.image = UIImage(systemName: "ticket")
    }
    
}
