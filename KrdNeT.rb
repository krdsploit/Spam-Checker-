require 'colorize'
require 'geoip'
require 'spamcheck'
require 'spam_email'


banner = '''




▒█▀▀▀█ ▒█▀▀█ ░█▀▀█ ▒█▀▄▀█ ░░ ▒█▀▀█ █░░█ █▀▀ █▀▀ █░█ 
░▀▀▀▄▄ ▒█▄▄█ ▒█▄▄█ ▒█▒█▒█ ▀▀ ▒█░░░ █▀▀█ █▀▀ █░░ █▀▄ 
▒█▄▄▄█ ▒█░░░ ▒█░▒█ ▒█░░▒█ ░░ ▒█▄▄█ ▀░░▀ ▀▀▀ ▀▀▀ ▀░▀

    #=> All right reserved for krd-pentester and krd-sploit



        '''''




puts banner.yellow


Spamcheck.settings = { spam_score: 40, disabled_rules: ['stopforumspam', 'dnsblacklist', 'country'] }

user = {
    'ip' => '{ip address}',
    'email' => '{email address}',
    'created_at' => '{timestamp}',
    'username' => '{username}',

}

context = {

    'title' => '{title}',
    'content' => '{message}',
    'previous_created_at' => '{timestamp}',
    'message_count' => '{number}',

}

Spamcheck.check(user,context)


class User < ActiveRecord::Base
    validates :email, presence: true, spam_email: true
end

validates :email, presence: true, spam_email:  { message: "is a blacklisted provider!" }

SpamEmail.blacklisted?(email)