import preprocess from 'svelte-preprocess'
import adapter from '@sveltejs/adapter-static'

/** @type {import('@sveltejs/kit').Config} */
const config = {
	kit: {
		adapter: adapter({
			fallback: '200.html'
		}),
		alias: {
			// these are the aliases and paths to them
			$src: './src',
			$util: './src/lib/util',
			$hooks: './src/hooks'
		}
	},

	preprocess: [
		preprocess({
			postcss: true
		})
	]
}

export default config
