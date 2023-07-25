//
//  StaticsViewController.swift
//  OhMyMood
//
//  Created by JongHoon on 2023/07/25.
//

import UIKit

final class StaticsViewController: UIViewController {
    
    @IBOutlet private var backgroundViews: [UIView]!
    
    @IBOutlet weak private var veryGoodScoreLabel: UILabel!
    @IBOutlet weak private var goodScoreLabel: UILabel!
    @IBOutlet weak private var sosoScoreLabel: UILabel!
    @IBOutlet weak private var badScoreLabel: UILabel!
    @IBOutlet weak private var veryBadScoreLabel: UILabel!
    
    private lazy var scoreLabels: [UILabel] = [
        veryGoodScoreLabel,
        goodScoreLabel,
        sosoScoreLabel,
        badScoreLabel,
        veryBadScoreLabel
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configBackgroundViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateScore()
    }
    
    private func updateScore() {
        for (label, key) in zip(scoreLabels, Mood.allCases.map { $0.key}) {
            if let score = UserDefaults.standard.object(forKey: key) {
                label.text = "\(score)점"
            }
        }
    }
    
    private func configBackgroundViews() {
        backgroundViews.forEach {
            $0.layer.cornerRadius = 8.0
        }
    }
    
}
