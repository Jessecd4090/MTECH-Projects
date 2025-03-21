//
//  Posts.swift
//  Tech-chat
//
//  Created by Jestin Dorius on 3/21/25.
//

struct Post {
    var title: String
    var bodyText: String
    var date: String
    var user: String
    var comments: [String]
}


let posts = [
    Post(
        title: "First Post",
        bodyText: "This is my first post!",
        date: "01/21/25",
        user: "Jestin",
        comments: ["Yay", "So cool!"]),
    Post(title: "App Progress",
         bodyText: "The app is going great, just a little more",
         date: "03/21/25",
         user: "Jestin",
         comments: ["Great progress", "Looks good!"]),
    Post(title: "Second Post",
         bodyText: "Second Post",
         date: "02/14/25",
         user: "Jestin",
         comments: ["Nice", "So cool"]),
    Post(title: "Random Text",
         bodyText: "Pterodactyl",
         date: "03/22/25",
         user: "Unknown",
         comments: ["What is this?", "Why?"]),
    Post(title: "New Post",
         bodyText: "This is a new Post",
         date: "03/25/25",
         user: "Jestin",
         comments: ["Good Job!", "Curious"]),
    Post(title: "Getting there", bodyText: "This is the 6th post", date: "03/26/25", user: "Jestin", comments: ["Almost there!", "About halfway there"]),
    Post(title: "7th Post",
         bodyText: "Post number 7",
         date: "03/30/25",
         user: "Jestin",
         comments: ["Nice", "Cool"]),
    Post(title: "8th Post",
         bodyText: "Post number 8",
         date: "03/30/25",
         user: "Jestin",
         comments: ["Nearly done", "Wheres the photo?"]),
    Post(title: "Second to Last Post", bodyText: "An apple a day keeps the doctor away", date: "03/30/25", user: "Jestin", comments: ["So true", "Liar!"]),
    Post(title: "Last Post", bodyText: "I'm finally done making posts!", date: "03/30/25", user: "Jestin", comments: ["Yay!!!!!", "Took you long enough....."])]
