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

import UIKit
import AppCenter
import AppCenterDistribute
import AppCenterAnalytics

class ParticipantCell: UICollectionViewCell {
    struct Status {
        let isMicOn: Bool
        let networkQualityLevel: NetworkQualityLevel
        let isPinned: Bool
    }
    
    @IBOutlet weak var videoView: VideoView!
    var localParticipantUser = ""
    @IBOutlet weak var identityLabel: UILabel!
    @IBOutlet weak var networkQualityImage: UIImageView!
    @IBOutlet weak var pinView: UIView!
    @IBOutlet weak var muteView: UIView!
    

    func configure(participant: Participant,localParticipantStr:String) {
        if(localParticipantStr.isEmpty)
        {
            UserDefaults.standard.set("", forKey: "user")
        }
        else
        {
            localParticipantUser = localParticipantStr
            let splityArray1 = localParticipantUser.split(separator: "@")
            let localParticipantStr1 = "\(splityArray1[0])@\(splityArray1[1])"
            UserDefaults.standard.set(localParticipantStr1, forKey: "user")
        }
        let splityArray = participant.identity.split(separator: "@")
        let role = String(splityArray[0])
        identityLabel.text = role
        muteView.isHidden = participant.isMicOn
        pinView.isHidden = !participant.isPinned
        
        if let imageName = participant.networkQualityLevel.imageName {
            networkQualityImage.image = UIImage(named: imageName)
            

        } else {
            networkQualityImage.image = nil
        }

        videoView.configure(
            config: .init(
                videoTrack: participant.cameraTrack,
                shouldMirror: participant.shouldMirrorCameraVideo
            ),
            contentMode: .scaleAspectFill
        )
    }
}

private extension NetworkQualityLevel {
    
    
    
    var imageName: String? {
        switch self {
        case .unknown: return nil
        case .zero:
            
        
            if(!(String(describing: UserDefaults.standard.string(forKey: "user")!)).isEmpty)
            {
                MSAnalytics.trackEvent("\(String(describing: UserDefaults.standard.string(forKey: "user")!)) is Very Bad \(Date().string(format: "MM/dd/yyyy HH:mm:ss"))");
                
            }
          
            return "network-quality-level-0"
        case .one:
            if(!(String(describing: UserDefaults.standard.string(forKey: "user")!)).isEmpty)
            {
                MSAnalytics.trackEvent("\(String(describing: UserDefaults.standard.string(forKey: "user")!)) is Bad \(Date().string(format: "MM/dd/yyyy HH:mm:ss"))");
                
            }
            return "network-quality-level-1"
        case .two:
            if(!(String(describing: UserDefaults.standard.string(forKey: "user")!)).isEmpty)
            {
                MSAnalytics.trackEvent("\(String(describing: UserDefaults.standard.string(forKey: "user")!)) is Good \(Date().string(format: "MM/dd/yyyy HH:mm:ss"))");
            }
            return "network-quality-level-2"
        case .three:
            if(!(String(describing: UserDefaults.standard.string(forKey: "user")!)).isEmpty)
            {
                MSAnalytics.trackEvent("\(String(describing: UserDefaults.standard.string(forKey: "user")!)) is Very Good \(Date().string(format: "MM/dd/yyyy HH:mm:ss"))");
            }
            return "network-quality-level-3"
        case .four:
            if(!(String(describing: UserDefaults.standard.string(forKey: "user")!)).isEmpty)
            {
                MSAnalytics.trackEvent("\(String(describing: UserDefaults.standard.string(forKey: "user")!)) is Excellent \(Date().string(format: "MM/dd/yyyy HH:mm:ss"))");
            }
            return "network-quality-level-4"
        case .five:
            if(!(String(describing: UserDefaults.standard.string(forKey: "user")!)).isEmpty)
            {
                MSAnalytics.trackEvent("\(String(describing: UserDefaults.standard.string(forKey: "user")!)) is Marvelous \(Date().string(format: "MM/dd/yyyy HH:mm:ss"))");
            }
            return "network-quality-level-5"
        @unknown default:
            return nil
        }
    }
}

extension Date {
    func string(format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}

