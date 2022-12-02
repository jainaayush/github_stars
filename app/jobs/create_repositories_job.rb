class CreateRepositoriesJob < ApplicationJob
  def perform(params)
    CreateDataService.new(params).call
  end
end