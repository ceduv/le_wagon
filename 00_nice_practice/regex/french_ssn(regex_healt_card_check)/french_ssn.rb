require 'date'
require 'yaml'

PATTERN = /^(?<gender>1|2)\s?(?<year>\d{2})\s?(?<month>1[0-2]|0[1-9])\s?(?<department>\d{2})\s?(\s?\d{3}){2}\s?(?<key>\d{2})$/

def french_ssn(ssn)
  return 'Invalid number' if ssn == ''

  data = ssn.match(PATTERN)

  if valid_key?(ssn, data[:key])
    gender = data[:gender] == "1" ? 'man' : 'woman'
    month = Date::MONTHNAMES[data[:month].to_i] 
    department = YAML.load_file('data/french_departments.yml')[data[:department]]

    return "a #{gender}, born in #{month}, 19#{data[:year]} in #{department}."
  else
    return "Invalid number"
  end
end

def valid_key?(ssn, key)
  result = (97 - ssn.gsub(' ', '')[0..12].to_i) % 97 == key.to_i
end

# puts french_ssn("292039408125811")