//
//  ViewController.swift
//  Dicoding Apps
//
//  Created by Erlangga Anugrah Arifin on 08/08/22.
//

// ----------| FILE KETIGA |----------
// Mengelola TableView dan TableViewCell
import UIKit

class ViewController: UIViewController {

    // Deklarasi Table view
    @IBOutlet var academyTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        academyTableView.dataSource = self // Assign 'self' sebagai TableView yang ada di Main.storyboard (Menyediakan data ke TableView)
        
        // Mendaftarkan XIB ke controller
        academyTableView.register(
          UINib(nibName: "AcademyTableViewCell", bundle: nil), // Isi dengan nama file XIB
          forCellReuseIdentifier: "AcademyCell" // Isi dengan Identifier Cell yang telah ditentukan
        )
    }


}

// Mengatasi kesalahan error "Can't assign value of type 'ViewController' to type 'UITableViewViewDataSource?'
// Solusi agar sesuai dengan ViewController, menggunakan 'extension
// Alasan menggunakan extension adalah agar fungsionalitasnya bisa di extend dan tidak menjadi tumpang tindih dengan class 'ViewController'
// Implementasi UI TableViewDataSource ke ViewController
extension ViewController: UITableViewDataSource {
    
    // Menghitung berapa banyak jumlah cell yang akan muncul dalam tableView (return berupa angka int)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummyAcademyData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { // Mengatur tampilan setiap cell
        if let cell = tableView.dequeueReusableCell(
          withIdentifier: "AcademyCell",
          for: indexPath
        ) as? AcademyTableViewCell { // Mencari UITableViewCell berdasarkan Identifier.
            let academy = dummyAcademyData[indexPath.row]
            cell.academyLabel.text = academy.name
            cell.academyImageView.image = academy.image
            cell.academyDescription.text = academy.description
          return cell
        } else {
          return UITableViewCell() // Mengembalikan UITableViewCell jika tidak ditemukan.
        }
    }
    
 
}
