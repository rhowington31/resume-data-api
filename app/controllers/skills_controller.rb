class SkillsController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]

  def index
    @skills = Skill.all
    render json: @skills.as_json
  end

  def show
    @skill = Skill.find_by(id: params[:id])
    render json: @skill.as_json
  end

  def create
    @skill = Skill.create(
      skill_name = params[:skill_name]
    )
    if @skill.valid?
      render json: @skill, status: :created
    else
      render json: { errors: @skill.errors.full_messages }, status: 422
    end
  end

  def update
    @skill = Skill.find_by(id: params[:id])
    @skill.update(
      skill_name = params[:skill_name] || @skill.skill_name
    )
    if @skill.valid?
      render json: @skill, status: :updated
    else
      render json: { errors: @skill.errors.full_messages }, status: 422
    end
  end

  def destroy
    @skill = Skill.find_by(id: params[:id])
    @skill.destroy
    render json: { message: "Skill data successfully destroyed." }
  end
end

  
