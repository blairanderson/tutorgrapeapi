class Subject < ActiveRecord::Base
  attr_accessible :description, :sub_topic, :topic

  has_many :subject_users
  has_many :users, :through => :subject_users

  def self.topics
    all.group_by { |subject| subject.topic }.reduce({}) do |hash, (k, v)|
      hash.merge k => v.map(&:sub_topic)
    end
  end

  def level
    level = subject_users.first.level
    {
      1 => 'Elementary School',
      2 => 'Middle School',
      3 => 'High School',
      4 => 'College',
      5 => 'Continuing Education'
    }[level]
  end

  def self.level_legend
    {
    'Elementary School' => 1,
    'Middle School' => 2,
    'High School' => 3,
    'College' => 4,
    'Continuing Education' => 5
    }
  end
end
