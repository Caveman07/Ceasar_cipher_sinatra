require 'sinatra'
require 'sinatra/reloader' if development?


get '/' do
  erb :index
end

post '/' do
	original = params[:text]
	@message = caesar_cipher(params[:text],params[:key])
	erb :index, :locals => {'orig' => original}
end


def caesar_cipher(string,number)
	alphabet = ('a'..'z').to_a
	newstring = ""

	string.downcase().each_char do |i|
	        if !alphabet.include?(i)
	            newstring += i
	        else
	            newstring += alphabet[alphabet.index(i.downcase) - number.to_i] 
	        end
	    end
	    newstring.downcase.capitalize
end