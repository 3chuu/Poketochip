//
//  TempGameModel.swift
//  Presentation
//
//  Created by 마경미 on 25.01.24.
//

import Foundation

struct VersionModel {
    // id는 PokeAPI에서 받아오기
    let id: Int = 0
    let name: String
    let legendaryImageURL: String
}

struct GameModel {
    let name: String
    let gameImageURL: String
    let versions: [VersionModel]
}

extension GameModel {
    static var tempGames: [GameModel] = [
        .init(name: "포켓몬스터 DP 디아루가 펄기아", gameImageURL: "https://t1.daumcdn.net/news/200801/18/gamedonga/20080118134013.911.0.jpg", versions: [
            .init(name: "디아루가", legendaryImageURL: "https://static.wikia.nocookie.net/pokemon/images/3/3c/%EB%94%94%EC%95%84%EB%A3%A8%EA%B0%80_%EA%B3%B5%EC%8B%9D_%EC%9D%BC%EB%9F%AC%EC%8A%A4%ED%8A%B8.png/revision/latest?cb=20190606083954&path-prefix=ko"),
            .init(name: "펄기아", legendaryImageURL: "https://i.namu.wiki/i/GKTkD680FFlDas6ZAf69Agog7oBr7zr4QNO2IDm03D7zW6Q2tLDC5vL7Kxmpt0tEAc6kkJtuKhiV7kYmmVi5WA.webp")
        ]),
        .init(name: "포켓몬스터 DP 디아루가 펄기아", gameImageURL: "https://t1.daumcdn.net/news/200801/18/gamedonga/20080118134013.911.0.jpg", versions: [
            .init(name: "디아루가", legendaryImageURL: "https://static.wikia.nocookie.net/pokemon/images/3/3c/%EB%94%94%EC%95%84%EB%A3%A8%EA%B0%80_%EA%B3%B5%EC%8B%9D_%EC%9D%BC%EB%9F%AC%EC%8A%A4%ED%8A%B8.png/revision/latest?cb=20190606083954&path-prefix=ko"),
            .init(name: "펄기아", legendaryImageURL: "https://i.namu.wiki/i/GKTkD680FFlDas6ZAf69Agog7oBr7zr4QNO2IDm03D7zW6Q2tLDC5vL7Kxmpt0tEAc6kkJtuKhiV7kYmmVi5WA.webp")
        ]),
        .init(name: "포켓몬스터 DP 디아루가 펄기아", gameImageURL: "https://t1.daumcdn.net/news/200801/18/gamedonga/20080118134013.911.0.jpg", versions: [
            .init(name: "디아루가", legendaryImageURL: "https://static.wikia.nocookie.net/pokemon/images/3/3c/%EB%94%94%EC%95%84%EB%A3%A8%EA%B0%80_%EA%B3%B5%EC%8B%9D_%EC%9D%BC%EB%9F%AC%EC%8A%A4%ED%8A%B8.png/revision/latest?cb=20190606083954&path-prefix=ko"),
            .init(name: "펄기아", legendaryImageURL: "https://i.namu.wiki/i/GKTkD680FFlDas6ZAf69Agog7oBr7zr4QNO2IDm03D7zW6Q2tLDC5vL7Kxmpt0tEAc6kkJtuKhiV7kYmmVi5WA.webp")
        ])
    ]
}
