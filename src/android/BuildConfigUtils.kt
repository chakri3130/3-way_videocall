/*
 * Copyright (C) 2019 Twilio, Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package src.cordova.plugin.videocall.BuildConfigUtils

import cordova.plugin.videocall.BuildConfig.BuildConfig


val isCommunityFlavor: Boolean get() = BuildConfig.FLAVOR == "community"

val isInternalFlavor: Boolean get() = BuildConfig.FLAVOR == "internal"

val isReleaseBuildType: Boolean get() = BuildConfig.BUILD_TYPE == "release"
