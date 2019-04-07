class Note < ApplicationRecord
  has_many :viewers
  has_many :readers, through: :viewers, source: :user
  belongs_to :user

  def visible_to
    rawReaders = self.readers
    visMap = rawReaders.map { |reader| reader.name}
    visTo = visMap.join(', ')
    return visTo
  end
  def visible_to=(dudes)
    self.readers = dudes.split(',').map do |dude|
      User.find_by(name: dude.strip)
    end
  end
end
