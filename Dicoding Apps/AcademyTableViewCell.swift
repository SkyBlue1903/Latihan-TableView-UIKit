//
//  AcademyTableViewCell.swift
//  Dicoding Apps
//
//  Created by Erlangga Anugrah Arifin on 08/08/22.
//

// ----------| FILE KEDUA |----------
// Digunakan untuk mengatur tiap cell nya
// File XIB Storyboard wajib di centang saat membuat Cocoa Touch Class ini sehingga bisa menggunakan fitur Assistant

import UIKit

class AcademyTableViewCell: UITableViewCell {

    // Deklarasi komponen
    @IBOutlet var academyImageView: UIImageView!
    @IBOutlet var academyLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
