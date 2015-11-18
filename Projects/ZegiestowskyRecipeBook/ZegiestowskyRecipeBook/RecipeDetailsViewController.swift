//
//  RecipeDetailsViewController.swift
//  ZegiestowskyRecipeBook
//
//  Created by Ashley Zegiestowsky on 11/17/15.
//  Copyright © 2015 Zegiestowsky, Ashley. All rights reserved.
//

import UIKit
import Parse
import Social

class RecipeDetailsViewController: UIViewController {

    @IBOutlet weak var recipeName: UITextField!
    @IBOutlet weak var recipeCategory: UITextField!
    @IBOutlet weak var recipeSource: UITextField!
    @IBOutlet weak var recipeImageName: UITextField!
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var recipePrepTime: UITextField!
    @IBOutlet weak var recipeCookTime: UITextField!
    @IBOutlet weak var recipeServings: UITextField!
    @IBOutlet weak var recipeIngredients: UITextView!
    @IBOutlet weak var recipeDirections: UITextView!
    @IBAction func saveRecipe(sender: AnyObject) {
        
        if let currentRecipe = currentObject {
            //populate the Island on Parse
            currentRecipe["name"] = recipeName.text
            currentRecipe["category"] = recipeCategory.text
            currentRecipe["source"] = recipeSource.text
            currentRecipe["image"] = recipeImageName.text
            currentRecipe["preptime"] = recipePrepTime.text
            currentRecipe["cooktime"] = recipeCookTime.text
            currentRecipe["servings"] = recipeServings.text
            currentRecipe["ingredients"] = recipeIngredients.text
            currentRecipe["directions"] = recipeDirections.text
            
            //save the data back to the server in background
            currentRecipe.saveEventually()
        } else { //object is nil
            
            //create and insert a new object
            let newRecipe = PFObject(className: "Recipe")
            
            //populate the new island
            newRecipe["name"] = recipeName.text
            newRecipe["category"] = recipeCategory.text
            newRecipe["source"] = recipeSource.text
            newRecipe["image"] = recipeImageName.text
            newRecipe["preptime"] = recipePrepTime.text
            newRecipe["cooktime"] = recipeCookTime.text
            newRecipe["servings"] = recipeServings.text
            newRecipe["ingredients"] = recipeIngredients.text
            newRecipe["directions"] = recipeDirections.text
            
            newRecipe.saveEventually()
        }
        
        //return to the table view
        self.navigationController?.popToRootViewControllerAnimated(true)
        
    }
    @IBAction func postToFacebook(sender: AnyObject) {
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeFacebook) {
            let controller = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
            controller.setInitialText("Try this awesome recipe I just found! It's delicious!")
            
            self.presentViewController(controller, animated: true, completion: nil)
        } else {
            print("No Facebook account on this device")
        }
    }
    
    @IBAction func postToTwitter(sender: AnyObject) {
        if SLComposeViewController.isAvailableForServiceType(SLServiceTypeTwitter) {
            let controller = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
            controller.setInitialText("Try this awesome recipe I just found! It's delicious!")
            
            self.presentViewController(controller, animated: true, completion: nil)
        } else {
            print("No Twitter account on this device")
        }
    }
    
    var currentObject: PFObject?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let currentRecipe = currentObject {
            recipeName.text = currentRecipe["name"] as? String
            recipeCategory.text = currentRecipe["category"] as? String
            recipeSource.text = currentRecipe["source"] as? String
            recipeImageName.text = currentRecipe["image"] as? String
            
            if let recipeImageName = currentRecipe["image"] as? String {
                recipeImage.image = UIImage(named: recipeImageName)
            } else { self.title = "No image available for \(recipeImageName.text!)"
            }
            
            recipePrepTime.text = currentRecipe["preptime"] as? String
            recipeCookTime.text = currentRecipe["cooktime"] as? String
            recipeServings.text = currentRecipe["servings"] as? String
            recipeIngredients.text = currentRecipe["ingredients"] as? String
            recipeDirections.text = currentRecipe["directions"] as? String
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
