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
    
    // Deklarasi komponen pada scene profile
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        academyTableView.dataSource = self // Assign 'self' sebagai TableView yang ada di Main.storyboard (Menyediakan data ke TableView)
        academyTableView.delegate = self // Menyediakan data detail ketika tabel di tekan
        
        // Mendaftarkan XIB ke controller
        academyTableView.register(
          UINib(nibName: "AcademyTableViewCell", bundle: nil), // Isi dengan nama file XIB
          forCellReuseIdentifier: "AcademyCell" // Isi dengan Identifier Cell yang telah ditentukan
        )
    }
    @IBAction func goToWebsite(_ sender: Any) {
        let urlDicoding = "https://www.dicoding.com"
        if let url = URL(string: urlDicoding), UIApplication.shared.canOpenURL(url) {
          UIApplication.shared.open(url)
        }
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

// Digunakan untuk berpindah ViewController ke lain
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "moveToDetail", sender: dummyAcademyData[indexPath.row]) // identifier disamakan dengan segue yang sudah ditetapkan. Awal sender adalah nil
    }
    
    // Menyediakan data sebelum segue dieksekusi, dengan identifiernya "moveToDetail" dan tujuannya 'DetailViewController'
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "moveToDetail" {
            if let detailViewController = segue.destination as? DetailViewController {
                detailViewController.academy = sender as? AcademyModel
            }
        }
    }
}
