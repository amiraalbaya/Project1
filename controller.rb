require 'sinatra'
require_relative './database.rb'
get '/students/new' do
	erb :application do
		erb :new
	end
end
post '/students' do 
	db = DBHandler.new
	@students = db.create(params[:andrewid],params[:firstname],params[:lastname],params[:major],params[:email],params[:graduate] )
	redirect to '/students'
end
get '/' do
	redirect to '/students'
end
get '/students' do
	db = DBHandler.new
	@students  = db.all
	@graduated= db.allgrads
	@nonalumni=db.nongrads
	erb :application do
		erb :index
	end
end
get '/students/:id' do
	id = params[:id].to_i
	db = DBHandler.new
	@students = db.get(id)
	@graduated= db.get(id)
	@nonalumni=db.get(id)
	erb :application do
		erb :show
	end
end
get '/students/:id/edit' do
	id = params[:id].to_i
	db = DBHandler.new
	@students = db.get(id)
	@graduated= db.get(id)
	@nonalumni=db.get(id)
	erb :application do
		erb :edit
	end
end
post '/students/:id' do
	id = params[:id].to_i
	db = DBHandler.new
	@students= db.update(id, params[:andrewid],params[:firstname],params[:lastname],params[:major],params[:email],params[:graduate] )
	@graduated= db.update(id, params[:andrewid],params[:firstname],params[:lastname],params[:major],params[:email],params[:graduate] )
	@nonalumni= db.update(id, params[:andrewid],params[:firstname],params[:lastname],params[:major],params[:email],params[:graduate] )
	redirect to '/students'
end
get '/students/:id/delete' do
	id = params[:id].to_i
	db = DBHandler.new
	@students=db.destroy(id)
	@graduated=db.destroy(id)
	@nonalumni=db.destroy(id)
	redirect to '/students'
end