RootCms::Application.routes.draw do
  resources :form_submission_fields

	get "admin/index"

	#match 'user/edit' => 'users#edit', :as => :edit_current_user

	#match 'signup' => 'users#new', :as => :signup

	#match 'logout' => 'sessions#destroy', :as => :logout

	#match 'login' => 'sessions#new', :as => :login

	#resources :comments
	match '/admin/logout' => 'admin/sessions#destroy', :as => :logout
	match '/admin/login' => 'admin/sessions#new', :as => :login
	match '/admin/register' => 'admin/users#create', :as => :register
	match '/admin/signup' => 'admin/users#new', :as => :signup
	match 'admin' => 'admin#index'
	match 'admin/files/upload' => 'admin/files#upload', :as => :upload_file, :method => 'post'
	match 'admin/files/make_folder' => 'admin/files#make_folder', :as => :make_folder, :method => 'post'
	match 'admin/files/delete_folder' => 'admin/files#delete_folder', :as => :delete_folder, :method => 'delete'
	match 'admin/files/edit' => 'admin/files#edit', :as => :edit_file
	match 'admin/files/destroy' => 'admin/files#destroy', :as => :destroy_file, :method => 'delete'
	match 'admin/files/update' => 'admin/files#update', :as => :update_file, :method => 'put'
	match 'admin/pictures/uploader' => "admin/pictures#uploader", :as => :pictures_uploader, :method => 'get'
	match 'admin/pictures/uploader_iframe' => "admin/pictures#uploader_iframe", :as => :pictures_uploader_iframe, :method => 'get'
	match 'admin/login' => 'admin#login'
	match 'albums/:id' => 'display#show_album', :as => :display_album
	
	match '/admin/uploader/albums' => 'admin/uploader#albums'
	match '/admin/uploader/album' => 'admin/uploader#album'
	match '/admin/pages/links' => 'admin/pages#links'

	namespace :display do
		resources :blogs do
			resources :posts do
				resources :comments
			end
		end

		resources :applications
		resources :jobs
		resources :enquiries
		resources :form_submissions
	end

	scope :path => :admin, :module => :admin, :name_prefix => nil do
		resources :sites

		resources :folders do
			collection do
				post :sort
			end
		end

		resources :menus do
			resources :menu_items do
				collection do
					post :sort
				end
			end
		end
			
		resources :page_templates

		resources :pages do
			match 'sort' => '#sort', :as => :sort, :method => 'post'
			match 'preview' => 'pages#preview', :as => :preview, :method => 'post'
		end

		resources :files
		resources :users
		resource :sessions
		resources :forms do
			#match 'add_field' => 'fields#create', :as => :add_field, :method => 'post'
			#match 'delete_field' => 'fields#destroy', :as => :delete_field
			#resources :text_fields
			#resources :drop_downs
			#resources :check_boxes
			#resources :radio_groups
			resources :form_submissions
		end

		resources :galleries do
			resources :albums do
				resources :pictures do
					match 'rotate' => 'pictures#rotate', :method => 'get'
				end
			end
		end

		resources :blogs do
			resources :posts do
				resources :comments do
					match 'approve' => 'comments#approve', :as => :approve, :method => 'get'
					match 'reject' => 'comments#reject', :as => :reject, :method => 'get'
				end
			end
		end
		resources :applications do
			collection do
				put :update_multiple
			end
		end

		resources :application_statuses
		resources :application_ratings
		resources :jobs
		resources :enquiries

		resources :forms do
			resources :fields do
				resources :field_options
			end
		end
	end

	match 'error/no_start_page' => 'error#no_start_page', :as => :error
	match '/:controller(/:action(/:id))'
	root :to => "display#handle_request"
	match '*path' => 'display#handle_request'

	# The priority is based upon order of creation:
	# first created -> highest priority.

	# Sample of regular route:
	#	 match 'products/:id' => 'catalog#view'
	# Keep in mind you can assign values other than :controller and :action

	# Sample of named route:
	#	 match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
	# This route can be invoked with purchase_url(:id => product.id)

	# Sample resource route (maps HTTP verbs to controller actions automatically):
	#	 resources :products

	# Sample resource route with options:
	#	 resources :products do
	#		 member do
	#			 get 'short'
	#			 post 'toggle'
	#		 end
	#
	#		 collection do
	#			 get 'sold'
	#		 end
	#	 end

	# Sample resource route with sub-resources:
	#	 resources :products do
	#		 resources :comments, :sales
	#		 resource :seller
	#	 end

	# Sample resource route with more complex sub-resources
	#	 resources :products do
	#		 resources :comments
	#		 resources :sales do
	#			 get 'recent', :on => :collection
	#		 end
	#	 end

	# Sample resource route within a namespace:
	#	 namespace :admin do
	#		 # Directs /admin/products/* to Admin::ProductsController
	#		 # (app/controllers/admin/products_controller.rb)
	#		 resources :products
	#	 end

	# You can have the root of your site routed with "root"
	# just remember to delete public/index.html.
	# root :to => "welcome#index"

	# See how all your routes lay out with "rake routes"

	# This is a legacy wild controller route that's not recommended for RESTful applications.
	# Note: This route will make all actions in every controller accessible via GET requests.
	# match ':controller(/:action(/:id(.:format)))'
end
