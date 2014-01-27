/*
 * Move a popup with a drag.
 *
 * Uses Underscore and jQuery for implementation
 *
 * @class
 */
OpenLayers.Control.DragPopup = OpenLayers.Class(OpenLayers.Control, {
    down: false,
    popPnt: null,
    mapPnt: null,
    popup: null,
    elementsIgnore: ['input'],
    selectorsIgnore: [],
    moveOnSelector: null,
    docMouseUpProxy: null,
    validMoveSelector: false,
    /**
     * Constructor: OpenLayers.Control.DragPopup
     * Create a new control to drag a popup.
     *
     * Parameters:
     * @param {OpenLayers.Popup} popup
     * @param {Object} options
     */
    initialize: function(popup, options) {
        OpenLayers.Control.prototype.initialize.apply(this, [options]);
        this.popup = popup;
        this.popup.events.register('mousedown', this, this.mouseDown);
        this.popup.events.register('mouseup', this, this.mouseUp);
        this.popup.events.register('mousemove', this, this.mouseMove);
        // Define a function bound to this used to listen for
        // document mouseout events
        this.docMouseUpProxy = OpenLayers.Function.bind(this.mouseUp, this);
    },
    /**
     * Method: setMap
     * Set the map property for the control.
     *
     * Parameters:
     * map - {<openlayers.map>} The controls map.
     */
    setMap: function(map) {
        OpenLayers.Control.prototype.setMap.apply(this, [map]);
        this.map.events.register('mousemove', this, this.mouseMove);
    },
    /**
     * Method: setMoveSelector
     * Set's the move selector, on which selector we move the the popup
     * 
     * Parameters:
     * @param {String} selector the full CSS selector
     */
    setMoveSelector: function(selector) {
        this.moveOnSelector = selector;
        this.validMoveSelector = !_.isEmpty(this.moveOnSelector);
    },
    /**
     * Method: setIgnoreSelectors
     * Set's the move selector, on which selector we move the the popup
     *
     * Parameters:
     * @param {Array} selectors the full CSS selectors we ignore
     */
    setIgnoreSelectors: function(selectors) {
        this.selectorsIgnore = _.isArray(selectors) ? selectors : [selectors];
    },
    /**
     * Method: __ignoreElement
     * Is the element ignored?
     *
     * Parameters:
     * @param {Object} target Element
     */
    __ignoreElement: function(target) {
        return _.some(this.elementsIgnore, function(element) {
            return $(target).is(':' + element);
        });
    },
    /**
     * Method: __validSelector
     * Is the element a valid selector, do we move on this element?
     *
     * Parameters:
     * @param {Object} target Element
     */
    __validSelector: function(target) {
        var selectors = ["#" + $(target).prop('id'), "." + $(target).prop('class')];
        if (this.validMoveSelector) {
            return _.contains(selectors, this.moveOnSelector) && !_.some(this.selectorsIgnore, function(selector) {
                return _.contains(selectors, selector);
            });
        }
        return true;
    },
    /**
     * Method: mouseDown
     * mousedown event
     * 
     * Parameters:
     * @param {Event} evt
     */
    mouseDown: function(evt) {
        if (this.__ignoreElement(evt.target)) {
            return;
        }
        if (!this.__validSelector(evt.target)) {
            return;
        }
        this.down = true;
        this.popPnt = this.popup.events.getMousePosition(evt);
        OpenLayers.Event.observe(document, 'mouseup', this.docMouseUpProxy);
        OpenLayers.Event.stop(evt);
 
    },
    /**
     * Method: mouseUp
     * mouseup event
     *
     * Parameters:
     * @param {Event} evt
     */
    mouseUp: function(evt) {
        if (this.__ignoreElement(evt.target)) {
            return;
        }
        if (!this.__validSelector(evt.target)) {
            return;
        }
        this.down = false;
        OpenLayers.Event.stopObserving(document, 'mouseup', this.docMouseUpProxy);
        OpenLayers.Event.stop(evt);
    },
    /**
     * Method: mouseOut
     * mouseout event
     *
     * Parameters:
     * @param {Event} evt
     */
    mouseOut: function(evt) {
        this.down = false;
        OpenLayers.Event.stop(evt);
    },
    /**
     * Method: mouseMove
     * mousemove event
     *
     * Parameters:
     * @param {Event} evt
     */
    mouseMove: function(evt) {
        if (this.down) {
            var mapPntPx = this.map.events.getMousePosition(evt);
            mapPntPx = mapPntPx.add((this.popPnt.x * -1), (this.popPnt.y * -1));
            this.popup.lonlat = this.map.getLonLatFromViewPortPx(mapPntPx);
            this.popup.updatePosition();
        }
        OpenLayers.Event.stop(evt);
    },
    /**
     * Method: destroy
     * nullify references to prevent circular references and memory leaks
     */
    destroy: function() {
        this.popup.events.unregister('mousedown', this, this.mouseDown);
        this.popup.events.unregister('mouseup', this, this.mouseUp);
        this.popup.events.unregister('mousemove', this, this.mouseMove);
        this.map.events.unregister('mousemove', this, this.mouseMove);
        // Clear object references
        this.popup = null;
        this.popPnt = null;
        // allow our superclass to tidy up
        OpenLayers.Control.prototype.destroy.apply(this, []);
    },
    /** @final @type String */
    CLASS_NAME: "OpenLayers.Control.DragPopup"
});