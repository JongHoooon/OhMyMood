//
//  ViewController.swift
//  OhMyMood
//
//  Created by JongHoon on 2023/07/25.
//

import UIKit

final class WriteViewController: UIViewController {
    
    @IBOutlet var emojiButtons: [UIButton]!
    @IBOutlet weak var settingBarButton: UIBarButtonItem!
    @IBOutlet weak var colorBarButton: UIBarButtonItem!
    
    private var countsOfEmojiTapped = [Int](
        repeating: 0,
        count: Mood.allCases.count
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configButtons()
        configBarButton()
    }
    
    private func configButtons() {
        emojiButtons.forEach { [weak self] button in
            
            let actions: [UIAction] = Score
                .allCases
                .map {
                    return UIAction(title: $0.title,handler: { [weak self] _ in
                        self?.addAndPrintScore(tag: button.tag)
                    })
                }
            
            let resetScoreAction = UIAction(title: "점수 초기화", attributes: .destructive) { _ in
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
                children: actions + [resetScoreAction]
            )
            
            button.menu = menu
        }
    }
    
    private func configBarButton() {
        
        let plusOneAll = UIAction(
            title: "전체 +1",
            image: ImageStorage.plusCircle,
            handler: { [weak self] _ in
                for tag in 0..<Mood.allCases.count {
                    self?.addAndPrintScore(tag: tag)
                }
            })
        let resetAll = UIAction(
            title: "전체 리셋",
            image: ImageStorage.trashFill,
            attributes: .destructive,
            handler: { [weak self] _ in
                for tag in 0..<Mood.allCases.count {
                    if let score = self?.countsOfEmojiTapped[tag] {
                        self?.addAndPrintScore(tag: tag, score: score * -1)
                    }
                }
            })
        
        let colorActions: [UIAction] = Color.allCases
            .map { [weak self] color in
                return UIAction(title: color.title, handler: { _ in
                    self?.colorSetting(color: color.color)
                })
            }
        
        colorActions[0].state = .on
        
        let colorMenu = UIMenu(
            title: "타이틀 색상 설정",
            subtitle: "색상 변경",
            options: .singleSelection,
            children: colorActions
        )
        
        let settingMenu = UIMenu(
            title: "점수 설정",
            children: [plusOneAll, resetAll, colorMenu]
        )
        settingBarButton.menu = settingMenu
        
        colorBarButton.menu = colorMenu
        colorBarButton.changesSelectionAsPrimaryAction = true
        
        colorBarButton.title = nil
        colorBarButton.image = ImageStorage.paintBrush
    }
    
    @IBAction private func emojiButtonTapped(_ sender: UIButton) {
        addAndPrintScore(tag: sender.tag)
    }
    
    private func addAndPrintScore(tag: Int, score: Int = 1) {
        countsOfEmojiTapped[tag] += score
        if let mood = Mood(rawValue: tag) {
            print("\(mood.name): \(countsOfEmojiTapped[tag])점")
            UserDefaults.standard.set(countsOfEmojiTapped[tag], forKey: mood.key)
        }
    }
    
    private func colorSetting(color: UIColor) {
        colorBarButton.title = nil
        colorBarButton.image = ImageStorage.paintBrush
        navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: color
        ]
        colorBarButton.tintColor = color
    }
}
