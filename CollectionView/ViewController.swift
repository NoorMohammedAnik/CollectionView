//
//  ViewController.swift
//  CollectionView
//
//  Created by Noor Mohammed Anik on 5/8/21.
//

import UIKit
import Alamofire
import SwiftyJSON
import AlamofireImage
import MBProgressHUD




class ViewController: UIViewController {
    

    @IBOutlet var collectionView: UICollectionView!
    
    var vegetableList = [[String:Any]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        getJSONData()
        
        showLoadingView(message: "Loading")
         
        //showAlertDialog(title: "Alert", message: "")
        
        
    }
    
    
    
    
    
    //call fucntion to load data from url
    func getJSONData()
    {
        let urlFile = "https://b-deshi.com/app/api/get_products.php"
        Alamofire.request(urlFile).responseJSON {(response) in
            
          
           // showLoadingView(message: "Loading")
            
            switch response.result
            {
            case .success(_):
                self.showToast(message: "Success")
                self.hideLoadingView()
                let jsondata = response.result.value as! [[String:Any]]?
              
                self.vegetableList = jsondata!
                self.collectionView.reloadData()
                
            case .failure(let error):
                
                self.hideLoadingView()
                self.showToast(message: "Error/No Network")
                print("Error Occured \(error.localizedDescription)")
            }
        
    }

    }


}


extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return vegetableList.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MovieCollectionViewCell
        
    
        
        
        
        
        //....
        
        

        
        cell.itemName.text = vegetableList[indexPath.row]["product_name"] as? String
        
        let price = vegetableList[indexPath.row]["product_price"] as? String
        let currentPrice = "Tk " + price!
        cell.productPrice.text = currentPrice
        

        let urlImage =   vegetableList[indexPath.row]["product_image"]  as? String
        
        let imgUrl = "https://b-deshi.com/app/product_images/" + urlImage!
        
        
        Alamofire.request(imgUrl).responseImage(completionHandler: {(response) in
            
            if let image = response.result.value
            {
                DispatchQueue.main.async {
                    cell.productImage.image = image
                    
                }
            }
            
        })
            
        
        
        return cell
    }
}


extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 300)
    }
    
    
    
    
  
    
    
    
}



extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
       // print(movies[indexPath.row].title)
        
        let controller=self.storyboard?.instantiateViewController(identifier: "home") as! HomeController

               // controller.text=textField.text



//
        controller.getTitle = vegetableList[indexPath.row]["product_name"] as? String
        controller.getImage = vegetableList[indexPath.row]["product_image"] as? String

//                controller.modalPresentationStyle = .formSheet
//                present(controller,animated: true)
        
        self.navigationController?.pushViewController(controller, animated: true)
    }
}
