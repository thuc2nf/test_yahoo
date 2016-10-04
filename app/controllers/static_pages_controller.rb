class StaticPagesController < ApplicationController
    require 'net/http'
    require 'net/https'
  def access_service
    # uri = URI.parse("https://localhost:3000/v1/yahoo/services/1")
    # uri = URI.parse("https://localhost:3000/1/1/1/sen/1")
    # http = Net::HTTP.new(uri.host, uri.port)
    # http.use_ssl = false
    # http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    # # request = Net::HTTP::Post.new(uri.request_uri)
    # request = Net::HTTP::Get.new(uri.request_uri)
    # request['X-Secret'] = '12341234'
    # respond_data = http.request(request).body
    # render json: respond_data
    # redirect_to root_path
  end

  def update_service_user
    uri = URI.parse("https://localhost:3000/v1/yahoo/services/1/update_service_user")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = false
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Put.new(uri.request_uri)
    request['X-Secret'] = '12341234'
    request.set_form_data({"access_token" => "y123345rwer", "refresh_token" => "123213qweqweasdasd", "id_token" => "123123qweqweqw"})
    respond_data = http.request(request).body
    render json: respond_data
  end

  def receive
    byebug
  end

  def callback
    uri = URI.parse("https://auth.login.yahoo.co.jp/yconnect/v1/token")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Post.new(uri.request_uri)
    application_id = "dj0zaiZpPVFyS1dFcWFKVlo3byZzPWNvbnN1bWVyc2VjcmV0Jng9ODY-"
    application_secret = "1fec0279942fd60b7e86ced38020e3778e383e0c"

    authorization = "Basic " + Base64.strict_encode64("#{application_id}:#{application_secret}")
    request['Content-Type'] = 'application/x-www-form-urlencoded'
    request['authorization'] = authorization

    request.set_form_data({grant_type: "authorization_code", code: params[:code], redirect_uri: "http://localhost:9000/callback/"})
    respond_data = http.request(request)
    render json: respond_data.body
    # redirect_to :back
  end
end
