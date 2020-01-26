//
//  UserConverter.swift
//  Platform
//
//  Created by Hadi Dbouk on 1/26/20.
//  Copyright © 2020 Hadi Dbouk. All rights reserved.
//

import Domain

class UserConverter {

  func from(_ response: UserResponse) -> User {
    return User(id: response.id,
                username: response.login,
                nodeId: response.nodeId,
                avatarUrl: response.avatarUrl,
                gravatarId: response.gravatarId,
                url: response.url,
                htmlUrl: response.htmlUrl,
                followersUrl: response.followersUrl,
                followingUrl: response.followingUrl,
                gistsUrl: response.gistsUrl,
                starredUrl: response.starredUrl,
                subscriptionsUrl: response.subscriptionsUrl,
                organizationsUrl: response.organizationsUrl,
                reposUrl: response.reposUrl,
                eventsUrl: response.eventsUrl,
                receivedEventsUrl: response.receivedEventsUrl,
                type: response.type,
                siteAdmin: response.siteAdmin,
                name: response.name,
                company: response.company ?? "",
                blog: response.blog,
                location: response.location,
                email: response.email,
                hireable: response.hireable,
                bio: response.bio,
                publicRepos: response.publicRepos,
                publicGists: response.publicGists,
                totalPrivateRepos: response.totalPrivateRepos,
                ownedPrivateRepos: response.ownedPrivateRepos,
                diskUsage: response.diskUsage,
                collaborators: response.collaborators,
                twoFactorAuthentication: response.twoFactorAuthentication,
                plan: from(response.plan))
  }
}

private extension UserConverter {
  func from(_ response: UserResponse.Plan) -> User.Plan {
    return User.Plan(name: response.name, space: response.space, privateRepos: response.privateRepos, collaborators: response.collaborators)
  }
}
