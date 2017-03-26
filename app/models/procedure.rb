class Procedure < ApplicationRecord
  include AASM
  belongs_to :user
  validates :user_id, presence: true

  has_many :workflows, dependent: :destroy
  has_many :steps, through: :workflows
  has_many :documents , dependent: :destroy
  accepts_nested_attributes_for :documents, :allow_destroy => true, :reject_if => :all_blank

  aasm column: 'state' do
    state :in_draft, :initial => true
    state :in_progress, :approved , :completed, :closed

    event :start do
      transitions :from => :in_draft, :to => :in_progress
    end

    event :approve do
      transitions :from => :in_progress, :to => :approved
    end

    event :complete do
      transitions :from => :approved, :to => :completed
    end

    event :close do
      transitions :from => :completed, :to => :closed
    end

  end

  def requirements_approved?
    puts name
    puts code
    true
  end
  
end