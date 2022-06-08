class ApplicationController < ActionController::API

  rescue_from ActiveRecord::RecordNotFound, with: :not_found_res

  private

  def not_found_res invalid

    #type = self.class.to_s.gsub('Controller', '')

    #render json: { errors: "#{type} not found" }, status: :not_found
    
    render json: { errors: "#{invalid.model} not found" }, status: :not_found

  end

end
