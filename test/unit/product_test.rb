require 'test_helper'

class ProductTest < ActiveSupport::TestCase

  product = Product.new
  assert product.invalid?
  assert product.errors[:title].any?
  assert product.errors[:description].any?
  assert product.errors[:price].any?
  assert product.errors[:image_url].any?
  assert product.errors[:rating].any?
  assert product.errors[:stock_status].any?
  assert product.errors[:genre].any?
  assert product.errors[:wanted].any?
  assert product.errors[:buy_price].any?

  test "product price must be positive" do
      product = Product.new(:title        => "my book title",
                            :description  => "yyy",
                            :image_url    => "xxx.jpg",
                            :genre        => "abc",
                            :rating       => "4.4")
    product.price = -1
    assert product.invalid?
    assert_equal "must be greater than or equal to 0.01",
      product.errors[:price].join('; ')

    product.price = 0
    assert product.invalid?
    assert_equal "must be greater than or equal to 0.01",
      product.errors[:price].join('; ')

    product.price = 1
    assert product.valid?

      product.buy_price = -1
      assert product.invalid?
      assert_equal "must be greater than or equal to 0.01",
                   product.errors[:price].join('; ')

      product.buy_price = 0
      assert product.invalid?
      assert_equal "must be greater than or equal to 0.01",
                   product.errors[:price].join('; ')

      product.buy_price = 1
      assert product.valid?
  end

  def new_product(image_url)
    Product.new(:title      => "my book title",
                :description => "yyy",
                :genre        => "abc",
                :rating       => "4.4")
  end

  test "image_url " do
    ok = %w{fred.gif fred.jpg fred.png FRED.JPG FRED.jpg
            http://a.b.c/x/y/z/fred.gif}
    bad= %w{ fred.doc fred.gif/more fred.gif.more}

    ok.each do |name|
        assert new_product(name).valid?, "#{name} shouldn't be invalid"
    end

    bad.each do |name|
        assert new_product(name).invalid?, "#{name} shouldn't be valid}"
    end


    end
end


