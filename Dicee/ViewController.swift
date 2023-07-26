//
//  ViewController.swift
//  Dicee
//
//  Created by Ilyas Tyumenev on 02.04.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    // MARK: - Private Properties
    private let mainView = MainView()
    
    let diceArray = [#imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix")]
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.delegate = self
        setViews()
        setupConstraints()
    }
    
    // MARK: - Private Methods
    private func setViews() {
        view.addSubview(mainView)
    }
    
    private func setupConstraints() {
        mainView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }
    }
}

// MARK: - MainViewDelegate
extension ViewController: MainViewDelegate {
    
    func mainView(_ view: MainView, rollButtonPressed button: UIButton) {
        mainView.diceImageView1.image = diceArray.randomElement()
        mainView.diceImageView2.image = diceArray.randomElement()
    }
}

