//
//  Copyright (C) 2019 Twilio, Inc.
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

protocol AppInfoStoreReading: AnyObject {
    var appInfo: AppInfo { get }
}

class AppInfoStore: AppInfoStoreReading {
    var appInfo: AppInfo {
        AppInfo(
            appCenterAppSecret:"poioo" as! String,
            version: bundle.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String,
            build: bundle.object(forInfoDictionaryKey: "CFBundleVersion") as! String,
            target: AppInfo.Target(rawValue: "Cloud9")!
                
//                AppInfo.myTarget(rawValue: "Cloud9")!
        )
    }
    private let bundle: BundleProtocol

    init(bundle: BundleProtocol) {
        self.bundle = bundle
    }
}
