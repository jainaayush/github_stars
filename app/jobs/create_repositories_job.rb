class CreateRepositoriesJob < ApplicationJob
  def perform(params)
    CreateRepositoriesService.new(params).call
  end
end