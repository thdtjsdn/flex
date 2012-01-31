////////////////////////////////////////////////////////////////////////////////
//
//  ADOBE SYSTEMS INCORPORATED
//  Copyright 2008 Adobe Systems Incorporated
//  All Rights Reserved.
//
//  NOTICE: Adobe permits you to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//
////////////////////////////////////////////////////////////////////////////////

package mx.components
{
import flash.ui.Keyboard;
import mx.components.baseClasses.FxTextBase;
import mx.components.baseClasses.FxScrollBar;
import mx.layout.ILayoutItem;
import mx.layout.LayoutItemFactory;
/**
 *  The FxHScrollBar (horizontal ScrollBar) control lets you control
 *  the portion of data that is displayed when there is too much data
 *  to fit horizontally in a display area.
 * 
 *  <p>Although you can use the FxHScrollBar control as a stand-alone control,
 *  you usually combine it as part of another group of components to
 *  provide scrolling functionality.</p>
 */
public class FxHScrollBar extends FxScrollBar
{
    include "../core/Version.as";

    //--------------------------------------------------------------------------
    //
    //  Constructor
    //
    //--------------------------------------------------------------------------

    /**
     *  Constructor. 
     */
    public function FxHScrollBar()
    {
        super();
    }
    
    //--------------------------------------------------------------------------
    //
    //  Overridden properties
    //
    //--------------------------------------------------------------------------

    /**
     *  The size of the track, which equals the width of the track.
     */
    override protected function get trackSize():Number
    {
        if (track)
            return track.width;
        else
           return 0;
    }
    
    //--------------------------------------------------------------------------
    //
    // Methods
    //
    //--------------------------------------------------------------------------

    /**
     *  Position the thumb button based on the specified thumb position,
     *  relative to the current X location of the track in the control.
     * 
     *  @param thumbPos A number representing the new position of the thumb
     *  button in the control.
     */
    override protected function positionThumb(thumbPos:Number):void
    {
        if (thumb)
        {
            var trackPos:Number = track ? track.x : 0;   
            var layoutItem:ILayoutItem = LayoutItemFactory.getLayoutItemFor(thumb);
            layoutItem.setActualPosition(Math.round(trackPos + thumbPos),
                                         layoutItem.actualPosition.y);
        }
    }
    
    /**
     *  @private
     */
    override protected function calculateThumbSize():Number
    {
        return Math.max(thumb.minWidth, super.calculateThumbSize());
    }

    /**
     *  @private
     */
    override protected function sizeThumb(thumbSize:Number):void
    {
        thumb.width = thumbSize;
    }
    
    /**
     *  Returns the position of the thumb button on an FxHScrollBar control, 
     *  which is equal to the <code>localX</code> parameter.
     * 
     *  @param localX The X position relative to the scrollbar control.
     *
     *  @param localY The Y position relative to the scrollbar control.
     *
     *  @return The position of the thumb button.
     */
    override protected function pointToPosition(localX:Number, 
                                                localY:Number):Number
    {
        return localX;
    }
    
    /**
     *  Implicitly update the viewport's verticalScrollPosition per the
     *  specified scrolling unit, by setting the scrollbar's value.
     *
     *  @private
     */
    private function updateViewportHSP(unit:uint):void
    {
        var delta:Number = viewport.horizontalScrollPositionDelta(unit);
        setValue(viewport.horizontalScrollPosition + delta);
    }
    
    /**
     *  If <code>viewport</code> is not null, 
     *  change the horizontal scroll position for page up or page down by 
     *  scrolling the viewport.
     *  This method calculates the amount to scroll by calling the 
     *  <code>IViewport.horizontalScrollPositionDelta()</code> method 
     *  with either <code>flash.ui.Keyboard.PAGE_UP</code> 
     *  or <code>flash.ui.Keyboard.PAGE_DOWN</code>.
     *  It then calls the <code>setValue()</code> method to 
     *  set the <code>IViewport.horizontalScrollPosition</code> property 
     *  to the appropriate value.
     *
     *  <p>If <code>viewport</code> is null, 
     *  change the scroll position for page up or page down by calling 
     *  the <code>page()</code> method.</p>
     *
     *  @param increase Whether the page scroll is up (<code>true</code>) or
     *  down (<code>false</code>). 
     * 
     *  @see mx.components.baseClasses.FxTrackBase#page()
     *  @see mx.components.baseClasses.FxTrackBase#setValue()
     *  @see mx.core.IViewport
     *  @see mx.core.IViewport#horizontalScrollPosition
     *  @see mx.core.IViewport#horizontalScrollPositionDelta()
     */
    override public function page(increase:Boolean = true):void
    {
        if (!viewport)
            super.page(increase);
        else
            updateViewportHSP((increase) ? Keyboard.PAGE_DOWN : Keyboard.PAGE_UP);
    }
    
    /**
     *  If <code>viewport</code> is not null, 
     *  change the horizontal scroll position for line up or line down by 
     *  scrolling the viewport.
     *  This method calculates the amount to scroll by calling the 
     *  <code>IViewport.horizontalScrollPositionDelta()</code> method 
     *  with either <code>flash.ui.Keyboard.RIGHT</code> 
     *  or <code>flash.ui.Keyboard.LEFT</code>.
     *  It then calls the <code>setValue()</code> method to 
     *  set the <code>IViewport.horizontalScrollPosition</code> property 
     *  to the appropriate value.
     *
     *  <p>If <code>viewport</code> is null, 
     *  change the scroll position for line up or line down by calling 
     *  the <code>step()</code> method.</p>
     *
     *  @param increase Whether the line scoll is up (<code>true</code>) or
     *  down (<code>false</code>). 
     * 
     *  @see mx.components.baseClasses.FxTrackBase#step()
     *  @see mx.components.baseClasses.FxTrackBase#setValue()
     *  @see mx.core.IViewport
     *  @see mx.core.IViewport#horizontalScrollPosition
     *  @see mx.core.IViewport#horizontalScrollPositionDelta()
     */
    override public function step(increase:Boolean = true):void
    {
        if (!viewport)
            super.step(increase);
        else
            updateViewportHSP((increase) ? Keyboard.RIGHT : Keyboard.LEFT);
    }   
    
    /**
     *  @private
     */    
    override protected function partAdded(partName:String, instance:Object):void
    {
        if (instance == thumb)
        {
            thumb.setConstraintValue("left", undefined);
            thumb.setConstraintValue("right", undefined);
            thumb.setConstraintValue("horizontalCenter", undefined);
        }      
        
        super.partAdded(partName, instance);
    }     
        
}

}