require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'Users can be created' do
    assert User.count == 2
    User.create(email: 'bobby@gmail.com', password: 'password')
    assert User.count == 3
    assert User.last.email == 'bobby@gmail.com'
  end

  test 'two users cant have the same email address' do
    User.create(email: 'potato@gmail.com', password: 'password')
    new_user = User.new(email: 'potato@gmail.com', password: 'password')

    assert_not new_user.valid?
    new_user.email = 'the_better_potato@gmail.com'
    assert new_user.valid?
  end

  test 'passwords are salted' do
    user = User.create(email: 'potato@gmail.com', password: 'password')
    assert_not user.password_digest == 'password'
    assert user.try(:authenticate, 'password')
  end

  test 'users can be deleted' do
    assert User.count == 2

    User.last.delete

    assert User.count == 1
  end
end
