//
//  CoinData.swift
//  Mintage
//
//  Created by Richie Flores on 6/14/22.
//

import Foundation

struct CoinData: Codable {
  let rate: Double
  let currency: String
  let crypto: String
  
}

extension CoinData {
  enum CodingKeys: String, CodingKey {
    case rate
    case currency = "asset_id_quote"
    case crypto = "asset_id_base"
  }
}

// added this line
