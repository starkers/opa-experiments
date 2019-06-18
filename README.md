

NO good notes yet..

# but

`docker-compose up` and you'll see OPA pulling from a JWT secured Caddy image

It will sucessfully just HEAD the Etag afterwards.

If you update the `bundle.tar.gz` however it will re-pull!



# update the sample bundle
I need to read more of https://www.openpolicyagent.org/docs/latest/bundles/#bundle-file-format


```
tar zcvf bundles/service/v1/somedir/authz/bundle.tar.gz data
data/
data/rules.rego
data/data.json
```
