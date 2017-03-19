//
//  DetailViewController.swift
//  diary
//
//  Created by Brad on 12/03/2017.
//  Copyright © 2017 brad. All rights reserved.
//

import UIKit
import CoreData

class DetailViewController: UIViewController,NSFetchedResultsControllerDelegate {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
//    var titleText:String?
//    var contentText:String?
    var article:Article?
    
    var controller:NSFetchedResultsController<Article>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchArticles()
        
        titleLabel.text = article?.title
        contentLabel.text = article?.content

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func deleteButtonPressed(_ sender: Any) {
        context.delete(article!)
        appDelegate.saveContext()
        
        _ = navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "modify" {
            let detailViewController: ModifyViewController = segue.destination as! ModifyViewController
            
            detailViewController.article = article
            
        }
        
    }
    
    func fetchArticles() {
        //TODO : should implement
        let fetchRequest: NSFetchRequest<Article> = Article.fetchRequest()
        let dataSort = NSSortDescriptor(key:"createdAt",ascending:false)
        fetchRequest.sortDescriptors = [dataSort]
        let controller = NSFetchedResultsController(
            fetchRequest: fetchRequest, managedObjectContext: context,
            sectionNameKeyPath: nil, cacheName: nil
        )
        self.controller = controller
        self.controller.delegate = self
        
        do {
            try controller.performFetch()
        } catch {
            let error = error as NSError
            print("\(error)")
        }
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .update:
            titleLabel.text = article?.title
            contentLabel.text = article?.content
            break
        default:
            break
        }
    }
    

}
