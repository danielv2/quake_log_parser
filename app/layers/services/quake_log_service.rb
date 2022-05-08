module Services
  class QuakeLogService < Domain::Interfaces::Services::IQuakeLogService
    include AutoInject[game_repository: 'repositories.game']
    include AutoInject[player_repository: 'repositories.player']
    include AutoInject[game_player_repository: 'repositories.game.player']
    include AutoInject[death_cause_repository: 'repositories.deathcause']
    include AutoInject[death_cause_game_repository: 'repositories.deathcause.game']

    def api_get_load_quake_log_data
      content = HTTParty.get(ENV['QUAKE_LOG_URL']).parsed_response
      parse_quake_log_data!(content)
    end

    private

    def parse_quake_log_data!(content)
      @games = []
      content.each_line do |line|
        if init_game?(line)
          name = "game_" + (@games.length + 1).to_s
          game = Domain::Entities::Game.new(name: name)
          game_repository.save(game)
          @games << game
				  next
        end

        if has_user?(line)
          user_name = get_user(line)
          player = player_repository.find_by_name(user_name)
          player = player_repository.save(Domain::Entities::Player.new(name: user_name)) if player.nil?
          game_player = @games.last.games_players.select { |game_player| game_player.player_id == player.id }
          @games.last.games_players << game_player_repository.save(Domain::Entities::GamesPlayer.new(game_id: @games.last.id, player_id: player.id)) if game_player.empty?
				  next
        end

        if has_kill?(line)
          killer = get_killer(line) 
          prey = get_prey(line)
          cause = death_cause(line)

          @games.last.increment_total_kills
          game_cause_kills(@games.last.id, cause)

          if killer != "<world>"
            game_player_kills(@games.last.id, killer, :add_kill)
          else
            game_player_kills(@games.last.id, prey, :remove_kill)
          end

          game_repository.save(@games.last)
        end
      end
    end

    private

    def init_game?(line)
			line.match(/(?:^|\W)InitGame(?:$|\W)/) ? true : false
		end

    def has_user?(line)
			line.match(/(?:^|\W)ClientUserinfoChanged(?:$|\W)/) ? true : false
		end

    def has_kill?(line)
			line.match(/(?:^|\W)Kill(?:$|\W)/) ? true : false
		end

    def get_user(line)
			line.match(/((?<=n\\).*?(?=\\t))/)[0]
		end

    def get_killer(line)
			line.match(/([^:]+).(?=\skilled)/)[0].strip
		end

		def get_prey(line)
			line.match(/((?<=killed\s).*(?=\sby))/)[0]
		end

		def death_cause(line)
			line.match(/((?<=by\s).*)/)[0]
		end

    def game_player_kills(game_id, user_name, action)
      player = player_repository.find_by_name(user_name)
      game_player = game_player_repository.find_by_game_player(game_id, player.id)
      game_player.send(action)
      game_player_repository.save(game_player)
    end

    def game_cause_kills(game_id, cause)
      death_cause = death_cause_repository.find_by_name(cause)
      death_cause_game = death_cause_game_repository.find_by_death_cause_game(game_id, death_cause.id)
      
      if death_cause_game.nil?
        death_cause_game_repository.save(Domain::Entities::DeathCausesGame.new(game_id: game_id, death_cause_id: death_cause.id, quantity: 1))
        return
      end

      death_cause_game.add_quantity
      death_cause_game_repository.save(death_cause_game)
    end
  end
end
