def word_contains_two_p(sentence)
    # TODO: return the first word in `sentence` containing two 'p's
    regexp = /\b\w*p\w*p\w*/
    sentence.match(regexp)[0]
  end
  
  def word_before_exclamation_mark(sentence)
    # TODO: return the first word located before an exclamation mark
    # Hint: you may want to use `()` groups!
    regexp = /(\b\w*)!/
    sentence.match(regexp)[1]
  end
  
  def four_letter_word(sentence)
    # TODO: return the first four-letter word starting with 'b', followed with a comma `,`
    regex = /(\bb\w*),/
    sentence.match(regex)[1]
  end
  
  def last_five_letters(sentence)
    # TODO: return the last five letters of the sentence
    regex = /([a-zA-Z]{5})$/
    sentence.match(regex)[1]
  end
  
  def word_contains_ll(sentence)
    # TODO: return the first word containing two consecutive 'l'
    regex = /\b\w*ll\w*/
    sentence.match(regex)[0]
  end
  
  def six_letter_word(sentence)
    # TODO: return the first six-letter word, composed of letters from 'a' to 'r'
    regex = /\b[a-rA_R]{6}/
    sentence.match(regex)[0]
  end
  
  def all_capital_letters(sentence)
    # TODO: return all the capital letters as a string
    # Hint: use `scan` to get all the occurences then `join` them
    regex = /[A-Z]/
    sentence.scan(regex).join
  end
  

def valid?(email)
    # TODO: return true if the email is valid, false otherwise
    email.match?(/\w+@[a-z]+\.[a-z]+/i)
  end
  
  def clean_database(emails)
    # TODO: return an array with the valid emails only
    emails.select { |mail| valid?(mail) }
  end
  
  def group_by_tld(emails)
    # TODO: return a Hash with emails grouped by TLD
    emails.group_by { |mail| mail.split('.').last }
  end
  
  def compose_mail(email)
    # TODO: return a Hash with username, domain and tld extracted from email
    # match?
    match_data = email.match(/(?<username>\w+)@(?<domain>[a-z]+)\.(?<tld>[a-z]+)/i)
    {
      username: match_data[1],
      domain: match_data[2],
      tld: match_data[3]
    }
  end
  
  LOCALES = {
    en: {
      subject: "Our website is online",
      body: "Come and visit us!",
      closing: "See you soon",
      signature: "The Team"
    },
    fr: {
      subject: "Notre site est en ligne",
      body: "Venez nous rendre visite !",
      closing: "A bientot",
      signature: "L'équipe"
    },
    de: {
      subject: "Unsere Website ist jetzt online",
      body: "Komm und besuche uns!",
      closing: "Bis bald",
      signature: "Das Team"
    }
  }
  
  def compose_translated_email(email)
    mail_hash = compose_mail(email)
    if mail_hash[:tld] == "fr" || mail_hash[:tld] == "de"
      mail_hash.merge(LOCALES[mail_hash[:tld].to_sym])
    else
      mail_hash.merge(LOCALES[:en])
    end
  end
  