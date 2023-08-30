class EducationsController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]

  def index
    @educations = Education.all
    render json: @educations
  end

  def show
    @education = Education.find_by(id: params["id"])
    render json: @education
  end

  def create
    education = Education.create(
      student_id: params["student_id"],
      start_date: params["start_date"],
      end_date: params["end_date"],
      degree: params["degree"],
      university_name: params["university_name"],
      details: params["details"],
    )
    if education.valid?
      render json: education, status: :created
    else
      render json: { errors: education.errors.full_messages }, status: 422
    end
  end

  def update
    education = Education.find_by(id: params[:id])
    education.update(
      start_date: params["start_date"] || @education.start_date,
      end_date: params["end_date"] || @education.end_date,
      degree: params["degree"] || @education.degree,
      university_name: params["university_name"] || @education.university_name,
      details: params["details"] || @education.details,
    )
    render json: education, status: :updated
  end

  def destroy
    education = Education.findy_by(id: params[:id])
    education.destroy
    render json: { message: "Education data successfully destroyed." }
  end
end
