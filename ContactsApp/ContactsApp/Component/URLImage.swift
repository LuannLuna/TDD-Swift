//
//  URLImage.swift
//  ContactsApp
//
//  Created by Luann Luna on 09/06/22.
//

import SwiftUI

struct URLImage: View {
    
    @ObservedObject var imageLoader = ImageLoader()
    
    init (url: String) {
        imageLoader.downloadImage(url: url)
    }
    
    
    var body: some View {
        if let data = imageLoader.data,
            let uiImage = UIImage(data: data) {
            return Image(uiImage: uiImage)
                .resizable()
                .frame(width: 70, height: 70)
        } else {
            return Image(systemName: "circle")
                .resizable()
                .frame(width: 70, height: 70)
        }
    }
}

struct URLImage_Previews: PreviewProvider {
    static var previews: some View {
        URLImage(url: "")
    }
}
