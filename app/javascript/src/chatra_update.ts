declare var chaport: any;

class ChatraUpdate {
  constructor() {
  }

  updateChatra(): void {
    if (typeof chaport !== 'undefined') {
      chaport.q('startSession');
    }
  }
}

window["ChatraUpdate"] = new ChatraUpdate();
