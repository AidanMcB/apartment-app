class ApplicationController < Sinatra::Base
  set :views, "app/views"


get '/apartment/new' do
  erb(:new_apartment)
end

post '/apartments' do 
  @new_apartment = Apartment.create({address: params[:address]})
  redirect '/apartments'
end 

get '/apartments' do    
  @all_apartments = Apartment.all
  erb(:apartment_list)
end  

get '/tenant/new' do
  erb(:new_tenant)
end

post '/tenants' do 
  @new_tenant = Tenant.create({name: params[:name]})
  redirect '/tenants'
end

get '/tenants' do 
  @all_tenants = Tenant.all
  erb(:tenant_list)
end

get '/tenants/:id/edit' do 
  @tenant = Tenant.find_by(id: params[:id])
  @all_apartments = Apartment.all
  erb(:tenants_edit_page)
end

end

