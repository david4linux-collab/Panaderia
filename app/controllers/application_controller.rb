class ApplicationController < ActionController::Base
  before_action :set_locale

  allow_browser versions: :modern
  stale_when_importmap_changes

  private

  def set_locale
    I18n.locale = :es
  end
end
