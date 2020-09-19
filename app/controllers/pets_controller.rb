class PetsController < ApplicationController

  get '/pets' do
    @pets = Pet.all
    erb :'/pets/index' 
  end

  get '/pets/new' do 
    @owners=Owner.all
    erb :'/pets/new'
  end

  post '/pets' do 
    
    @pet = Pet.create(params[:pet])
    binding.pry
    if !params["pet"]["owner"]["name"].empty?
      @owner = Owner.find_by(name: params["pet"]["owner"]["name"])
    else 
      @owner = Owner.create(:name => params["pet"]["owner"]["name"])
    end 
    @pet.owner_id = @owner.id 
    redirect to "pets/#{@pet.id}"
  end

  get '/pets/:id' do 
    @pet = Pet.find(params[:id])
    erb :'/pets/show'
  end

  patch '/pets/:id' do 

    redirect to "pets/#{@pet.id}"
  end
end