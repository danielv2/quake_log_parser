Trestle.admin(:ranking_players) do
  menu do
    item :ranking_players, icon: "fa fa-star"
  end

  controller do
    def index
      @ranking_players = Infra::QueryObjects::GamesPlayerQuery.ranking_players
    end
  end
end
