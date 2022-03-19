//
//  tweetViewController.swift
//  Twitter
//
//  Created by Shiv Patel on 3/18/22.
//  Copyright © 2022 Dan. All rights reserved.
//

import UIKit

class tweetViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tweetTextView.becomeFirstResponder()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var tweetTextView: UITextView!
    
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tweet(_ sender: Any) {
        if (tweetTextView.text.isEmpty){
            self.dismiss(animated: true, completion: nil)
            print("something is wrong")
        } else {
            TwitterAPICaller.client?.postTweets( tweetString: tweetTextView.text, success: {self.dismiss(animated: true, completion: nil)}, failure: {(error) in print("Error posting tweet \(error)")
                self.dismiss(animated: true, completion: nil)})
        }
        
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
