class GenderController < ApplicationController

    def index
        @genders = Gender.all
        @response = {
            status: 200,
            message: "Genders",
            data: @genders
        }

        render json: @response
    end

    private

    def gender_params

    end
end
