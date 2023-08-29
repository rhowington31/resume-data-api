class StudentsController < ApplicationController

  def index
    students = Student.all
    render json: students.as_json
  end

  def show
    student = Student.find_by(id: params["id"])
    render json: student.as_json
  end

end