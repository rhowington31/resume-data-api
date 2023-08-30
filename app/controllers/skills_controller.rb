class SkillsController < ApplicationController
  def create
    skill = Skill.create(
      skill_name = params[:skill_name]
    )
    if skill.valid?
      render json: skill, status: :created
    else
      render json: { errors: skill.errors.full_messages }, status: 422
    end
  end
end
