//
//  StaticsViewController.swift
//  OhMyMood
//
//  Created by JongHoon on 2023/07/25.
//

import UIKit

final class StaticsViewController: UIViewController {
    
    @IBOutlet private var backgroundViews: [UIView]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configBackgroundViews()
    }
    
    private func configBackgroundViews() {
        backgroundViews.forEach {
            $0.layer.cornerRadius = 8.0
        }
    }
    
}
