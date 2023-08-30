class ExperiencesController < ApplicationController
  # before_action :authentication_admin

  def index
    experiences = Experience.all
    render json: experience
  end

  def show
    experience = Experience.find_by(id: params["id"])
    render json: experience
  end

  def create
    experience = Experience.create(
      student_id: params["student_id"],
      start_date: params["start_date"],
      end_date: params["end_date"],
      job_title: params["job_title"],
      company_name: params["company_name"],
      details: params["details"],
    )
    if experience.valid?
      render json: experience, status: :created
    else
      render json: { errors: experience.errors.full_messages }, status: 422
    end
  end

  def update
    experience = Experience.find_by(id: params[:id])
    experience.update(
      start_date: params["start_date"] || experience.start_date,
      end_date: params["end_date"] || experience.end_date,
      job_title: params["job_title"] || experience.job_title,
      company_name: params["company_name"] || experience.company_name,
      details: params["details"] || experience.details,
    )
    render json: experience, status: :updated
  end

  def destroy
    experience = Experience.find_by(id: params[:id])
    experience.destory
    render json: { message: "Experience successfully destroyed." }
  end
end
