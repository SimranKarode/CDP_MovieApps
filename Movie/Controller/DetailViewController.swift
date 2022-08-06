//
//  DetailViewController.swift
//  Movie
//
//  Created by Simran Rajendra Bhavsar on 8/6/22.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var Image: UIImageView!
    @IBOutlet weak var lbltitle: UILabel!
    
    @IBOutlet weak var overview: UITextView!
    @IBOutlet weak var date: UILabel!
    var movie : Result?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lbltitle.text = movie?.title
        date.text = movie?.releaseDate
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
