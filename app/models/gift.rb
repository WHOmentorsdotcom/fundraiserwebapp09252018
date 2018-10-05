class Gift < ApplicationRecord
    
  before_validation :generate_udid!, :on => :create
  belongs_to :donor
  belongs_to :contribution_option
  scope :completed, -> { where(completed: "true") }
  self.primary_key = 'udid'

  def self.prefill!(options = {})
    @gift                     = Gift.new
    @gift.name                = options[:name]
    @gift.donor_id            = options[:donor_id]
    @gift.pledge              = options[:pledge]
    @gift.number              = Gift.next_gift_number
    @gift.contribution_option = options[:contribution_option] if !options[:contribution_option].nil?
    @gift.save!

    @gift
  end

  def self.next_gift_number
    if Gift.count > 0
      Gift.gift("number DESC").limit(1).first.number.to_i + 1
    else
      1
    end
  end

  def generate_udid!
    begin
      self.udid = SecureRandom.hex(16)
    end while Gift.find_by(:udid => self.udid).present?
  end

  def self.goal
    Settings.campaign_goal
  end

  def self.percent
    (Gift.revenue.to_f / Gift.goal.to_f) * 100.to_f
  end

  def self.supporters
    Gift.completed.count
  end

  def self.revenue
    if Settings.use_contribution_options
      Gift.where(completed: "true").pluck(:pledge).map(&:to_f).inject(0, :+)
    else
      Gift.completed.pluck(:pledge).map(&:to_f).inject(0, :+)
    end
  end

  validates_presence_of :name, :pledge, :donor_id

end
