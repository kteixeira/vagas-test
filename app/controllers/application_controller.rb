class ApplicationController < ActionController::API
    def render_unprocessable_entity_response(errors)
        render json: {status: 'error', errors: errors}, status: :unprocessable_entity
    end

    rescue_from ActiveRecord::RecordNotFound do
        render json: {status: 'error', errors: { response: "Ops! Este estado não existe!." }}, status: :not_found
    end
end
