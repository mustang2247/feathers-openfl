/*
Feathers
Copyright 2012-2014 Joshua Tynjala. All Rights Reserved.

This program is free software. You can redistribute and/or modify it in
accordance with the terms of the accompanying license agreement.
*/
package feathers.core;
import feathers.skins.IStyleProvider;

import flash.geom.Rectangle;

/**
 * Dispatched after the control has been initialized, but before it has
 * drawn for the first time. Typically, the component's children will have
 * been created by this point.
 *
 * <p>The properties of the event object have the following values:</p>
 * <table class="innertable">
 * <tr><th>Property</th><th>Value</th></tr>
 * <tr><td><code>bubbles</code></td><td>false</td></tr>
 * <tr><td><code>currentTarget</code></td><td>The Object that defines the
 *   event listener that handles the event. For example, if you use
 *   <code>myButton.addEventListener()</code> to register an event listener,
 *   myButton is the value of the <code>currentTarget</code>.</td></tr>
 * <tr><td><code>data</code></td><td>null</td></tr>
 * <tr><td><code>target</code></td><td>The Object that dispatched the event;
 *   it is not always the Object listening for the event. Use the
 *   <code>currentTarget</code> property to always access the Object
 *   listening for the event.</td></tr>
 * </table>
 *
 * @eventType feathers.events.FeathersEventType.INITIALIZE
 */
[Event(name="initialize",type="starling.events.Event")]

/**
 * Dispatched after the component has validated for the first time. Both
 * <code>initialize()</code> and <code>draw()</code> will have been called,
 * and all children will have been created.
 *
 * <p>The properties of the event object have the following values:</p>
 * <table class="innertable">
 * <tr><th>Property</th><th>Value</th></tr>
 * <tr><td><code>bubbles</code></td><td>false</td></tr>
 * <tr><td><code>currentTarget</code></td><td>The Object that defines the
 *   event listener that handles the event. For example, if you use
 *   <code>myButton.addEventListener()</code> to register an event listener,
 *   myButton is the value of the <code>currentTarget</code>.</td></tr>
 * <tr><td><code>data</code></td><td>null</td></tr>
 * <tr><td><code>target</code></td><td>The Object that dispatched the event;
 *   it is not always the Object listening for the event. Use the
 *   <code>currentTarget</code> property to always access the Object
 *   listening for the event.</td></tr>
 * </table>
 *
 * @eventType feathers.events.FeathersEventType.CREATION_COMPLETE
 */
[Event(name="creationComplete",type="starling.events.Event")]

/**
 * Dispatched when the width or height of the control changes.
 *
 * <p>The properties of the event object have the following values:</p>
 * <table class="innertable">
 * <tr><th>Property</th><th>Value</th></tr>
 * <tr><td><code>bubbles</code></td><td>false</td></tr>
 * <tr><td><code>currentTarget</code></td><td>The Object that defines the
 *   event listener that handles the event. For example, if you use
 *   <code>myButton.addEventListener()</code> to register an event listener,
 *   myButton is the value of the <code>currentTarget</code>.</td></tr>
 * <tr><td><code>data</code></td><td>null</td></tr>
 * <tr><td><code>target</code></td><td>The Object that dispatched the event;
 *   it is not always the Object listening for the event. Use the
 *   <code>currentTarget</code> property to always access the Object
 *   listening for the event.</td></tr>
 * </table>
 *
 * @eventType feathers.events.FeathersEventType.RESIZE
 */
[Event(name="resize",type="starling.events.Event")]

/**
 * Basic interface for Feathers UI controls. A Feathers control must also
 * be a Starling display object.
 */
interface IFeathersControl extends IValidating
{
	/**
	 * @copy feathers.core.FeathersControl#minWidth
	 */
	function get_minWidth():Float;

	/**
	 * @private
	 */
	function set_minWidth(value:Float):Void;

	/**
	 * @copy feathers.core.FeathersControl#minHeight
	 */
	function get_minHeight():Float;

	/**
	 * @private
	 */
	function set_minHeight(value:Float):Void;

	/**
	 * @copy feathers.core.FeathersControl#maxWidth
	 */
	function get_maxWidth():Float;

	/**
	 * @private
	 */
	function set_maxWidth(value:Float):Void;

	/**
	 * @copy feathers.core.FeathersControl#maxHeight
	 */
	function get_maxHeight():Float;

	/**
	 * @private
	 */
	function set_maxHeight(value:Float):Void;

	/**
	 * @private
	 */
	function get_clipRect():Rectangle;

	/**
	 * @private
	 */
	function set_clipRect(value:Rectangle):Void;

	/**
	 * @copy feathers.core.FeathersControl#isEnabled
	 */
	function get_isEnabled():Bool;

	/**
	 * @private
	 */
	function set_isEnabled(value:Bool):Void;

	/**
	 * @copy feathers.core.FeathersControl#isInitialized
	 */
	function get_isInitialized():Bool;

	/**
	 * @copy feathers.core.FeathersControl#isCreated
	 */
	function get_isCreated():Bool;

	/**
	 * @copy feathers.core.FeathersControl#nameList
	 */
	function get_nameList():TokenList;

	/**
	 * @copy feathers.core.FeathersControl#styleNameList
	 */
	function get_styleNameList():TokenList;

	/**
	 * @copy feathers.core.FeathersControl#styleName
	 */
	function get_styleName():String;

	/**
	 * @private
	 */
	function set_styleName(value:String):Void

	/**
	 * @copy feathers.core.FeathersControl#styleProvider
	 */
	function get_styleProvider():IStyleProvider;

	/**
	 * @private
	 */
	function set_styleProvider(value:IStyleProvider):Void

	/**
	 * @copy feathers.core.FeathersControl#setSize()
	 */
	function setSize(width:Float, height:Float):Void;
}
