
import UIKit

class detailsViewController: UIViewController {
    
    var chosenCountry = String()
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var appLabel: UILabel!
    @IBOutlet weak var background: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countryLabel.text = chosenCountry
        getTemperature(countryName: chosenCountry)
       
    }
    
    func getTemperature(countryName: String) {
   
            if let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(countryName)&appid=0f6112b1d663b03202ffabe9788c51ef") {
                
                let session = URLSession.shared
                let task = session.dataTask(with: url) { (data, response, error) in
                    
                    if error == nil {
                        if data != nil {
                        
                            
                            do {
                                
                                let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                                                        
                                    
                                    if let main = jsonResponse["main"] as? NSDictionary {
                                        
                                        if let temp = main["temp"] as? Double {
                                            let state = Int(temp - 273.15)
                                           
                                            DispatchQueue.main.sync {
                                            
                                                self.temperatureLabel.text = "\(state) °C"
                                        }
                                        
                                        
                                        
                                    }
                                    
                                }
                                
                            }catch{
                                print("bir hata oluştu.")
                            }
                            
                        }
                        
                    }
                    
                }
                task.resume()
                
            }
        
    }

        }
