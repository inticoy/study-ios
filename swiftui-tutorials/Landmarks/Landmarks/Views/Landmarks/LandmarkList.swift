//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Inticoy on 2022/10/19.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        //List {
        //    LandmarkRow(landmark: landmarks[0])
        //    LandmarkRow(landmark: landmarks[1])
        //}
        //needs List(landmarks, id: \.id) if struct Landmark is not identifiable
        
        NavigationView {
            List {
                Toggle(isOn: $showFavoritesOnly) {
                    Text("Favorites Only")
                }
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label : {
                        LandmarkRow(landmark: landmark)
                    }
                }
                .navigationTitle("Landmarks")
            }
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
            .environmentObject(ModelData())
        //        ForEach(["iPhone SE (2nd generation)", "iPhone XS Max", "iPad"], id: \.self) { deviceName in
        //                   LandmarkList()
        //                       .previewDevice(PreviewDevice(rawValue: deviceName))
        //                       .previewDisplayName(deviceName)
        //               }
    }
}
