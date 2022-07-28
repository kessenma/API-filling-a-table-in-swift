//
//  ViewController.swift
//  API_Filling_a_table
//  data: https://jsonplaceholder.typicode.com/todos
//  used this youtube video: https://www.youtube.com/watch?v=0H78ktM97yU
//  Created by Kyle Essenmacher on 7/16/22.
//

import UIKit

class ViewController: UIViewController {
    
    var data = [ToDo]()
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Method Calling
        
        fetchingApiData(URL: "https://jsonplaceholder.typicode.com/todos") { result in
            self.data = result
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
        
    func fetchingApiData(URL url: String, completion: @escaping ([ToDo]) -> Void) {
                             
            let url = URL(string: url)
            let session = URLSession.shared
            let dataTask = session.dataTask(with: url!) { data, response, error in
                if data != nil && error == nil {
                do {
                    let parsingData = try JSONDecoder().decode ([ToDo].self, from: data!)
                    completion(parsingData)
                }catch {
                    print ("Parsing error")
                }
                
            }
        }
            dataTask.resume()
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = data[indexPath.row].title
        return cell!
    }
    
}













//class ViewController: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Method Calling
//
//        fetchingApiData(URL: "https://jsonplaceholder.typicode.com/todos") {result in
//            print(result)
//        }
//    }
//
//    func fetchingApiData(URL url:String, completion: @escaping ([ToDo]) -> Void) {
//
//        let url = URL(string: url)
//        let session = URLSession.shared
//        let dataTask = session.dataTask(with: url!) { data, response, error in
//            if data != nil && error == nil {
//                do {
//                let parsingData = try JSONDecoder().decode([ToDo].self, from: data!)
//                    completion([parsingData])
//                }catch {
//                    print ("Parsing erorr")
//                }
//
//            }
//        }
//        dataTask.resume()
//    }
//}

