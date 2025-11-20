//
//  EyeRestExamplesView.swift
//  EyeRestController
//
//  Created by Артём on 19.11.2025.
//

import SwiftUI

let warmups = [EyeWarmUpModel(id: 1, title: "Bring of the nose", description: "Watch straight in front of you for 2-3 seconds. Bring the pupils to the bridge of the nose with all our might, bringing the finger closer to the nose for 3-5 seconds. Repeat 10-12 times. The exercise relieves fatigue, facilitates visual work at close range."),
                EyeWarmUpModel(id: 2, title: "Floor - ceiling - walls", description: "Slowly shift your gaze from the floor to the ceiling, to the right, left and back, without changing the position of your head. Repeat 8-12 times."),
                EyeWarmUpModel(id: 3, title: "Curtains", description: "Fast and easy blink for 2 minutes. This exercise improves blood circulation."),
                EyeWarmUpModel(id: 4, title: "Chours", description: "Move your eyes in different directions: in a circle - clockwise and counterclockwise. The exercise strengthens the eye muscles."),
               EyeWarmUpModel(id: 5, title:  "We're shoting eyes", description: "Up - left, down - right and vice versa. At the same time, the eyes can be open or closed, as it is more convenient. The exercise strengthens the eye muscles."),
               EyeWarmUpModel(id: 6, title: "Surprising", description: "We close our eyes for five seconds and open our eyelids wide. This method strengthens and relaxes the muscles of the eyeball, improves metabolism and blood circulation in tissues. Repeat 8-10 times."),
               EyeWarmUpModel(id: 7, title: "Mark on the glass", description: "We define a point on the glass. We choose a distant object outside the window, look into the distance for a few seconds, then look at the point. Later, you can complicate the loads - focus on four differently distant objects."),
               EyeWarmUpModel(id: 8, title:  "Massage", description: "With three fingers of each hand, easily press on the upper eyelids, after 1-2 seconds remove the fingers from the eyelids. Repeat 3 times. Exercise improves the circulation of intraocular fluid.")
               
]

struct EyeRestExamplesView: View {
    var body: some View {
        NavigationStack {
            List(warmups) { warmup in
                NavigationLink(warmup.title) {
                    WarmUpDescriptionView(warmupId: warmup.id)
                }
                .foregroundStyle(.white)
                .listRowBackground(Color.pink.opacity(0.7))
                .listRowSeparatorTint(.white)
                .padding()
                
            }
            .scrollContentBackground(.hidden)

            .navigationBarTitleDisplayMode(.large)
            .background(Color.pink.opacity(0.2))
            .toolbar {
                ToolbarItem(placement: .title) {
                    Text("Some warm-ups")
                        .foregroundColor(.white)
                        .font(.largeTitle.weight(.bold))
                }
            }
        }
        .tint(.white)
    }
    
    init() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.backgroundColor = UIColor(.pink.opacity(0.4))
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().standardAppearance = navBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
        UINavigationBar.appearance().compactAppearance = navBarAppearance
        UINavigationBar.appearance().tintColor = .white
    }
}

#Preview {
    EyeRestExamplesView()
}
