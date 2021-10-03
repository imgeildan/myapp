class Customer < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true

  def self.to_csv
    attributes = %w{external_id email name}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.find_each do |customer|
        csv << attributes.map{ |attr| customer.send(attr) }
      end
    end
  end
end