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
        label.font = .preferredFont(forTextStyle: .largeTitle)
//        print("👒label 만들어짐")
        return label
    }()
    
    private var animalEmojiLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .title1)
        label.setContentHuggingPriority(.required, for: .horizontal)
        return label
    }()
    
    private lazy var stackView: UIStackView = {
       var stackView = UIStackView(arrangedSubviews: [animalEmojiLabel, animalNameLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fill
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // TODO: 호출 위치 적절한지 재확인 필요
        contentView.addSubview(stackView)
        setStackViewLayout()
//        print("👛style init 실행됨")
    }
    
    required init?(coder: NSCoder) {
//        print("🪖init coder실행됨")
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStackViewLayout() {
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
