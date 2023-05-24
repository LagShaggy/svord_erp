import preprocess from 'svelte-preprocess'
import adapter from '@sveltejs/adapter-static'

/** @type {import('@sveltejs/kit').Config} */
const config = {
	kit: {
		adapter: adapter({
			fallback: '200.html'
		}),
		alias: {
			$src: 'src/',
			$icons: 'src/lib/icons/'
		}
	},

	preprocess: [
		preprocess({
			postcss: true
		})
	]
}

export default config
