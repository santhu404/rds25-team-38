import SwiftUI

enum NotificationType {
    case connectionRequest
    case jobRecommendation
    case postInteraction
    case profileView
    case message
}

struct Notification: Identifiable {
    let id = UUID()
    let type: NotificationType
    let title: String
    let message: String
    let timeAgo: String
    let isRead: Bool
    let imageName: String
    let actionButtonTitle: String?
}

struct NotificationView: View {
    @Binding var showSidebar: Bool
    @State private var notifications: [Notification] = [
        Notification(
            type: .connectionRequest,
            title: "New Connection Request",
            message: "Sarah Johnson wants to connect with you",
            timeAgo: "5m",
            isRead: false,
            imageName: "person.circle.fill",
            actionButtonTitle: "Accept"
        ),
        Notification(
            type: .jobRecommendation,
            title: "Job Recommendation",
            message: "Senior iOS Developer position at Spotify matches your profile",
            timeAgo: "1h",
            isRead: false,
            imageName: "briefcase.fill",
            actionButtonTitle: "View"
        ),
        Notification(
            type: .postInteraction,
            title: "Post Interaction",
            message: "Mike Johnson liked your post about SwiftUI",
            timeAgo: "2h",
            isRead: true,
            imageName: "hand.thumbsup.fill",
            actionButtonTitle: nil
        ),
        Notification(
            type: .profileView,
            title: "Profile View",
            message: "Your profile was viewed by 12 people this week",
            timeAgo: "1d",
            isRead: true,
            imageName: "eye.fill",
            actionButtonTitle: "See who viewed"
        ),
        Notification(
            type: .message,
            title: "New Message",
            message: "You have 3 unread messages from your connections",
            timeAgo: "2d",
            isRead: false,
            imageName: "message.fill",
            actionButtonTitle: "View Messages"
        ),
        Notification(
            type: .connectionRequest,
            title: "New Connection Request",
            message: "Alex Chen, Engineering Manager at Google, wants to connect",
            timeAgo: "3d",
            isRead: false,
            imageName: "person.circle.fill",
            actionButtonTitle: "Accept"
        ),
        Notification(
            type: .jobRecommendation,
            title: "Job Recommendation",
            message: "Tech Lead position at Netflix - Remote work available",
            timeAgo: "4d",
            isRead: true,
            imageName: "briefcase.fill",
            actionButtonTitle: "View"
        ),
        Notification(
            type: .postInteraction,
            title: "Post Interaction",
            message: "Your post about AI trends received 45 comments",
            timeAgo: "5d",
            isRead: false,
            imageName: "bubble.right.fill",
            actionButtonTitle: "View Comments"
        ),
        Notification(
            type: .profileView,
            title: "Profile View",
            message: "Your profile was viewed by a recruiter from Amazon",
            timeAgo: "1w",
            isRead: false,
            imageName: "eye.fill",
            actionButtonTitle: "See Details"
        ),
        Notification(
            type: .message,
            title: "New Message",
            message: "Emily Rodriguez sent you a message about a potential collaboration",
            timeAgo: "1w",
            isRead: true,
            imageName: "message.fill",
            actionButtonTitle: "Reply"
        )
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            HeaderView(showSidebar: $showSidebar)
            
            ScrollView {
                VStack(spacing: 12) {
                    ForEach(notifications) { notification in
                        NotificationCard(notification: notification)
                    }
                }
                .padding()
            }
        }
    }
}

struct NotificationCard: View {
    let notification: Notification
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            // Notification Icon
            Image(systemName: notification.imageName)
                .resizable()
                .frame(width: 40, height: 40)
                .foregroundColor(notificationTypeColor)
                .padding(8)
                .background(notificationTypeColor.opacity(0.1))
                .clipShape(Circle())
            
            VStack(alignment: .leading, spacing: 4) {
                // Title and Time
                HStack {
                    Text(notification.title)
                        .font(.headline)
                        .foregroundColor(notification.isRead ? .gray : .primary)
                    
                    Spacer()
                    
                    Text(notification.timeAgo)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                
                // Message
                Text(notification.message)
                    .font(.subheadline)
                    .foregroundColor(notification.isRead ? .gray : .primary)
                
                // Action Button
                if let actionTitle = notification.actionButtonTitle {
                    Button(action: {}) {
                        Text(actionTitle)
                            .font(.subheadline)
                            .foregroundColor(.white)
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .background(notificationTypeColor)
                            .cornerRadius(20)
                    }
                    .padding(.top, 4)
                }
            }
        }
        .padding()
        .background(notification.isRead ? Color(.systemGray6) : Color.white)
        .cornerRadius(10)
        .shadow(radius: notification.isRead ? 0 : 2)
    }
    
    private var notificationTypeColor: Color {
        switch notification.type {
        case .connectionRequest:
            return .blue
        case .jobRecommendation:
            return .green
        case .postInteraction:
            return .orange
        case .profileView:
            return .purple
        case .message:
            return .red
        }
    }
}

#Preview {
    NotificationView(showSidebar: .constant(false))
} 