
// Provide minimal 'document' for Elm.fullscreen to hook into

function addDocumentObject() {
  var dummyNode = {
    appendChild: function() {}
  }

  global.document = global.document || {
    body: dummyNode,

    createElement: function() {
      return dummyNode;
    },

    createTextNode(text) {
      console.log("createTextNode: ", text);
    }
   };
 }

// elm-http uses the addEventListener method of XMLHttpRequest, which
// doesn't exist in react native.
// Let's tack it on!

function addXHREventListener() {
  if (typeof(XMLHttpRequest.prototype.addEventListener) == 'function') {
    return;
  }

  XMLHttpRequest.prototype.addEventListener = function(name, callback) {
    if (typeof(name) !== 'string') {
      console.error('XMLHttpRequest.addEventListener was expecting a string ' +
        'as the first argument, but recieved this instead: ', name);
      return;
    }
    if (typeof(callback) !== 'function') {
      console.error('XMLHttpRequest.addEventListener was expecting a function ' +
        'as the second argument, but recieved this instead: ', callback);
      return;
    }

    // console.log(`adding XHR event listener ${name}`);

    this._listeners = this._listeners || {
      loadstart: [],
      load: [],
      error: [],
      progress: [],
      timeout: []
    };

    let _name = name.toLowerCase();
    if (this._listeners[_name] !== undefined) {
      let existing = this._listeners[_name];
      this._listeners[_name] = [...existing, callback];
    }

    this.onerror = this.onerror || (e => {
      for (let listener of this._listeners.error) {
        listener(e);
      }
    });

    this.onload = this.onload || (() => {
      // not sure what's special about 1223, copy/pasted from fetch polyfill
      var status = (this.status === 1223) ? 204 : this.status;
      if (this.status < 100 || this.status > 599) {
        this.onerror(new Error(this.responseText));
        return;
      }

      for (let listener of this._listeners.load) {
        listener();
      }
    });

    const stateNames = ['UNSENT', 'OPENED', 'HEADERS_RECEIVED', 'LOADING', 'DONE'];
    this.onreadystatechange = this.onreadystatechange || (() => {
      // console.log('XHR ready state changed to: ', stateNames[this.readyState]);
      // console.log(this);

      if (this.readyState === XMLHttpRequest.OPENED) {
        for (let listener of this._listeners.loadstart) {
          listener(e);
        }
      }

      // TODO: add 'progress', 'timeout' handlers
    });
  }
}


// Apply polyfills when module is required
(function() {
  addDocumentObject();
  addXHREventListener();
})();
