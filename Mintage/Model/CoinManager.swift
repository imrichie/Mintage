//
//  CoinManager.swift
//  Mintage
//
//  Created by Richie Flores on 6/14/22.
//

import Foundation

struct CoinManager {
  let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
  
  func getCryptoPrice(in currency: String) {
    let baseURL = "https://rest.coinapi.io"
    let endpoint = "/v1/exchangerate/BTC/\(currency)/?apikey=\(Constants.coinApiKey)"
    
    if let formattedURL = URL(string: baseURL + endpoint) {
      performRequest(with: formattedURL)
    }
  }
  
  func performRequest(with url: URL) {
    print("URL: \(url)")
  }
  
  func parseJSON(_ data: Data) {
    
  }
}
