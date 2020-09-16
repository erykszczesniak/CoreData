
import UIKit

class CompleteViewController: UIViewController {
    
    @IBOutlet weak var toDoLabel: UILabel!
    var toDo : TodoItem? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if toDo != nil {
            if toDo!.important {
                if let name = toDo?.name {
                    toDoLabel.text = "❗️" + name
                }
            } else {
                toDoLabel.text = toDo!.name
            }
        }
    }
    
    @IBAction func completeTapped(_ sender: Any) {
        
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if toDo != nil {
                context.delete(toDo!)
                (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
                navigationController?.popViewController(animated: true)
            }
        }
        
    }
    
}
