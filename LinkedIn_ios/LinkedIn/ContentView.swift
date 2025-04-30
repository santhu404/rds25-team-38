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
    @State private var posts: [Post] = [
        Post(
            authorName: "John Doe",
            authorTitle: "Software Engineer at Apple",
            authorImage: "person.circle.fill",
            content: "Excited to announce that I've joined Apple as a Software Engineer! Looking forward to working with an amazing team and contributing to innovative projects.",
            timeAgo: "2h",
            likes: 245,
            comments: 32,
            shares: 12
        ),
        Post(
            authorName: "Jane Smith",
            authorTitle: "Product Manager at Google",
            authorImage: "person.circle.fill",
            content: "Just launched our new AI-powered feature! It's been an incredible journey working with our talented team to bring this to life. #AI #Innovation",
            timeAgo: "4h",
            likes: 189,
            comments: 45,
            shares: 23
        ),
        Post(
            authorName: "Mike Johnson",
            authorTitle: "Senior Developer at Microsoft",
            authorImage: "person.circle.fill",
            content: "Sharing some insights from our latest project: Building scalable microservices architecture. Check out the key learnings and best practices we discovered!",
            timeAgo: "6h",
            likes: 156,
            comments: 28,
            shares: 15
        )
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            HeaderView(showSidebar: $showSidebar)
            
            ScrollView {
                VStack(spacing: 16) {
                    ForEach(posts) { post in
                        FeedPostView(post: post)
                    }
                }
                .padding()
            }
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
        NotificationView(showSidebar: $showSidebar)
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
