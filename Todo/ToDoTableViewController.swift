import UIKit



class ToDoTableViewController: UITableViewController {
    
       var toDos : [TodoItem] = []
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
        }
        
        override func viewWillAppear(_ animated: Bool) {
            if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
                if let coreDataToDoItems = try? context.fetch(TodoItem.fetchRequest()) as? [TodoItem] {
                    toDos = coreDataToDoItems
                    tableView.reloadData()
                }
            }
        }
        
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return toDos.count
        }
        
        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = UITableViewCell()
            
            let toDo = toDos[indexPath.row]
            
            if toDo.important {
                if let name = toDo.name {
                    cell.textLabel?.text = "❗️" + name
                }
            } else {
                cell.textLabel?.text = toDo.name
            }
            
            return cell
        }
        
        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let selectedToDo = toDos[indexPath.row]
            performSegue(withIdentifier: "goToComplete", sender: selectedToDo)
        }
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            
            
            if let completeVC = segue.destination as? CompleteViewController {
                if let toDo = sender as? TodoItem {
                    completeVC.toDo = toDo
                }
            }
        }
        
    }
