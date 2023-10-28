//
//  secondview.swift
//  test1028
//
//  Created by Nagahashikirara on 2023/10/28.
//

import SwiftUI

struct secondview: View {
    var body: some View {
        ZStack {
                    Color(.orange)
                    Text("Second View")
                }
    }
}

struct secondview_Previews: PreviewProvider {
    static var previews: some View {
        secondview()
    }
}
