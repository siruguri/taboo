import * as $ from 'jquery'
import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "player" ]

  submit() {
    console.log('calling ajax')

    let id = this.data.get('id')
    $.ajax(`/games/${id}/rotate`, {
      success: (d, s, x) => {
        console.log(d.name)
        $(this.playerTarget).html(d.name)
        $('.current-player-screen').hide()
        $('.other-player-screen').show()        
      }
    })
  }
}
