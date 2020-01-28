//
//  RepositoryResponse.swift
//  Platform
//
//  Created by Hadi Dbouk on 1/28/20.
//  Copyright © 2020 Hadi Dbouk. All rights reserved.
//

import Domain

struct RepositoryResponse: Decodable {
  let id: Repository.Identifier
  let name: String
  let fullName: String
  let description: String?
  let starsCount: Int
  let forksCount: Int
  let issuesCount: Int
  let watchersCount: Int

  private enum CodingKeys: String, CodingKey {
    case id
    case name
    case fullName = "full_name"
    case description
    case starsCount = "stargazers_count"
    case forksCount = "forks_count"
    case issuesCount = "open_issues_count"
    case watchersCount = "subscribers_count"
  }

  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    self.id = try container.decode(Repository.Identifier.self, forKey: .id)
    self.name = try container.decode(String.self, forKey: .name)
    self.fullName = try container.decode(String.self, forKey: .fullName)
    self.description = try? container.decode(String.self, forKey: .description)
    self.starsCount = try container.decode(Int.self, forKey: .starsCount)
    self.forksCount = try container.decode(Int.self, forKey: .forksCount)
    self.issuesCount = try container.decode(Int.self, forKey: .issuesCount)
    self.watchersCount = try container.decode(Int.self, forKey: .watchersCount)
  }
}

extension RepositoryResponse {
  static let sample: [String: Any?] = [
      "id": 14090388,
      "node_id": "MDEwOlJlcG9zaXRvcnkxNDA5MDM4OA==",
      "name": "ql",
      "full_name": "cznic/ql",
      "private": false,
      "owner": [
          "login": "cznic",
          "id": 729580,
          "node_id": "MDQ6VXNlcjcyOTU4MA==",
          "avatar_url": "https://avatars1.githubusercontent.com/u/729580?v=4",
          "gravatar_id": "",
          "url": "https://api.github.com/users/cznic",
          "html_url": "https://github.com/cznic",
          "followers_url": "https://api.github.com/users/cznic/followers",
          "following_url": "https://api.github.com/users/cznic/following{/other_user}",
          "gists_url": "https://api.github.com/users/cznic/gists{/gist_id}",
          "starred_url": "https://api.github.com/users/cznic/starred{/owner}{/repo}",
          "subscriptions_url": "https://api.github.com/users/cznic/subscriptions",
          "organizations_url": "https://api.github.com/users/cznic/orgs",
          "repos_url": "https://api.github.com/users/cznic/repos",
          "events_url": "https://api.github.com/users/cznic/events{/privacy}",
          "received_events_url": "https://api.github.com/users/cznic/received_events",
          "type": "User",
          "site_admin": false
      ],
      "html_url": "https://github.com/cznic/ql",
      "description": "github.com/cznic/ql has moved to modernc.org/ql",
      "fork": false,
      "url": "https://api.github.com/repos/cznic/ql",
      "forks_url": "https://api.github.com/repos/cznic/ql/forks",
      "keys_url": "https://api.github.com/repos/cznic/ql/keys{/key_id}",
      "collaborators_url": "https://api.github.com/repos/cznic/ql/collaborators{/collaborator}",
      "teams_url": "https://api.github.com/repos/cznic/ql/teams",
      "hooks_url": "https://api.github.com/repos/cznic/ql/hooks",
      "issue_events_url": "https://api.github.com/repos/cznic/ql/issues/events{/number}",
      "events_url": "https://api.github.com/repos/cznic/ql/events",
      "assignees_url": "https://api.github.com/repos/cznic/ql/assignees{/user}",
      "branches_url": "https://api.github.com/repos/cznic/ql/branches{/branch}",
      "tags_url": "https://api.github.com/repos/cznic/ql/tags",
      "blobs_url": "https://api.github.com/repos/cznic/ql/git/blobs{/sha}",
      "git_tags_url": "https://api.github.com/repos/cznic/ql/git/tags{/sha}",
      "git_refs_url": "https://api.github.com/repos/cznic/ql/git/refs{/sha}",
      "trees_url": "https://api.github.com/repos/cznic/ql/git/trees{/sha}",
      "statuses_url": "https://api.github.com/repos/cznic/ql/statuses/{sha}",
      "languages_url": "https://api.github.com/repos/cznic/ql/languages",
      "stargazers_url": "https://api.github.com/repos/cznic/ql/stargazers",
      "contributors_url": "https://api.github.com/repos/cznic/ql/contributors",
      "subscribers_url": "https://api.github.com/repos/cznic/ql/subscribers",
      "subscription_url": "https://api.github.com/repos/cznic/ql/subscription",
      "commits_url": "https://api.github.com/repos/cznic/ql/commits{/sha}",
      "git_commits_url": "https://api.github.com/repos/cznic/ql/git/commits{/sha}",
      "comments_url": "https://api.github.com/repos/cznic/ql/comments{/number}",
      "issue_comment_url": "https://api.github.com/repos/cznic/ql/issues/comments{/number}",
      "contents_url": "https://api.github.com/repos/cznic/ql/contents/{+path}",
      "compare_url": "https://api.github.com/repos/cznic/ql/compare/{base}...{head}",
      "merges_url": "https://api.github.com/repos/cznic/ql/merges",
      "archive_url": "https://api.github.com/repos/cznic/ql/{archive_format}{/ref}",
      "downloads_url": "https://api.github.com/repos/cznic/ql/downloads",
      "issues_url": "https://api.github.com/repos/cznic/ql/issues{/number}",
      "pulls_url": "https://api.github.com/repos/cznic/ql/pulls{/number}",
      "milestones_url": "https://api.github.com/repos/cznic/ql/milestones{/number}",
      "notifications_url": "https://api.github.com/repos/cznic/ql/notifications{?since,all,participating}",
      "labels_url": "https://api.github.com/repos/cznic/ql/labels{/name}",
      "releases_url": "https://api.github.com/repos/cznic/ql/releases{/id}",
      "deployments_url": "https://api.github.com/repos/cznic/ql/deployments",
      "created_at": "2013-11-03T18:13:12Z",
      "updated_at": "2020-01-08T19:31:58Z",
      "pushed_at": "2018-11-22T10:19:02Z",
      "git_url": "git://github.com/cznic/ql.git",
      "ssh_url": "git@github.com:cznic/ql.git",
      "clone_url": "https://github.com/cznic/ql.git",
      "svn_url": "https://github.com/cznic/ql",
      "homepage": "https://godoc.org/modernc.org/ql",
      "size": 2582,
      "stargazers_count": 1323,
      "watchers_count": 1323,
      "language": "Go",
      "has_issues": true,
      "has_projects": true,
      "has_downloads": true,
      "has_wiki": true,
      "has_pages": false,
      "forks_count": 85,
      "mirror_url": nil,
      "archived": true,
      "disabled": false,
      "open_issues_count": 23,
      "license": [
          "key": "other",
          "name": "Other",
          "spdx_id": "NOASSERTION",
          "url": nil,
          "node_id": "MDc6TGljZW5zZTA="
      ],
      "forks": 85,
      "open_issues": 23,
      "watchers": 1323,
      "default_branch": "master",
      "temp_clone_token": nil,
      "network_count": 85,
      "subscribers_count": 73
  ]
}
