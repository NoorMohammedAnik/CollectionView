//
//  HomeController.swift
//  CollectionView
//
//  Created by Noor Mohammed Anik on 4/1/22.
//

import UIKit
import Alamofire
import SwiftyJSON
import AlamofireImage

class HomeController: UIViewController {

    @IBOutlet var myImage: UIImageView!
    
    @IBOutlet var myLabel: UILabel!
    
    var getTitle: String?
    var getImage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        myLabel.text = getTitle
        let imgUrl = "https://b-deshi.com/app/product_images/" + getImage!
      
        
        Alamofire.request(imgUrl).responseImage(completionHandler: {(response) in
            
            if let image = response.result.value
            {
                DispatchQueue.main.async {
                    self.myImage.image = image
                    
                }
            }
            
        })
            
        
        
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
