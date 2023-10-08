//
// Copyright © 2023 Turing Software, LLC. All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

import Foundation
import SwiftUI

struct GeneralSettingsView: View {
    @AppStorage("uupDumpJsonApiUrl") private var uupDumpJsonApiUrl = "https://uupdump.net/json-api/"
    @State private var isValidURL: Bool = true

    var body: some View {
        Form {
            TextField("UUP Dump JSON API URL", text: $uupDumpJsonApiUrl, onEditingChanged: validateURL)
                .textContentType(.none)
                .foregroundColor(isValidURL ? .primary : .red)

            
            if !isValidURL {
                Text("Please enter a valid URL.")
                    .foregroundColor(.red)
            }
        }
        .padding(20)
        .frame(width: 500, height: 100)
    }
                    
    private func validateURL(_: Bool) {
        if let url = URL(string: uupDumpJsonApiUrl), url.scheme != nil, url.host != nil {
            isValidURL = true
        } else {
            isValidURL = false
        }
    }
}

