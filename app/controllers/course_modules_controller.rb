class CourseModulesController < ApplicationController
  # GET /course_modules
  # GET /course_modules.json
  def index
    @course_modules = CourseModule.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @course_modules }
    end
  end

  # GET /course_modules/1
  # GET /course_modules/1.json
  def show
    @course_module = CourseModule.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @course_module }
    end
  end

  # GET /course_modules/new
  # GET /course_modules/new.json
  def new
    @course_module = CourseModule.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @course_module }
    end
  end

  # GET /course_modules/1/edit
  def edit
    @course_module = CourseModule.find(params[:id])
  end

  # POST /course_modules
  # POST /course_modules.json
  def create
    @course_module = CourseModule.new(params[:course_module])

    respond_to do |format|
      if @course_module.save
        format.html { redirect_to @course_module, notice: 'Course module was successfully created.' }
        format.json { render json: @course_module, status: :created, location: @course_module }
      else
        format.html { render action: "new" }
        format.json { render json: @course_module.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /course_modules/1
  # PUT /course_modules/1.json
  def update
    @course_module = CourseModule.find(params[:id])

    respond_to do |format|
      if @course_module.update_attributes(params[:course_module])
        format.html { redirect_to @course_module, notice: 'Course module was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @course_module.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /course_modules/1
  # DELETE /course_modules/1.json
  def destroy
    @course_module = CourseModule.find(params[:id])
    @course_module.destroy

    respond_to do |format|
      format.html { redirect_to course_modules_url }
      format.json { head :no_content }
    end
  end
end
