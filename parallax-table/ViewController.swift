//
//  ViewController.swift
//  parallax-table
//
//  Created by Tihomir Videnov on 10/15/16.
//  Copyright © 2016 Tihomir Videnov. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var titles = ["Image 1", "Image 2", "Image 3", "Image 4", "Image 5", "Image 6", "Image 7", "Image 8", "Image 9", "Image 10"]
    
    var images: [UIImage] = [
    
    UIImage(named: "image1")!,
    UIImage(named: "image2")!,
    UIImage(named: "image3")!,
    UIImage(named: "image4")!,
    UIImage(named: "image5")!,
    UIImage(named: "image6")!,
    UIImage(named: "image7")!,
    UIImage(named: "image8")!,
    UIImage(named: "image9")!,
    UIImage(named: "image10")!,

    ]
    
    var parallaxOffsetSpeed: CGFloat = 50
    var cellHeight: CGFloat = 250
    
    var parallaxImageHeight: CGFloat {
        let maxOffSet = (sqrt(pow(cellHeight, 2) + 4 * parallaxOffsetSpeed * self.tableView.frame.height) -
        cellHeight) / 2
        
        return maxOffSet + self.cellHeight
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "imageCell", for: indexPath) as? ImageCell {
        
        cell.configureCell(title: titles[indexPath.row], image: images[indexPath.row])
        cell.parallaxImageHeight.constant = self.parallaxImageHeight
        cell.parallaxTopConstraint.constant = parallaxOffset(newOffsetY: tableView.contentOffset.y, cell: cell)
            
        return cell
            
        } else {
            
            return ImageCell()
            
        }
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        
       return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return titles.count
    }
    

    func parallaxOffset(newOffsetY: CGFloat, cell: UITableViewCell) -> CGFloat {
        
        return (newOffsetY - cell.frame.origin.y) / parallaxImageHeight * parallaxOffsetSpeed
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = tableView.contentOffset.y
        for cell in tableView.visibleCells as! [ImageCell] {
            cell.parallaxTopConstraint.constant = parallaxOffset(newOffsetY: offsetY, cell: cell)
        }
    }

}

