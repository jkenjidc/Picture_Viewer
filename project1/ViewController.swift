//
//  ViewController.swift
//  project1
//
//  Created by Justine Kenji Dela Cruz on 7/21/22.
//

import UIKit

class ViewController: UITableViewController {
    var pictures = [String]()
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        performSelector(inBackground: #selector(fetchPics), with: nil)
    }
    
    @objc func fetchPics(){
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl"){
                pictures.append(item)
                
            }
        }
        pictures.sort()
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedImage = pictures[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
            vc.totalNumOfPictures = pictures.count
            vc.pictureOrder = indexPath.row
            if let fileName = vc.selectedImage{
                if defaults.object(forKey: fileName) != nil {
                    let count = defaults.integer(forKey: fileName) + 1
                    defaults.set(count, forKey: fileName)
                }else {
                    defaults.set(1, forKey: fileName)
                }
                print(defaults.integer(forKey: fileName))
            }
        }
    }
    
    
}

