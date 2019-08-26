//
//  CircleImage.swift
//  SwiftUI_Basic2
//
//  Created by Lyunho Kim on 2019/08/27.
//  Copyright © 2019 Lyunho Kim. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("california-golden-gate-bridge-night")
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.gray, lineWidth: 4))
            .shadow(radius: 10)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
