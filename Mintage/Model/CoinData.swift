//
//  CoinData.swift
//  Mintage
//
//  Created by Richie Flores on 6/14/22.
//

import Foundation

struct CoinData {
  let rate: Double
  let currency: String
  let crypto: String
  
}

extension CoinData {
  enum CodingKeys: String, CodingKey {
    case rate
    case currency = "something"
    case crypto = "other thing"
  }
}
