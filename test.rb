require 'http'

response = HTTP.get("https://data.cityofchicago.org/resource/xzkq-xp2w.json")

chi_employees = response.parse(:json)[0]