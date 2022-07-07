//
//  CoinManager.swift
//  Mintage
//
//  Created by Richie Flores on 6/14/22.
//

import Foundation

protocol CoinManagerDelegate: AnyObject {
  func didUpdatePrice(_ manager: CoinManager, data: CoinData)
  func didFailWithError(error: Error)
}

struct CoinManager {
  var delegate: CoinManagerDelegate?
  
  func fetchPrices(for crypto: String) {
    var components = URLComponents()
    components.scheme = "https"
    components.host = "rest.coinapi.io"
    components.path = "/v1/exchangerate/\(crypto)/USD"
    components.queryItems = [URLQueryItem(name: "apikey", value: Constants.coinApiKey)]
    
    if let formattedURL = components.url {
      performRequest(with: formattedURL)
    }
  }
  
  func performRequest(with url: URL) {
    let session = URLSession(configuration: .default)
    session.dataTask(with: url) { data, response, error in
      if let error = error {
        delegate?.didFailWithError(error: error)
      }
      
      guard let data = data else { return }
      if let safeData = parseJSON(data) {
        delegate?.didUpdatePrice(self, data: safeData)
      }
    }.resume()
  }
  
  func parseJSON(_ data: Data) -> CoinData? {
    print("SUCCESS retreiving data...")
    let decoder = JSONDecoder()
    do {
      let safeData = try decoder.decode(CoinData.self, from: data)
      print("RATE: \(safeData.rate)")
      print("CRYPTO: \(safeData.crypto)")
      return safeData
    } catch {
      delegate?.didFailWithError(error: error)
      return nil
    }
  }
}
