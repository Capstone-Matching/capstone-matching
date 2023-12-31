class ProjectsController < ApplicationController
  # ToDo Check with team
  before_action :authorize_admin_or_prof, unless: -> { Rails.env.development? || Rails.env.test? }
  protect_from_forgery except: :destroy
  def index
    @role = nil

    if session[:user_id]
      user_id = session[:user_id]
      user = User.find(user_id)
      @role = user.role
    end

    @semesters = Project.pluck(:semester).uniq
    @selected_semester = params[:semester]

    @projects = if @selected_semester.present?
      Project.where(semester: @selected_semester)
    else
      Project.all
    end
  end

  def new
    @semesters = generate_semesters
    @project = Project.new
    @restrictions = {}
    @restriction_count = params[:restriction_count]
    @preference_count = params[:preference_count]
    render_to_string =render_to_string

    @restrictions['gender'] = STUDENT_STATUS_CONSTANTS['gender']
    @restrictions['work_auth'] = STUDENT_STATUS_CONSTANTS['work_auth']
    @restrictions['contract_sign'] = STUDENT_STATUS_CONSTANTS['contract_sign']
    @restrictions['nationality'] = STUDENT_STATUS_CONSTANTS['nationality']

    if @restriction_count.present?
      n = @restriction_count.to_i
      (1..n).each { |i|
        @project.sponsor_restrictions.build
      }
    end

    if @preference_count.present?
      n = @preference_count.to_i
      n.times {@project.sponsor_preferences.build}
    end
  end

  def append_sponsor
    len = @project.sponsor_restrictions.length
    @project.sponsor_restrictions.clear

    len = len + 1
    len.times {@project.sponsor_restrictions.build}
    @content = ''
    for i in 1..len do
      @content += render_to_string(partial: 'shared/sponsor_restrictions', locals: { f: @project.sponsor_restrictions[i], key: '' })
    end
    render plain:@content
  end

  def create
    @semesters = generate_semesters
    @project = Project.new(project_params)
    respond_to do |format|
      if @project.save
        flash[:notice] = "Project was successfully created"
        format.html { redirect_to "/projects", notice: "Project was successfully created" }
      else
        flash[:error] =  @project.errors.full_messages.join(', ')
        format.html { render :new, status: :unprocessable_entity}
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @semesters = generate_semesters
    @project = Project.find(params[:id])
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    flash[:notice] = "Project was successfully deleted"
    redirect_to projects_path
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      flash[:notice] = "Project was successfully updated"
      redirect_to projects_path
    else
      render :edit, status: :unprocessable_entity
    end
  end


  private
    def project_params
      params.require(:project).permit(:name, :semester, :sponsor, :description, :info_url,
                                      sponsor_restrictions_attributes: [:restriction_type, :restriction_val, :_destroy],
                                      sponsor_preferences_attributes: [:preference_type, :preference_val, :bonus_amount, :_destroy])
    end

    def generate_semesters
      current_year = Time.now.year
      semesters = []

      (0..2).each do |year_offset|
        year = current_year + year_offset
        semesters << "Spring #{year}"
        semesters << "Summer #{year}"
        semesters << "Fall #{year}"
      end

      semesters
    end
end