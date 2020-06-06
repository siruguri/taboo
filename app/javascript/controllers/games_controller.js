import * as $ from 'jquery'
import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "player" ]

  refresh() {
    let gameid = this.data.get('gameid')
    let userid = this.data.get('userid')

    $.ajax(`/games/${gameid}/refresh/${userid}`, {
      success: (d, s, x) => {
        $(this.playerTarget).html(d.player_name)

        if(d.current_player_id == userid) {
          $('.other-player-screen').addClass('hidden')
          $('.current-player-screen').removeClass('hidden')
          $('.current-player-screen #word').text(d.current_word)
        }
      }
    })
  }

  submit() {
    let id = this.data.get('id')

    $.ajax(`/games/${id}/rotate`, {
      success: (d, s, x) => {
        $(this.playerTarget).html(d.name)
        $('.current-player-screen').addClass('hidden')
        $('.other-player-screen').removeClass('hidden')
      }
    })
  }
}
