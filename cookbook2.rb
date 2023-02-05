require 'ruby/openai'

openai = OpenAI::Client.new(access_token: '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')

ilist = "water, noodles, salt"

place = "Italy"

prompt = "Come up with a recipe title and food ingredients from '#{place}'
          that uses the following ingredients: '#{ilist}'.
        The returned recipe should be in JSON format with
        two parameters 'title' and 'recipe'"

response = openai.completions(
 parameters: {
   model: "text-davinci-003",
   prompt: prompt,
   temperature: 0.1,
   max_tokens: 500,
 }
)

jsonResponse = JSON.parse(response['choices'][0]['text'].lstrip)

puts "Title: #{jsonResponse["title"]}"
puts "Recipe: \n#{jsonResponse["recipe"].join("\n")}"
