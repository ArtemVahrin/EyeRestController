//
//  ContentView.swift
//  EyeRestController
//
//  Created by Артём on 18.11.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var workTimeRemain = 2700
    @State private var restTmeRemain = 300
    
    @State private var isWrokButtonPressed = false
    @State private var isRestButtonPressed = false
    @State private var isButtonOfHowToUsePressed = false
    
    @State private var isPaused = true
    var myTimer = MyTimer()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.pink.opacity(0.2))
                    VStack(spacing: 10) {
                        Spacer()
                        //MARK: - Subtitles
                        HStack(alignment: .center) {
                            Text("Work Time")
                                .padding()
                                .font(.title)
                                
                            
                            Text("Rest Time")
                                .padding()
                                .font(.title)
                        }
                        //MARK: - Timers
                        HStack() {
                            Text("\(myTimer.timeToMinutes(from: workTimeRemain))")
                                .onReceive(myTimer.timer) { _ in
                                    if workTimeRemain > 0 && isWrokButtonPressed == true {
                                        workTimeRemain -= 1
                                    }
                                }
                                .frame(width: 120, height: 45)
                                .padding()
                                .background(Color.pink, in: RoundedRectangle(cornerRadius: 12))
                                .font(.largeTitle)
                                .foregroundStyle(.white)
                            
                            Text("\(myTimer.timeToMinutes(from: restTmeRemain))")
                                .onReceive(myTimer.timer) { _ in
                                    if restTmeRemain > 0 && isRestButtonPressed == true {
                                        restTmeRemain -= 1
                                    }
                                }
                                .frame(width: 120, height: 45)
                                .padding()
                                .background(Color.pink, in: RoundedRectangle(cornerRadius: 12))
                                .font(.largeTitle)
                                .foregroundStyle(.white)
                        }
                        //MARK: - Start/stop buttons
                        HStack {
                            Button(isWrokButtonPressed ? "Pause" : "Start Work") {
                                isWrokButtonPressed.toggle()
                            }
                            .padding()
                            .frame(width: 120, height: 45)
                            .padding()
                            .background(Color.pink.opacity(0.6), in: RoundedRectangle(cornerRadius: 12))
                            .foregroundStyle(.white)
                            .font(.default)
                            
                            Button("Start Rest") {
                                isRestButtonPressed.toggle()
                            }
                            .disabled(isRestButtonPressed)
                            .padding()
                            .frame(width: 120, height: 45)
                            .padding()
                            .background(Color.pink.opacity(0.6), in: RoundedRectangle(cornerRadius: 12))
                            .foregroundStyle(.white)
                            .font(.default)
                        }
                        Spacer()
                        //MARK: - Bottom buttons
                    HStack(alignment: .bottom, spacing: 20) {
                        
                        Button {
                            isButtonOfHowToUsePressed.toggle()
                        } label: {
                            Image(systemName: "questionmark.circle.fill")
                                .foregroundStyle(Color.pink)
                                .font(.largeTitle)
                        }
                        .alert(Text("How To Use"), isPresented: $isButtonOfHowToUsePressed, presenting: String()) { action in
                            Button(role: .close) {
                                
                            } label: {
                                Text("OK")
                            }
                        } message: { message in
                            Text("""
        Click the \("Start Work") button, and a timer will start. After the timer runs out, give your eyes a rest.

        You can also view sample eye exercises by clicking the button in the lower right corner.
""")
                        }
                        
                        Spacer()
                        
                        NavigationLink(destination: EyeRestExamplesView()) {
                            Image(systemName: "book.fill")
                                .foregroundStyle(Color.pink)
                                .font(.largeTitle)
                        }
                    }
                }
                .padding()
            }
            .ignoresSafeArea()
        }
    }
}
#Preview {
    ContentView()
}
