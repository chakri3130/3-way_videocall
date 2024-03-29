//
//  Copyright (C) 2020 Twilio, Inc.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

import Foundation

struct RoomViewModelData {
    struct MainParticipant {
        let identity: String
        let videoConfig: VideoView.Config
        
        init(participant: Cloud9.Participant, videoTrack: VideoTrack?) {
            identity = participant.identity
            videoConfig = .init(videoTrack: videoTrack, shouldMirror: participant.shouldMirrorCameraVideo)
        }
    }
    
    let roomName: String
    let participants: [Participant]
    let mainParticipant: MainParticipant
    let isRecording: Bool
}
