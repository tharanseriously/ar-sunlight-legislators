require_relative '../../db/config'
require 'byebug'

class Legislator < ActiveRecord::Base
	validates :title, :firstname, :lastname, :party, :state, :in_office, :gender, presence: true
	validates :in_office, numericality: {only_integer: true}
end