//
//  TrackList.swift
//  ArtCover
//
//  Created by Алина on 10.11.2021.
//

import UIKit

class TrackList: UITableViewController {
    
    let imageNameArray = ["Bill $aber - Looking 4 A Way",
                          "Bones - Numb",
                          "Ghostemane - To Whom It May Concern",
                          "Macan - Кино",
    "Lil Peep - The way I see Things"]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageNameArray.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Title", for: indexPath)
        // отобразим содержимое
        cell.imageView?.image = UIImage(named: imageNameArray[indexPath.row])
        cell.textLabel?.text = imageNameArray[indexPath.row]
        
        cell.textLabel?.numberOfLines = 0 //не ограничиваем кол-во строчек !Но! Из-за этого нужно сделать еще одну функцию (heightForRowAt indexPath) так как в данном случае ширина ячейки будет шириной картинки

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60 // возаращаем высоту ячейки
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetail" {
            // мы проверяем, если идентификатор нашего сигвея равен ШоуДетейл, то мы создаем константу индекспас, которой задаем индекс выбранной строки.
            //Далее мы создаем экземпляр класса DetailVC и уже обращаясь к этому экземпляру возращаемся к свойству trackTitle, которому и присваеваем значение по выбранной строке
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let detailsVC = segue.destination as! DetailVC
                detailsVC.trackTitle = imageNameArray[indexPath.row]
            }
        }
    }

}
