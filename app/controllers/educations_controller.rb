class EducationsController < ApplicationController
  def index
    educations = Education.all
    render json: education
  end

  def show
    education = Education.find_by(id: params["id"])
    render json: experience
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
      start_date: params["start_date"],
      end_date: params["end_date"],
      degree: params["degree"],
      university_name: params["university_name"],
      details: params["details"],
    )
    render json: education, status: :updated
  end

  def destroy
    education = Education.findy_by(id: params[:id])
    education.destroy
    render json: { message: "Education data successfully destroyed." }
  end
end
