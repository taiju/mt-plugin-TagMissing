# TagMissing plugin

TagMissing plugin add a callback `tag_missing`.

The `tag_missing` callback is like Ruby's method\_missing.

When the MT can't find the tag, `tag_missing` callback is called.

## Callback Interface

```yaml```
id: idontknowthistag
key: idontknowthistag
name: IDontKnowThisTag
description: I don't know this tag.
callbacks:
  tag_missing: |
    sub {
      my ( $cb, $ctx, $tag ) = @_;
      # Arguments:
      #   $cb  -> MT::Callback object
      #   $ctx -> MT::Template::Context object
      #   $tag -> A missing tag name
      MT->log("I don't know $tag tag!!");
    }
```

See also [AutoUnless](https://github.com/taiju/mt-plugin-autounless) plugin. It is reference implementation.
