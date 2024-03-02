
import UIKit

class ViewController: UIViewController {

   
    @IBOutlet weak var appLabel2: UILabel!
    @IBOutlet weak var countryField: UITextField!
    @IBOutlet weak var background: UIImageView!
    var selectedCountry = String()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }


    @IBAction func button(_ sender: Any) {
        
        selectedCountry = countryField.text ?? ""
    
        
        if selectedCountry.isEmpty  {
            
               let alert = UIAlertController(title: "Error!", message: "Country!", preferredStyle: .alert)
               
            let OKButton = UIAlertAction(title: "OK", style: .default, handler: nil)
               
               alert.addAction(OKButton)
               
               self.present(alert, animated: true, completion: nil)
               
            
        } else {
            selectedCountry = countryField.text!
            self.performSegue(withIdentifier: "detailsVC", sender: nil)
            
        }
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailsVC" {
            let destinationVC = segue.destination as! detailsViewController
            destinationVC.chosenCountry = selectedCountry
        }
    }
    


}

