//
//  DetailVC.swift
//  ArtCover
//
//  Created by Алина on 10.11.2021.
//

import UIKit

class DetailVC: UIViewController {
    @IBOutlet var image: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    
    var trackTitle = "" // сюда мы будем передавать название файлов при переходе с первого вью на второй. Для этого существует метод preparefor segue (на перваом экране)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        image.image = UIImage(named: trackTitle)
        titleLabel.text = trackTitle
        
        //сразу сделаем возможность переносить названия трека на следующую строку
        titleLabel.numberOfLines = 0

    }

}
