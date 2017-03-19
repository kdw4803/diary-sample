//
//  ModifyViewController.swift
//  diary
//
//  Created by Brad on 18/03/2017.
//  Copyright © 2017 brad. All rights reserved.
//

import UIKit

class ModifyViewController: UIViewController {
    
    
    @IBOutlet weak var textInput: UITextField!
    @IBOutlet weak var textArea: UITextView!
    
    var article:Article?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        textInput.text = article?.title
        textArea.text = article?.content
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func updateButtonPressed(_ sender: Any) {
        
        article?.title = textInput.text
        article?.content = textArea.text
        appDelegate.saveContext()
        
        _ = navigationController?.popViewController(animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
