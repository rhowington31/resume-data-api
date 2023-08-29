class StudentsController < ApplicationController
  
  def create
    student = Student.new()

  def index
    students = Students.all
    render json: students.as_json
  end

  def show
    students = Students.find_by(id: params["id"])
    render json: student.as_json
  end



end