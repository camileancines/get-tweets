//
//  TweetsNetwork.swift
//  FeelingMeter
//
//  Created by Camile Ancines on 16/11/21.
//

import Foundation

protocol TweetsNetworkProtocol {
    func fetchTweets(username: String, completion: @escaping(Swift.Result<Tweets, Error>) -> Void)
}

final class TweetsNetwork: TweetsNetworkProtocol {
    func fetchTweets(username: String, completion: @escaping (Swift.Result<Tweets, Error>) -> Void) {
        do {
            let data = Data(fakeData.utf8)
            let value = try JSONDecoder().decode(Tweets.self, from: data)
            completion(.success(value))
        } catch {
            completion(.failure(TweetsNetworkError.invalidData))
        }
    }
}

enum TweetsNetworkError: Error {
    case invalidData
}


private let fakeData = """
{
    "data": [
        {
            "id": "1460996984911929349",
            "text": "RT @outralilla: aí a gente bota um touro igual o de ny meu... bem imponente assim dourado meu... no meio da locomotiva do brasil chega me a…"
        },
        {
            "id": "1460977500562071564",
            "text": "RT @jairmearrependi: Duas notícias sobre educação no governo Bolsonaro. \n\nEnquanto há alunos desmaiando de fome nas escolas, eles fazem caç…"
        },
        {
            "id": "1460956440101855233",
            "text": "RT @sound3vision: Pior é o idiota achando que tá sendo muito inteligente em falar isso, essa carinha deslumbrada de quem acha que tá ensina…"
        },
        {
            "id": "1460956266923188224",
            "text": "RT @Cecillia: \"Eu fiquei realmente sensibilizada por essa situação\", conta a professora. \"Por que é isso: a fome. Uma fome que a criança nã…"
        },
        {
            "id": "1460956187776720899",
            "text": "RT @VictorFerreira: O Touro de Ouro da Bolsa de Valores não durou um dia intacto. Amanheceu hoje com um lambe-lambe cravado no lombo: FOME…"
        },
        {
            "id": "1460817112948260865",
            "text": "#MasterChefBR pode jogar no lixo que tá podre."
        },
        {
            "id": "1460722358763892736",
            "text": "RT @demori: Alguns celerados espalharam a mentira que \"Búzios controlou a covid com tratamento preventivo e não fechou nada\". A verdade: a…"
        },
        {
            "id": "1460714460583284739",
            "text": "RT @ibere: O Elon Musk disse que doaria 6 bilhões se a ONU explicasse como eles acabariam com a fome com esse dinheiro. A ONU foi lá e truc…"
        },
        {
            "id": "1460713711082033165",
            "text": "RT @BiodiversidadeB: Fio ▪️ A Amazônia já foi lar de gigantes, como por exemplo, uma tartaruga de 4 metros de comprimento, um jacaré com ma…"
        },
        {
            "id": "1460639218334638087",
            "text": "RT @sound3vision: ATENÇAO se a Yasmin Brunet falar \"tudo muito dark\" teremos sorteio de 01 camiseta Sounds (entre os RT)\n\nhttps://t.co/vKXk…"
        }
    ],
    "meta": {
        "oldest_id": "1460639218334638087",
        "newest_id": "1460996984911929349",
        "result_count": 10,
        "next_token": "7140dibdnow9c7btw3z3al4atdwn8f8yur7whebarrlfb"
    }
}
"""
