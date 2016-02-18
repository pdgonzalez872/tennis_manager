class DrawPositionsController < ApplicationController

  def edit
    @dp = DrawPosition.find_by(id: params[:id])
    # raise
    @player_options = Player.all
    # @player_options = Draw.fetch_player_options(@dp)
  end

  def update

    # raise
    # dp = DrawPosition.find_by(id: params[:id])

    tournament = Tournament.find_by(id: params[:tournament_id])

    draw = Draw.find_by(id: params[:draw_id])

    # match number is only good for main draw. must find another way
    # Foo.where("bar LIKE ?", "%#{query}%")


    dp = draw.draw_positions.find_by(id: params[:id])
    # match = dp.match

    # match = draw.matches.find_by(match_number: params[:id])

    ###################
    # HERE #
    ##################
    match = Draw.previous_match(draw_position: dp)

    # dp = draw.draw_positions.find_by(draw_positions_number: params[:id])

    player = Player.find_by(id: params[:draw_position][:winner])
    # player_options = params[:draw_position][:player_options]
    #
    # draw  = dp.draw
    # match = dp.match
    # previous_match = Match.find_by(match_number: params[:id])
    # previous_match.update_winner_and_loser(winner: player, player_options: player_options)
    match.update_score(params[:draw_position][:score])

    # next_match = draw.matches.find_by(match_number: dp.match.match_number.to_i)

    # raise

    # next_match = draw.matches.find_by(match_number: params[:id].to_i / 2)
    # next_match.previous_match_score = params[:draw_position][:score]
    # next_match.save


    if dp.players << player
      redirect_to tournament_draw_path(tournament_id: tournament.id,
                                                  id: draw.id)
    else
      render "edit"
    end
  end
end
