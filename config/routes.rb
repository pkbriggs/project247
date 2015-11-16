Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'static#index'

  # Matches and Match Detail routes
  get 'matches' => 'static#matches'
  get 'match_detail' => 'static#match_detail'

  # Quiz routes
  get 'quiz1_business_name' => 'static#quiz1_business_name'
  post 'quiz1_business_name' => 'static#quiz1_business_name'

  get 'quiz1_name_matches' => 'static#quiz1_name_matches'
  post 'quiz1_name_matches' => 'static#quiz1_name_matches'

  get 'quiz1_verify_details' => 'static#quiz1_verify_details'
  post 'quiz1_verify_details' => 'static#quiz1_verify_details'

  get 'quiz2' => 'static#quiz2'
  get 'quiz3' => 'static#quiz3'
end
