declare var chaport: any;

class ChaportUpdate {
  constructor() {
  }

  updateChaport(): void {
    if (typeof chaport !== 'undefined') {
      chaport.q('startSession');
    }
  }
}

window["ChaportUpdate"] = new ChaportUpdate();
