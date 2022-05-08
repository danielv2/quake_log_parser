Trestle.resource(:games, model: Domain::Entities::Game) do
  remove_action :new, :create, :destroy, :edit, :update

  menu do
    item :games, icon: "fa fa-gamepad" 
  end

  form do |game|
    row do
      col { static_field :name }
      col { static_field :total_kills }
    end

    row do
      col { static_field :updated_at }
      col { static_field :created_at }
    end

    table game.games_players do
      column :player do |games_player|
        games_player.player.name
      end
      column :kills
    end

    table game.death_causes_games do
      column :death_cause do |death_cause_game|
        death_cause_game.death_cause.name
      end
      column :quantity
    end
  end
end
