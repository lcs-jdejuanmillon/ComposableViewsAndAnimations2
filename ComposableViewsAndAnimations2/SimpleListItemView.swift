//
//  SimpleListItemView.swift
//  SongBrowser
//
//  Created by Russell Gordon on 2021-02-22.
//

import SwiftUI

struct SimpleListItemView: View {
    
    var title: String
    var caption: String
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text(title)
            
            Text(caption)
                .font(.caption)
            
        }
    }
}

struct SimpleListItemView_Previews: PreviewProvider {
    static var previews: some View {
        SimpleListItemView(title: "Some title",
                           caption: "Some caption")
    }
}
