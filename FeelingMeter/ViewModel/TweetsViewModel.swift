//
//  TweetsViewModel.swift
//  FeelingMeter
//
//  Created by Camile Ancines on 17/11/21.
//

import Foundation

final class TweetsViewModel {
    
    fileprivate let network: TweetsNetworkProtocol
    private(set) var tweets: Tweets?
    fileprivate let username: String
    
    init(network: TweetsNetworkProtocol = TweetsNetwork(), username: String) {
        self.network = network
        self.username = username
    }
}

extension TweetsViewModel {
    func fetchTweets(completion: @escaping (Swift.Result<Void, Error>) -> Void) {
        network.fetchTweets(username: username) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let tweets):
                self.tweets = tweets
                
                DispatchQueue.main.async {
                    completion(.success(()))
                }
                
            case .failure(let error):
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
}

extension TweetsViewModel {
    
    struct TweetsInfoViewModel {
        let id: String
        let text: String
    }
    
    func getTweetsText() -> [TweetsInfoViewModel] {
        guard let tweets = tweets?.data else { return [] }
        var tweetsInfos = [TweetsInfoViewModel]()
        
        for tweet in tweets {
            tweetsInfos.append(TweetsInfoViewModel(id: tweet.id ?? "", text: tweet.text ?? ""))
        }
        return tweetsInfos
    }
}
