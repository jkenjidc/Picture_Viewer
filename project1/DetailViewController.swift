//
//  DetailViewController.swift
//  project1
//
//  Created by Justine Kenji Dela Cruz on 7/24/22.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    var selectedImage: String?
    var totalNumOfPictures: Int?
    var pictureOrder: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Picture \(1 + pictureOrder!) of \(totalNumOfPictures!)"
        navigationItem.largeTitleDisplayMode = .never

        if let imageToLoad = selectedImage{
            imageView.image = UIImage(named: imageToLoad)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }

}
