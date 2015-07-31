//
//  ViewController.swift
//  musicControllerInfoGrabber
//
//  Created by xiao yang on 30/7/15.
//  Copyright (c) 2015 xiaopow. All rights reserved.
//

import UIKit
import MediaPlayer

class ViewController: UIViewController {

//    override func canBecomeFirstResponder() -> Bool {
//        return true
//    }
//    
//    override func viewDidAppear(animated: Bool) {
//        super.viewDidAppear(true)
//        self.becomeFirstResponder()
//        UIApplication.sharedApplication().beginReceivingRemoteControlEvents()
//    }
    
    @IBOutlet var songTitle: UILabel!
    
    @IBAction func getSongTitle(sender: AnyObject) {
        if checkSongInfo() {
            if let nowPlaying = MPMusicPlayerController.systemMusicPlayer().nowPlayingItem {
                let trackName = nowPlaying.valueForProperty(MPMediaItemPropertyTitle) as! String
                let trackId = nowPlaying.valueForProperty(MPMediaItemPropertyPersistentID) as! NSNumber
                let albumTitle = nowPlaying.valueForProperty(MPMediaItemPropertyAlbumTitle) as! String
                let albumId = nowPlaying.valueForProperty(MPMediaItemPropertyAlbumPersistentID) as! NSNumber
                let artistName = nowPlaying.valueForProperty(MPMediaItemPropertyAlbumArtist) as! String
                let artistId = nowPlaying.valueForProperty(MPMediaItemPropertyAlbumArtistPersistentID) as! NSNumber
                let trackGenre = nowPlaying.valueForProperty(MPMediaItemPropertyGenre) as! String
                let trackGenreId = nowPlaying.valueForProperty(MPMediaItemPropertyGenrePersistentID) as! NSNumber
                println("track name: \(trackName)\ntrackID: \(trackId)\nalbumTitle: \(albumTitle)\nalbumId: \(albumId)\nartistName: \(artistName)\nartistId: \(artistId)\ntrackGenre: \(trackGenre)\ntrackGenreId: \(trackGenreId)")
            }
        } else {
            println("track info not downloaded yet")
            sleep(5)
            getSongTitle(self)
        }
    }
    
    func checkSongInfo() -> Bool {
        if let nowPlaying = MPMusicPlayerController.systemMusicPlayer().nowPlayingItem {
            if let trackId = nowPlaying.valueForProperty(MPMediaItemPropertyPersistentID) as? NSNumber {
                println(trackId)
                return true
            }
        }
        return false
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let nowPlaying = MPNowPlayingInfoCenter.defaultCenter().nowPlayingInfo {
//            let trackName = nowPlaying["MPMediaItemPropertyTitle"] as! String
            println(nowPlaying)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        
    }


}

