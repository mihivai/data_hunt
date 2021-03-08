class Result < ApplicationRecord
  CITY_NUMBER = 12
  DB_URL = "https://docs.google.com/spreadsheets/d/e/2PACX-1vQw8FKimNKpoWzaoyowE9yVYf2_RRf5A5oTVJQNIFuNDzsVsv01yuEVY-_LTUwYeSZ6UWfHYzctxzeV/pubhtml?widget=true&amp;headers=false"
  NEWS_ITEM_URL = "https://tahitileblog.fr/wp-content/uploads/2018/01/La-mutinerie-de-la-Bounty.jpg"
  CITIES = ["grenoble", "bordeaux", "montpellier"]
  GOOGLE_IMAGE_TITLE = "mutinerie-de-la-bounty"
  NOTION_URL = "https://www.notion.so/Data-Hunt-2d6395ae055d4742ab76c95a05e43d0a"
  FRIENDS = ["audrey", "bob", "coco", "dede", "elo"]
  LOCATION = "tahiti"
  validate :city_number_validation
  validate :cities_validation
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

  def city_number_validation
    if !city_number.present? || city_number != CITY_NUMBER
      errors.add(:city_number, "Ce n'est pas le bon nombre")
    end
  end

  def news_item_url_validation
    if !news_item_url.present? || news_item_url != NEWS_ITEM_URL
      errors.add(:news_item_url, "Ce n'est pas la bonne url")
    end
  end

  def google_image_title_validation
    if !google_image_title.present? || google_image_title.parameterize != GOOGLE_IMAGE_TITLE
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
    if !location.present? || location.parameterize != LOCATION
      errors.add(:location, "Ce n'est pas la bonne localisation")
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
