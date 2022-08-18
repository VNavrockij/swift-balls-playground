//
//  ViewController.swift
//  imageRandomizer
//
//  Created by Vitalii Navrotskyi on 18.08.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageNameLbl: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var myButton: UIButton!
    
    let words = ["Pretty", "Lovely", "Great", "Awesome", "Nice"]
    let imgNames = ["1", "2", "3", "4", "5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func touchRandomImgBtn(_ sender: UIButton) {
        updateUI()
        
    }
    
    func updateUI() {
        imageNameLbl.text = words.randomElement()
        image.image = UIImage(named: imgNames.randomElement()!)
    }
    
}

