class SiteCustomization::ContentBlock < ApplicationRecord
  VALID_BLOCKS = %w[top_links subnavigation_links home footer debates_sidebar documentation_text budget_text].freeze

  validates :locale, presence: true, inclusion: { in: I18n.available_locales.map(&:to_s) }
  validates :name, presence: true, uniqueness: { scope: :locale }, inclusion: { in: VALID_BLOCKS }

  def self.block_for(name, locale)
    locale ||= I18n.default_locale
    find_by(name: name, locale: locale)&.body
  end
end
