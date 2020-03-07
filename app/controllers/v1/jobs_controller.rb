class V1::JobsController < ApplicationController
  def index
    jobs = Job.all
    render json: jobs, status: 200
  end

  def create
    job = Job.new(job_params)
    job.vtc = @current_user.user_joined_vtc.vtc
    job.user = @current_user
    if job.valid? && job.save
      job_vtc = Vtc.find_by(id: job.vtc_id)
      job_vtc.increase_money_made(job.money_made)
      job_vtc.increase_deliveries_completed
      job_vtc.increase_total_km_driven(job.km_driven)
      job_vtc.save
      render json: job, status: 201
    else
      render json: job.errors.messages, status: 400
    end
  end

  def retrieve
    job = Job.find_by(id: params[:job_id])
    if job.present?
      render json: job, status: 200
    else
      render json: { "error_message": "Job not found"}, status: 404
    end
  end

  private
  def job_params
    params.require(:job).permit(
        :km_driven,
        :to_city,
        :from_city,
        :to_company,
        :from_company,
        :damage,
        :money_made,
        :goods_type
        )
  end
end
