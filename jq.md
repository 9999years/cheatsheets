# jq

Upstream documentation: <https://stedolan.github.io/jq/manual/>

Indexing:

- Attributes: `.foo`, `.foo.bar`, `.foo?` (no errors)
- Attribute (string name): `.["foo"]`
- Array: `.[2]`
- Slice: `.[10:15]`
- Iterator: `.[]` (optional: `.[]?`)

Filtering/mapping:
- `select(. >= 2)`
- `keys`
- `has("key")`
- `map(.+1)`
