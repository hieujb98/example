module ApplicationHelper
  def full_title page_title
    base_title = t(".ruby_on_rails_sample_app")
    if page_title.blank?
      base_title
    else
      page_title + " | " + base_title
    end
  end
end
