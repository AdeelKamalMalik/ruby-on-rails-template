class FaqsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project
  before_action :set_faq, only: %i[show edit update destroy]

  def index
    @faqs = @project.faqs
  end

  def show; end

  def new
    @faq = @project.faqs.build
  end

  def create
    @faq = @project.faqs.build(faq_params)
    respond_to do |format|
      if @faq.save
        format.turbo_stream
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit; end

  def update
    if @faq.update(faq_params)
      redirect_to project_faq_path(@project, @faq), notice: 'FAQ was successfully updated.'
    else
      render :edit, alert: 'Failed to update FAQ.'
    end
  end

  def destroy
    @faq.destroy
    redirect_to project_faqs_path(@project), notice: 'FAQ was successfully destroyed.'
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_faq
    @faq = @project.faqs.find(params[:id])
  end

  def faq_params
    params.require(:faq).permit(:question, :answer)
  end
end
