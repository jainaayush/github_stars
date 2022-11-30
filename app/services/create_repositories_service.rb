class CreateRepositoriesService
	attr_accessor :username

	def initialize(username)
		@username = username
	end

	def call
		results = []
		response = fetch_repo_data
    batch = response.pluck('name', 'stargazers_count')
    batch.each { |b| results << { name: b[0], stars: b[1], username: username } }

	results.each do |result|
			Repository.find_or_create_by(
				name: result[:name],
				stars: result[:stars],
				username: result[:username]
			)
		end
	end

	def fetch_repo_data
		url = "https://api.github.com/users/#{username}/repos"
    response = HTTParty.get(url)
		JSON.parse(response.body)
	end
end
