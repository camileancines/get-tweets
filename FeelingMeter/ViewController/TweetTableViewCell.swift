//
//  TweetTableViewCell.swift
//  FeelingMeter
//
//  Created by Camile Ancines on 16/11/21.
//

import UIKit

final class TweetTableViewCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setComponentView(tweetText: String) {
        let component = TweetCellComponentView(tweetText: tweetText)
        component.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(component)

        NSLayoutConstraint.activate([
            component.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            component.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            component.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            component.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0)
        ])
    }
}

final class TweetCellComponentView: UIView {
    
    public lazy var containerView: UIView = {
        let container: UIView = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()
    
    public lazy var tweetLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16.0)
        label.textColor = UIColor(red: 54/255, green: 54/255, blue: 54/255, alpha: 1.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var tweetText: String
    
    public init(tweetText: String) {
        self.tweetText = tweetText
        
        super.init(frame: .zero)
        setContentView()
        setupUI()
        setContentElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setContentView() {
        self.addSubview(containerView)
        containerView.addSubview(tweetLabel)
    }
    
    private func setupUI() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            
            tweetLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 5),
            tweetLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 5),
            tweetLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -5),
            tweetLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -5)
            ])
    }
    
    private func setContentElements() {
        tweetLabel.text = tweetText
    }
}
