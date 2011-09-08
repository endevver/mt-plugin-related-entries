# About Related Entries

This plugin will automatically publish any entries that share a tag with the entry being saved/published. This allows entries that utilize any kind of "related entry" feature to remain up to date. 

## Related Entries Template Tag Code

This following template code will publish a list of entries related to the current entry:

    <mt:entryiftagged>
    <mt:setvarblock name="curentry"><mt:entryid /></mt:setvarblock>
    <mt:setvarblock name="sgtags"><mt:entrytags glue=" OR "><mt:tagname></mt:entrytags></mt:setvarblock>
    <mt:setvarblock name="listitems"><mt:entries tags="$sgtags"><mt:setvarblock name="listentry"><mt:entryid /></mt:setvarblock><mt:unless name="listentry" eq="$curentry"><li><a href="<mt:entrypermalink />"><mt:entrytitle /></a></li></mt:unless></mt:entries></mt:setvarblock>
    <mt:if name="listitems">
    <h3>Related Entries</h3>
    <ul>
    <mt:var name="listitems">
    </ul>
    </mt:if>
    </mt:entryiftagged>

## Installation ##

To install this plugin follow the instructions found here:

http://tinyurl.com/easy-plugin-install

## Usage ##

There is nothing special you need to do to use this plugin. As soon as it is installed, it will automatically republish any entries that share a tag with the entry being saved. It will only republish entries in the same blog as the entry being published.

## Help, Bugs and Feature Requests ##

If you are having problems installing or using the plugin, please check out our general knowledge base and help ticket system at [help.endevver.com](http://help.endevver.com).

## Copyright ##

Copyright 2011, Endevver, LLC. All rights reserved.

## License ##

This plugin is licensed under the same terms as Perl itself.

# About Endevver #

We design and develop web sites, products and services with a focus on 
simplicity, sound design, ease of use and community. We specialize in 
Movable Type and offer numerous services and packages to help customers 
make the most of this powerful publishing platform.

http://www.endevver.com/
