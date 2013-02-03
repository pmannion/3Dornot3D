require 'digest'

class User < ActiveRecord::Base
  attr_accessible :email, :hashed_password, :password, :credit_available
  attr_accessor :password
  before_save :encrypt_password

  has_many :products
  has_many :credits
  has_many :orders
  has_many :trades

  validates :email,
            :uniqueness => true,
            :length => {:within => 5..50},
            :format => {:with => /^[^@][\w.-]+@[\w.-]+[.][a-z]{2,4}$/i}

  validates :password,
            :confirmation => true,
            :length => {:within => 4..20},
            :presence => true

  def add_credit_total_from_credit(credit)
    credit.credit_total.each do |request|
      request.user_id = nil
       credit_total << request
      end
    end


  def self.authenticate(email, password)
    user = find_by_email(email)
    return user if user && user.authenticated?(password)
  end

  def authenticated?(password)
    self.hashed_password == encrypt(password + "ruby_rocks" + self.salt)
  end

  protected
  def encrypt_password
    return if password.blank?
    salt = generate_salt
    self.hashed_password = encrypt(password + "ruby_rocks" + self.salt)
  end

  def encrypt(string)
    Digest::SHA1.hexdigest(string)
  end

  def generate_salt
    chars = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
    salt = ""
    1.upto(10) { |i| salt << chars[rand(chars.size-1)] }
    self.salt = salt
  end


end
