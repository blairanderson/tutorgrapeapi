class SubjectUser < ActiveRecord::Base
  attr_accessible :level, :subject_id, :user_id

  belongs_to :subject
  belongs_to :user

  def level_legend(input)
    {
      1 => 'Elementary School',
      2 => 'Middle School',
      3 => 'High School',
      4 => 'College',
      5 => 'Continuing Education'
    }[input]
  end
end
