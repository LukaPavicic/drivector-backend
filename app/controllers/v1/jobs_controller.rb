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
      render json: job.errors.full_messages, status: 400
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

  def today_jobs 
    todays_jobs = Job.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day).all.order('created_at DESC').page(params[:page] ? params[:page].to_i : 1).per(10)
    
    # paginate json: todays_jobs, per_page: 10
    render json: {objects: ActiveModel::Serializer::CollectionSerializer.new(todays_jobs, each_serializer: V1::JobSerializer), meta: pagination_meta(todays_jobs)}
  end

  def daily_statistics
    todays_jobs = Job.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day).all
    money_earned = 0
    jobs_completed = todays_jobs.length
    km_driven = 0
    damages_sum = 0
    todays_jobs.each do |job|
      money_earned += job.money_made
      km_driven += job.km_driven
      damages_sum += job.damage
    end
    avg_damage = damages_sum / jobs_completed
    data = { 
      "jobs_completed": jobs_completed,
      "km_driven": km_driven,
      "money_earned": money_earned,
      "average_damage": avg_damage
    }

    render json: data, status: 200
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

  def pagination_meta(object)
    {
      total_pages: object.total_pages
    }
  end
end
