# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit::Authorization

  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :set_active_storage_url_options

  protect_from_forgery prepend: true

  skip_before_action :verify_authenticity_token

  respond_to :json, :html

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name role])
  end

  private

  def user_not_authorized(exception)
    policy_name = exception.policy.class.to_s.underscore

    flash[:alert] = t("#{policy_name}.#{exception.query}", scope: 'pundit', default: :default)

    return redirect_back(fallback_location: root_path) if request.format.html?

    render(json: { error: I18n.t('json.error.user_not_authorized') }, status: :forbidden)
  end

  def set_active_storage_url_options
    ActiveStorage::Current.url_options = { host: request.host, protocol: request.protocol, port: request.port }
  end
end
