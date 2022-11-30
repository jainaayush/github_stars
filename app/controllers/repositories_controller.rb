class RepositoriesController < ApplicationController

  def create
    repositories = CreateRepositoriesService.new(params[:username]).call

    render json: repositories, status: 200
  end
end
