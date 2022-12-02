# frozen_string_literal: true

# app/services/create_data_service.rb
class CreateDataService
  attr_accessor :username

  BASE_URL = 'https://api.github.com'

  def initialize(username)
    @username = username
  end

  def call
    repo_hash = fetch_repo_data.map do |git_repo|
      { name: git_repo['name'], stars: git_repo['stargazers_count'] }
    end
    create_repository(repo_hash)
  end

  def fetch_repo_data
    url = BASE_URL + "/users/#{username}/repos"
    response = HTTParty.get(url)
    JSON.parse(response.body)
  end

  def user
    User.find_or_create_by(username: username)
  end

  def create_repository(repos_data)
    repos_data.each do |data|
      repo = user.repositories.find_or_create_by(name: data[:name])
      repo.stars = data[:stars]
      repo.save!
    end
  end
end
