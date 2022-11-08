class ApplicationController < ActionController::API
    rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    private

    def unprocessable_entity(invalid)
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end

    def record_not_found(error)
        render json: {error: "#{error.model} not found"}, status: :not_found
    end
end
