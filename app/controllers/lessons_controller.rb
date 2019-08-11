class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_authorized_for_current_lesson, only: [:show]


  def show
  end

  private

  def require_authorized_for_current_lesson
    if current_lesson.user != current_user
      redirect_to course_path(current_course), alert: 'Error: You are not enrolled in this Course'
    end
  end

  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end

  helper_method :current_course
  def current_course
    @current_course ||= Section.find(Lesson.find(params[:id]).section_id).course_id
  end

end
