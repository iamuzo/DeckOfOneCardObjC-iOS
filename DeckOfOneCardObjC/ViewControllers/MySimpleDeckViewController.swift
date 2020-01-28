//
//  MySimpleDeckViewController.swift
//  DeckOfOneCardObjC
//
//  Created by Uzo on 1/28/20.
//  Copyright © 2020 Uzo. All rights reserved.
//

import UIKit

class MySimpleDeckViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var cardNameLabel: UILabel!
    @IBOutlet weak var cardImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    @IBAction func drawCardButtonTapped(_ sender: UIButton) {
        fetchCard()
    }
    
    func fetchCard() {
        MySimpleDeckController.fetchNewCard("") { (card) in
            guard let card = card else { return }
            MySimpleDeckController.fetchCardImage(card) { (image) in
                DispatchQueue.main.async {
                    guard let image = image else { return }
                    self.updateViews(card: card, image: image)
                }
            }
        }
    }
    
    func updateViews(card: MySimpleDeck, image: UIImage) {
        DispatchQueue.main.async {
            self.cardImageView.image = image
            self.cardNameLabel.isHidden = false
            self.cardNameLabel.text = card.suit + " " + card.card
        }
    }
}
