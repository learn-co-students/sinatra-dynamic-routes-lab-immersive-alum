require_relative 'config/environment'

class App < Sinatra::Base

	get "/reversename/:name" do 
		@reversed_name = params[:name].reverse!
		@reversed_name
	end

	get "/square/:number" do 
		number = params[:number].to_i
		@square = number * number
		erb :square
	end

	get "/say/:number/:phrase" do 
		@repeats = params[:number].to_i
		@phrase = params[:phrase]
		erb :repeat
	end

	get "/say/:word1/:word2/:word3/:word4/:word5" do
		"#{params[:word1]} #{params[:word2]} #{params[:word3]} #{params[:word4]} #{params[:word5]}."
	end

	get "/:operation/:number1/:number2" do
		first = params[:number1].to_i
		second = params[:number2].to_i
		operation = params[:operation]
		case operation
			when "add"
				@answer = first + second
			when "subtract"
				@answer = first - second
			when "multiply"
				@answer = first * second
			when "divide"
				@answer = first / second
		end
		erb :operation
	end
end

# rspec ./spec/sinatra_dynamic_routes_lab_spec.rb:45 # App GET /say/:number/:phrase sends a 200 status code
# rspec ./spec/sinatra_dynamic_routes_lab_spec.rb:51 # App GET /say/:number/:phrase repeats the phrase n times
# rspec ./spec/sinatra_dynamic_routes_lab_spec.rb:57 # App GET /say/:number/:phrase isn't hard-coded
# rspec ./spec/sinatra_dynamic_routes_lab_spec.rb:66 # App GET /say/:word1/:word2/:word3/:word4/:word5 sends a 200 status code
# rspec ./spec/sinatra_dynamic_routes_lab_spec.rb:72 # App GET /say/:word1/:word2/:word3/:word4/:word5 concatenates the words and adds a period
# rspec ./spec/sinatra_dynamic_routes_lab_spec.rb:78 # App GET /say/:word1/:word2/:word3/:word4/:word5 isn't hard-coded
# rspec ./spec/sinatra_dynamic_routes_lab_spec.rb:87 # App GET /:operation/:number1/:number2 adds two numbers together
# rspec ./spec/sinatra_dynamic_routes_lab_spec.rb:94 # App GET /:operation/:number1/:number2 subtracts the second number from the first
# rspec ./spec/sinatra_dynamic_routes_lab_spec.rb:101 # App GET /:operation/:number1/:number2 multiplies two numbers together
# rspec ./spec/sinatra_dynamic_routes_lab_spec.rb:108 # App GET /:operation/:number1/:number2 divides the first number by the second number

