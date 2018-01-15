module ApplicationHelper
  def menus
    @menu ||= YAML.load(File.open("#{Rails.root}/config/menu.yml", 'r'))
  end
end
