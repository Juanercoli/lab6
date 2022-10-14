module TweetHelper
    def es_tuitero_destacado(monster)
        if (Tweet.where(monster_id: monster.id).count > 1)
            "Tuitero Destacado"
        end
    end
    
    def print_tweet(monster, tweet)
        render "tweets/tweet", monster: monster, tweet: tweet
    end
end