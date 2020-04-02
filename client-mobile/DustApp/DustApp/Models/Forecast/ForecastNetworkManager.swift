//
//  ForecastNetworkManager.swift
//  DustApp
//
//  Created by Cory Kim on 2020/04/02.
//  Copyright © 2020 corykim0829. All rights reserved.
//

import Foundation

class ForecastNetworkManager: NetworkManagable {
    
    static let shared = ForecastNetworkManager()
    
    let URLStrings = [
        "https://search.pstatic.net/common?quality=75&amp;direct=true&amp;src=https%3A%2F%2Fcsearch-phinf.pstatic.net%2F20200329_78%2F1585469292761Tsmsz_PNG%2Fimage.png",
        "https://search.pstatic.net/common?quality=75&amp;direct=true&amp;src=https%3A%2F%2Fcsearch-phinf.pstatic.net%2F20200329_95%2F1585469293046Csc0c_PNG%2Fimage.png",
        "https://search.pstatic.net/common?quality=75&amp;direct=true&amp;src=https%3A%2F%2Fcsearch-phinf.pstatic.net%2F20200329_197%2F1585469293339WIW8s_PNG%2Fimage.png",
        "https://search.pstatic.net/common?quality=75&amp;direct=true&amp;src=https%3A%2F%2Fcsearch-phinf.pstatic.net%2F20200329_96%2F1585469293583jUiAm_PNG%2Fimage.png",
        "https://search.pstatic.net/common?quality=75&amp;direct=true&amp;src=https%3A%2F%2Fcsearch-phinf.pstatic.net%2F20200329_24%2F158546929390936vbA_PNG%2Fimage.png",
        "https://search.pstatic.net/common?quality=75&amp;direct=true&amp;src=https%3A%2F%2Fcsearch-phinf.pstatic.net%2F20200329_161%2F1585469294189OALn7_PNG%2Fimage.png",
        "https://search.pstatic.net/common?quality=75&amp;direct=true&amp;src=https%3A%2F%2Fcsearch-phinf.pstatic.net%2F20200329_171%2F1585469294438p2zw7_PNG%2Fimage.png",
        "https://search.pstatic.net/common?quality=75&amp;direct=true&amp;src=https%3A%2F%2Fcsearch-phinf.pstatic.net%2F20200329_158%2F1585469294699286jz_PNG%2Fimage.png"
    ]
    
    func requestData(with item: Any?, completion: @escaping (Data?, Error?) -> Void) {
        guard let imageURLString = item as? String else { return }
        let imageURL = URL(string: imageURLString)!
        URLSession.shared.dataTask(with: imageURL) { (data, _, error) in
            if let error = error { completion(nil, error) }
            if let data = data { completion(data, nil) }
        }.resume()
    }
}
