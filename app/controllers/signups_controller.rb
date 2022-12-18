class SignupsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_signup_unsuccessful_response
#GET /signups
    def index
        signups = Signup.all
        render json: signups
    end
    #   POST /signups
        def create
        signup = Signup.create!(signup_params)
        render json: signup.activity, status: :created
        end 
    
        private
        def signup_params
            params.permit(:camper_id, :activity_id, :time)
        end

        def render_signup_unsuccessful_response (error_messages)
            render json: { errors: error_messages.record.errors.full_messages}, status: :unprocessable_entity
        end
    end