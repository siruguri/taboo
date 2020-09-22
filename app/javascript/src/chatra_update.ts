declare var Chatra: any;

class ChatraUpdate {
  constructor() {
  }

  updateChatra(): void {
    if (typeof Chatra === 'function') {
      Chatra('restart');
    }
  }
}

window["ChatraUpdate"] = new ChatraUpdate();
