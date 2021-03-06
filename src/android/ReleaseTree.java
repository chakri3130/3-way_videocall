package cordova.plugin.videocall.ReleaseTree;/*
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


import android.util.Log;

import org.jetbrains.annotations.NotNull;

import cordova.plugin.videocall.TreeRanger.TreeRanger;
import timber.log.Timber;

public class ReleaseTree extends Timber.Tree {
    private final TreeRanger treeRanger;

    public ReleaseTree(TreeRanger treeRanger) {
        this.treeRanger = treeRanger;
    }

    @Override
    protected void log(int priority, String tag, @NotNull String message, Throwable throwable) {
        // No logging in release, but we allow the ranger to still act
        switch (priority) {
            case Log.VERBOSE:
            case Log.DEBUG:
            case Log.INFO:
                treeRanger.inform(message);
                break;
            case Log.WARN:
                treeRanger.caution(message);
                break;
            case Log.ERROR:
            case Log.ASSERT:
                if (throwable == null) {
                    treeRanger.alert(new Exception(message));
                } else {
                    treeRanger.alert(throwable);
                }
                break;
        }
    }
}
