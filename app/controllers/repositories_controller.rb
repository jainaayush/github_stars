class RepositoriesController < ApplicationController
  def create
    repositories = CreateRepositoriesJob.perform_now(params[:username])

    render json: repositories, status: 200
  end
end
