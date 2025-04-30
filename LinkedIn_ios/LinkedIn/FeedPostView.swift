import SwiftUI

struct Post: Identifiable {
    let id = UUID()
    let authorName: String
    let authorTitle: String
    let authorImage: String
    let content: String
    let timeAgo: String
    let likes: Int
    let comments: Int
    let shares: Int
}

struct FeedPostView: View {
    let post: Post
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            // Author Info
            HStack(spacing: 8) {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 48, height: 48)
                    .foregroundColor(.gray)
                
                VStack(alignment: .leading, spacing: 2) {
                    Text(post.authorName)
                        .font(.headline)
                    Text(post.authorTitle)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Text(post.timeAgo)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                
                Spacer()
                
                Button(action: {}) {
                    Image(systemName: "ellipsis")
                        .foregroundColor(.gray)
                }
            }
            .padding(.horizontal)
            
            // Post Content
            Text(post.content)
                .font(.body)
                .padding(.horizontal)
            
            // Engagement Buttons
            HStack(spacing: 20) {
                Button(action: {}) {
                    HStack {
                        Image(systemName: "hand.thumbsup")
                        Text("\(post.likes)")
                    }
                    .foregroundColor(.gray)
                }
                
                Button(action: {}) {
                    HStack {
                        Image(systemName: "bubble.right")
                        Text("\(post.comments)")
                    }
                    .foregroundColor(.gray)
                }
                
                Button(action: {}) {
                    HStack {
                        Image(systemName: "arrow.2.squarepath")
                        Text("\(post.shares)")
                    }
                    .foregroundColor(.gray)
                }
                
                Button(action: {}) {
                    HStack {
                        Image(systemName: "paperplane")
                    }
                    .foregroundColor(.gray)
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 8)
        }
        .padding(.vertical)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 2)
    }
}

#Preview {
    FeedPostView(post: Post(
        authorName: "John Doe",
        authorTitle: "Software Engineer at Apple",
        authorImage: "person.circle.fill",
        content: "Excited to announce that I've joined Apple as a Software Engineer! Looking forward to working with an amazing team and contributing to innovative projects.",
        timeAgo: "2h",
        likes: 245,
        comments: 32,
        shares: 12
    ))
    .padding()
} 