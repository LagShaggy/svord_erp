## Developing

`pnpm` is used for this project, `npm` also works. Run `pnpm install`.

get `supabase` client either from your prefered packet manager, or through `npx supabase` to setup the local development environment run

```bash
supabase init
supabase start
supabase status
```

Docker needs to be installed locally. Then add the required environment variables to the .env file. Namely `PUBLIC_SUPABASE_URL`and `PUBLIC_SUPABASE_ANON_KEY`.

You should be ready to go.

## Development Philosophy

We are trying to follow the [Atomic Design](https://bradfrost.com/blog/post/atomic-web-design/) Principles by Brad Frost.
