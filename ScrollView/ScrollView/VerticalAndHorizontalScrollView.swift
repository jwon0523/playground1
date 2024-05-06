//
//  VerticalAndHorizontalScrollView.swift
//  ScrollView
//
//  Created by jaewon Lee on 5/6/24.
//

import SwiftUI

struct VerticalAndHorizontalScrollView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content:  {
            VStack {
                ForEach(0..<50) { index in
                    Circle()
                        .fill(Color.red)
                        .frame(height: 100)
                        .overlay(Text("vertical").foregroundColor(.white))
                }
            }
        })
        
        Divider()
        
        ScrollView(.horizontal, showsIndicators: false, content:  {
            HStack {
                ForEach(0..<50) { index in
                    Circle()
                        .fill(Color.red)
                        .frame(width: 100)
                        .overlay(Text("horizontal").foregroundColor(.white))
                }
            }
        })

    }
}

#Preview {
    VerticalAndHorizontalScrollView()
}
