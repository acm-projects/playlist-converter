//
//  AppleMusic.swift
//  PlaylistConverter MessagesExtension
//
//  Created by Vignesh Vasan on 3/27/19.
//  Copyright © 2019 Vignesh Vasan. All rights reserved.
//

import Foundation
import StoreKit
import MediaPlayer

class AppleMusic{
    
    func requestUserToken(forDeveloperToke developedToken: String,
                          completionHandler:@escaping(String?, Error?)->Void){
        
    }
    
    //used to setup authrizr and requestAuthorization
    func checkAppleMusic(){
        SKCloudServiceController.requestAuthorization({
            (status: SKCloudServiceAuthorizationStatus) in
            switch(status)
            {
            case .notDetermined:
                print("Access cannot be determined.")
            case .denied:
                print("Access denied.")
            case .restricted:
                print("Access restricted.")
            case .authorized:
                print("Access granted.")
            }
        })
    }
    
    func createEmptyPlaylist(){
        let myPlaylistQuery = MPMediaQuery.playlists();
        let playlists = myPlaylistQuery.collections
        for playlist in playlists! {
            print(playlist.value(forProperty: MPMediaPlaylistPropertyName)!)
            
            let songs = playlist.items
            for song in songs{
                let songTitle = song.value(forProperty: MPMediaItemPropertyTitle)
                print("\t\t", songTitle!);
            }
        }
    }
    
    func searchQuery(){
        
    }
    
    func test(){
        // Instantiate a new music player
        let myMediaPlayer = MPMusicPlayerApplicationController.applicationQueuePlayer
        // Add a playback queue containing all songs on the device
        myMediaPlayer.setQueue(with: MPMediaQuery.songs())
        // Start playing from the beginning of the queue
        myMediaPlayer.play()
        
    }
    
}

