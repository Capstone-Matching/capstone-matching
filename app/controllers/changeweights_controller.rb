class ChangeweightsController < ApplicationController
    before_action :authorize_admin, unless: -> { Rails.env.development? || Rails.env.test? }
    def index
        @score_attributes = ScoresAttribute.all
    end

    def save_weights
        feature_weights = params[:feature_weights]
        if feature_weights.nil?
            flash[:error] = "No feature weights to save."
            redirect_to changeweights_path
            return
        end
        
        total = feature_weights.values.sum(&:to_f)
      
        if total != 100
            flash[:error] = "Weights do not add up to 100%, try again."
            redirect_to changeweights_path
            return
        end

        
        feature_weights.each do |attribute_id, weight|
            parsed_weight = weight.to_f / 100.0

            score_attribute = ScoresAttribute.find_by(attribute_id: attribute_id)

            if score_attribute
                score_attribute.update(feature_weight: parsed_weight)
            else
                # Handle the case where no record with the given attribute_id is found.
                flash[:error] = "No record found for attribute_id: #{attribute_id}."
                redirect_to changeweights_path
                return
            end
        end
        flash[:success] = "Feature weights updated successfully."
        redirect_to changeweights_path
    end
end