require 'sinatra'
require 'sinatra/reloader'
require 'erb'

#indexで今あるタスクの表示
#indexで、メニューの作成
get '/' do
    File.open("./task.txt","r") do |f|
        @list = f.read.split("\n")
    end
    @list.delete("")
    erb :index
end


post '/new_' do
    @task = params[:task]
    File.open("task.txt","a") do |f|
        f.puts("#{@task}")
    end
    erb :result
end

post '/delete_' do
    @task = params[:task]
    puts("#{@task}")
    File.open("task.txt","w") do |f|
        f.puts("#{@task}")
    end
    erb :index
end

get '/new' do
    erb :writeTask
end

get '/delete' do
    erb :deleteTask
end