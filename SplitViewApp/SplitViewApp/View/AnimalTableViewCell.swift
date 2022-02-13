//
//  AnimalTableViewCell.swift
//  SplitViewApp
//
//  Created by 1 on 2022/02/13.
//

import UIKit

class AnimalTableViewCell: UITableViewCell {
    
    private var animalNameLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .title2)
        label.highlightedTextColor = UIColor(r: 230, g: 250, b: 156)
        return label
    }()
    
    private var animalEmojiLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .largeTitle)
        label.setContentHuggingPriority(.required, for: .horizontal)
        return label
    }()
    
    private lazy var stackView: UIStackView = {
       var stackView = UIStackView(arrangedSubviews: [animalEmojiLabel, animalNameLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 10
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // TODO: 호출 위치 적절한지 재확인 필요
        self.backgroundColor = .clear
        selectionStyle = .default
        isHighlighted = true
        contentView.addSubview(stackView)
        setStackViewLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStackViewLayout() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
    }
    
    func setLabel(name: String?, emoji: String?) {
        animalNameLabel.text = name
        animalEmojiLabel.text = emoji
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
