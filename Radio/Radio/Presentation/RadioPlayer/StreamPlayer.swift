//
//  StreamPlayer.swift
//  Radio
//
//  Created by Valeriy Bezuglyy on 02/06/2019.
//  Copyright © 2019 Valeriy Bezuglyy. All rights reserved.
//

import Foundation
import AVFoundation

class StreamPlayer {
    let player: AVPlayer = AVPlayer(playerItem: nil)

    func play(url: URL) {
        player.replaceCurrentItem(with: AVPlayerItem(url: url))
        player.play()

        //TODO: mark as playback session
        //TODO: make some response on playback did start
    }
}
