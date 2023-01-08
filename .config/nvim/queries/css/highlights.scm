[
 "@media"
 "@charset"
 "@namespace"
 "@supports"
 "@keyframes"
 (at_keyword)
 (to)
 (from)
 ] @keyword

"@import" @include

(comment) @comment @spell

(function_name) @function

[
 ">"
 "+"
 "-"
 "*"
 "="
 "^="
 "|="
 "~="
 "$="
 "*="
 "and"
 "or"
 "not"
 "only"
 ] @operator

[
 (tag_name)
 (nesting_selector)
 (universal_selector)
 ] @tag

(important) @type.qualifier

(plain_value) @attribute
(attribute_selector (plain_value) @attribute)
(pseudo_element_selector) @pseudo
(pseudo_class_selector) @pseudo

[
 ; (property_name)
 (feature_name)
 ; (attribute_name)
 ] @property

(namespace_name) @namespace

((property_name) @pseudo
                 (#match? @pseudo "^--"))
((plain_value) @pseudo
               (#match? @pseudo "^--"))

[
 (string_value)
 (color_value)
 ] @string

(unit) @unit

[
 (integer_value)
 (float_value)
 ] @number


(id_selector) @identifier.id
(class_selector) @identifier.class

