//
//  TweetCell.swift
//  Twitter
//
//  Created by Shiv Patel on 3/11/22.
//  Copyright © 2022 Dan. All rights reserved.
//

import UIKit

class TweetCell: UITableViewCell {
    
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var tweetContent: UILabel!
    
 

    @IBOutlet weak var likebutton: UIButton!
    @IBOutlet weak var retweetbutton: UIButton!
    
    
 
    @IBAction func retweet(_ sender: Any) {
        TwitterAPICaller.client?.retweet(tweetId: tweetId, success:{
            self.setRetweeted(isRetweeted: true)}, failure: {(error) in print("error is retweeting: \(error)")
            })
    }
    
    @IBAction func favoritebutton(_ sender: Any) {
        let tobeFavorite = !favorited
        if (tobeFavorite) {
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, success: {
                self.setFavorite(isFavorite: true)
            }, failure: { (error) in print("favorite did not suceed: \(error)")})
        } else {
            TwitterAPICaller.client?.unfavoriteTweet(tweetId: tweetId, success: {
                self.setFavorite(isFavorite: false)
            }, failure: { (error) in print("unfavorite did not succeed: \(error)")})
        }
    }
   

    var favorited:Bool = false
    var tweetId:Int = -1
    
    func setRetweeted(  isRetweeted:Bool){
        if (isRetweeted){
            retweetbutton.setImage(UIImage(named: "retweet-icon-green"), for: UIControl.State.normal)
            retweetbutton.isEnabled = false
        } else {
            retweetbutton.setImage(UIImage(named:"retweet-icon"), for: UIControl.State.normal)
            retweetbutton.isEnabled = true
        }
    }
    
    
        func setFavorite( isFavorite:Bool) {
            favorited=isFavorite
            if (favorited){
                likebutton.setImage(UIImage(named: "favor-icon-red"), for: UIControl.State.normal)
            } else {
                likebutton.setImage(UIImage(named: "favor-icon"), for: UIControl.State.normal)
                }
            }
            
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
