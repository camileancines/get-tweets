//
//  TweetsViewModel.swift
//  FeelingMeter
//
//  Created by Camile Ancines on 17/11/21.
//

import Foundation

final class TweetsViewModel {
    
    private(set) var tweets: TweetsResponse?
    fileprivate let username: String = ""
    let network: TweetsNetwork = TweetsNetwork()

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
