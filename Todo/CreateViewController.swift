import UIKit



class CreateViewController: UIViewController {
    
    
     @IBOutlet weak var importantSwitch: UISwitch!
        @IBOutlet weak var nameTextField: UITextField!
        
        

        override func viewDidLoad() {
            super.viewDidLoad()

        }
        

        @IBAction func addTapped(_ sender: Any) {
            if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
                let newToDo = TodoItem(context: context)
                if let name =  nameTextField.text {
                    newToDo.name = name
                    newToDo.important = importantSwitch.isOn
                    (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
                    navigationController?.popViewController(animated: true)
                }
            }
            
        }
        
    }
