
package spark.skins.mobile
{
import mx.core.mx_internal;

use namespace mx_internal;

/**
 *  Emphasized button uses accentColor instead of chromeColor. 
 * 
 *  @langversion 3.0
 *  @playerversion Flash 10
 *  @playerversion AIR 2.5 
 *  @productversion Flex 4.5
 */
public class DefaultButtonSkin extends ButtonSkin
{
    /**
     *  Constructor. 
     * 
     *  @langversion 3.0
     *  @playerversion Flash 10
     *  @playerversion AIR 2.5 
     *  @productversion Flex 4.5
     */
    public function DefaultButtonSkin()
    {
        super();
        
        fillColorStyleName = "accentColor";
    }
}
}