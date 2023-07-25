//
//  ViewController.swift
//  OhMyMood
//
//  Created by JongHoon on 2023/07/25.
//

import UIKit

final class WriteViewController: UIViewController {
    
    @IBOutlet var emojiButtons: [UIButton]!
    
    private var countsOfEmojiTapped = [Int](
        repeating: 0,
        count: Mood.allCases.count
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configButtons()
    }
    
    private func configButtons() {
        emojiButtons.forEach { [weak self] button in
            
            let plusOne = UIAction(
                title: "1점+",
                image: UIImage(systemName: "bitcoinsign.circle")
            ) { _ in
                self?.addAndPrintScore(tag: button.tag)
            }
            let plusFive = UIAction(
                title: "5점+",
                image: UIImage(systemName: "bitcoinsign.circle")
            ) { _ in
                self?.addAndPrintScore(tag: button.tag, score: 5)
            }
            let plusTen = UIAction(
                title: "10점+",
                image: UIImage(systemName: "bitcoinsign.circle")
            ) { _ in
                self?.addAndPrintScore(tag: button.tag, score: 10)
            }
            let resetScore = UIAction(title: "점수 초기화", attributes: .destructive) { _ in
                if let score = self?.countsOfEmojiTapped[button.tag] {
                    self?.addAndPrintScore(
                        tag: button.tag,
                        score: score * -1
                    )
                }
            }
            
            let menu = UIMenu(
                title: "점수를 선택해주세요!",
                image: nil,
                identifier: nil,
                options: .displayInline,
                children: [plusOne, plusFive, plusTen, resetScore]
            )
            
            button.menu = menu
        }
    }
    
    @IBAction private func emojiButtonTapped(_ sender: UIButton) {
        addAndPrintScore(tag: sender.tag)
    }
    
    private func addAndPrintScore(tag: Int, score: Int = 1) {
        countsOfEmojiTapped[tag] += score
        if let mood = Mood(rawValue: tag) {
            print("\(mood.name): \(countsOfEmojiTapped[tag])점")
        }
    }
}
