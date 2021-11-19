//
//  TweetComponentView.swift
//  FeelingMeter
//
//  Created by Camile Ancines on 16/11/21.
//

import UIKit

@IBDesignable
final class TweetComponentView: UIView {
    
    //MARK: - View's Components
    public lazy var tweetLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    public var tweetText: String? {
        didSet {
            tweetLabel.text = tweetText
        }
    }
    
    //MARK: - Initializers
    public override init(frame: CGRect) {
        super.init(frame: .zero)
        setContentView()
        setupUI()
        initialSetup()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setContentView()
        setupUI()
        initialSetup()
    }
    
    //MARK: - View Setup
    private func setContentView() {
        self.addSubview(tweetLabel)
    }
    
    private func setupUI() {
        NSLayoutConstraint.activate([
            tweetLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            tweetLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            tweetLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            tweetLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
            ])
    }
    
    public func initialSetup() {
        tweetText = nil
    }
}
