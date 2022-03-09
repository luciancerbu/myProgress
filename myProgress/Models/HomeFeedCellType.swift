//
//  HomeFeedCellType.swift
//  myProgress
//
//  Created by Lucian Cerbu on 09.03.2022.
//

import Foundation

enum HomeFeedCellType {
    case posterCell(viewModel: PosterCollectionViewCellViewModel)
    case post(viewModel: PostCollectionViewCellViewModel)
    case actions(viewModel: PostActionsCollectionViewCellViewModel)
    case likeCount(viewModel: PostLikesCollectionViewCellViewModel)
    case caption(viewModel: PostCaptionCollectionViewCellViewModel)
    case timestamp(viewModel: PostDatetimeCollectionViewCellViewModel)
}
