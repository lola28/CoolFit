class ErrorsController < ApplicationController

  skip_before_action :authenticate_user!, only: [:not_found,:unacceptable,:internal_error]

   def not_found
     respond_to do |format|
       format.html { render status: 404 }
       format.json { render json: { error: "Resource not found" }, status: 404 }
     end
     skip_authorization
   end

   def unacceptable
     respond_to do |format|
       format.html { render status: 422 }
       format.json { render json: { error: "Params unacceptable" }, status: 422 }
     end
     skip_authorization
   end

   def internal_error
     respond_to do |format|
       format.html { render status: 500 }
       format.json { render json: { error: "Internal server error" }, status: 500 }
     end
     skip_authorization
   end
end
