class ProjectsController < ApplicationController
  load_and_authorize_resource :project

  def index
    @projects = @projects.order('weight DESC')
    @q = @projects.search(params[:q])
    @projects = @q.result
    @projects = @projects.page(params[:page])
  end

  def show
  end

  def new
    @project.photos.build
  end

  def create
    @project.weight = begin (Project.order('weight DESC').first.weight + 1) rescue 0 end if @project.weight == 0
    if @project.save
      redirect_to edit_project_path(@project)
    else
      render :edit
    end
  end

  def edit
    @project.photos.build
  end

  def update
    if @project.update_attributes(project_params)
      redirect_to edit_project_path(@project)
    else
      render :edit
    end
  end

  def destroy
    old_type = @project.type
    @project.destroy
    redirect_to projects_path(q: { type_eq: old_type })
  end

private

  def project_params
    params.require(:project).permit(
      :type, :title, :title_ua, :is_published, :description, :description_ua,
      :weight, :info, :info_ua, { photos_attributes: [:id, :asset, :asset_cache, :desc, :desc_ua, :is_cover, :weight] }
    )
  end
end
