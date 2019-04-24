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
    
    
    init() {
        
    }
    
    /// The instance of `AuthorizationManager` used for querying and requesting authorization status.
    //var authorizationManager: AuthorizationManager!
    
    /// The instance of `AuthorizationDataSource` that provides information for the `UITableView`.
     var authorizationDataSource: AuthorizationDataSource!
    
    /// A boolean value representing if a `SKCloudServiceSetupViewController` was presented while the application was running.
    var didPresentCloudServiceSetup = false
    
    /// The instance of `AuthorizationManager` which is responsible for managing authorization for the application.
    lazy var authorizationManager: AuthorizationManager = {
        return AuthorizationManager(appleMusicManager: self.appleMusicManager)
    }()
    
    /// The instance of `MediaLibraryManager` which manages the `MPPMediaPlaylist` this application creates.
    lazy var mediaLibraryManager: MediaLibraryManager = {
        return MediaLibraryManager(authorizationManager: self.authorizationManager)
    }()
    
    
    /// The instance of `AppleMusicManager` which handles making web service calls to Apple Music Web Services.
    var appleMusicManager = AppleMusicManager()
    
    
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
    
    func queryAppleMusic(songName: String, songArtist: String){
        let myMusicPlayer = MPMusicPlayerController.systemMusicPlayer
        
        let songNameFilter = MPMediaPropertyPredicate(value: songName, forProperty: MPMediaItemPropertyTitle, comparisonType: MPMediaPredicateComparison.contains)
        let artistNameFilter = MPMediaPropertyPredicate(value: songArtist, forProperty: MPMediaItemPropertyTitle, comparisonType: MPMediaPredicateComparison.contains)
        
        let myFilterSet: Set<MPMediaPropertyPredicate> = [songNameFilter, artistNameFilter]
        
        let myQuery = MPMediaQuery(filterPredicates: myFilterSet)
        myMusicPlayer.setQueue(with: myQuery)
        
        myMusicPlayer.play()
        
        print(myQuery.items?.first?.title! as Any)
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
    
    
    func test(){
        // Instantiate a new music player
        let myMediaPlayer = MPMusicPlayerApplicationController.applicationQueuePlayer
        // Add a playback queue containing all songs on the device
        myMediaPlayer.setQueue(with: MPMediaQuery.songs())
        // Start playing from the beginning of the queue
        myMediaPlayer.play()
        
    }
}

