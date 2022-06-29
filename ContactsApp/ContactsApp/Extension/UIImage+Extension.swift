//
//  UIImage+Extension.swift
//  ContactsApp
//
//  Created by Luann Luna on 09/06/22.
//

import Foundation
import UIKit

class ImageLoader: ObservableObject {
    @Published var data: Data?
    
    func downloadImage(url: String) {
        guard let url = URL(string: url) else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                return
            }
            DispatchQueue.main.async {
                self.data = data
            }
        }.resume()
    }
}
