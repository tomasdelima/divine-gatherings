class UsersController < ApplicationController
  def import_facebook_friends
    @user = find_or_build_user(request.env['omnicontacts.user'])
    if @user.save
      @friends = []
      request.env['omnicontacts.contacts'].each do |friend_params|
        friend = find_or_build_user(friend_params)
        if friend.save
          Friendship.find_or_create_by(user: @user, friend: friend)
          Friendship.find_or_create_by(user: friend, friend: @user)
          @friends << friend
        end
      end
      render json: {message: 'User saved successfully', user: @user, friends: @friends}
    end
  end

  private

  def find_or_build_user(user_params)
    parsed_user_params = parse_user_params(user_params)
    User.find_by(facebook_id: parsed_user_params[:facebook_id]) || User.new(parsed_user_params)
  end

  def parse_user_params(user_params)
    {
      name:            user_params[:name],
      first_name:      user_params[:first_name],
      last_name:       user_params[:last_name],
      email:           user_params[:email],
      gender:          user_params[:gender],
      facebook_id:     user_params[:id],
      profile_picture: user_params[:profile_picture]
    }
  end
end
