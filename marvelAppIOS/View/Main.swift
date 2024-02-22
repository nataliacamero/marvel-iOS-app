//
//  Main.swift
//  marvelAppIOS
//
//  Created by Natalia Camero on 21/2/24.
//

import SwiftUI

struct MainView: View {
    //Enviroment variable that is injected into the delegate
    @EnvironmentObject var viewModel: RootViewModel
    var body: some View {
            switch viewModel.status {
            case Status.none:
                Text("WAITING FOR HEROS 🕵️‍♂️ ...")
                    .font(.title2)
                    .bold()
                    .fontDesign(.rounded)
                    .foregroundStyle(.red)
            case Status.loading:
                LoadingView()
            case Status.loaded:
                CharactersListView()
            case Status.error(error: let errorString):
                Text("Error: \(errorString)")
            }
    }
}

#Preview {
    MainView()
        .environmentObject(RootViewModel())
}
