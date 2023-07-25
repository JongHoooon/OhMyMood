//
//  ViewController.swift
//  OhMyMood
//
//  Created by JongHoon on 2023/07/25.
//

import UIKit

final class WriteViewController: UIViewController {
    
    private var countsOfEmojiTapped = [Int](
        repeating: 0,
        count: Mood.allCases.count
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction private func emojiButtonTapped(_ sender: UIButton) {
        countsOfEmojiTapped[sender.tag] += 1
        print(countsOfEmojiTapped[sender.tag])
    }
}
