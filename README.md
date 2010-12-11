sunspot-sequel
==============

This gem is a Sunspot adapter for Sequel.  It provides the `.load`,
`.load_all`, and `#id` methods required by Sunspot.  It also adds class-level
methods to Sequel models that behave similarly to the ActiveRecord extensions
provided by sunspot_rails.

Usage
=====

First, configure Sunspot in the usual way. (See
<https://github.com/outoftime/sunspot/wiki/Installation-and-configuration>.)
Then, in the models you want to use with Sunspot:

    class Widget < Sequel::Model
      plugin :sunspot

      searchable do
        text :name
        ...
      end
    end

To search for objects of a certain type:

    Widget.search do
      with :name, name
      ...
    end

Limitations
===========

This plugin has some limitations that you should know about before deciding if
it's a good fit for your application.

Thread safety (or lack thereof)
-------------------------------

This plugin isn't thread-safe.

To elaborate: This plugin delegates index and search calls to what Sunspot calls
its singleton session, which is marked as thread-unsafe.

Thread safety is desirable, but achieving that will require changes to Sunspot.
(It's probably possible to use Sunspot in a thread-safe manner via manual management of
sessions, but issues like this are something that are better handled outside of
an adapter.)

Copyright
=========

Copyright (c) 2010 David Yip.  Licensed under the MIT license; see the LICENSE
file for more information.
