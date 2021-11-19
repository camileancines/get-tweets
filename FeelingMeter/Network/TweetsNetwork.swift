//
//  TweetsNetwork.swift
//  FeelingMeter
//
//  Created by Camile Ancines on 16/11/21.
//

import Foundation

final class TweetsNetwork {
    func requestUserId(username: String, completion: @escaping (String) -> Void) {
        guard let url = URL(string: "https://api.twitter.com/2/users/by/username/\(username)") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error)
            } else {
                if let data = data {
                    let decoder = JSONDecoder()
                    guard let response = try?
                           decoder.decode(User.self, from: data) else { return }
                    completion(response.id)
                }
            }
        }
    }
}

private let fakeData = """
{
    "data": [
        {
            "id": "1459237768207298566",
            "created_at": "2021-11-12T19:12:49.000Z",
            "author_id": "1636590253",
            "text": "Wow! These photos of the Dolomites are breathtaking, @ChristianSchafR. What a remarkable place. #ShotOniPhone13Pro 🏔 https://t.co/GIHhCkQI33"
        },
        {
            "id": "1458820905031798784",
            "created_at": "2021-11-11T15:36:21.000Z",
            "author_id": "1636590253",
            "text": "Grateful today and always for the dedication and service of our veterans and their families, and the invaluable experience they bring long after they have left the military, including here at Apple. #VeteransDay https://t.co/9cQv6aYTy5"
        },
        {
            "id": "1458596765725126657",
            "created_at": "2021-11-11T00:45:43.000Z",
            "author_id": "1636590253",
            "text": "Small businesses are an essential part of our economy, and we’re glad to help them manage the life cycle of all their Apple devices in a safe and secure way with Apple Business Essentials. https://t.co/UCu93PKHEz"
        },
        {
            "id": "1458549983032971264",
            "created_at": "2021-11-10T21:39:49.000Z",
            "author_id": "1636590253",
            "text": "Célébrons les 40 ans d'Apple en France! À chaque visite, je suis inspiré par la dynamique et très créative communauté d'artistes et de développeurs. Merci à nos équipes, à nos clients et aux communautés avec lesquelles nous sommes heureux de collaborer. https://t.co/ik8bmYCZgg"
        },
        {
            "id": "1458549982164762625",
            "created_at": "2021-11-10T21:39:48.000Z",
            "author_id": "1636590253",
            "text": "Celebrating 40 years of Apple in France! Every time I visit, I come away inspired by the vibrant and deeply creative community of artists and developers. Thank you to our local teams, our customers, and to the many communities we are grateful to collaborate with."
        },
        {
            "id": "1458244993953394702",
            "created_at": "2021-11-10T01:27:54.000Z",
            "author_id": "1636590253",
            "text": "@Malala @malinfezehai Congratulations to you and Asser! Wishing you all the best as you begin your new life together."
        },
        {
            "id": "1456075201276383236",
            "created_at": "2021-11-04T01:45:55.000Z",
            "author_id": "1636590253",
            "text": "Wishing a happy and safe Diwali to all those celebrating around the world. May the Festival of Lights fill your home with happiness and health. Stunning #ShotOniPhone13ProMax photos by @coffeekarma. https://t.co/09O2GkMcMN"
        },
        {
            "id": "1455724138656452612",
            "created_at": "2021-11-03T02:30:55.000Z",
            "author_id": "1636590253",
            "text": "Apple is joining the First Movers Coalition that will help advance a greener future and a healthier and more equitable world. There has never been a more urgent time to come together in the fight for our planet. #COP26 https://t.co/KJ1lWtd9bp"
        },
        {
            "id": "1454913732178427909",
            "created_at": "2021-10-31T20:50:39.000Z",
            "author_id": "1636590253",
            "text": "Happy Halloween! Pretty great costume, @MrsKylieCurtis! What do you think, @TedLasso? https://t.co/EYuyF5YsrB"
        },
        {
            "id": "1454249966629580800",
            "created_at": "2021-10-30T00:53:05.000Z",
            "author_id": "1636590253",
            "text": "@Canoopsy Amazing wallpaper! 👏"
        }
    ],
    "includes": {
        "users": [
            {
                "id": "1636590253",
                "name": "Tim Cook",
                "username": "tim_cook"
            }
        ]
    },
    "meta": {
        "oldest_id": "1454249966629580800",
        "newest_id": "1459237768207298566",
        "result_count": 10,
        "next_token": "7140dibdnow9c7btw3z2vo02dgvorqv5xr25j9tej0ai8"
    }
}
"""
