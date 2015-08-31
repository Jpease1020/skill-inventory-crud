class SkillInventoryApp < Sinatra::Base

  get '/' do
    erb :dashboard
  end

  get '/skills' do
    @skills = SkillInventory.all
    erb :index
  end

  get '/skills/new' do
    erb :new
  end

  post '/skills' do
    SkillInventory.create(params[:skill])
    redirect '/skills'
  end

  get '/skills/:id' do |id|
    @skill = SkillInventory.find(id.to_i)
    erb :show
  end

  get '/skills/:id/edit' do |id|
    @skill = SkillInventory.find(id.to_i)
    erb :edit
  end

  put '/skills/:id' do |id|
    SkillInventory.update(id.to_i, Skill.new(params[:skill]))
    redirect "skills/#{id}"
  end

  delete '/skills/:id' do |id|
      SkillInventory.delete(id.to_i)
      redirect '/skills'
    end
end


# CRUD out the functionality for a user to be able to add a skill (id, name, status), see all skills, edit a skill,
# and delete a skill.
