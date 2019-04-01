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
   /* let myHeader=Header(alg:"ES256",kid:"U7XN79MW5V")
    /*var claims={
        iss:"3BCS59KXHM",
        iat: Math.floor( Date.now() / 1000 ),
        exp: Math.floor(Date.now() / 1000) + ( 60 * 60 * 24 )
    }*/
    
    let developerToken:[Any] = [
            [
                "alg": "ES256",
                "kid":"U7XN79MW5V"
            ]
    ]
    */
    func requestUserToken(forDeveloperToke developedToken: String,
                          completionHandler:@escaping(String?, Error?)->Void){
        
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

