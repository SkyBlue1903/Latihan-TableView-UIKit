//
//  DetailTableViewCell.swift
//  Dicoding Apps
//
//  Created by Erlangga Anugrah Arifin on 09/08/22.
//

// ----------| FILE KEEMPAT |----------
// Tanpa menggunakan XIB, dikarenakan sudah ada 'layout designer' nya di Main.storyboard
import UIKit

class DetailViewController: UIViewController { // awalnya 'UITableViewController' sebelumnya 'UIViewController', isinya juga disesuaikan
    
    // Deklarasi komponen yang ada di storyboard
    @IBOutlet var academyImageDetail: UIImageView!
    @IBOutlet var academyLabelDetail: UILabel!
    @IBOutlet var academyDescriptionDetail: UILabel!
    
    var academy: AcademyModel? = nil // Menampung data, kenapa nil (??)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Menampilkan data yang telah dilempar dari ViewController
        if let result = academy {
            academyImageDetail.image = result.image
            academyLabelDetail.text = result.name
            academyDescriptionDetail.text = result.description
        }
    }
}
