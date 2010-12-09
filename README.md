sunspot-sequel
==============

This gem is a Sunspot adapter for Sequel.  It provides the `.load`,
`.load_all`, and `#id` methods required by Sunspot.  It also adds class-level
methods to Sequel models that behave similarly to the ActiveRecord extensions
provided by sunspot_rails.

Usage
-----

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

License
-------

See the LICENSE file.
