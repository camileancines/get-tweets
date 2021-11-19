//
//  TweetsViewModel.swift
//  FeelingMeter
//
//  Created by Camile Ancines on 17/11/21.
//

import Foundation

final class TweetsViewModel {
    
    private(set) var tweets: TweetsResponse?
    fileprivate let network: TweetsNetwork = TweetsNetwork()
    var username: String = ""
    
    func fetchUserId(completion: @escaping ((Swift.Result<String,Error>)) -> Void) {
        network.requestUserId(username: username) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let username):
                self.username = username
                
                
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension TweetsViewModel {
    
    struct TweetsInfoViewModel {
        let id: String
        let text: String
    }
    
    func getTweetsText(userId: String) -> [TweetsInfoViewModel] {
        guard let tweets = tweets?.data else { return [] }
        var tweetsInfos = [TweetsInfoViewModel]()
        
        for tweet in tweets {
            tweetsInfos.append(TweetsInfoViewModel(id: tweet.id, text: tweet.text))
        }
        return tweetsInfos
    }
}
