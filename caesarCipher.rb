###############################################################################
#
# Make a method to ask the user if they want to encrypt or decrypt a word.
#
# If the user enters encrypt or e (case insensitive), return E.
# If the user enters decrypt or d (case insensitive), return D.
# If the user enters anything else, keep asking until the input is valid.
#
###############################################################################
def encrypt_or_decrypt 
    answer = ''
    puts 'Do you want to Encrypt or Decrypt?'
    answer = gets.chomp.downcase 
    while answer != 'e' and answer != 'encrypt' and answer != 'd' and answer != 'decrypt'
        puts 'Invalid input. Enter E or encrypt or D or decrypt.'
        puts 'Do you want to encrypt or decrypt?'
        answer = gets.chomp.downcase
    end 
    return answer 
end
#puts encrypt_or_decrypt

###############################################################################
#
# Make a method to get the encryption/decryption key from the user.
# The method should ask the user for a number until a valid key is entered, then
# return back the key.
#
# A valid key is a number that is greater than 0 and less than 26.
#
###############################################################################
def get_key 
    puts 'Enter an encryption key. Key must be numeric.'
    answer = gets.chomp.to_i
    while answer <= 0 or answer >= 26 
        puts 'Error, key must be greater than 0 and less than 26.'
        puts 'Enter an encryption key. Key must be numeric.'
        answer = gets.chomp.to_i
    end 
    return answer
end 


###############################################################################
#
# Make a method to get the phrase to encryption/decryption from the user.
# The method should take a parameter to know if it is encrypting or decrypting.
# The method should return back the phrase entered.
# 
###############################################################################
def get_phrase e_or_d
    phrase = ''
    if e_or_d.downcase == 'e'
        puts 'What text would you like to encrypt?'
    elsif e_or_d.downcase == 'd' 
        puts 'What text would you like to decrypt?'
    else puts 'Sorry I don\'t know what you\'re talking about!'
    end 
    phrase = gets.chomp
    return phrase
end 
#puts get_phrase 'd'

###############################################################################
#
# Make a method to generate the cipher alphabet for the encryption algorithm.
# This method should take a key as input and return back the list of letters
# in the alphabet offset by that key.
#
# (More info on the cipher alphabet in the assignment instructions.)
#
###############################################################################
def get_cipher_bet key
    alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".split('')
    cipherbet = []
    # Get the letters from the key to the end of the alphabet and add to cipherbet
    counter = key
    while counter < alphabet.length
        letter = alphabet[counter]
        cipherbet.push letter
        counter = counter + 1
    end
    
    # Get the letters we missed at the beginning of the alphabet and add to the end
    counter = 0
    while counter < key
        letter = alphabet[counter]
        cipherbet.push letter
        counter = counter + 1
    end
    return cipherbet
end 
#puts get_cipher_bet 5

###############################################################################
#
# Make a method to determine if a letter is a lowercase letter.  The method
# should take a letter as input and return true if it is lowercase, and false
# otherwise.
#
###############################################################################
def is_lowercase_letter letter 
    if letter == letter.downcase
        return true
    else return false
    end 
end 
#puts is_lowercase_letter 'N'
#puts is_lowercase_letter 'n'
###############################################################################
#
# Make a method to get the position of a letter in a list.  If the letter is
# not found, return -1.
#
###############################################################################
def letter_position letter, alphabet
    #alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".split('')
    alphabet.each_with_index do |l, position|
        if letter.upcase == l
            return position
        end 
    end 
    return -1 
end
#puts letter_position 'p'

###############################################################################
#
# Make a method to encrypt a letter.  This method should take as input:
#  - the alphabet (so we don't have to create it multiple times)
#  - the cipher alphabet
#  - the letter to encrypt
# and return back the encrypted letter.  If the letter is not found in the
# cipher alphabet, it cannot be encrypted so return the original value.
#
###############################################################################
def encrypt_letter alphabet, cipherbet, letter
    position = letter_position letter, alphabet
    if position >= 0 
        encrypted_letter = cipherbet[position]
        if is_lowercase_letter letter
            encrypted_letter = encrypted_letter.downcase
        end 
    else encrypted_letter = letter
    end 
    return encrypted_letter
end 
alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".split('')
cipherbet = "DEFGHIJKLMNOPQRSTUVWXYZABC".split('')
#puts encrypt_letter alphabet, cipherbet, 'p'
#puts encrypt_letter alphabet, cipherbet, ' '
#puts encrypt_letter alphabet, cipherbet, '.'


###############################################################################
#
# Make a method to decrypt a letter.  This method should take as input:
#  - the alphabet (so we don't have to create it multiple times)
#  - the cipher alphabet
#  - the letter to decrypt
# and return back the decrypted letter.  If the letter is not found in the
# cipher alphabet, it cannot be decrypted so return the original value.
#
###############################################################################
def decrypt_letter alphabet, cipherbet, letter
    return encrypt_letter cipherbet, alphabet, letter
end 
#puts decrypt_letter alphabet, cipherbet, 's'
#puts decrypt_letter alphabet, cipherbet, ' '
#puts decrypt_letter alphabet, cipherbet, '.'



###############################################################################
#
# Make a method to encrypt a phrase.  This method should take a phrase and a key
# and return back the encrypted phrase.
#
###############################################################################
def encrypt_phrase phrase, key
    alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".split('')
    cipherbet = get_cipher_bet key 
    result = ''
    counter = 0
    while counter < phrase.length
        letter = phrase[counter]
        encrypted_letter = encrypt_letter alphabet, cipherbet, letter
        result = result + encrypted_letter
        counter = counter + 1
    end 
    return result
end 
#puts encrypt_phrase 'Mary is a good programming teacher', 3


###############################################################################
#
# Make a method to decrypt a phrase.  This method should take a phrase and a key
# and return back the decrypted phrase.
#
###############################################################################
def decrypt_phrase phrase, key
    alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ".split('')
    cipherbet = get_cipher_bet key 
    result = ''
    counter = 0
    while counter < phrase.length
        letter = phrase[counter]
        decrypted_letter = decrypt_letter alphabet, cipherbet, letter
        result = result + decrypted_letter
        counter = counter + 1
        end 
    return result
end 
#puts decrypt_phrase 'PDUB LV D JRRG SURJUDPPLQJ WHDFKHU', 3
    

##############################################################################
#
# Write the main program script here. (More details in assignment instructions.)
#
##############################################################################

# 1. Determine if we are encrypting or decrypting.
choice = encrypt_or_decrypt

# 2. Get encrypt/decrypt key.
key = get_key

# 3. Get the phrase to encrypt/decrypt.
phrase = get_phrase choice

# 4. Display the results of the encryption/decryption.
if choice == 'e' 
    puts encrypt_phrase phrase, key
elsif choice == 'd'
    puts decrypt_phrase phrase, key
end 
    