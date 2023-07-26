//
//  MainView.swift
//  Dicee
//
//  Created by Ilyas Tyumenev on 11.04.2023.
//

import UIKit

protocol MainViewDelegate: AnyObject {
    func mainView(_ view: MainView, rollButtonPressed button: UIButton)
}

class MainView: UIView {
    
    weak var delegate: MainViewDelegate?
    
    // MARK: - Private Properties
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "GreenBackground")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "DiceeLogo")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let diceImageView1: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "DiceOne")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let diceImageView2: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "DiceOne")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let rollButton: UIButton = {
        let button = UIButton()
        button.setTitle("Roll", for: .normal)
        button.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 30)
        button.tintColor = .red
        button.contentHorizontalAlignment = .center
        button.backgroundColor = UIColor(red: 155/255, green: 28/255, blue: 31/255, alpha: 1.0)
        button.addTarget(self, action: #selector(rollButtonPressed), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func addViews() {
        addSubview(backgroundImageView)
        addSubview(logoImageView)
        addSubview(diceImageView1)
        addSubview(diceImageView2)
        addSubview(rollButton)
    }
    
    private func addConstraints() {
        backgroundImageView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalToSuperview()
        }

        logoImageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(93)
            make.centerX.equalToSuperview()
            make.width.equalTo(240)
            make.height.equalTo(128)
        }
        
        diceImageView1.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(51)
            make.width.height.equalTo(120)
        }
        
        diceImageView2.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(51)
            make.width.height.equalTo(120)
        }
        
        rollButton.snp.makeConstraints { make in
            make.top.equalTo(diceImageView1.snp.bottom).offset(130)
            make.centerX.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(50)
        }
    }
}

// MARK: - Target Actions
private extension MainView {
    
    @objc func rollButtonPressed(_ button: UIButton) {
        delegate?.mainView(self, rollButtonPressed: button)
    }
}
