class CapstoneController < ApplicationController
  
  def create
    @capstones = Capstone.create(
      name: params[:name],
      description: params[:description],
      url: params[:url],
      screenshot: params[:screenshot],
      attributes_of_the_student_model: params[:attributes_of_the_student_model],
    )
    render :show
end

def index
  @capstones = Capstone.all
  render :index
end

def show
  @capstone = Capstone.find_by(id: params[:id])
  render :show
end

def update
  @capstone = Capstone.find_by(id: params[:id])
  @capstone.update(
    name: params[:name] || @capstone.name,
      description: params[:description],
      url: params[:url] || @capstone.url,
      screenshot: params[:screenshot] || @capstone.screenshot,
      attributes_of_the_student_model: params[:attributes_of_the_student_model] || @capstone.attributes_of_the_student_model,
  )
  render :show
end

def destroy
  @capstone = Capstone.find_by(id: params[:id])
  @capstone.destroy
  render json: { message: "Capstone has been annihilated!"}
end
