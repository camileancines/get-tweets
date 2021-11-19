//
//  TweetsRequester.swift
//  FeelingMeter
//
//  Created by Camile Ancines on 18/11/21.
//

import Foundation

struct TwitterAuthentication: Codable {
    var bearerToken: String
}

enum TwitterAuthenticationError: Error {
    case missingBearerToken
    case requestFailed
}

final class TwitterRequester {
    
  static func getBearerToken() -> String? {
    if let settingsPath = Bundle.main.path(forResource: "TwitterAuthentication", ofType: "plist"),
          let xml = FileManager.default.contents(atPath: settingsPath),
          let plist = try? PropertyListDecoder().decode(TwitterAuthentication.self, from: xml) {
      return plist.bearerToken
    }
    
    return nil
  }
  
  static func decode<T: Decodable>(_ json: Data) throws -> T {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.000Z"
    
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .formatted(formatter)
    decoder.keyDecodingStrategy = .convertFromSnakeCase
    return try decoder.decode(T.self, from: json)
  }
  
  static func request(url: URL, cached: Bool = true) -> Result<TweetsResponse?, TwitterAuthenticationError> {
    var result: Result<TweetsResponse?, TwitterAuthenticationError>!
    
    guard let bearerToken = TwitterRequester.getBearerToken(),
          !bearerToken.isEmpty else {
      return .failure(.missingBearerToken)
    }
        
    if cached,
       let data = FileCache.read(url),
       let body: TweetsResponse = try? TwitterRequester.decode(data) {
      return .success(body)
    }

    let semaphore = DispatchSemaphore(value: 0)
    var request = URLRequest(url: url)
    request.addValue("Bearer \(bearerToken)", forHTTPHeaderField: "Authorization")

    URLSession.shared.dataTask(with: request) { (data, _, error) in
      if let data = data,
         let body: TweetsResponse = try? TwitterRequester.decode(data) {
        if cached, error == nil {
          FileCache.write(url, data: data)
        }
        result = .success(body)
          
      } else {
        result = .failure(.requestFailed)
      }
      
      semaphore.signal()
    }.resume()
    
    _ = semaphore.wait(wallTimeout: .distantFuture)
    return result
  }
}
