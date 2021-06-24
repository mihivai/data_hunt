class Result < ApplicationRecord
  WEBSITE = "havior-company.herokuapp.com"
  EMPLOYEE_EMAIL = "@havior.co"
  DB_URL = "https://docs.google.com/spreadsheets/d/e/2PACX-1vQw8FKimNKpoWzaoyowE9yVYf2_RRf5A5oTVJQNIFuNDzsVsv01yuEVY-_LTUwYeSZ6UWfHYzctxzeV/pubhtml?widget=true&amp;headers=false"
  NEWS_ITEM_URL = "http://bit.ly/data-hunt-old-paper"
  CITIES = ["coventry", "bath", "dartford"]
  GOOGLE_IMAGE_TITLE = "bounty"
  NOTION_URL = "http://bit.ly/data-hunt-mutinerie"
  FRIENDS = [
    "Richard Skinner".parameterize,
    "John Millward".parameterize,
    "Robert Lamb".parameterize,
    "William Muspratt".parameterize,
    "Thomas Hall".parameterize
  ]
  # "Thomas Hall" => 77,
  # "Robert Lamb" => 14,
  # "William Muspratt" => 50,
  # "John Millward" => 6,
  # "Richard Skinner" => 1
  LOCATION = "tortue"
  validate :website_validation
  validate :employee_email_validation
  validate :news_item_url_validation
  validate :google_image_title_validation
  validate :notion_url_validation
  validate :friends_validation
  validate :location_validation

  def valid_for?(attrs)
    self.valid?
    validation = true
    attrs.each do |attr|
      validation &= self.errors[attr].blank?
    end
    validation
  end

  def website_validation
    if !website.present? || !website.include?(WEBSITE)
      errors.add(:website, "Ce n'est pas le bon site")
    end
  end

  def employee_email_validation
    employee_emails = User.all.find_all{ |u| (Date.today - u.created_at.to_date).to_i <= 1 }.map(&:employee_email)
    if !employee_email.present? || !employee_emails.include?(employee_email)
      errors.add(:employee_email, "Cet employé a un antivirus. Essayez en un autre")
    end
  end  

  def news_item_url_validation
    if !news_item_url.present? || news_item_url != NEWS_ITEM_URL
      errors.add(:news_item_url, "Ce n'est pas la bonne url")
    end
  end

  def google_image_title_validation
    if !google_image_title.present? || !google_image_title.parameterize.include?(GOOGLE_IMAGE_TITLE)
      errors.add(:google_image_title, "Ce n'est pas le bon titre")
    end
  end

  def notion_url_validation
    if !notion_url.present? || notion_url != NOTION_URL
      errors.add(:notion_url, "Ce n'est pas la bonne url")
    end
  end

  def friends_validation
    friends = [friend1&.parameterize, friend2&.parameterize, friend3&.parameterize, friend4&.parameterize, friend5&.parameterize]
    if friends != FRIENDS
      errors.add(:friend1, "L'ordre est invalide")
      errors.add(:friend2, "L'ordre est invalide")
      errors.add(:friend3, "L'ordre est invalide")
      errors.add(:friend4, "L'ordre est invalide")
      errors.add(:friend5, "L'ordre est invalide")
    end
  end

  def location_validation
    if !location.present? || !location.parameterize.include?(LOCATION)
      errors.add(:location, "Ce n'est pas le bon animal")
    end
  end

  def cities_validation
    cities = [city1&.downcase, city2&.downcase, city3&.downcase]
    if (cities.compact & CITIES).size != 3
      errors.add(:city1, "une de ces villes est invalide")
      errors.add(:city2, "une de ces villes est invalide")
      errors.add(:city3, "une de ces villes est invalide")
    end
  end

end
