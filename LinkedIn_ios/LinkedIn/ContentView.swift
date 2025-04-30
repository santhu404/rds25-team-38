//
//  ContentView.swift
//  LinkedIn
//
//  Created by Santosh Kumar Kancha on 4/30/25.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0
    @State private var showSidebar = false
    
    var body: some View {
        ZStack {
            TabView(selection: $selectedTab) {
                FeedView(showSidebar: $showSidebar)
                    .tabItem {
                        Image(systemName: "house.fill")
                        Text("Feed")
                    }
                    .tag(0)
                
                NetworkView(showSidebar: $showSidebar)
                    .tabItem {
                        Image(systemName: "person.2.fill")
                        Text("Network")
                    }
                    .tag(1)
                
                JobsView(showSidebar: $showSidebar)
                    .tabItem {
                        Image(systemName: "briefcase.fill")
                        Text("Jobs")
                    }
                    .tag(2)
                
                NotificationsView(showSidebar: $showSidebar)
                    .tabItem {
                        Image(systemName: "bell.fill")
                        Text("Notifications")
                    }
                    .tag(3)
            }
            
            if showSidebar {
                SidebarView(showSidebar: $showSidebar)
                    .transition(.move(edge: .leading))
                    .zIndex(1)
            }
        }
    }
}

struct FeedView: View {
    @Binding var showSidebar: Bool
    var body: some View {
        VStack {
            HeaderView(showSidebar: $showSidebar)
            Spacer()
            Text("Feed Content")
            Spacer()
        }
    }
}

struct NetworkView: View {
    @Binding var showSidebar: Bool
    var body: some View {
        VStack {
            HeaderView(showSidebar: $showSidebar)
            Spacer()
            Text("Network Content")
            Spacer()
        }
    }
}

struct JobsView: View {
    @Binding var showSidebar: Bool
    var body: some View {
        VStack {
            HeaderView(showSidebar: $showSidebar)
            Spacer()
            Text("Jobs Content")
            Spacer()
        }
    }
}

struct NotificationsView: View {
    @Binding var showSidebar: Bool
    var body: some View {
        VStack {
            HeaderView(showSidebar: $showSidebar)
            Spacer()
            Text("Notifications Content")
            Spacer()
        }
    }
}

struct HeaderView: View {
    @Binding var showSidebar: Bool
    
    var body: some View {
        HStack {
            Button(action: {
                withAnimation {
                    showSidebar.toggle()
                }
            }) {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.blue)
            }
            
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                Text("Search")
                    .foregroundColor(.gray)
                Spacer()
            }
            .padding(8)
            .background(Color(.systemGray6))
            .cornerRadius(8)
            
            Button(action: {}) {
                Image(systemName: "message.fill")
                    .foregroundColor(.blue)
                Text("5")
                    .foregroundColor(.white)
                    .padding(4)
                    .background(Color.blue)
                    .clipShape(Circle())
            }
        }
        .padding()
    }
}

struct SidebarView: View {
    @Binding var showSidebar: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Profile Section
            VStack(alignment: .leading) {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .foregroundColor(.blue)
                Text("John Doe")
                    .font(.title2)
                    .bold()
                Text("San Francisco, CA")
                    .foregroundColor(.gray)
            }
            .padding()
            
            // Stats Section
            VStack(alignment: .leading) {
                HStack {
                    Text("Profile Views")
                    Spacer()
                    Text("1,234")
                        .bold()
                }
                HStack {
                    Text("Post Impressions")
                    Spacer()
                    Text("5,678")
                        .bold()
                }
            }
            .padding()
            
            // Settings Section
            Button(action: {}) {
                HStack {
                    Image(systemName: "gear")
                        .foregroundColor(.blue)
                    Text("Settings")
                        .foregroundColor(.primary)
                }
            }
            .padding()
            
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.width * 0.8)
        .background(Color(.systemGray6))
        .edgesIgnoringSafeArea(.all)
        .gesture(
            DragGesture()
                .onEnded { gesture in
                    if gesture.translation.width < -100 {
                        withAnimation {
                            showSidebar = false
                        }
                    }
                }
        )
    }
}

#Preview {
    ContentView()
}
