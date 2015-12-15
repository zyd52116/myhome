module SessionsHelper

	def sign_in(user)     #用户登录方法
	#新建一个记忆权标
		remember_token = User.new_remember_token         
	#将权标放入浏览器cookie中
		cookies.permanent[:remember_token] = remember_token 
	#将权标加密后放入数据库
		user.update_attribute(:remember_token, User.encrypt(remember_token))

		self.current_user = user
	end
	 
	def current_user=(user)             #把登录用户赋给@current_user
		@current_user = user
	end
	
	def current_user                    #返回当前登录的用户
		remember_token = User.encrypt(cookies[:remember_token])
		@current_user ||= User.find_by(remember_token: remember_token)
	end
	
	def signed_in?                      #判断当前用户是否登录
		!current_user.nil?
	end
	
	def sign_out
		self.current_user = nil
		cookies.delete(:remember_token)
	end
	
end
