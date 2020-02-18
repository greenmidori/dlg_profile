class LoginController < ApplicationController
  def login
    user = User.find_by(name: params[:name], password: params[:password])
    if user != nil
      render status: 200, json: { status: 200, message: "Success", name: user.name, email: user.email,  token: user.token }
    else
      render status: 400, json: { status: 400, message: 'This user not found' }
    end
  end
end
