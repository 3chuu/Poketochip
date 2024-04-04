//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by 윤지호 on 12/11/23.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.framework(
    name: Module.infrastructure.name,
    packages: [
        .alamofire,
        .kingfisher,
        .firebase
    ],
    dependencies:[
            .package(product: "Alamofire"),
            .package(product: "Kingfisher"),
            .package(product: "FirebaseStorage"),
            .package(product: "FirebaseFirestore"),
            .package(product: "FirebaseFirestoreSwift"),
            .package(product: "FirebaseMessaging"),
        ]
    // firebase 관련 라이브러리 추가 시 위의 .package 4종 세트 추가 해서 사용하기
)
