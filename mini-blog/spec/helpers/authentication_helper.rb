module AuthenticationHelper
  def login(current_user)
    post api_user_session_path, params: { email: current_user.email, password: 'password' }.to_json,
                                headers: { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
  end

  def get_auth_params_from_login_response_headers(response)
    client = response.headers['client']
    token = response.headers['access-token']
    expiry = response.headers['expiry']
    token_type = response.headers['token-type']
    uid = response.headers['uid']

    {
      'access-token' => token,
      'client' => client,
      'uid' => uid,
      'expiry' => expiry,
      'token-type' => token_type
    }
  end

  def vary_authentication_age(token_age)
    login
    auth_params = get_auth_params_from_login_response_headers(response)
    new_client = FactoryBot.create(:client)
    get api_find_client_by_name_path(new_client.name), headers: auth_params
    expect(response).to have_http_status(:success)

    allow(Time).to receive(:now).and_return(Time.now + token_age)

    get api_find_client_by_name_path(new_client.name), headers: auth_params
    response
  end
end
