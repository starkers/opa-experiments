

This Caddy image is setup to:
- serve static assets from `/app` as its docroot (empty currently)
- only allow traffic (lets pretend to be OPA agents) with JWT's


The caddy image required the env var `$JWT_SECRET` to be set (HMAC)

See: https://github.com/BTBurke/caddy-jwt

In this case I've hard-coded it into the `Dockerfile`

For creating your own see: http://jwtbuilder.jamiekurtz.com/


# testing
Test it works with curl (EG)

(the generated "claim set" for the example below is)
```
{
    "iss": "Online JWT Builder",
    "iat": 1560898546,
    "exp": 1907967290,
    "aud": "caddy",
    "sub": "opa@example.com",
    "Role": "agent"
}
```


You should now be able to curl it..
```
export TOKEN=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJPbmxpbmUgSldUIEJ1aWxkZXIiLCJpYXQiOjE1NjA4OTg1NDYsImV4cCI6MTkwNzk2NzI5MCwiYXVkIjoiY2FkZHkiLCJzdWIiOiJvcGFAZXhhbXBsZS5jb20iLCJSb2xlIjoiYWdlbnQifQ.3zs5BLwLPZO83bru8LGze-ZijHLRkfwm0v3ERHa6vdg
curl localhost:8080 -v -H "Authorization: Bearer ${TOKEN}"
```
