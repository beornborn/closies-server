class Settings < Settingslogic
  source "#{Rails.root}/config/app/settings.yml"
  namespace Rails.env
end
