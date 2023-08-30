class StudentsController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]

  def create
    @student = Student.create(
      user_id: current_user.id,
      first_name: params["first_name"],
      last_name: params["last_name"],
      email: params["email"],
      phone_number: params["phone_number"],
      short_bio: params["short_bio"],
      linkedin_url: params["linkedin_url"],
      twitter_handle: params["twitter_handle"],
      website_url: params["website_url"],
      online_resume_url: params["online_resume_url"],
      github_url: params["github_url"],
      photo: params["photo"],
    )
    if @student.valid?
      render json: @student.as_json
    else
      render json: { errors: @student.errors.full_messages }, status: 422
    end
  end

  def index
    @students = Student.all
    render json: @students.as_json
  end

  def show
    @student = Student.find_by(id: params["id"])
    render json: @student.as_json
  end

  def update
    @student = Student.find_by(id: params[:id])
    if @student.update(
      first_name: params[:first_name] || @student.first_name,
      last_name: params[:last_name] || @student.last_name,
      email: params[:email] || @student.email,
      phone_number: params[:phone_number] || @student.phone_number,
      short_bio: params[:short_bio] || @student.short_bio,
      linkedin_url: params[:linkedin_url] || @student.linkedin_url,
      twitter_handle: params[:twitter_handle] || @student.twitter_handle,
      website_url: params[:website_url] || @student.website_url,
      online_resume_url: params[:online_resume_url] || @student.online_resume_url,
      github_url: params[:github_url] || @student.github_url,
      photo: params[:photo] || @student.photo,
    )
      render json: @student.as_json
    else
      render json: { errors: @student.errors.full_messages }, status: 422
    end
  end

  def destroy
    @student = Student.find_by(id: params[:id])
    @student.destroy
    render json: { message: "Student destroyed successfully" }
  end
end
