const config = {
	content: [
		'./src/**/*.{html,js,svelte,ts}',
		'./node_modules/flowbite-svelte/**/*.{html,js,svelte,ts}'
	],

	theme: {
		extend: {
			fontFamily: {
				popp: ['Poppins'],
				oswald: ['Oswald']
			},
			colors: {
				'base-colour': '#4338ca',
				'comp-colour': '#eab308'
				//'comp-colour': '#4338ca'
			}
		}
	},
	darkMode: 'class'
}

module.exports = config
