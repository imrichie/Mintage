//
//  CoinManager.swift
//  Mintage
//
//  Created by Richie Flores on 6/14/22.
//

import Foundation

struct CoinManager {
  let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
  
  func getPrices(in currency: String) {
    var components = URLComponents()
    components.scheme = "https"
    components.host = "rest.coinapi.io"
    components.path = "/v1/exchangerate/BTC/\(currency)"
    components.queryItems = [URLQueryItem(name: "apikey", value: Constants.coinApiKey)]
    
    if let formattedURL = components.url {
      performRequest(with: formattedURL)
    }
  }
  
  func performRequest(with url: URL) {
    print("URL: \(url)")
  }
  
  func parseJSON(_ data: Data) {
    
  }
}
