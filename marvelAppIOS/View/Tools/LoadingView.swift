//
//  LoadingView.swift
//  marvelAppIOS
//
//  Created by Natalia Camero on 21/2/24.
//

import SwiftUI

struct LoadingView: View {
    @State private var isLoading = true
    
    var body: some View {
        VStack {
            ProgressView("Loading ...", value: isLoading ? 1.0 : nil)
                .progressViewStyle(CircularProgressViewStyle())
                .onAppear {
                    withAnimation(Animation.linear(duration: 1.0).repeatForever(autoreverses: false)) {
                        isLoading = true
                    }
                }
        }
        
    }
}

#Preview {
    LoadingView()
}
